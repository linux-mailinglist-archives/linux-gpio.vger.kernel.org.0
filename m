Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC8B73012
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 15:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGXNkO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 09:40:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:33828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbfGXNkO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Jul 2019 09:40:14 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1AEF22BE9;
        Wed, 24 Jul 2019 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563975613;
        bh=bhFiWmjAtAurAZfHqqApK5Lonkxgn8fire9Ml19llMA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kh2EK3z7boQ1vFzHVTtQyVdIJMc6U2hDBVe8wqCnfwr/Hkq0R4qBgmqyaPSzIxjJ9
         Xr1slRXnvy3YItOg31pHypuA2fqiFL8HZUtgFP5jfVu9oB30TySWqzWeGnHnInC6j2
         NmyRVDFA+u1DAqNSYM9uAncBaOxeJxqW5VGR8HA4=
Received: by mail-qt1-f178.google.com with SMTP id y26so45485228qto.4;
        Wed, 24 Jul 2019 06:40:12 -0700 (PDT)
X-Gm-Message-State: APjAAAXkPQfM+dV73OJA5JlHq+E2FipacxD7pSgVgl91ALVnv1VUaF8+
        gmV9CyGx9lhr7y706yY4m5W5YyKiBK5btZrgJQ==
X-Google-Smtp-Source: APXvYqz8sLIH6MUVejBtheayK4y6FI9z7gtA6QpNEl7sUb8Pwb3fG+kRlf3uBz6GM3u3CxWrCbXWR7M2XCCDu0l0MGk=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr58656327qtc.300.1563975612019;
 Wed, 24 Jul 2019 06:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au> <20190724081313.12934-4-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-4-andrew@aj.id.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 24 Jul 2019 07:40:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEb3QSLAhm9BsFa+A_Jmgr4gDtV2nUCKkgwwQaMLBk9g@mail.gmail.com>
Message-ID: <CAL_JsqLEb3QSLAhm9BsFa+A_Jmgr4gDtV2nUCKkgwwQaMLBk9g@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated compatibles
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 2:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Guide readers away from using the aspeed,g[45].* compatible patterns.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-scu.txt         | 2 --
>  Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt   | 2 --
>  .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml  | 5 +----
>  .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 4 +---
>  4 files changed, 2 insertions(+), 11 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
