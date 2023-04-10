Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5FF6DC929
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Apr 2023 18:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjDJQSO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 12:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjDJQSL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 12:18:11 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FEA1725
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 09:17:45 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id lz6so3667573qvb.6
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681143463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYoNI/GBnV/XFf9cldcCfKoCMP9onvoHik7LIhPrsRg=;
        b=Un/CIKLUsHod8NZC3q1oBYRRT1tcolo3z+esv0yEylxdbqYWgU14GIHALm5q20kE68
         njxx99gSV2I4M7alAyutYPd7r5dSFa4sKQJu/6PU/5gWpqj7PJa8Sgd9dxI3BIQrw4Wa
         cCr3KCflB+L3OQcCamcqC2heJxQn16w3l4/Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681143463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYoNI/GBnV/XFf9cldcCfKoCMP9onvoHik7LIhPrsRg=;
        b=8DI3sC8uJfKyU9P8hmTcgvhIf05Qme5bv2PSN+Q345ynC032m458UHgmyKSki9qHY0
         tAMOokbYXU8MHPqomNzfEBIqjqQF2MiMyNHXnXEMdErkeD71l0Y3SdRX7z8TZYFs9TzL
         a/qnyzr6E43oGdDkbHj2CyKz4REvtGwv9fVa7oDAynHc5O991bSZeJshQKwYa1RR+H82
         WHeiF/dQGnuLxYUpdGCOt8Iimr36FppqV0MUDzlpoqYJ6KsC38A6XSVNpsy92wxbPjDt
         E4yS6VLSNVbxIy/yUz0OhEZ0jfv+jy+Sn/46y6ewDmUjAaF9URzFQOrLvE4cYFBrDPSF
         YmGA==
X-Gm-Message-State: AAQBX9f2mwR/Hl1t6evJjg2XGIEke/TyHLNaqRLh1Ln/+owacrVy9viL
        2X8Mz2vwea8jp2RYFG+R9aXAxmn6eZNvB462cuH8ig==
X-Google-Smtp-Source: AKy350Z5GL/btiKmt5L8DyVOk+tCBRyAfZBO+ALeHIia9N+doKnoeUtifo6ZagFIU6Q+TGQa9xg+G2Sx+2VQY6ILb4Y=
X-Received: by 2002:a05:6214:bd2:b0:56e:9f09:ee58 with SMTP id
 ff18-20020a0562140bd200b0056e9f09ee58mr2486153qvb.8.1681143463551; Mon, 10
 Apr 2023 09:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093259.845178-1-korneld@chromium.org> <d1d39179-33a0-d35b-7593-e0a02aa3b10a@amd.com>
 <ed840be8-b27b-191e-4122-72f62d8f1b7b@amd.com>
In-Reply-To: <ed840be8-b27b-191e-4122-72f62d8f1b7b@amd.com>
From:   =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>
Date:   Mon, 10 Apr 2023 18:17:32 +0200
Message-ID: <CAD=NsqxSDUu3wpfhUCDJgP2TaKb7dudB90snROQpPJPj3fdFgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Disable and mask interrupts on resume
To:     "Gong, Richard" <richard.gong@amd.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@leemhuis.info,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com,
        gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 10, 2023 at 5:29=E2=80=AFPM Gong, Richard <richard.gong@amd.com=
