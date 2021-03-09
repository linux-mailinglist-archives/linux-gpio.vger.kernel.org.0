Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09022332765
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhCINlT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbhCINk5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:40:57 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC420C061761
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:40:56 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id i26so9041648ljn.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2PVFTJad13/HHdNzwN8/vmlKlKOh1dKDhYFEC+sxbs=;
        b=oCa2SWgwfdjgNjhmNjTTUyxncE1srgWbgq4n1tk+YicLak1fz2d0Ocha/HJoao7WS4
         ijbw64tDUrTAHzwHknKJW5AWPQKLFKb9IYDL4Qsofhy5Zym6TQryG8BBvl1YlDiaM1Wx
         PzK6QjxGbq6GglgWkaZRgJwFDjNDCYoFLs7xqyx5sZav6TvYbzLRsIbSF6k5iYuOBTmk
         MuGvUGklfu2vmHSLGHJKvH0szrB7f5LB0aK8Bd9d4LWpxQXqhcHjW0+clsfA6zcFiXPZ
         QJEOtQF+8u7WccHrdPD389iZjrOIP+sR/aSMvqPTn8OA/LFDOkOn1URA6ZDzGTykGwjc
         d1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2PVFTJad13/HHdNzwN8/vmlKlKOh1dKDhYFEC+sxbs=;
        b=rWvecbkwlLyHB9We3S6cAsAJXNtKiYHybEDLf51+qvOayHNBJ6ID5jgm7VU7Leu9IL
         lyfiNxndkV2LXaGWPG2rFe7QsrgozXY2ZmWq8cC6Cgf8MF/UqlJZphCtTcfny5oxex/T
         5cctlj2AZd8x5hWc2rd35RzIeqHVxU8UXG5hRV3brgChPko9yNKOSI8pLCTPFoSHl/aD
         Qh9j9tNJcD0XemFeKknlzIb9BPmHOQWXCgsuMmi65VX6TRi2RnrT1Ce5GTaDX+m9oAjY
         vvjPLhMrnzoRXvnKVsCoot3mvzHGEBJ/x5sIFPmDyDzuCyo0UDCdm1aE6x33/vd9J7VK
         E8kA==
X-Gm-Message-State: AOAM530pbQ4vAd09YAeq9stVSIxdm/T+RAaHdkcEvt4qFe94a1gKRPMR
        0O9lxSo4iHiD1FQbJ5ly3zX2KQYCBHHFFWt7OBnHNA==
X-Google-Smtp-Source: ABdhPJybzyO6ZNZPaRk+OvWdcYfIHCWIpj+B9KZrup6oxp1HHl3PlLebHYEChGoROoICQaGOC6ZyrFwRYceCJuRDs0w=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr14436853ljm.273.1615297255364;
 Tue, 09 Mar 2021 05:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
 <CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wOWrpBGrpS3w@mail.gmail.com> <20210308183704.GA2747088@robh.at.kernel.org>
In-Reply-To: <20210308183704.GA2747088@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 14:40:44 +0100
Message-ID: <CACRpkda8+Lvz+c=ohXsEDkNSQ63hPo613P4p_90fvKyC_kQ_GA@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Honor "aliases" node
To:     Rob Herring <robh@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 7:37 PM Rob Herring <robh@kernel.org> wrote:

> Can we remove the ones we have already for GPIO?

I think we would get pretty hard pushback if we attempt that.
We have all these drivers that utilize it:

gpio-clps711x.c:        id = of_alias_get_id(np, "gpio");
gpio-mvebu.c:   id = of_alias_get_id(pdev->dev.of_node, "gpio");
gpio-mxc.c:     port->gc.base = (pdev->id < 0) ? of_alias_get_id(np,
"gpio") * 32 :
gpio-mxs.c:     port->id = of_alias_get_id(np, "gpio");
gpio-vf610.c:   gc->base = of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
gpio-zynq.c:    chip->base = of_alias_get_id(pdev->dev.of_node, "gpio");
pinctrl-at91.c: int alias_idx = of_alias_get_id(np, "gpio");
pinctrl-st.c:   int bank_num = of_alias_get_id(np, "gpio");
samsung/pinctrl-samsung.c:      id = of_alias_get_id(node, "pinctrl");

Predictably it is so many bad examples that new driver authors will claim
something along the line of
"why can't I have a lollipop when all other kids got one".

Several of those have this by a claim one way or another that
the DT boot need to look like the boardfile boot. Some of these
have been migrated from board files so could possible drop
this id/base coding.

I don't know what the maintainers would say, should we send
attack patches? :D At least some kind of motivation would come
out of it.

Yours,
Linus Walleij
