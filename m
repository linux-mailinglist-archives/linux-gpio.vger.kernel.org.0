Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA6A4159D5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 10:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239857AbhIWIMT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 04:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237996AbhIWIMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 04:12:18 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AF5C061757
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 01:10:47 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id i132so19564851qke.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1gg3dsSGVNcrvv3pRU06f1hq0fAMhtx1ktCnDl3V9Uw=;
        b=TlD70pmCUi7mEY5kGm4HRXI/fVhnJ8UCGL/T7dV4eopq1Qa3qgTxPmnOcmvRffCAxM
         boj0Kh51FNQTHrL7RT7dQDnkzprGxQJd8H/xP0pY7LJgI6u782XIrsqH17CeiFzo0eMu
         JB9umPI3pS31e0mib/ieVNHJ29w7EZYN6PGEW76yv+2wSS2EM3LPcW6/27+hTgaI7gwh
         tXncCOBzWOrkMVLfNJKozihaLHtJYUPQMVig05oTlOu25hiqBz43SlDkV165iweQ/SS8
         GgjhVh0K6uPt9Y4N7sPXZUgu3Db8moGgSHR7ufHOTb9mH+54h7U4mQamVWc/YaOSvmrU
         I2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1gg3dsSGVNcrvv3pRU06f1hq0fAMhtx1ktCnDl3V9Uw=;
        b=J8kp983o0ZVs5yZkoDwLa0f4EX5IDPS58Rp1wSDQuNCw9RoxiuY7XoUGGIFKFsaDqS
         xygzjgNAUg9KferdSBs7r30B7Px4D6kwC0y1GWXbgXIrrCAi3MOsaVr4KCZ0NV0vSbHs
         Om0cH9AvCMSLM49pR+OwozQqdk01X/XVI7rYu0iqRm3QYvs4vQ0+tLrpAHNQFrQa9HaS
         R0cuyhg+SpulaYh78MNKBUJow01rQCR7rF2DEUUDShfkEJD6m/IHfh8LzVdL2DNivLnZ
         UzK3LFqKgJcGhSVPdTs7YhCh02387pZInzO9+YvwEy+abLXARBTTldtotuTutPnuI3JO
         ReUQ==
X-Gm-Message-State: AOAM531WkPHOgzJdi7BpoKgn6480BfVRAhm7ZCsmqWHfNsX2mT93RonO
        avUwShKroHfE+Mxa4seWGDsVmFMVSj0EEs1lLpKt0Q==
X-Google-Smtp-Source: ABdhPJzl47I6W4T7o0+dQTSaJ68pEUavxfNjv+tG8P8ZoKJDBgVU40dNKlSLPFyJA3Ad8aXcLSTmGGxbWl2B5joI9P0=
X-Received: by 2002:a5b:783:: with SMTP id b3mr3845515ybq.328.1632384646402;
 Thu, 23 Sep 2021 01:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
In-Reply-To: <20210922135319.3128153-1-piyush.mehta@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 Sep 2021 10:10:35 +0200
Message-ID: <CAMpxmJXndss2oVf2AhAcfP_YUPMCPPGzG7gXTEZwPBYm+y_GnQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/3] gpio: modepin: Add driver support for modepin GPIO controller
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>, wendy.liang@xilinx.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Rob Herring <robh+dt@kernel.org>, rajan.vaja@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 3:53 PM Piyush Mehta <piyush.mehta@xilinx.com> wrote:
>
> This patch adds support for the zynqmp modepin GPIO controller and
> documented for the same. GPIO modepin driver set and get the value and
> status of the PS_MODE pin, based on device-tree pin configuration.
> These four-bits boot-mode pins are dedicated configurable as input/output.
> After the stabilization of the system,these mode pins are sampled.
>
> To access GPIO pins, added Xilinx ZynqMP firmware MDIO API support to
> set and get PS_MODE pins value and status. These APIs are interface
> APIs, between the mode pin controller driver and low-level API.
>
> ---
> Changes in v2:
> - Added Xilinx ZynqMP firmware MMIO API support to set and get pin
>   value and status.
> - DT Documentation- Addressed review comments: Update commit message
> - Modepin driver- Addressed review comments:
>   - Update APIs
>   - Removed unwanted variables
>   - Handle return path for probe function
>
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/20210624205055.GA1961487@robh.at.kernel.org/T/#u
>
> Changes in v3:
> - Update example in dt-bindings documentation
> - Update probe function return value
> - Remove unnecessary print and header file
>
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/20210805174219.3000667-1-piyush.mehta@xilinx.com/#t
>
> Changes in v4:
> - Added input pin read status in modepin_gpio_get_value.
> - Updated modepin control bit for out configuration.
>
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/554508f5-8cb5-3840-9f61-f6cd6e5745d2@xilinx.com/T/#u
> ---
>
> Piyush Mehta (3):
>   firmware: zynqmp: Add MMIO read and write support for PS_MODE pin
>   dt-bindings: gpio: zynqmp: Add binding documentation for modepin
>   gpio: modepin: Add driver support for modepin GPIO controller
>
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  43 ++++++
>  drivers/firmware/xilinx/zynqmp.c                   |  46 ++++++
>  drivers/gpio/Kconfig                               |  12 ++
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-zynqmp-modepin.c                 | 162 +++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h               |  14 ++
>  6 files changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
>  create mode 100644 drivers/gpio/gpio-zynqmp-modepin.c
>
> --
> 2.7.4
>

Series queued for next. Thanks!

Bart
