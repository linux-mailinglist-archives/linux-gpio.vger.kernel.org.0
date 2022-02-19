Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B9B4BC3B7
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 01:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235726AbiBSAuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 19:50:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbiBSAuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 19:50:04 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA2327791A
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:49:46 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id w63so1471835ybe.10
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 16:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dmTl7PiGQWDi2UBFe3lzY73IjWBfZ+A84sNmAGVxFB4=;
        b=RXFZsklKObsd8yh7MEQurdFkxLWn/o0kcPNYO/fTlABVQehIGuOYe3fw80m9cCn4GL
         ncFgQobvuKZtiR8UxClZHyzRrfMaam4De8u7xZ6YfE3YXMxX7olxz5m9XBC6MOGJWHc6
         aJh0Rb+N/4MxzWV8bxb3al52ZwnwkOpiWWoO+ifvlPjo5nwA9/MAZZNcNampx1gCZ9U7
         ekWaz0+AGbak7/kzTfmvqxJ41DFFvMT6jhWF2WmnRygBH7xNgfuiR2Q30BWQgA03f21Q
         lH5N2ubqQYoIM2AyGlBvJIDvEc0Jrju2JPdZSUxo0lUl4Kkpy5oj88BtBc5c3D2xvF6x
         4YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmTl7PiGQWDi2UBFe3lzY73IjWBfZ+A84sNmAGVxFB4=;
        b=AHNweeRptbNsiwXbHPasJAsEZ/iKQmzr52moJSdNGKcu9C/A8Ycs5Sty9+FT/DNgR6
         rSCeqnQDlk5Luxyhw0WfY4PkOTLQ9eeHrToM6iKp/7X5A41rFIHnga/+ngZOaeLIIJ8V
         N5L2POF4sRo78+cF5uxFFArYRSFJ5QWEIXxCZmSqWeUfhGPgVaau5wDNwRG94KMRdnsa
         0RZ7/o9Brj9DwAFDfWrcYwVE+VEzFO+Ve+MZY5Gak3kue5c97LovJZkamQ7k7pez6EiQ
         z2CD3HrqegwN1GWUTrkSqR0nj+UqtYGGNXoXJXekKmCeelwO/RH+HVx5o1x2XyZC8NLz
         eiVQ==
X-Gm-Message-State: AOAM532qEEnoAlC2DrgPQFWObiml/sYyEuHZ9H+BTQPKMd//BaUfll7R
        QbAAmXDC/ROYlL/BmP2wtSB3EcOMqL7ExAUElcfPgw==
X-Google-Smtp-Source: ABdhPJxFl6qNyK0kcFd/U1ATKt7LJVdqrbAAolTb05a8JtEp1bMoF5YGi3JfbNwMmkOiCfCLJpReFMo+K7nqD9xmOaY=
X-Received: by 2002:a25:75d4:0:b0:61f:e671:7de6 with SMTP id
 q203-20020a2575d4000000b0061fe6717de6mr9586458ybc.295.1645231785594; Fri, 18
 Feb 2022 16:49:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644594347.git.geert+renesas@glider.be>
In-Reply-To: <cover.1644594347.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 19 Feb 2022 01:49:34 +0100
Message-ID: <CACRpkdYPSUzp-3_vRn=poVpO_OLjF28aA56abgZ0mGGgsejUSg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.18
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Fri, Feb 11, 2022 at 4:48 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.18-tag1
>
> for you to fetch changes up to 2e08ab0427fe3e33a92a37cfe3b6db340ab7397f:
>
>   pinctrl: renesas: rzg2l: Improve rzg2l_gpio_register() (2022-02-08 09:54:44 +0100)

Pulled in, sorry for the delay.

Yours,
Linus Walleij
