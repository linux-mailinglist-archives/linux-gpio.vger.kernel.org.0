Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8AF1BC02E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 15:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgD1NvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 09:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgD1NvC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 09:51:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82DEC03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:51:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b2so21505919ljp.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=No9mDU8+hvTrxab2bfODpNQEmVb8+9eYKL1viviYflk=;
        b=F0lctHGXr6jxwvKD4j4xHhHu6YEO/4zlTpbN7NBj+iDYDcRv+wMBBKfiOOM+FjiMR+
         lpR9iy2WdJwDPLMri0y+4EDQWpt3PO7Gkih2Kn6NOAKd57pi1KoiFfPXJNAGBMDqJHC0
         PDoT931yQq4MLlavt+7GIhVrgpoUvNVnLqUqJwQzS02Uv1JuUU/GDQIMPeFVxCHdYjL+
         dNJELMJC65x1lv+B9ioAWKrWL7MTGups367J+RXMINkXOt7TZqoF0W7XZ6mDb/HyKmyK
         Rvr56ynF6c9t4hGrSfszYPHDkkotjTPKZ2At7Bp0KjLq2aSTb8B/1RBmpO/SeXpxpJmg
         e16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=No9mDU8+hvTrxab2bfODpNQEmVb8+9eYKL1viviYflk=;
        b=hLDOYTdME37nPycvedJ7rwHdHAi3FpuybSqlMvy6cdNh6d+ximpWN6Bo5QEy4sa/pM
         /gJ1QjJmI9YhXoMJ747Ven2D3le+3VuXuAN2VjOl+RqeM5xilapCsaVlxdrGlHTRg6iF
         vu8Rkronbxxx2Op1ZZxOWhMlz1ga04PG0ynyqbhcphfGvIFD21cZmjakhoNYnar36MP8
         ZzZTAznaj9t1OEMBvVqBzK8TjNB+XE9IWzksIB+nuM49ES952/ZwOukDfvCk74gDxum9
         8jJiWLszUHbg26s/PLwlhCajq+K/64Jaib1ahpcpkZ+++ZOuIBH0sCsl1Ut3c4KxrIpy
         glcw==
X-Gm-Message-State: AGi0PuYxgRL7UON8vBkllf4Ps/vPGele8sudZ4h4VwhmguVgBsL03pro
        Sapo3uFIl7eMRnY9pwTNznp4Onx3JO/eC1jDv0Pzrg==
X-Google-Smtp-Source: APiQypLdIhxDt7oAMgAtRuC1BqrbNsbzfwAGYm/SlOw+A65DFkTDz7D8p1kJXqeCEJ9Pc5tSJD376epb7DfyMNEXiso=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr18490498ljh.223.1588081861179;
 Tue, 28 Apr 2020 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200424154103.10311-1-zhengdejin5@gmail.com> <20200424154103.10311-2-zhengdejin5@gmail.com>
In-Reply-To: <20200424154103.10311-2-zhengdejin5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 15:50:49 +0200
Message-ID: <CACRpkdZD4x3PV4jn0Wwxq7N_Ub4HGQFVFzniTUHYajQSOy6sGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: ftgpio010: Fix small typo
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 5:41 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:

> Fix a spelling typo in gpio-ftgpio010.c by codespell
> s/desireable/desirable/
>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
>         - split patch v1 (only one patch) into patches for each driver
>           by Bartosz's suggestion. thanks Bartosz.

Patch applied.

Yours,
Linus Walleij
