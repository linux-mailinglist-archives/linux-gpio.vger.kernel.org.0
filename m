Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6642D282E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbgLHJwx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgLHJwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:52:53 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CF7C0613D6;
        Tue,  8 Dec 2020 01:52:12 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id u4so1039836plr.12;
        Tue, 08 Dec 2020 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tu5f42FGkL63/oJc2oNpZ8jvsMbbUvgh7uOvdJ/2Mek=;
        b=O7vNJwjOBJLI/9pJalAjLlx1Q4MCCW+ytfnG6xPDQezI3jsNBzKKCBKBKFitUgyUI7
         0yebXvOBDt1XJv24WfW4lwiYtPmzuQarlAitAK2MX6oaCLcyEwN2gPJKizGkoVbPkKtE
         b8FsXyh7AmFWVYxGEJ7xq5ZVxu4aJWWmVqvHIaMJWFI3Nct3aGXAtmV6UCKYZzu84M4T
         HbGRvBAvuBgHGeeZBLHBGOLM5A8g2REVnwxhg63yXAQRJXV7a/UigX0/XMaxolxEgi0V
         9E+S5RJrO0KiPjzm3tFiUGTPXozwQHfGHJtCDV14Mm1Sfh3Dl9fdhfFNvihmq5UElmGK
         drIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tu5f42FGkL63/oJc2oNpZ8jvsMbbUvgh7uOvdJ/2Mek=;
        b=DlrLoNvhwvMeHZ8UJ3SJSwcb7LXxjEe46b+bxgLds2heymPnh78OMC0NyRbbODak42
         /U/jjq3vMWFH+pNq0NYDqxJq85bku9V/GI3DbtLnkhZ5qSEYjqF30uRBY2iG8l+L9IDE
         EhDvj3vY1UEVSM30+j3kwLW6XV0N8kEKsSpQQ0LNF0NK7Msl6sAdv1QMaR8BKgfGlrqA
         mosv1tt/0UvGdkmkg1N1NZFykYui1GELovqobHTOR0rqrwWR+1frB+e3eCHD6ndsMOUK
         fCuHM9deAQI7WGcV/SVNvCRQNn3Sw4eVH+3G+Mht8wVGWF3SAQYl3EzhE7O8BQCZLQVo
         fIvQ==
X-Gm-Message-State: AOAM531TO94R4SAOj06QHVmiTif1Sa7B/31zsN3EBRpH44Ay2+jhJEN4
        B9Cezl+WfILpNDeYBqe4Cg/jZ5j3xdfyfr3unAM=
X-Google-Smtp-Source: ABdhPJx0d1JklE1Vd5ITwO8oE46AnRWfLpDTYmYnoabHNCJZDnHAjT7z3hgt5nf/R8+qSvWNWTt29A+AUBeOTql9nJA=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr20789829plb.17.1607421132501; Tue, 08
 Dec 2020 01:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20201207112354.13884-1-info@metux.net> <CAHp75Vd_iiqTYvgD59C7j+btx70s_Ge0UC4JU2uPa33enFW08w@mail.gmail.com>
 <0a04718c-4201-1d04-7ca1-6c2ddf1b26d9@metux.net>
In-Reply-To: <0a04718c-4201-1d04-7ca1-6c2ddf1b26d9@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Dec 2020 11:53:01 +0200
Message-ID: <CAHp75VdvpJYEKmG51Egwats9p7=aB5OeOkJ71PqmQv4Evn5u4A@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpio: put virtual gpio device into their own submenu
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 10:12 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 07.12.20 16:42, Andy Shevchenko wrote:
> > On Mon, Dec 7, 2020 at 1:29 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >>
> >> Since we already have a few virtual GPIO drivers, and more to come,
> >> this category deserves its own submenu.
> >>
> >> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> >> ---
> >
> > You are not a first day contributor, where is the changelog?
>
> grmpf, didn't expect this is also needed in such a trivial case :o

My point here is that I have commented on this but it is possible (and
actually has occurred) that others may comment on it and you combined
all changes and I have no idea what the result is.

-- 
With Best Regards,
Andy Shevchenko
