Return-Path: <linux-gpio+bounces-30153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EBCF4683
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C84430082CC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E981C313E31;
	Mon,  5 Jan 2026 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZGWxDf9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947853128CB;
	Mon,  5 Jan 2026 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627067; cv=none; b=K5T14K/yIVjdDZe899AXqZkhVtvCKg1V9MKubVdqmMwTJmOzqqQLUMHfL4z8otYUp8kOG8AIl5+OwXxxKkjpdbhF64V3pwUqwXZLPpgXNBAd9OEsAVPTEMgLuceLdfqVoH5Yi8Xzh+JwNfincOBO/eBjj20rAUCbAzj3iOS1v98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627067; c=relaxed/simple;
	bh=Ri91T1FsKiCDKeDkCHarNbW1d42jyKjIpK5NyTV3898=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0KY/N+WhOnb7ZaOylPunE0X+wUHXOfuKAWC279H38BsqmApMEhIc/1gaRkgP1MrEGrwUmGULtosJ8bVNxkE3QDPyqtyH2iEN+5b7nOlGC7Eh+N1lYMW0bK7WoPEyHZJnzc3cAXlDDd5fFHs3D8z97wX81sT+X8tMKc41KeChp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZGWxDf9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B5FC116D0;
	Mon,  5 Jan 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767627067;
	bh=Ri91T1FsKiCDKeDkCHarNbW1d42jyKjIpK5NyTV3898=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZGWxDf9gGU0YIybbcYqObHas0/0r0MmfiBVIb2emp71tufiRigk1ZrCPwv4M9Y/z
	 OZdYCxucg+sXCmpQKojtosKgcGCcKrzWu6nA8SQil03ewHI91gSPEKSjYjYE97yVhq
	 F/uZhZ09x51VqEr0SBvvAk/H5P/Qz2OoFyQv68is3pvK53lPT5N5sBAUuXTAdHOfwZ
	 +j4NoVmS/GKVEjfB+mpkDfN3P2u/UGfAhTXFdQXcHAnXiC9tO/Toy4nT61HCszWq/v
	 eWfMCn+sCvP1YhhitBU/AK00CRokFJldVld069wZ/PGWY4fde4L+w+AtndceUWUODd
	 sPUjwuT3/RKAw==
Date: Mon, 5 Jan 2026 09:31:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <adlhkus5gvum6fkd7bxjohwlsiumw7w6w4c36vzphjz7my2644@pmobztmgpdvx>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
 <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
 <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>

On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
> > On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
> > > Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
> > > in the pinctrl-glymur driver. Mahua shares the same pin configuration
> > > as Glymur but requires a different PDC wake IRQ mapping.
> > > 
> > > Changes include:
> > > - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
> > > - Define mahua_tlmm msm_pinctrl_soc_data structure
> > > - Update device match table to include "qcom,mahua-tlmm" compatible
> > > - Modify probe function to use of_device_get_match_data() for dynamic
> > >   SoC-specific data selection
> > > 
> > > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
> > >  1 file changed, 40 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > index 335005084b6b..bf56a064d09c 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> > > @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
> > >  	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> > >  };
> > >  
> > > +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
> > > +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
> > > +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
> > > +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
> > > +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
> > > +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
> > > +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
> > > +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
> > > +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
> > > +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
> > > +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
> > > +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
> > > +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
> > > +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
> > > +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
> > > +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
> > > +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
> > > +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> > 
> > Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
> > (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
> > suffix for the missing 143, which makes sense given the bus isn't bifurcated
> > there.
> > 
> > The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
> > have it as a wakeup source, unless someone decides to connect something that's
> > not PCIe to it (+Mani)
> > 
> 
> PERST# by definition is an optional reset line, but on most of the *recent*
> designs, OEMs always connect it to PERST# line. So practically, I don't think it
> make sense to mark this GPIO as a wakeup source.
> 

This assumes that all the OEMs uses the particular PCI instance. If they
choose to route this GPIO to some other use case, they would have to
figure out that we omitted one entry in this table and patch it with
the appropriate data in order to have their GPIO wakeup capable.

Wouldn't it be better to put the correct information in this table at
this time? If we have a concrete reason not to, I think we should
include something useful in the commit message to help the poor engineer
faced with this task...

But perhaps I'm misunderstanding what the two of you are saying.

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

