Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57633402F56
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 22:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346185AbhIGUDG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 16:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhIGUDD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 16:03:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297B1C061575
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 13:01:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id k4so78863lfj.7
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1IwmgSAwR+HkLZDJ9goDsuJSjvCpVb6ST440oKCFYGM=;
        b=ZNkgXB5wGRgWIsBjd+W8AGXvXd3i4LkxXT2dOGEv3DJ0gJyqOzHeOZAeYiBcaP+SC/
         jLy+lrfh8BB1pHPiSKH7W/3VLJsFwjBvMW3Ugx9mwqRVyimt4KEyUGgvOtFJ/0w0WRKa
         bwAYvq7W/Zqfe3r3Y2NM3DNrGEZAiFpoZVFLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1IwmgSAwR+HkLZDJ9goDsuJSjvCpVb6ST440oKCFYGM=;
        b=nBr9HzZ04l5GzbkYhERf0XsMNxDekIyQZ44X7mFpxTRij16m5w5wNAd2/TA1lcsYXH
         HlHl6uRtbqPNP1nOZIf7Jz1zHAhnN7vVyH1ZNVLyApItFMChOWPQ3u2osW76oWlxwOpy
         S8t9r+5bdK0zogTkeC0Njvg+o1auvuHwUEzdOmpihSuboA3cPp0DpKHYI09M5UMkL+fD
         X+1wMj84PxgoTzHrDFUnbVEMWflF5G+1sD6QlykCNfLheZrMalEabhpcJGQpiiPGvaF6
         wbjxEg8/CGAghmdCBERfM0wMUKBQGYcfZyIz+YCfbpnw8gblxPo/snhB/nKz3G/dOSh+
         lEgQ==
X-Gm-Message-State: AOAM5337VJ/UCerBlqoZ8kyOjTAU8UYFK+59OL3u/rw/Aw0lkeIFHxhM
        vS8ocaH975eL6Q7aSZllGdWMpkEUsJyWJudDWSo=
X-Google-Smtp-Source: ABdhPJw9mqfvCBWfOhKFjpVWf6GqYdaGFySuMNr7O726pAS/2Xf0TMtLrplOauvsx1ZwxdRwH/nMLA==
X-Received: by 2002:a19:384e:: with SMTP id d14mr103661lfj.114.1631044914759;
        Tue, 07 Sep 2021 13:01:54 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id u20sm1535156ljl.76.2021.09.07.13.01.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 13:01:54 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id f18so216106lfk.12
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:01:53 -0700 (PDT)
X-Received: by 2002:a05:6512:3987:: with SMTP id j7mr102231lfu.280.1631044913265;
 Tue, 07 Sep 2021 13:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083613.31268-1-brgl@bgdev.pl> <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
 <163104361220.4526.774832613459764535.pr-tracker-bot@kernel.org>
 <CAHk-=wgAi8jHOFuk8iqXsL4Aekst996HGeN18aKQhXd-qu2dcQ@mail.gmail.com> <20210907195647.jutizso7o2r4mddj@meerkat.local>
In-Reply-To: <20210907195647.jutizso7o2r4mddj@meerkat.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Sep 2021 13:01:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFkW3XGD+Ejv_mxTaPxh+tpRTCP+zufrWnNEiMm9PPEQ@mail.gmail.com>
Message-ID: <CAHk-=wiFkW3XGD+Ejv_mxTaPxh+tpRTCP+zufrWnNEiMm9PPEQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.15
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     pr-tracker-bot@kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 12:56 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Failure is always an option. Let me poke at the logs and see what happened
> here.

I was spooked by how it actually sent the email just after I had done
the merge, but before I had pushed it out.

[ https://www.youtube.com/watch?v=-b5aW08ivHU plays ]

               Linus
