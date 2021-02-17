Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8B131DCAB
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 16:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhBQPuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 10:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhBQPuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 10:50:05 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07897C061574
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 07:49:24 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id e7so5301490lft.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DhE3/EikzDNrinXadeDZeDUdIcV3qZIo3s67JM6FpNc=;
        b=muNUfcV9zc5HIXmhP8ZEGmuggOekcYvR/Y9KDvBch9bWKwvTx1N3KfkCG1mygmTyFg
         w+wjzaA0O4OI4wyorOFv15SSNfYGe3lI9MOwfv0ruLrs4aXzycFF/nf3iDREc1XKdGqS
         w5uuY6zx1N7Pbt4bbR+hLs5FDyIHBbVL6OpB9oSTV/cY+BvEauzZxvgpFiA0x+W9o8VM
         Zr9oH1Yy59bWWvwGurIQ8LhScLAPfmHtKVBEqqEE3iesdGDVfczcVx3QD8LJk4gpsbVY
         sFZ6mXeevOwt3i1H+XrY7g/IQq9Pckj7MwULxIGRdErhTXAcucelVD12W9AiwPGp+yYr
         eMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DhE3/EikzDNrinXadeDZeDUdIcV3qZIo3s67JM6FpNc=;
        b=Kv+zs5227LKmFvdER+HujXRDbXLRN09BqlAOdQ8l4QOLXWL3sCfI2CIKcxSq3k1BmB
         +tnlFjf3dwVleAksLmHaRUH8MBtj+Bu0ogl3NWQR5qUgu4N+suEM1CFhlXpPsWUxINwY
         uL266AB3sbPE5tQjNVqe2TyjLJgnNicWirD9P6o1eGq9VUir1JP9lUHB/lfh1wjGPWRQ
         kVCV6nhY7LZ9qfPyuUvBV4Z1Zc6FAgI2JTHFkSed+uw8/HG8L8ckJa1Tv6xPYCsWpvZ/
         MAwPuSUAE/jTtUXgSjYVFO/GD9t9+8ZFOLl8Qy8p9MkwHWo4YpfHrQyMUqqb0gOGRV9b
         tm6g==
X-Gm-Message-State: AOAM531whktjuR2uLg3CKPhReoJxeeYrZgj4PPQqCGbPXHGeXFZzUi3U
        JSnenyYkj7EBYvoS4U+x8Wc6B0xqTpHulD92cTw4fczRxjwK/A==
X-Google-Smtp-Source: ABdhPJyy9iTqA8C2g42flRO9f9hGRnxMUTBGC9O3MNRp5PSGXPXz58iayOSUn7JvftkQVsr2ateqUdi0FSaV0lw8YCc=
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr15351161lfb.529.1613576963370;
 Wed, 17 Feb 2021 07:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20210126044742.87602-1-drew@beagleboard.org> <CACRpkdbcOvOS4OSZt8cAWV7+-D8sHN7HWhrxGLU7fqKiwB1CCg@mail.gmail.com>
 <20210212173742.GA660547@x1>
In-Reply-To: <20210212173742.GA660547@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 Feb 2021 16:49:12 +0100
Message-ID: <CACRpkdbHUr8xk5TA3cr2P7+rsDkw+-njTvg9TMXCrXOqyojntg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: use to octal permissions for debugfs files
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 6:37 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Fri, Feb 12, 2021 at 08:58:58AM +0100, Linus Walleij wrote:
> > On Tue, Jan 26, 2021 at 5:55 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > > Switch over pinctrl debugfs files to use octal permissions as they are
> > > preferred over symbolic permissions. Refer to commit f90774e1fd27
> > > ("checkpatch: look for symbolic permissions and suggest octal instead").
> > >
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> >
> > That's right. Patch applied!
> >
> > Yours,
> > Linus Walleij
>
> Thanks, Linus.  However, Andy suggested I make this a series as it was
> prep for my patch to add 'pinmux-select' to debugfs.  I posted it as
> part of a 2 patch series [1].  In addition, Joe Perches noticed I forgot
> 3 instances of debugfs_create_file() in core.c so I was about to fix
> that in v5 of the patch series.  v5 is mostly addressing comments on the
> pinmux-select feature.

Oh I saw that and pulled it out again, no big deal.

Yours,
Linus Walleij
