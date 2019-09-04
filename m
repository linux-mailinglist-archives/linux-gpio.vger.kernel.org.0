Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8296A7C39
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 09:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbfIDHCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 03:02:45 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35982 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbfIDHCp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 03:02:45 -0400
Received: by mail-ot1-f66.google.com with SMTP id 67so8082279oto.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hJb8C0XxHQ+BPdFitXGai/GvOOBT3Zt2EUfRo7xRmzs=;
        b=a4yHwUrxocYrJolETfDC/dVE5GboZjW8JiuE3msRZRCguq5K4r/1oDLfRqaoJmbSH5
         cZI/QYpDHXUrcZotRjrf/trcRlqB8ltA3kJK6DjfGFk3hmeG+jXApv3k7ApeIlJO7AFR
         u4xiR3hK90QpFCVn6HPEsug1s8QSoJBV5XzlMHywHUadBrAyy3Q+bmm3Z68VXeZH43IC
         BjK6Nl3lnDt6qR04RYGBn0zAQ+XvmjU2z9x2H8MgGPQSsPdLycKbhOhmph0C4YMPDCw8
         0RfbGDgCXiPYDnO8jlo/vKaMVj26uIkvRHpk+oocjJrN6gwqA2WzgWoxaJXQX2evtFw3
         3gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hJb8C0XxHQ+BPdFitXGai/GvOOBT3Zt2EUfRo7xRmzs=;
        b=R5iHRFist8GQQeTzLpANMcaNa6EFDzMAvzoT+2IKdAZ5nUpvI/TIa+SaJDeqQwxbjl
         P8T1I3V/wfrbaX5kXexYcD/gY1smhzdN5WKUEaHLzKwOSohpZrFcSey+hmb9OEWvzb4A
         yXsb9Ug1xJAtoHiuIZEwKY8cepn0gzXMZ/2EW4H8tr2GEIr0AL6TVffaWJf1NurGBXUL
         sksxZTdWwcbaz/nv1qU1RpkuZcLfuze+umX8RniYh2eygEAUjf4IT92CdPkyrKBnx7qs
         gUsD3HQK82l60/WCTQR8OI/bAIf3u7eH2NNBH29TMqHLBPYdT4AlZARM6cFQ3XZqZ8y6
         gvSA==
X-Gm-Message-State: APjAAAU2vblVU6bgYwV3lIrNogJCZTMbHVEnQ+e1eryHCD0Qs+BgY0wd
        T3TCQXdg0JvTS3KDXx5XMDagJ53kk8lbDjuYa8/KrA==
X-Google-Smtp-Source: APXvYqxxks9djuMMHQfVLolM/IUn9zgO3O4jtGuHuSO1CHv6NW5x0Jn250yoKjvs6bRFbiPnut+ChZu3saOUiE5+Idk=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr15201774oto.250.1567580564651;
 Wed, 04 Sep 2019 00:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com> <20190904061245.30770-4-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-4-rashmica.g@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Sep 2019 09:02:33 +0200
Message-ID: <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com> napisa=
=C5=82(a):
>

Again, this needs a proper commit description and the subject should
start with "dt-bindings: ...".

You also need to Cc the device-tree maintainers. Use
scripts/get_maintainer.pl to list all people that should get this
patch.

Bart

> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Doc=
umentation/devicetree/bindings/gpio/gpio-aspeed.txt
> index 7e9b586770b0..cd388797e07c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
>  -------------------------------------------
>
>  Required properties:
> -- compatible           : Either "aspeed,ast2400-gpio" or "aspeed,ast2500=
-gpio"
> +- compatible           : Either "aspeed,ast2400-gpio", "aspeed,ast2500-g=
pio",
> +                                         "aspeed,ast2600-gpio", or "aspe=
ed,ast2600-1-8v-gpio"
>
>  - #gpio-cells          : Should be two
>                           - First cell is the GPIO line number
> --
> 2.20.1
>
