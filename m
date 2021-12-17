Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CBD4793FD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 19:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234378AbhLQSWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 13:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240374AbhLQSWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 13:22:02 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EC5C06173E
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 10:22:01 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id t5so11282004edd.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAExYnt/OSqBYKLoNQ4AMfMk/fL9u+7NT5tSWpjmdI8=;
        b=Gz3n1BxAW3inesRdjZjwP6JY1ZwUBdoGATXe0XPrpheq+iSJDucNfTc+062dhVmHVc
         3NIDxUXfMu2M9QL3MSYtbD035GwY56dlchdATSqZQJ2e/rl/Ct7BcOWYpGOdAagSL8i4
         7fW3eNCzIJn3Nun43PigImUhq7eYmY/4cDQoy2Sp/MOa+iTbS+IGD5TXlLQQ+/Rsp8mf
         +aJscfLJ43dKp1pXBhO9x+xLBnLv7f3w78I12JQWAdryL8AFZ3eYmoWgp124QHRImLM2
         KuaL9SalcryCEYd8CDu854BNZGFNZw0vtUpuhxqgc92fHKVOsaws8H4yN7tgI5eOjqds
         IX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAExYnt/OSqBYKLoNQ4AMfMk/fL9u+7NT5tSWpjmdI8=;
        b=1fsjJ7faC5Y+R7cXxyyahWsRl63dqMvLG6YjH5GCHG3S9roCBDANWxwQh9crTPOFda
         9h+HpwrRqqa6NNOAQAknP3dpAn30GvI6Rrfccf8Q2+1CsXTi/6SDz+gPU97QkD/Olln7
         O6RNAAgqet9mX59SZ6kIRmyUbgiFR8MS/4zVUy+61XV8EMX2NuCIZ+u/zfg3yCYEQoZ8
         ahbvG0a/RyzFBLgJIG2GUrlq1a64vieVt4BZnDYR6eIKVHv3WuiJaf9+7MJPnJqf9M0T
         l5PkVQUrlHHErH8M9ktnSzbv629tvou4qN+RD+/EkQuw3AL7JQ4FL0n7koDIiwnJ1iQn
         2IOg==
X-Gm-Message-State: AOAM530qkHe8aBb3YvQHZHLwHhDHAXM1NClc73z5oLhg6blhOSKvu9xG
        suIur8APniROEmqp+vonF29ufzZVrfrHY37lEjodjg==
X-Google-Smtp-Source: ABdhPJwSx3jl6sTcTWyWeR8F5fIS4c+qncPKlI4kl+b96qON4w38ODCcROcMgFkgkfwg5CovKHtzD3apaG0Bxee0ndE=
X-Received: by 2002:a50:e611:: with SMTP id y17mr4055831edm.270.1639765320363;
 Fri, 17 Dec 2021 10:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mct9FuYvT-0gFrpUuNBnCVdmCp_cNESkL5NSgVVP6vezQ@mail.gmail.com> <YbzUJkCsmkz5jraQ@smile.fi.intel.com>
In-Reply-To: <YbzUJkCsmkz5jraQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 17 Dec 2021 19:21:49 +0100
Message-ID: <CAMRc=Me2_v6tx_LNn2bnHFhXHUm4pXuPen=GdX7SOuKxiSVKDA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 7:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 17, 2021 at 05:54:00PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > Queued the series for next, thanks!
>
> Thanks!
>
> I hope that v2 is actually queued. There is a tag from Matti and addressed
> comment from Linus.
>

Yes, I queued v2 of course.

Bart
