Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C7044ACC6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343547AbhKILo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343543AbhKILo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:44:58 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9654C061766
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:42:12 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id t19so2872825oij.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mhp9TzcF0FJk80drP2WtwN9HUs+vg3LkkMoIt6RpEF4=;
        b=olwR8eKIQydywoP9wwQ49hUplsRYThhLBucewwDhwt7sW0N8FghwRqb2YTfFmmQaAM
         eoOHY/s2eMATsA0TyHJz6KNPgGrwLjAq1yAYu3pqPbg4ILcyfhlt4XBS1maL5zZGM8SB
         /J5eUploIL+HdOCmiSCrzSExX+tnB8XZ/yeaby54qp5/GAhldTb++/1lgFAWnNT/gozP
         A2+m2Aa9liTusE9rl+++t+wQUwKU9sndyzWTo28y3+L8i4AZgXoGb1JB+PIGHFMdTkAd
         +CWj2/pK7Czc/z1j0ov7mWhnuifK7Zecv6IVdudLEJIIlnN8ttiE2Awf1Uu/iQgP0MQ+
         A4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mhp9TzcF0FJk80drP2WtwN9HUs+vg3LkkMoIt6RpEF4=;
        b=quSLIOeqIW/PTgX+oWu9+cA6kF7nW0IcOB0H0gtZ4jezZ1J8ijRDiZ8BueZ3eEqCU9
         mHFk7ZiTDUcLt+pouwPzzL0OA+b0njy5kupPPtO540u9TyHd6Ka+cp12rtMD4IxWSwZt
         fglcd7tQV3OawjJmcZNF7W05Vp44Tm6TnEcElRHM6ceOCPah5xnAaJYUkL77TA5Do64X
         UdoP/2DbOGbVOqeNM5IGHjwSb9wGXhFd8LfEa7Wte6x1PHSN0ZTVrzKwwBd6t2KumuEr
         oqoxkJEJ8Jyxnxe6JJJvjifM6Kd39M9nPTy7zRSBFiyfYBNagrBDXb+bARtSgSVCe2oh
         l0RA==
X-Gm-Message-State: AOAM530WrtfFoVPzz1mjjajXaDWg5gUaIFWC8C40YzmA+BLDoJWofS4w
        jWNEHlTKZnqLeKapJu0US+RskdeyZ0RLBYWUN46agA==
X-Google-Smtp-Source: ABdhPJyPHpmLKJWvNf4h7ERinzV0bNLNBoF0liQERhWM5bH4q3Bh9XBTTXD2QUAOEmTu+PDwzljjIN9g/NSOLBZiY0c=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr5187977oih.162.1636458132308;
 Tue, 09 Nov 2021 03:42:12 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:42:00 +0100
Message-ID: <CACRpkdZ2-MRY_L2J4RvKDNW1yyThg7KUFbd80ZMpRY209RNxnw@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] lib/string_helpers: Introduce kasprintf_strarray()
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

> We have a few users already that basically want to have array of
> sequential strings to be allocated and filled.
>
> Provide a helper for them (basically adjusted version from gpio-mockup.c).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fulfils Rusty Russell's API design hierarchy requirements
and help people to make less mistakes so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
