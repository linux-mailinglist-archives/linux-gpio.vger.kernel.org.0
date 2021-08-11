Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595013E8BED
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 10:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbhHKIiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 04:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhHKIiv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 04:38:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1243BC0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:38:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g13so3994558lfj.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaNOC3cQ/uorpXn6DtIck0TXPz/EwiFlRh4xw/zA/n0=;
        b=Y7TepyPwo5NDwLntwW51ULnit/gk52wZ3nqcPd4Pw7P4wPxvskf0EbFqjuVM7QmMLN
         WOAs78fOmyBajz3GLxhvF7abXEfFIxfLG+bceaUFjwyZUWKAm1e8neQvgRnDTGJSu7Lk
         gzqtg1cj9VBOk9EzNQpwuiqlHsfe/PMx6QZjfuhegZIOVtId2HT9r/k02mULPrJOwwLT
         c1JBidqXV8MfEBIDRq4TOcphTR4sZku5Fjh3bqZPLjsNlszwIXpbuYfv94MbIW3kgSYu
         vPPmBoaN5ll980SI0nWnpqsQDBUgpoMHi5cOSl4x9hcwjkO8gXRkxa6WVqVQFI6K6d1C
         rVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaNOC3cQ/uorpXn6DtIck0TXPz/EwiFlRh4xw/zA/n0=;
        b=KhrtbVYDNhQ3ZqlxHDo8k7moSz5rG/tcT5RPMLLt0Pl5lc3DJEfHV8WQ7b2Sntj2qW
         i0zA7wnlP3nH/mQlYFRMVAzEPA/yh2QLg3efcRV5MNIzp/AQbHTf70Su69jbgo8g5nAX
         kmMpvZQPjVYtEgT5dij3jY/1bIA9DrKPBvnYG5k5iPsZ8XLyoSwGIDbQYFU9CQsKG9eY
         FONSdLoI+mcWmny6JDE9Lnk47DMI/dlUMPAohV96dri1NXtKyeh4MJbFsNc4jgVPcTb8
         c2sE6FGtZixGbu9xivik8lDXhezHj3/TkIkpcql+iY5z7KfC6mw4HINxQ50WQF5v6jDf
         vNjw==
X-Gm-Message-State: AOAM531TSo25uDyNYMHJkYSkikYu3Bov+YYnl65cxC/AKGNcZgV5VgQ4
        h1/z4s9bp9q/e8xjE0bKeQfAk8ncqyAiupaDDDLgKw==
X-Google-Smtp-Source: ABdhPJx7v0Fu/ELoRaBaA9FkYkMoNYsLY1wBNnd0D/uWJPSi2EWxY8BDYUIAPPDVJd36CEeCmD3X72In5OwfijSe++Q=
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr13185278lfe.157.1628671106413;
 Wed, 11 Aug 2021 01:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com> <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:38:15 +0200
Message-ID: <CACRpkdZ5NZA0XCZe5X0g6uRGn6cdeFcvtR8WrRoNtu8EwrMV2Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 2:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The driver can provide a software node group instead of
> passing legacy platform data. This will allow to drop
> the legacy platform data structures along with unifying
> a child device driver to use same interface for all
> property providers, i.e. Device Tree, ACPI, and board files.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is really nice, I wish I knew better how to use this mechanism
myself, so I need to practice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
