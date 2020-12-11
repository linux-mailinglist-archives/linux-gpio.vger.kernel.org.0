Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343C22D6EE5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 04:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395208AbgLKDt2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 22:49:28 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40067 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395200AbgLKDtM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 22:49:12 -0500
Received: by mail-oi1-f196.google.com with SMTP id p126so8383989oif.7;
        Thu, 10 Dec 2020 19:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=642NAFsM0Lm5NS4AR+A1xpLH9spPHQSGMiEFOam3eac=;
        b=sdYrdjB+8llCa+cKqGYOoqSYht9wyc0GCXegUv7F2t+ScKZTHeb6QwWQzyZwKxFsQ+
         fFn9nWlhXhoi3VZp0tb+0wgrvXZZj5gKzz476oxXeGNtJOS407wOvG9eFf+pxPEwTrqd
         Tn/RonqPkBmPBce7sEJvJWLnQLz9AM4sAjV2YIsIMhhm0icfjqMPZwoRDHs8b6R3hzCU
         qQpNEcE6o5YLXvbgXO3YnDI9CvRHuoUDdIMdVro8uT2CSYe5s7OYZ6+qJ2NXQkOeSdNP
         iomzkAjBq3WkcHq7khI2N50zsJHs9w0c3kiaF3230I9OTtht6OCyCKFEXdFVG0cAAJ7N
         NWxw==
X-Gm-Message-State: AOAM533Hcq5dr9z+zNEuHiJeVAccwOo14hjRBMftdHlatcOtTUT+rf84
        dE3al4GOeETqY7Nuv+Kfug==
X-Google-Smtp-Source: ABdhPJzK6K/JR3NZDscKKog+CNYNKX1X64mdTRsqyujifV+OLcuq/d6SRPjqAf/GnjERQEHVBGtHqg==
X-Received: by 2002:aca:5711:: with SMTP id l17mr8030800oib.53.1607658511294;
        Thu, 10 Dec 2020 19:48:31 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m81sm1514470oib.37.2020.12.10.19.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:48:30 -0800 (PST)
Received: (nullmailer pid 3605578 invoked by uid 1000);
        Fri, 11 Dec 2020 03:48:29 -0000
Date:   Thu, 10 Dec 2020 21:48:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
        linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 08/22] dt-binding: clock: Document canaan,k210-clk
 bindings
Message-ID: <20201211034829.GA3605540@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-9-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Dec 2020 23:02:59 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC clock
> driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
> The header file include/dt-bindings/clock/k210-clk.h is modified to
> include the complete list of IDs for all clocks of the SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
>  include/dt-bindings/clock/k210-clk.h          | 55 +++++++++++++++----
>  2 files changed, 98 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
