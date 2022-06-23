Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F18558A95
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 23:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiFWVTw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 17:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiFWVTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 17:19:51 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C044BB8E
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:19:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lw20so810582ejb.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rxx2ERVUzQYhxca2KqEVLppX3ttabieQO09Wa1mDHGY=;
        b=IBscLo3+Cxr78JdPil2JHYHj7z+Q3Dj6JWNtJmv5tKJmtegu8Hj9WoOr3Mp7Vq1dKN
         0ZZOH2ormnM0dPF8oCpdXzB6dPWyvO1TmFnp8vDvh4+g5LPrx+NeuVADtu3RwJJzvobX
         ZIGgL7fIgWH79C8H9dBMT/tmDLD+7BJLUSrsrHT+2dUtQ0nSdX+/4e4O3u52AKMZsO+Y
         E8ndKq7AbCtwngFqkbFco9mwSFKhRXV1aX3r6Y5/yAN2pIxwiNhrnGbyxko9Gm7CX+iR
         zhQIyhxwYQH3VPr/Q2Pp8+WIqBkvfuClztVNuPgRy137i9+1DVHHe60b/Pwq/VJ8rpmJ
         vTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rxx2ERVUzQYhxca2KqEVLppX3ttabieQO09Wa1mDHGY=;
        b=p3Gla/R/VHxKwjzEgIbckWEaoPfI8Q1oR1QLQKIyZNyU9GmLSw7p2qOoKIu/AgtgcP
         haEBhNrAMAMhRB+U+e+muS6xK2LFbUKBHVC9K1UpfCaqBa6Q178HzWyJ3YrAQdXMjl3h
         hKgDd6ZWm+Eu5qJqxHC4Z8AwtoiKmiw2uoXj0bQ1R82W35+HYU6dgAYqWra3WVtEbnmj
         SOe/fIJ2c9bsrXjt+ME0vobDbCZeYDFjlRKVhmqBDbAwwf0COk4rStCXAZkJllfaq/FE
         LDK590Uti9qKTAdbY7wNj85eChb9P6TnfWTevgqWIDUreXmZDWviEyskQir7h779xaz9
         kIew==
X-Gm-Message-State: AJIora+yaS+l91hIHH1imsXaMCpZTEJtKiPf7Y7bxs7u/1ksxt6jqS/i
        l/bUrkA+beMoonYfGaYK1QNaqs9ZZajrVlFh8nha1SI+e8bZEw==
X-Google-Smtp-Source: AGRyM1tpUV+PQ75SPXMIbT+FHnjeIWZ5pHwsr0IWaEjswGbZrA5K4PgDmWEFS9J5snnT5JMyHtVlT0Fk1Cf+W1EOFVU=
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr1854809ejc.101.1656019189549; Thu, 23
 Jun 2022 14:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220621063524.146604-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220621063524.146604-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 23:19:38 +0200
Message-ID: <CAMRc=MeVr-8=dvk7RHQnwETxGuRuwvVb9D2ixUJ3zvV0t_q6Sw@mail.gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Make .remove() obviously always return 0
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 8:35 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> priv cannot be NULL because brcmstb_gpio_probe() calls
> platform_set_drvdata() with a non-NULL argument, so the check for !priv c=
an
> be dropped.
>
> Also remove the variable ret that is only used to hide a bit that in the
> end zero is returned.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied, thanks!

Bart
