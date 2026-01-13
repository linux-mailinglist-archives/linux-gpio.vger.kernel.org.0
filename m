Return-Path: <linux-gpio+bounces-30496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650CD19B89
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95349302D1D2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B42D2D876A;
	Tue, 13 Jan 2026 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKEaOIP3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8C2EA490;
	Tue, 13 Jan 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316436; cv=none; b=HU43oe/ZwXsAmVV3e6NZD8zwKdADFfk8dk5gd4Lmebi/I8QwVbUNF1ERYLIViHmUFn0xvjJ8npS19Bp5ATQzMThlZGpZgGGx67Cwkzz0PB+aEGV0juy04+SikFslhlL//WzgiLXbnWWL4J1xIXQ4rbD7K0xjJzWSMZgZj5Zahso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316436; c=relaxed/simple;
	bh=7IND1r7o6Wp7j2XEHAl4lxHLxu4x+EFEDnLYqL51V0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpUxhyjyZOwTng9O/RmFGypRQy05uzSDPvgFp/i31KtQRf8CKezkFKu9S2crIS5buP2bRSkqwC6nsh4p6kfOwuBYhOwxDHn9BJLdfIOAkK2V1j9QPT33bsPslWs3hGLjZ6qocR+AfoO9jEPAuujMCOzptFXzK8cljeXANgh7d2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKEaOIP3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5FBC116C6;
	Tue, 13 Jan 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316435;
	bh=7IND1r7o6Wp7j2XEHAl4lxHLxu4x+EFEDnLYqL51V0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKEaOIP3NDy4TyyIXvNQy44XdcQ1Zofi/kLqNXszvG/ebMF/ypEIMu74C8u47DadY
	 j1+KSEmvQi0W8IVyrgJpPX/5KvwEWTzJMprDI6e/A9lAs4PZJponcNBWSZtBj1Bs4x
	 5+CutMZNmj5ZG5QbwVm0T2bTiN9EAbtq65T/ceEVy+HYkgkQquDjTSekSS9Prx/wVd
	 dWSrtYrRewLv/p04TgDPEU2jAMrBKLInOC3HNok+OOmxqaXnLNN9CO9LYhQpFBq3xl
	 z220S1ujX7ccB95Wi2vNye3KGltWKd2yh2vm6L71Xl8nk3J5+J0IbSencHSAxmV76z
	 KO8VTh+WG/UQA==
Date: Tue, 13 Jan 2026 09:00:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <27acg4iq6mtmf6tkm4w2pl7qv23iudonjdm2h2tmy2sc6owjiv@oosa6d2a3pzh>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
 <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
 <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>
 <adlhkus5gvum6fkd7bxjohwlsiumw7w6w4c36vzphjz7my2644@pmobztmgpdvx>
 <zaf4uoms75wc7yvmrmqs53couefqsv5oie2hbiwvhitqonbs4u@aq6bcvf4nq3o>
 <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
 <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>

On Mon, Jan 12, 2026 at 01:16:37PM +0530, Gopikrishna Garmidi wrote:
> 
> 
> On 1/7/2026 4:00 PM, Konrad Dybcio wrote:
> > On 1/5/26 6:20 PM, Manivannan Sadhasivam wrote:
> > > On Mon, Jan 05, 2026 at 09:31:03AM -0600, Bjorn Andersson wrote:
> > > > On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
> > > > > On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
> > > > > > On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
> > > > > > > Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
> > > > > > > in the pinctrl-glymur driver. Mahua shares the same pin configuration
> > > > > > > as Glymur but requires a different PDC wake IRQ mapping.
> > > > > > > 
> > > > > > > Changes include:
> > > > > > > - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
> > > > > > > - Define mahua_tlmm msm_pinctrl_soc_data structure
> > > > > > > - Update device match table to include "qcom,mahua-tlmm" compatible
> > > > > > > - Modify probe function to use of_device_get_match_data() for dynamic
> > > > > > >    SoC-specific data selection
> > > > > > > 
> > > > > > > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >   drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
> > > > > > >   1 file changed, 40 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > > > > > index 335005084b6b..bf56a064d09c 100644
> > > > > > > --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > > > > > +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > > > > > @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
> > > > > > >   	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> > > > > > >   };
> > > > > > > +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
> > > > > > > +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
> > > > > > > +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
> > > > > > > +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
> > > > > > > +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
> > > > > > > +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
> > > > > > > +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
> > > > > > > +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
> > > > > > > +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
> > > > > > > +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
> > > > > > > +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
> > > > > > > +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
> > > > > > > +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
> > > > > > > +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
> > > > > > > +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
> > > > > > > +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
> > > > > > > +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
> > > > > > > +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> > > > > > 
> > > > > > Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
> > > > > > (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
> > > > > > suffix for the missing 143, which makes sense given the bus isn't bifurcated
> > > > > > there.
> > > > > > 
> > > > > > The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
> > > > > > have it as a wakeup source, unless someone decides to connect something that's
> > > > > > not PCIe to it (+Mani)
> > > > > > 
> > > > > 
> > > > > PERST# by definition is an optional reset line, but on most of the *recent*
> > > > > designs, OEMs always connect it to PERST# line. So practically, I don't think it
> > > > > make sense to mark this GPIO as a wakeup source.
> > > > > 
> > > > 
> > > > This assumes that all the OEMs uses the particular PCI instance. If they
> > > > choose to route this GPIO to some other use case, they would have to
> > > > figure out that we omitted one entry in this table and patch it with
> > > > the appropriate data in order to have their GPIO wakeup capable.
> > > > 
> > > > Wouldn't it be better to put the correct information in this table at
> > > > this time? If we have a concrete reason not to, I think we should
> > > > include something useful in the commit message to help the poor engineer
> > > > faced with this task...
> > > > 
> > > 
> > > There is no concrete reason actually. I just mentioned that in practical
> > > usecase, I never saw an OEM routing the PERST# signal to other wakeup capable
> > > functionality. But the possibility still exists, so I'm not completely against
> > > it.
> > 
> > I'm curious whether we can just describe the union of these sets as a
> > common config, because as I've mentioned, IPCat says both of these platforms
> > seem to have these interrupts wired up
> > 
> > Konrad
> 
> Hi Konrad Dybcio,
> Thanks for the suggestion!
> 
> I tested using a single combined wake map (i.e., the union of both Mahua and
> Glymur sets) on actual Glymur and Mahua hardware, and both platforms work
> correctly without any errors.
> 
> Although both GPIOs are present in the wiring, only one of them is actually
> wake-capable on each platform.
> 
> Glymur:
> - GPIO 143: Supports wakeup
> - GPIO 155: Does not support wakeup
> Mahua:
> - GPIO 143: Does not support wakeup
> - GPIO 155: Supports wakeup
> 
> The combined map works functionally, but includes entries that don't match
> hardware capabilities.
> 
> Could you please advise which approach I should follow for v3?
> 1. Use a single combined map (union of both sets) with comments about wakeup
> capability difference, or
> 2. Keep separate maps for each SoC
> 

For the GPIOs with an entry in the pdc_map we delegate the interrupt
handling to the PDC.

So with the union, I believe that when you on a Glymur device request
GPIO 155, you will start getting interrupts from GPIO 143, and on Mahua
the other way around.

Perhaps I'm missing something, but I think we make the two GPIOs
unusable by this "optimization".

Regards,
Bjorn

> Happy to update v3 in whichever direction you prefer.
> 
> Best regards,
> Gopikrishna Garmidi
> 

