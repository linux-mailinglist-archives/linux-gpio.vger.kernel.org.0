Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EDB43A832
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 01:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbhJYXfD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 19:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbhJYXfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 19:35:03 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B890C061745
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 16:32:40 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q16so12375384ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hxt4ATbqnUi42PWc6saQaTbe6EpGj8FbaW1pV0EbbV8=;
        b=vUPRVkWc2AfZfGjDTWv3VknoEoXPcttdDVPjcuUS99X/LBlfjINYALFegdqyOlp12R
         11bHxFzFMWdTvg++8jPNLKnzFIf/GFhqzTYWP+ar0xxiDFBpu9QSa9tDsVf76YYFGmsi
         +3GbT/jNFh+CtWy8Oycy8QlcNaMpozYSmRJnQjW9ItVfj+CJaSbmuoY9XarTs45bmSTh
         zud2pMotFs1EyUEu+nPxB0w50Ok+OgZscIMMO0coB2x62Zz7UFjVlkw/hgLqOyK1AmKZ
         LiWBgQ8pMOnkAQ1sR5dOUs6QdZuVsSZqwnvTlhuS1DINT1mHZplbbp69b8KVEZPh3bi3
         gllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hxt4ATbqnUi42PWc6saQaTbe6EpGj8FbaW1pV0EbbV8=;
        b=VEhuvwJ41jE+wX7aRrftRcxThQ8f2boPgbV6rUQkgOBC0A/F6vwBCHFMgYgya7H/TQ
         ys6cRiDJ2cHg6D5ID2FhswWY1uzoHLKhj9YUUY3VlqAEtQH/pH2WKr8aNUa3G/wX0z4o
         nmEbKdLBUnFNkzJ+ozrfd+8NIM1lr6zrauIhnkVFwvgLRGCmeonlCyMDnR7ItBvPWZku
         56+W31Nv8BntBzk2rXjzVAyeYtvyZaDfk4dHaVrixpRIpZ1F8T/S1MrUFqdftCnb+2uY
         NNmpAAFCdrJDrAYqaf6gkv2IbGAS4uRCnjtKDVAhw4xJ6BLASJFTAio2sNfQjdL7E/5l
         PvoA==
X-Gm-Message-State: AOAM532cHHBsmhf+OYfVenFXynbtLhhXRStAIKsRKqlE6hCIk+5CK3OJ
        UMQ1EvJzsVra6m0X7wWFfnEHBkiTgfkpTiNeghiK20o98go=
X-Google-Smtp-Source: ABdhPJwoQUrp8Xdzbp9hs9XoFfY4M4ZSnxzbldGx1GmbKXMjhvtKAzpXJngVL31OwbiD//mY7pMfozK1K0q+/nQy74I=
X-Received: by 2002:a2e:9e4e:: with SMTP id g14mr14512559ljk.261.1635204758705;
 Mon, 25 Oct 2021 16:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <YXa1NGuIO6u9i8BK@lahna>
In-Reply-To: <YXa1NGuIO6u9i8BK@lahna>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Oct 2021 01:32:27 +0200
Message-ID: <CACRpkdYn4jEiXLz1JdvZFfKa3zrOTY7dG6xihZAuCHrvF7AVeQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: intel: Changes for v5.16 merge window
To:     Mika Westerberg <mika.westerberg@intel.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 25, 2021 at 3:46 PM Mika Westerberg
<mika.westerberg@intel.intel.com> wrote:

> The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
>
>   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

Since my tree is based on v5.15-rc1 I just picked out this one commit and
signed it off instead.

Yours,
Linus Walleij
