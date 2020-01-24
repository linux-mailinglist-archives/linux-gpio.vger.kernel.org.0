Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707ED148636
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 14:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388310AbgAXNdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 08:33:18 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46261 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388148AbgAXNdS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 08:33:18 -0500
Received: by mail-lj1-f195.google.com with SMTP id x14so126857ljd.13
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/AFat7RT+cMRxUdGfqmjiYgAtkCZLfg49WyUpgTPEU=;
        b=uh0ANzgNRzGLaHoK7CTzOZtiRhm/QVyOpKJ55PnDOxr8SVtXZB7q496VSvhGnM4/qe
         pVuF0Q9GYHt1EPoAyaj/gBlELlwpWeai/OBvdzUWwxEkB90y7eYXxO/JbVLttF8wTXgU
         qGPqVOarJNVWK1Llmq2vCzlHDc7uZKwL34Pt4rAZa6WGRTJwjetiCFqYjzyM0riZJ09N
         eCZDbyguXejwe14CH8aMyUnAWS0HEl6qdYZuTuERV04OAG8EMca0wQzH9gvITWVsQlby
         M9YKwbZI1gCyJZsL7D1yzL7RemImlOPdtEbMGEfrdTeIMJNh48q4fZksjabtAbJH4ERG
         3ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/AFat7RT+cMRxUdGfqmjiYgAtkCZLfg49WyUpgTPEU=;
        b=RBbKFNp1RNjq22h0e0X3Z2cJMsCHQhD+u/TRpwNrFPZvB0KwwCGDrC9TPjQw37Ibe5
         CGRX5LR8RkfsdwJAesWK2KHxuULhTnm5J82fjsX4qxjayELdo+XC1Q7GBo7DBVSxDa0M
         dTp/bnN1q3h8pZo2+ZOjEHMcYfeVKC6YG3HlefnLsDq12IKgy8Fb27j04Cqytw36YloI
         H5tVzFcAUaTK0sLVOl5A4PR0os2EQ9ZIQCSwyN9BYQujGUGrG7KJXzmjFmPh7YP3PSmy
         ijwkqxVqy3ABD34d0t7ttuX4uEgSViLIcwdg5pidYk2ywlV+37qc3nMhMefx37dGl5rW
         YnRw==
X-Gm-Message-State: APjAAAUopNBSxRiSP4CGJn1fQK7meU/pLh04aPHuI6aTJCsD+mWtvRHZ
        gl6E9q0K1yCxPB3yN27N1InglYvm8H+rOv638llT+A==
X-Google-Smtp-Source: APXvYqwfenNWKZmuP0hmwSn7ZShR+vJXZYILPRvJs8VwSBy8WxAmpln4YZoS+3+nE8OXs2QnEV1EE/cdbL42JhxrScI=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr2365686ljg.223.1579872796344;
 Fri, 24 Jan 2020 05:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20200120100957.GA11113@black.fi.intel.com> <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
 <20200124105735.GC32742@smile.fi.intel.com> <CACRpkdba9zw3qN5MEVsRhdkebVfi-fHoiNU+FhCZfpoZ1g3vLw@mail.gmail.com>
 <20200124132137.GG32742@smile.fi.intel.com>
In-Reply-To: <20200124132137.GG32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Jan 2020 14:33:04 +0100
Message-ID: <CACRpkdZaG2u-ty-YArScVsr6=Xvog6PFw75NZf+1pma3J7nWxw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.6-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 24, 2020 at 2:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Jan 24, 2020 at 02:02:56PM +0100, Linus Walleij wrote:
> > On Fri, Jan 24, 2020 at 11:57 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Jan 23, 2020 at 03:45:14PM +0100, Linus Walleij wrote:
> >
> > > > Pulled this into my "devel" branch for v5.6.
> > >
> > > Thanks!
> > > How long usually does it take to see in linux-next?
> >
> > What I need before I put it for-next is successful builds on a few
> > archs.
> >
> > Zeroday has been smacky before so I could quickly cornfirm the branches
> > build fine and that made things quicker in the past. But as of lately
> > zeroday comes and goes a bit sporadically.
> >
> > I can do local builds of some archs but my computer isn't the most
> > fantastic workhorse really.
> >
> > Lately I am investigating a cloud build service, it is quite promising,
> > you see the branch "testmerge" in linux-gpio where I merge all
> > the new stuff for GPIO and pin control and toss at the build server,
> > so I am working on something here.
> >
> > Sometimes I just give up trying to build all stuff and submit it for
> > next anyway but I'd rather not have to do that, it usually results
> > in a patch storm of 4 different people fixing the same trivial
> > issue in linux-next...
>
> Thank you for so detailed answer! I didn't mean to complain or so,
> I was just wondering...

Don't worry about that, it's a good question.

I am looking a bit into automation and testing right now so these
things are very much on my mind.

Yours,
Linus Walleij
