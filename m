Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E90338D61
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 13:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCLMqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 07:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhCLMqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 07:46:03 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12148C061574;
        Fri, 12 Mar 2021 04:46:03 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 16so9373005pgo.13;
        Fri, 12 Mar 2021 04:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WQYnUu+syC+gJ8SAwcXk3ME3qoa+YQ2AJhsnB1gGC0o=;
        b=aE5NM6ZW1qYl1zkoxxXT5WOAWfDxAjW7iffwXjfiGY1vogvex3Gu6OIEfPk3pkHj02
         Zz0n/mYS6yu3DIevEIKnQMxpaheWsldXpzbT1a+4GsiRzh0EwvSz5THfKlyeOJwYHEtv
         fQbd0v9cr9j+ZTmbPc2NxodMfpRA2ZoW3UzIBemBJXRwE2QotCjknpoGroRvjniBw24E
         90wAYskdbVDJMCzi0XkZjYk2UgyXgPkgArT/VFNv6IDw/l4x17uKa+Dw4UymII8AgY42
         pQ+HoHkO8Bgs+x+uLgK66G/bRtgl13CXh17Va0pE3gDuCUKTj1FyBOi6V5kk6Qr3wOzn
         gqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQYnUu+syC+gJ8SAwcXk3ME3qoa+YQ2AJhsnB1gGC0o=;
        b=LpPTv1qShx7GDSDQEgrYyNgpu1ngE0WexFg/OHhZrnDTnP+csdFg1bqnwsV+ZOBPhb
         gwxeXQN79NK0wyn8mB38elgV/EemYcKlrrK6TNKJe1TELrWaIO5Z/qLC20VtRRLfQr0m
         nfU3J0G6kaAw7+QZvNnoQ5MxGW79dm1i+0vKk6lsmL6rElD4F7cZ0UOl2PJhOe7NBFv0
         cP807FnyKJxJ8gsw+DtwkmCHD/4f4CxT9msOGPdUYy+sZyWKwwHPMUQGCOpq9ky/DTZz
         Cc1fkSknteDiwb3f1N+kE3eiIOsYPVgQu3jZ483pzNxbvlpRr582Da8vI0E0QFMxqTDL
         uYvQ==
X-Gm-Message-State: AOAM533sTfCNiLI9SHxZZfEHY6KS8dG6fW1Mr34plfQL1ie/fU/l5WcI
        jVmyxPw3sfTdkXCPurD572FCIyCnAi5aWxyntCYNgtJaN78+6g==
X-Google-Smtp-Source: ABdhPJy1gLF+5uC+aMtgLHYJCioOBbsbw6QtQSyMU0wEp3yZFAWTbWaTPUhjfHXLYs31TP/ommj/TrjwbDUVXTSbb1Q=
X-Received: by 2002:a65:4bc5:: with SMTP id p5mr11478206pgr.74.1615553162596;
 Fri, 12 Mar 2021 04:46:02 -0800 (PST)
MIME-Version: 1.0
References: <d66e78e3-2000-611b-cd74-8a61461153e8@canonical.com>
 <5c08bd61-688f-e95b-5fa3-584f190ed4bf@xilinx.com> <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
In-Reply-To: <bf508c29-4a51-5f97-8459-06c1fe74b60f@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Mar 2021 14:45:46 +0200
Message-ID: <CAHp75VcEU=Axi7k41rUxps4LehEzbG12z410VVBbwPtMCbJHrQ@mail.gmail.com>
Subject: Re: pinctrl: core: Handling pinmux and pinconf separately
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 1:26 PM Colin Ian King <colin.king@canonical.com> wrote:
> On 11/03/2021 11:16, Michal Simek wrote:
> > On 3/11/21 11:57 AM, Colin Ian King wrote:

> >> For the PIN_MAP_TYPE_CONFIGS_PIN and PIN_MAP_TYPE_CONFIGS_GROUP
> >> setting->type cases the loop can break out with ret not being set. Since
> >> ret has not been initialized it the ret < 0 check is checking against an
> >> uninitialized value.
> >>
> >> I was not sure if the PIN_MAP_TYPE_CONFIGS_PIN and
> >> PIN_MAP_TYPE_CONFIGS_GROUP cases should be setting ret and if so, what
> >> the value of ret should be set to (is it an error condition or not?). Or
> >> should ret be initialized to 0 or a default error value at the start of
> >> the function.
> >>
> >> Hence I'm reporting this issue.
> >
> > What about this? Is this passing static analysis?
>
> It will take me 2 hours to re-run the analysis, but from eyeballing the
> code I think the assignments will fix this.

It surprises me that tools in the 21st century can't run on a subset
of the data.

Had you filed a bug to the Coverity team that they will provide a way
to rerun analysis on a subset of the data?


-- 
With Best Regards,
Andy Shevchenko
