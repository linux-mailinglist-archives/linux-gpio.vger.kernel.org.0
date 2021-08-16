Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367463ED7A0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 15:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhHPNjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 09:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240689AbhHPNjj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 09:39:39 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D834C025266;
        Mon, 16 Aug 2021 06:18:54 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d17so20629497plr.12;
        Mon, 16 Aug 2021 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=881XdB9vU/nigAnWih80+R4v8yge7h7oioJ/rj6JcZo=;
        b=Ekh5QJmcg6Lk1hsn1Aw1QnIXMacXTw+C2N04gAZ73bnSuziHZWuxY2SDdUxVvmTMcT
         FoRKM2ESt8GwWGjZjnYpatGs9Ep8CWgfJI0ZN0t2uV68R7dIIARAu94BU1eFL+TsE1eF
         RX8cfFvAuNOyuQCdHKGbolovDHVNDHQBNhClWP8/oGRpR1AxeMDm60UCciWbcCdbT41c
         gnCP8QKL4QueCKnGRD/xqsKKDzeRaD0T028GdrcdieMIH1TxwMmCmTM4XFRz/g6TWH3N
         qoJn1O5rUzUtIG+nAoaTc0XfsU1aGJkMGur6CxfH1W7rFX7jIpH0NaFgdL/eiMfo0TDT
         LPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=881XdB9vU/nigAnWih80+R4v8yge7h7oioJ/rj6JcZo=;
        b=lKkLqgGglTr48yCbonDQPUK7OYCXAa31nz0C1ACkywhKzdPvlwhnXRDOcvOkV7GAmb
         7Ix71MkHrOL5Rkd1q/9tSB60lWvSZ+jQ1djYn55uddXL4uHUP4rzcTeYsNB9r8nHmIXP
         r3n4WJiNDUrxxQsDuJH7RK84sySsnq8qkKb1g7xglM5uxqW94LCeo5tzvCV5aNidc9gw
         JEPiFTiRUe6MYFMI5B3YvbBSy61p/GAeVv1/YSpjg4/4cpeQyjLczHPbuKh2GgPBJFGR
         Lr5+QJVvHhVrAlnEg5EAinPBMjGpu3NzsYCGX/QN0Xb+ha1avJPDLC+KzqDYY6bvNyRY
         HgAg==
X-Gm-Message-State: AOAM530siyQqtCOf5wC6K3pc1H2DhjF6JDoY/nt9n3bRY+vcik396QvN
        sSayobXYsUDOnsRWRHD1uF2xJkR5tZgwohLfi9E=
X-Google-Smtp-Source: ABdhPJwAFCvKCT3L168GgeP6F6IpC3Yj2gZWMsGtllzXqlFmeOxBdlOH3QmysjW2ofu8LxHX2FTv7gX/fz6m1yTohb8=
X-Received: by 2002:a17:902:e786:b029:12d:2a7:365f with SMTP id
 cp6-20020a170902e786b029012d02a7365fmr13347209plb.21.1629119933482; Mon, 16
 Aug 2021 06:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com> <YRpihHP3kDz5nYV9@google.com>
In-Reply-To: <YRpihHP3kDz5nYV9@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Aug 2021 16:18:14 +0300
Message-ID: <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 4:11 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 26 Jul 2021, Andy Shevchenko wrote:
>
> > The driver can provide a software node group instead of
> > passing legacy platform data. This will allow to drop
> > the legacy platform data structures along with unifying
> > a child device driver to use same interface for all
> > property providers, i.e. Device Tree, ACPI, and board files.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> >  1 file changed, 37 insertions(+), 33 deletions(-)
>
> Doesn't seem to want to apply.

Would it be okay for you to pull the immutable tag?

-- 
With Best Regards,
Andy Shevchenko
