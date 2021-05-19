Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032733899E2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 01:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhESXbc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 19:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhESXb1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 19:31:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D25C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:30:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w33so13671425lfu.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TMwUCc4SgPJG97Rkm0aBtlB2yukAmA0ZCOYZxIe8Tck=;
        b=COFRVP/pO0baQb+7qWHLDz2WLUT5dypjNrj5zUFuYXzUtg6fpKRLlKYbiZzPTITPZc
         /uUhhjfIhsoNsAMrop863YnjD+LgJVtDBP1KYoIu4ksGcJgGWz+s4WWn3kmvO/XAv0BK
         OjUUa9da0YUMEgSfNJvNy+ql5y+6om6KV5Dn8le+pTDLe6BKSPKUmTwLt2eqm7lESk3B
         QnO3uLAlBSJnplIxsPfmtdAsiUJVFs3wuquyVQJXmSJaQ2CdHSUXq2Mye2jrpNtdysXk
         O4duXcZeyAtbDkRMCeOnacVwo36wilffm5IBrr8bDvT2UfALp70Ae/bNbZX+hYLGS5rx
         LiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TMwUCc4SgPJG97Rkm0aBtlB2yukAmA0ZCOYZxIe8Tck=;
        b=GPGzUypa2v5POl9/Gg1sc3FvkiBLLsbaMhXuMKyF/WfEg7BStEAlaYZHJOUT/oOzT8
         jfKy4ZUUUxgYDCNHkxr0Nzj4+iEERgr8X1ssDeAVJRNl4QUkyXwtPSOh875EqvVlj2Cz
         OZSROhY80PnUJtHX2EN7suUC/qsi9QIvGrD0exQ1aKClGEqi91KY5JoQbPb7enWKxHl+
         +8K2FK3UWDAjsz0tPyhKBYEr+bg1gHXxo32z5IJScEgqYmJUDp7L078IXKqLRbnXdXo9
         cte0RMTEGky2cRjSC1AWPYjpc4IQpWmbzISk+YJ4eUUQO6ZmkBGrLYabtsvFbP/yWcF/
         p21w==
X-Gm-Message-State: AOAM532d5hYx3/6UXTPk2ciB/akjpQjrxtzsZake6przTJPkJHtlTcK3
        5tpxT5z/x45HSnd4QQP9hvKcTeo4KH5taCYvEZRgcw==
X-Google-Smtp-Source: ABdhPJzJNxbjDTEBFvL1ZTsKRGzbh5UGwMfvAMRXs41Xp0OeG3kf02/POIFVqkoTMyWq2ondcCw8vTGrfxB/0AvMAqE=
X-Received: by 2002:a19:ef10:: with SMTP id n16mr1030061lfh.649.1621467004538;
 Wed, 19 May 2021 16:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com> <20210510194633.11943-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510194633.11943-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 May 2021 01:29:53 +0200
Message-ID: <CACRpkdbox-QS-2TG0U_PMRHT60dxt9HaV-k7cTReDn+uM6-fZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] bitmap: Make bitmap_remap() and bitmap_bitremap()
 available to users
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Neeli Srinivas <sneeli@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Currently the bitmap_remap() and bitmap_bitremap() are available
> only for CONFIG_NUMA=y case, while some users may benefit out of it
> and being independent to NUMA code. Make them available to users
> by moving out of ifdeffery and exporting for modules.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Neeli Srinivas <sneeli@xilinx.com>
> Acked-by: Yury Norov <yury.norov@gmail.com>

This series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
