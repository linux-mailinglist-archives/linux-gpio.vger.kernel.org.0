Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDBB85B1D7B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiIHMoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiIHMoI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:44:08 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7CFF8279
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:44:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id nc14so37735298ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AFysVwqXPwSmyNou5N96ErjdmARWGi/0Oupt237msMI=;
        b=uCybeCcTku8n6g4oHBYwR7p3U4FHwSgHmalnBp68jNM7Xoxa1Xthbjk1TimxLMGYgE
         eQAa297RQHDVmPYwfdGVSr29Jbnnhnyv54Aix2MNN92Qb4wzkyVg+mi3fNNlcRtQ2YMD
         e0dZIOfAoG55krndLhZ7owZ1RiSueTI0DE7X1XwkQF+oNsT/XmHCY+slUAWdIf9zBk5o
         2spum6ALPJRZzLRnJJr/l3T1C8fCMbSuIu5NU1FS9JmkPBeVvNB/w9tk1tTGbQaGzbuL
         3madQIsLAYN1SM7rsgc+dRo1vERqUqUfyDpz6Ry9622fRMfA6VAejuq3cS/gSnlo4iSy
         WZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AFysVwqXPwSmyNou5N96ErjdmARWGi/0Oupt237msMI=;
        b=w/R79IJHcgqYJam0o+OJAD7hdljLtWKzSLK/vH+yrTaGaUvZpQebBTk676BxZjS/mj
         uRQ/2rcX8nDJgheWDadBYr4/VRJKny7RPttyQm4xAs6629o575uzotN4c/cQegAkcCdS
         N92CI3gXVH348LVIUsSobYwWMV9AsG4o0URnHxTIwgLlcsMBu0xkqiR5aVoF96k2kSbY
         wM8xLjgF+5jgL9iXgKK0NpsweCFpiqzd50XCX8rED7r2z0eZaCm9SuCKW2elreXn9jWl
         oFzTj49P1oDRI9FXgdjWppQyZDlVqFknBQpB/bYKkY1fA7tsUEeZH4EM4NJEa3pbq/Tr
         FeTg==
X-Gm-Message-State: ACgBeo0maFYczS90M0ELwkM8gsDO7uzD5f/eh7VNLaDglvsx2O+VH7v5
        EB0Gs3NzD6K9GF2cF0YEo7T3B+KN5Rxvbr6icMxpLQ==
X-Google-Smtp-Source: AA6agR7xjF2Pjv8QoUGRmTQZ+u8AN6zwBEZswuX1XckRzQrebrKA4NshF5Qu1mBpKVSo8JvxjlYCLjQ0e+lbXEohyFA=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr6043390ejs.190.1662641040948; Thu, 08
 Sep 2022 05:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220908053949.3564796-1-dmitry.torokhov@gmail.com> <20220908053949.3564796-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20220908053949.3564796-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:43:49 +0200
Message-ID: <CACRpkdaM+kJh0j22Dq0QXBC=6K4QVh0MYSbZp7vHLGcxqJNEnQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpiolib: of: make Freescale SPI quirk similar to all others
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Thu, Sep 8, 2022 at 7:39 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> There is no need for of_find_spi_cs_gpio() to be different from other
> quirks: the only variant of property actually used in DTS is "gpios"
> (plural) so we can use of_get_named_gpiod_flags() instead of recursing
> into of_find_gpio() again.
>
> This will allow us consolidate quirk handling down the road.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
