Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FEA26FF6A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 16:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIROBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 10:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgIROBP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 10:01:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C07BC0613CE;
        Fri, 18 Sep 2020 07:01:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so3501680pfi.4;
        Fri, 18 Sep 2020 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6MdPkjl7MQc9cg91KiiB5KfM8M+NWHuJo4hFIyFjPo=;
        b=U/35TaPtjgB5r/mYNH/5TF4YEtf+aIq0VgrsclABnXH2l4sdR3wr1X4iJKmOEaZFwc
         yyPgo1XgVs9HXuIcwhAzMa3fFt0CqX3RQVU5LtFnP/IBdR5NEOgxbTShZWivHfn426PY
         0YjrxrRjjULwCy8zLkODLDX4LCgZUOeO8CCkeRNyJdMn3oDALTsdNMA048xGoaPAGIog
         D13ql8vSZETeGqhGK8A7x/i4CYggSqAeMOGfr8KaMz76bupXvMALX7eJYcrIyrTW7tcF
         3ekvTDbTf7mA8qsq0AjYYpJkG2YMTC03zB2QHc7Gadvyp9jo2BW7DzFMFx09AG3dddbs
         uVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6MdPkjl7MQc9cg91KiiB5KfM8M+NWHuJo4hFIyFjPo=;
        b=pMsoAz06w/phUVYM7JwubA8j+YpTsaq30M9Eu1pnumXtYZ9tyjSmx2xMVMd5EYzYk5
         AJRWf8OtV24URcSx8yJtFJATBK2NkB4NeyAFSIN6iHQxRs5/ybh9M8aoB9Zq7azXpxvx
         WHTDEWAADCaQs3zYqcB5Ws8OMgQ4n/+x7LmBGMy+x9cLc8gtqS4plNOg8JcfT8jvwYbz
         GxvMiBteraxoGS1vUjRL7Iz3v+rbt5q/ItLOjaCSVFcaRbpL8lp1ktq89C4ANDQnYBzs
         bSt1Sqzldx1vG+871WICbwpEu79h3Jz+sk5z7CvH+KYtEOC8+p9p/4Xz3IX85Zgrtysn
         C6kw==
X-Gm-Message-State: AOAM531kAgfiIbo2teZnEJrKC7l0DPntlySGuEUepa8thhooTZplRFG1
        oY0cAbC4nqhuNceYSJjUOw6w1je1zeKTPWXAvDKaaRKcEDl92Q==
X-Google-Smtp-Source: ABdhPJxLaxUDqlkyKM4Zt4Qtr48SfkxrKpVHEFvFqRA4VJdSjUII+si3cgkY+fg5GDkRfS6w/7IUzRH17v6Arv38wTY=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr26219212pgj.74.1600437674556;
 Fri, 18 Sep 2020 07:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com>
 <20200909102640.1657622-10-warthog618@gmail.com> <CAHp75VcyuPYqXTk7-yBd1dR3BitXQnz1YVkD+PuJRWVOu+1ueQ@mail.gmail.com>
 <20200918124408.GB24657@sol>
In-Reply-To: <20200918124408.GB24657@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Sep 2020 17:00:56 +0300
Message-ID: <CAHp75VcgBgqn0KX2QU+o210Fd024Cfs_YXJ6NP8NTAtKcU9XBQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/20] gpiolib: cdev: support edge detection for uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 18, 2020 at 3:44 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Tue, Sep 15, 2020 at 01:39:41PM +0300, Andy Shevchenko wrote:
> > On Wed, Sep 9, 2020 at 1:33 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for edge detection to lines requested using
> > > GPIO_V2_GET_LINE_IOCTL.
> > >
> > > The edge_detector implementation is based on the v1 lineevent
> > > implementation.

> Thanks for all the review comments.  I'm hoping to address them and get
> a v9 out in the next few days.  Do you have any comments for the
> remaining patches - particularly 10-12 that complete the kernel
> implementation?

Probably. I will do my best to review the rest, though I've been quite
overloaded the last few weeks with different stuff.

-- 
With Best Regards,
Andy Shevchenko
