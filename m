Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2C42F15EF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730853AbhAKNqh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387524AbhAKNqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:46:31 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CF9C061786
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:45:51 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l23so10614488pjg.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcylFd4OUm66Ib8XaZ2pgT8HbIMVUG0nFuM56eeGw2g=;
        b=R5x/wjELT6uTOicxPY2zFabw6K9wcGBUNYju12Zvd2TogVC7/TwrX7pRlQlO7mUnKJ
         Ec6mG+hPewsBBT2eoLov5hQZ97wUNkWenS/gsH/d4nI3E0OOp45NeULnEd7sOxpVdf9M
         Phq3R6NT3U38J0RxiBCK/jKDec80ZuiwkN+sKTalOxGm1Mz9vIeZq2ZFHdxHgU/Z2gc5
         8JH9t2XwuzUTwHPS/Z+TKEn2AeVnG05TQAlTaOoHEgjR6aVaJJ8HT1oYgyOeIn8eXFFU
         beeESZuvNuH1VDDaWP2WR53DN8BVxoYCPLXfcFX4GJpbg9nrvoMwHCttsdTAldCQDRlE
         s4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcylFd4OUm66Ib8XaZ2pgT8HbIMVUG0nFuM56eeGw2g=;
        b=uQl5SH/UkhtD+eoPIynY2UtkK6Ma3ubG4eFqy+EMb8LW8j5xETUxoDq537/LMO6s2o
         RWsNc+dIX/mMcFX00zgNKj6+0HmbobgCgE2Y0FHBaUNfGWRlCEIAkPE43T67jwGL8PnY
         c6l0+ToD/+wCGgTfpZPzaj9/AzEFM2NajZMXyjLr7scwMQuoS1ZgXiql+T/7smGPaLHk
         X6dMdcKE96zODxqBU67p+zFM9E2gwKBVYjezkvvy7z5uDFZ5VzG6QzPXglFuCdHOl47f
         hVkIiuq51Mrz0gXggUNQnqgKp7PgJA+u5nX8nkxW8AMAFexQvg8cYy7GHP05Pg/Bf7Rp
         mtPA==
X-Gm-Message-State: AOAM532Q7GtrC35jFMDBvtPR3xkEAFSmlDyU8hd1KCs727zesIFlF5DF
        U67mRMsIrIP8zJ+8AxFvx5Zy0nnwn4weojJNvdRjmKIwhRI=
X-Google-Smtp-Source: ABdhPJxIf8y0Hh7QuX2qto7fgXEW+yRDu3RH3D8YM6nDNGX7CqgQ08kjR7QWvah0Di6TBEkqDuBFXbzml+gJFVv/0qc=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr16522417plb.17.1610372750515; Mon, 11
 Jan 2021 05:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
In-Reply-To: <20210111133426.22040-7-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 11 Jan 2021 15:46:39 +0200
Message-ID: <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> In order to avoid any problems with symbols missing from the host linux
> kernel headers (for example: if current version of libgpiod supports
> features that were added recently to the kernel but the host headers are
> outdated and don't export required symbols) let's add the uapi header to
> the repository and include it instead of the one in /usr/include/linux.

I doubt this is a good decision. First of all if the host (or rather
target, because host should not influence build of libgpiod) has
outdated header it may be for a reason (it runs old kernel).
When you run new library on outdated kernel it might produce various
of interesting errors (in general, I haven't investigated libgpiod
case).
On top of that you make a copy'n'paste source code which is against
the Unix way.

Sorry, but I'm in favour of dropping this one.

-- 
With Best Regards,
Andy Shevchenko
