Return-Path: <linux-gpio+bounces-19222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC65A98D8F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 16:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC3181894542
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 14:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F056E281352;
	Wed, 23 Apr 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TWoHECXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B34280CD2;
	Wed, 23 Apr 2025 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419568; cv=none; b=aKK2i5fIW6xm9iV2zOmGa2o5+VNMDj7Ag9NPhX1Yb3xU+bXbB6CNgsM91lA8hs7L2L4GJpyOIur2v+5Fx+Qd32DEPLZIx0/1DzrP9fKE02JPNYvpWyAgM4ecb55B0/4tYcVPj35okG9pFtbDZ4jgQUs9NdL8l848mOzY6gN/u3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419568; c=relaxed/simple;
	bh=xguUTgtQfB5ymNwtCZa/MB5eCO/TXBVnXyGl/tCSe5E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=GJUIvVoZniig7W06extcwkYAcJmlI7s1Y8jnU1F/pIxnxnmtOBte05Cvy1HRsldjVBcfU+NLx4Ao/eUFrh2PUOkNTahdYtkFsUpvgjXQfKQW1Zp3VdglGRF43aoAv7OBjUmJEkclDRUF/zq2dVogKWKMTD0D+KaAiv58UEPbnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TWoHECXV; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id D5499BBAD2;
	Wed, 23 Apr 2025 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745419564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qt4FkHi2EY45p4uPV+pG4bxirlNtonFL07/CXVit5gw=;
	b=TWoHECXVZKAY5+HLO5u5if3eku6fLJsTBNmm+T/qN58v4Gf5mlGJIlZpBJ+gA2DWyzfsfG
	GOYQE93zyxX1Amfgnt1UNJgzoPPpfpr0A5xuV8erHXaOrfi62K0A9sod6d/kW4RRDB7Due
	+pFhmYBw1Fur2KCgAg2it5U4mcV+1xHFNYPGhp2TaPFUuyImiqd30xUSYWdck+Qsn0J3kj
	+tcai4piLl0bX6PSLU+eNecBkc2S4CfPx02p9yJcac5IZRhpiLpscC/aQZzf5U5h+h2wZu
	kN8aV4fU6tyEn0IvhRsG7r+eDp1KKo7B4iwBBuI+YSpH7mdTfeQZfMly16CMpg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 16:46:03 +0200
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Linus Walleij
 <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Baryshkov <lumag@kernel.org>, Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, Dang Huynh
 <danct12@riseup.net>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
In-Reply-To: <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
Message-ID: <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-23 16:03, Konrad Dybcio wrote:
> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
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
>> +			tsens_base1: base1@1d8 {
>> +				reg = <0x1d8 1>;
> 
> The size part should be hex too
> 
> [...]
> 
>> +				wcss-wlan2-pins {
>> +					pins = "gpio76";
>> +					function = "wcss_wlan2";
>> +					drive-strength = <6>;
>> +					bias-pull-up;
>> +
>> +				};
>> +
>> +			};
> 
> random newline /\
> 
> [...]
> 
>> +		mdss: display-subsystem@1a00000 {
>> +			compatible = "qcom,mdss";
>> +			reg = <0x01a00000 0x1000>,
>> +			      <0x01ab0000 0x1040>;
> 
> The latter region is 0x3000-long
> 
>> +			reg-names = "mdss_phys", "vbif_phys";
> 
> Please make reg-names a vertical list too
> 
> [...]
> 
> 
>> +		gpu: gpu@1c00000 {
>> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
>> +			reg = <0x1c00000 0x40000>;
> 
> Please pad the address part to 8 hex digits
> 
> [...]
> 
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-19200000 {
>> +					opp-hz = /bits/ 64 <19200000>;
>> +					opp-supported-hw = <0xff>;
> 
> The comment from the previous revision still stands
If i remove opp-supported-hw i will got -22 EINVAL messages and the opp 
will be not fine.
> 
> Konrad

