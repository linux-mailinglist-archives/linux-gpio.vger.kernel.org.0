Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F20A970A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 01:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbfIDXWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 19:22:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33892 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730349AbfIDXWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 19:22:21 -0400
Received: by mail-pf1-f193.google.com with SMTP id r12so435203pfh.1;
        Wed, 04 Sep 2019 16:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AczQNysYCDySei8X72/Dbg6e5rvNwR4UInmP+X7KiIU=;
        b=VbaQzcW7ZrQCe2trZID6XMUuX2GRHqIMz3cOd+SQkOSMHqcBaXEthPefBEdHGNiEz9
         CKQgTtlcemjBjTEsorjKd1bCvXlD5jsRU6nSa1wq71JCWPn7TIuKJpQkSlN6RkGGVulh
         JCEwTYHJArlHOVZncxwELRcyaRPvvFSmvgswRiAzSMcDMOgPAo2pAQjo5O1fhHH0A1Oy
         yC+R1zfZgCca/uxL8LRTRb5v3Crb9GNpC2cabxGumvLJxq1GLDXNBYD6C6MEUwPPdndC
         7uryL8utdveXv0F/f4TzBrvA2AMfQeIj90M1R4jyp38fffyqAEYzcMAGb15BZwbJQ1TC
         wHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AczQNysYCDySei8X72/Dbg6e5rvNwR4UInmP+X7KiIU=;
        b=D3EgD70x+tWe7r6RpbWiTXl0YV8YKnrlzoIRFURywODpkfSuneL+t2UV83iOQyCS/1
         x+7szsLEPRu5AmOkifFX5mrhfi/MWNZvLymRaskOtDcYOb1ZVCsqX0RLwJuQCql5IUqd
         JQl4sPZPiZyRlp0/tTV3yrbzZU0TfupZZaArAgnFDZotznYbglJSFjioDC8+6jGDTzSM
         0NCHnsFy3wGk1A+WUAPebNai4/Qt2OfzsU1qGQ7zKVb5cx5QpWlN6YYjsI7BZBn4iuW3
         eHzD9gU7aRxaiWovIGtlUQPC0Bm/ozcb55wb+X9Wiu2jVs0HqRB5leGFkVViqgou49bW
         PJ9A==
X-Gm-Message-State: APjAAAW9DMM4kgz4X6/lel+jG8vcbJ58w6CrexWkMjLdXG5TSgQgbgZC
        zOh1a5L312wM3gmAFoqn4Hg=
X-Google-Smtp-Source: APXvYqxcvm6k+WghPJeCu8cmhvNiDCNjL6T36Tcn/FxcrqBrhes1vvgrWkh6iO9bxdvQqYko4UUPKQ==
X-Received: by 2002:a17:90a:2182:: with SMTP id q2mr756708pjc.56.1567639341013;
        Wed, 04 Sep 2019 16:22:21 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.googlemail.com with ESMTPSA id f89sm116682pje.20.2019.09.04.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:22:20 -0700 (PDT)
Message-ID: <8fdf5eb4fda343d0c4919436490df9935fbfc34d.camel@gmail.com>
Subject: Re: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Thu, 05 Sep 2019 09:22:14 +1000
In-Reply-To: <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
         <20190904061245.30770-4-rashmica.g@gmail.com>
         <CAMpxmJUGm3Zs8VHwHnXTQ2cKnpF0caR=7V4bBi1_sy1U2mWc0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2019-09-04 at 09:02 +0200, Bartosz Golaszewski wrote:
> śr., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com>
> napisał(a):
> 
> Again, this needs a proper commit description 

I figured as similar patches have gone through with just the one line
and there isn't anything more to say that the one line message that
this would be ok.

>and the subject should
> start with "dt-bindings: ...".
> 
True.


> You also need to Cc the device-tree maintainers. Use
> scripts/get_maintainer.pl to list all people that should get this
> patch.

Must have missed that one somehow.

> 
> Bart
> 
> > Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-
aspeed.txt 
> > b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > index 7e9b586770b0..cd388797e07c 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
> > @@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
> >  -------------------------------------------
> > 
> >  Required properties:
> > -- compatible           : Either "aspeed,ast2400-gpio" or
> > "aspeed,ast2500-gpio"
> > +- compatible           : Either "aspeed,ast2400-gpio",
> > "aspeed,ast2500-gpio",
> > +                                         "aspeed,ast2600-gpio", or
> > "aspeed,ast2600-1-8v-gpio"
> > 
> >  - #gpio-cells          : Should be two
> >                           - First cell is the GPIO line number
> > --
> > 2.20.1
> > 

