Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5804C1867E0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 10:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgCPJ2x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 05:28:53 -0400
Received: from mail-qv1-f42.google.com ([209.85.219.42]:34202 "EHLO
        mail-qv1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgCPJ2w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 05:28:52 -0400
Received: by mail-qv1-f42.google.com with SMTP id o18so8403675qvf.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2020 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SlnHcEUyAXhhBJTuxvcx5n9cVWT6MWBEtfmnj6NVAkw=;
        b=xCBTTjg7+2+l/sXdvcUuVTjFgeY15EPF67ZSsmNlr0RbLQ6WG2awltClbyDNN9qsWc
         LJIZ9jy8TF6sDix0G3908K3ARc/4Zgc+HprhfUnODXb8Ca89J/I4OiHyc9kJ7jHy4fxk
         LNJokixn3Cp1xu27cWtiOURlz8CG7UEkcnACaW1xl0DSids4SVm8AMlACzlS5qNtSTu4
         dFd/aANQ/b9daRAajrSwTv2R786pJwT0sStgYdWbC4bZqSOCePowSnIgFy8d93Twst8g
         DWja+bf9MDG/MCKQT+3X21tuMC37OUZ/cDuU7q/O0E+praW5C1xSCBJB1+nLBURttyym
         mElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SlnHcEUyAXhhBJTuxvcx5n9cVWT6MWBEtfmnj6NVAkw=;
        b=cAfJq6s6v6PznGG8o7bXH8uOtw4srBe7lhPFNOJimEjI9iae5fwpIFOqWRAGZEpITB
         WTWEw9cwFazVFa5eam9Tz6zvxK54Wx2JLUpA2fgjF6T3UfanZnqdSo2CkJ/JG/yRB25t
         ujSMdLn7LYXaqkMAMWZDi3dFCQD5VUTOkcCGHrFkseWmdINd5VyuxGFLWrNv+reKkIw/
         YpV6Ho5zEpzf09fbQkJ5zqgnvUI5leTGebrSNkr1dhWKiuPQTsII7aCNE/3xPOa36++Z
         qL6mOUVT2sj/3b97kKCqDporrXOBkvQ8cOoix6wFifn5o5bY+pn9GyKpl5btWOtfZg7H
         533g==
X-Gm-Message-State: ANhLgQ3u4vOh+c7UQyfbafd8oELI+qNz/JlWXAX+dtX588qx/eyAhkM8
        DdVo/NCDSp1ZMCbqd9N4pl1giSPWEzeNLgFfbWt7Pg==
X-Google-Smtp-Source: ADFU+vv9/MKP80W+Vi0dxJrqEXaWFhKiMZB6p3ZHnw6LAmw7NOyop46daJwcHltOfC98RD2Mcmpi+oZ9pXy6EOej54A=
X-Received: by 2002:ad4:4a6c:: with SMTP id cn12mr21012782qvb.148.1584350929335;
 Mon, 16 Mar 2020 02:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200316092340.114125-1-colin.king@canonical.com>
In-Reply-To: <20200316092340.114125-1-colin.king@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 16 Mar 2020 10:28:38 +0100
Message-ID: <CAMpxmJVxPzH1rhfKrGMHWAyKiPAy3CSx9xJqjw-2nKzy=-8ccg@mail.gmail.com>
Subject: Re: [PATCH][next] tools: gpio-hammer: fix spelling mistake:
 "occurences" -> "occurrences"
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 16 mar 2020 o 10:23 Colin King <colin.king@canonical.com> napisa=C5=
=82(a):
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/gpio/gpio-hammer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 083399d276e4..28d2329e83d2 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -153,7 +153,7 @@ int main(int argc, char **argv)
>
>         if (i >=3D GPIOHANDLES_MAX) {
>                 fprintf(stderr,
> -                       "Only %d occurences of '-o' are allowed, %d were =
found\n",
> +                       "Only %d occurrences of '-o' are allowed, %d were=
 found\n",
>                         GPIOHANDLES_MAX, i + 1);
>                 return -1;
>         }
> --
> 2.25.1
>

Patch applied, thanks!

Bartosz
