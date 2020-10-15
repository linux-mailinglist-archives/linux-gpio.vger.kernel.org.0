Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E30F28F1E3
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 14:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgJOMQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 08:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgJOMQl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 08:16:41 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70629C061755
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 05:16:40 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id q9so4002344iow.6
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hu2HVsowDHTEU6/j3jWKM66roOx9DvFrYhykuAfIoFs=;
        b=qLrRqRlBWSC3csH1UdkBVeBguJR6450ilAGBSTMATLeJtNFqrIAt8thytDbf6DM38H
         t0BUdNtuogeP5oT9xL79cc4y83UYwGvYPzMaBcu/PshVEL7mkqOQv78QeTbI2s661J8T
         7wV+9rSjmU0AGYVDqC9uKRevcBSOZ+M6JWugaGZUN5hxXr9340QQXLUCAJBxONHrZBC2
         X/gxWw1r96P3rxOO/zGHmv00mMMoUU60alfq8P7RPJxJYZL46l2mXi4AKWtxAEhqW3B0
         za5jTwP2q52vAvw6kaB5+FDVBkIJFIbnqE1NiZbeUdVkt7PyoZ9sTsiIAR4ybHjTU4Yc
         DUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hu2HVsowDHTEU6/j3jWKM66roOx9DvFrYhykuAfIoFs=;
        b=lNWrF95YxBZkPDN4Tu007X/PUFe1zVZdbvt8pA+jQEpUCXSFceAuGd76pkONDZ74Vj
         kHZFEHb8ntMROehvhzMTmcBeUvb1GbQR9GmRcC+4uyxxrIHoYC/chSuHOhJIIzj0j564
         dpu1kua3xvst6ENQ0VsnsKt5mT0qRcYwSRFNNrJ+N2VwK90MXfNKyg8R4ZZpBSCHZjzs
         Vdk8U7Mna2CoeRVV6Ac2vHIRG5NrhOBMorJwxmWuR7gSZeMoq9SuNDZbnbVhB51AMrKH
         BcM3AuKzLpKuh6voSRz/n4ddW67aoNp5KZyquy3vFNOBKykZomnCHaFgczKFSMzpvzw4
         v4OA==
X-Gm-Message-State: AOAM530fbJVqtpydZeC3tI+OFYfQPL0mGqE0Io+RQRkBvrjlQor7wej4
        vRHtRn9Vq7/0FhxlzpCFkGiJU1XbsP5XaUd6VDhMZQ==
X-Google-Smtp-Source: ABdhPJwSzayF4DxMFbVKrTsj2atBKb6HAqCVE9GYzpKfWqqC/M4SPPUOd3Tt6Y2dRn2uQcQuQSqTHIfJPJaAqBAmlEE=
X-Received: by 2002:a02:6952:: with SMTP id e79mr3198492jac.24.1602764199807;
 Thu, 15 Oct 2020 05:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev>
In-Reply-To: <20201015121312.GA7166@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Oct 2020 14:16:29 +0200
Message-ID: <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 2:13 PM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>
> On Thu, Oct 15, 2020 at 01:43:32PM +0200, Bartosz Golaszewski wrote:
> > Well, it's a long story. It used to be what the kernel calls REALTIME
> > clock, then it was changed to MONOTONIC and now there's a suggestion
> > to make it configurable in v2. More on that here[1].
>
> Ouch. I was wodering already as the timestamps looked like REALTIME
> here, but I'm simply using an older kernel. In that case the type of
> your timestamps should depend on the Linux kernel version, which is
> impossible to do. All you can do now is lie for older kernels.
>

The library doesn't define what the timestamp is really and so doesn't
guarantee anything either. This will change in v2 as we'll make this
clock configurable so we'll have to define that by default the clock
is MONOTONIC and can be explicitly changed to REALTIME.

> > One question is: even if on linux the steady_clock is backed by
> > CLOCK_MONOTONIC, is this a guarantee or just implementation? And can
> > we rely on this if it's not defined?
>
> Like the nanosecond resolution of steady_clock this is certainly not
> guarantueed. However, it is rooted so deeply that it is very unlikely to
> change. In theory, there could be a chance of changing it to
> CLOCK_BOOTTIME. I don't think anyon is going to try.
>
> At this point I recommend going with steady_clock.
>
> Helmut

Ok, will do.

Bartosz
