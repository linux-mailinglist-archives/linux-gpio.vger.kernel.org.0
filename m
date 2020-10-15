Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4EA28F174
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 13:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgJOLk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 07:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgJOLk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 07:40:26 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F97DC061755;
        Thu, 15 Oct 2020 04:40:26 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z2so3242753lfr.1;
        Thu, 15 Oct 2020 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WtpDL7/t1P9RuyMG5iZdjHg44W+tOwtfwZ3CIyCNFtY=;
        b=WJqjGxcTtReAwTmTismmlgc3XYFbe/0XDUdSoAfVCRDkEdCotRuxEO360ojNV0AmAx
         W0v+EVeEV2N8XJr+TnKIpCSIJUr/I0dK6BWzJ8jueAG2hGlZHbOSgpv9J3VzJD5jIYv+
         74rUHzYeCUlo3jFbnIv7SKI5TO1gQRpRwanF28BXp7glwjx8tcFOl09e3slodAazzcDW
         Z07SsUU0pW66Kzg0GSZzYrcwezguXD1VI2dZ/DpMXvt5RHqJAnjsBJl6BmErdYmSclps
         Dc9HGR6/otIaZQDVzWy8UvfSwk4Aoqyod2oTWcBAVVPamvcP86Wi6PWNzpXnrdhoN8bP
         YDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WtpDL7/t1P9RuyMG5iZdjHg44W+tOwtfwZ3CIyCNFtY=;
        b=DK187gjIF1ZxUkA0g/vC7hgTkrCLNoRFK2wt0LA8cyDabuglxFcET5gZWxvbMbaX0v
         YpcUPXY4hpVk/JOJgA5TPw7/Xh8AcSwkmTHWfDbEpO1n4qu0vxioAvotc4utsdRPon/6
         5/edYZGX4gG1L++JH3Pi6kHuSStLm7q1psl0g6hq6woScmIK08D5uNi5dzqByvNeBSt9
         M4PAipG2qImeY48T+CfZy0qCxT/00OGOHvR03Pryq7a92kzv77JX66J/FC/u7iNBWj9z
         JENZkfO+palxEDX+fQRI72C3PdZiihhUNeD8yKY1i0N7BWahrj/tecC/piUbgkTZlsd+
         cUbg==
X-Gm-Message-State: AOAM531lh67wvM1p00Q3STQaHG9+5OdLy3uIq/dZO2F8XqGlqT2WGCv5
        UxnLR7TmCgvoSKZsf3S0GrA=
X-Google-Smtp-Source: ABdhPJxdWyzLMLepBW0eaHJJRrTVeEBkEga/kaziR7QGiNzUHNTxM4iX4vRGyXT8LY5KW0GGD0E8jA==
X-Received: by 2002:a19:f510:: with SMTP id j16mr972157lfb.91.1602762025040;
        Thu, 15 Oct 2020 04:40:25 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id c21sm940835lfm.308.2020.10.15.04.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 04:40:24 -0700 (PDT)
Date:   Thu, 15 Oct 2020 14:40:22 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] remove never-used "snps,dw-apb-gpio-port"
Message-ID: <20201015114022.7ptrl37g5d3lumyw@mobilestation>
References: <20201015115524.24e3c36b@xhacker.debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015115524.24e3c36b@xhacker.debian>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Jisheng,

Thanks for sending this cleanup and for the work you've done in its framework.
The compatible property is indeed redundant in the DW APB GPIO bindings, because
any sub-node is considered as one of the device port from the set {A,B,C,D} and I
don't see why would we need to be there for anything else. The port index is
initialized by the reg property, which I've just realized lack of a proper
constraints.

Anyway see my comment to the DT binding file. The rest of the series is up to
the corresponding subsystem maintainers.

-Sergey

On Thu, Oct 15, 2020 at 11:55:24AM +0800, Jisheng Zhang wrote:
> The "snps,dw-apb-gpio-port" is never used.
> 
> Jisheng Zhang (8):
>   ARM: dts: berlin: Remove compatible string from dw apb gpio port
>   ARM: dts: socfpga: Remove compatible string from dw apb gpio port
>   arm64: dts: apm: remove compatible string from dw apb gpio port
>   arm64: dts: bitmain: Remove compatible string from dw apb gpio port
>   arm64: dts: hip05: Remove compatible string from dw apb gpio port
>   arm: dts: socfpga: Remove compatible string from dw apb gpio port
>   arm64: dts: synaptics: Remove compatible string from dw apb gpio port
>   dt-bindings: gpio: dw-apb: remove never-used "snps,dw-apb-gpio-port"
> 
>  .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml          | 5 -----
>  arch/arm/boot/dts/berlin2.dtsi                              | 6 ------
>  arch/arm/boot/dts/berlin2cd.dtsi                            | 6 ------
>  arch/arm/boot/dts/berlin2q.dtsi                             | 6 ------
>  arch/arm/boot/dts/socfpga.dtsi                              | 3 ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi                      | 3 ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi           | 2 --
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi                  | 1 -
>  arch/arm64/boot/dts/apm/apm-storm.dtsi                      | 1 -
>  arch/arm64/boot/dts/bitmain/bm1880.dtsi                     | 3 ---
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi                    | 2 --
>  arch/arm64/boot/dts/intel/socfpga_agilex.dtsi               | 2 --
>  arch/arm64/boot/dts/synaptics/as370.dtsi                    | 2 --
>  arch/arm64/boot/dts/synaptics/berlin4ct.dtsi                | 6 ------
>  14 files changed, 48 deletions(-)
> 
> -- 
> 2.28.0
> 
