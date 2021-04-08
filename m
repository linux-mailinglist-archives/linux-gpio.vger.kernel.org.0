Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028D7358506
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhDHNoD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 09:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhDHNoC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 09:44:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1F7C061760
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 06:43:49 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h19so4086559lfu.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nd4MS/2X/IdRu/IPJEY7GmmOKW9PjkQK5am7Q8bLstI=;
        b=hD8KAQHdn5unol9mIEukltB0Fz0T3qQQS2GZ1hEXbDV+LUdIomndFB8jDC+/8r5lsf
         Zuap4QsWc1i4BK0nV76woFFpjpqd78ay7JVuJE7lRA5+35oX3JTgPwkEsw52eqNDq+Js
         5/H5iVyHA5mFpNATM0UjymDtqiGtC0PoWZcHa3SZblgizwLkDZi80MQVS+U5ITAfwY/I
         RxrQHVfGoTFjaWzb+27JUUk9VYyRvsXYcDeuMUUWeKDbqNwM9M1Wo1dWew9qOvQb6Ww+
         zQrZDd9dGfAdGdRTD0k2W6XIjAC/I2SvGAVsnkPq0/YgTNviQ6MVih9Lzi1pAalLAwQf
         a5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nd4MS/2X/IdRu/IPJEY7GmmOKW9PjkQK5am7Q8bLstI=;
        b=adGXefeh/HRek7lS6splfpkSCprX0ncLiR9BepXMqs0jhqUAOOAq0u8fcqNZst3Fu6
         ZR3oJJSzIV2izG+DqoUVRzQYr3RTgV5r3FnWfqbvtHapLSxWT4AXT4UV8lrjL8OG9VKo
         uOJ5elTSdabRwA3QxWDOpLgvw585jZrGm9FPPCE/MOB/R0e3YBy0sQvio4cUxy3Azp5m
         TjSXjSHozHq7+PfXhDHxs4l1syoJRsahimi2o4OW5/Fw8SSoq7bl1/ZOQ1vGGm9Fjy32
         WwlJApKMfXjvqRxouFupCOyXqPYje2McgYSgzPT6U0iyln53ytu9QyO5UleuASxmdCMH
         F5Yw==
X-Gm-Message-State: AOAM532roc6vfrqA1Vbmf+yAv8qGCCM8vQ8JFoUr0TGLgkgQommPSXSJ
        Pil99VC/ytfOFQAUE4WAt+W9fqBac97ytepiDPFj/dJCPLDnxg==
X-Google-Smtp-Source: ABdhPJymnbt4FfiI9iPC+BINQwSJEhxevKghWv8S1VlDu3pJBTF5MsChnMg8U1zsHNd7he3i/ZkOw0THQ/rxhuG91CA=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr6715385lfe.29.1617889427809;
 Thu, 08 Apr 2021 06:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210322104310.863029-1-jay.xu@rock-chips.com>
In-Reply-To: <20210322104310.863029-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 15:43:36 +0200
Message-ID: <CACRpkdZWH9Mitp8+SMSCW7kGy5Uz=govbh6=c8gqzL2u6FR-Ew@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio-rockchip driver
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 11:43 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Separate gpio driver from pinctrl driver.

I tried to apply this too, but it fails, can you rebase on the pinctrl "devel"
branch (I suppose the RK3568 driver got in the way).

Yours,
Linus Walleij
