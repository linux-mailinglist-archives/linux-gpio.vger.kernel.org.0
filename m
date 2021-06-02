Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93B1399307
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 20:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhFBTAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 15:00:11 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34514 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhFBTAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 15:00:10 -0400
Received: by mail-ot1-f43.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so312137ott.1;
        Wed, 02 Jun 2021 11:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XxTgIILdcuRKgt2t103GTb8rzN2k3rWcVcHMsIEiZBI=;
        b=JVigLwRxRO+f20PApScsfbFnPPi9lWpZKzZkkRKLrhBCMkfd/+dF9nioGbBpeo4e5m
         fMPAzcV6XeDrtlN12NHXmTwE+yWsCMkbIimz6BCxTla/BtBtfJwiDan9Lr56vfXA4Qv3
         yEqsi7R5Xpf0wMYZm6ZvsiLGuWszLzdLQ4NP84hmBYRCnjd1nZI4mcdskEP4O9d+7a8G
         of0kGYZedCMDU+zQSHO1yRHsUVKiF7iHdT3Djw8V6XG44dw9Gu8qyJGB/WIwuicSXVJS
         T2TdxK+rFXoL7ovmIc0ILcCp6j+f8S8hr2sP1OKhkcGGUfA2VnB1oYlHXcouBkP9anti
         fICg==
X-Gm-Message-State: AOAM530GWjGZStNZaWNvnAh8rfhsFx6FoaAHILf8jaWsbXX+qJzUA/S6
        Lx6acy0tz9WxBH3dt3Vu4Q==
X-Google-Smtp-Source: ABdhPJx6IAb1nq04AfhTZzJUGBqnvkBwEUrVVBoXVFE4RZRpp3lLMddFbDRO5gegZODRBzOO7Uas9A==
X-Received: by 2002:a9d:289:: with SMTP id 9mr26361517otl.10.1622660305683;
        Wed, 02 Jun 2021 11:58:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t23sm153827oij.21.2021.06.02.11.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:58:24 -0700 (PDT)
Received: (nullmailer pid 3778567 invoked by uid 1000);
        Wed, 02 Jun 2021 18:58:22 -0000
Date:   Wed, 2 Jun 2021 13:58:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 2/6] dt-bindings: leds: Binding for RTL8231 scan matrix
Message-ID: <20210602185822.GA3778506@robh.at.kernel.org>
References: <cover.1621809029.git.sander@svanheule.net>
 <dca103fe584c7c5a07ad521ad3d1c08ba2758c77.1621809029.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dca103fe584c7c5a07ad521ad3d1c08ba2758c77.1621809029.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 24 May 2021 00:34:00 +0200, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231's LED support, which
> consists of up to 88 LEDs arranged in a number of scanning matrices.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
