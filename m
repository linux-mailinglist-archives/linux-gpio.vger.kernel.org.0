Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEB0402FB6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 22:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbhIGU2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 16:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346478AbhIGU2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 16:28:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E2EC061575
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 13:27:05 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z2so253365lft.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNnWr7VvFbJVbHak9kzp8+A6N60RsRSsS3eaMhvDg9w=;
        b=dHhZoSbrc9jWRGG2vEoUeiijoLGiPxW++foOws+QuVh2LrLYuJ+tCVwuNxIipJVZiL
         oR7MAdYImKp2LiksWPkITfXqUtoLqq9zDDbaTXUMBNnZUPgMzpq25BkouYXu/XVZq0lB
         CPX5srk4/vlW/QWGQ0ICoBHq8bPy7YQhkNDmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNnWr7VvFbJVbHak9kzp8+A6N60RsRSsS3eaMhvDg9w=;
        b=Jfh1soRAwk9XmwueRCRE1v+jC12U5x5rwIzUFdi09Jez5oRO7QtQway+P1Hs/Oi3Lh
         zIFW6q2QaHLmEpBfEa38FgC3eESlBY4kTt1qKgGexSGzlDhEb3yttYlBbdNykUNxKx1/
         l6Eue4OvFT8+4Y6eoTGM4Woi0kN0JyvggNunq6WMN7wC8O34XZeKI4yo0vAIR1AYwMfl
         xC13P2iZnWJ2GV6bLXI9jbPaTaO0VID3djkM4lhu2zvr62lovq79rF3wHq2tK0Fz72ye
         K91aMeLp8Gtag/94d9VKrri96mt0W404DDz7FPsOY7xD49dIC4lnM5id9kcZLxAbbWx1
         HmZQ==
X-Gm-Message-State: AOAM533cSFa+RQ49z/2ocW2c/Yg1/kNbEz3SSoqYRlTdTvVK+iCpSspx
        p/TdnbJnHITDwFa0p3D84eA7tk03E1PBdWDS784=
X-Google-Smtp-Source: ABdhPJz5/L2Owxc3tWYXZhOo1hx4BCiBcmbH65IKl+uH0liypTMd3pdclsVRbvrikVkaPlVUL6ThTQ==
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr133548lfo.689.1631046422854;
        Tue, 07 Sep 2021 13:27:02 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id d5sm1095219lfv.14.2021.09.07.13.27.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 13:27:02 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id y34so201668lfa.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:27:01 -0700 (PDT)
X-Received: by 2002:a05:6512:1112:: with SMTP id l18mr158455lfg.402.1631046421443;
 Tue, 07 Sep 2021 13:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083613.31268-1-brgl@bgdev.pl> <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
 <163104361220.4526.774832613459764535.pr-tracker-bot@kernel.org>
 <CAHk-=wgAi8jHOFuk8iqXsL4Aekst996HGeN18aKQhXd-qu2dcQ@mail.gmail.com>
 <20210907195647.jutizso7o2r4mddj@meerkat.local> <CAHk-=wiFkW3XGD+Ejv_mxTaPxh+tpRTCP+zufrWnNEiMm9PPEQ@mail.gmail.com>
 <20210907202047.2tm4q5euaxlb7cjz@meerkat.local>
In-Reply-To: <20210907202047.2tm4q5euaxlb7cjz@meerkat.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Sep 2021 13:26:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiEPq1QkCMQvL449rdEbJmhkpUo0Uv5OkisYeYKv7LcsA@mail.gmail.com>
Message-ID: <CAHk-=wiEPq1QkCMQvL449rdEbJmhkpUo0Uv5OkisYeYKv7LcsA@mail.gmail.com>
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

On Tue, Sep 7, 2021 at 1:20 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> So, we can either live with an occasional fail like this or I can try to
> figure out how to narrow down the rules for what is and isn't a valid pull
> request.

I guess the occasional false positives are fine - if this was the
first time I noticed something like that in the almost three years (?)
we've had pr-tracker-bot, and you figured out what happened quickly,
it clearly isn't a huge problem in practice.

           Linus
