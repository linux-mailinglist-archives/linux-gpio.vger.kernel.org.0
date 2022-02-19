Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED624BC3BC
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 01:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbiBSAwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 19:52:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiBSAwU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 19:52:20 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEAA60DA4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:51:59 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id y6so22724985ybc.5
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZERxTao1EUuWMzzDi/vYHpo3Twkxo1kAiV8NaUj/Hjg=;
        b=r5YZjxy29l5GyV8+/lg7Tblm7F6aI7BnhzN6YZzVb79MPcrfm9vcxLvQx4zaE5QnRp
         Z1clkJ0Mn7TTKxuWQOY2x0nxuU8jU8GbgDdd/qoupbAmm7+60oUKpvnAFkVlVHgyqQGo
         uEaDNsyeC537T3TQBg76uIVnpAP6L8IUPYBXYuCEqE5N8SrL3hJO2ZCyOhXUXfmIx+D6
         K1mswYo31TsafAmSExGxh/Z1cd8IphItDu56mVo7rKTiJGluah7F7MFTeZfkfyJg/n+m
         K3IVoOQU5Nt88t7SxXaWMl6botVLxImkEdOG9BPQ4JMX1pl8xVhYnN7Da4mDlk99B6rx
         Kgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZERxTao1EUuWMzzDi/vYHpo3Twkxo1kAiV8NaUj/Hjg=;
        b=ytb484GbKZVlAp5iS2wQPgYGBXaYNtZu3K6gab87PLE5qRGxgBa9QWciD2n4ziD2KC
         bI/ZRd4fKMGECNCodaZaFoORerRkU33rn9IE2qv94YvYxCMW1YVFQ9IZNxGjW3huerOL
         6c014uENSfwnByMUAhwNSNtLmAhXpGEfs2lRhEw55cajBMu5ro1zpO2G9mam6/LUeQ9T
         ovZFp5/Gd31e68HW68GWbvGaoD5m6IJxzkVZE/1qaEfFiTIdOwmefJRMLyAIN6cixoOR
         5MAXv+LgplyIP9ANLa08VJzGjG8RF0wZ9g9NFpyMWUFSiyEWYKpCZ3xIc/2JumKK+vVG
         Tx3w==
X-Gm-Message-State: AOAM530vdfEcxvLMd2rm4jF2Eb5VkhT+Kf5gWHWfjmjQ1nSfHlxd7Fg9
        F/ZyYOC+K4jiZmyw8V+5FOu2m0VvrxGVt80Dlmy9NQ==
X-Google-Smtp-Source: ABdhPJx5dbUyAJKdwCW0sPfFT+zNXctXTnBkdYKjhauaCWRvBT3/pRZOXBeCXlWylmC796XDwPuRQTTHcDBb7uSWY3U=
X-Received: by 2002:a25:bb91:0:b0:5ff:d80:b567 with SMTP id
 y17-20020a25bb91000000b005ff0d80b567mr10100855ybg.514.1645231919125; Fri, 18
 Feb 2022 16:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20220211093904.1112679-1-maz@kernel.org>
In-Reply-To: <20220211093904.1112679-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 01:51:48 +0100
Message-ID: <CACRpkdb0OPqNZRbJH9EtQhVCgcfGD1EuGtEPucOGhxR+tEPr8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Fix chip_data type confusion
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel-team@android.com, Thierry Reding <treding@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 11, 2022 at 10:39 AM Marc Zyngier <maz@kernel.org> wrote:

> The tegra186 GPIO driver makes the assumption that the pointer
> returned by irq_data_get_irq_chip_data() is a pointer to a
> tegra_gpio structure. Unfortunately, it is actually a pointer
> to the inner gpio_chip structure, as mandated by the gpiolib
> infrastructure. Nice try.
>
> The saving grace is that the gpio_chip is the first member of
> tegra_gpio, so the bug has gone undetected since... forever.
>
> Fix it by performing a container_of() on the pointer. This results
> in no additional code, and makes it possible to understand how
> the whole thing works.
>
> Fixes: 5b2b135a87fc ("gpio: Add Tegra186 support")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
