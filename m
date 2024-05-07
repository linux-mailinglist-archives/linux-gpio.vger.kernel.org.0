Return-Path: <linux-gpio+bounces-6200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B12748BE757
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686101F232C5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 15:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BC91635D2;
	Tue,  7 May 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OO46xxDR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C416192D;
	Tue,  7 May 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095383; cv=none; b=nymAVCEMMDbjPDkFFKAV/27WmFyIFpNcBP+4OT2d0V6NuqRt6v2tfNKDamJP0ZSIXNeN/+dSpCMUUYKYTAu6DKl3XWqhDqeSX3k+FSNAplNgkKWX9s7vayeL9JITcj+l55EFuesQI92//B3ByFLXOh26d4l+lspySoOuWrBD7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095383; c=relaxed/simple;
	bh=Z6tWue+8yucqeQBE8UAQi/bkQKKKwed4j9928aTPaIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+VJCwTDlJ7vneIBM/J2V3PJgPYpb1miBZY8aVSDJpC01CfqLDWl5wb2wYoDAXxRPhclSlRPj0P4N8T2twY5lk2xTpoScFb3suesfh/JgnJQOy+ZpgqFUUfMfZXF542DnfIxIIcToymxiIFY7F/AsBryJxfwR3Aq/aprsrgNpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OO46xxDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2B3C2BBFC;
	Tue,  7 May 2024 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715095383;
	bh=Z6tWue+8yucqeQBE8UAQi/bkQKKKwed4j9928aTPaIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OO46xxDRGYhLgI+TLHc8PcATHXBhyAElovS45M7OI2JnvkkylNooynXnoJM8svtJu
	 4TDqAwZS1ioUEsPIVJAc+ySzTgI/zTMy8ae3k7d6OG8qrKsyaGXf7ktdKRiTbI7+y9
	 u9U5BJuEKRJHDt1DlgxBlAbTuetSLlTOa1xLhTYmSlm1u45+dgkF6phZId2XweyB03
	 VrGrHUClrboXeU7VcEDDamNBVxKaJ8Bf02MKyTXB/i6OTEJt7UNAmqtTHKloHKaca1
	 ch5IccDq9uHeapugsnWfgMHJPpxUpQaXL+WCC2iRE9/PRSnoN8GXe+ZpX8UFo47pif
	 TVdDtOATY18Dg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4Mem-000000004j2-39NS;
	Tue, 07 May 2024 17:23:05 +0200
Date: Tue, 7 May 2024 17:23:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/13] dt-bindings: mfd: pm8008: rework binding
Message-ID: <ZjpHWIKeFrJ1QZDj@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-11-johan+linaro@kernel.org>
 <fa54422f-329e-4c3e-b297-b84438f75abe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa54422f-329e-4c3e-b297-b84438f75abe@kernel.org>

On Tue, May 07, 2024 at 08:43:08AM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2024 17:08, Johan Hovold wrote:
> > Rework the pm8008 binding by dropping internal details like register
> > offsets and interrupts and by adding the missing regulator and
> > temperature alarm properties.
> > 
> > Note that child nodes are still used for pinctrl and regulator
> > configuration.
> > 
> > Also note that the pinctrl state definition will be extended later and
> > could eventually also be shared with other PMICs (e.g. by breaking out
> > bits of qcom,pmic-gpio.yaml).
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
 
> >    reg:
> > -    description:
> > -      I2C slave address.
> 
> Please split cleanups from actual functional/content rework.

Sure.

> > -
> >      maxItems: 1
> >  
> >    interrupts:
> >      maxItems: 1
> >  
> > -    description: Parent interrupt.
> > -
> >    reset-gpios:
> >      maxItems: 1
> >  
> > -  "#interrupt-cells":
> > +  vdd_l1_l2-supply: true
> 
> No underscores in property names.

Indeed. These names come from Qualcomm's v15, but I should have caught
that. Thanks.

Johan

