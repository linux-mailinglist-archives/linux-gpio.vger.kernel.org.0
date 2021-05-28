Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1575393A63
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 02:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhE1Ao0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 20:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235299AbhE1AoY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:44:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECE7C061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:42:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i9so2722992lfe.13
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqXtv22ZUtS0qgDJidqDDJ8RaXdBnZWAHyKHD4vzru4=;
        b=QUInkCJmJmKNYvLUhAfzQ9flwayyOiI72mHVqOSAVviq9cvKXCaQhw7YCW2lAzue5a
         PtwE/YUdtJkMmWERc/tjvvU5g7H/D1KNkTU8PVBdpsBkEjqBDrBFKez0r0ekXSzCRB6R
         njAsSA7upPfSrTWDTyZo+svjYdmiHwRhAg9bGucEkfz66E+6+mDKQMEnX4wl/fVh480U
         n0b/oiJwC5jzuxN99JhcUM2wYp2vAq4drbWTA6lJyE+s55NaGsT2CJ+mblUkx+rwi22y
         vl8fWwFPs5ZutWWT7+NXciWVoG4FPCHHx90yX7+zYywdEjxKdAGFAY/tMy6ZxI595/Tz
         AVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqXtv22ZUtS0qgDJidqDDJ8RaXdBnZWAHyKHD4vzru4=;
        b=Y1mpIL1B6W7OJfqj8Jh/yCdzEcnc3bxi4Kj86PP/eiu8hGdgvZmGUofIGlra9fKU6I
         1GGJHgkTQxJxZdNpULigr0q98JH17YjaA1+MFoMo0jyihL0ISY66QdBmSERaKmfgPXEy
         I4uRjGQUl/mDbF3+3VSPiiinWkSoTXR/244W6HBgedYUrPauHhjxhzRZdRMEY7V9OxsJ
         +GpoypEGt1GIxDcyPKJgK1GO9zsqFzpOegX+s/bc2ywcm+C2ng3TXNVN9R5rHiK9bhh3
         hBBGGCNcqSDEwKi7VWkfk7EQzYIyk4NkIkg/airjBj9mBXcnwUoin7eWfDb2kcUw0+lL
         dHFA==
X-Gm-Message-State: AOAM533tcfuVVYkM3niQbj4vAhjX6xhdAA+1Pl1VWj6mJiLSdK7IZ0ad
        +sywFQOC4iZ9rQ01EYz+zlzcYpGn+42jpRuMHf6YRg==
X-Google-Smtp-Source: ABdhPJy+hfNUexCL8TTlUUJK8I3QzLMF+v0rvL61y44+e9fdv/apiuRrXL1TA5yo2dB7IrX8CBFMLj9cJ2SvZaMdBuA=
X-Received: by 2002:a05:6512:49b:: with SMTP id v27mr4249864lfq.29.1622162567971;
 Thu, 27 May 2021 17:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <1621998464-10918-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1621998464-10918-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:42:37 +0200
Message-ID: <CACRpkdZhVfnUkMqaAi77rV8gLxRdt638S2Kq1XW_6UZCTzHN2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix kernel-doc
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     ext Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 26, 2021 at 5:07 AM Yang Li <yang.lee@linux.alibaba.com> wrote:

> Fix function name in pinctrl-single.c kernel-doc comment
> to remove a warning found by clang_w1.
>
> drivers/pinctrl/pinctrl-single.c:1523: warning: expecting prototype for
> pcs_irq_handle(). Prototype was for pcs_irq_chain_handler() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Patch applied.

Yours,
Linus Walleij
