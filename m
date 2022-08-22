Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1CD59BC25
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 11:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiHVJBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233484AbiHVJAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 05:00:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6807C2E6A6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 02:00:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n7so1657351ejh.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NW1o3Ocn9ui/wOKfe4NRQMpfgibTny5rRKgCzkPbONA=;
        b=Symo+d5Y+hbSkSeGeF77LH2ZUvheytha7KL8jJE+h4fzp+uh5HIxPjztfcEQrspczm
         /yPWcp3LYBD+LtoP/SDqNzvI2xbjwk8iwJujbgictlA0KGP0kCSpHrkSBZz9NU6wfKgv
         28OjXi1mJyw3eRZJcNmPUv2EqiyKtiQY+gLWnvpoQEDY7MN80o1oifzIsYOUzamxmN16
         M+1LydX7Nf89a17+y62vzEMzUaBVC5Dmp+rNscjlks6VpvQAbqSbZfbgR15DA3p3Ycc8
         kS0XZsHpdNBb0A5EEBvuIp4sSPDTdqSxH5nbWN4JZANWVoY5SAx7AauXJZj4CvbpoJCb
         LaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NW1o3Ocn9ui/wOKfe4NRQMpfgibTny5rRKgCzkPbONA=;
        b=AubVbxl2D4kVKMEluq3N7avSCuLV65t7RkzTkvUn4fDiupyykPT0TpE8i4Anzntd8O
         oBW2NjM/bN6xK6xTz930Qlu1YzBdk/k/vnzKwbgMxeIeBT791efZWzy3pgDw8pra9i5S
         DwXHCoVZ0Q46lIUnR3PYPq0i2EucXzguaiQFGSYb7akJEmvT7r9CZ0zwUISpjEi4QnUo
         xsVH7QUgweLgYDmatx2epqkd5XJpDR93rUGXkUb2+nDyfHcClGgAfmePGXW7ZEVwyhxJ
         eL+I9/aJUZHJ0pD2IqBIN+b0Z8Q2I/+FSG38JMu+XiqCjpZ6v2CP6MFF+2ETsnvxvNIs
         2ovA==
X-Gm-Message-State: ACgBeo2Ro8ZhI3BOcm9wp59TLD5Tya1y+e5KUHfgh4ZI/pQLrtjKDPs4
        3k21hXumbKzfr8Bl1vh6xWUf6/qfSfgCXI1vdhxavw==
X-Google-Smtp-Source: AA6agR4DB225L5YdzNnhmSE7dqcZhLxtiZeH/J/szCd1CdX8nzYuSTIzAfsVV0mLJjTVj5i65FzbO2pVztZl8lJy3QM=
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id
 sb19-20020a1709076d9300b0073d85939608mr1620861ejc.203.1661158851971; Mon, 22
 Aug 2022 02:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220807192114.44890-1-sander@svanheule.net>
In-Reply-To: <20220807192114.44890-1-sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 11:00:40 +0200
Message-ID: <CACRpkdZahZO7WZt3m7MZ5yXdhAfVFTu0ZJ6Ln1Uz0q=NsgcF9w@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: realtek-otto: switch to 32-bit I/O
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Birger Koblitz <mail@birger-koblitz.de>,
        Jan Hoffmann <jan@3e8.eu>, Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 7, 2022 at 9:21 PM Sander Vanheule <sander@svanheule.net> wrote:

> By using 16-bit I/O on the GPIO peripheral, which is apparently not safe
> on MIPS, the IMR can end up containing garbage. This then results in
> interrupt triggers for lines that don't have an interrupt handler
> associated. The irq_desc lookup fails, and the ISR will not be cleared,
> keeping the CPU busy until reboot, or until another IMR operation
> restores the correct value. This situation appears to happen very
> rarely, for < 0.5% of IMR writes.
>
> Instead of using 8-bit or 16-bit I/O operations on the 32-bit memory
> mapped peripheral registers, switch to using 32-bit I/O only, operating
> on the entire bank for all single bit line settings. For 2-bit line
> settings, with 16-bit port values, stick to manual (un)packing.
>
> This issue has been seen on RTL8382M (HPE 1920-16G), RTL8391M (Netgear
> GS728TP v2), and RTL8393M (D-Link DGS-1210-52 F3, Zyxel GS1900-48).
>
> Reported-by: Luiz Angelo Daros de Luca <luizluca@gmail.com> # DGS-1210-52
> Reported-by: Birger Koblitz <mail@birger-koblitz.de> # GS728TP
> Reported-by: Jan Hoffmann <jan@3e8.eu> # 1920-16G
> Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Cc: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
