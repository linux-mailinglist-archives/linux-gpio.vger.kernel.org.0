Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2863F501D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 20:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhHWSKQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 14:10:16 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:37378 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhHWSKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 14:10:15 -0400
Received: by mail-ot1-f45.google.com with SMTP id i3-20020a056830210300b0051af5666070so28910865otc.4;
        Mon, 23 Aug 2021 11:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g+CqhkyW2c8CXWLjQLbAdHrQQUJ+lxu98gFxCWPW9UY=;
        b=gaFFH1TtGaesnUM3luk4145124LurLFLPoERf4NTgkgXARY/wRm3BtcJzOgNbpW3qz
         GqpdO7vxKluoGrUSDnBQc15RifEYLx3ujNHAIPcwMkvCEEcHZH6BQ4e0h4hUV5AA9npz
         bV5JHXlds8ZVl6En7HHAeCTeEZKP6DlKofQbmPRQYkHu0lq/eZ4LzWnXeOg4kXhnYhar
         2uP97US1bK4l8itIe2CTClGX9rEaEcl7plAHt3xTCu55/2U60WUN2ah7MHpw9sjVoTgR
         XDR4J+y8Ba7UPddZc1Q5gwSatusGXYSYsPfAa+i1QWddnsqCSpVOgagKwWO0QNpp4xbr
         mNXg==
X-Gm-Message-State: AOAM530j5rLDzPlUFG652ViDaJtt808XveSpCFU0FNBSWVxQTUpV8moY
        cGqmGsm8OdMVG3ynS0M7QQ==
X-Google-Smtp-Source: ABdhPJy808XGMxfgtJt2olJn0b2kz8EiXE3TMOiTOMuQ2t08pHFJLizMoZJWfluz+DhSee7b56XMgg==
X-Received: by 2002:a05:6830:2809:: with SMTP id w9mr10268776otu.114.1629742172567;
        Mon, 23 Aug 2021 11:09:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s63sm3875103oia.52.2021.08.23.11.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 11:09:31 -0700 (PDT)
Received: (nullmailer pid 2445747 invoked by uid 1000);
        Mon, 23 Aug 2021 18:09:29 -0000
Date:   Mon, 23 Aug 2021 13:09:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     sgoud@xilinx.com, git@xilinx.com, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, zou_wei@huawei.com, arnd@arndb.de,
        michal.simek@xilinx.com, robh+dt@kernel.org, iwamatsu@nigauri.org,
        wendy.liang@xilinx.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, rajan.vaja@xilinx.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 2/3] dt-bindings: gpio: zynqmp: Add binding
 documentation for modepin
Message-ID: <YSPkWUs0Y2zDiHQU@robh.at.kernel.org>
References: <20210818081018.2620544-1-piyush.mehta@xilinx.com>
 <20210818081018.2620544-3-piyush.mehta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818081018.2620544-3-piyush.mehta@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 18 Aug 2021 13:40:17 +0530, Piyush Mehta wrote:
> This patch adds DT binding document for zynqmp modepin GPIO controller.
> Modepin GPIO controller has four GPIO pins which can be configurable
> as input or output.
> 
> Modepin driver is a bridge between the peripheral driver and GPIO pins.
> It has set and get APIs for accessing GPIO pins, based on the device-tree
> entry of reset-gpio property in the peripheral driver, every pin can be
> configured as input/output and trigger GPIO pin.
> 
> For more information please refer zynqMp TRM link:
> Link: https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> Chapter 2: Signals, Interfaces, and Pins
> Table 2-2: Clock, Reset, and Configuration Pins - PS_MODE
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes in v2:
> - Addressed review comments: Update commit message
> 
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#mbd1fbda813e33b19397b350bde75747c92a0d7e1
> https://lore.kernel.org/linux-arm-kernel/20210615080553.2021061-2-piyush.mehta@xilinx.com/T/#me82b1444ab3776162cdb0077dfc9256365c7e736
> 
> Changes in v3:
> - Addressed Rob and Michal review comments:
>   - Update DT example.
> 
> Review Comments:
> https://lore.kernel.org/linux-arm-kernel/YRbBnRS0VosXcZWz@robh.at.kernel.org/
> https://lore.kernel.org/linux-arm-kernel/d71ad7f9-6972-8cc0-6dfb-b5306c9900d0@xilinx.com/
> ---
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 41 ++++++++++++++++++++++
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
