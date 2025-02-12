Return-Path: <linux-gpio+bounces-15876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E399A32B63
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 17:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40D2C16555B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 16:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060B22135B0;
	Wed, 12 Feb 2025 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Byx1S3Df"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AD1D516D;
	Wed, 12 Feb 2025 16:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377227; cv=none; b=dLwSFRMkXtyFr+hb4g4KMpKRjiluKlLAAH/mGnhWtPcTDwZJ1Jsn1KVfGgDUC8ZqNKSqMY5ustgfPrlGlDeodgPiKDCmDhL6A0a1EYiDqzgsW9B2TVzrX1p2A8dUr6FQ9sAMg0j6jWJwWrXWMIOAhYktPcucj497QXGs4jvggZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377227; c=relaxed/simple;
	bh=IH6FJ/LOaKwyiedQHW7mKTCXkZR7qoVHrS4dm49fsuM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ZhQwkM6mZGHCVjCTIeBOGvh4hzx4GSfZ86pys+JvVXN2Q46G07dbEW2RbH5CWxcpX/FuLqQU53VLa3vo3W7yLyiOtbfpOCHvBp9japJIlSWhdB+okZuVWOjrt+ZOkxNli7cGhWthnB0zKzeFSVhtviNDhgy1F6ZcfgAOtTNNZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Byx1S3Df; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id 1EEE9BB835;
	Wed, 12 Feb 2025 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739377223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QIxsFEW0fxFxc9Uh+/NGJ+ZhMAYCRBTTVCPuNqXBoWo=;
	b=Byx1S3Df880pwgYYJt/jlleUmRcSPicWQL0Wc8t66UFcEb4Ymrj0X6U5GMcQUYlG72P2mw
	AeaCaTksiVCGthozukYYKwjh3r55Uz37MR6DYqQJeSryK0a28AaAI628C8QpSgwcNHP8YN
	Ugp1f/43WQ36lJKDc/0i2PQxPXa9x9s6e5JY19LUMUxLF26KtosgKVuDcScxwxfcNnXhTl
	I2VksJS6LWy8Axv7ckWW8Blhfu29BQg92lauuTdMQbk2adwD+FDeA1/O/6pkjMXAnZ2L7e
	27oLOvRuwFSq3zr1O60LashbJabjiwJfddqgNM7GEOJWHLXh+m8VAne7uyZi2Q==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 12 Feb 2025 17:20:23 +0100
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
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH 08/10] arm64: dts: qcom: Add initial support for MSM8937
In-Reply-To: <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
 <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
Message-ID: <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-12 14:07, Konrad Dybcio wrote:
> On 11.02.2025 11:37 PM, Barnabás Czémán wrote:
>> From: Dang Huynh <danct12@riseup.net>
>> 
>> Add initial support for MSM8937 SoC.
>> 
>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> So the computer tells me 8917 and 8937 are *very* similar. Have you
> tried assessing how making 8937.dtsi an overlay atop 8917.dtsi would
> work out?

They are similar but there are many small differences:
- have two dsi
- using adreno 505
- different iommu it uses arm,smmu for gpu and qcom,iommu for 
applications
- 8 cores
- camss will be a different a bit
- venus will be different a bit
- have more i2c and spi
- different mdp version

Maybe i can find more differences, originally it was based on 
msm8917.dtsi
but we have decided to keep it separate, also it have different license 
from 8917.
The plan is MSM8940 and SDM439 support will based on msm8937.dtsi in the 
future.

> 
> 
>>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2145 
>> +++++++++++++++++++++++++++++++++
>>  1 file changed, 2145 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8937.dtsi
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..ef633c1694ad98165e58130cbeb186d2f0e2dcaa
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
>> @@ -0,0 +1,2145 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023, Dang Huynh <danct12@riseup.net>
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,gcc-msm8917.h>
>> +#include <dt-bindings/clock/qcom,rpmcc.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/power/qcom-rpmpd.h>
>> +#include <dt-bindings/thermal/thermal.h>
>> +
>> +/ {
>> +	interrupt-parent = <&intc>;
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	clocks {
>> +		xo_board: xo-board {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +
>> +		sleep_clk: sleep-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu4: cpu@0 {
> 
> I'm pretty sure a CPU with a MPIDR of 0 should be called CPU0
> 
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x0>;
>> +			device_type = "cpu";
>> +			enable-method = "psci";
>> +			operating-points-v2 = <&cpu_opp_table_c0>;
>> +			next-level-cache = <&l2_0>;
>> +			#cooling-cells = <2>;
>> +			l2_0: l2-cache {
> 
> Please add a newline between the last property and the subnode
> 
>> +				compatible = "cache";
>> +				cache-level = <2>;
> 
> cache-size = <0x80000>;
> 
> [...]
> 
>> +		cpu0: cpu@100 {
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x100>;
>> +			device_type = "cpu";
>> +			next-level-cache = <&l2_1>;
>> +			enable-method = "psci";
>> +			operating-points-v2 = <&cpu_opp_table_c1>;
>> +			#cooling-cells = <2>;
>> +			power-domains = <&cpu_pd0>;
>> +			power-domain-names = "psci";
>> +			l2_1: l2-cache {
>> +				compatible = "cache";
>> +				cache-level = <2>;
> 
> cache-size = <0x100000>;
> 
> I'll do further review if you decide it makes sense to keep this
> separate from 8917
> 
> Konrad

