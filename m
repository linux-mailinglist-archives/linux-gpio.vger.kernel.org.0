Return-Path: <linux-gpio+bounces-7129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703298FB5C6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 16:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A0D7284D98
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0A14A08F;
	Tue,  4 Jun 2024 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf3Wa9vW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F3146598;
	Tue,  4 Jun 2024 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511914; cv=none; b=rp4z01EeX/pUb964RE3zjbRrBME/SFNQZUXgDLBJP2JWeTA8ro9iD57ijyR5iuzbOsKiC87bPz8SIYrkBudCcCKlfzG9v0+HT08WGjojYhq2WJIPmXy4jRkMTFVf/qRU6xLBiRrUN9OhXFQyls509D88Y9Yo9rkmf1sCxYKfQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511914; c=relaxed/simple;
	bh=6isee9xdz5MQLpYHCVcw6Bee5c9M1v5ZKFB5Zcm2XpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOQMLWTm4oJQJX/xIYfPmn3cBFnUKYjO4+ZVEmYhacY4S701AiPZmeqCiM9gqdgbQ0bzQCylCCcr76BJUMcfp8iPmcXlilGCoriLWafbNkfLuzKBsiOClcRw38Z1oeiy6cbMo0Ei9/lnV37wVqWqw80+fYCslb+6pyOVw/9LHYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf3Wa9vW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88538C2BBFC;
	Tue,  4 Jun 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717511913;
	bh=6isee9xdz5MQLpYHCVcw6Bee5c9M1v5ZKFB5Zcm2XpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mf3Wa9vWQo/urpKBAFIbueWGf556xIIhV+RcwE34Ri/tV6d2VuZfcBhKb1UzCJsej
	 j5BBeStLWNErkOgBWKH8hzFMTPDS4V86wuins81flNoamNYfMy3dFrmapLDNFifHg6
	 CL7erYwkSkx6sS5n9/HtWXSeFkik7S33QY/uZeQc/uMnQtU4GJm+SbtjXoknlMAozf
	 ta+DtN6cDvMtU02jIpEvjZuVPWY/bchVusWuisrG7COxy9FWGzN83X8pONokD362sr
	 duR6QDzEzU1XSSiK679yixwmzoEmZzy3rfG61qY8Wo8jnmQwNDO6ZU2d7SDuFbXhBK
	 619peENOsH37A==
Date: Tue, 4 Jun 2024 09:38:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/14] dt-bindings: mfd: pm8008: drop redundant
 descriptions
Message-ID: <171751190907.571809.531164853337688730.robh@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-11-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529162958.18081-11-johan+linaro@kernel.org>


On Wed, 29 May 2024 18:29:54 +0200, Johan Hovold wrote:
> In preparation for reworking the binding, drop the redundant
> descriptions of the standard 'reg' and 'interrupts' properties.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


