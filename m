Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C599F31462D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 03:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBICXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 21:23:34 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:46480 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhBICXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 21:23:33 -0500
Received: by mail-oi1-f180.google.com with SMTP id k25so17861238oik.13;
        Mon, 08 Feb 2021 18:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qpoTMVPQx46u6ds1cmgCXGFytcOWMms9eaHfYfbn+x8=;
        b=lGfWHWQVqA9oD+BbQxlaQExg9r58dWlnlGVC20KU8qPjiqrMcx7Jjh8rMYm254+y9x
         NnsQCdHcc1PCJTw/SAGByVNCbVkBVEi79Og7nOUX3gAPp3RAEvfwVF3cmwbJGRc1z6C1
         eppUisa8ZpI7orRA5JzKenSBrXHJ/QzKN3KUTfjzP/MpXke0zGiM8J9y0+QkIDbN16Ho
         vnx5OXbRDkX5icExg80xlNSc3JvXbERReqqWUDTsuAZfSTOQFLI8wAsdLbH35gGav21d
         /esRUAN0D18i9Rugy1Gk8P9uqWsrG/k/kHA8a5xx+RYAPkApG/UwlqmIGbFx4Ckg9Xwa
         Rx6w==
X-Gm-Message-State: AOAM532cO6gZtBcR6dnJMKy6Zv8ogjUNGwzYTcKuhfpiz+r26W65siG+
        W6T241KPfplb31tzGKQYgFXlwVa7cw==
X-Google-Smtp-Source: ABdhPJzrw8HVjHkOjeRiJAgs80OtWHMXsFXkwysAA1QCum390/P0V7IoyxMWLOQ+JZEYBWe8BZyIIg==
X-Received: by 2002:aca:4f55:: with SMTP id d82mr1064606oib.119.1612837372416;
        Mon, 08 Feb 2021 18:22:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v17sm4028050ott.7.2021.02.08.18.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:22:51 -0800 (PST)
Received: (nullmailer pid 2545977 invoked by uid 1000);
        Tue, 09 Feb 2021 02:22:50 -0000
Date:   Mon, 8 Feb 2021 20:22:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        mazziesaccount@gmail.com, devicetree@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org,
        linux-power@fi.rohmeurope.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/17] dt_bindings: bd71828: Add clock output mode
Message-ID: <20210209022250.GA2545922@robh.at.kernel.org>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <1b6077ad08f7eacdac6604439d0921778d6046db.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b6077ad08f7eacdac6604439d0921778d6046db.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Jan 2021 09:16:23 +0200, Matti Vaittinen wrote:
> The BD71828 allows configuring the clk32kout pin mode to CMOS or
> open-drain. Add device-tree property for specifying the preferred mode.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v1:
> switched clk-mode property from string type to tristated one as
> suggested by Rob.
> 
>  .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
