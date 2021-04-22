Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE24D367608
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 02:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241086AbhDVAFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 20:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235167AbhDVAFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 20:05:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD23C06138A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:04:44 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 12so69144953lfq.13
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6eQLFu/iZ23p96P28yxRC3p2GNrQXWzyQQzuio77pc=;
        b=SPP4om4R4AMTV7IgofXTXIm3i9K8bYuNHWnGTz853l7ml5bkGZLceTQQg3nM6j36+H
         HR8t6ggUMkXBkiY5E0uiOZ9GAyK4OnQ0+GgyeZVeGfMzV82TccJry/scpZEksIt903jf
         pbdVZUdDi1+Oq2BKy7Y8DWBpiew+3oS6ED/8T7+YSqiH37Ytgi4/MCuo0iwkTiaBR5gH
         fUecbzygzr6HxI8EaHApHZs05K9sMa+dBEnYocuYwY38HEOzomlDH3QmsY596kg98vPo
         fLXDXVX/+Xbei+odWGlZzKXMKWhZbqg/TNlFl3+F1aNmBEJboyzxiC5MQRvoKyOqCoDL
         V3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6eQLFu/iZ23p96P28yxRC3p2GNrQXWzyQQzuio77pc=;
        b=JAkyZwMEtBIThjUzwGTZRPUWcK4XU6f+P/cfpBxK9JVHmnftLdkr63wSdxlf+6ySl8
         pK0JVKU6avrrebdi9azto0Xw8hJa3jy3QNfOaAOIzG0U5AGK0epiPe8/ipNo9orkCdNb
         2fwV30bBkV79lWBoB885KsP1zd9fzuChtdFkAqmMsteHrpbJwa+NPAuGWW6nLXtdnxjf
         TC6orPSS2JpkbYu97lXTPGB4UO/GtBh76Xf6FNIcsKQsYHsDATxxigY3I6YxFA8i7ppB
         qVApZ5bPS9NJiPDedUxZShRXn+TTC8/lxsmDaxYkMW4ztTP7kjQELuw4k/tQDNF5ZSb3
         Gksw==
X-Gm-Message-State: AOAM5308umW+HYeC5yuedqCNGMQQ3KHEW8TKN6dRtu0PjrjXMQ6GbnHw
        8ll5hKp2sWWQk+Cr6ZIEMczr2L/CSDr4WdnpA37JaA==
X-Google-Smtp-Source: ABdhPJwgc/YDtMjvbV7CtzwS7CT4zWpF9qjte+U5TKOZomL/y0KBiiuFLFwV9D+0JXT0kOz2toGEOElNbvV6CUAa3dw=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr492634lfu.465.1619049882524;
 Wed, 21 Apr 2021 17:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210412223617.8634-1-jbx6244@gmail.com> <20210412223617.8634-2-jbx6244@gmail.com>
In-Reply-To: <20210412223617.8634-2-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 02:04:31 +0200
Message-ID: <CACRpkdYv2vmFgFaEbQhRUGJ60oGYMdy+Zsbkg+0CQKonRp=7Ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: rockchip: change gpio nodenames
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 12:36 AM Johan Jonker <jbx6244@gmail.com> wrote:

> Currently all gpio nodenames are sort of identical to there label.
> Nodenames should be of a generic type, so change them all.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
