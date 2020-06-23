Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD24204B02
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 09:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbgFWH2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 03:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730992AbgFWH2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 03:28:20 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A40BC061795
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 00:28:20 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n6so15638427otl.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZleFPD0cvqJ3sKu6UtqPD0rWOKA/Zt+zhrXRP4AOnvg=;
        b=PDsCvaLKh9mBy736pxT8qsMAQLVP6PLNFR6KI0UWK8e2RkH5jKLIbuAGiOyAu+ML+Z
         9lOTrwjFNWHvaDYEpBhv2iJT9MIxhUDOH/eVnfRqqHcXtdofBXK8SwdQdic3gNBW/0Tj
         GU6krAzxByGuLpPL26+OjKOcQsYwz9rGsxEWubx33sS1U6nSJ+hcmlsycuj/JCJ7qj0J
         1neoBaEOrtod1giKMaAx4BzXEAcHvIJr1P63v0wNw1SeV70Fjqi5O6t/2rexBFGHIkz1
         TL4D6EPFZQUbkKG7eON2nDTfaO9aJ5yxQNWp8mJVrWtfKgJE9J2GlwI+U74K/KO5tU8b
         Js4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZleFPD0cvqJ3sKu6UtqPD0rWOKA/Zt+zhrXRP4AOnvg=;
        b=KTFpnq63wiXH0RR7kCsVGUZBnormTxAuIKkevBiBuiw3sUQfII5Je+b2fwhsDeAKJp
         zprl0UTaIcFUXgwKUAj7Z5cZIk/xYuvQriGnGYV2l/pKBKzUpCfXGb/b/+37Gn51PK84
         BVW+9tJva2XMmWyiiXPJeXfxvMh7YrIDMQWp/Eg1akiL80/v3LCeMnKTesYa+4ycEYeP
         Z9jryoDUWC7GV7dO78SXL9OvZZCpDukIpmlJqkxaf3rPg2QUAW35TFxv2oucwozNHYiE
         c459XBRTJJoB8JYckzewZlh+U/P4kkrgRLsHozVfXZs6CBX1m25rj5WYx9+g7yKm0ryL
         bxXQ==
X-Gm-Message-State: AOAM532T+MRQTc4lSQtEoSHvLWtPb2h5rs8ugeba9Pb0+hZIGFiGkuvx
        /DiKl82cyVigAiND9W9ORcfZiA==
X-Google-Smtp-Source: ABdhPJzzGYHFm3tkDGQDm2FvcqbLAhEc5k7M1RWwN7OHmjbHWoaV4NOnDMqGZlJo3b44MKMZvSLwSA==
X-Received: by 2002:a05:6830:20d7:: with SMTP id z23mr18042947otq.157.1592897299885;
        Tue, 23 Jun 2020 00:28:19 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d145sm2530080oib.17.2020.06.23.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 00:28:19 -0700 (PDT)
Date:   Tue, 23 Jun 2020 00:25:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] mailbox: qcom: Add sdm660 hmss compatible
Message-ID: <20200623072535.GX128451@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-8-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622192558.152828-8-konradybcio@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:

> The Qualcomm SDM660 platform has a APCS HMSS GLOBAL block, add the
> compatible for this.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 1 +
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 12eff942708d..b4501c6b5c6f 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -22,6 +22,7 @@ properties:
>        - qcom,msm8998-apcs-hmss-global
>        - qcom,qcs404-apcs-apps-global
>        - qcom,sc7180-apss-shared
> +      - qcom,sdm660-apcs-hmss-global
>        - qcom,sdm845-apss-shared
>        - qcom,sm8150-apss-shared
>  
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index cec34f0af6ce..ab0275869434 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -49,6 +49,10 @@ static const struct qcom_apcs_ipc_data msm8998_apcs_data = {
>  	.offset = 8, .clk_name = NULL
>  };
>  
> +static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> +	.offset = 8, .clk_name = NULL
> +};
> +
>  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
>  	.offset = 12, .clk_name = NULL
>  };
> @@ -150,6 +154,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
>  	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
>  	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
> +	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
>  	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
>  	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>  	{}
> -- 
> 2.27.0
> 
