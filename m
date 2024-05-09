Return-Path: <linux-gpio+bounces-6265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF158C0CC0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 10:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F7E1C21001
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 08:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544F7149C4E;
	Thu,  9 May 2024 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ph4e46so"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF97E772;
	Thu,  9 May 2024 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715244139; cv=none; b=sqsQeKgLG21Xbe9vWbwrTKy7c6otXfIe/E72B2Lj1SvV8KHjcxPH2TA80JS5XmBLFBkhHHfsSFOjhC5TXUD8cKebegu3P/9KbJWyK5MqAChvN+EJ0qgySk221p6STZCn/8E9jQPgAGHXy0Y9I49U/tFEyWp8/ranDh6IXmSaZPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715244139; c=relaxed/simple;
	bh=ANKuJoUpQeCvCghQLCCzT5eer1Krr5YfxvcSojq3CFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbztbystG+c4LUGkj4K2NdRTG/CytD7q3tUW+DqbjXIhsARwtpd4GZ43IkfjMKnvnqvn4LGAbbs9Hca5OWHx+xNzonb+NaV9iDzVKBtK+4GASWxemTw/cc0S+lGNlSp6P3u0ToxxjWfjXwLorfAKIf7wlHVLkfbfGv2FGoXTcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ph4e46so; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2F2C116B1;
	Thu,  9 May 2024 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715244138;
	bh=ANKuJoUpQeCvCghQLCCzT5eer1Krr5YfxvcSojq3CFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ph4e46soquao2zKt9ozbbUxvgqGC/OY23CVygiW0SaxE/448WIgSbcTn7g5JS7gHn
	 pt7U0gD/I+T7dxPosQkYF7xsoNbz73nRXnxTEKhleyJkS4bLUTV27V8xy5gQZ8N1VM
	 mPNttRQYA0PXbYcFfnsGiGMoVHPxOvcPDO6HuK5Z2zt7TOnsQyzUhvf6S381v7Vwde
	 QaKbD68IvAJ78rq3Lm0Q7ljK3HnMQoGo7cMFAfV3ttICgKTJOEVukHkD4I50jX2DBL
	 RDyxHFMDl/CfkE7RGBTHH52+cLb9y5rrglFlpLe/6URlLZoDWQptN/20ghNha+gKN6
	 qu9mm8K4FaZhQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4zM6-000000000C0-3i3h;
	Thu, 09 May 2024 10:42:22 +0200
Date: Thu, 9 May 2024 10:42:22 +0200
From: Johan Hovold <johan@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 00/13] arm64: dts: qcom: sc8280xp-x13s: enable pm8008
 camera pmic
Message-ID: <ZjyMblY83via7whQ@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <171502764588.89686.5159158035724685961.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171502764588.89686.5159158035724685961.robh@kernel.org>

[ +To: Krishna ]

On Mon, May 06, 2024 at 03:40:32PM -0500, Rob Herring wrote:
> On Mon, 06 May 2024 17:08:17 +0200, Johan Hovold wrote:
> > The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
> > regulators, a temperature alarm block and two GPIO pins (which are also
> > used for interrupt signalling and reset).

> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-lenovo-thinkpad-x13s.dtb' for 20240506150830.23709-1-johan+linaro@kernel.org:
> 
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: interrupts-extended: [[1, 0, 130, 4], [1, 0, 135, 4], [1, 0, 857, 4], [1, 0, 856, 4], [1, 0, 131, 4], [1, 0, 136, 4], [1, 0, 860, 4], [1, 0, 859, 4], [136, 127, 3], [136, 126, 3], [136, 129, 3], [136, 128, 3], [136, 131, 3], [136, 130, 3], [136, 133, 3], [136, 132, 3], [136, 16, 4], [136, 17, 4]] is too long
> 	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

This one is unrelated to this series and you should only see it with
linux-next which has:

	80adfb54044e ("dt-bindings: usb: qcom,dwc3: Add bindings for SC8280 Multiport")		
	3170a2c906c6 ("arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller")
	eb24bd3c593f ("arm64: dts: qcom: sc8280xp-x13s: enable USB MP and fingerprint reader")

Apparently you already reported this two weeks ago without anyone
following up:

	https://lore.kernel.org/lkml/171449016553.3484108.5214033788092698309.robh@kernel.org/

I've just sent a fix here:

	https://lore.kernel.org/lkml/20240509083822.397-1-johan+linaro@kernel.org/
	
Johan

