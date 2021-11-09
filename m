Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE11744ACB8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239621AbhKILhV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbhKILhU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:37:20 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A69BC061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:34:35 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id m6so7189961oim.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJvoZMaaDiqQDQzmQKxU7aL1Rgs77zOyF+qBbYMPai4=;
        b=ibWeio9MhAbFBMtbEQiWYGtyoUNI2wGwaiB/Cg+427BrHvgtSDRUW5gDCClC3hCcLn
         0HnANAGOM2wRQZIbHQsIOJDEhxwHLDwPRLxUm4yvmIe4FIOWkDKUHiJEZKBG6fl/QWul
         qX9/8nHQ5u9FrKDFujOXwOsES7LbHEjOxtPxvTVmgvjrePUf0FznxdT1zflk7ca3kk36
         0EQpWHsYulFHFaOfX2jHVJoxSU2Ki7ebnmIdXo2g/GrSNHUL00Y/D2AKgZj90f5okAqE
         SH/F/fy6rg74jts0jJcKSKjKVqeGqqKRjQJ6WU6M9p2hRNCWmhRbBUr1MB6e9hyf51SR
         s0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJvoZMaaDiqQDQzmQKxU7aL1Rgs77zOyF+qBbYMPai4=;
        b=XzWLp3sLfat2G871UH3U5GY/pX6XiZk8hEpTyKOMJyXioFzHs9r6n8MmkWGDLD1U1e
         kt+64L2OMnWtQa81hw4l1yOzxHVRsuKvd95T2UrmJKTOkQHIov+B+N4PM+knhk1b5Yhz
         FvihNqgtTrOYSyfyEo+/Y7nhgv9lCLavgqr02Js51aw4vL0SzHFj6kEoet9Kn45A+IZ4
         G479AS/DMwwvbFDXPEjXC5K/ejJ+jq7caMr/qXj5ZjI9pfnAE6PLmJ2VtcRz28xXnOh5
         /M4H/tw3HEwiT71zjm/CQqf6X3MbNu9sy2NwuaLPmZlONPXHn2VMOyE4XhcJupKzYCMu
         WfSw==
X-Gm-Message-State: AOAM533i6dhhzIpzxJVuxATVEBb9Ui8YOVdwHr2tcMKwpjk/Bptwv0ZJ
        SkZXxtEha+hlBQgYKGrrYJ/BWrF0HoItL9IAwtmoXQ==
X-Google-Smtp-Source: ABdhPJy/RETaWdANM3tucuwvOzEk6ouGG2eWkyABK9KYywpBeBb3elcEuOEvVyLatP3WRod1SZHwHhkYlC6A0sQeZAU=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr5145143oih.162.1636457674579;
 Tue, 09 Nov 2021 03:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-17-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-17-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:34:23 +0100
Message-ID: <CACRpkdb2Z23AOSfEWjFHL5RdErEh8r9xUypWWyV2LUNhRw-q5w@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] pinctrl: st: Switch to use devm_kasprintf_strarray()
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

> Since we have a generic helper, switch the module to use it.
>
> As a side effect, add check for the memory allocation failures and
> cleanup it either in error case or when driver is unloading.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
