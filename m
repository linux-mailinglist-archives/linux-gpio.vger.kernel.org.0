Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A2733447A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 18:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhCJRAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 12:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbhCJQ7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 11:59:39 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D94C061760;
        Wed, 10 Mar 2021 08:59:39 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id j12so12356430pfj.12;
        Wed, 10 Mar 2021 08:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fM2XszTB5iQrfwOGlFl7zYdFhAJ3xGKdWUi0oqImvyQ=;
        b=Egl/2w8SY3JfrYNHBkiVnVNtlIg3J8CMDpI7eJUYaUuWYXBmJUlagXJGkBHwCJIBWM
         ORRwi6Ah+1kP83GUtw0cOqDxw6aKVTJgcYX4YQkwnY1HWOOvkwsbULtumSsPKTp/mlLr
         9cA0Wh/hR7bpsG5GxnjTVfSRC2v4fgidJHOMBgLIVHBeKwOBOx52U8GuQY6asRq/iY4k
         CLvrPG25gz10uXtpZgNlBjmwguE8Be0MZA7QnphZrFbMIo/w5wIOtmVARq+qc0PeA2VP
         INftldoimR9LK9AfYtDsMWWO3HC9LVRfZHF6Of+etOiO+09BiUGjju2VYrDKPSR6onpl
         O4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fM2XszTB5iQrfwOGlFl7zYdFhAJ3xGKdWUi0oqImvyQ=;
        b=WVM1Ez2pm7Mg8IOJ+nwpTdaf2jm5mLIRlRwx2Wten3U8O7BMAUW/K7qkqTPleNSAP8
         4DSE20snEDcnBoiCRtDrwhXrgDuiWKT3jMZ01ZdVNbA+5iw1fIiAcLASuAkowcfeu/YC
         INtc/mne5vBRvmQ5CMc0BxT9f1pz41gf1AwKvIGKE4C1tK1tUGcYVuUeu4/s50CABEkP
         kj61cR4XXU+EBiXZjLPbA5gCyhEC40WB8kjYqhCnLG5bF0x7zrTTl8fGcy0fO+AeFnZo
         L+Lk4yW5QaTWAbapLb3+g4ZyqWJAmBPh7YafgHljiHlQs0z4zDDBQhjGnE/m9oySDNg1
         YlKA==
X-Gm-Message-State: AOAM533KwbHYRYuKwO+Sd3rEZMrbw//0MaiAxzWolJ8dV0IFfU/DxTIg
        tH4hvmv2IgWIrL/hgQa2Yg+WVCzxk1In1fJ8l8w=
X-Google-Smtp-Source: ABdhPJybhi23ZUYtrojkxQEkTvWYecFHjFQ9JyhZGDKy1FJyfW6QGgVxN5pff3UCBwQ+L8AKdASW86/dBUrBn/t4eY8=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr3464586pgq.203.1615395578901;
 Wed, 10 Mar 2021 08:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20210310111210.1232-1-shawn.guo@linaro.org> <YEi3D2fCBh/azOnb@smile.fi.intel.com>
 <YEj5eXKALP43Cf0F@builder.lan>
In-Reply-To: <YEj5eXKALP43Cf0F@builder.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Mar 2021 18:59:22 +0200
Message-ID: <CAHp75VdHVMeF1tR3TOaRM12jMMs=mG4TtdFLt3Z2+vkjp1QQ-w@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 6:55 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 10 Mar 06:09 CST 2021, Andy Shevchenko wrote:
> > On Wed, Mar 10, 2021 at 07:12:10PM +0800, Shawn Guo wrote:
> > > It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> > > problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> > > resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> > > layout of 3 tiles which is already supported DT probe, it adds one
> > > function to replace the original single memory resource with 3 named
> > > ones for tiles.  With that, We can map memory for ACPI in the same way
> > > as DT.
> >
> > You are reinventing a wheel, i.e. MFD framework. Can you simple utilize
> > devm_mfd_add_devices()?
> >
>
> But wouldn't such driver need to do exactly this, and then set up the
> mfd cell and register it? So the new wheel would still be there, just
> wrapped in more code?

Are you sure it will take more code?

> > Basically you may write an new pure MFD driver (drivers/mfd) that will
> > instantiate properly the pin control driver.
> >
>
> In contrast to typical MFDs this would still be a single mfd_cell, just
> with different set of resources, derived from the mfd device itself.

Yes, I understand the current case, but in my proposal you will have a
separate driver for all quirks needed for this ACPI HID
implementation.

In any case, I just pointed out that MFD is worth considering.

-- 
With Best Regards,
Andy Shevchenko