> wrote:
>
> On 4/10/2023 12:03 AM, Mario Limonciello wrote:
> > On 3/20/23 04:32, Kornel Dul=C4=99ba wrote:
> >
> >> This fixes a similar problem to the one observed in:
> >> commit 4e5a04be88fe ("pinctrl: amd: disable and mask interrupts on
> >> probe").
> >>
> >> On some systems, during suspend/resume cycle firmware leaves
> >> an interrupt enabled on a pin that is not used by the kernel.
> >> This confuses the AMD pinctrl driver and causes spurious interrupts.
> >>
> >> The driver already has logic to detect if a pin is used by the kernel.
> >> Leverage it to re-initialize interrupt fields of a pin only if it's no=
t
> >> used by us.
> >>
> >> Signed-off-by: Kornel Dul=C4=99ba <korneld@chromium.org>
> >> ---
> >>   drivers/pinctrl/pinctrl-amd.c | 36 +++++++++++++++++++--------------=
--
> >>   1 file changed, 20 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-amd.c
> >> b/drivers/pinctrl/pinctrl-amd.c
> >> index 9236a132c7ba..609821b756c2 100644
> >> --- a/drivers/pinctrl/pinctrl-amd.c
> >> +++ b/drivers/pinctrl/pinctrl-amd.c
> >> @@ -872,32 +872,34 @@ static const struct pinconf_ops amd_pinconf_ops
> >> =3D {
> >>       .pin_config_group_set =3D amd_pinconf_group_set,
> >>   };
> >>   -static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
> >> +static void amd_gpio_irq_init_pin(struct amd_gpio *gpio_dev, int pin)
> >>   {
> >> -    struct pinctrl_desc *desc =3D gpio_dev->pctrl->desc;
> >> +    const struct pin_desc *pd;
> >>       unsigned long flags;
> >>       u32 pin_reg, mask;
> >> -    int i;
> >>         mask =3D BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
> >>           BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF) |
> >>           BIT(WAKE_CNTRL_OFF_S4);
> >>   -    for (i =3D 0; i < desc->npins; i++) {
> >> -        int pin =3D desc->pins[i].number;
> >> -        const struct pin_desc *pd =3D pin_desc_get(gpio_dev->pctrl, p=
in);
> >> -
> >> -        if (!pd)
> >> -            continue;
> >> +    pd =3D pin_desc_get(gpio_dev->pctrl, pin);
> >> +    if (!pd)
> >> +        return;
> >>   -        raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >> +    raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >> +    pin_reg =3D readl(gpio_dev->base + pin * 4);
> >> +    pin_reg &=3D ~mask;
> >> +    writel(pin_reg, gpio_dev->base + pin * 4);
> >> +    raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> >> +}
> >>   -        pin_reg =3D readl(gpio_dev->base + i * 4);
> >> -        pin_reg &=3D ~mask;
> >> -        writel(pin_reg, gpio_dev->base + i * 4);
> >> +static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
> >> +{
> >> +    struct pinctrl_desc *desc =3D gpio_dev->pctrl->desc;
> >> +    int i;
> >>   -        raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> >> -    }
> >> +    for (i =3D 0; i < desc->npins; i++)
> >> +        amd_gpio_irq_init_pin(gpio_dev, i);
> >>   }
> >>     #ifdef CONFIG_PM_SLEEP
> >> @@ -950,8 +952,10 @@ static int amd_gpio_resume(struct device *dev)
> >>       for (i =3D 0; i < desc->npins; i++) {
> >>           int pin =3D desc->pins[i].number;
> >>   -        if (!amd_gpio_should_save(gpio_dev, pin))
> >> +        if (!amd_gpio_should_save(gpio_dev, pin)) {
> >> +            amd_gpio_irq_init_pin(gpio_dev, pin);
> >>               continue;
> >> +        }
> >>             raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >>           gpio_dev->saved_regs[i] |=3D readl(gpio_dev->base + pin * 4)
> >> & PIN_IRQ_PENDING;
> >
> > Hello Kornel,
> >
> > I've found that this commit which was included in 6.3-rc5 is causing a
> > regression waking up from lid on a Lenovo Z13.
> observed "unable to wake from power button" on AMD based Dell platform.
> Reverting "pinctrl: amd: Disable and mask interrupts on resume" on the
> top of 6.3-rc6 does fix the issue.

Whoops, sorry for the breakage.
Could you please share the output of "/sys/kernel/debug/gpio" before
and after the first suspend/resume cycle.
I've looked at the patch again and found a rather silly mistake.
Please try the following.
Note that I don't have access to hardware with this controller at the
moment, so I've only compile tested it.

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 609821b756c2..7e7770152ca8 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -899,7 +899,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev=
)
        int i;

        for (i =3D 0; i < desc->npins; i++)
-               amd_gpio_irq_init_pin(gpio_dev, i);
+               amd_gpio_irq_init_pin(gpio_dev, desc->pins[i].number);
 }


> >
> > Reverting it on top of 6.3-rc6 resolves the problem.
> >
> > I've collected what I can into this bug report:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217315
> >
> > Linus Walleij,
> >
> > It looks like this was CC to stable.  If we can't get a quick solution
> > we might want to pull this from stable.
>
> this commit landed into 6.1.23 as well
>
>          d9c63daa576b2 pinctrl: amd: Disable and mask interrupts on resum=
e
>
> >
> > Thanks,
> >
> >
> Regards,
>
> Richard
>
