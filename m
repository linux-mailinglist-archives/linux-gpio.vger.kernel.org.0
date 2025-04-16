Return-Path: <linux-gpio+bounces-18989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EEA90D44
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 22:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2FC3447BF8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 20:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4732356AF;
	Wed, 16 Apr 2025 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oXDcUd/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59D21324F;
	Wed, 16 Apr 2025 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836068; cv=none; b=Mjvlh94KkGwik11Zwp/rWO+qugCN8su85PbuYctLGAOb2MkIfVXE+o1qDWvwNUoVUNsUwRiPpxkiFCk8x8/6l0dftiV+u7iGF9qPNjIWtBydeSVjSXyh3FkqcL3gnMxai2oUnS0ryT2BvsFHWp1Mj2TXaz2exYevdnR08Z9wF/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836068; c=relaxed/simple;
	bh=v7UN+6CjXz2XLGpkAAt+coSnP+B3OwoBHVUpCmbXSZ4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=eTFeIBIZ+NyoAHp6z3Y4zPcSYBv+IhkTi0DiyDg3+eHkNgkvNvpSwpBX4Jx6De/p9i3g+B/WXAha0FLXx4EjhK39cNw4XJeT9AKueJgz4LPfOEGy6LlsjtBbNyVDFN7XZOLpgBRVWouYd2SMf8CVSOB9fJdm/3VycC7sOWXPzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oXDcUd/S; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id 69865BBAD2;
	Wed, 16 Apr 2025 20:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1744835607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWNDczDpsZAXQp+kAkO6XxPalFUodMDdefQ7Hqvnp3I=;
	b=oXDcUd/SrbjUZCVHpXK24ZQmD8eBsHZdttsQMwVDTwpErRn4lZfOJdH1A8oiVepKQPSDqZ
	zlhtcHxJxDDvgtuNwu0JYAy5U1GvSo79Ey+649CcXxXpIIsyraAVU9Vr3PUPmWGlvRSKO1
	xvLKpW0+s6nahxy3YDOwEU50jHtD38VCy88Y7xJgheSSEovev889x1DVU+LlGAJM5GUo38
	P9tScdTlm2HuSd3uMqrUThPEGS4wG9Ma44SnYo2szJaYY3suuCYH78B0NE5BhULGNe21tZ
	x6h9u4B4Ynv1/7XO73MGACy6WDFSjOXDm641nbh1O2DtAhNmPuNkGfh2aPRg7g==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 22:33:27 +0200
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov
 <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, Dang Huynh
 <danct12@riseup.net>
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
In-Reply-To: <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
Message-ID: <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-14 22:55, Konrad Dybcio wrote:
> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>> From: Dang Huynh <danct12@riseup.net>
>> 
>> Add initial support for MSM8937 SoC.
>> 
>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> [...]
> 
>> +			power-domains = <&cpu_pd0>;
>> +			power-domain-names = "psci";
> 
> So CPU4-7 get "nicer" idle, but 0-3 don't?
I am not sure, i will check.
> 
> [...]
> 
>> +		cpu-map {
>> +			/* The MSM8937 has 2 cluster A53 setup. */
> 
> This comment seems superfluous
> 
> [...]
> 
>> +	timer {
> 
> 'p' < 't', please sort top-level nodes alphabetically
> 
> [...]
> 
>> +				wcss-wlan2-pins {
>> +					pins = "gpio76";
>> +					function = "wcss_wlan2";
>> +					drive-strength = <6>;
> 
> please unify this order (drive-strength before bias)
> 
>> +					bias-pull-up;
>> +
>> +				};
> 
> Extra newline
> 
> [...]
> 
>> +		gpu: gpu@1c00000 {
>> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
>> +			reg = <0x1c00000 0x40000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "kgsl_3d0_irq";
>> +			#cooling-cells = <2>;
>> +			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
>> +				<&gcc GCC_OXILI_AHB_CLK>,
>> +				<&gcc GCC_BIMC_GFX_CLK>,
>> +				<&gcc GCC_BIMC_GPU_CLK>,
>> +				<&gcc GCC_OXILI_TIMER_CLK>,
>> +				<&gcc GCC_OXILI_AON_CLK>;
> 
> Please align the <s
> 
>> +			clock-names = "core",
>> +				      "iface",
>> +				      "mem_iface",
>> +				      "alt_mem_iface",
>> +				      "rbbmtimer",
>> +				      "alwayson";
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&gcc OXILI_GX_GDSC>;
>> +
>> +			iommus = <&adreno_smmu 0>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-19200000 {
>> +					opp-hz = /bits/ 64 <19200000>;
>> +					opp-supported-hw = <0xFF>;
> 
> 0xff is overly broad, please document the existing known speed bins
> 
> [...]
> 
>> +		adreno_smmu: iommu@1c40000 {
>> +			compatible = "qcom,msm8996-smmu-v2",
>> +				     "qcom,adreno-smmu",
>> +				     "qcom,smmu-v2";
>> +			reg = <0x1c40000 0x10000>;
> 
> Does it work as-is, without iommu changes?
Yes
> 
> [...]
> 
>> +	thermal_zones: thermal-zones {
>> +		aoss-thermal {
>> +			polling-delay-passive = <250>;
> 
> There are no passive trip points> +
Should i remove polling-delay-passive?
>> +			thermal-sensors = <&tsens 0>;
>> +
>> +			trips {
>> +				aoss_alert0: trip-point0 {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "hot";
>> +				};
> 
> Please convert these to 'critical' instead
> 
> [...]
> 
>> +		cpuss1-thermal {
>> +			polling-delay-passive = <250>;
> 
> You can drop polling-delay-passive under CPU tzones, as threshold
> crossing is interrupt-driven
Should I remove polling-delay-passive then?
> 
>> +
>> +			thermal-sensors = <&tsens 4>;
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&cpuss1_alert0>;
>> +					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +
>> +			trips {
>> +				cpuss1_alert0: trip-point0 {
>> +					temperature = <75000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};
>> +
>> +				cpuss1_alert1: trip-point1 {
>> +					temperature = <85000>;
>> +					hysteresis = <2000>;
>> +					type = "hot";
>> +				};
> 
> On newer platforms we rely on LMH to shut down the device if it
> were to reach the junction temperature, but let's leave them here
> as probably no one remembers for sure how reliable that is on these
> older platforms and you're most likely not willing to test that
> 
> Konrad

