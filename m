Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA073E945C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhHKPQx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 11:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbhHKPPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 11:15:34 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B30C0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 08:14:32 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a7so5141236ljq.11
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/0lDg+NImY6s6wrrkXig40C8tKxVtluzWl+MqfNgFF8=;
        b=Ce6JQNzC9o3guXHmwPdAlP5mDp+4HOxpqLsiszR2taDsyHd5aZaTtsEiOYzxcA/Euo
         m54gnDiSAMUsefUpZmERfYaICrSTLWJnss4J6jqUP28MsYD/M/bsudMDrwWw1drgF+11
         nOaf410iZooybX//Wf08Ka8ZqhmrlLQ8L72boSQnqHy2Ib+K43FyGyfhpWGUj9x2tHJC
         L5Z3j69a2LgLORqEKz40DeaNSjfU8XuH3+JNL9keKcASIm0brFhxaOML27UvakZ4w2da
         IZjxzmrnezYfxVthIm88z0AuFFggizbyH/OCvs1HHNsD59HEtXjUK6jkxAQGeotT/7Nk
         ULdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/0lDg+NImY6s6wrrkXig40C8tKxVtluzWl+MqfNgFF8=;
        b=R0RZFjBH1DVf0jxM79B1rj9Pcvz/rq8eBz0pDVsMk5YR1rYDGC9Z2qluErAF1GDIXV
         m8BbEEXPHeTMoE3y5uCYL1xyuY1WU+0ssI0QCupV9nh3Kfj9mb9BEi8xW84eZcT6cl6R
         BTOvwohwuzqUXsfH5wtgy2dtHXdAm/p/T+KJFkjr6PQ/n87mKnUn5UUo3bBKi3j59NPh
         jh6wuivVo78naTUXDEHPnL3aeZcz/Gu5pgjjQzyYflGfuUffyR6AR0gZRemP/JZJsGZY
         HBooO46VfEk2xkNN3FXdevWxZ+fLQsVyclkoq8MAwu5K2acFoThnmgUWmLNvvPURjMuH
         9oQA==
X-Gm-Message-State: AOAM532tg4rftz/H/PE89vaBILhc/32nAtGCVVfDrZ8vz9wpZ/44CkuS
        ZpLMzRN+SXD13dfqa6rDg5dAjsASDnX2JmutQX47Mg==
X-Google-Smtp-Source: ABdhPJzTOffu1IZaK0MrBftpMq2jJlt6JJb23qCbDVtCTwDCSo3HOeEpRFGxSmZshFxUvPMqYO7T98iaggWO6yENtRI=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr13187319ljm.467.1628694871026;
 Wed, 11 Aug 2021 08:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210805174219.3000667-1-piyush.mehta@xilinx.com> <20210805174219.3000667-2-piyush.mehta@xilinx.com>
In-Reply-To: <20210805174219.3000667-2-piyush.mehta@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 17:14:20 +0200
Message-ID: <CACRpkdbZouNdL43=nVLZd3hOeVQTLOZT=5FHGuM+3q3Ah2M9yQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] firmware: zynqmp: Add MMIO read and write support
 for PS_MODE pin
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Michal Simek <michal.simek@xilinx.com>, wendy.liang@xilinx.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, rajan.vaja@xilinx.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, git <git@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 5, 2021 at 7:42 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:

> Add Xilinx ZynqMP firmware MMIO APIs support to set and get PS_MODE
> pins value and status. These APIs create an interface path between
> mode pin controller driver and low-level API to access GPIO pins.
>
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> ---
> Changes in v2:

After Michals description of how this is controlling USB
PHY and misc resets I'm OK with the concept.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
