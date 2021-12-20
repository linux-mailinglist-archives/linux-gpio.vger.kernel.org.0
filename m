Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8356147AD34
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 15:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhLTOuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 09:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236858AbhLTOsH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 09:48:07 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCCAC07E5E0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 06:44:40 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id bm14so26397234edb.5
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 06:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UgjRXLZ8zEM9swW3S0X0xGPTByoQbXi5jcIJaLiTSAo=;
        b=zYBtr02Jn04mI/25JNzSBEHHTOuaZ+edjlciMIIKqa1v7lbZeGTysCKuBaC5UzxLAd
         mSj3D+o0Pxi0EhtPRw4/WXCnSzelRPY8QEhszcgbi6oWWudcsBSF7t5OiZfI2gL6UkZ3
         u3+uk+6F8CT1w1uepzXiWYeR5NKm/2qw6k418fywg/jdqz31xSe8rO8GmrVJN67XVSyu
         PtmoDr52Xm66RUo4cEwIRR89pqtKKzvAVXq2XIvN3mGKDmCN5TBwHxZeAyLEGMxroXkq
         FAV9I3jiOeInAI8IMH0j0RuKFwJwC/FGBBTgGHxAoEnUHtFpwvz+Xjpur/t7Xw+uMHkO
         fWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UgjRXLZ8zEM9swW3S0X0xGPTByoQbXi5jcIJaLiTSAo=;
        b=ojEwaWjHBxn79cENFKVDyF1XNMKUECJQWE4ScmwvFiwq0M01+lsxSRKrk6J0FkyiP+
         51/L89hB0/tpGMf2orL/7epZYJUsfrJaV9dZm1SzCXKwJ6Z+cttwFptVK1V2KdgNplBN
         DtwsG0uhPcQIj7M1cLj5bXjod5MchdRmbFtiy/SZLodYrdk/FB2bPWL7FerjSXaKYCKy
         4HRx9r+X++r51zN5PVmHHyW3G9fvwJa9VHPisFyAlH7CtOLcM1t2XGMQNVJq9Q88aBtS
         TduApcrFJ5mdBvz2Y2ye0e/XjXUHpGri4o8vRdLB0DR7fyO4+2AwahYa8uJ73kR+oWfU
         Hw4w==
X-Gm-Message-State: AOAM533xg6gyjQcGklzmqtk4GmgJgOZOaCNtlbfrSVQmWren3L/DrhlO
        EpN2s6KVFEQA0LYXy7LDwrF6rQRKZyBKvaa9uEilHw==
X-Google-Smtp-Source: ABdhPJzEftytyVH4ub2mmS/VCHivbnf+DIGyGTobuYTO/xbrSZfw00I5YKTiJFtqjZckXgJcl3Iou5ZwburLic3fI9g=
X-Received: by 2002:aa7:d619:: with SMTP id c25mr12086494edr.405.1640011479391;
 Mon, 20 Dec 2021 06:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20211213094036.1787950-1-daniel@0x0f.com> <CACRpkdaLt8O4ONZL0vY44gMbuSR_tT3Gkbh9f3sg7m23tUKO2g@mail.gmail.com>
 <CAHp75VfC6mED_yGrHR4Gv3ykL-ckC89s3to5MtW+WSbUPLT0KA@mail.gmail.com>
In-Reply-To: <CAHp75VfC6mED_yGrHR4Gv3ykL-ckC89s3to5MtW+WSbUPLT0KA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Dec 2021 15:44:28 +0100
Message-ID: <CAMRc=MeGMvBMtZd4T-riXB+-FS20bVqfDMPT7z9HOztydF6w_Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpio: msc313: Add gpio support for ssd20xd
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 2:38 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Dec 16, 2021 at 11:05 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Dec 13, 2021 at 10:40 AM Daniel Palmer <daniel@0x0f.com> wrote:
> >
> > > As suggested by Linus I have dropped the DTS commits that were
> > > in the series to add a usage of this code to a target.
> > > If possible can you take the first 4 commits for the GPIO driver
> > > for me? The final DTS commit will go via our tree.
> >
> > Looks to me like patches 1-4 are good to go, but Bartosz
> > must decide if he wants to merge this late in the development
> > cycle.
>
> JFYI, it will be rc8.
>
> --
> With Best Regards,
> Andy Shevchenko

Yep. I'll take those and let them bake in next over Christmas.

Bart
