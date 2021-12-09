Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C259546F746
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 00:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhLIXON (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 18:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhLIXON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 18:14:13 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189E5C0617A1
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 15:10:39 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso7959655otf.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwQ3/cvUvZwvZqmL1mCJROo89LdfAWk6eb0jRU/PPfA=;
        b=bleUAVWorez5jOJY3nEoJbhU7GbSzr7+LS0r/JZcBeOWYf5aC10+VHh1ubUWal9iJd
         cve8rftd0oSuPhuyK7h5v8ibpurBcfClv8FKcPwStqgxE+CzFri8DEFVIMMa6LqUnAZ5
         s7qiYV96LEsYjQWMsgZ+hx+gTGbr6JYOD/71Jh6mDb3igAoMD2tjfxy0XFWfonv4iC6W
         L+hKdh1GAzFl02VL/sCz8Qc/U74qa0skgCKkwXCBDdoSKC+Nv4gi22eJ4jeHjrVat7j7
         mbSVPxIYpxe9vMpMFzmYxEQzCwCnVhEz7p2vBjDQY9ZvfrxX1CGEj5e/fwcBz1EtGT++
         N7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwQ3/cvUvZwvZqmL1mCJROo89LdfAWk6eb0jRU/PPfA=;
        b=H/y6vExRvxILDFlKp06xIxfrPsdbjyygVmLKI8OSAG2gxV6wv50+jbjW1LUiieOaqX
         PHnPfeTUaJZK9iwvWHE71EsNsYivc1wxb51N130lKHiEikwzS/Kkf0YfodwFopZ8CVRt
         xveBnIGoOKTjefmMpXkCOyYJ4cE57CmJ8Gl71fagYG+Ce8NSREMZmUzA3rN+T57CUjOy
         aOUpYXAcgvbKWBGu4elr8EnvhyfpB8vzSuS/h3jNSe+dnQRIkm5pmC2ABuznibNJFnDI
         wSSnjxFqjYuCsQ+vn5hNOZ/uAP9/lth/t2uSwk37ZERFCHjrI2pN7O+BEI3ApZiHV0DE
         aN5w==
X-Gm-Message-State: AOAM531iSwqlpx+gmfX4liMMWPSQqE1YZUQ6xCLJMhDqowfKgGXhDYck
        gaaqZbHJYaHQUuiZ9TbLNvEUOQ1NWG6QN9GFOKwrOA==
X-Google-Smtp-Source: ABdhPJzo+Qn3beEC2GCP40Dln8g3w03FB1cYts0c1cuXhM0sKcR+azpj0wOy3oZM9W3SYZUtgtldhp9j0UCVfnGVgMc=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr8426847otg.179.1639091438012;
 Thu, 09 Dec 2021 15:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20211209113456.33977-1-andriy.shevchenko@linux.intel.com> <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
In-Reply-To: <YbI2Xb7gBfN4Kyid@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 00:10:26 +0100
Message-ID: <CACRpkdZxWpygHBJFmuXft5yWhA9SWJzEubC6Oac0dUsLeFAjSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] pinctrl: Sort Kconfig and Makefile entries alphabetically
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 9, 2021 at 6:05 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Dec 09, 2021 at 01:34:56PM +0200, Andy Shevchenko wrote:
> > Sort Kconfig and Makefile entries alphabetically for better maintenance
> > in the future.
> >
> > While at it fix some style issues, such as:
> >   - "Say Y"/"Say yes"/"Say Yes" --> "Say Y"
> >   - "pullup/pulldown" --> "pull-up and pull-down"
> >   - wrong indentation
>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v3: fixed more grammar issues in AMD text
> > v2: rebased on top of very recent pinctrl/devel (Linus), added some grammar fixes
>
> I have noticed that you applied v2, thanks!
> Do you want me to sent a followup that fixes AMD help text?

Nah just pulled it out and applied v3 instead :)

Thanks,
Linus Walleij
