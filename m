Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CFD3E2DE4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 17:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244662AbhHFPph (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 11:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238025AbhHFPph (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 11:45:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EBCC0613CF;
        Fri,  6 Aug 2021 08:45:21 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ca5so17228315pjb.5;
        Fri, 06 Aug 2021 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OP/DwMfaXhmi9Anxt+XrChkg1EoYFf1qUMVhXm7n5yc=;
        b=M44fXBNRSHhVprgWdKqPQ/HcFNMs3T77P58PsTj+bKywb8ShVl3CtSA7cFBrUmypIf
         xSTq+N5MRtrCMN+2b1vKk3J00Ii0XJzDElCQSGyPYFW6zJF28KLG5OnjijD9svw6cbxy
         Rt2ybyJ6yZ2drDl08EU5tuzLaC0zrf2qqBu9w+d2mRlDiKH42h9ZXmwoqmfHJamosPsX
         jiyz9QC7yJO0U4Ru6oxGeEaDsLM6n5mmpOgtuBbazWO7mzrSwz+nH3Cb88kqIopsLeIz
         EuhlSXBVTTO8K6Kbp8rrnFO7PzcKzf9VpwNMbOa7xOwQZ0le7LCjlye9L3ljkmfGHf0u
         4jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OP/DwMfaXhmi9Anxt+XrChkg1EoYFf1qUMVhXm7n5yc=;
        b=Sg8xU0aECfzsePSDi0dPk0u450nCXSGYT6W8bldrJtUsGeWuKcRypG8/SXUQLwwbvc
         Z7QFCyJ9Boy4dVkwGxT4pGBxtwcLSeIZoCOULiQciB0G2gFbCh9b8ixFAxY1+9A494t8
         UWRg2tQIAmDeXcFFutPj8kx7SqadY/f4Jv+a+hZyl3w9sFl7Xpbx/JJzxQvO1ulQc6U0
         oSfs/l1W7oastUVPZNsqw2BlDM8aLBHM+3nCre2VFG4umPZCxhRd81cDXhmb0NwPSuAj
         0ShoUdAjxg6o0i2tl4pdaE2DsYDIucFFFSDD6kAY9YvYy9whHIs4q6yqMRn9guz/fkit
         PILg==
X-Gm-Message-State: AOAM532cMYeUhciaymFxTiBZSpOfPEyC2vTgF1i6amMx3Oljk2eSxvS8
        SzRLfvGiQcpSvoFz32W4xRO9UmHN7ikGf8YNyMs=
X-Google-Smtp-Source: ABdhPJwdqqdjdiUb7Cu9ZIRzNELVPfBrmcPvZcuh2x7KTTq/EoA2V3EYiYu9v6Cissj5xNdbl56mx/Oj0kqkR3KPr1Y=
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr215382pgg.4.1628264720930;
 Fri, 06 Aug 2021 08:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
 <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
 <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com> <CAHp75VeUcrHuBOW9LJ=sPR0atxoEEe19mpD32UfjY1NncD5dLA@mail.gmail.com>
 <CALpBJjosR8WvG=8QB=i12JSpbS3wyPbWLC_N1YM+8FSfVyL1rQ@mail.gmail.com>
In-Reply-To: <CALpBJjosR8WvG=8QB=i12JSpbS3wyPbWLC_N1YM+8FSfVyL1rQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 Aug 2021 18:44:41 +0300
Message-ID: <CAHp75VfM9QpqEyTpNOkUf3PWKLwQ3gLPD1fGZiBpEe5QXH7fTA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Chris <chrisrblake93@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 6:37 PM Chris <chrisrblake93@gmail.com> wrote:
> On Fri, Aug 6, 2021 at 8:59 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> The only one I have issues with is finding the git hash
> for the dependency commit in mfd, since I don't see it merged up yet
> to the maintainers staging branch at
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/.

You are right to ask the respective maintainer :-)

Just realize that we have more or less established form of dependencies as
Depends-on:

$ git log --oneline --grep Depends-on | wc -l
71

> @Lee, sorry to tag you in but any chance you have the git hash for the
> PR I did earlier that you accepted for 5.15? It was named: mfd:
> lpc_ich: Enable GPIO driver for DH89xxCC.

-- 
With Best Regards,
Andy Shevchenko
