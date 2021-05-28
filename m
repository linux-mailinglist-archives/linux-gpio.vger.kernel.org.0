Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A44393A5B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 02:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbhE1Alz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 20:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhE1Alz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:41:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD0AC061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:40:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i9so2716413lfe.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=95QELRGt3WnpgXBZfUKFp2QKTKq0EmitnNeYW0Z4b00=;
        b=JHzOGH3Rc3QzKK/Ko1E2bnUdXa+dF2SXbNLvEC4WOMB3ME0NjEkkXjIOu3vhgBjmSm
         xAoBuWZf2Y6gaqTX/uwq1QXNRyDtR5Z5gYvpan34I6clp7Y8269dChWGB1qbHrdX17jr
         /trAilTK5HE8H4ZDJlTAMIy1g6uo7GsCv18lyPxl4t2yXjZtlUzMx3q6MNAqs+33rrJA
         tKUCWcKbHoZEtZf4z8/P0bKU1AJ7nqUh8r9SWzWCXhSMfZP6/CFK66voUTGP2UGzRSNq
         iqVdcHJYDaIgzmJiBuBdesk7XwXASckGaB/X7onHSIyusXxH7q3+ds6lU5Jj9mDUUD40
         DIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=95QELRGt3WnpgXBZfUKFp2QKTKq0EmitnNeYW0Z4b00=;
        b=AOaekOX/4UGpV6ShwhI0mczwb5ntpr4HnkqE8EGY+5sGxQaslWR+AOcTKdpEVH+5mR
         CytcnzPeuxM9n1xyjJKf8a8g8dCTsZjoEKFW3Mtl5QAtXRDxymWorUXwLVz+y30zxK4e
         wN64NRW/6zIlFMdudLZzckhOeMyQurHhLYWuQ0Y4liY2OEh1Ak8pLngwFCkDf5Yld9jO
         MiSmecjj/CHPX6OSCcGjbolY2gQ9Z5hBMrbXPRt3MAWTjE8TxLcTrCOUBL+9Bq5Z5udE
         /VcYwmBR24aLYTJsKZ01/zTBVhCjLrNrQ2Uj4ycyRFwySE/YJjw6QuLapJ+EEhZ2tBIr
         ORZg==
X-Gm-Message-State: AOAM530kIyxG9bTsc2vOWkzD4Pkz1w2titND7OgjlM597DGCzb3InSu+
        EqFuUNAKPvlvDCTrr7YoEWM9IRYh2cgBrMBj6BTLqw==
X-Google-Smtp-Source: ABdhPJxEixXA4BPRFM+cBv+IPP3s69di5inm8bv4P3Ri4UI4g+TG+2aZl637Yx4KUShZQ/2GEO2QmWrdPgelI9kY9pI=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3928339lfp.649.1622162418755;
 Thu, 27 May 2021 17:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:40:07 +0200
Message-ID: <CACRpkdYpi5-aednXopjCgbey722T+LEagovGidb13yv6z84MnQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Split fastpath array to two
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 8:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Split fastpath array to two, i.e. for mask and for bits.
> At the same time declare them as bitmaps.
>
> This makes code better to read and gives a clue about use of
> bitmap API.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent code!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
