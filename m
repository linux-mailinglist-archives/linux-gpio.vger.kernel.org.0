Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A1A2A8561
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 18:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbgKERz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 12:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730775AbgKERz3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 12:55:29 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F06C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 09:55:28 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id r10so1854772pgb.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 09:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=alO7phFty/V8MxNP5qIJWuT05VJeYMHHqnvuZKSotec=;
        b=XmtwtbDFxGcYMw08TN1AxOf7Ut5YTk3IQ+MYWYUcagVSbmDYd1KMs+EiowA1S5EoPh
         rS8S1X4+CJAm7MiZQrkBI2LNGTjsxqgM1Z03NnvncvLY6NHRpu3gIrnSYwK8efWRCVjN
         4NJwSFuD7zI7NkbLcxIb6y69D5eDq0CFM3POehOl/c0qiCpd/q+R7g0CmjnhJ6ovF+pR
         5pk2IW5AQzoiwYa4DaK5mtvYz/9NhmBKV7xEd+fHNVYp5So0Akjgn3Xf0mowRTXCIAzX
         bp7v60CZnDD3UVwBzuLghxoExC2f4JDijOoBWNXMAYPpgrFqi5aFOe0slr9mLFFIsqm5
         gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=alO7phFty/V8MxNP5qIJWuT05VJeYMHHqnvuZKSotec=;
        b=Heg9NNG8Cyfl7h0/cm8daElBaQhyaOY10e6RlZZsWeo8xWpVirP+OO3U1GWT+KXnD/
         iI1SbaLISGBtlE58p97Ibl1dMaEEk08K640ySzbgO/LZTG8BCMDszR2BIyf8FUcmK9x0
         5tE3R1xZFbXUKMDfFPnZeEOwbnj3v9o2nuSPXEBaRkvyZJM7ctxC3zVUB88ztwrXRcE3
         fQUy9RXqn5YVno4/baCsK5cmrM0F7s1H2gu9bZ96kF6bjL435sfm6s2q4BxFrWQDaCWV
         vQIjw+7Kg9G6+2O8i8U7Hbj2GoBECAPjCmQveTs9QGK5PTxlRHZCI7Bsxk/MkYwzmMHj
         HN8Q==
X-Gm-Message-State: AOAM531Gy2U9bK+8c3FGAHCf2k17+mqUx24BAYQ1ivpgs+yhHuyDUdQQ
        /N8ZPrqZjg/BRDpFoezutBYT7OMPxm+2SnhhEuc=
X-Google-Smtp-Source: ABdhPJy/oIDgFTXccoZSt5l/0jooRzEGnfziBP5cqByfmXvkhB9paB2DlQqM8uSgkV+BqsHf4bYMDQ==
X-Received: by 2002:a65:688a:: with SMTP id e10mr3475759pgt.347.1604598928469;
        Thu, 05 Nov 2020 09:55:28 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q16sm3175323pff.114.2020.11.05.09.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:55:27 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list\:ARM\/Amlogic Meson..." 
        <linux-amlogic@lists.infradead.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] pinctrl/meson: enable building as modules
In-Reply-To: <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
References: <20201026183025.31768-1-khilman@baylibre.com> <CACRpkdYwtvaxL8urR6tUgysM8Svwq48eEi=2eNDp5L084880Tg@mail.gmail.com>
Date:   Thu, 05 Nov 2020 09:55:26 -0800
Message-ID: <7ho8kbwuwh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, Oct 26, 2020 at 7:30 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Enable pinctrl drivers for 64-bit Amlogic SoCs to be built as modules.
>>
>> The default is still built-in, this only adds the option of building
>> as modules.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> Android GKI-inspired?

Yup.

> Patch applied!

Thanks!

Kevin

