Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B29327CE23
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgI2Mxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2Mxx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:53:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5FAC061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:53:51 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u21so3920941ljl.6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHwuPtC/WQ7pDTrQP7WICMQS4xbohiD8X+J/4tqHmVs=;
        b=SScj7iKswgMLk8PHt3ULYRQ70PT1uuUxmB7RKSr52jm6TodNbLThsAHdFO3rFHnqQA
         oT4i2CKd/jQW6g40FOkUwfAu0oZHLO+tPbO/CRTDpc2e0oOQjmYy3ELuKkSiHUlPw0lb
         GGHdLGpTPC/7XOCdK4Hg8GYRIVrcHiYNvIPGUkE8wV5mgeLKzjNDxNwF/4+xVZYy8lFn
         PkSbZ0dQLWJj4lTGWPs4225uaqtTu122afSD/LWCJyiMKWPfXWAhkHk1WxcvgWjBSGKi
         0/QzLwYQfpmWMH+UvQCTknUheNLebrWUiBtfijLIM6LBJ08UBMAVSszhl22mCBRnTLxG
         blsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHwuPtC/WQ7pDTrQP7WICMQS4xbohiD8X+J/4tqHmVs=;
        b=fCYzsHf/zYLVIYsTFat4Z+lEwRke/DeFJ1IjMeHJQtSfxmObC6/aDfUtY8uGeXTVda
         HVfT7JDnQ5u48VrUdxJVsSvTe6DsmhuN6jkCHjNr8EFVbvO693iUBVL1nazyRLpGwdyU
         KNF82mi9o007+7wvdL1d+7/PSKTh6JId7osqt1cgLxg4/4hsZNCOG9YAvf8ai+36Q5M0
         ZcLOL+x3ub6da1Lphp3uK3nGmvFdbcM8CtkZzMlsPwLdtyn83q2h139Z2cXp3x1hFIrF
         phhmtnWHRLnINl1oj8Vy81It4v0AESGdXl4bc5ww7TOLznjDcz2ayAIBIQ8gnphcQI6y
         ogZw==
X-Gm-Message-State: AOAM533rZXo+UXcrj+IffiOKjNQxWETt4E8MHhB198NvNmPtCzJRh0cG
        hxMz+c5vusrOEEcafxw6Pk7a7JBxKSSQF/dCEW3VNA==
X-Google-Smtp-Source: ABdhPJy9hUABt6HyDZ8eMUhqUVFoUVNmWh4nkSqagGp6tYeml/6ltjf2YqMbjHLgvucofUxG0N3RHx6WdvA9x0bXsXs=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr1192840ljo.293.1601384030152;
 Tue, 29 Sep 2020 05:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200914065402.3726408-1-liushixin2@huawei.com>
In-Reply-To: <20200914065402.3726408-1-liushixin2@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:53:39 +0200
Message-ID: <CACRpkdYDuKV_2KO9y+6uCUR4v757v4aBEceJJOeS_f_SxF8xzA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: sprd: use module_platform_driver to
 simplify the code
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 8:31 AM Liu Shixin <liushixin2@huawei.com> wrote:

> module_platform_driver() makes the code simpler by eliminating
> boilerplate code.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Patch applied!

Yours,
Linus Walleij
