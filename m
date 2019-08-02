Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04DAE802B0
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2019 00:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389065AbfHBW0m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 18:26:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37887 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388953AbfHBW0m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 18:26:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so20004798ljn.4
        for <linux-gpio@vger.kernel.org>; Fri, 02 Aug 2019 15:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i4Q1OSMkrMbEKT1SoZ4uAd7NwlonfJaRZEODg93BKD0=;
        b=oxpTNQ7gA0BmCDZGSRq43NuTKanPemgUpnkI3okDP8pIxB8ySGXHO48Y1+rEItwZau
         lP0qcd15ser5ufk1fOSMnebTB7O5ufFXe0auLaKhRSiW7JKialmBF87F778SVNvwuZOp
         Dcf7QoihmGWpFdwQIi9Jj/cTmxQSTjceh8nXNw9fQIxGIy4HtKwvynvtEobr06TKAu8g
         zd8O2nd6DNrUL2yUi7hHjq2p91elcxV7IIOxzmNv9zZNMwpLMwwRbxBwxGzqaQJjaosx
         HzpdCt00QNPGIXtSKTa0hb/5xr+ZUAf7N9HgOD8DlTWaVX0Ix1CnRfxQbt53NZ+bUQGs
         Go+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i4Q1OSMkrMbEKT1SoZ4uAd7NwlonfJaRZEODg93BKD0=;
        b=kvy8FooGS255Qp1IgLUUpHF/R8xXLI2PVA83QvaIMt+JWSRHGGDaSyLzZ9vr9jGXfe
         OdupCnQsmHGgqhH0MrXVZKy9wOSvtiQbE7MG2EBwPfk2mzpsjoCVTF1zjQoXF46Nj9Qh
         JNEt2QKBMDyKO+i+d7LjOiB8oEkDcj7ZDwSGsoI/WAk3ejK/SiVwJNR14QXxs8vQv1oC
         mSoUk2NCCGXPJpENO75s7pcujLOzvJhgieR53CdDb/clmnqnGvKeh7aRGa+EfXJEP+Wy
         tL6L/++lANoL/X9JL37adS/7OJa8QVvA0Ww0AP+aBnJcQ4H5oLrSJNvFTRvCz2IJyoSb
         foBg==
X-Gm-Message-State: APjAAAVD97cmwg/WjJL8Ajody2L5fpQUdkcJprDAg+8cz4C1wXvCP49O
        xSmNr8SlR0gC9vp44GHE3gehzht7HcalLRzSM4US5A==
X-Google-Smtp-Source: APXvYqw9LAsN6ED2iWwyLwLi0Sm06Cw60jz7RgJL+Vw+t+Lf221RYZpuzJ4xgBO4yMiWKl5h9G6pyVCUsX+JICP1VXs=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr8040694ljo.69.1564784800470;
 Fri, 02 Aug 2019 15:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190718065101.26994-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190718065101.26994-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Aug 2019 00:26:29 +0200
Message-ID: <CACRpkdbOnVEfoPNnUES+EE2CN00dXRUhO6HuCUhyaQkEUvWmcA@mail.gmail.com>
Subject: Re: [PATCH] gpio: refactor gpiochip_allocate_mask() with bitmap_alloc()
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 18, 2019 at 8:51 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Refactor gpiochip_allocate_mask() slightly by using bitmap_alloc().
>
> I used bitmap_free() for the corresponding free parts. Actually,
> bitmap_free() is a wrapper of kfree(), but I did this for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Stephen's ACK.

Yours,
Linus Walleij
