Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8C27004F6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 May 2023 12:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240579AbjELKMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 May 2023 06:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240581AbjELKMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2023 06:12:01 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7341171E
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 03:11:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d4so68580855e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 May 2023 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683886292; x=1686478292;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9FxWivWJPVbRp/nOJzpvmn588X9UgZWMKzBDTI7Mfnc=;
        b=dNJmRYkigUMvMB7lu+l44aLi+HUWM6ug0CERBaLjq8aWdPQwrBXMMGY4bkUSpEzqrz
         OwkAjUcuxAO0CjuAg7r1p6ux/XXcgBmY5R278KwS2aXTqdYM/tybvElKoFzPkc3Y7JZN
         huRr5GwVWOUubmQR4ULyy9q8eW+X93LbEBsiNXKMsvqE1TuIugabtiUxnSa6+FI8CvOv
         zXLwJC80n3+jcU4x6R4X/0EMS29BD6Ir4e8/3N6iOefMeYQlMXyuyawNZBaPpxK5370V
         PpNYGYd2tg9spvV9gZAFUXvBQnNC9Bdj2BRW5FPWvCrJ/XpFficE6mVheNXKBpYNJAE2
         xf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683886292; x=1686478292;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FxWivWJPVbRp/nOJzpvmn588X9UgZWMKzBDTI7Mfnc=;
        b=jHaKWcsjsEdfu8vetGrdcKB0bTxkcMDRBL12ey2kJ0ocqaCmWTVc9KeKCynm6r0m3o
         V9FVM/a4Y3m3LJlFnKzxN7AJephldHBrwZSFOTgyoRLNXfcx+U9cYFij1RUAVmKD697w
         YSar1sy3UlNLLAtX2PA8QMcq495oP84DSLAubPe5rwGY1YoIUXqRCBFmDEJ2oKKG910S
         trRCuhj6hWhhRLEC+4ZsDA/znPq4zEwlL+7aZLIfAqdKMDGEQZgs/3u/asf4gzbf6j7K
         rvpnQtyKuPj7idr8ikRp6NjCFfTWxdnroVMD5bxrQMk0bmMxf4ph3ASY3NQSvtPAFG68
         gVbQ==
X-Gm-Message-State: AC+VfDwUmnnTdrdH/nW1jTZh809PSiOIAl9w58EGOlGHaigRs2wwLGcj
        vSuJGPAf0jU1oC5JlirrRoy2rA==
X-Google-Smtp-Source: ACHHUZ7j69KRqv2NtHMhTkTSuUkDIdWyH6tbjMQVWglcosDge7Hizlm2MN7ZYZkliSfcHGo1acDLag==
X-Received: by 2002:a7b:c012:0:b0:3f0:9d1a:223b with SMTP id c18-20020a7bc012000000b003f09d1a223bmr18351406wmb.16.1683886292167;
        Fri, 12 May 2023 03:11:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:95e3:a02f:1d34:8191? ([2a01:e0a:982:cbb0:95e3:a02f:1d34:8191])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003f188f608b9sm28060105wmf.8.2023.05.12.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 03:11:31 -0700 (PDT)
Message-ID: <e2bd6ca0-ffa1-a1f3-340b-6522dacd099d@linaro.org>
Date:   Fri, 12 May 2023 12:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio
 group
Content-Language: en-US
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Yixun Lan <yixun.lan@amlogic.com>
Cc:     stable@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230512064925.133516-1-martin@geanix.com>
Organization: Linaro Developer Services
In-Reply-To: <20230512064925.133516-1-martin@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/05/2023 08:49, Martin Hundebøll wrote:
> Without this, the gpio cannot be explicitly mux'ed to its gpio function.
> 
> Fixes: 83c566806a68a ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
> Changes since first mail:
>   * Added Cc: stable to commit message
>   * Expanded To: and Cc: with full list from get_maintainers.pl
> 
>   drivers/pinctrl/meson/pinctrl-meson-axg.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index 7bfecdfba177..d249a035c2b9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -400,6 +400,7 @@ static struct meson_pmx_group meson_axg_periphs_groups[] = {
>   	GPIO_GROUP(GPIOA_15),
>   	GPIO_GROUP(GPIOA_16),
>   	GPIO_GROUP(GPIOA_17),
> +	GPIO_GROUP(GPIOA_18),
>   	GPIO_GROUP(GPIOA_19),
>   	GPIO_GROUP(GPIOA_20),
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
