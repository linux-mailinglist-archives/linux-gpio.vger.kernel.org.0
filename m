Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107E72E32BF
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 22:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgL0VKk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 16:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgL0VKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 16:10:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD802C061795
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:09:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o17so20043309lfg.4
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbUyUXqfcMapMitYeWLZoP4Wnr0S0nWOf4B0TWLyMPE=;
        b=ZjGcqlAH4E7BeO9qvl79px7QpzkJohOsIPnqYez7Yp7AZU2m646cWPMVTExlh5H6AG
         L0nGMbWcXZUXdM5vbJq3EqH5/tQBi/LtcamoNMGbZd/gpdngB7xayo+oAuCt15M6dMsO
         AiisxqKfzIZcGS/9WsULhR4hdotdxuwmI1whuCj9DKJQQUHTn4Jg2l4tVlUEbyTzoLgF
         1LPUD6APPGs6qndEMH7gPrUPoDy3mK/SVEQtyMXdb+LnGlgjo5jPw4Ui476wUCjrHfwq
         6M23+dH6Uy70SJi/HuDyxfbL6dAAnY3B0Y6GizLfD5ygDwXrXxjrrvq8Nr1XIiB0ou0C
         /zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbUyUXqfcMapMitYeWLZoP4Wnr0S0nWOf4B0TWLyMPE=;
        b=G59ybWVcu59OQfqJpiwqjMyaAQGa14xmD9D2n+Q8dt3eohC+vdn/z73HuwI6+zKLH1
         qaHZZAUSi0Y/ppsVm2QT6Pjw7b/YIgXbkyxhNW4QDz5yIfZfhFyFOEoo4z7Yvr3kH7ts
         XQmiqqtE9ldcJi+q1hEDdfwdJt65t/L989h8v63osHtObb+wjbqGx4zUS+Tx0mrZQIDJ
         HM+lAZmJtkxNHsyDYUHVnsntUiRxeDyjtojwWCyItTTSL4fZ/OdcI0uQWLfr7f6sRs7G
         cdNuQ5k27YOs2K4hEXhgqHN1bRVZTcUv40dTrKntYfI1QbLyIDjtBelhL51LSAG9kdaW
         Dy8g==
X-Gm-Message-State: AOAM531Yr9BC0FxxmcwO+2CFoCdjH7Rb0pJyPvudASMaItqCkA3NKvcl
        GU2+BabrbUorBtjDiGIT/lICXQOjyjY5jzwZahG1yw==
X-Google-Smtp-Source: ABdhPJxyoD//S0MkIPQC23aHRggofmFph5lKG63J1ZwjkgVR2ldxLsJ+izCRMExCii3ppLi11lOz1v/sdZQT57CTD6A=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr20447406lja.200.1609103398036;
 Sun, 27 Dec 2020 13:09:58 -0800 (PST)
MIME-Version: 1.0
References: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 22:09:46 +0100
Message-ID: <CACRpkdasX+rxkG8jWVSxGDepKOr5XMhGf6k=9LEh2hN_UcxEXg@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: hisi: delete some unused variables in hisi_gpio_probe()
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 21, 2020 at 9:25 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:

> kernel test rebot report that dat, set and clr in hisi_gpio_probe() is
> unused variables. So delete it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

I fixed this in the tree before sending the pull request to Torvalds so this
problem is already solved.

Yours,
Linus Walleij
