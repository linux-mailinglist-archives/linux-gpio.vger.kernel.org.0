Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E515267B57
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 18:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgILQPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 12:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgILQPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 12:15:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09952C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:15:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y2so8954155lfy.10
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mfFSLJ2aT99PDQEJLg63CY2EfFTeT2UQOOCsNtG5XQ=;
        b=ik2OaDdzUHuVOMNMLsgvQOnL4fvUvEqien4NjpuI5VfIclMzHKWaow1odpvd5sDPJU
         +LXHDLiPBxR8ThB4sl5aU07BCGyBsQ0CUT5VU6uQyRjR0z/eVMBKV/EafigpOJM2w6fx
         tUF49I4gg9jJzUNcM/EjXzreHBPpIlb/n4r5NT5TvcdPcNldy6x3TCHdfhOof7EJKQ/u
         kLZH5q/yNZIk9TzYMtUHe6cNExS56wCEroXgH0iLeRteyVneoKhJ3FbCUEVL5W4iG82t
         Hyl6zxvpxVVMdWTF4rS9E+pNohfmkBfFjwohofeLq61gNe4dH/KzLBRCSgspSF7nutvm
         ByUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mfFSLJ2aT99PDQEJLg63CY2EfFTeT2UQOOCsNtG5XQ=;
        b=LB/gtVlh1OAj0TGeGbYHwT/YRKnMXPffapLtZzIOv294IZedfkoSiqH8Ofl2FKcdj1
         zUA5XU65kE0JDgKReeqkRilIbF7aLK6OmqFKHsRhqXXTZlI08N3lgYBU7+KC6AcooaH5
         ZGltNF6Ea8OiJFi0cQdP7AWOrJ3b558FNPuVkdIj8HJ+K9+mynW6hvgcKBsm854DHihr
         9eDWf5zOIWsemLxZ8SB8xuCu8qoz3SgcUwF0+5uYklIz8V4PX2QaLNl2EhIQCV5ZjS0a
         cLjwLH+bxIL1scHVkxkEzcwsZfOjuBgeJWREdTrRUYiJ/ImEj6fatxNtDZxlbottJ0m8
         5apQ==
X-Gm-Message-State: AOAM532qbQD96L8mS03HUjDEsSizF5Y4LnrRiprvoi3/XrXT/leWQcWL
        UTdSDrFFR+t9EAYISiGPOt7czP+9tWf6IV/UgLgzDg==
X-Google-Smtp-Source: ABdhPJwzk5Ff3ZAWzHOFqk2anJO10WsYhRwbjNzmrZfdwXqXvmayMoWnkftiDhcCyLXCuPFXWkcBZk4GHcnDyvYoRF0=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr1756518lfr.571.1599927340316;
 Sat, 12 Sep 2020 09:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz> <20200907211712.9697-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20200907211712.9697-2-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 18:15:29 +0200
Message-ID: <CACRpkdZbo6zN+F0K6oHyWRTWN3raRGVNzps4VCB+QuSzsyq9Ow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: mvebu: Fix i2c sda definition for 98DX3236
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 11:17 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Per the datasheet the i2c functions use MPP_Sel=0x1. They are documented
> as using MPP_Sel=0x4 as well but mixing 0x1 and 0x4 is clearly wrong. On
> the board tested 0x4 resulted in a non-functioning i2c bus so stick with
> 0x1 which works.
>
> Fixes: d7ae8f8dee7f ("pinctrl: mvebu: pinctrl driver for 98DX3236 SoC")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

This patch 1/3 applied for pin control fixes.

Patches 2 & 3 should go via the SoC tree.

Yours,
Linus Walleij
