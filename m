Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB35C399318
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 21:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhFBTEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 15:04:38 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35411 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhFBTEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 15:04:37 -0400
Received: by mail-oi1-f176.google.com with SMTP id v22so3709307oic.2;
        Wed, 02 Jun 2021 12:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e2vrx/QBePjkyqx9ENa+RBQUczjrTw2LnQ8NzOyjcB0=;
        b=n1PVYfXujQ5KNakLjvZ+wb+p78ky1YT2P+oXh/+4fNbY9fB44if9QiVH2/Rlaq2R4Z
         Z2uxOOfGNz5gvQLZzAmfxQkv8iVf8s+0QSobFlej4fAjWNEza7q6Hf1snsOD6xBTe/HE
         PN/FiuXsHaa/ntZ8rz4Jwb5NkFs+w27vFUCIsu9Hybjwf9KViMEBTTWrLsD2xQUYKZYh
         iPRO4WO1kRMXVj3r43Okl226v42hKj7iRdQ3OeGFW3PkupZe2pKMxpcFzkVY7MjqLzC8
         8vcTaPwAyjsw8VW5by1hrXx/VJs8FhKx3fFZj3T7nikDF2KYJrU4Hc+9yakOtbDLlY6/
         PuAw==
X-Gm-Message-State: AOAM533PFRuDCymSQuODmYUSemJ0vptHSpxWdD1YuAXYTNJlNMbOdZlh
        2TFqb4Gi/9EJkjwzbItkWg==
X-Google-Smtp-Source: ABdhPJwFzl2mCZiExS3oFX4eDQsnFWbiMLq/7d5TPsynHkoiIluIP0xq/89gZ+2sF5G/qYjOe1m54g==
X-Received: by 2002:aca:120c:: with SMTP id 12mr22141662ois.42.1622660573455;
        Wed, 02 Jun 2021 12:02:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q63sm163420oic.15.2021.06.02.12.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:02:52 -0700 (PDT)
Received: (nullmailer pid 3786574 invoked by uid 1000);
        Wed, 02 Jun 2021 19:02:51 -0000
Date:   Wed, 2 Jun 2021 14:02:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: Binding for RTL8231
Message-ID: <20210602190251.GA3786545@robh.at.kernel.org>
References: <cover.1621809029.git.sander@svanheule.net>
 <ea03804a538ecf45287f8cc356b8d9536c91e688.1621809029.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea03804a538ecf45287f8cc356b8d9536c91e688.1621809029.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 24 May 2021 00:34:01 +0200, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231, a GPIO and LED
> expander chip commonly used in ethernet switches based on a Realtek
> switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
> as a plain 36-bit shift register.
> 
> This binding only describes the feature set provided by the MDIO/SMI
> configuration, and covers the GPIO, PWM, and pin control properties. The
> LED properties are defined in a separate binding.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/mfd/realtek,rtl8231.yaml         | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
