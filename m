Return-Path: <linux-gpio+bounces-6203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709B8BE7CC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59C328274B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08968165FD4;
	Tue,  7 May 2024 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMbZQAM4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB615E1E2;
	Tue,  7 May 2024 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097134; cv=none; b=Jfz3NXRtLINOvL0KN5z5JraXiWhRq4xKKbOVYAk0uuvYLlK/Z+wPdLKiAyTdYk+Phyuf0LxlAR08GmD6PvUpPZIinv1uUSOL1LJ0jpFGvOftM/ZWd9VmvdcVtSMTUzRiX0FABRHiRVAYDraCeglyci8g//ie3wIso6ce+9B60W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097134; c=relaxed/simple;
	bh=P2vSRZtRgkdxOqQUeJVty78/jCAKTgcuzaOvxK4M7eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM43cGpNQb3HjyN1+2TqszcWcQVN1pKIQfENJqV/347Avnlm1zinPj7iMcehA8PB5akr7+NpHrMfXqLL8QNZcx+dO90rNLOrCSeUxkqGj4nCecPsZMkH2Nv/t6NTMlSb0lBtF8yBEAsKFBd+wdU0UdcTYXmgx0IIfWVXLZoIFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMbZQAM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A03C2BBFC;
	Tue,  7 May 2024 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715097134;
	bh=P2vSRZtRgkdxOqQUeJVty78/jCAKTgcuzaOvxK4M7eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMbZQAM4JyVqwNOuBsPbY21+XXdFF5F4D6e9MTQ5hdPTaO2K/2viznyAjPuKKpz1d
	 bIhCJSPJKicfCGWqEmIimQ8yNs2mKbTKRRrIMQXL4qei7CyESWAKNz8xq4Lz5JJo0M
	 nAkRko4hFKqJIxL9x/XpfU4++M7+qBYpo5whDIIQVG+yanbNVGzk2p5r8PM8CCnyIq
	 JIf7/lH0XWXLDS3RblvBugKeDT+o8bJsgs06y6H2K/bGHqfudfneTrD1aLgE1oU6Jw
	 5KpQyguCsH/xgSyuP/Rr5t0dyPFYtbyxXrzP7wyQgm0s4HlmKJuptqOsvbdi+d0Dr+
	 4hov+wWA3y01w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4N71-0000000057F-3roK;
	Tue, 07 May 2024 17:52:16 +0200
Date: Tue, 7 May 2024 17:52:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjpOLzG8vSwuDk5k@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <6dc632b0-792c-49c8-9f66-43f7a14789cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dc632b0-792c-49c8-9f66-43f7a14789cc@linaro.org>

On Tue, May 07, 2024 at 01:48:30PM +0200, Konrad Dybcio wrote:
> On 5/6/24 17:08, Johan Hovold wrote:
> > From: Satya Priya <quic_c_skakit@quicinc.com>
> > 
> > Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
> > seven LDO regulators. Add a PM8008 regulator driver to support PMIC
> > regulator management via the regulator framework.
> > 
> > Note that this driver, originally submitted by Satya Priya [1], has been
> > reworked to match the new devicetree binding which no longer describes
> > each regulator as a separate device.
> > 
> > This avoids describing internal details like register offsets in the
> > devicetree and allows for extending the implementation with features
> > like over-current protection without having to update the binding.
> > 
> > Specifically note that the regulator interrupts are shared between all
> > regulators.
> > 
> > Note that the secondary regmap is looked up by name and that if the
> > driver ever needs to be generalised to support regulators provided by
> > the primary regmap (I2C address) such information could be added to a
> > driver lookup table matching on the parent compatible.
> > 
> > This also fixes the original implementation, which looked up regulators
> > by 'regulator-name' property rather than devicetree node name and which
> > prevented the regulators from being named to match board schematics.
> > 
> > [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
> > 
> > Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > [ johan: rework probe to match new binding, amend commit message and
> >           Kconfig entry]
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> 
> I'm a bit lukewarm on calling this qcom-pm8008-regulator.. But then
> qcom-i2c-regulator or qpnp-i2c-regulator may bite due to being overly
> generic.. Would you know whether this code will also be used for e.g.
> PM8010?

Yes, for any sufficiently similar PMICs, including SPMI ones. So
'qpnp-regulator' would be a generic name, but only Qualcomm knows what
PMICs they have and how they are related -- the rest of us is left doing
tedious code forensics to try to make some sense of this.

So just like for compatible strings, letting the first supported PMIC
name the driver makes sense as we don't know when we'll want to add a
second one for another set of devices (and we don't want to call that
one 'qpnp-regulator-2'). On the other hand, these names are now mostly
internal and can more easily be renamed later.

Johan

