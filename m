Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFDC708C7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 20:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbfGVSiq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 22 Jul 2019 14:38:46 -0400
Received: from foss.arm.com ([217.140.110.172]:43464 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728798AbfGVSiq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 14:38:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A810344;
        Mon, 22 Jul 2019 11:38:45 -0700 (PDT)
Received: from why (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F263F71A;
        Mon, 22 Jul 2019 11:38:41 -0700 (PDT)
Date:   Mon, 22 Jul 2019 19:38:38 +0100
From:   Marc Zyngier <marc.zyngier@arm.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>,
        <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
Message-ID: <20190722193838.0d7cd2ad@why>
In-Reply-To: <a2ecc3ad-b7e9-9398-d59b-c7d3fbbd10bb@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
        <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
        <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
        <20c1d733-60f5-6375-c03c-639de5e41739@arm.com>
        <0bee8775-756f-adad-4597-8cad53017718@gmail.com>
        <a2ecc3ad-b7e9-9398-d59b-c7d3fbbd10bb@nvidia.com>
Organization: ARM Ltd
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 22 Jul 2019 09:21:21 -0700
Sowjanya Komatineni <skomatineni@nvidia.com> wrote:

> On 7/22/19 3:57 AM, Dmitry Osipenko wrote:
> > 22.07.2019 13:13, Marc Zyngier пишет:  
> >> On 22/07/2019 10:54, Dmitry Osipenko wrote:  
> >>> 21.07.2019 22:40, Sowjanya Komatineni пишет:  
> >>>> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> >>>> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
> >>>>
> >>>> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> >>>> for Tegra210.
> >>>>
> >>>> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> >>>> interrupt controller suspend operation.
> >>>>
> >>>> Acked-by: Thierry Reding <treding@nvidia.com>
> >>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >>>> ---
> >>>>   drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
> >>>>   1 file changed, 18 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> >>>> index e1f771c72fc4..851f88cef508 100644
> >>>> --- a/drivers/irqchip/irq-tegra.c
> >>>> +++ b/drivers/irqchip/irq-tegra.c
> >>>> @@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
> >>>>   
> >>>>   struct tegra_ictlr_soc {
> >>>>   	unsigned int num_ictlrs;
> >>>> +	bool supports_sc7;
> >>>>   };
> >>>>   
> >>>>   static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
> >>>> @@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
> >>>>   
> >>>>   static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
> >>>>   	.num_ictlrs = 6,
> >>>> +	.supports_sc7 = true,
> >>>>   };
> >>>>   
> >>>>   static const struct of_device_id ictlr_matches[] = {
> >>>> @@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] = {
> >>>>   
> >>>>   struct tegra_ictlr_info {
> >>>>   	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
> >>>> +	const struct tegra_ictlr_soc *soc;
> >>>>   #ifdef CONFIG_PM_SLEEP
> >>>>   	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
> >>>>   	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
> >>>> @@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
> >>>>   		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
> >>>>   		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
> >>>>   
> >>>> -		/* Disable COP interrupts */
> >>>> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> >>>> +		/*
> >>>> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
> >>>> +		 *
> >>>> +		 * Tegra210 system suspend flow uses sc7entry firmware which
> >>>> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
> >>>> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
> >>>> +		 * system to go to SC7/LP0.
> >>>> +		 *
> >>>> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
> >>>> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.
> >>>> +		 */
> >>>> +		if (!lic->soc->supports_sc7)
> >>>> +			/* Disable COP interrupts if SC7 is not supported */  
> >>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
> >>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
> >>> better here.  
> >> If what you're saying is true, then the whole patch is wrong, and the
> >> SC7 property should come from DT.  
> > It should be safe to assume that all of existing Tegra210 devices use
> > the firmware for SC7, hence I wouldn't say that the patch is entirely
> > wrong. To me it's not entirely correct.  
> 
> Yes, all existing Tegra210 platforms uses sc7 entry firmware for SC7 and 
> AVP/COP IRQ need to be kept enabled as during suspend ATF triggers IRQ 
> to COP for SC7 entry fw execution.

That's not the question. Dmitry says that the SC7 support is not a
property of the SoC, but mostly a platform decision on whether the
firmware supports SC7 or not.

To me, that's a clear indication that this should not be hardcoded in
the driver, but instead obtained dynamically, via DT or otherwise.

> 
> 
> >>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);  
> >>> Secondly, I'm also not sure why COP interrupts need to be disabled for
> >>> pre-T210 at all, since COP is unused. This looks to me like it was
> >>> cut-n-pasted from downstream kernel without a good reason and could be
> >>> simply removed.  
> >> Please verify that this is actually the case. Tegra-2 definitely needed
> >> some level of poking, and I'm not keen on changing anything there until
> >> you (or someone else) has verified it on actual HW (see e307cc8941fc).  
> > Tested on Tegra20 and Tegra30, LP1 suspend-resume works perfectly fine
> > with all COP bits removed from the driver.
> >
> > AFAIK, the reason why downstream needed that disabling is that it uses
> > proprietary firmware which is running on the COP and that firmware is
> > usually a BLOB audio/video DEC-ENC driver which doesn't cleanup
> > interrupts after itself. That firmware is not applicable for the
> > upstream kernel, hence there is no need to care about it.
> >  
> >> Joseph, can you please shed some light here?  
> 
> SC7 entry flow uses 3rd party ATF (arm-trusted FW) blob which is the
> one that actually loads SC7 entry firmware and triggers IRQ to
> AVP/COP which causes COP to wakeup and run SC7 entry FW.
> 
> So when SC7 support is enabled, IRQ need to be kept enabled and when
> SC7 FW starts execution, it will disable COP IRQ.

This looks like a lot of undocumented assumptions on what firmware
does, as well as what firmware *is*. What I gather from this thread is
that there is at least two versions of firmware (a "proprietary
firmware" for "downstream kernels", and another one for mainline), and
that they do different things.

Given that we cannot know what people actually run, I don't think we
can safely remove anything unless this gets tested on the full spectrum
of HW/FW combination.

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.
