Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44476B73CA
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 11:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjCMKWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 06:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCMKW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:22:29 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4422333D
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:22:28 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id u5so2734000ybm.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678702947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4g7R1t2OTQs8pOXwFzvQy5WHWdsd47e9TkQ3heRM1vY=;
        b=RbX7MHAQr/Xs64jGRl3j6JEeb3QPtSXcZY7gnmgEwPXJ9m+f5dAZ5Ukmou5VnnfU/U
         FDKnsIJlMueoHAVx5HrJbp2lUAzF1oHkotLdxJ49CGSZ50DbkqYwspSpoc6/L5zqmdFi
         EbuqOfBB6yQoQoIbSaDh5OX9w4qMjGh9kB4+SFaf7NF713Up8BgzYWmUPXHcMrWs7t4Q
         K2VccjPCqfAHkOeQmUIL4lgZi8WA7FoZ9o9VL7wbfkVzl/AK10c0KMa4JAYIdnNqS0C2
         dGjqSlfhP3z0tEsqZXnc5G8Rt0tweZoEqBu6wqGHJRNWfsRX9X7wbuMZDXguV48mXyzw
         u79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678702947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g7R1t2OTQs8pOXwFzvQy5WHWdsd47e9TkQ3heRM1vY=;
        b=dVomsjdx7bmE0O+i3PLdOVNsJKMh0IrUzr8A32i1zA1l+LAsafN/TtcoG+OKjQn2zY
         NxfpAZR5fPTEI1U09Ke5KHw3A3tBJKzC+u+jCtigW89sAJlNjRQJAXQOg18rD0Nf3pEn
         GTH5HBe0xtlar5nrFEMAGwNgzid1sjqkMt9rbKwwZC65qVGO3N5l/tsKnFT/m/YUmJs0
         wv6SwCUzQrYRFswR6PWAIzgRQ84NHeDF3mX0FFAWby6mZW3xV28T3uqnaNUg3eDC1e8b
         5/LcoAhMyvgRMoO6ABWIt3FI2jUX0OTvdxJIe58ZKr2V1P1b/X/DyUy7hQVk8CivnPUY
         oJCw==
X-Gm-Message-State: AO0yUKXp+Sj5G2SPpvNa/n5KBS0CigtXJv5uMbWdyIxRLMUtULcA2Ids
        G3iTXqawh/Na7Ooto0DmO2IWExDVpRcT6kfsfRk6Ig==
X-Google-Smtp-Source: AK7set9dov5WH++hdm7uCv9x3UuXw2WfyW/73QltGgU6ccYlHFKf3Thf6zECeKp8eZ0YvBYtEGoOi8UUznUvb5Xzwwo=
X-Received: by 2002:a25:9f0e:0:b0:b3b:fb47:8534 with SMTP id
 n14-20020a259f0e000000b00b3bfb478534mr1677158ybq.5.1678702947746; Mon, 13 Mar
 2023 03:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230216-gpio-at91-immutable-v2-0-326ef362dbc7@kernel.org>
In-Reply-To: <20230216-gpio-at91-immutable-v2-0-326ef362dbc7@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:22:16 +0100
Message-ID: <CACRpkdbkcBEh-UT47hDcr5Kw1rJzpfd24B-S6T3argAS1b1S-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: at91: Minor cleanups
To:     Mark Brown <broonie@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2023 at 1:51 PM Mark Brown <broonie@kernel.org> wrote:

> A few cleanups for the at91 driver, making the GPIO irqchip
> immutable and removing an unused member from the driver data.
> The driver is still using statically assigned GPIO numbers, we
> can't just remove that since the driver itself is still relying
> on them even if there are no longer board files for this
> platform.

Patches applied, thanks Mark!

Yours,
Linus Walleij
