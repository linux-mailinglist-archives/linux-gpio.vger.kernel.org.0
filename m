Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15D86DDBDD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 15:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjDKNQD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 09:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjDKNQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 09:16:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED37349D0;
        Tue, 11 Apr 2023 06:15:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82DE5624D3;
        Tue, 11 Apr 2023 13:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7042DC433D2;
        Tue, 11 Apr 2023 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681218958;
        bh=afNMh7BIYI3IqJ0FgsqnAcOdv02VFHBvISX2BAeYZB4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cr0HDXNRrWKf/TiDT2qYymJQHMdkLwMLU/JSGeoKPtBpR+Bqp9X2dXWzQmqzeaK1M
         IFORDp/C9CmVMnF6/i/VDWTw/NW3iCEZixlUcG12VENVjWAC4QTOYUTHPlHfVYqYSd
         X4FpPxyFIGSUeTd3FdAdN+fpt7wAQPeEna+jaets=
Date:   Tue, 11 Apr 2023 15:15:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        upstream@semihalf.com, rad@semihalf.com, mattedavis@google.com,
        stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        "Gong, Richard" <richard.gong@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@chromium.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: amd: Disable and mask interrupts on resume
Message-ID: <2023041152-desktop-breeze-0a89@gregkh>
References: <20230320093259.845178-1-korneld@chromium.org>
 <d1d39179-33a0-d35b-7593-e0a02aa3b10a@amd.com>
 <ed840be8-b27b-191e-4122-72f62d8f1b7b@amd.com>
 <37178398-497c-900b-361a-34b1b77517aa@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37178398-497c-900b-361a-34b1b77517aa@leemhuis.info>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 11, 2023 at 02:50:40PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> 
> On 10.04.23 17:29, Gong, Richard wrote:
> > On 4/10/2023 12:03 AM, Mario Limonciello wrote:
> >> On 3/20/23 04:32, Kornel Dulęba wrote:
> >>
> >>> This fixes a similar problem to the one observed in:
> >>> commit 4e5a04be88fe ("pinctrl: amd: disable and mask interrupts on
> >>> probe").
> >>>
> >>> On some systems, during suspend/resume cycle firmware leaves
> >>> an interrupt enabled on a pin that is not used by the kernel.
> >>> This confuses the AMD pinctrl driver and causes spurious interrupts.
> >>>
> >>> The driver already has logic to detect if a pin is used by the kernel.
> >>> Leverage it to re-initialize interrupt fields of a pin only if it's not
> >>> used by us.
> >>>
> >>> Signed-off-by: Kornel Dulęba <korneld@chromium.org>
> >>> ---
> >>>   drivers/pinctrl/pinctrl-amd.c | 36 +++++++++++++++++++----------------
> >>>   1 file changed, 20 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/pinctrl/pinctrl-amd.c
> >>> b/drivers/pinctrl/pinctrl-amd.c
> >>> index 9236a132c7ba..609821b756c2 100644
> >>> --- a/drivers/pinctrl/pinctrl-amd.c
> >>> +++ b/drivers/pinctrl/pinctrl-amd.c
> >>> @@ -872,32 +872,34 @@ static const struct pinconf_ops amd_pinconf_ops
> >>> = {
> >>>       .pin_config_group_set = amd_pinconf_group_set,
> >>>   };
> >>>   -static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
> >>> +static void amd_gpio_irq_init_pin(struct amd_gpio *gpio_dev, int pin)
> >>>   {
> >>> -    struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
> >>> +    const struct pin_desc *pd;
> >>>       unsigned long flags;
> >>>       u32 pin_reg, mask;
> >>> -    int i;
> >>>         mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
> >>>           BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF) |
> >>>           BIT(WAKE_CNTRL_OFF_S4);
> >>>   -    for (i = 0; i < desc->npins; i++) {
> >>> -        int pin = desc->pins[i].number;
> >>> -        const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
> >>> -
> >>> -        if (!pd)
> >>> -            continue;
> >>> +    pd = pin_desc_get(gpio_dev->pctrl, pin);
> >>> +    if (!pd)
> >>> +        return;
> >>>   -        raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >>> +    raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >>> +    pin_reg = readl(gpio_dev->base + pin * 4);
> >>> +    pin_reg &= ~mask;
> >>> +    writel(pin_reg, gpio_dev->base + pin * 4);
> >>> +    raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> >>> +}
> >>>   -        pin_reg = readl(gpio_dev->base + i * 4);
> >>> -        pin_reg &= ~mask;
> >>> -        writel(pin_reg, gpio_dev->base + i * 4);
> >>> +static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
> >>> +{
> >>> +    struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
> >>> +    int i;
> >>>   -        raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> >>> -    }
> >>> +    for (i = 0; i < desc->npins; i++)
> >>> +        amd_gpio_irq_init_pin(gpio_dev, i);
> >>>   }
> >>>     #ifdef CONFIG_PM_SLEEP
> >>> @@ -950,8 +952,10 @@ static int amd_gpio_resume(struct device *dev)
> >>>       for (i = 0; i < desc->npins; i++) {
> >>>           int pin = desc->pins[i].number;
> >>>   -        if (!amd_gpio_should_save(gpio_dev, pin))
> >>> +        if (!amd_gpio_should_save(gpio_dev, pin)) {
> >>> +            amd_gpio_irq_init_pin(gpio_dev, pin);
> >>>               continue;
> >>> +        }
> >>>             raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> >>>           gpio_dev->saved_regs[i] |= readl(gpio_dev->base + pin * 4)
> >>> & PIN_IRQ_PENDING;
> >>
> >> Hello Kornel,
> >>
> >> I've found that this commit which was included in 6.3-rc5 is causing a
> >> regression waking up from lid on a Lenovo Z13.
> > observed "unable to wake from power button" on AMD based Dell platform.
> 
> This sounds like something that we want to fix quickly.
> 
> > Reverting "pinctrl: amd: Disable and mask interrupts on resume" on the
> > top of 6.3-rc6 does fix the issue.
> >>
> >> Reverting it on top of 6.3-rc6 resolves the problem.
> >>
> >> I've collected what I can into this bug report:
> >>
> >> https://bugzilla.kernel.org/show_bug.cgi?id=217315
> >>
> >> Linus Walleij,
> >>
> >> It looks like this was CC to stable.  If we can't get a quick solution
> >> we might want to pull this from stable.
> > 
> > this commit landed into 6.1.23 as well
> > 
> >         d9c63daa576b2 pinctrl: amd: Disable and mask interrupts on resume
> 
> It made it back up to 5.10.y afaics.
> 
> The culprit has no fixes tag, which makes me wonder: should we quickly
> (e.g. today) revert this in mainline to get back to the previous state,
> so that Greg can pick up the revert for the next stable releases he
> apparently currently prepares?
> 
> Greg, is there another way to make you quickly fix this in the stable
> trees? One option obviously would be "revert this now in stable, reapply
> it later together with a fix ". But I'm under the impression that this
> is too much of a hassle and thus something you only do in dire situations?

I would like to see this reverted in Linus's tree first please.

thanks,

greg k-h
