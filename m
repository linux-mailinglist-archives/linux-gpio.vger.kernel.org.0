Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E153DBA20
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbhG3OMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhG3OMm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:12:42 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF58AC061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:12:37 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a7so12539240ljq.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGcnnqSmagVNvQoebiecahwo34gntuMkg6pM3FvCbWc=;
        b=FeY89h72xK2j5E4qOePjYJK3qLXZo95FIQ+EbXxcFKVOpNgg5Xkr821smrFCBE/El0
         4a9amwKWHraMpNa7g1cKB9qTX2iXV+LWeMgN+Ujz5Pq4TXl7UMkawtb3EWSRRcNhPu48
         10gn5vz9rvQT1e1xaOoYwmSmTbxfv2q8QaeVA0jDoIXR0U9OeHuhMUV58E/HlUlUxzDD
         MNMYuXabn9fZtjKg8wUqVMmnaqBbGGO9jAFAL+YenM6YKhr9HMGvCJrtXgC1Yz8lGKgJ
         QckEImCBAaawtwjiFpXLgbB9fclDGt0fAh6oW21ITJv6hE1iI6m15Df90R8R+1KpJ/6S
         4QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGcnnqSmagVNvQoebiecahwo34gntuMkg6pM3FvCbWc=;
        b=ZuKiK7DXsbG1Ah86XiTbUHnjaYot/krDbi8XBr497xC5jXbztltwpbaaQilwuFOrU0
         +rBswJ8StN2xyCtgTxIxF0ISYbcfQyIbZnxjO6P/VBW66s3Rks/R0bF3AiL1nRb4Yntc
         Nzq0k8J9zb6bNt7JzkzRlEh8Gau9mTV43p/rWygm1YgpK3h5pkC9Oqsn8IJdb1qfsnzc
         OWcV1HsgQa19xfs0pLzkn1k7/DMWv+SCdt7BbtdrE4oG/2t6VagEG2vlu6zJEWhnmcm5
         ygQwCJgD58Yk9PP8/YpavXWxGSU637MM45CH2r7mPf5Qx/bCfIlTuGHVH+rGmmi2nUmf
         2gGw==
X-Gm-Message-State: AOAM532RC9/KINUDBnWNd/ROTfAFf3sA1GL7GWzSFpcq8ruuYTInOufg
        7w4F0n616tEd+VCCcN3tr+zgidwsWzvwX7u6zicmbEva/0g=
X-Google-Smtp-Source: ABdhPJzZOIuzywgWD1OYYmMBDmj/RutZYscHdNEYIrYgTYet50MTFHn1FfgdM/OQg2FeeUc9ow2dHlTydqphsBbzNB8=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1820832lji.326.1627654356331;
 Fri, 30 Jul 2021 07:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627652747.git.geert+renesas@glider.be>
In-Reply-To: <cover.1627652747.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 16:12:25 +0200
Message-ID: <CACRpkdasmU7xHKmftgay=R-5sjek00_FR0p9Bp23P8GUaNE2ig@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.15
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 3:47 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
>
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.15-tag1
>
> for you to fetch changes up to 91d1be9fb7d667ae136f05cc645276eb2c9fa40e:
>
>   pinctrl: renesas: Fix pin control matching on R-Car H3e-2G (2021-07-27 09:29:02 +0200)

Pulled into my devel branch for v5.15!

Thanks!
Linus Walleij
