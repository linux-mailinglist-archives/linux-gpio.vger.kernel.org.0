Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A6921E076
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 21:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGMTHk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 15:07:40 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42173 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgGMTHj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 15:07:39 -0400
Received: by mail-io1-f68.google.com with SMTP id c16so14679763ioi.9;
        Mon, 13 Jul 2020 12:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3VFQYqDxsT9U9IQFzCUk7jP4l7LP6d4PWhMtTAVSyxc=;
        b=O3HBrKbV2CGFehkZbUC+m9QcEJjRgimsYOE9X0bjEpoBcaMspj2MbB9tSIMOlMxHx5
         ampFR4g3+t5NGga4kaEsFVuZmaOM7TS08jHKZr3LZ2/ibHy8a5TZ6ZhKqR8P40FcdQPv
         8jwLM8A57/NR+BMT+EurnJqN5BtdWdKj8GtTw1BOdtAodJJ1O6pW5mkulw5rhyBXvIYq
         sY0xOc9c1kAsuBQ05SzP64qX7xngqaZ5Rbb5vMouqqTyy33xKBm9UKhnytD2KDaKcXKV
         bFJx9MwpxOaMiCkEKg6x5wDO9AnpUHJRE8Gtz4rL3KGQbiK3qjLzz3BuM2H4ME9Ntkur
         MM6Q==
X-Gm-Message-State: AOAM532J6wm8RgZub4dv7Kv1YlpNT8Q8QDxlaVodYgqX+wwjW9oaptVG
        zZjncm0r1D5PWU79wnWPVG9nuWhUzg==
X-Google-Smtp-Source: ABdhPJz5QIod6AWLH4QLE3qJDD1EUzl5zW5UETJ/zfRcFFUiY1Gdz3A4LuaLntKKgiMfc+BNAo4eZg==
X-Received: by 2002:a05:6638:61b:: with SMTP id g27mr1671542jar.123.1594667258675;
        Mon, 13 Jul 2020 12:07:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q5sm8726237ilm.73.2020.07.13.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:07:37 -0700 (PDT)
Received: (nullmailer pid 553772 invoked by uid 1000);
        Mon, 13 Jul 2020 19:07:35 -0000
Date:   Mon, 13 Jul 2020 13:07:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
Message-ID: <20200713190735.GA553719@bogus>
References: <20200630160736.1196697-1-mans0n@gorani.run>
 <20200630160934.1197066-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630160934.1197066-1-mans0n@gorani.run>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 01 Jul 2020 01:09:34 +0900, Sungbo Eo wrote:
> This patch adds device tree bindings for the NXP PCA9570,
> a 4-bit I2C GPO expander.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v3:
> * fixed dt_binding_check error
> 
> v2:
> I don't feel I can really maintain this driver, but it seems all yaml docs
> have a maintainers field so I just added it...
> ---
>  .../bindings/gpio/gpio-pca9570.yaml           | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
