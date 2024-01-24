Return-Path: <linux-gpio+bounces-2480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7106383A021
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 04:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2187F293E6F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 03:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBBEBE56;
	Wed, 24 Jan 2024 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6kn+hyF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6D5C85
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706067308; cv=none; b=DcVximCoVNqfyeawlo9STmWvxTn7uqYakh2ewXqz0ovK2N1XBKuRmf4+mD7uf1jOyP+8pM0K+wJv6UmDOPQGR7N55uA+h3N0VS5mOwUfkugvoVCoj0CfgrOY8PdipIPIYLyDnROqglF7ZICUPHW9DhgRntabwmbVcApYQbeS784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706067308; c=relaxed/simple;
	bh=y9Vp9vbZvilIeik7WapiN99pWWu8sQ80wtMxvphWsn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQXJZrYndVcITcxzSagSZHfEsFjRc0UGyoyCcu8S68Qne2D+1m/oYpdzCI/5c+XPWNiOsuOJyalxQY883WqZ2mG/NWSUXjZE5DyHiGralmfwBjRYzIR6PK52ME85zIQ8a5dzmbTVb7YiW+NF8bQEYwmtZbhsbDAVeshieENeVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6kn+hyF; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed179f0faso4595655276.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 19:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706067305; x=1706672105; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2KoflRzMNPPjZUlo7X0vfgue2gegN6tDr6D9o0LbWYo=;
        b=X6kn+hyFJEvNjRAYIniuOjB5dRFEyUxp0KzIuOuqo2sNQ2j5qb6iqAq9tQrBD8v5WS
         UylqI1mHd4r7zNmKDBE2anyNIcLZBX/imuO7o5Z/A2RbodmPcu7xA/XcbqSbe6c5RMkY
         OznPX4mbLzRuXiuRs4DsthO2NAVNO+CSPFRDp2rDANTVpftG8kOIhM+pNYe6e2P2+G/o
         ql0OD2JSokNUU9VCdyKnAaLvtmNn7OWfJqb5X48S9G69+B+h10pQvE9RA6uhqphta8qz
         1Y2KfJJqA1jX9t47WKVAKxXlF5lOt5Q23D8o+qYTYtM6QtzKKut6bGYDFaNbBiakVdEC
         RdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706067305; x=1706672105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KoflRzMNPPjZUlo7X0vfgue2gegN6tDr6D9o0LbWYo=;
        b=r7Ju0hkg6f8TGjkl2rBq+EaGigBAPbM+0mVTKYCwYZYE9/qznmN7vl+geyWvzoybWK
         p4SL4BgaoYjzDtt2CTsakP2bnst0MNZlUzQOsXkW9yLz29rni4wjytHTI8vvB7xqgiaz
         NOmuL8g1IO11MjTynOX7QwZIDFwSm/g+NxCMr1wLIo8KoIFHIXBtQhE9trRqGZ5Pg+t+
         uOGJ/r0TqGfPXOWV4fAYJtZB08IagTMxUMgtHuWmSvpyhI4aZc1KK5Hih5CinEI2QRX1
         gqNw1RpuHRYYCVRcsWu5QF7cnK6mQwm9abslB/Y/2zAInnPGQ8zvBiae8r/3wa4UWtJ7
         oG5Q==
X-Gm-Message-State: AOJu0YxpBRRYqJJAIi00nO1yAROrvLsbhoyWW49IiJth9Z3pX4nklwra
	Xj6jQhkScRMyORMwD/T1SwEBD/1M6kYuIenay2rs1dlyWMkQaFRK7FxWbhUbQSd2ZZauomOoefA
	Qh7IaJyCkJM6Q3Kw1phedXGNQuAfYsWfHHGgDpUaWArLfnzkUj62yYA==
X-Google-Smtp-Source: AGHT+IHFO+gNl+g/FGS4KZ7d3Cp5K+Hz9zGV+TG2rSU2Q14ASyuP8guPBale1ksVko5k8H7c4LSytUaXdh9sijgOohM=
X-Received: by 2002:a05:6902:e03:b0:dbd:52d7:a611 with SMTP id
 df3-20020a0569020e0300b00dbd52d7a611mr175969ybb.25.1706067304816; Tue, 23 Jan
 2024 19:35:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124023305.15755-1-quic_tengfan@quicinc.com> <20240124023305.15755-3-quic_tengfan@quicinc.com>
In-Reply-To: <20240124023305.15755-3-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 05:34:54 +0200
Message-ID: <CAA8EJppy4=HkrWJ326WZa=EnFzv-4eKPoYDbu=dxiBnpz=f0MQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom: consolidate functions
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, linus.walleij@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 04:34, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Functions are consolidated in SM4450 tlmm driver, also consolidate these
> functions in SM4450 tlmm binding file.

This must be described as a bugfix in schema rather than just "consolidation".

Also:

Fixes: 7bf8b78f86db ("dt-bindings: pinctrl: qcom: Add SM4450 pinctrl")

>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sm4450-tlmm.yaml    | 51 +++++++------------
>  1 file changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4450-tlmm.yaml
> index bb675c8ec220..449fe442d3b2 100644
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
> +                prng_rosc, qdss_cti_trig0, qdss_cti_trig1,  qdss_gpio,
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
>


-- 
With best wishes
Dmitry

