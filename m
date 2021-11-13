Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A366544F49B
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 19:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbhKMSpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 13:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhKMSpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Nov 2021 13:45:25 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDD2C061766
        for <linux-gpio@vger.kernel.org>; Sat, 13 Nov 2021 10:42:32 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id be32so24990904oib.11
        for <linux-gpio@vger.kernel.org>; Sat, 13 Nov 2021 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QkrpAypr0OTjJ7opmeUn4VhkKZWdSv1cB+fyJgMkf5w=;
        b=WCPMm+i8ULb0yHdbEqnrVYTYM4jz2riuNptnwQ2+Xl3531POFp2CnU0ca4B3arM9Q3
         eUcF9I/HArOom66D2Mw27q03VzyNoZsAzf7KmSOBjE3EepLzPVwpX+XyC8v+kKAWoKC3
         5yEqIxsFU0eOIqIWicuCME8JTmq6AFAzRa8kKKN90dwGyMSy8AcGtUhYH4K1bB1XsClN
         gydBC/IjajX/AOZwj6CovpXp1OxAKZLPMBi3fzoldD/jteDoyUQ0+m+yQ04z+JQyKP/P
         R8Mv5CTL2SOkKBwLA9spoUppXncFcGwArs/KDuzTy5pbo+3hvs1PiX7EGUYFSi16nPyW
         PEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QkrpAypr0OTjJ7opmeUn4VhkKZWdSv1cB+fyJgMkf5w=;
        b=d3zGgr40KLCz2KppHbS1s7JzEKRbiG19N8MqKPER6c47kiLkmws68K3g4IIAgj0OS0
         sJlfXtG4/4KWVRC6OYTR5fHI4MgFsxzNJRTmCG+xloGzsQNLvTgGUK+lNunmbat42KBk
         Z3REwsv++Gmfep2r1TmuSKQ1Az//c8PrYFZiG/ilPtvHc6f0TQEkw5p+vmjxUfNxawJ6
         bdp+7E9Wug4L/brFqJBdLquPi/cKp2ytrSjcNcoWel3mg+CZa+sjDSdPl0iAP9/nT7eT
         pmV+l8Mc97iR3IwyGuWQ5vN/1VtPb/trzwEf6A4QdE8f1vqZpwAs0vYVZ+BelVVDw2si
         kW/Q==
X-Gm-Message-State: AOAM533lgOiud1ol8I9gP77kMnxgsbPaZhqxGObM0FCtC+LqZn9vR2lY
        8wsw30HZbscw7I81Z3cPWLK0bg==
X-Google-Smtp-Source: ABdhPJyMjHWSTAouFYB0Z4fwvsZdxvGR6yb6S9JvA6wYXvmlgN6wcOykJ9AGGJoNqtWoIxIiCsk+cQ==
X-Received: by 2002:a05:6808:14c3:: with SMTP id f3mr15685920oiw.51.1636828952074;
        Sat, 13 Nov 2021 10:42:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bn41sm1550547oib.18.2021.11.13.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 10:42:31 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:42:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for PM8019
Message-ID: <YZAHEhV8U5m1O6B1@builder.lan>
References: <20211112115342.17100-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112115342.17100-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 12 Nov 05:53 CST 2021, Konrad Dybcio wrote:

> Add pmic-gpio compatible string for pm8019 pmic.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes since v1:
> - Rebase, txt was converted into yaml in meantime
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 8952b4cc1262..55a46dec56b6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,pm8005-gpio
>            - qcom,pm8008-gpio
>            - qcom,pm8018-gpio
> +          - qcom,pm8019-gpio
>            - qcom,pm8038-gpio
>            - qcom,pm8058-gpio
>            - qcom,pm8150-gpio
> -- 
> 2.33.1
> 
