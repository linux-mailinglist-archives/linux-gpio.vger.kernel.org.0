Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E965438C99
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 01:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhJXXqH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 19:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhJXXqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 19:46:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF5BC061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:43:46 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r6so5700630ljg.6
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYURh8RyNr1ckN0vFdaCCBvNFLm+aoJl9EOOW5L0bjo=;
        b=Dub+HLKftT8qLgrVIy5NVEmLS8CfCo7rREnppHnZ5zdkjXpOcGo47y6pwcCDWrVKLO
         Q8xh60qhUlDB/QvRFGrYQoB9VqyErt/kcaXTfW+gH/tgWmN+9mfqiClGYEL15Y1Ue2wL
         8C/TFfrnRwftNAvzcmslqGkvHT72IflKyUcZKxzApkJZtI1KGArCXckIJ9JuaO2tSNrN
         /h8cojO1Nnprls0S38qNlzsSf6dovWQwjnx1czgyKu5NeL9egcALRKXf+S5P8oPEcpSw
         H8hmHIEPTSw5d15ChljfFNhwOe8PWULuIKQn32eyHTTmPnaqOFSuU0pHE7At5ykFStSQ
         TY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYURh8RyNr1ckN0vFdaCCBvNFLm+aoJl9EOOW5L0bjo=;
        b=OLRh0HYk+d0fOw1i3OflHEegIqvTNqsPyELOyHt/Mit0pbDV2VGTdpZUWMnPbeGxgu
         qgJGDoqn2/p0WgZ/3Zc3PfEVMBxaNL13RGLIJWoK/PXIkMKEWAB18RBvDxEMy0UIB/yy
         KEpAtj6jgIPEOXb+Flj+rgUPc55o2PPf8QIXxmsqt5AwU5S83bITV7uJ+/I1Csf2ZuEo
         0OHGXddJKGMMOtII8o6vPpeJny+1Gy7xFncBbu6gFCPqzaVK4DPmbEqkhYaKYQsbE9ps
         R/mwV+pBZzQDWon6g8MjARb1EbbfvsHf5iyQMk7d9nlZh7FdS2xruw5leP0h/g3rYzWj
         D1bQ==
X-Gm-Message-State: AOAM532nSkEeS7JfMmc7IdarnyepVDg9uDb1p6q6EBqOHU4OikrfxpQi
        oen5gnIPRAhmdPGgRE6t+5831AbFlj+8Z4DS9NqP7sC9r7g=
X-Google-Smtp-Source: ABdhPJztsLhfPlIDXOWbtCLEN2eSmWIpJybl/IJoG/laFGPQUMT5dyD7xL28cKG/c8UTZ2WmLn4HesOiz1QICojDPys=
X-Received: by 2002:a2e:9d48:: with SMTP id y8mr15608833ljj.19.1635119024432;
 Sun, 24 Oct 2021 16:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211022014323.1156924-1-yangyingliang@huawei.com>
In-Reply-To: <20211022014323.1156924-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Oct 2021 01:43:33 +0200
Message-ID: <CACRpkdY07ciT_0FCOuWGV3dbfcsyDpAqy4Aon_WN1gA8QS6a-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: fix possible memory leak in pinctrl_enable()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 3:36 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> I got memory leak as follows when doing fault injection test:
>
> unreferenced object 0xffff888020a7a680 (size 64):
>   comm "i2c-mcp23018-41", pid 23090, jiffies 4295160544 (age 8.680s)
>   hex dump (first 32 bytes):
>     00 48 d3 1e 80 88 ff ff 00 1a 56 c1 ff ff ff ff  .H........V.....
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<0000000083c79b35>] kmem_cache_alloc_trace+0x16d/0x360
>     [<0000000051803c95>] pinctrl_init_controller+0x6ed/0xb70
>     [<0000000064346707>] pinctrl_register+0x27/0x80
>     [<0000000029b0e186>] devm_pinctrl_register+0x5b/0xe0
>     [<00000000391f5a3e>] mcp23s08_probe_one+0x968/0x118a [pinctrl_mcp23s08]
>     [<000000006112c039>] mcp230xx_probe+0x266/0x560 [pinctrl_mcp23s08_i2c]
>
> If pinctrl_claim_hogs() fails, the 'pindesc' allocated in pinctrl_register_one_pin()
> need be freed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 950b0d91dc10 ("pinctrl: core: Fix regression caused by delayed work for hogs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Excellent find and fix!

Thanks so much Yang!

Patch applied and tagged for stable.

Yours,
Linus Walleij
