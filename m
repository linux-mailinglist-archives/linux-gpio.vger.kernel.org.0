Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F7726CEFE
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 00:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgIPWm6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 18:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgIPWm5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 18:42:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577FEC06121E
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 14:25:28 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so8542100lfr.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7GiT9eDSqdWyYzWccMuLBu4d8BPz/ksICennMbNChNM=;
        b=NoKXXjtajoWY4tEFRPv2OskWdH4HGzBP1P/qSWuc9FaxXQ+8jqAufht1vLsf99B80m
         riS1+DGjBqL6gylbik034bUF17j9V99bs70Y39lHhiPe/wMIYMIz2lBihGBf7VXA18TC
         x/1r0GtDrUau+gBq35J351RVX/wmtLLAbQfhrLLHoTXxuAlZPWZmJF9CfnGH2lPNg7ky
         G+Wvyg19qnDvcL5dQN6srKoGXQIWyBR2ty79taasZeDEJ9vriuypOmN/LvMPVhL8WhZx
         vvqQpJILvKOL/cwoOgWCByZr7zkqmbwEeYvHTObSbVXIPOLwa6PKMEkITFWYytcqnf8b
         fSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7GiT9eDSqdWyYzWccMuLBu4d8BPz/ksICennMbNChNM=;
        b=gjc+kXtjCTXd6ijIyrNHP7Z3r+06+QJ3KhYLNUVoxJRqFuQc5auwpG8wzXLIDj0iW8
         uKLQjnIxnpS7JHNNMAEg/k0E+dAdKUhKuQA7djLf53Crh6TsuBgw3YkupTsqD5NeyuwB
         0qJW9mRQFA+iiYDBA7UXoMJfwECc/rDi8FELxXKWUrBuP7H6aQxskVzfwNmE6sNMS+Aw
         8DcaaO//d3z2zUHZeB9aJvoxqhqXFOlorAPptFJR7SB4H/wUGmlMLLK8A8uISHhc1CjM
         dVGgRdsGbsnLUx3ygbXW4I5VgQYHb3d3EaO983+Ccn1PLq8V79D4qc8Jc18w6DmLmEeH
         eokA==
X-Gm-Message-State: AOAM530mk/WUsMf6Bi4MT44QZ+AT6HmoPeHC1Dx+bRs2BVVVw9oVktuS
        JGbtiHvff3ki5OcEPho4mYYNyJmhhDxTORrDdvVwZA==
X-Google-Smtp-Source: ABdhPJzs5b4eYGb5oM4j7BucCL1k9GFEUi9CJ1alb6woPq/13hXbCACv89mQmtJYmPgH7ogIwt1+WAgGpNdk80Nlso4=
X-Received: by 2002:ac2:51a8:: with SMTP id f8mr9031976lfk.472.1600291526503;
 Wed, 16 Sep 2020 14:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200916134327.3435-1-brgl@bgdev.pl> <20200916142930.GK3956970@smile.fi.intel.com>
 <CAMRc=Md5diJd+C2j_sHcZN5tM+r_W0Tz-naK1s=qd1bx-_g0Ng@mail.gmail.com>
In-Reply-To: <CAMRc=Md5diJd+C2j_sHcZN5tM+r_W0Tz-naK1s=qd1bx-_g0Ng@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 16 Sep 2020 23:25:15 +0200
Message-ID: <CADYN=9Jc54usoTcJs0-yZm6MV6Txhh+g7CwiR+PWszr2Ndh6xw@mail.gmail.com>
Subject: Re: [PATCH next] gpiolib: check for parent device in devprop_gpiochip_set_names()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Sep 2020 at 16:47, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Sep 16, 2020 at 4:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Sep 16, 2020 at 03:43:27PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > It's possible for a GPIO chip to not have a parent device (whose
> > > properties we inspect for 'gpio-line-names'). In this case we should
> > > simply return from devprop_gpiochip_set_names(). Add an appropriate
> > > check for this use-case.
> >
> > Ah, nice!
> > Can we also add a small comment in the code, b/c w/o it I would stumble over
> > and eager to remove looks-as-unneeded check?
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>
