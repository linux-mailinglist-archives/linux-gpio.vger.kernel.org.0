Return-Path: <linux-gpio+bounces-26513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E9B92A38
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 20:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 313787AC921
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 18:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA30831AF22;
	Mon, 22 Sep 2025 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eo1Piz8Z";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BWB+I0rN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C556319865;
	Mon, 22 Sep 2025 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758566696; cv=none; b=QFZA6P8KittQclGA+aufSLJOFUE3lqRaPu/tQB9+InfCubVs7bzAVoyfamvltZe20f+uiMGlWcOPVg3riliPBoNZaMpmzA51VNeGWjbLBwh37MI/zrQBq5Y6Ad1CYePWwD9IhuLyvwg9MsFlY03wJSjOwycn0nN6h0sVKNQNntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758566696; c=relaxed/simple;
	bh=5uqT9t7LL1q3vO4IziGFJ6VO0hi/i5q9U42aGdBhQg0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=qYSuB2oaxMJPod8qNr+HHVPk8AL/l2Q1vJloBLlNesI5Dbo/+uvaLVhGKhdVYjvlqcL6ubHT8/yQgXPCMkyZvcQWUnaOi9s5pWV/j3H0X/jpkGqvAK/cRiJ7RlkpmbYJQionaeR2aRrjwAA4kqf+LQKDGYfGa3PSR3AZ3u52ELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eo1Piz8Z; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BWB+I0rN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758566001; bh=LZHdHS0/egfSIVwJPqC+6tM
	bMT7So0l95Joa495MF4s=; b=eo1Piz8ZM5BZDpfSbRx8Zj6a23YzXpQZHuOF89mE17zE0rEwbH
	jOQcUzPfEin5QboCMH3DX/K8YrQn3mPk2rN8kCLgbMVl79wtMubqiUof66FVYKgzSBPW8jxnlT9
	4hGC3iy5scoCGQkTmBS2aYx/eh+fruEOPIi7MtY494b95fIhBfDLd9seY5PN7a/40A43e9cBfZ7
	OlBmu3a/q6iS5GR6+tNnaNPWEo3w++Eh9/dY7dL5e3tJOMn5LvCeh8r6rWJ9vswBHuUDLATkPKc
	B61VcYCg0g8CnbT97kR9q9rp7Z7Z2HSKBsGF6tpkr3TM/gQyXzD7mg3MdIVnlpXXY3Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758566001; bh=LZHdHS0/egfSIVwJPqC+6tM
	bMT7So0l95Joa495MF4s=; b=BWB+I0rNnuo1GzvOkQ2q25+N5gfmlW3Hz0TJRrHHdTwn4h57cl
	9qYXf64wW+VGtMXrRgZmbEU494DrI1ymkEBg==;
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 20:33:21 +0200
From: barnabas.czeman@mainlining.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov
 <lumag@kernel.org>, Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali
 <sireeshkodali@protonmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
In-Reply-To: <aNGLPdmOyh/pfroq@duo.ucw.cz>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
 <aNGLPdmOyh/pfroq@duo.ucw.cz>
Message-ID: <97ee369f6ffbe42c72c57ebd72887b23@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-22 19:45, Pavel Machek wrote:
> Hi!
> 
>> +	led-controller@45 {
>> +		compatible = "awinic,aw2013";
>> +		reg = <0x45>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		vcc-supply = <&pm8937_l10>;
>> +		vio-supply = <&pm8937_l5>;
>> +
>> +		led@0 {
>> +			reg = <0>;
>> +			function = LED_FUNCTION_STATUS;
>> +			led-max-microamp = <5000>;
>> +			color = <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@1 {
>> +			reg = <1>;
>> +			function = LED_FUNCTION_STATUS;
>> +			led-max-microamp = <5000>;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@2 {
>> +			reg = <2>;
>> +			function = LED_FUNCTION_STATUS;
>> +			led-max-microamp = <5000>;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +	};
>> +};
> 
> That's single, 3-color LED, right? Please see LED multicolor support.
As far as i know aw2013 driver does not have multicolor support.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
> 
> Best regards,
> 								Pavel

