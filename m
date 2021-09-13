Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406F5409B27
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Sep 2021 19:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238180AbhIMRqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 13:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243543AbhIMRqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 13:46:35 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7435C061760
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 10:45:19 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w144so15072173oie.13
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c/DHXuk14m7uILgZ2IPqdDPLEotN8dRdqkDvOEyQCIE=;
        b=kGHN3BZBgbL/EpS9EsDMxfUClo2vojFYB38hm94QfXt0JFqHf9K50zlmvAqHKodM1w
         BNAs+BZvwhJ1E/B5HNVHDITzwAr7HgZDym1TfmkKfn/UW7BP1wcG/9FdMTJiLvhALaZ1
         KDrzfzYbktz+2ws3q0Z6rCfG/yEx3b/vyZU5bDv6Tpj19HrJM1D0nPZliQR1hKZm37Au
         Cg9sj8N0f0y8KnMv5uKGbtWw8ubNAfFvvWtn4IIq/3Fcs0/uwpcJLngoB0bZeNSkzZbX
         6KfCywtu9M5jBWVw3NFhWc+jnCkTHy4W6VnxL5pJwcDYPkN5KDfqaVp4/ECOJdJJWczi
         CsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c/DHXuk14m7uILgZ2IPqdDPLEotN8dRdqkDvOEyQCIE=;
        b=2CYrXZeqGnUj+6+P07NxoEeOE61OenJlX3+vANvjQhm1P+MW5ga9OoiGNjZm+DbYWy
         MySE09GOTqoDWWZNPlXMlNz/VijzSUq90dAzExtrz2Sq7km6ToGS6fA6B8sxJSRznDte
         leNYy8wix4n7+sHjBDXl+aSLTRBpu4Tkk12nBDEz2dRcTrYTxghE4HMHGAwCLVsw9QMJ
         h1QK2bscm1OulvhM8kortTadle8f9V7GpHSXRf0tOebb86updr1uzwP2Bdkpqrh9N9HV
         aBlPGVRs8X8Fd2RBn1tlayi/+rfqo4FFbml9mLk8StFJEsgXYYogNnHP6w92zCNSG4Ph
         Y+gQ==
X-Gm-Message-State: AOAM533zapKQU6Q3JxmexZ/pyagRWtHxHh6PkXz2RHZS0FOth1KiJefF
        AvHUF2HGGMkJnpeUq5e1boH64TfmscifDg==
X-Google-Smtp-Source: ABdhPJxzcr7SOgHFPzSbXiyMjEFzKm+8xwwEQ1Bqb2+srqPRJEvsk1oY2zd6XNv+3+eoe/7rg+0yrA==
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr9015755oik.73.1631555118953;
        Mon, 13 Sep 2021 10:45:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m25sm2063620otp.41.2021.09.13.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:45:18 -0700 (PDT)
Date:   Mon, 13 Sep 2021 12:45:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] pinctrl: qcom: msm8226: fill in more functions
Message-ID: <YT+OLEldZ0ZGGWvV@builder.lan>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
 <20210911232707.259615-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911232707.259615-2-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 11 Sep 18:26 CDT 2021, Luca Weiss wrote:

