Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE7270661
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 19:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbfGVRHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 13:07:23 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44224 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730055AbfGVRHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 13:07:23 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so75449637iob.11;
        Mon, 22 Jul 2019 10:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0TKHVmpYowYp+z8r1gzs39hyeM5llWsZFOmeR/oEPIw=;
        b=WCT7ypccdr7tTW6UDiQVUDeux9CYtBGplN+h6ZYGl8qJ/2mLkE7ibRllbaVSvfnHS7
         g1lIFwxZglQvX5HoK7yiU5VhNrBUgZ6Dg5asWEHF7PsoG1deX3vnnV5qozYxaZTBMz2l
         zv3nGsh1TxyuZRpJMu7KClCPZG0kEwt9WF4Eif7mbHUxrXQF8/Tiejf0wTLzk3GiNaav
         Xtg84hRjl4yyhnXS1AzSTLvK8MqJ6+KYS8E69o6QVFAcVXOS7P7I2i1H0H3yQv+yxYS7
         lDjgTg1qkecHOSx9bHp88pFBTwP7df13g7nSYhL+eqtNhIkmjDDLvyFV7oNHUUX2Fogr
         keLQ==
X-Gm-Message-State: APjAAAVfYkpi1DK2pCKWQKUlkBECwGZWJQ6qHZ6RoqK6BYpPbsvXx6uX
        fdgA3FZzIalsZtUkzH3LvA==
X-Google-Smtp-Source: APXvYqywlOe9Bln+H5VDBcuJ2G9N9BSSNYkN/W6yLk3BvElGQtwQj/aF4fSQmFJDY/Yn5HQE6kkASg==
X-Received: by 2002:a02:9991:: with SMTP id a17mr46589517jal.1.1563815242458;
        Mon, 22 Jul 2019 10:07:22 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id e22sm30446659iob.66.2019.07.22.10.07.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 10:07:21 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:07:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v4 5/8] clk: sunxi-ng: v3s: add Allwinner V3 support
Message-ID: <20190722170721.GA6216@bogus>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-6-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 13 Jul 2019 11:46:31 +0800, Icenowy Zheng wrote:
> Allwinner V3 has the same main die with V3s, but with more pins wired.
> There's a I2S bus on V3 that is not available on V3s.
> 
> Add the V3-only peripheral's clocks and reset to the V3s CCU driver,
> bound to a new V3 compatible string. The driver name is not changed
> because it's part of the device tree binding (the header file name).
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Add the missing MMC2 clock slices.
> 
> No changes in v3/v2.
> 
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c      | 228 +++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      |   2 +-
>  include/dt-bindings/clock/sun8i-v3s-ccu.h |   4 +
>  include/dt-bindings/reset/sun8i-v3s-ccu.h |   3 +
>  4 files changed, 234 insertions(+), 3 deletions(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
