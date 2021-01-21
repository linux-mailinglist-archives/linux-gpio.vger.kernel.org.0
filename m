Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB032FEB6D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 14:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbhAUNTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 08:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731250AbhAUNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 08:18:41 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05E7C061757
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:18:00 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e7so2399776ljg.10
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lugTKlnSgFnC7kyiesKb7/2gMqEnCIT07CX0y0/KBbc=;
        b=M7oNfJx6ONjuzOvXnMHVRjlrmSGxd9xPKeCVIDVy3uydXSl5GNY1wkCf+RVLsu/GKP
         FZEjKmQIGM+GnkbCMvxBNmrvu3uAq6Ml6P1UVPDJJsBcEIGPTKvdQg8K0s4DuqD/m4Qd
         WsMY2c+YuIzPGFP082S2yOzDOOtAEdgafrgzVKOD6XU6Gye3H4+P9l2Ek4GvZDTnpu7x
         qbm3G2oLL4H5C5yfDXQfRB24K8g5wPnka94Hry3XhmIOjKomCMVMheNPIa0aMYb+rAqb
         0u4B+rxFss8cM9bUpuqYk3de6yCExK4i7fdIywIVvKEWMJDvIoj2BLwCWtf0RMsycCRC
         80UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lugTKlnSgFnC7kyiesKb7/2gMqEnCIT07CX0y0/KBbc=;
        b=OkBNlqQZU4Hc5wtReDwDN6mzwN+gLm7jmu9yR3WfjOGufunQ/ShThoQ5/VKcCdw8PT
         vJHyNam3/mtryhKbPmYOghvfS4g3mKvKNICTcg4Jh2+8b63HW8LqaPYjhK4ZcQmAWRr6
         O7VNhFe1ogDAqBM+xleLlepyo+m/M8iwbS8kKUpQ/prjmF+Kbq/zPgMk4+QxnE3A7lwL
         GK8Lm4kqRkSQ+R5PNuuFumd9/0g4o3LxI7TEVEcm5E2+CERS3wN1+LiXFWJOG4YmULv0
         6v/eSkPg1Li5m1C5Q/fRVl1ySmzT9Omp95sKenNTTj0z295kWAHE5gq8rzOPRl6g40s9
         p/mA==
X-Gm-Message-State: AOAM531vZTHhtE3Ceott/8aKexyiozvi7y0wvs43ZA96ZxxidwLmdqws
        hXhTBC0I/biz/yOk4RMALbVTQ5jsTeIQmpenzGFt5A==
X-Google-Smtp-Source: ABdhPJy2OlcuPaM6RagrRDrG0M4ja9L8VgffWWuinTVWDSiOU5ltH5xpw2JO2BS7AGRxt/ztERmgLXR6G8bF/zCK/Gw=
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr3888461ljm.273.1611235078524;
 Thu, 21 Jan 2021 05:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-5-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:17:47 +0100
Message-ID: <CACRpkdanZ7yenqB0ThNLzfK0safTK4zgd_nxDkfd+RYPS+KuvA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] gpio: aggregator: Remove trailing comma in
 terminator entries
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Remove trailing comma in terminator entries to avoid potential
> expanding an array behind it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
