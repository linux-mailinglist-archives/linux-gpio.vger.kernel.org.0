Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC444ACBA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343514AbhKILhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241924AbhKILhm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:37:42 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9F6C061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:34:56 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id o83so33150286oif.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMhqT96OOBbAley9AFYgsxGB5oY3iyIMYs14i3Gkg3o=;
        b=oi4JGP/SZMbE5ERMkIj9fir5MGvpsEB7KRHDL4ZOvGz69icIfywOoCxILyi/1Be1yU
         ftJcJz/AQIjcyB3OV3GhSDTNhd599XTWxyrqH9S1fbhgxS3yZ03/W9QPU+iIb0ntYWxd
         JvreBAZYqUNb5ubky4Mqed3j2Nq4VFs5YsGlujgxXG04gD/ehEjM4dR+OIqo2yECWUlE
         nQssTMxWJ3b4IgmXS3eQHzmkRNuyB2eLq+R+Gq71FfN60xd7mWLNVpLl0Zdc/xSbh+2h
         0tZPPrdoRUGpdlPv3xsdNS/X3pOFd0VcjVZvpTvPAf8XOUXJOgUwqL1IUjLQQZFXbi/W
         7Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMhqT96OOBbAley9AFYgsxGB5oY3iyIMYs14i3Gkg3o=;
        b=2P/9rW8fLxtBYdF/VJJLkJGfuT5z7gkbtjrRBKqaDlyZkCConhli3qoVcbLBN0UTwk
         llVK7BVCke9g21Vxxud+YMLOgEo4djjtSNztvAtwZmT4phE8tfQ5b1G+ekp9WwPn62tQ
         vneqR2YD09FvX0vLoKWGgns3kCvqjsjvPHcRJUxlq7s6JO7iP46pdaDCA9rxH0DXMOOL
         vPKrLcL3CluyEhe8ea4jd5EpQpeqfcGcbA9j8pfGwJUaEUw0H1qTYjAC9uirPadMrAxi
         EXhA6Xk1DtOzvyRIKjHDowuHmzA/vQtGHEozL6HgN7+/XFeRqCvM4rjeoP9MLBCZIjV5
         /7GQ==
X-Gm-Message-State: AOAM533fmSj2J4ZgaCF5ruXA+mSKGPdxwFs15vAsplMwECwamAokfyPr
        hZAJKZEL2/jiRemKU9pnWbAiRzhZ0Sxf00z2FUmxiA==
X-Google-Smtp-Source: ABdhPJzQ9BcKupTckBvimT1UFASyWrf2POLGY0fYltjfQBFyXFETzsbUnf6PebRBImEXyR1sAkgx7gmkfsC35C3w2ew=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr5147323oih.162.1636457695902;
 Tue, 09 Nov 2021 03:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-18-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-18-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:34:44 +0100
Message-ID: <CACRpkdYu319K3GzYOnDx=zWN7e_k=ARPo+qi4VozfW7WpgxsuQ@mail.gmail.com>
Subject: Re: [PATCH v1 18/19] pinctrl: zynqmp: Unify pin naming
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

> Since we have devm_kasprintf_strarray() helper, which is used in
> the rest of pin control drivers, it makes sense to switch this
> driver to it. The pin names are not part of any ABI and hence
> there will be no regression based on that. Otherwise all generated
> pin names will follow the same schema in the pin control subsystem.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
