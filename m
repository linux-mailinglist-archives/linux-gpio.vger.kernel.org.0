Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4730160EF1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 10:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgBQJi5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 04:38:57 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37652 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgBQJiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 04:38:55 -0500
Received: by mail-qk1-f194.google.com with SMTP id c188so15575612qkg.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Afwt3f5haicc54NjifQPcLwy6vygZPMQ4dpzw9cQKTs=;
        b=0FeSRJlLGZWcE4RRPtM4gSIGicjoUxKa7odOoqFd72hdA+O7Xh2FTW49Fm7Lpsu7Mi
         lh9RJGPKS+YWQzILdfhjbg2+ReSx1iyh/T9kJ1u7/SJZ6cgpgnWRAj/aO1VsoeNMHsj9
         4tbh6ZUDZ9kxXD6jidbjINrLnHYHzPbiO/uF0q9hQWRzKnuE0Gdv9DEGu6I1nZCgpBMa
         IDiuVxZw031QBeoBhdhzfbPD6PdckAYJJjHUP5h4WH7M5YpAij0mqLKV58ZdYBbzUb+z
         GTs0x/6AOtVfey0ERi+0yuJiGWyYX9Lk6Tp27N3EfBD+oPIIYXmO6rJ9UttLRpQc0KuK
         8KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Afwt3f5haicc54NjifQPcLwy6vygZPMQ4dpzw9cQKTs=;
        b=IlWfrqhO0gh1DwNaRXplXNMZ4vJV3sIXZAtm/5plWon3LsR18TzllF2oh2BE+innqa
         EwFCMVOJV9F6typNQWEOa1pLFfKTxHfbMhQzizi4f/EAksNxw8XDa8j8igCLk8irnkDP
         jbHvdaJIK4LxWhKmYLldNDr4UubkWfWzsLkmzSP9f9iE9PPvcNvSd0aSHfSJBfiIkxwf
         M9/KZnp1aRR+CDxRIIvboAdZcSFsHae2ycJ/VnQlm2N5C6/eexYlIpU/ylQa65mg14j3
         R6NMIvEGMGHVE72bfSfvD/wvjGSrTyLJMnP0DmM8/Bb+h5pk9W39cixrMl57JjggabY8
         Q/fQ==
X-Gm-Message-State: APjAAAXYTQ8rNp9BFrz+ILBup3/obY/BWQ/R9mQt3q/1W+ID2R/4diS/
        dn/a1nK+sdwKb8JBIlSlFeQhAvgtUGmxIDyzJJrUQg==
X-Google-Smtp-Source: APXvYqy/AKGSo15DXUV1VHmJaTP8/sfbAtmwyM6qsJnZ0s7CRGTWMHJ7xZ5b5fHI3a6UNJekH+6m3F9i4rgssApSRAc=
X-Received: by 2002:a37:8343:: with SMTP id f64mr12901966qkd.21.1581932333854;
 Mon, 17 Feb 2020 01:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20200211210618.GA29823@embeddedor>
In-Reply-To: <20200211210618.GA29823@embeddedor>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Feb 2020 10:38:43 +0100
Message-ID: <CAMpxmJUDG6xq2qUq6yDRQQjbZGsjTTbDUCN8hGkiQwGZk=z05A@mail.gmail.com>
Subject: Re: [PATCH] gpio: uniphier: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 11 lut 2020 o 22:03 Gustavo A. R. Silva <gustavo@embeddedor.com>
napisa=C5=82(a):
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2]=
,
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertenly introduced[3] to the codebase from now on.
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied, thanks!

Bartosz
