Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1276B7D6F9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 10:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730890AbfHAIKU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 04:10:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36169 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbfHAIKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 04:10:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id r6so73312180oti.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2019 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pik2VLxgJF0MkqYpYN5q7foTkrh5VpFoeFzQEo8355c=;
        b=T/8UmZhcpSsoLJOs1RyQYvHUl3/qy4AX6MeSUmKqqDjesxTYUBOGWJJz2QbZTan2EX
         yTLzQ2VIFcYDHjulhXNeghRV9lxellbZK3fUT1vvPN8ahH4CWBkU2pC3sEByq+xBnvhe
         FuL9nIi9+HbdKL3aW4UR/BCLNOXteIYyF1ba929PZbg/nUs9VO5V8hU1vlA1+GMaPOYK
         9sCMaybMR4D+Sc8LLnH3B7GCRJPtWy8pxXrcNCUanX+V0u8b29lmituVJYLb2spJi9LR
         pT4gkpo5HDEc9OwYUbaT8lcjI9k1P3GMC884R5pAO0Ip8SZRbF7MWzKbZhIWIuf7hJEp
         21/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pik2VLxgJF0MkqYpYN5q7foTkrh5VpFoeFzQEo8355c=;
        b=U7iUYtOBnu7XxWv0qOODVmfyqIKcTrvALY5S4vSxDxjyXltdONBJ+jajm4atjbve+S
         MV/4RB68igeZ26754S53cqBkUQvV+r72FVlobUfDmct8jaaUPd+fJlcEZqAJQDOjpseE
         /kfN3NL6+VOTQomNe+KZ2A5krvkOZldUgm3pDbQxwV5Y2w+5B2qA0VcUScb4Q3nmvyxc
         CE7L4mOp6oYz0GOaQJMlfKhliBUr7VxjwUf3TV7poamjeMRfIR0wUknBiYLyzyuB+ZFq
         CbehHOLcLp1f593LTPA13b3r0NJZZ6kODy+S/28zmoXgctwLtIS4YO1uMAc6hX3b4i82
         f14A==
X-Gm-Message-State: APjAAAWur5UarzzfP+ZymISVeNlad5nL0UQyCqw6kTL0H9tFXcao+Ed8
        5adgjGT1Zu4zfCDhLGi4xfit0l+HLXhNfqUlUzGHsw==
X-Google-Smtp-Source: APXvYqyq2AG2FvYnV0DnYaYHmZRiXJAJAcUqVXHjV59By04t/o/vV/Fgt/Utm53zt+aV/S8FJg1/hM+u/Lr/FNq50BE=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr32266009otk.292.1564647019336;
 Thu, 01 Aug 2019 01:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190731173814.3400-1-rfried.dev@gmail.com>
In-Reply-To: <20190731173814.3400-1-rfried.dev@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 1 Aug 2019 10:10:08 +0200
Message-ID: <CAMpxmJUvLNkEeFyNpZ0YFBoybNyp+Fqv8LUB7mpMweX-P26jFg@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH v2] gpioinfo: mark kernel claimed lines as used
To:     Ramon Fried <rfried.dev@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 31 lip 2019 o 19:38 Ramon Fried <rfried.dev@gmail.com> napisa=C5=
=82(a):
>
> In case where the GPIOLINE_FLAG_KERNEL flag was set
> and no consumer string is provided by the kernel,
> the used column was still showing the pin as "unused"
> Fix that by writing "kernel".
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
> v2:
>   * Restructure for clarity
>   * Print "kernel" if line is used by kernel.
>   * Update commit message
>
>  tools/gpioinfo.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index bb17262..ba0327b 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -119,8 +119,12 @@ static void list_lines(struct gpiod_chip *chip)
>                      : prinfo(&of, 12, "unnamed");
>                 printf(" ");
>
> -               consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> -                        : prinfo(&of, 12, "unused");
> +               if (!gpiod_line_is_used(line))
> +                     prinfo(&of, 12, "unused");
> +               else
> +                       consumer ? prinfo(&of, 12, "\"%s\"", consumer)
> +                               : prinfo(&of, 12, "kernel");
> +
>                 printf(" ");
>
>                 prinfo(&of, 8, "%s ", direction =3D=3D GPIOD_LINE_DIRECTI=
ON_INPUT
> --
> 2.22.0
>

Applied with indentation and alignment fixed.

Bart
