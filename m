Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12BC174324
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 00:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgB1XbD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 18:31:03 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46704 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgB1XbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:31:03 -0500
Received: by mail-lj1-f193.google.com with SMTP id h18so5022475ljl.13
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FJMOjeid6sdwgXv4TTvMxMhevRyWK73UfsN1mnUN154=;
        b=sMe5Q6usg9+F4riRxov5cjG3cyELLD3oY3eqeIrCM0aMmY7BGEfLMLJT1SZ1gK0IwN
         UFNBkrP7J25JufhFor+00VbaiY0V3wNFi5Y0V6yp/yTwjh7YTnRrLqyZ7eaDMrvF/TzZ
         Dd+uXEyp9pONbPMH+vFvJHPbmE3J7xZx3HwKpXwcCLupuc+vQZA6GenODw9SfH6Az6nZ
         hzzXjyLjydDHeMjOWfWF8PjkvIagnRsfW3bwZi7A4bzOB19Lx7TbyhEccYzR/YHRJNAZ
         eoJubijvMqEQ04/8kdlkwXDI6wo5CzuUN5RPHEtk0Zeu1q+sM3u3109tFuStjvE6jYPa
         NuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FJMOjeid6sdwgXv4TTvMxMhevRyWK73UfsN1mnUN154=;
        b=Cx9I5SV5e2hr2BcYrrkg3mFMxiSMY8zGZrNfI4o3Zjpzq9p6DExN9Sxda+lxP1swTL
         EKTV+KazpgSe0Hq2gDVHlq23+/ywwWcN25eoyZYHH8/VqXNek/SNgvax7SsHeZPMIhq0
         puCgw5wIsCiME6bIWS0ty4DvKRlU0XDBcbTS02w+IDG3I1oJjYDDqqK9teFk21YVaanr
         QheUIGQgoJHBZSQHWAJAf03h/0HrCnS1CYG0MORbVJ+Wr6N1ObIbEle/v7Y93q7Dn6Hp
         CFVt47XSGPNu/YvQ3Zd4CGFIiYR7/L/k0/x3q9rA3I0cpUkciIkAQZxcToAXFHYxa+d2
         Hakg==
X-Gm-Message-State: ANhLgQ3s7TiY64eF+NtsF9eP3nSx40QMaH+6l08JUTJva6BWftlfU/yI
        CAilC8IoJxMNa0uzSKZ+l+QGvbQ8UVE1XURGLJSuSg==
X-Google-Smtp-Source: ADFU+vsxoOHRMUZvXuoHzVp2SunBEAeVGYJ5QRP7my8lror2nKWFrPn2yB/CjkXexreMLjBZgrvV44n23yoajzkayqA=
X-Received: by 2002:a05:651c:2049:: with SMTP id t9mr4108228ljo.39.1582932660936;
 Fri, 28 Feb 2020 15:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20200227185837.GA4469@embeddedor>
In-Reply-To: <20200227185837.GA4469@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:30:50 +0100
Message-ID: <CACRpkda4wEck_JYpMYuQ+pAkaVo1JUE9nUpNseCBRCFADpZ9Ug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sirf/atlas7: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Barry Song <baohua@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 27, 2020 at 7:55 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
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
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Patch applied!

Yours,
Linus Walleij
