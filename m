Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048A323B0E4
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 01:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgHCX0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 19:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCX0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 19:26:25 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EEFC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 16:26:24 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so41508507ljg.13
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ovnJeiV+t7mJGwjtZOPIerpVMUoBOVsrm+QlfNQcFpQ=;
        b=IOeyKAl/JK1PKw86e3yJ4Lqh9iNd2Keok9yJ2DOkhK3+IqQ3NzOR+UhcuH73fDD0MH
         2ZxcKg64WNUgSkYR1+9jAOExX4XNVjxRajHCqAwVqi8KyOYrwT1N9kM40Gf661ktqKvF
         /6+gQxYyhAHX949ydAPnLxlhkjGnqahPefuxadNuZzcPPZP8kWAvF2KJE/y7eXZ28NOr
         yQSJpOLrrAixj1GH/ejPWJWvLqn7OAmcgM1Bj3VI+PT77KX3rUGN0f7xGNvxKK/iHe7H
         pqJgrTeHDxqTWAR/6jY0ediMgaikcLd8SAEkz4gfnJZJ99rIWjXkw3LGJKcards/GWI4
         LwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ovnJeiV+t7mJGwjtZOPIerpVMUoBOVsrm+QlfNQcFpQ=;
        b=C8XykPz41k4JEHaH7SGWuhgbS5vjwLo4FS1Yoc5O/gjIjdLHaHfSNjRpRSaXxOj2gn
         M+TA7OWmH0+EKKRh+h3JxuB64sqKlxCQLvGTqiuK33YH4LoDLpqWx4npYiCWJ/hlf30L
         hKf3ZWy8QObogjGoLh0dWcVLivPs8MAPSDbIL+TigNUnHNZY5ylsXyfOm/XB/fRWtAoA
         OybqOSILVw4Si4psDXT6r2FJzpyhDC7Gz/lTncxO8rwUz1Nyhv57tysVMofLYfAiDbeb
         6qK0sd9gacuxN8WuKrHCVb8dncX5sMtG37fOEeIixmEjVazPMvwwm8i03SvkGOMc3Kg/
         vuag==
X-Gm-Message-State: AOAM533kvfofBcqWJXMnX2M8Qb0h2i+KJIThD3C4N3EE2hhZM7GrEEqQ
        wbRoVYGLuQO0pgiI27NC6EfHh/xdfowcskqWGUXurA==
X-Google-Smtp-Source: ABdhPJxaIMQRc2XZKMWuDg2EDl8x30alrAPxZRqyNubnJUKZQzppYlcPVabDezo+X3szoo4ssGXzWBojB2OBxR5z414=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr5893584ljg.100.1596497183322;
 Mon, 03 Aug 2020 16:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200728125504.27786-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Aug 2020 01:26:12 +0200
Message-ID: <CACRpkdbx63cDuG7-wwroGsKuyGOdSxKxwAf7OdTRBGute2P0Kw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: pca953x: Request IRQ after all
 initialisation done
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 28, 2020 at 2:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is logically better to request IRQ when we initialise all structures.
> Align the driver with the rest on the same matter.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I just applied these three (despite 2 & 3 hitting Intel drivers) since
we are in the
merge window and it needs to be in good shape for the merge.

Thanks!
Linus Walleij
