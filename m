Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2670639D6C9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 10:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFGILT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 04:11:19 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:35632 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGILT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 04:11:19 -0400
Received: by mail-lj1-f181.google.com with SMTP id n17so3823812ljg.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJNQotdL7mBjqDK/i6BKdnazNCtCGN8zaF8D6zYRhMY=;
        b=weOnKpN4tS8axKHUOKJDGbKfJIvgNkD7dyFA9rrpOhtRoUBevjdNocug35o54J+Yk4
         epRxMipw0liSPdILI2EdIQ0hsjWRY1Zx6yg3qhw6HELLIx1gf7flXLH4s8BKhKhpLjT1
         B9vTmTpm2XUy1PMros3T3V+YOAoAxpflRTTAVL9NfZerwBxISRK3Ikg4JUJnFtuSlsst
         4Pckh7JeFB87sc26mg0fqoePqav/vujGI280ltgybRzU4kmjulSAYvEEthjFJOBEAQch
         US95MsMzTQai62+ASJsQUEy4JuLOljpt2k2ekhjrNgFgH5yLEo1BK7+xQ74TG1QDP7m2
         cpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJNQotdL7mBjqDK/i6BKdnazNCtCGN8zaF8D6zYRhMY=;
        b=dmFip657RnTrZlr3ygnfcWYDf0hOXNo7F8DYo0ioAnZdKBe6QeqWv4AWoTvnBRZFQl
         J3Gogo0h1eErN4u1mCx5gUU5/FMvIGQNjwHo0OShA8ynlmMcnNzwKkCkgSxVBqPJIk4i
         +uR4kEyaZO5Q/4BP6PrmDpuTN4ILnzYBRv/nEjmQvx6WIPzYmCsOXxfSwWQOaPpFgvIL
         9zWBTb6c9qJ+EJuV2nkkbOg9Dk5E51JFDXdPGEJex+51hOgBqqzgmHrHmtHckgZuqNyf
         uB6/YUMRi7CkmeJTS+AgfsROAlrTrep0sL4e0FYtALHU5+VDtynOdCDJCLHi0ozmkk8j
         CMlA==
X-Gm-Message-State: AOAM531CQvozwZcbEUFMX6VKQVGY1ab45NeYiPSkaT8l9enFivj/8S+V
        yM1jq/BFWcKqnGT9ioHgOjMjJmY7cjwMonr2G+72Kw==
X-Google-Smtp-Source: ABdhPJxxdKZPAbxY1BAZW4RmsEigy3uml8wcXhbHWYHoD7+ocbk4ASZ97dVxgth1VMKfh3dEwFHkFYx1/foO/vZ+/2I=
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr3470827lje.438.1623053307601;
 Mon, 07 Jun 2021 01:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210603140618.3044976-1-yukuai3@huawei.com>
In-Reply-To: <20210603140618.3044976-1-yukuai3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 10:08:16 +0200
Message-ID: <CACRpkdZmn8YS7g=EYnc7EDs_sbzT2qM+00q7YL5R+d9OyBC2LA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix build error without CONFIG_PINCTRL_MTK
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 3:57 PM Yu Kuai <yukuai3@huawei.com> wrote:

> If CONFIG_PINCTRL_MT8365 is set without CONFIG_PINCTRL_MTK,
> following build errors will be triggered:

I made a similar patch, this patch is wrong because if you check the other
entries in the Kconfig you realized that we select the dependency for these
drivers.

Yours,
Linus Walleij
