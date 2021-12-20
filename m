Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0684847A384
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 03:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhLTCR7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Dec 2021 21:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhLTCR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Dec 2021 21:17:58 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3425C061574
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 18:17:58 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so10824076otl.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 18:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aG5VGMfjEwBxcEqJKcCuOxgIi7Tr/j0cb2sk5Mr+xUw=;
        b=s5AsnHA5/z0u0lRo/s+E+/Ebjb6SPhtCUobB3Wrnwrd2SJSo1urKdq7cM/6itIX843
         933inhV8nv/opbEdZyKAvEN1e0/kjbJEYgyqd5eOyb+purIJfCFvkYwJdVZPmBqobiDU
         05xUquAX7VU8pg+9Ae+B86fcU+iLH+Ad3EBrfSeGJ395tp6kK+DAVUcBuYiLrC/b3Hql
         qObb94kdxjWVM+kw3lskf3PoI+SqvCCdQK/f/WgWza+V0bPd57J080/dMCTscmclcpEo
         c2b8Y08myyEiBXoCs9/e3mjg4NEX4qgrnYWGAxW5rWqNxjWHMU7f9CQyyo62hJOtq3me
         2c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aG5VGMfjEwBxcEqJKcCuOxgIi7Tr/j0cb2sk5Mr+xUw=;
        b=r4sAajCrj7Malnl/DO6axd/iisbvFW5DYJZJn8VCjOl8FMuzsgF0oEBbvcUPPtpjDY
         0PjB/upg8nMoqzvOLRZBvasbirY4cKC+2Q0eYqE5qkdz1edtYsylbnIqB6Ud0Dan8Zgo
         hXQdQr6kqYiesMb2KUJElc+LqhlvNvOQ8z6zKKiRIQ4O3Gfh4xslRN8C9GpLrXpXvLpz
         wGRI1VZEmyRKOGotcmSHRb+aAvRC7znU+R7OMR3HBeSXYnLHntZYPExnEC0gbNK9URJk
         fYr5X1vHC8Z0Y6xLro+fAOtUeSwmAloADx6xYkWnvQJh6CKhpduVJSk3kMfGN17u3yqW
         SD6A==
X-Gm-Message-State: AOAM533lqfLhIjkZnmttvdkBvxv10Kjx7rijjTyqmhdeD0xameV49o5c
        HJ9MR3FvZ/qfETidUSin6+YVjpreC6yLcUeDHQkHdQ==
X-Google-Smtp-Source: ABdhPJxxJvk+yHINE0wrcM/rV+VNZPiyU625TM4lEnnb+xH8hP9z0tRrtIAr8P86IxhOOUYUaQXaJRdPxKSIQ147jXQ=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr9875586otj.35.1639966678036;
 Sun, 19 Dec 2021 18:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20211218212512.196866-1-avolmat@me.com>
In-Reply-To: <20211218212512.196866-1-avolmat@me.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Dec 2021 03:17:46 +0100
Message-ID: <CACRpkdaAefLm_SxtbryDdGopr8WfVZkJmg4y8-w-WJuJqE-u1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: fix comments compilation warnings
To:     Alain Volmat <avolmat@me.com>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 18, 2021 at 10:25 PM Alain Volmat <avolmat@me.com> wrote:

> This commit fixes 2 compilation warnings due to comment starting with
> /** while not being kernel-doc comments.
>
> drivers/pinctrl/pinctrl-st.c:59: warning: This comment starts with '/**',
> but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  *  Packed style retime configuration.
> drivers/pinctrl/pinctrl-st.c:73: warning: This comment starts with '/**',
> but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Dedicated style retime Configuration register
>
> Signed-off-by: Alain Volmat <avolmat@me.com>

This does not apply on my "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Please rebase and resend.

Yours,
Linus Walleij
