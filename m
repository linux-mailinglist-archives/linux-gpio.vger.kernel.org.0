Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7EC430AED
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 18:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344289AbhJQQzo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 12:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344273AbhJQQzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 12:55:39 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14308C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:30 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id v77so16804810oie.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YpfqR+4goSVOpZEdFjc7p9qdXpd+qEU5pBEsOAtORLA=;
        b=LsPdTrktpNxzEuQ5wZ8TH5LCG9Ma1LEbeiqvEWFTcP6pqYNd8xNXlBvzPNwID7JvTX
         TLkG3tQd/2ZfvzRya9tKqJTcTL9g9r81y5KOZpvg2g3I9ARw4hqzlbmi2GsoyBjD/ra1
         uejfdPbGHl+Y8tc2Ceur0V8GfxeE+gUcvAWUr/NYkAdbjVlrTgF5ifOVJBHalgprmdkI
         z7QjXw49/QlMvA73YvoJlDwTgVIQE8HDdT+83D7DYxAPN7GkBEwOC2MDhfaWuMVsNs2F
         XkhNN2G+qD489SRDRD+UA9oIL8gUeu8T50ZK1po5UIjM/ujRXIrhmgf24XHCx0J6wWz7
         9Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YpfqR+4goSVOpZEdFjc7p9qdXpd+qEU5pBEsOAtORLA=;
        b=6cuFeQP6N+m9cN09MmsE6NC9NqvnKyR63vrpGnlOAcrqr+jlmrejxIf7widFQEgkat
         nRYWtT0PfAoOiUi+p8uGs99EV2ZZkGQMdVCZvnyJVWqt9WXBOqXYeLSnjS6ILpwor16q
         cdPFxYbQergNJHOgLmzlrR6JDhOkfgC6jfbkxHF86VZALUrNGYE8TWwOMPS8QBqgMhju
         GX1li663Su+1eh5qHFj9jDG67XJEEJA0xazfWJiKVM6o7noW2//UyoNer/R6mTndPuYi
         nOMVjWattLiVdOBeUZqLSetNkivVtMd+4U7bktixEehzJ6/8kdO/X3Nng02k/bFi7EVN
         j4jw==
X-Gm-Message-State: AOAM532T1zHcmkmsXgSo53JsYnR6PoOFvZfa9GQH8l51/HxRuFakVR2r
        3fugqw55VKIEJl03z7gYxYoUzQ==
X-Google-Smtp-Source: ABdhPJxVBn+hQeqeItMpsQaEfKhkhYDSCXPj2taAmbQUiOFmIMzEzsbEE2hK1dsNfGYJ4MRTqYFvgw==
X-Received: by 2002:aca:3b05:: with SMTP id i5mr25647533oia.56.1634489609457;
        Sun, 17 Oct 2021 09:53:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l24sm2109530oop.4.2021.10.17.09.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:53:29 -0700 (PDT)
Date:   Sun, 17 Oct 2021 11:53:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 15/25] pinctrl: qcom: spmi-mpp: hardcode IRQ counts
Message-ID: <YWxVB/QxNmWwYfmW@builder.lan>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <20211008012524.481877-16-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008012524.481877-16-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 07 Oct 20:25 CDT 2021, Dmitry Baryshkov wrote:

> The probing of this driver calls platform_irq_count, which will
> setup all of the IRQs that are configured in device tree. In
> preparation for converting this driver to be a hierarchical IRQ
> chip, hardcode the IRQ count based on the hardware type so that all
> the IRQs are not configured immediately and are configured on an
> as-needed basis later in the boot process.
> 
> This change will also allow for the removal of the interrupts property
> later in this patch series once the hierarchical IRQ chip support is in.
> 
> This patch also removes the generic qcom,spmi-mpp OF match since we
> don't know the number of pins. All of the existing upstream bindings
> already include the more-specific binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index 2da9b5f68f3f..a9f994863126 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -812,11 +812,7 @@ static int pmic_mpp_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	npins = platform_irq_count(pdev);
> -	if (!npins)
> -		return -EINVAL;
> -	if (npins < 0)
> -		return npins;
> +	npins = (uintptr_t) device_get_match_data(&pdev->dev);
>  
>  	BUG_ON(npins > ARRAY_SIZE(pmic_mpp_groups));
>  
> @@ -912,16 +908,15 @@ static int pmic_mpp_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id pmic_mpp_of_match[] = {
> -	{ .compatible = "qcom,pm8019-mpp" },	/* 6 MPP's */
> -	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
> -	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
> -	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
> -	{ .compatible = "qcom,pm8950-mpp" },	/* 4 MPP's */
> -	{ .compatible = "qcom,pmi8950-mpp" },	/* 4 MPP's */
> -	{ .compatible = "qcom,pm8994-mpp" },	/* 8 MPP's */
> -	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
> -	{ .compatible = "qcom,pmi8994-mpp" },	/* 4 MPP's */
> -	{ .compatible = "qcom,spmi-mpp" },	/* Generic */
> +	{ .compatible = "qcom,pm8019-mpp", .data = (void *) 6 },
> +	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
> +	{ .compatible = "qcom,pm8950-mpp", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmi8950-mpp", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8994-mpp", .data = (void *) 8 },
> +	{ .compatible = "qcom,pma8084-mpp", .data = (void *) 8 },
> +	{ .compatible = "qcom,pmi8994-mpp", .data = (void *) 4 },
>  	{ },
>  };
>  
> -- 
> 2.30.2
> 