> Add the functions for QUP4 (spi, uart, uim & i2c), sdc3 and audio_pcm as
> derived from the downstream gpiomux configuration.
> 
> Also sort the functions alphabetically, while we're at it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm8226.c | 74 ++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
> index 98779e62e951..fca0645e8008 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
> @@ -338,26 +338,32 @@ static const unsigned int sdc2_data_pins[] = { 122 };
>   * the pingroup table below.
>   */
>  enum msm8226_functions {
> -	MSM_MUX_gpio,
> -	MSM_MUX_cci_i2c0,
> +	MSM_MUX_audio_pcm,
>  	MSM_MUX_blsp_i2c1,
>  	MSM_MUX_blsp_i2c2,
>  	MSM_MUX_blsp_i2c3,
> +	MSM_MUX_blsp_i2c4,
>  	MSM_MUX_blsp_i2c5,
>  	MSM_MUX_blsp_spi1,
>  	MSM_MUX_blsp_spi2,
>  	MSM_MUX_blsp_spi3,
> +	MSM_MUX_blsp_spi4,
>  	MSM_MUX_blsp_spi5,
>  	MSM_MUX_blsp_uart1,
>  	MSM_MUX_blsp_uart2,
>  	MSM_MUX_blsp_uart3,
> +	MSM_MUX_blsp_uart4,
>  	MSM_MUX_blsp_uart5,
>  	MSM_MUX_blsp_uim1,
>  	MSM_MUX_blsp_uim2,
>  	MSM_MUX_blsp_uim3,
> +	MSM_MUX_blsp_uim4,
>  	MSM_MUX_blsp_uim5,
>  	MSM_MUX_cam_mclk0,
>  	MSM_MUX_cam_mclk1,
> +	MSM_MUX_cci_i2c0,
> +	MSM_MUX_gpio,
> +	MSM_MUX_sdc3,
>  	MSM_MUX_wlan,
>  	MSM_MUX_NA,
>  };
> @@ -382,6 +388,10 @@ static const char * const gpio_groups[] = {
>  	"gpio111", "gpio112", "gpio113", "gpio114", "gpio115", "gpio116",
>  };
>  
> +static const char * const audio_pcm_groups[] = {
> +	"gpio63", "gpio64", "gpio65", "gpio66"
> +};
> +
>  static const char * const blsp_uart1_groups[] = {
>  	"gpio0", "gpio1", "gpio2", "gpio3"
>  };
> @@ -412,6 +422,16 @@ static const char * const blsp_spi3_groups[] = {
>  	"gpio8", "gpio9", "gpio10", "gpio11"
>  };
>  
> +static const char * const blsp_uart4_groups[] = {
> +	"gpio12", "gpio13", "gpio14", "gpio15"
> +};
> +
> +static const char * const blsp_uim4_groups[] = { "gpio12", "gpio13" };
> +static const char * const blsp_i2c4_groups[] = { "gpio14", "gpio15" };
> +static const char * const blsp_spi4_groups[] = {
> +	"gpio12", "gpio13", "gpio14", "gpio15"
> +};
> +
>  static const char * const blsp_uart5_groups[] = {
>  	"gpio16", "gpio17", "gpio18", "gpio19"
>  };
> @@ -427,31 +447,41 @@ static const char * const cci_i2c0_groups[] = { "gpio29", "gpio30" };
>  static const char * const cam_mclk0_groups[] = { "gpio26" };
>  static const char * const cam_mclk1_groups[] = { "gpio27" };
>  
> +static const char * const sdc3_groups[] = {
> +	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43", "gpio44"
> +};
> +
>  static const char * const wlan_groups[] = {
>  	"gpio40", "gpio41", "gpio42", "gpio43", "gpio44"
>  };
>  
>  static const struct msm_function msm8226_functions[] = {
> -	FUNCTION(gpio),
> -	FUNCTION(cci_i2c0),
> -	FUNCTION(blsp_uim1),
> -	FUNCTION(blsp_uim2),
> -	FUNCTION(blsp_uim3),
> -	FUNCTION(blsp_uim5),
> +	FUNCTION(audio_pcm),
>  	FUNCTION(blsp_i2c1),
>  	FUNCTION(blsp_i2c2),
>  	FUNCTION(blsp_i2c3),
> +	FUNCTION(blsp_i2c4),
>  	FUNCTION(blsp_i2c5),
>  	FUNCTION(blsp_spi1),
>  	FUNCTION(blsp_spi2),
>  	FUNCTION(blsp_spi3),
> +	FUNCTION(blsp_spi4),
>  	FUNCTION(blsp_spi5),
>  	FUNCTION(blsp_uart1),
>  	FUNCTION(blsp_uart2),
>  	FUNCTION(blsp_uart3),
> +	FUNCTION(blsp_uart4),
>  	FUNCTION(blsp_uart5),
> +	FUNCTION(blsp_uim1),
> +	FUNCTION(blsp_uim2),
> +	FUNCTION(blsp_uim3),
> +	FUNCTION(blsp_uim4),
> +	FUNCTION(blsp_uim5),
>  	FUNCTION(cam_mclk0),
>  	FUNCTION(cam_mclk1),
> +	FUNCTION(cci_i2c0),
> +	FUNCTION(gpio),
> +	FUNCTION(sdc3),
>  	FUNCTION(wlan),
>  };
>  
> @@ -468,10 +498,10 @@ static const struct msm_pingroup msm8226_groups[] = {
>  	PINGROUP(9,   blsp_spi3, blsp_uart3, blsp_uim3, NA, NA, NA, NA),
>  	PINGROUP(10,  blsp_spi3, blsp_uart3, blsp_i2c3, NA, NA, NA, NA),
>  	PINGROUP(11,  blsp_spi3, blsp_uart3, blsp_i2c3, NA, NA, NA, NA),
> -	PINGROUP(12,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(13,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(14,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(15,  NA, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(12,  blsp_spi4, blsp_uart4, blsp_uim4, NA, NA, NA, NA),
> +	PINGROUP(13,  blsp_spi4, blsp_uart4, blsp_uim4, NA, NA, NA, NA),
> +	PINGROUP(14,  blsp_spi4, blsp_uart4, blsp_i2c4, NA, NA, NA, NA),
> +	PINGROUP(15,  blsp_spi4, blsp_uart4, blsp_i2c4, NA, NA, NA, NA),
>  	PINGROUP(16,  blsp_spi5, blsp_uart5, blsp_uim5, NA, NA, NA, NA),
>  	PINGROUP(17,  blsp_spi5, blsp_uart5, blsp_uim5, NA, NA, NA, NA),
>  	PINGROUP(18,  blsp_spi5, blsp_uart5, blsp_i2c5, NA, NA, NA, NA),
> @@ -495,12 +525,12 @@ static const struct msm_pingroup msm8226_groups[] = {
>  	PINGROUP(36,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(37,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(38,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(39,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(40,  wlan, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(41,  wlan, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(42,  wlan, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(43,  wlan, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(44,  wlan, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(39,  NA, sdc3, NA, NA, NA, NA, NA),
> +	PINGROUP(40,  wlan, sdc3, NA, NA, NA, NA, NA),
> +	PINGROUP(41,  wlan, sdc3, NA, NA, NA, NA, NA),
> +	PINGROUP(42,  wlan, sdc3, NA, NA, NA, NA, NA),
> +	PINGROUP(43,  wlan, sdc3, NA, NA, NA, NA, NA),
> +	PINGROUP(44,  wlan, sdc3, NA, NA, NA, NA, NA),
>  	PINGROUP(45,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(46,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(47,  NA, NA, NA, NA, NA, NA, NA),
> @@ -519,10 +549,10 @@ static const struct msm_pingroup msm8226_groups[] = {
>  	PINGROUP(60,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(61,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(62,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(63,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(64,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(65,  NA, NA, NA, NA, NA, NA, NA),
> -	PINGROUP(66,  NA, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(63,  audio_pcm, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(64,  audio_pcm, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(65,  audio_pcm, NA, NA, NA, NA, NA, NA),
> +	PINGROUP(66,  audio_pcm, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(67,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(68,  NA, NA, NA, NA, NA, NA, NA),
>  	PINGROUP(69,  NA, NA, NA, NA, NA, NA, NA),
> -- 
> 2.33.0
> 
