Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2EE39D5EA
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhFGH0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:26:40 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:41688 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhFGH0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:26:40 -0400
Received: by mail-lj1-f171.google.com with SMTP id z22so4857448ljh.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XFKCqW38BpyvPGAj77mmhqNmYLUf96meoe7Ud9PZGU=;
        b=vC945zI42SGNSFLbyn9rEsAMxhu45h3PuyKwFq7h1XDlOcuIvmpK2VLv7G+BBx3R19
         OH4Aw4xp8La+eZdh0eIqHcJWyA2rJzbJsacmKxJZ4wEmCIDZhOlZ7M/W7YkPuMGespU5
         iOT4lSj6twrWYh8tX4uZANH/g7fph/NM7y88ljWtvZWwKlwIDUvOs3MxGL/7XjxdIue2
         TV+hjVHq4B/I48nKs6/qn3JWVR8h5l/UR5+6DEpp+fOVQ3kqVZ3/ubY7kPOepLISAqFg
         WMJN2+j2OcIIps7I8rdr7P1mVl6n7gdaTp640izQ/ao/yv+97MZ+70SkBV3MTWVNuiPF
         02sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XFKCqW38BpyvPGAj77mmhqNmYLUf96meoe7Ud9PZGU=;
        b=l9Af6jsHy9McAodagXO5QzmU+K+qyL8sjELKI9os9M8EYeKtubGopcnkYQZ6jumHE5
         fRqEVUAuSVQ/lkdIW+prJn1xbEP52uFIMubveW6/9oxUxwm+5FODtc2wjDOY7ijxlGWM
         8khNIsY+5XbO0jH/9AJHOL2MIv//kqzAmkLhxd4LUPrSjNnkAil94s4TGeWPdaEe6t6H
         KfNie2So/Mzna0TGSdzT9HzM/j3g4wQsg/gHWH5gdENuJH3/PGhXm6vHjM/K71KEINMy
         sSxqak7YxSPSFXS24CWiIo2clfu+cvXE52TVKow8uSAPsyYlkEGCd/pJ2PIO+4ng/UxU
         bjew==
X-Gm-Message-State: AOAM530iB2yEk/GfpHXVXGojBZd221cNnS31qmmmg5Yeg1Su9HMQMMuJ
        1StGWFALFzzoMeXbTRgenkjiXFXCeMkf6krwRBXYGg==
X-Google-Smtp-Source: ABdhPJwuqelB5PyBM1VHEI4uCLaiUDh/xZ4mnMHjjpAkJNVH6A3JSlSz6qXB+TBuE3fPhVBKTCgunUZRFppjWZPs2IY=
X-Received: by 2002:a2e:7811:: with SMTP id t17mr4226689ljc.368.1623050628263;
 Mon, 07 Jun 2021 00:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 09:23:37 +0200
Message-ID: <CACRpkdbn+OTdTgTj5wmDiegetoe=Wbz3YbWMwqR9TQAFND+H4g@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: ralink: move all pinmux arch stuff into
 driver code
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mips@vger.kernel.org, ilya.lipnitskiy@gmail.com,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 1:52 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> We currently have 'drivers/pinctrl/ralink/' with common code to all of them
> in 'pinctrl-rt2880.c' file. Pinctrl data was being passed in SoC initilization
> to the driver. Instead of doing that just move all related code to the driver
> itself. We maintain for all of them compatible string to avoid to make more
> changes in dts's an so on. If a new compatible string is neccessary to be
> defined for each different SoC, we can change them after this series are
> applied.
>
> I have only tested MT7621 platform using GNUBee PC1 board. I don't have
> other boards to test other SoC changes.
>
> This series are rebased on the master branch of linux-pinctrl git tree so
> I expect this to be merged through pinctrl tree. Thomas, if 'linux-mips'
> is preferred to merge this series just let me know and I can rebase them
> to make you things easier.
>
> Thanks in advance for your time.

I have simply applied all patches so we get some testing in linux-next
(last time we found some snags through linux-next).

This is an important modernization of the ralink SoCs so I
am pushing the fastforward button a bit.

If some ralink maintainer has opinions they can either patch it or
complain loudly so I can take the patches out again.

Yours,
Linus Walleij
