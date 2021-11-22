Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3390A45874E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 01:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhKVAF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 19:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhKVAFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 19:05:55 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585CAC06173E
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:02:50 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id s139so34258227oie.13
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aQkLqKDE0H9YwXXJ1zrR6AA7PdcZT038DZZN0r6ZUUg=;
        b=y5HQHAnTnKWTfXsXe9mqwk5iADXGSxEwzRRjYGT36sbAcW/153mT4BAOv+DGUrXZbz
         8wg+4eyMS2oVD+r0aDy4m+UiYp2/RvPKVvqepdD96M3CKkYNDuzXVVwPs/j8s2u5dlN2
         LDH89Y5B0xet6Nltj8JPBsskovYHEpKZCDRb2fnIEk3wbHCmJ217eyDSHEtdOicZMKVt
         H/AthpcXKePE0em9nOHExd1+ZZQbVNzNtXmVbaKCeq9QyJz0k1KR5E8GLnx/FO00u9Xq
         RF8zLYM3fiojHLF72FEpc4rH97WOIsGw5C9g6urec9EQCLwk+m42zJPZ+CFLs2puh0a0
         4f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQkLqKDE0H9YwXXJ1zrR6AA7PdcZT038DZZN0r6ZUUg=;
        b=k/WTtvC2zTa/RchhE6EukepzMZ1F048twUBaUorNlTY9X2Wow8B3m/rR6ZnPLxvOfh
         ZwUi5M9ShsFv2pi8/KQQjYt5M8y7uSIpbptiYPW9m9FAa3ap5/ZXtD4eIr2gBNtZSanG
         PbQ7bIY369sSZ/YlbCISUY1UePRKT368aoCTH4w5aLJOhU8yrdDGyWGmFuLLF/GRKyVs
         A6ei9DBXTZlL/Rp0endv2DzUVkg2et1RdYbK5KNiI99gDQQa03ogkd/Q1i37T9Z3E6WY
         dU8deWpaf2pVCiNhxyZBrzoef+omPFM4JWDWkQ/FyU7X/rg9+YPilsP3MC58a9/kVSzu
         Xx1g==
X-Gm-Message-State: AOAM533CGQuXl5zWs7FD4KUkTgB1DCtHq0xNHN3YytIn2rGIVmbBC6jP
        THP2/0gKHeCxnQtDTtUO3vcKEiKzsLn6B7L9fEop3w==
X-Google-Smtp-Source: ABdhPJzqyDfm7zh4TSMLOwrStOYwp8ExgHvFYRGqaq6CkhtzWiqrOdIOfUWA9OGs8SLcwDpyhrmrq6BXCZ7f0RX/kSU=
X-Received: by 2002:a54:4791:: with SMTP id o17mr18098001oic.114.1637539369551;
 Sun, 21 Nov 2021 16:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20211118145142.14519-1-brgl@bgdev.pl>
In-Reply-To: <20211118145142.14519-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 01:02:38 +0100
Message-ID: <CACRpkdbn=govgPeiEEtVF_+bMYD1Oi1yC+diZ2-owO4O6-oCwg@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] gpio-sim: configfs-based GPIO simulator
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 3:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> v8 -> v9:
> - dropped the patches implementing committable-items and reworked the
>   driver to not use them
> - reworked the gpio-line-names property and configuring specific lines
>   in general
> - many smaller tweaks here and there

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Let's go with this.

Yours,
Linus Walleij
