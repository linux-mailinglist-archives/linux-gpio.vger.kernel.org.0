Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7382C2EB559
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 23:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbhAEW0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 17:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbhAEW0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 17:26:12 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E7BC061793
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 14:25:32 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id h22so2240476lfu.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FEMLTsW4Oythj14GTJ7jU31wZZ5hKMA2Ny2/8Kp+qyU=;
        b=luuIkypBrdkLIJOh5VdpP1r6bU5h6/MvOS5HZ7fLbk9J2aQRLUvth1Jdm9+VVAqe8C
         U0tkhXeOLewRlAW31feXuG4kPxjy636EfksbkExqGVKVtnX3mfstNWlZSril2qDUb2m6
         GYMkDXMUc/v8/5D94qGgC8qghk3jlabOqKR7kENcAEnBo+nGa5seXF7H3OIVRagD0iBj
         1fFNkZp0UWZABEoRQXFXxdjpDH9TDByAVEnmAyGVda65Ld1hB6f/BctcflMp0ofY3wKy
         7FsivcyPTyk6KgwVfbozByw7W+vR8TliaSm4JBY6zYYJWulq0fDN1J4ziG4c0+BwQf/H
         IEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEMLTsW4Oythj14GTJ7jU31wZZ5hKMA2Ny2/8Kp+qyU=;
        b=NIypoetYTN9RZ2gt5GnZNzZg1320BdHRjLQvv+s4105hU/G+bUM7BT9lZpyBA3iykW
         uK/OheEfxUEcdpI7b2hvfSpj+w2yl51VJYS/VOcd2xPggJ8wCkh+na6g8riovfryT6dV
         g5gS/4hXpJjHAVj5nk3IMK70Gd+mAIBuQ1kKu7jNmk+TAyfKns8OrKtTBPlnrgfGlLB+
         +wtOkHSpCb1joX23CoZu0mHapAMDKq0vNv+MAUlto3/kR6gQihljLxzbIwBCORp0cX3M
         EUbDhEenjKK1OfOeeapWAZctUBYKVaf0hpb5kJkvafhIc+A7cOak7JL4JlCi8ZkXrQKH
         0/Ng==
X-Gm-Message-State: AOAM533bf8cwVM4RLWYYNG6OgJFhquEwhzx6+XnfEz/Zfkb3Yo6ugSkv
        yOUCXx9X/N2282lWbzCvC+Z9qOcZ5RFjhOZd29OxWA==
X-Google-Smtp-Source: ABdhPJzNspcIZCgj+WaYvpSErvdW9Yg+x+bmKacIit/Eo6Mpg+DwDxpilNb61mDmzj/m814bywHFeTHSXkOEdJyUmM0=
X-Received: by 2002:a19:495d:: with SMTP id l29mr544766lfj.465.1609885530724;
 Tue, 05 Jan 2021 14:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20201230154624.714388-1-arnd@kernel.org>
In-Reply-To: <20201230154624.714388-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 23:25:19 +0100
Message-ID: <CACRpkdbTsUtu-eow4iSiD-hWA_t_OAt41PqFMiG30eAfvcwrBA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: remove an unused variable
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Halaney <ajhalaney@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 30, 2020 at 4:46 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A recent patch added a local variable twice:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:953:8: error: unused variable 'wake' [-Werror,-Wunused-variable]
>
> Remove the unused outer declaration
>
> Fixes: f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I got an identical patch from Nathan Chancellor on dec 29 :D

I'll add your reported-by and Andrews tags.

Yours,
Linus Walleij
