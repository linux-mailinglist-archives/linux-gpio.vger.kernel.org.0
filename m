Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B4C33B927
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 15:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhCOOFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 10:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbhCOOEu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 10:04:50 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE8BC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 07:04:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x21so17457561eds.4
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ThaXMGEpT6BnTHGat0ZY25xQtwOn6HEUtZOw4cfytPM=;
        b=vQw9MAwolIYek7+ndVUplRVJwQfFwA/itaZndNXUFLqncmbkCsZV0HRj91qKH22QOn
         3km5Tt5dMddu2eIITvleSUes6exzHF93pgKloihb6ZC8UsV4UNs9pyNDWEtOjJ7ZmHkN
         Lgj60icPYdPDARh8uNeONWM8vViBFc91XpMqcZBvS4H4XkrqjRG1ewS6o7nUpECstaJt
         +4LR9WaqUSPPph8X9XS8Jnsne4+iTMcPVTThmZSVbLDIx9XFev6fOpawyYoqkN9AfUDR
         Y7LiGOogWMS0b4CPX2eUWmAGlJO91imP2/efnVwqZQJg7TSfy1D7aD6jQDQ3qqAqPp2Q
         yJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ThaXMGEpT6BnTHGat0ZY25xQtwOn6HEUtZOw4cfytPM=;
        b=V1Gv3q9tgP3XLkuKD5tEZ4MtlOn8Y4+a1eKMMparQJZfH+ActSepJ0NML86ZN5gtPR
         0JdYMZT5Tlg/V42otZfmrdxHe7U9UJ/5RkDJB7GxezCDhzXUimPFSW7JA4ybyj/VTiB5
         J4dDuXGO0tCQZuN0WI3ti1Zgirkqhz8FyVRgehfvBK8OoITerWAzpW8NZZMbeE/G//ES
         zPPHQd98kdnNmV0j727rZ+4sIRdMHNC68KZGxQ7iu28v67vq2yDdmeyVfuHTT7DpYYXW
         YUbo1J9x1aduIOR3B+WEaDINr7LiSifFz6rLepJpwxWpt6YRxk4qbvOiITurfCgx3nNZ
         CGcA==
X-Gm-Message-State: AOAM532uNXzxiEmYlKeRweJez2MFshoJHxF/qPyu1cn3wXngr4ossv4U
        99p77a3pn6f+vlVmgIUtCr9/VDlljpiJBtvvbhGGag==
X-Google-Smtp-Source: ABdhPJypbu2r2UdJhsCFDkhRAXSi6AGamZMeyLroxMvtbDbCrrqbUuuohfQEDfdtdoH9qQlaLYQjJkxvPbvQMsonGQ4=
X-Received: by 2002:a05:6402:22f6:: with SMTP id dn22mr29613666edb.214.1615817088622;
 Mon, 15 Mar 2021 07:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com> <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
In-Reply-To: <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Mar 2021 15:04:37 +0100
Message-ID: <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Unfortunately while this may fix the particular use-case on STM32, it
> > > breaks all other users as the 'gpio-line-names' property doesn't live
> > > on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> > >
> > > How about we first look for this property on the latter and only if
> > > it's not present descend down to the former fwnode?
> >
> > Oops, I have tested on x86 and it worked the same way.
> >
> > Lemme check this, but I think the issue rather in ordering when we apply fwnode
> > to the newly created device and when we actually retrieve gpio-line-names
> > property.
>
> Hmm... I can't see how it's possible can be. Can you provide a platform name
> and pointers to the DTS that has been broken by the change?
>

I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
the WiP gpio-sim - but it's the same on most DT platforms. The node
that contains the `gpio-line-names` is the one associated with the
platform device passed to the GPIO driver. The gpiolib then creates
another struct device that becomes the child of that node but it
doesn't copy the parent's properties to it (nor should it).

Every driver that reads device properties does it from the parent
device, not the one in gdev - whether it uses of_, fwnode_ or generic
device_ properties.

Bartosz
