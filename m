Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80515A7D7D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiHaMgY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiHaMgQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:36:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3EC7268F
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:36:02 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so28026346ejb.13
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mG/N9H7N7kGHmNYHeRjUkuKbANvcYiUIAR3Dr1Ezb9E=;
        b=QWsmpfcrzS4uBY/x/y8ySg3Jngx/QQDEXIwqAsZZO/Jt+XFs1fbjzgMiPPhM7yBg8V
         IMCm3RHBgHiJ18uTVo1Vy2TaELyt94v8D7h2gZQP6azY8qnRHiIbFqAP8xoTRK4+a919
         J5ZgKoKlmfUNZHnPESVXPhfuUSUiUGCHbiYh7ZKrhi7V5dE8Jiyb0us4Te9cb/OaG9vF
         Io01Xu1QVlhBEhITLo0xC+BHMslE6vi0IIly4+tq2a8tc069xtrC/t4e0zN+Pqn6K3YH
         Qz0a5O44nnyufd+Faqe8mI7zI2AFp1yyZwmCQ0S+BAIaEgEhGHLguFQmj3nAiLBl1qap
         rmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mG/N9H7N7kGHmNYHeRjUkuKbANvcYiUIAR3Dr1Ezb9E=;
        b=A2/F0YitlxkNz2CEAwMewXuWowoWKJQ89Dc62hTw6Oh9xhaMF3NQt7lg8tt2cZOvKG
         eW+/cmaSEaUHIgQZ5zzGKQquYhqVSRICwUp2vPWquH+RX1zjWHpOjN5o6bsq+JbiE5P8
         oz2y/Kj37U+aeuyfip5Xhp/rg0oiozjkxzExipCYLXYY04K+XxCpaHwOVJcqf+XmHm34
         QF/TJyDH7y2sfLFmNIVhUP735/EuYJmPxQje0sLlC0bmx/vitUsyYrFxiSv9CoSsSmKX
         99lSOY/uyG0I+qWVhgyGYc4K6ZYmDXd/2H6f8igb0gcUIuezEIMta+FXx02UF0jy+GWF
         pe0g==
X-Gm-Message-State: ACgBeo0CCTQGHgD4MDUROYRGUqUYDypwEHmbOdiUT/ojYEDrSSrFfsnm
        pAsvFufr5uR3QPJ34tx9qJTC+CTOKdVdpNYQ4ZYvmhCgNjo=
X-Google-Smtp-Source: AA6agR5bN2Dbz0kVxrTp1GiCaSy9g8Pc2+zN/r+ZRXRxoNRuoOd/XtjzBVDMZlDP+39DxuZBJ6vHY6eriU1mq1q7g0k=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr20605961ejc.526.1661949360236; Wed, 31
 Aug 2022 05:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220829133923.1114555-1-martyn.welch@collabora.com> <20220829133923.1114555-3-martyn.welch@collabora.com>
In-Reply-To: <20220829133923.1114555-3-martyn.welch@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 14:35:49 +0200
Message-ID: <CACRpkdYvPKfvoFdMQYCjOWZYXpygkc_nWNFV0-zCCbx7=xGcPA@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: pca953x: Fix pca953x_gpio_set_pull_up_down()
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, kernel@collabora.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 29, 2022 at 3:39 PM Martyn Welch <martyn.welch@collabora.com> wrote:

> A previous fix (dc87f6dd058a gpio: pca953x: Fix pca953x_gpio_set_config)
> identified that pinconf_to_config_param() needed to be used to isolate
> the config_param from the pinconf in pca953x_gpio_set_config(). This fix
> however did not consider that this would also be needed in
> pca953x_gpio_set_pull_up_down() to which it passes this config.
>
> Perform a similar call in pca953x_gpio_set_pull_up_down() to isolate the
> configuration parameter there as well, rather than passing it from
> pca953x_gpio_set_config() as the configuration argument may also be needed
> in pca953x_gpio_set_pull_up_down() at a later date.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
