Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E42223A89
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 13:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQLb0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 07:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgGQLb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 07:31:26 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F3DC08C5C0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:31:25 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k17so5823142lfg.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNEkiDjRHZLjrSjApuNKMS+b0w9T6h8fgeM/XXNJlU4=;
        b=AM9BWjcv98+KZlbVQQnp9h2/TAR/8qQnvV5Me7RxUOcqk3A6uzv3LmPAvD2USaVUEy
         cLe8NTPN4dDUf5T/T7QQbIIKd3VmiF+zuwcRNUqeSpMP7glwqZs2XAbDC/2H1/plDAt2
         kZlbPXdyP1jj8jGZE2v5BJjqMjHdzEUeo08bssuqwZp3mNmoY5H3x99leh4FQq2YdBzs
         bQRwf3CQ221rQVp3ybLEhegCxTPqARQuqbSYTAUeuX31k2N8tqarwJR63VV6Yx19mCMV
         6rrgwxrpZEMuH7hEi0mxufCBAhrRK30uDIDmuo/Xm43pg0WseBBK4ij2B7caA3RLT+/Q
         RGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNEkiDjRHZLjrSjApuNKMS+b0w9T6h8fgeM/XXNJlU4=;
        b=j7I7MzDG/WbCYrc0h/gYXamDGjJrP6+pJMoBTW8C++wTse7Qiz4Ym94KM3XrSB/tik
         cWxqpMQKRsCy837FldRlfw7vew5dr6TYAk8OFuwkNPepEeo+wh7F1Cm7DvXhoaQzOLfl
         bs7ttjfJVTbR0w0gjmD7DRHJhOY3JsYF+7DXI/3EIKJYxs5M1UIYX1ODQ01jRl9oAqu3
         nQfg+925ONZ3ewt1YOPln96i7nGcCb9AeFHA71xitM4O68hgyKomWGYHUwlWD3htPnqg
         1BVAgUG4id+yl7tgUxaGC3O0bgtv5QpIR3gOm1Z8E+OOzwTNZaq0KA6HLTjFbP/uEjpG
         ttFw==
X-Gm-Message-State: AOAM533M5dapo87JKX8BKbhh9r6OwIqvva9gp9ijdazVbl1CQWSPuGKD
        hHkJchU8IR8PGkBtR2qJHKWIdlah/fza3M2UP24xFOw34Kc=
X-Google-Smtp-Source: ABdhPJzQrwfmXRI5GvyLJ45Awt0ZiIoBsN/rni73r/Q+iR0qjV3m6kqN0KtjAHoD+7g/dvWBZXgGFcPS8++J/NWTlSI=
X-Received: by 2002:a19:203:: with SMTP id 3mr4477596lfc.77.1594985484191;
 Fri, 17 Jul 2020 04:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200713183541.36963-1-grandmaster@al2klimov.de>
In-Reply-To: <20200713183541.36963-1-grandmaster@al2klimov.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 13:31:13 +0200
Message-ID: <CACRpkdY3woSgK5bAHxY6aEXe1Hx5Tpxa+0hyA4T_DiFOd5HjXw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 8:35 PM Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
>
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Patch applied.

Yours,
Linus Walleij
