Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738B445B278
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 04:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234202AbhKXDOz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 22:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhKXDOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 22:14:55 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1CBC061714
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 19:11:46 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bf8so2341852oib.6
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 19:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fN/Dl6TxJyEsFt6u9NU+sGC5XUURVMgjTKQkCfW2T3U=;
        b=uH7Wf/5iE4N6KcT0ASOtp1c43wElMx55biNOwUI52oUdDHLao+sKCDGtIRbA29w/9m
         OKlPXBfisQZtai87FrCo+E0p56YO55MkA1lUvyZWqn3kXehEZicvMHhJatwBDWEJoagH
         F9oACMqvZH9nppWw939vd42XcQ2s/Fjqts1IdI1Wafa6sL7/omMrBRAimM8tEtADuCMz
         pV9qC19MeTYDTdJaB1MyCmhSKZjYlIVCEupBw+XT7ec4RRlyrVfGFsNzJzC/ImeAsR5R
         JjoM6Ul4YHLwF2vDKrdTHuPZccQTau+hutNr+eod+x7xE9m88TGgMTd1shzWiDJh+7tR
         RqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fN/Dl6TxJyEsFt6u9NU+sGC5XUURVMgjTKQkCfW2T3U=;
        b=jGwEqn/NPd9UU8sX1e7S9fS2DXhSJ90sW9+mYOc5tOTqbFwOY1GGC86DxkEdcCAa5I
         KAOHkoNAR9y0PBMIKZY1R5I0doDiRdFkf1NxrSa6auXKcSk2JmW3JuvFAGuvj2gKb0bQ
         d6va8RGegm2iWqEjQNwwaIVOHeFPfuO72AHFnkaMlHjlB5ymzDiAXu67q8VILdIuegnD
         QqtAPAJOpDBGcUKy35M3s2waWk62KIHSaHi744CbUVVk4x5aN4O9EVlAybA8XUkYeIGf
         ksN+KzJQ0FsgCA2bM0t7erFJDJAJOhQZ8DNIPOJZu35ked73T6qXjAAZraeck7r1iKAP
         xtsA==
X-Gm-Message-State: AOAM531qjKTDU+/aYq33IiG6YiEwtqp1CQCmOnC94laAwhMX+lUwlFbO
        m+QIXskNo6gZQQkrIWqx97xLY4m8ch0G/Q==
X-Google-Smtp-Source: ABdhPJwIQ//gQ7KWi26qOY7SvR6fhEiF5FLmJ878n5ss82BwHOI30ESrg+s5mW/82/sJ+68HVlTQqg==
X-Received: by 2002:aca:2b09:: with SMTP id i9mr2411519oik.14.1637723505553;
        Tue, 23 Nov 2021 19:11:45 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n23sm2789913oig.4.2021.11.23.19.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 19:11:45 -0800 (PST)
Date:   Tue, 23 Nov 2021 19:13:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
Message-ID: <YZ2t19wBLvuUVKfk@ripper>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123174127.2261-1-dominikkobinski314@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 23 Nov 09:41 PST 2021, Dominik Kobinski wrote:

> Add support for pm8226 SPMI GPIOs. The PMIC features
> 8 GPIOs, with no holes inbetween.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 5283d5e9e8bc..0f0102f38cbb 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1159,6 +1159,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	/* pm8150l has 12 GPIOs with holes on 7 */
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
>  	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm8226-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> -- 
> 2.34.0
> 
