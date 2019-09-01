Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F837A4BBE
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Sep 2019 22:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbfIAUQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Sep 2019 16:16:51 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42613 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728850AbfIAUQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Sep 2019 16:16:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id u13so8926373lfm.9
        for <linux-gpio@vger.kernel.org>; Sun, 01 Sep 2019 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7pieDnEw7XexRSfOcC5t938V4PwFmYIdp3LSZsC7Nk8=;
        b=rB1FdwrDr6rfirZ9QCeEA/cWgDP9XY7t1qCikcklcNyOqg1lqlZA8QZVeT4hsijqs/
         KRC+WG0cf5Apck1uRguLJ9Kjvf+FUBVvU55b3e9jS5/DL1ulxPyXMZyKsB+E94X835Gb
         AL4t123XQ2zxXc1JQ7jU5yLz78Bz4gd8CrNqtmCavGmjLXFEEZ0wqigs4BWl5xXms4SF
         l1kSeUL68yacqJxmXICoJfwTWSaGoEqIAGZFVx4/7JAMqw+XPkupa8QQr50LJKV0ydfH
         +UPqhEYD35/rYU9CYn4knmOv8LZ2s8dn6pHKinuNXHLhK3TXrawaWE/T6WkNikyKjJRU
         4KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7pieDnEw7XexRSfOcC5t938V4PwFmYIdp3LSZsC7Nk8=;
        b=OsUf6kk1qwKoZYxbzNhiqU++YLd8q+CtDshX5ETMNpojA0j5WOkGmk4HvG/bhA7BV/
         bx1sDkiVCOrs3ekmSwXFku8SHx64DlrIYc7hU/XRan6fmGYEJgprdVK5QDy+fomBofwL
         PohiyUdnRJcxLDVGwUtdONuPpkLnlnakPNM8O/xmln3FFPFnSB6FPK7JyRi68iA+Pzdl
         7PFTuf9BMtc+lNUCri8vQcHZU8btsF5+141r5Lmp2jBbrwedgeN7sruNVtMXrKW2j5ev
         9XAcwewzbhYosiVdU5ti3nXiv+fI/X7R3fPWla/w2Kdb/DvFYN/Jb0wtHb0uPwr5zjY8
         Cswg==
X-Gm-Message-State: APjAAAVcJ0sjY+7WWv2T3I5NQdbKum3Jh497RNSyebr8a/sVbNprV0rW
        ElTpMv+uS3IbDoAp4QiOL0eeFbHfeBdWUhHGqS4iZNpUAFY=
X-Google-Smtp-Source: APXvYqxjhhDnVgjO+SgS9TAcycMvANIFXFWDUhuaJtSnkRomow72//GKwRuS0wEXJPIegLixrr1g4+9+m2goSxEoYiw=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr8825708lfy.141.1567369008844;
 Sun, 01 Sep 2019 13:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190831180402.10008-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20190831180402.10008-1-alexander.sverdlin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 1 Sep 2019 22:16:37 +0200
Message-ID: <CACRpkdaSwkRo2kWUMWNrtcLnT=2o5y9UThFZdmSD62pWairUxA@mail.gmail.com>
Subject: Re: [PATCH] spi: ep93xx: Repair SPI CS lookup tables
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Russell King <linux@armlinux.org.uk>,
        Lukasz Majewski <lukma@denx.de>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 31, 2019 at 8:05 PM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:

> The actual device name of the SPI controller being registered on EP93xx is
> "spi0" (as seen by gpiod_find_lookup_table()). This patch fixes all
> relevant lookup tables and the following failure (seen on EDB9302):
>
> ep93xx-spi ep93xx-spi.0: failed to register SPI master
> ep93xx-spi: probe of ep93xx-spi.0 failed with error -22
>
> Fixes: 1dfbf334f1236 ("spi: ep93xx: Convert to use CS GPIO descriptors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Sorry for the mistakes and thanks for fixing, much appreciated!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
