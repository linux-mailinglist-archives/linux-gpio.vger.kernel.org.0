Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1333A8ABF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 23:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFOVMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 17:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbhFOVMu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 17:12:50 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96177C061760
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:10:45 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso274138oto.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WkzhRbVFIgsr0heAbxBvDzw6jHRgA2esFwM/DKd3EyE=;
        b=GLpKQJWLyWxKu2kjdrJ+K+in8MCFzZblnO/mxP7t2GLlZXhJdW3eG/1O5YQaXc3mC2
         GzmJhKAafAi+2YHGqDk01Et0j+5+5jfC09ug+GYfUw1Ggs2LBp+i/2n2/YpDn+HLChb6
         dsz8pjtmqof8o1sl8NIEPc9xs57FrXLQpXM7DR29JjtHQTfJeULCpjb6Pfcbr4OVjxIg
         HFSsykxl6d2bKhF7kKuEqxSt/jqxpKDj64wFAUREZ1UTU4mbcwQd2/LAN2UQVm4SSBsy
         AcHfTr4GQr4o+8a8GuIN0ZqUagviRykROQfFhhIZugrb3bmvpf/cHdqiYqwf4zSy8xSr
         J4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WkzhRbVFIgsr0heAbxBvDzw6jHRgA2esFwM/DKd3EyE=;
        b=Fg1oqWPNkVT3WL6HsWDcpJZ7XU+e8XGcn1wHjm5cLJRnXEiqbWDqqR7TTJIkql1LVi
         GMO0Ll7rci7W9Q/MdX3mG97sgB/c8jJd4jbtYbAd4U/Bhc+PLKoeZWdPHsWqiOaDry19
         MBK+10n5WhSCu7mZPzpCBftNXKV5Ws5KOv2AOgdYuriI4nF8xbroyLt8MOvCyyMDCOP5
         SdtWDK48tkdFMobR4YVZwciLfuGscBu4q2sEGpBEBVAp1JbeMoVIAUAyQM8Zfp29ZyxM
         2Gz36vnFgwRGYq2VWBD76xDOMxEmXBxfk4kqWFcl0+ELUBb0ZalOuYuSnLtkU8UICXoP
         +WNQ==
X-Gm-Message-State: AOAM532YXVoex6xcQrT2UIsXpUCt2izsNu5Uz47QrvNyDQ0/JhDo8ni6
        D3p+X7ieTLEIfzJA+ZWqhjV2FI57dNeRpw==
X-Google-Smtp-Source: ABdhPJw7qeXG/5lTImKm0KdNyRK03SnhL5SAOJK8UevYph48QoAUeoEgbSLe19hRV48oZu268cPfig==
X-Received: by 2002:a9d:6f93:: with SMTP id h19mr972789otq.100.1623791444974;
        Tue, 15 Jun 2021 14:10:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w17sm8002oif.44.2021.06.15.14.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:10:44 -0700 (PDT)
Date:   Tue, 15 Jun 2021 16:10:42 -0500
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
Subject: Re: [PATCH v2 06/10] regulator: qcom-rpmh: Add new regulator found
 on SA8155p adp board
Message-ID: <YMkXUj9A6qHcO3e4@builder.lan>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-7-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-7-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:

> SA8155p-adp board supports a new regulator - pmm8155au.
> 
> The output power management circuits in this regulator include:
> - FTS510 smps,
> - HFS510 smps, and
> - LDO510 linear regulators
> 
> Add support for the same.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Not sure if I should interpret Mark's comment in the way that he already
picked this patch up.

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 36 +++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index af41a517da99..73623d51929b 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -883,6 +883,38 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
>  	{}
>  };
>  
> +static const struct rpmh_vreg_init_data pmm8155au_vreg_data[] = {
> +	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
> +	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
> +	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
> +	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
> +	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
> +	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
> +	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
> +	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
> +	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
> +	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
> +	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
> +	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
> +	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
> +	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
> +	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> +	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l1-l8-l11"),
> +	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
> +	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
> +	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
> +	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> +	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
> +	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> +	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> +	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
> +	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
> +	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
> +	{}
> +};
> +
>  static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
>  	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
>  	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
> @@ -1145,6 +1177,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
>  		.compatible = "qcom,pm8150l-rpmh-regulators",
>  		.data = pm8150l_vreg_data,
>  	},
> +	{
> +		.compatible = "qcom,pmm8155au-rpmh-regulators",

It would be preferable if this was sorted alphabetically (on the
compatible).

With that,

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		.data = pmm8155au_vreg_data,
> +	},
>  	{
>  		.compatible = "qcom,pm8350-rpmh-regulators",
>  		.data = pm8350_vreg_data,
> -- 
> 2.31.1
> 
