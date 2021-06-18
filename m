Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4E83AD1B1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 20:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbhFRSEc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 14:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbhFRSEc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 14:04:32 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C037C061574
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 11:02:21 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id v17-20020a4aa5110000b0290249d63900faso2674533ook.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SU00HSVcuXHe68fMVNKSsQJqKFrTKLn9kQ7yRw4yRh4=;
        b=EBl4uG1I6rT3sLwVlbWwd/TBZWAp53Rl6zcPEoKxvQqVPCwduiMLKQxTHpCUAVkzTj
         f1UPPxmWyWp97dntGKGW1lZYDAZ3+7Rj5oQw0pRYJeSeAKfA9UruibmvZMsWx4kTWRWF
         20BlPZ2/WxJ1rOMqTIc7tzkQq7vRAMA22VEo1CdUQAx+4BcUy9i8v4eDzh8x7GFlVbKn
         Qvb+b2iWhsblJ8q0HqsiW/kSx5DTshEJlgV6BFOw/1J6jfSJvHWC6rebf3zT86N/NCMZ
         GGmwnC4j0nH4X0lTdaRk4LCbYruZD1CllvUYiNzg95Ve1MFiAN+fzc7xChN5+0X17EH9
         Bcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SU00HSVcuXHe68fMVNKSsQJqKFrTKLn9kQ7yRw4yRh4=;
        b=QCJfmKNVykaFyoIUfq5Cx+FmmGpSeqk4f5WbbKl1vk1JBLhpSdyLtWuDbidNVD9Lja
         QyyyufUqVmQ+G2yl/P8Jlca/z/MtFZOITpn5EC8V3VZ8abR8YYwnlgIap4x4yz/3UFkg
         AK+FW5IlW/RK+hrIguwsKidt4L/OQhNGsMHiKMVZEQi5eOsjaiNlVLcVIT/rU4MtNaHC
         NzH2e/jU9lPZIGVTZre6HR000FanJVZ/wOtNMjQ7Shj0a2kQzZO9GUJC0xojNgj/nF79
         NLySpstV01+LFuj/Nf6+Drc+mmbun1WwXTC0jQHF4IXCocR3PYweCqJy9LryWuZOKFfe
         6yXw==
X-Gm-Message-State: AOAM532NSvcMYBrNfxBbgLOV5AYyfJ1nIgyQ8QS3AvKglupMA7vrjETe
        CIxNs9AzRznKxjkW5qKbjOpDAA==
X-Google-Smtp-Source: ABdhPJxMORdk7V3phB/Tc6olkI6aTofet55nfR/InWrD/Zf0FYVDcRjyRshlmChw1rdw8pruy9k4/w==
X-Received: by 2002:a4a:9251:: with SMTP id g17mr10224564ooh.52.1624039340898;
        Fri, 18 Jun 2021 11:02:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p5sm1914066oip.35.2021.06.18.11.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:02:20 -0700 (PDT)
Date:   Fri, 18 Jun 2021 13:02:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/4] pinctrl: qcom/pinctrl-spmi-gpio: Arrange
 compatibles alphabetically
Message-ID: <YMzfqm+xKno7YDzw@builder.lan>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-4-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617053432.350486-4-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 17 Jun 00:34 CDT 2021, Bhupesh Sharma wrote:

> Arrange the compatibles inside qcom pinctrl-spmi gpio driver
> alphabetically.
> 

Nice, thanks Bhupesh.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 32 ++++++++++++------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 00870da0c94e..89f6147efe58 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1104,23 +1104,14 @@ static int pmic_gpio_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id pmic_gpio_of_match[] = {
> -	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
> -	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
> -	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
> -	/* pm8950 has 8 GPIOs with holes on 3 */
> -	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
> -	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
> -	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
> -	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
> -	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
> -	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
> -	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
> -	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
> -	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
>  	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
>  	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
>  	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
>  	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
>  	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>  	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
>  	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
> @@ -1130,12 +1121,21 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> +	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
> +	/* pm8950 has 8 GPIOs with holes on 3 */
> +	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
> +	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
> +	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
> +	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
> +	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
> +	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
>  	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
> -	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
> -	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
> -	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
> +	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
> +	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
>  	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
>  	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
>  	{ },
> -- 
> 2.31.1
> 
