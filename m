Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB0A4B9647
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Feb 2022 04:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbiBQDDD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Feb 2022 22:03:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbiBQDDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Feb 2022 22:03:02 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E694107D85
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 19:02:49 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id w1so3534119plb.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Feb 2022 19:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=264PYqC2oOWi3miJ+ecseRecbPUhC48x+cyiz1xgeDE=;
        b=V8JbCcOleHHpCz0pBmoxh9jH7rv8wacYLrHS5P8XIGB1zRF2rDZvgYvNPI4eeqqBY9
         2y2WJ+n1CNWCmcjcBNVlTH/oaO2GORcvG2NJMMrmnaQW0FPOL1mS2HHiCyLRU7qW27NB
         nICRujx45TGZMDgIC9A3Mp6PHSBIBP8hdmETx+U6o6fNxQYdfDzxJuvonkwc8aahJjNo
         GBdRf6nTAmGP7S9/vnCF4ZLBSNMZDfH0aaSnVebd5GSnxTEo1NBrpWHezrajvMC8aRFC
         xPeAGO7mol+ltAwsi6Gut6KFQa+U1cty4vWiT/NUipTCmkGKQyYmTK36FkQIeBxYMelF
         pfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=264PYqC2oOWi3miJ+ecseRecbPUhC48x+cyiz1xgeDE=;
        b=vbcbVAbTsSjz36JzBud/Mh9RFfXwP5sqVWMMcRNT4Uf85uevBuX8yd1KaKvZ7l48zo
         eQxFbOcwDKgU+Ktr4tOuEwRTy15hvKoxbFf37KONwTw888XWJE02ZDrW9/6d8hDgcYLU
         LFDDNo3L7owRdg8bKo8I0pmh+GCoOaU0YiYnTWw/DX+R9WpdIWmEwKXwsDOfNPTLBW3Q
         gqjq4wwzapOR9v9lOCjN3mJw24adgCGSVi/MCulIv32ylCM1odfHrH04A/xKzNFuu3cd
         5Fz+z5yef/b3t+FfvEcJCEKQA8b/gkk9TEbIWZ4uMFv1/kHws9zVMlwNEdyX5MyVE4m1
         0n6A==
X-Gm-Message-State: AOAM53019Rb8o8xXXRVdE1iz/dk6TGNIYLjIZ8e7jwYSe4Bz7KekK87p
        wlKtLM65HQVqakXY26JlRWQ=
X-Google-Smtp-Source: ABdhPJxz1t0uM2b3BDpzIrEU4OEqh+BIKPXg4gXpevm2QHCfABcjX9hruZwCt42f37yfdDqfniiKSA==
X-Received: by 2002:a17:902:8548:b0:14e:e968:9703 with SMTP id d8-20020a170902854800b0014ee9689703mr950860plo.148.1645066968578;
        Wed, 16 Feb 2022 19:02:48 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id nu15sm420918pjb.28.2022.02.16.19.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:02:48 -0800 (PST)
Date:   Thu, 17 Feb 2022 11:02:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH 1/4] line-request: don't accept NULL line
 config
Message-ID: <20220217030243.GA8970@sol>
References: <20220210140745.1059087-1-brgl@bgdev.pl>
 <20220210140745.1059087-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210140745.1059087-2-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 03:07:42PM +0100, Bartosz Golaszewski wrote:
> While it was initially agreed that NULL line_config passed to
> gpiod_chip_request_lines() would result in lines being requested with
> default config (just like a newly created struct gpiod_line_config),
> I believe this is unintuitive in the context of all other functions in
> the C library not being NULL-aware (as advertised in one of the first
> paragraphs of the documentation) and should be changed to make both
> config structures mandatory.
> 
> This is C after all and it should be both explicit and spartan. :)
> 

Fair enough.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  include/gpiod.h   | 4 +---
>  lib/line-config.c | 5 -----
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 68130ad..074e395 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -173,11 +173,9 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
>   * @brief Request a set of lines for exclusive usage.
>   * @param chip GPIO chip object.
>   * @param req_cfg Request config object.
> - * @param line_cfg Line config object. May be NULL.
> + * @param line_cfg Line config object.
>   * @return New line request object or NULL if an error occurred. The request
>   *         must be released by the caller using ::gpiod_line_request_release.
> - * @note If line_cfg is NULL, lines will be requested in input mode with no
> - *       additional parameters set.
>   */
>  struct gpiod_line_request *
>  gpiod_chip_request_lines(struct gpiod_chip *chip,
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2ac9f5f..346d331 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -903,11 +903,6 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
>  	uint64_t mask, values;
>  	int ret;
>  
> -	if (!config) {
> -		cfgbuf->flags = GPIO_V2_LINE_FLAG_INPUT;
> -		return 0;
> -	}
> -
>  	if (config->too_complex)
>  		goto err_2big;
>  
> -- 
> 2.30.1
> 
