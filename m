Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7581637ED30
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 00:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241178AbhELUNi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 16:13:38 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34681 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385253AbhELUHv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 16:07:51 -0400
Received: by mail-oi1-f176.google.com with SMTP id u11so2262995oiv.1;
        Wed, 12 May 2021 13:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G314866YQpgK6Og9SPK+7F1yLW6LxWxUdwMljvXz8GA=;
        b=ntS1mHXkqk3pEdLJ8WoYnJ9bFVv4l5t98IzytclKC4aOoMekUirmmBCPnPDroLckTj
         /wMt3hE1K/DF5N8k6FwkHAQuTZKZXERsnKTssbeoyjTUTcBDp73vaES6QtvXZfOMJtx+
         cZYAhkC66111ZaRvfiZ79d339Q/4Aue7gbC7UFjUGtDTs7Kp6OqdwPcPmJN3PL8fiMqr
         HsuaIAG73N5lvBwfihCa7uykzHb/2Bu8VRECt42YnvGybuI6MiUNwPrazU0moQI3d6A7
         L5FYgRcX36g22BFioMrEqv5+1EqFLZK5w7zjBunZY3HXU9UZAQXDDZUyKdTRP2D5OEYn
         4erw==
X-Gm-Message-State: AOAM530f7dKn12hl+yRsUMIyLVvSRaPLhuBM//Y/l/l/24LeUcyW7PYi
        jxZqauP2KfBFNXtdqqMQTw==
X-Google-Smtp-Source: ABdhPJwxNouj8PhjvD5RQRalpsF56HCQ4sFcehx28dXWzUBDKpftaaS5YowOQ3Pe+GG7+R6Wi5KHlw==
X-Received: by 2002:aca:b8d4:: with SMTP id i203mr155393oif.61.1620850002606;
        Wed, 12 May 2021 13:06:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x141sm195890oif.13.2021.05.12.13.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:41 -0700 (PDT)
Received: (nullmailer pid 2232127 invoked by uid 1000);
        Tue, 11 May 2021 16:28:02 -0000
Date:   Tue, 11 May 2021 11:28:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linus.walleij@linaro.org, huangtao@rock-chips.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, bgolaszewski@baylibre.com,
        shawn.lin@rock-chips.com, linux-gpio@vger.kernel.org,
        zhangqing@rock-chips.com, heiko@sntech.de,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        jay.xu@rock-chips.com, cl@rock-chips.com, david.wu@rock-chips.com
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: rockchip: convert grf.txt to
 YAML
Message-ID: <20210511162802.GA2232097@robh.at.kernel.org>
References: <20210511050511.5973-1-jbx6244@gmail.com>
 <20210511050511.5973-3-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511050511.5973-3-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 11 May 2021 07:05:09 +0200, Johan Jonker wrote:
> Current dts files with 'grf' nodes are manually verified.
> In order to automate this process grf.txt has to be
> converted to YAML.
> 
> Most compatibility strings are in use with "simple-mfd" added.
> 
> Add description already in use:
> "rockchip,rv1108-pmugrf", "syscon"
> 
> Add new descriptions for:
> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V4:
>   revert separate schemas for each 'if' subset
>   add additionalProperties
>   move properties to top level
> 
> Changed V3:
>   remove select
>   change unevaluatedProperties
>   add separate schemas for each 'if' subset
> 
> Changed V2:
>   add rockchip,rk3328-grf-gpio.yaml
>   rename grf-gpio nodename
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt       |  61 -----
>  .../devicetree/bindings/soc/rockchip/grf.yaml      | 246 +++++++++++++++++++++
>  2 files changed, 246 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
