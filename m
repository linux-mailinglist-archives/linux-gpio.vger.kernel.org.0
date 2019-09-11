Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFE8AF9D7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 12:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbfIKKEO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 06:04:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46454 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbfIKKEN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:04:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so15922602lfc.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUrALqLYIp3tenV9WPlX+wrIGiFW2sjaAtprRGLAeEM=;
        b=p2jaID0PK0kDp5GpJDQQkIXhcRDJG0tyKs3M8dW00A0nTmYl4XPzPDxiiXVVHMrvt+
         3r7lWYb3E1VbxJKjCFl4T/s7r/GjKdCpMsYFGhPYq40CrLVtcwphRVLlOz4Mi1abAmc6
         gb7WEzvYMYxI1T0Yv1JJQMukj1kqEswd1th8aKqcRAHTLbfy8nsrMproykhpVp2apyq1
         YZAJxHMjH/FKf0pJw40wEhiG4GATCpQy1rgKrv+b1JNb++7VFgOOXTCNwIkKecduNXL3
         gwOiiQuJzd/9zYidBIhoUcbKtFgICCtV1yeLL8Sdtn6e6RFujjx3Wf2pnscLkru96m90
         vHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUrALqLYIp3tenV9WPlX+wrIGiFW2sjaAtprRGLAeEM=;
        b=NZ9qfC/uJRXZQ/OVa1L/KkBv9GZAhX2ahgkyOUk5Fxd7vhntCZc9pr1gtBg2Z/X7+F
         HZw2UXL2k0vNEg6+1WN888jF8zU4pDHvNDFhmiKTPbQ+Pr3LuS1xOE9Waw2DoFi+StPK
         R/PeRqJKQTSXQ94BSvy9n8TKOfcuQo4/3ZIFuxeknU+OpGVk/r3D0YVOrh+sZRB37/ZT
         gZ5aKoRUqBmfeOQ1zvTgm7rUQH4lambVHCIxF6pK+5MJN5i6Scw0PgrZL2DmCGfpqgVS
         2yjB1Jm/9Hwh/H/48GvDJCOaj0ntBWJcg5Dg0LCOcRDc0Xdn+mnDlDY9Gh6cdvgKNjt7
         OZoQ==
X-Gm-Message-State: APjAAAVmMzlx1CY5En4mwsDx/OzYuYuNZSI+CiYitJ5EPd0NNejRlPck
        1IW5uBZqf9uR+4qFckv9dSHbbOmvDHq3LKvM+QR5Mg==
X-Google-Smtp-Source: APXvYqzngoeZ/r34ebfHnHn3MkbXp29HvsnciD2vYxTBkFVS7UiQq+i0mLCv1JJKPJCI91Pa7RHozJe5TicykUeAq+0=
X-Received: by 2002:a19:14f:: with SMTP id 76mr22938921lfb.92.1568196250647;
 Wed, 11 Sep 2019 03:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062547.13264-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062547.13264-1-rashmica.g@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:03:59 +0100
Message-ID: <CACRpkdY1Rk6vPihZkpKC9hya9ixQcqg9PG9rEpM3kSY0kxwsjg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation
 with ast2600 controllers
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 7:25 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
> Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
> the ngpio property to differentiate between these controllers.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

The changes are uncontroversial (uses just standard GPIO
ngpios and adds a compatible) so patch applied.

Yours,
Linus Walleij
