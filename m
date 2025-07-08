Return-Path: <linux-gpio+bounces-22941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D787AFD4F4
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 19:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7AA0189C90A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 17:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CC82E5B3C;
	Tue,  8 Jul 2025 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnPxz3QT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9BA1DC9B5;
	Tue,  8 Jul 2025 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994917; cv=none; b=f8YvEPg6vti1urf2yg0mrloE1p+gg2zHDissathVDP8sEoLU5R9ST1Ixwlbsi5WuJ2Z9B+pDTHR7cslIOl5JpiB8dWFD9Nnb43/DWZ+NNtznASgmB1g0ArdeFPYGZQEMJQEb2JtASocKAWvtbWrR4V4m7qe0VIVnuIf9rPg/1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994917; c=relaxed/simple;
	bh=zN56Kcanmm2CK6PlyASbW3cQE6ADHzafSCUuBxwC2dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6pewuxpc1+tpALTGiUyjVatU7k8iCrMFwvHn86eToBkohMkKLGk/z8pVmo3PKuEzcXQp98SwxIoiwDBqfx2RJbx9Gj4dEAzt7eIQcyrBjNRaIvCoyCI4Pqm9ps8MwbtJEKr8ch1V5lQbX2K4VFg9s72RUyPVaN/uLJnM17529Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnPxz3QT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF322C4CEED;
	Tue,  8 Jul 2025 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994917;
	bh=zN56Kcanmm2CK6PlyASbW3cQE6ADHzafSCUuBxwC2dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnPxz3QTmKrnPuKFneFht/NRDKDsD+03YX3V7I+FRPaggTCn1DWx+XA0g34uivyTV
	 odRko5WyDqDPAUIRXHjw5k6wNeY7CEXWhxwczwutDGalGgsX5ipQ5PH/rWiPlyC+pn
	 WtfWqtRxtJTLG1yWk5r2E5KfgJHNiy/YGBx+ljwsfSRsECeKZwMIdqUzUy+XD6llCm
	 q4g2HlwDbaaBhN30eh3JOBY4Tng6F5sbeDuPZ8ydx7SZgvtm+cInudZbCWPK5YiHGl
	 EINgcElxaLfa/KeT4B8WuGzNWiPz/+GjJjHsEHSmVUSm8PVxJps20YraFSW96YAe9M
	 /fqFxIcYeyzjg==
Date: Tue, 8 Jul 2025 12:15:15 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
Message-ID: <20250708171515.GA640511-robh@kernel.org>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
 <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
 <a453bd90-b7c7-42eb-b769-b4c87b6dac12@oss.qualcomm.com>
 <424285fb-14a0-452b-8d18-6165d2a78497@kernel.org>
 <3d3g2sq4r7pruu4c2sl2itclx7xuja6inasaicm67t4sx6u5fl@xq5g7h4rabno>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3g2sq4r7pruu4c2sl2itclx7xuja6inasaicm67t4sx6u5fl@xq5g7h4rabno>

On Thu, Jul 03, 2025 at 12:31:46PM -0500, Bjorn Andersson wrote:
> On Thu, Jul 03, 2025 at 01:26:11PM +0200, Krzysztof Kozlowski wrote:
> > On 03/07/2025 12:04, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 03-Jul-25 09:44, Luca Weiss wrote:
> > >> On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
> > >>> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
> > >>>> Document the Top Level Mode Multiplexer on the Milos Platform.
> > >>>
> > >>> What is Milos platform? Does it have some sort of model number how we
> > >>> usually expect? Wasn't this SM7325 or similar?
> > >>>
> 
> Milos is the actual name of the SoC.
> 
> > >>> The problem with such new naming that it awfully sounds like family
> > >>> names, so just expand the name and explain it.
> > >>
> > >> Please go argue with Bjorn/Konrad about this, wasn't my idea.
> > >>
> > >> https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> > >> https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com/
> > > 
> > > Milos is the "real-est" name of this silicon. All the associated
> > > S[AM]|QC[MS]s are just variations of it, with different fusing.
> > > 
> > > You'll stumble upon it across e.g. firmware build strings, as
> > > well as in any documentation pieces.
> > > 
> > > There are various internal reasons for the switch, but the most
> > > obvious external-facing one is not to have the user buy a devkit
> > > and wonder whether they should use QCS9100 or QCS9075 DTB, and
> > > why there's zero drivers code for these magic numbers (they
> > > include SA8775P). We can simply point them to "codename" and
> > > all C code will refer to it as well.
> > 
> > These are different SoCs, optionally with different firmware, so they
> > cannot use the same top-level compatible chain. I hope you did not
> > propose that.
> > 
> 
> No they are not different SoCs, and that's the problem with the current
> naming scheme.
> 
> > For me list like "qcs9100, sa8775p" is clear enough, but if you want
> > "qcs9100, koala-bear" or "brown-bear, koala-bear" it is fine as well.
> > You just cannot use koala-bear for all of them.
> > 
> 
> It looks "clear enough", but it's wrong. The problem is that sa8775p,
> qca9100, and qcs9075 are the "same" hardware and firmware.
> 
> The difference between sa8775p and qcs9100 is the reserved-memory map,
> the difference between qcs9100 and qcs9075 is one IP block being status
> = "okay" vs "disabled", due to fuses.
> 
> It's exactly the same problem we first saw in QRB5165, but we let the
> problem explode. Now we use the names sc7280, sm7325, qcm6490, and
> qcs6490 for the same SoC.
> 
> Using the SoC's actual name here will remove the need for playing games
> with DT includes etc to try to map things to the current naming scheme.
> 
> 
> The one case that isn't being taking care of such naming is when there
> are differences in the firmware. But as can be seen in the "sc7280"
> familiy, those software differences doesn't align with the chosen names.
> And even within a given SoC, with a (overall) given firmware, the
> reserved-memory map ends up differing.
> 
> 
> So, the name of the SoC in this patch is "Milos". We already have ways
> of dealing with firmware and/or hardware variations within one SoC, we
> should use them (and refine them as necessary), rather than pretending
> that something like SM7325 will define those properties.

I for one prefer 1 compatible per die. We often don't know if that's 
the case, but in this case we do so let's take advantage of it. 

Rob

