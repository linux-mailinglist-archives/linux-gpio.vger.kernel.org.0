Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAAC7BADE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 09:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfGaHot (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 03:44:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41307 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfGaHot (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 03:44:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id g7so50019285oia.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 00:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tY4C8N1yvrWy5zvFUsCdMOwzJtjG/sN2A79KXNFgc+E=;
        b=BJuLMhmvbyJDe/Gt8jlMsWYLaydiaadTwgoNZEaUMTAyoX4plDlL2RQLT6DhaawlF5
         phx4wX+BHjI0dIPFOJcFCwFzPZQD5cVRe/OjQQx7YEFQOoNtP8lYT4gvtnZgIv6+l8Gq
         3v8tagXUyWIQoCKflXJZTaDp3q3pywhaAJBCFDYlryzeiRc0eY9WH75AikEPRuHMB3KT
         3ZaFTeitaTro1cLxmgUpWqQA5oBUWcjp6F6NptcE39UScJcbS/j96XPf3qqnO2ap93xl
         jpfq+Wcnks45Y5G6IJ5gQcPsGx2102KGN+RJ+d1McC/bbaNB8BiSwmkRxSvNvldr8CfM
         nm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tY4C8N1yvrWy5zvFUsCdMOwzJtjG/sN2A79KXNFgc+E=;
        b=Kv2gwC7UAIsBS7UQ/kE1N58MoWZZ2teXU8TxQehNWkhZw+2u0A8vXp2OM8H8VPL70G
         6rBADM3Ko9VD8K4PI6ylNKPGMIPbCpa6xCJA/3c4Z57izL7zmhDVCFqYUsfYfDfXn5EN
         62UiScgbTGWqQ+EBI7LtaHkdR/3lLscSQzpWAJBQsaMW5hVfJGHj98FnLPTMDtqMFOWS
         DpsqnRNGUO7TrF00HMvdqBly7WSXsM3mWst/dqy/dG8jis15p1qNcZKjys4u1yDCfIJh
         a+prn8iqdSyg0WJcktzUjhuQtNY23m+ryRfIx8Hsm5Wi1IDuPrBYI6S0KvgkvgHREFVR
         LeIw==
X-Gm-Message-State: APjAAAVoP5k8o07WGIK3gZmdtQQgMn/qLzlL2ud+gdEnn3GF+8AF6FBb
        Ym0HY+pzd1TlcIXcRlLAmF4QqXmYVizIQf9oRX7hMA==
X-Google-Smtp-Source: APXvYqzsasnAti/ZThAfaEOhlhXDXJ/pP+IBHU9bSNp3C0A35bND8r2JgNP8MGrOBDOU+t88YiDELAZYk3ypZrqoIus=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr3219966oif.147.1564559088239;
 Wed, 31 Jul 2019 00:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190730190410.24786-1-rfried.dev@gmail.com>
In-Reply-To: <20190730190410.24786-1-rfried.dev@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Jul 2019 09:44:37 +0200
Message-ID: <CAMpxmJUXbxjGqaw+qTiwvAKicjC-MC58BOr6_hw-L76JHWOg0g@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH] gpioinfo: mark kernel claimed lines as used
To:     Ramon Fried <rfried.dev@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 30 lip 2019 o 21:04 Ramon Fried <rfried.dev@gmail.com> napisa=C5=82(a)=
:
>
> In case where the GPIOLINE_FLAG_KERNEL flag was set because of muxing,
> The used column was still showing the pin as "unused"
> Fix that by writing "used".
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  tools/gpioinfo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index bb17262..85f8758 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -119,8 +119,11 @@ static void list_lines(struct gpiod_chip *chip)
>                      : prinfo(&of, 12, "unnamed");
>                 printf(" ");
>
> -               consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> -                        : prinfo(&of, 12, "unused");
> +               if (gpiod_line_is_used(line) && !consumer)
> +                       prinfo(&of, 12, "used");
> +               else
> +                       consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> +                                : prinfo(&of, 12, "unused");
>                 printf(" ");
>
>                 prinfo(&of, 8, "%s ", direction =3D=3D GPIOD_LINE_DIRECTI=
ON_INPUT
> --
> 2.22.0
>

Good catch! I think we can make it even more readable by first calling
gpiod_line_is_used() and printing 'unused' if it returns false and
then checking the consumer string.

Bart
