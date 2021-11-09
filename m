Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3746B44ACB2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbhKILgE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbhKILf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:58 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7A0C0613F5
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:33:13 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id q39-20020a4a962a000000b002b8bb100791so6878646ooi.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSSmBGiZVMNlw9saF2eyI7HOrgrdT0YOSip6CH89u1c=;
        b=TaEIl/KFsdk7aCm+psQMJAvJANY9fl88AA6fiFvOsx4MD/EZynOYrLCLBFHxr4nP3z
         TQvoDi45fZ9jV5aILC7hS1SJkobjR2iKX5kJhLNeQwMHiRKyiZ6IJsUhBGAr+afnrw6+
         x+d+BJjiiG4SuDpiBLjkkG8vTIL29TR5I6uJdzPfbVJy9UPzMyYnJJahks0Wcp6A67OH
         +F2tNvawnF4i4K20iq+ZwMye0Uzjqad6sUB9BRaPfYEmwHEPHo+kNomEeE8sNnYVeM7r
         OjHNtXuEIJyMq6csGdMlzvKEOPfpIB0ApOcBTaJlf70eH89kNAPHT7uA+XoLkRQ8M0Tj
         AH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSSmBGiZVMNlw9saF2eyI7HOrgrdT0YOSip6CH89u1c=;
        b=Py0msqmGEtzl3P2yFrvjlJ5v/svwdzOi/qtlzMS0mpxh3VNuOe1WUHziXUo7W4Sor5
         bqQuSqhL+3QQYTpWxO08O7Awk/2mcC7ONj2LqH9ZXxFSWqvyMBbSQnkDwW3TqUqnxnl0
         9TvF0Zr749MWo6ovd0OXuYiu67bgoCPC22UH0j0Dq6tkk/5bupop77TtY07i5Qacr8nT
         1H5eTmNCTFTLO4E6fsbkHdphr2tWL5L0mVweHTf9iyK2daBUQU5EUKJwcDfkmNU13PoN
         La75FNje06q0IFOOw5QVw3CO/g08BhP36AWMQ4/dHag984kUQgcCJkdS/llNLzmI86m8
         74lA==
X-Gm-Message-State: AOAM533cCLaLewaUJMT0WvFiji6MRxmL/wS7OI6QaNaCE0G/P6J8qgZ+
        YQ5H1lHZqu4y4T6QOwziD22bMlNQOf5kRcUtd2n1Qw==
X-Google-Smtp-Source: ABdhPJywvZKJoZBox3QIktaEO2rKrJtRPMqM6AhEvJyTlBaJAPM8lakOBpMg0SgtBEI2NKgbHRswI7RDSSX7KAPjZjg=
X-Received: by 2002:a4a:e5cd:: with SMTP id r13mr3324482oov.84.1636457592495;
 Tue, 09 Nov 2021 03:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-15-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-15-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:33:00 +0100
Message-ID: <CACRpkdaFNhy8DrY7L76OC3Udkeo33t8vGv10T8NoFp+R9x1jKQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] pinctrl: st: Make use of the devm_platform_ioremap_resource_byname()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 1:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
