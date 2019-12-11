Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D1D11A499
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 07:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfLKGjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 01:39:37 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46749 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfLKGjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 01:39:37 -0500
Received: by mail-pg1-f193.google.com with SMTP id z124so10245451pgb.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 22:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kcW6WrBcvg8R/lYPM6ixJTQAiO/MQeqfUNHc5Kw90lo=;
        b=hpniJbqUrDNCh9CxSRDGYGaZ5GA0fJjKFFDeR3ptHaI6VzBFOfUIxkVOeowTgF/Y4f
         TtQjnNMpI7o8m/pSpCKzqMKdWgsy5jV7TQQt0cXIWCX4KwPYo27HPFcq9FP81h/owPgi
         ZVxjU0vm5bxPss8T/tWzy8X+KNCyn6w2/qhwcUVrRQcqAv889XbNayb1ZLNCvyp76lsq
         4mtnsX2KVSQtx0pNmhYNal3KlCNhIonJai0ZBOoAhigRpchIWvQkUgZ6UrXsT+kFHbzB
         5BdonK61rQtYqHfiYiGAT1rmBYh1uGX8k2phFvq2RWX5RfEpgolSXi7yAf2B/aul2kRe
         K8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kcW6WrBcvg8R/lYPM6ixJTQAiO/MQeqfUNHc5Kw90lo=;
        b=pgWHVpOMu/GFbpIpnovz2NRrBVyEc/wJEFTTwkXzx9OMJdetXZNFUoxV43aXdrVDfN
         Hq3kFF03y8NOTSQwsANps9RNsGGHMxu0mWjTp6uUNehlvlBwDlaWTbXkZtuP5FPfDidJ
         2PotrtYIrlpdP51LeI9fCl/kWz/tPqMe1jtaWiRCohZ/YoL8m0/TMtDDhLlOi8LXPP09
         BHIZyW5tB8fq7AnQm6smvEKjZyIGtn2IO6FpmAQIsb4r+UIuktVT+JiwqLURmfQluMrA
         vzdwHq3NJ2eOlgTIbhpm4mzPQ6vClfwIhJIYYKVW7b2M42rRyB1BwSJHEEn/A2b3wWzR
         bztg==
X-Gm-Message-State: APjAAAXrlvtMQNFR4eYtDD9ci1pumLLtDGCW4zate2ABrgTKKpDzeeYQ
        TsUluO1aSmgOK0tIJXyOi3JUeg==
X-Google-Smtp-Source: APXvYqyuF1aA0T4EDKsEb0XxR4EuXuNF7H4Vadx8g+kbRnhuYkm1szv3JcP02dztFnoFcvsw9bW1ig==
X-Received: by 2002:aa7:85d8:: with SMTP id z24mr2115129pfn.202.1576046376453;
        Tue, 10 Dec 2019 22:39:36 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y22sm1272741pfn.122.2019.12.10.22.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 22:39:35 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:39:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions
 for sc7180
Message-ID: <20191211063933.GD3143381@builder>
References: <0101016ef36a5d13-457e6678-2e83-494e-8494-1b0776d5b7e4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ef36a5d13-457e6678-2e83-494e-8494-1b0776d5b7e4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 10 Dec 21:24 PST 2019, Rajendra Nayak wrote:

> Add new qup functions for qup02/04/11 and qup13 wherein multiple
> functions (for i2c and uart) share the same pin. This allows users
> to identify which specific qup function for the instance one needs
> to use for the pin.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
> index b5767ee..6ffeac9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
> @@ -125,8 +125,9 @@ to specify in a pin configuration subnode:
>  		    mi2s_1, mi2s_2, mss_lte, m_voc, pa_indicator, phase_flag,
>  		    PLL_BIST, pll_bypassnl, pll_reset, prng_rosc, qdss,
>  		    qdss_cti, qlink_enable, qlink_request, qspi_clk, qspi_cs,
> -		    qspi_data, qup00, qup01, qup02, qup03, qup04, qup05,
> -		    qup10, qup11, qup12, qup13, qup14, qup15, sdc1_tb,
> +		    qspi_data, qup00, qup01, qup02_i2c, qup02_uart, qup03,
> +		    qup04_i2c, qup04_uart, qup05, qup10, qup11_i2c, qup11_uart,
> +		    qup12, qup13_i2c, qup13_uart, qup14, qup15, sdc1_tb,
>  		    sdc2_tb, sd_write, sp_cmu, tgu_ch0, tgu_ch1, tgu_ch2,
>  		    tgu_ch3, tsense_pwm1, tsense_pwm2, uim1, uim2, uim_batt,
>  		    usb_phy, vfr_1, _V_GPIO, _V_PPS_IN, _V_PPS_OUT,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
