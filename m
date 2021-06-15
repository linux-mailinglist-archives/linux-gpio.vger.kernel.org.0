Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782BB3A8A9A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 23:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhFOVIv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 17:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbhFOVIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 17:08:50 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6AFC061760
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:06:45 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id q10so41473oij.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gXO9eB5fahpZxebB81kgmu3FiItJh+tZXgWUfrGSFSs=;
        b=D7EI5bwvKftbjo/TlMed7v9USmCw6INQJZSE4p6MplPtrvTmI4mc+EX9WB2nilQrwh
         HQkzxANoZCBQjKs1Q7FJBdamLAyw3H9cngxOLoiDqaWaBICwv1safhs+ObTdZSeqI8xt
         wEIzWTFz7JESbyCXxarfYr9dxVuNmtmH9+IdijDXsDZx9HME8Gwvku/c4udoS7kyGFj9
         zN1EHLZVaO3Wb7Ap7/9s1IbkfGRVJ8IbEVzXrwjVK8quztUOtObUBVoijG6oUdiamJUu
         NdDrHvMYvbGPXTkDr2LWTeFbOLlQsdgDvBOJYdZbaq9TbJuwjbnLALNnusi7+Y46ozgy
         78xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gXO9eB5fahpZxebB81kgmu3FiItJh+tZXgWUfrGSFSs=;
        b=gRtAa/xKRaLWvTSC0+7rqZF5RiC5F54hzRuFOObUYzbIgLalh456k7p44saP6L/QVb
         n+iEgDn5+l2JVeYOLbV7g0NX2cVJpipjqod0r3MqBzFe5VcWQPLwm9f59QNJgXbwHF3C
         8EYYsfavXep+Zb/oZMtBO3uOasH81U/9onmpEwevkAMO8VMKDj+uTbIISP8E9zrAqPeD
         Itxr76wUOMbfkqY178f1T6o2pcTDtizrogW3WxrwC4yoAyWC54laUJNfe1mPoXARM8sl
         E7+4nif1jpFSQvhYWme7caBpUPxDZWDzf6nuE94TLbV1RRQSd4ZQVD0w7CPMqUvwxAPK
         pUtA==
X-Gm-Message-State: AOAM532DDrUYOOKUt8cxtS0Sd+okdp+Mlp6ou6TOIZsAD4+LEyZB9vz6
        NtWrbBA8Ou1IhWnJwQ5WHB/renyuO/xlEQ==
X-Google-Smtp-Source: ABdhPJxG/vVTBa+LwuR6IRQ2qq3ncRTBPUo0AQ3qeK+b2EMjEG2uK3yDTjNwzvrr2vu9LIAjoLU69g==
X-Received: by 2002:a54:4609:: with SMTP id p9mr697812oip.107.1623791204795;
        Tue, 15 Jun 2021 14:06:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q11sm13844ooc.27.2021.06.15.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:06:44 -0700 (PDT)
Date:   Tue, 15 Jun 2021 16:06:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 05/10] regulator: qcom-rpmh: Cleanup terminator line
 commas
Message-ID: <YMkWYkrwHilEX0ck@builder.lan>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-6-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-6-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:

> Cleanup the qcom-rpmh regulator driver:
> - remove comma(s) at the end of the terminator line.
> - add missing terminator in instances of
>   pm7325x_vreg_data[] arrays.

This second part needs a:

Fixes: c4e5aa3dbee5 ("regulator: qcom-rpmh: Add PM7325/PMR735A regulator support")

So it's up to Mark if he wants both parts in a single patch.

> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>

I don't think these Cc tags serves a purpose here. The patch itself
looks good though

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 26 +++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 22fec370fa61..af41a517da99 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -811,12 +811,12 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
>  	RPMH_VREG("ldo28",  "ldo%s28", &pmic4_pldo,      "vdd-l16-l28"),
>  	RPMH_VREG("lvs1",   "vs%s1",   &pmic4_lvs,       "vin-lvs-1-2"),
>  	RPMH_VREG("lvs2",   "vs%s2",   &pmic4_lvs,       "vin-lvs-1-2"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pmi8998_vreg_data[] = {
>  	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
> @@ -824,7 +824,7 @@ static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
>  	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
>  	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
>  	RPMH_VREG("smps4",  "smp%s4",  &pmic4_ftsmps426, "vdd-s4"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
> @@ -856,7 +856,7 @@ static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
>  	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
>  	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
>  	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
> @@ -880,7 +880,7 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
>  	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
>  	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
> @@ -906,7 +906,7 @@ static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
>  	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
>  	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
> @@ -934,7 +934,7 @@ static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
>  	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
>  	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
>  	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
> @@ -947,7 +947,7 @@ static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
>  	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
> @@ -960,7 +960,7 @@ static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
>  	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
> @@ -988,7 +988,7 @@ static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
>  	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
>  	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
>  	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
> @@ -1012,7 +1012,7 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
>  	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
>  	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
> @@ -1039,7 +1039,7 @@ static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
>  	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
>  	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
>  	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
> -	{},
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
> @@ -1070,6 +1070,7 @@ static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
>  	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
>  	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
>  	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
> +	{}
>  };
>  
>  static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
> @@ -1083,6 +1084,7 @@ static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
>  	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-bob"),
> +	{}
>  };
>  
>  static int rpmh_regulator_probe(struct platform_device *pdev)
> -- 
> 2.31.1
> 
