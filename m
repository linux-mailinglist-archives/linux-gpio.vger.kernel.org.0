Return-Path: <linux-gpio+bounces-2720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACC841B11
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 05:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25FC91F23B2C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 04:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23531A9D;
	Tue, 30 Jan 2024 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ePpk2pgO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D85376F2;
	Tue, 30 Jan 2024 04:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706589545; cv=none; b=QYZnR09gcPIkVC3yu/u04FKAEZ7/4r4P7M5Lsm4lCNsNcS0wytyV1dJFZp4Jd0aL5O0QTCih/ZBR/L2IeIkSBFlascQV1/TOTxy1m1jHNa7itYJ/rQR0gKc08DGYI79YQEeccpz06TNnuXypbtShvli0xLbZODA75w87xIBPkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706589545; c=relaxed/simple;
	bh=wMBeUA9Q0y5ZdctCJMCUYoYNUzpI58JVXauLp6cEgSI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9nZ+R3a6ipqHgk+bkDJusPq8qdnwUV2lV0TnRswL8qVUwpZmgxNG3WYQ8GuSQRzEKSoG4zkM1DrzSxua6vISrovX4Gy1Ap+j+JNayW/3yraaxKqoCB1GkTjkuI3GbgmU7X9n5qwv35Pi8S8nEadwCf2tNFoy2Fz48n4ZsxdMz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ePpk2pgO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U4crQk010662;
	Tue, 30 Jan 2024 04:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=ER0K+FOvkmvSG/I9sFoAJ
	lU05ivjAcMW5zjtGEaGgj0=; b=ePpk2pgOKm1qk7MhjyCWeB+aOJT+L8rGgB43+
	Gnp8JcPO+LAlhxq9Dxwp5CDD7hI2iJkJy88je8mzhD6CqqWboBCGcMlTsvEWCS8o
	OYrS/42NShhFSuyidDqN8YEOUoy3LBu7JnHU8Wi8cvJH8HhGhSWcKY79tIY0oDUi
	jiYfM81bkDVVHuRBkrgRE9xUpDnlAZK/1LciTd0uBU36DbJcc50WCoAW7uBI/Mwt
	fTywBWI6I/X69hgZ2ScILqBm9Yh1tV8Loy5PS+HyoIjcmAWjZ96o6hRZIq1c6lPU
	q9VpIaz/0TBXu01VRsOP6xtAy/65eXyRZehdvblw1oU22QBwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxrq085sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:38:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U4cqJY027940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 04:38:52 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 20:38:49 -0800
Date: Mon, 29 Jan 2024 20:38:48 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: qcom: consolidate functions
 to match with driver
Message-ID: <20240130043848.GU2936378@hu-bjorande-lv.qualcomm.com>
References: <20240129092512.23602-1-quic_tengfan@quicinc.com>
 <20240129092512.23602-3-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240129092512.23602-3-quic_tengfan@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d9DRSSKNi_ReaDp05IRLUhWP2x77bVq9
X-Proofpoint-GUID: d9DRSSKNi_ReaDp05IRLUhWP2x77bVq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_01,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300030

On Mon, Jan 29, 2024 at 05:25:12PM +0800, Tengfei Fan wrote:
> Consolidate functions to match with SM4450 pinctrl driver, because
> consolidate functions are being used in SM4450 pinctrl driver.

Please make your commit message start by describing the problem you're
solving, then provide a technical description of the change.

The problem statement can mention that you consolidated the functions in
the driver, but did not update the binding before it was merged. And for
a DeviceTree binding, it should document why this
non-backwards-compatible change is okay (such as the initial commit is
broken).

Regards,
Bjorn

