Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC601402F8D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 22:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242646AbhIGUWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 16:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbhIGUW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 16:22:29 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C81C061575
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 13:21:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y6so565747lje.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLPM3CmAMxCZympRP7kvfM9bqd+LVpjvPnRaMAwi04k=;
        b=Pt3HaPqsQd/xVFlPx5FDQsGrdVQ+8S0LeNXHzsGEpQmH7rKovEryR630JuJZZLuxDd
         hD5CoPHyHb3CaUOjQbJqpLFLeuJep69F6kModAS8eCqcsbcrTFnFlCgd0jyPPb20Ws0H
         JOCVKDlW9Dcl0+1nXXE0QaBu3zRadKzUuF1YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLPM3CmAMxCZympRP7kvfM9bqd+LVpjvPnRaMAwi04k=;
        b=dKRbd13JiwNrZmWaj6o8QmRzyFLn/Zd90MOhftJrd6bCPUKjrxg7s9uu58opaAmDM9
         UhAtW7hsCOlRYUy+QsRLyJwakvbIdikiPZCbwrHG4ZWRwhS+hSf7r7+BGnj5hJHBNlPa
         CM1gmaCUCplisEwsrZxGtTBKHaUZtNNCKB5a+GbDdy1Y477hWRG9H4thhs5HXz3TpbYl
         zhsMqnv65Rdq7QAfXuYUtwN4It4gNZlrnsm/2ajQc/dHB/Mzj+eJ9PQLxL1s8tLNM1v4
         KZdzlD5YpIyfKkdNbkT4CtLFGAK9AgPfQy1oBeYC8vGU+P1ZdRymoqBLkOxAScX+cZbs
         b6kQ==
X-Gm-Message-State: AOAM533H2NJDwgEkP2r2wQLT0wdL8O24TRFuD0lT3rOUBSF1jPkkNxJ0
        FYnfKbi1fbKj64vj1qFMBIBVJNjcQqueR8fFNwQ=
X-Google-Smtp-Source: ABdhPJwlhFhVdEKUhwopemRsMUqBMSsiT+jkHK7WtT6ETSK5qt2N2J1YNFTfIyx4EOO/xgugUqMXYw==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr31645ljf.269.1631046081005;
        Tue, 07 Sep 2021 13:21:21 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id i12sm1538837ljm.116.2021.09.07.13.21.20
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 13:21:20 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id q21so531774ljj.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:21:20 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr38605ljg.31.1631046080210;
 Tue, 07 Sep 2021 13:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083613.31268-1-brgl@bgdev.pl> <163104566243.21240.4845140527007156447.pr-tracker-bot@kernel.org>
In-Reply-To: <163104566243.21240.4845140527007156447.pr-tracker-bot@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Sep 2021 13:21:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg97FcRFyY=xSLfOmZ5XntCsp9bAj6VZXSbU8YXVzyOfA@mail.gmail.com>
Message-ID: <CAHk-=wg97FcRFyY=xSLfOmZ5XntCsp9bAj6VZXSbU8YXVzyOfA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.15
To:     pr-tracker-bot@kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 1:14 PM <pr-tracker-bot@kernel.org> wrote:
>
> The pull request you sent on Tue,  7 Sep 2021 10:36:13 +0200:
>
> > git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.15
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/5e6a5845dd651b00754a62edec2f0a439182024d

Yup, this is the real pr-tracker-bot response for Bartosz' pull
request, not the over-eager slightly random one.

Looks like there was possibly some parsing problem with the email having that

      Merge branch 'ib-rockchip' of
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
into gpio/for-next

in the shortlog. Or something like that?

         Linus
