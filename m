Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9E744ACA1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343501AbhKILfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbhKILf3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:35:29 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA41BC061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:32:43 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so19613427otk.13
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qy6TGyX8vFWvykfE4/Xbu62w/6VA/cV8jxGqL+/tOGM=;
        b=fYa6b8hX1Dq2cAMrWRhsarxQfP7zOdb08HRYi6q7V2gUnjMrvPHLBV9luIUlFbo75L
         zXqR4jRbDQD7Zj/37y7Jw5IUHNtGxH/atQu8galeFSlGqcUK+Gf7pkiel+PTf0cfcdoY
         IMDM0/PeZ7TayUF3+gallC5tY1StHe/E9atj7T9hSc3sqbCtND0tnEKov+aPe1wkMWGM
         2iB7bEC73cWGe9qNHMinLpETfPo+2GQBK/4UKY0UYIz/sPdiYoLUN2uMKoP8wJm9ogrA
         ynDKySFVWxWtKU/vrcp2rv7+9W9Nn4ZbLoQb4uMtVsO6EZxYRsv5FIERqowlRnUngsrp
         TpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qy6TGyX8vFWvykfE4/Xbu62w/6VA/cV8jxGqL+/tOGM=;
        b=3TYxr1YB2OQ4TnWQHovFAu5fk8iVsfrOi+gz2JjBkDLqfKQBZl7ZT9m/tJkqSrIOXe
         s2OSlX0MxJWj/A7U6JHaZ4Q6iUnLuFsZJqtLhfuphGQI6FHtWCvxwnN6VJZf1RxsVRDl
         3sQAd9wp/k3q1o7WBHL83LLJHgpvRC+l+9CXNdQieFk10CywLA51ZDHBsfOPX8G15y3q
         AWYZh6Ggdh5QkXXpQpge3sxSacaABIf+JKA74iWm8mfn+uRZKWUcZO6ZlpOmmeiQsWuh
         drXlPvP3df9BcXX4u1X5QkMP0UKHIEzEiO7tQZ5A93qibdeAX4v1VhypCe891PCRB0ix
         EkwA==
X-Gm-Message-State: AOAM530M0mVsSGJBzntgTUEKSda4mtcsjXQb4gqxgLQcR8cX4tBHuPUI
        N7wqzzs0wH5zGZNQM/DjWM3RigeUETiX5nY03M1V4w==
X-Google-Smtp-Source: ABdhPJyPUvoffTAvqw9J4DzdBPjfjQyEb+p8m0OPCaQnugVpSRhmHRb+EHPbR3OsvLSnVFw5ovkObNghJbXbWRypASA=
X-Received: by 2002:a05:6830:2809:: with SMTP id w9mr5266073otu.237.1636457563186;
 Tue, 09 Nov 2021 03:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-13-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-13-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:32:31 +0100
Message-ID: <CACRpkdbUKJVz=pzdw0Egw39gCUTxJRkyNjxOTOqCnJ1k_j406g@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] pinctrl: st: Drop wrong kernel doc annotations
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

> Kernel doc validator is not happy:
>
>   .../pinctrl-st.c:59: warning: This comment starts with '/**', but isn't a kernel-doc comment.
>   .../pinctrl-st.c:73: warning: This comment starts with '/**', but isn't a kernel-doc comment.
>
> Drop them as they are indeed not a kernel doc comments.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Hm maybe I could just apply this patch, shouldn't collide with anything.
Let me know your preference.

Yours,
Linus Walleij
