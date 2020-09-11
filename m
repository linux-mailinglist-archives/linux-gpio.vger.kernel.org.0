Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9DF265E73
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 13:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgIKLBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 07:01:51 -0400
Received: from gofer.mess.org ([88.97.38.141]:45861 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbgIKLBq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Sep 2020 07:01:46 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A4AC0C63D6; Fri, 11 Sep 2020 12:01:29 +0100 (BST)
Date:   Fri, 11 Sep 2020 12:01:29 +0100
From:   Sean Young <sean@mess.org>
To:     Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Andy Duan <fugang.duan@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: SONY IR issue
Message-ID: <20200911110129.GA6241@gofer.mess.org>
References: <DB8PR04MB679580C7C8E6888B56C8BDACE62C0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200903185513.GA31286@gofer.mess.org>
 <DB8PR04MB67950837E2355EA81FBAADD1E62D0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200904123050.GA11675@gofer.mess.org>
 <DB8PR04MB6795F1EA8A865A3CDCC79439E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200907084053.GA32304@gofer.mess.org>
 <DB8PR04MB679515C3490C5087B29A6DA8E6280@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <DB8PR04MB6795A60FBD4FBB3409C103E4E6290@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <DB8PR04MB67959176915216CD8B87C005E6270@DB8PR04MB6795.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB8PR04MB67959176915216CD8B87C005E6270@DB8PR04MB6795.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joakhim,


On Thu, Sep 10, 2020 at 11:52:18AM +0000, Joakim Zhang wrote:
> 
> Hi Sean,
> 
> We have already found the root cause, unbalanced interrupt response cause timing incorrect when cpuidle active. After disable cpuidle, GPIO IR works fine.
> However, that's a barbaric practice. It's impossible for us to disable cpuidle in a real system. 

Yes, that's a non-starter ofcourse.

> Now two issues in front of me:
> One is high cpu loading, after testing, GPIO IR can always decode, it seems not a severe problem. Another is cpuidle, it leads to a high probability of decoding failed.
> 
> I have a half-baked idea, can you help evaluate it? Is it possible to dynamically disable and enable cpuidle from gpio_ir_recv_irq? Or do this somewhere else in IR framework?
> 
> When first entering gpio_ir_recv_irq, invokes cpu_latency_qos_add_request to disable cpuidle, concurrently start a timer. Then entering gpio_ir_recv_irq again and again,
> check the timer. If timer value smaller than VALUE_TIMEOUT, just reset the timer. If timer value large than VALUE_TIMEOUT, means one loop finish, invokes 
> cpu_latency_qos_remove_request to enable the cpuidle. The VALUE_TIMEOUT is the gap between continuous signals. The difficult is how to tune VALUE_TIMEOUT to satisfy all IR protocols.

So my problem with this solution is that I get the impression that it papers
over cracks in another area. With cpuidle enabled, interrupts are delayed by
over by 500 microseconds, or half a millisecond. Those sorts of latencies
are not very good. 

For example in realtime, latencies should not exceed anything in the order
of 50 microseconds, a tenth of what you're seeing here. If it takes 
up to half a millisecond to service e.g. ssd or network interrupts, does
that not take a toll?

As for your implementation, the timeout could be based on the IR timeout
itself. When IR timeout occurs we are not expecting any more IR for the
current message, so this would be a perfect place to restore cpuidle. The
gpio-ir-recv driver could implement its own timeout, rather than using
rc-core for this. The driver used to do this, so it should be in git
history.

Thanks,

Sean

> 
> I wrote a draft, and it can work fine at my side:
> --- a/drivers/media/rc/gpio-ir-recv.c
> +++ b/drivers/media/rc/gpio-ir-recv.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_qos.h>
>  #include <linux/irq.h>
>  #include <media/rc-core.h>
> 
> @@ -20,13 +21,32 @@ struct gpio_rc_dev {
>         struct rc_dev *rcdev;
>         struct gpio_desc *gpiod;
>         int irq;
> +       struct timer_list cpuidle_change;
> +       bool cpuidle_active;
> +       struct pm_qos_request qos;
>  };
> 
> +static void gpio_ir_cpuidle_change(struct timer_list *t)
> +{
> +       struct gpio_rc_dev *gpio_dev = from_timer(gpio_dev, t, cpuidle_change);
> +
> +       if (!(gpio_dev->cpuidle_active)) {
> +               pm_qos_remove_request(&gpio_dev->qos);
> +               gpio_dev->cpuidle_active = true;
> +       }
> +}
> +
>  static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
>  {
>         int val;
>         struct gpio_rc_dev *gpio_dev = dev_id;
> 
> +       if (gpio_dev->cpuidle_active) {
> +               pm_qos_add_request(&gpio_dev->qos, 1, 0);
> +               gpio_dev->cpuidle_active = false;
> +       }
> +       mod_timer(&gpio_dev->cpuidle_change, jiffies + msecs_to_jiffies(125));
> +
>         val = gpiod_get_value(gpio_dev->gpiod);
>         if (val >= 0)
>                 ir_raw_event_store_edge(gpio_dev->rcdev, val == 1);
> @@ -61,6 +81,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
>         if (gpio_dev->irq < 0)
>                 return gpio_dev->irq;
> 
> +       gpio_dev->cpuidle_active = true;
> +       timer_setup(&gpio_dev->cpuidle_change, gpio_ir_cpuidle_change, 0);
> +
>         rcdev = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
>         if (!rcdev)
>                 return -ENOMEM;
> 
> Indeed, to a certain degree, it cannot ensure the first signal to be decoded, since at that point cpuidle is active, interrupt may be delayed, so the header may not satisfy the protocol.
> Actually, I have not meet such case under my test. Luckily, it would transmit multiple signals at once press.
> 
> Best Regards,
> Joakim Zhang
> 
> > -----Original Message-----
> > From: Joakim Zhang
> > Sent: 2020年9月8日 16:41
> > To: Sean Young <sean@mess.org>
> > Cc: linux-media@vger.kernel.org; Andy Duan <fugang.duan@nxp.com>;
> > linux-gpio@vger.kernel.org; Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Subject: RE: SONY IR issue
> > 
> > 
> > Hi Sean,
> > 
> > GPIO IR Recv extremely rely on the real-time performance of the interrupt
> > response, after turn off cpuidle, IR can work steadily now.
> > 
> > Much thanks for your kindly help. 😊
> > 
> > Best Regards,
> > Joakim Zhang
