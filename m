Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8A363E0F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 00:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfGIW4u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 18:56:50 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39624 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfGIW4u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 18:56:50 -0400
Received: by mail-io1-f66.google.com with SMTP id f4so555523ioh.6;
        Tue, 09 Jul 2019 15:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9BNTOCR0FAJ2g4YYe8k6aNoK5Zx/TmcNqpSKDP9NSpM=;
        b=JKwjnzc7ZXJ3L4TohNvh5xoziMmkK0wdWuVjogXu3CBpa+SzWczaTK9/xR5NmOMmac
         o/ZKkrTPCYtaRXLgubN5960VryWjjTATKDYGvDAErySHPa2B5P1FMmsJWQ9UNbgPMNR+
         ZLEkyNiy14ZtItVyKr2N/qPrqEZ6yDtfXspPmddIjkmPllQGTtEF+EohqWuM8Ku3bQyf
         ApMLW6GWZlWaotLCgAFdhua3mGtYzpLfmw6Y+ZkhLC+O2TfXxY83K+J0qxCyys1qKWsZ
         AWeli9chSAhWlVOwqhmCvF3fIBQ5YnPHb3nYPmXabqi9hZ3XA615hJWv3EnUu3ngKKQX
         qGQQ==
X-Gm-Message-State: APjAAAUXmxY2Nyqc1MZAF38YK5urWxVxVE1STr6t1j5j910/dG7i0bJr
        UMrXH5fYQ4+9kaXKs7sQNA==
X-Google-Smtp-Source: APXvYqz+xwp1piJzrTHGP/QMIunspYfZSL/+DEFIMhBsaktuEIuhUeLCHzrMlf2OFmjZyQikva4G0g==
X-Received: by 2002:a02:8663:: with SMTP id e90mr23520924jai.98.1562713009260;
        Tue, 09 Jul 2019 15:56:49 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n2sm304558ioa.27.2019.07.09.15.56.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 15:56:48 -0700 (PDT)
Date:   Tue, 9 Jul 2019 16:56:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 4/9] clk: sunxi-ng: v3s: add Allwinner V3 support
Message-ID: <20190709225647.GA12966@bogus>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190623043801.14040-5-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 23, 2019 at 12:37:56PM +0800, Icenowy Zheng wrote:
> Allwinner V3 has the same main die with V3s, but with more pins wired.
> There's a I2S bus on V3 that is not available on V3s.
> 
> Add the V3-only peripheral's clocks and reset to the V3s CCU driver,
> bound to a new V3 compatible string. The driver name is not changed
> because it's part of the device tree binding (the header file name).
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes in v3/v2.
> 
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c      | 225 +++++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h      |   2 +-

>  include/dt-bindings/clock/sun8i-v3s-ccu.h |   4 +
>  include/dt-bindings/reset/sun8i-v3s-ccu.h |   3 +

Acked-by: Rob Herring <robh@kernel.org>

>  4 files changed, 231 insertions(+), 3 deletions(-)
