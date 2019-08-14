Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB188D016
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 11:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfHNJwO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 05:52:14 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46538 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfHNJwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 05:52:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id n19so10486348lfe.13
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6oS3+Z8bNVWTzWKRg3e3Ao59PLYqP3pwIZElqyzC+YQ=;
        b=IWitqT4t5Xyu5i4UvDGPBGg+rA9VQ5morjbUv/yBGh2knY+d/namVLDlZb4EF+HK9J
         5a9PudX77ODYbZWVt3t0Kiu3bNFgOACdfOCWA2ccFGONdNXZNmkEPQslAKnWKWAhhjd+
         VFhj/5ey8++UjXiUCzDSL1Xz1Ac7Y3qzOw0ujNVbiKIvTnPJZmK9NKpya601c/t6leJ6
         2RB278uBl+vcCxY01+JH4gB4hcF4xFMxHTsyKRyMJLBoa6Nzuh0h+cp084b7QPYJnFvJ
         jwU0boyxUueo37P5jaMFsCulhgedrIz5GslWgBabMaG41w6LKZeI7RDFQBV9SAT2vDex
         cHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6oS3+Z8bNVWTzWKRg3e3Ao59PLYqP3pwIZElqyzC+YQ=;
        b=AbH3tc5iT3XtrE/1nWq/bmg6AYXeQBVoOWy82bYutrquY/nKCc0etSXn9r9tbluU6C
         XFOTNFlVBRMH3vL/HFX4neJob52+aBXPrjiObaTdOIzbbo/dPsH4zRiPyCvFxxSkWYbG
         IGGaP8SPtzR+MdjBXFsv42MKxqGzN5pYzXQZ7njMnNlD7mPC/dGzSBTGPcRn6vHJZKpj
         sWB5cKZ8kPe+P8fm6bL7Zgcw1RFmJ4Iar5woOjY4MQM9FskysYIWpixGpSonPf/yc0no
         NMuh3zhiN6CqdU/MoHjLmJIQVRbH/bCGuz8vhbELUIzGj1lBgmZbzLW5vVvG9OcoJjBP
         brgw==
X-Gm-Message-State: APjAAAWJyy7cfMtLSBq23KBTp/iCyH8auAo/m/r7WvtrDBICtdd/lcz9
        pWSgDGFeKCYgMihpDUPUlAOnGmAjFSN3R6gC2FRMCg==
X-Google-Smtp-Source: APXvYqxq3GbYiEaqhcVmGvSKuuUmLb5bDbDjudKox5vJjnhZ7KNn1sQpcFXp5QcKYgXGQ+g2nMn4HZ6xsYS5WzZfa8k=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr23038519lfq.152.1565776332259;
 Wed, 14 Aug 2019 02:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190812081351.21284-1-linus.walleij@linaro.org>
 <20190812105825.GB30120@smile.fi.intel.com> <CACRpkda_2T_eBf5AxpNG0P54KTLds-NvYDMcTWx5BtOa9kK-mA@mail.gmail.com>
 <20190814094022.GS30120@smile.fi.intel.com>
In-Reply-To: <20190814094022.GS30120@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 11:52:00 +0200
Message-ID: <CACRpkdZ7+0T170fykGs9btT-bXcZVTC-B8mhRdpwwo_kkqtpuQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: lynxpoint: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        David Cohen <david.a.cohen@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 11:40 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Aug 14, 2019 at 10:46:49AM +0200, Linus Walleij wrote:
> > On Mon, Aug 12, 2019 at 12:58 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Aug 12, 2019 at 10:13:51AM +0200, Linus Walleij wrote:
> >
> > > > +             girq->num_parents = 1;
> > > > +             girq->parents = devm_kcalloc(&pdev->dev, 1,
> > > > +                                          sizeof(*girq->parents),
> > > > +                                          GFP_KERNEL);
> > > > +             if (!girq->parents)
> > > > +                     return -ENOMEM;
> > >
> > > I understand the point to use kcalloc() for one entry, though I would make
> > > intention more explicitly, i.e. use girq->num_parents in it instead of hard
> > > coded value.
> >
> > That is better, but I have a loose plan to get rid of this
> > and just set parents to a fixed width because all the allocation
> > is annoying.
>
> I see your intentions, though for current state I think the less hard coded
> constants the better. In any case I pushed updated versions to my trees.

Thanks a lot. Yeah we live with the API we have and work from there.

> > If you are sure that every consumer will call .set_type() you can
> > use handle_bad_irq, and that is preferred.
>
> They should do this. Let me prepare the patch for next cycle (v5.5) and I put
> it to my tree after merge window. If we see any complains from linux-next
> testers, we will act accordingly.

Sounds like a plan!

Thanks,
Linus Walleij
