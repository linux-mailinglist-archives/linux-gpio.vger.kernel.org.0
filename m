Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171404773E0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 15:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhLPOCG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 09:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhLPOCG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 09:02:06 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB17C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 06:02:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id g14so86374081edb.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdU1E7Xc9LDK8aDPS2k1yPPFV+VdC5eQrZuLbZ/U5FQ=;
        b=qACEawK6atXDHxNlCDo1wU22dktJox0tDdFY5UAKTl1/1Y2VAy8XJifOA0YWFtj6W/
         J45e6vK/KCag8P+bn5UddgcxsmVm2bmg+J1krE66mHN4erivLDXyHQWY6785MjdPX9Qc
         kWGMxwjNLmuahxWF+FHEmGIY89nAIann58cBn+Q0YRHkNFlU9kxsEmmgkF51vgCHbxOK
         9D9awYpzwuy7cW9Gf82jWP8MaxYNOQjvSRvn7OpxjAVjYhoNp0PFstFv7OMgLu8gBumn
         dlmt/Clz3mxVptIZqSKpvpGjObYp5co68AxWHWSMsX1++9k30CL28pKabnyDsfFGxxEM
         cDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdU1E7Xc9LDK8aDPS2k1yPPFV+VdC5eQrZuLbZ/U5FQ=;
        b=Vzm6w0DuDyL3ZBr57plQuOoOoms4LeAB+QvecZYONO+BZEuIcV/7YFXYcYbzuKHJdr
         SbzmgQwqCnjhn2R+M+u2bS+VM15TiDwTSJtMKFQOMvNq8FBVc34XFsC2O6mymYtGzLE4
         w5nQxGtsQbM7vG9FMPM8ZZxZSAlcEJpBgBY/hsqXaAqB11bbTxZe+PWLKa7jmw2FaPzc
         c1cmqyYcUDHLFe35ajcFdOxBcmxJcqgMDfNNK1Y6L2Vccrqnqt34lTXHCzUdRskz9E2l
         NB9RPGe6hAM3KHBWXi65W2axL4N8LvDguoIUdZa4B7uV5p829OpBWBMH5zC0UXPiedhu
         grSw==
X-Gm-Message-State: AOAM532ZICU/R4SSgjXkwKVuxK8TFHWx3YEu0L6a0R86Oi1jv13hNx/+
        0TMHmKF0aTvBcoWMBN5L3a5m/8LnOYIq3bE7+TA0jQ==
X-Google-Smtp-Source: ABdhPJxcCphsUB1z4oE3YG+iocQu1KgoOp4PUYFAnddYF60HqeamCv55HgCL0vn8Z+CuukAbH7hxyuMa/8iRRHH4IkA=
X-Received: by 2002:a17:907:86a6:: with SMTP id qa38mr16110613ejc.286.1639663319878;
 Thu, 16 Dec 2021 06:01:59 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com> <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com> <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
 <Ybs5jqW3zyDh18Vx@smile.fi.intel.com>
In-Reply-To: <Ybs5jqW3zyDh18Vx@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Dec 2021 15:01:49 +0100
Message-ID: <CAMRc=MdWQEk-+-rq5ML=Yj-7ZTFMv6B0WocgqWJQu6GPkOsx2g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 2:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 16, 2021 at 12:46:11PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
> > > > On Wed, Dec 15, 2021 at 3:33 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > Hi Linux GPIO  maintainers,
> > > > >
> > > > > Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
> > > > > GPIO ACPI library. It has ben a while in Linux Next without any error reported.
> > >
> > > > Pulled, thanks!
> > >
> > > Thanks!
> > >
> > > Are you going to pull series with the OF node assignments clean up?
> > > I forgot to mention here that my PR does not include them.
> > >
> >
> > Yes, I'll queue it this week.
>
> Thanks!
>
> Do you know that your branches were kicked off from the Linux Next?
> Are you going to drop previous gpio-sim from the Linux Next?
>

No, I didn't, thanks for the heads-up. Old gpio-sim code conflicted
with the one that was queued for v5.17. Should be good now.

Bart
