Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C2A708070
	for <lists+linux-gpio@lfdr.de>; Thu, 18 May 2023 13:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjERLwF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 18 May 2023 07:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjERLvn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 May 2023 07:51:43 -0400
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8007510E;
        Thu, 18 May 2023 04:51:10 -0700 (PDT)
X-QQ-mid: Yeas52t1684410588t624t28601
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.200.228.151])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 11089335518448478364
To:     "'Andrew Lunn'" <andrew@lunn.ch>,
        "'Andy Shevchenko'" <andy.shevchenko@gmail.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <hkallweit1@gmail.com>,
        <linux@armlinux.org.uk>, <linux-i2c@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <mengyuanlou@net-swift.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com> <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook> <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com> <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com> <016701d9886a$f9b415a0$ed1c40e0$@trustnetic.com> <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch>
In-Reply-To: <90ef7fb8-feac-4288-98e9-6e67cd38cdf1@lunn.ch>
Subject: RE: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Thu, 18 May 2023 19:49:47 +0800
Message-ID: <025b01d9897e$d8894660$899bd320$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQHvj8QD3pC+6Aq9H9h6P1+q5LrHRgMH5FTyAkITzAABJU2Y7wJ7xjhgAYjDQqsBr+FHUq7SqNXg
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wednesday, May 17, 2023 11:01 PM, Andrew Lunn wrote:
> On Wed, May 17, 2023 at 10:55:01AM +0800, Jiawen Wu wrote:
> > > > > > +   gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
> > > > > > +   if (!gc)
> > > > > > +           return -ENOMEM;
> > > > > > +
> > > > > > +   gc->label = devm_kasprintf(dev, GFP_KERNEL, "txgbe_gpio-%x",
> > > > > > +                              (wx->pdev->bus->number << 8) | wx->pdev->devfn);
> > > > > > +   gc->base = -1;
> > > > > > +   gc->ngpio = 6;
> > > > > > +   gc->owner = THIS_MODULE;
> > > > > > +   gc->parent = dev;
> > > > > > +   gc->fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_GPIO]);
> > > > >
> > > > > Looking at the I�C case, I'm wondering if gpio-regmap can be used for this piece.
> > > >
> > > > I can access this GPIO region directly, do I really need to use regmap?
> > >
> > > It's not a matter of access, it's a matter of using an existing
> > > wrapper that will give you already a lot of code done there, i.o.w.
> > > you don't need to reinvent a wheel.
> >
> > I took a look at the gpio-regmap code, when I call devm_gpio_regmap_register(),
> > I should provide gpio_regmap_config.irq_domain if I want to add the gpio_irq_chip.
> > But in this use, GPIO IRQs are requested by SFP driver. How can I get irq_domain
> > before SFP probe? And where do I add IRQ parent handler?
> 
> I _think_ you are mixing upstream IRQs and downstream IRQs.
> 
> Interrupts are arranged in trees. The CPU itself only has one or two
> interrupts. e.g. for ARM you have FIQ and IRQ. When the CPU gets an
> interrupt, you look in the interrupt controller to see what external
> or internal interrupt triggered the CPU interrupt. And that interrupt
> controller might indicate the interrupt came from another interrupt
> controller. Hence the tree structure. And each node in the tree is
> considered an interrupt domain.
> 
> A GPIO controller can also be an interrupt controller. It has an
> upstream interrupt, going to the controller above it. And it has
> downstream interrupts, the GPIO lines coming into it which can cause
> an interrupt. And the GPIO interrupt controller is a domain.
> 
> So what exactly does gpio_regmap_config.irq_domain mean? Is it the
> domain of the upstream interrupt controller? Is it an empty domain
> structure to be used by the GPIO interrupt controller? It is very
> unlikely to have anything to do with the SFP devices below it.

Sorry, since I don't know much about interrupt,  it is difficult to understand
regmap-irq in a short time. There are many questions about regmap-irq.

When I want to add an IRQ chip for regmap, for the further irq_domain,
I need to pass a parameter of IRQ, and this IRQ will be requested with handler:
regmap_irq_thread(). Which IRQ does it mean? In the previous code of using
devm_gpiochip_add_data(), I set the MSI-X interrupt as gpio-irq's parent, but
it was used to set chained handler only. Should the parent be this IRQ? I found
the error with irq_free_descs and irq_domain_remove when I remove txgbe.ko.

As you said, the interrupt of each tree node has its domain. Can I understand
that there are two layer in the interrupt tree for MSI-X and GPIOs, and requesting
them separately is not conflicting? Although I thought so, but after I implement
gpio-regmap, SFP driver even could not find gpio_desc. Maybe I missed something
on registering gpio-regmap...

Anyway it is a bit complicated, could I use this version of GPIO implementation if
it's really tough? Thanks.


