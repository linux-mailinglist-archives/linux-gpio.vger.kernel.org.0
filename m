Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309154005DA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 21:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhICTd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Sep 2021 15:33:56 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:38644 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhICTd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Sep 2021 15:33:56 -0400
Received: by mail-oi1-f175.google.com with SMTP id u25so464974oiv.5;
        Fri, 03 Sep 2021 12:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KheS+b13SKBDM5Cw+jQcKqwiqg25iR1Yy5WSWs+WcCE=;
        b=pixGb6ZMzriVBWL+FF3w1HuszjjVdYRz2T769j7APbmjaTeXvYOaVj28NfC3ZvxsFs
         tZ04Glh6QQ9MfKTRJdCETCmzBBC9I16kc8Qt3uFuCeNnEtKi9rmLzVmRHe674gSD76xJ
         IKSNUCshGJ72Pu+NG41d2wzZJalHo1zY4pwsv3S4lzTUGr4VR1d9BKqIJyXNheU6wU/k
         l1YUkFid0Z04s21b19I5zUTHHn3a7i4dFSjtgSTND6jMk4VZSn+mpuI40iHftEtFVehD
         Rn6Nfpnys+1LTSY5JXDTJSs7/GvWQthwTGCQe0/gB2iTOdYhihrWQYE6HyPBQuZZeusx
         n4uw==
X-Gm-Message-State: AOAM532eB9UDrQtoi3K0xA1cdpkFZ4tjt+5l2do0m09gMukkrgERc+Cb
        /MpZaHbu8HorJCDHQTJngw==
X-Google-Smtp-Source: ABdhPJzLt3LVPMzouNMsLAkLdBJidudfteM4PetC18oSXhQoyXr7xTBPWBX8jxV0fVylGSipHxUsrg==
X-Received: by 2002:aca:42c2:: with SMTP id p185mr269289oia.159.1630697575482;
        Fri, 03 Sep 2021 12:32:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a6sm59968oto.36.2021.09.03.12.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:32:54 -0700 (PDT)
Received: (nullmailer pid 3322715 invoked by uid 1000);
        Fri, 03 Sep 2021 19:32:53 -0000
Date:   Fri, 3 Sep 2021 14:32:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-gpio@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 22/52] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YTJ4ZV1v2ssnwR5O@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-23-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-23-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 01 Sep 2021 11:18:22 +0200, Maxime Ripard wrote:
> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Removed the example and moved it in the mfd schema
> ---
>  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
>  2 files changed, 55 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

This needs to be applied with the MFD schema.
