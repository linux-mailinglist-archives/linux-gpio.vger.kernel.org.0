Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC35155DE1E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241865AbiF0WET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 18:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243104AbiF0WEJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 18:04:09 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3333DD4;
        Mon, 27 Jun 2022 15:04:09 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id i17so6927752ils.12;
        Mon, 27 Jun 2022 15:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gzj1i2ACfifRLXBqezOQYrin0UkD3fmVgPjjmsk4L6I=;
        b=Gt9xH+6MqXGA1DLmYfsezWN/EEM1ckLstF2ozFnbYhUDYiCv0OiUpY/JwHrwCRsIaF
         2zWUl2iIBjvkE3shAyaF7TiCrsld1HubHtGZ83kdOgYoL8gLYYlC/AWI+Z9CyWNd82fO
         Rb2v43MBeSZnIikST7FvJE6QqRYwY3JGvoacGOqRg+yxsHnxI6Z+RS908J71PYWAThH8
         7YDX6l2U+Kp5GaJdjpKwkkwhB0P/MX9+zW5Zva1t4sYFThwIu2nAJyyYDoHaIug8PHGE
         5cqLMsCfho2W1kCsbuUsMe8i9NyELKNogGIH5m9MeWFZwMxA6pLtpqkQsYgJ8YdDx/Nv
         nQ6Q==
X-Gm-Message-State: AJIora+DIgDUBfYIJuquob1bV+W9hvX6gCvSHSeZ3x5wXgZreDJc9Qdd
        X4HlpV0NIttZBmkZ6ry++b7T1w45tw==
X-Google-Smtp-Source: AGRyM1uINzS4DU532Ry7RtJUmYs2FXs5/54HYBoOfuzYF6twzs4C2JYfFahNn3jJbMDhsUku/vFXjg==
X-Received: by 2002:a92:dc85:0:b0:2d9:1a4e:67b1 with SMTP id c5-20020a92dc85000000b002d91a4e67b1mr8449468iln.282.1656367448400;
        Mon, 27 Jun 2022 15:04:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n2-20020a056638110200b00339f2219720sm5154751jal.20.2022.06.27.15.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:04:08 -0700 (PDT)
Received: (nullmailer pid 3046175 invoked by uid 1000);
        Mon, 27 Jun 2022 22:04:06 -0000
Date:   Mon, 27 Jun 2022 16:04:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Remove spaces before
 #define
Message-ID: <20220627220406.GA3046117-robh@kernel.org>
References: <5188ef93a911ce3781b16530fdebbf0f0af462b6.1655301264.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5188ef93a911ce3781b16530fdebbf0f0af462b6.1655301264.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Jun 2022 15:58:40 +0200, Geert Uytterhoeven wrote:
> Remove spaces at the beginning of lines with #defines.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-pinctrl for v5.20.
> 
>  include/dt-bindings/pinctrl/r7s9210-pinctrl.h | 2 +-
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