> 
> Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sm4450-tlmm.yaml    | 51 +++++++------------
>  1 file changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> index bb675c8ec220..4109104de054 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> @@ -72,40 +72,23 @@ $defs:
>          description:
>            Specify the alternative function to be configured for the specified
>            pins.
> -        enum: [ gpio, atest_char, atest_char0, atest_char1, atest_char2,
> -                atest_char3, atest_usb0, atest_usb00, atest_usb01, atest_usb02,
> -                atest_usb03, audio_ref, cam_mclk, cci_async, cci_i2c,
> -                cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
> -                cmu_rng0, cmu_rng1, cmu_rng2, cmu_rng3, coex_uart1, cri_trng,
> -                cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1,
> -                dp0_hot, gcc_gp1, gcc_gp2, gcc_gp3, host2wlan_sol, ibi_i3c,
> -                jitter_bist, mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2,
> -                mdp_vsync3, mi2s0_data0, mi2s0_data1, mi2s0_sck, mi2s0_ws,
> -                mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,
> -                mi2s_mclk1, nav_gpio0, nav_gpio1, nav_gpio2, pcie0_clk,
> -                phase_flag0, phase_flag1, phase_flag10, phase_flag11,
> -                phase_flag12, phase_flag13, phase_flag14, phase_flag15,
> -                phase_flag16, phase_flag17, phase_flag18, phase_flag19,
> -                phase_flag2, phase_flag20, phase_flag21, phase_flag22,
> -                phase_flag23, phase_flag24, phase_flag25, phase_flag26,
> -                phase_flag27, phase_flag28, phase_flag29, phase_flag3,
> -                phase_flag30, phase_flag31, phase_flag4, phase_flag5,
> -                phase_flag6, phase_flag7, phase_flag8, phase_flag9,
> -                pll_bist, pll_clk, prng_rosc0, prng_rosc1, prng_rosc2,
> -                prng_rosc3, qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1,
> -                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
> -                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5,
> -                qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9, qlink0_enable,
> -                qlink0_request, qlink0_wmss, qlink1_enable, qlink1_request,
> -                qlink1_wmss, qlink2_enable, qlink2_request, qlink2_wmss,
> -                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
> -                qup0_se6, qup0_se7, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
> -                qup1_se4, qup1_se5, qup1_se6, sd_write, tb_trig, tgu_ch0,
> -                tgu_ch1, tgu_ch2, tgu_ch3, tmess_prng0, tmess_prng1,
> -                tmess_prng2, tmess_prng3, tsense_pwm1, tsense_pwm2, uim0_clk,
> -                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
> -                uim1_present, uim1_reset, usb0_hs, usb0_phy, vfr_0, vfr_1,
> -                vsense_trigger ]
> +        enum: [ gpio, atest_char, atest_usb0, audio_ref_clk, cam_mclk,
> +                cci_async_in0, cci_i2c, cci, cmu_rng, coex_uart1_rx,
> +                coex_uart1_tx, cri_trng, dbg_out_clk, ddr_bist,
> +                ddr_pxi0_test, ddr_pxi1_test, gcc_gp1_clk, gcc_gp2_clk,
> +                gcc_gp3_clk, host2wlan_sol, ibi_i3c_qup0, ibi_i3c_qup1,
> +                jitter_bist_ref, mdp_vsync0_out, mdp_vsync1_out,
> +                mdp_vsync2_out, mdp_vsync3_out, mdp_vsync, nav,
> +                pcie0_clk_req, phase_flag, pll_bist_sync, pll_clk_aux,
> +                prng_rosc, qdss_cti_trig0, qdss_cti_trig1, qdss_gpio,
> +                qlink0_enable, qlink0_request, qlink0_wmss_reset,
> +                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
> +                qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2, qup1_se3,
> +                qup1_se4, sd_write_protect, tb_trig_sdc1, tb_trig_sdc2,
> +                tgu_ch0_trigout, tgu_ch1_trigout, tgu_ch2_trigout,
> +                tgu_ch3_trigout, tmess_prng, tsense_pwm1_out,
> +                tsense_pwm2_out, uim0, uim1, usb0_hs_ac, usb0_phy_ps,
> +                vfr_0_mira, vfr_0_mirb, vfr_1, vsense_trigger_mirnat ]
>  
>          required:
>            - pins
> -- 
> 2.17.1
> 

