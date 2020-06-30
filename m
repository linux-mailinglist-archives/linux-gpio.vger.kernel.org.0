Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E075220F2D5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 12:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732238AbgF3Kjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 06:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730823AbgF3Kjs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 06:39:48 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F104C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:39:48 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id i16so15143563qtr.7
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSzMPSPDQsBVcoyScGhVtjSYGU8/rInpnrbK4vLchMs=;
        b=ODOxvbkODqqbU1kCiS0pD+eSo/hW66UHe77mR29nvKC4gMQEForQtJL+1hDt2PeuIS
         JgVUpW4gdVdo7Wh9EFXVOT3b3ccXk9BHNTzOpJolgvw0B1xEKIhqQgbyscHSmPlKpEmH
         wr8RPw3GBsaRKbk2OZTarw9HgD9nSiZDmZdAjjg+2T3CqDgC6rx9GURD0FughYjDy0lD
         +bS+gCumLmCcvmtIXnr1CNHVQo2NlyeHXUlPm/9bbTaBJwKmWfQx3meWwGPl07b/xNam
         aXxUwiL1t5HvRX6l3p8kRgd9MIG3b18tnKydSM9aVko4wiCXh5m+Ka4bdg6DaCmJGfco
         BeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSzMPSPDQsBVcoyScGhVtjSYGU8/rInpnrbK4vLchMs=;
        b=XxkMWD+G5KAOhRrkZHW286hvaa4vdzG0RMNbjKAv4Pk0qwDcfpu2S0A+mBxwk8UYIm
         bQWr8dVzgfdN7AHQvg3ij7ldmelUbgheIYQpWNVN5wXe2d5+Rknz3ipY8dHlA8iRYz6b
         kAPjXUb1DFjxg+l93mpX/JTqtaLL7ydrNEOJV87bvAW5ZxxSIkBefzaMJU8jBDCyjrPZ
         sfOzpMz0pxMi6u2UPVqHwa1j/Txl89jQyimki9lxiJwKoYxVoLmfSwWZc2wnOf1DTC9q
         G7mRhLeDYQdS2rQZru7OqjZSqswq7nD2R9i8UsNRrhRJjQvmoj+pmc1WuCZy2Lh04UIr
         GzgA==
X-Gm-Message-State: AOAM532Lg9M4AmCNnIJqSI8yxU2ke3Isork0hLzSAI4MN7idhg6WvbJR
        u1T7Bat9hdqvJ3C0my6pQtULHytQaBlHLrHHCMTRjg==
X-Google-Smtp-Source: ABdhPJyF7724mBhU/9HNxhLdoO08pYCsKCOpsHWjhEeY2eVyCXcrISf7XXrGEFbAYzFPLNZRJhDlZbsVfr6xRXl3zaQ=
X-Received: by 2002:aed:2a75:: with SMTP id k50mr19435473qtf.27.1593513584142;
 Tue, 30 Jun 2020 03:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200630092146.36376-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200630092146.36376-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 12:39:33 +0200
Message-ID: <CAMpxmJXKrNCuTf__VVTqm_hDSvhRnJa2wVr5jGxCeG9rt7E80A@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Deduplicate find_first_zero_bit() call
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 11:22 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> bitmap_full() is a shortcut to find_first_zero_bit().
> Thus, no need to call it twice.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thanks!

Bartosz
