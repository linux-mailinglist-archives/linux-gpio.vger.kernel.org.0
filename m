Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 950985E002
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfGCIkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 04:40:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45288 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfGCIkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 04:40:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so1437004lje.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
        b=iLSnAFiMtzOcyZkCnNoQdCnKRs/FrQMu9BQk1miyt08q/upQDSxsM5dd/sr+THA+cz
         Ma0puGzE/ZswYwh4FVWRnwkJAgjJiowH28UihrQ5Ew/UvWeQ1X3ci4rGe9jCtXrSXrhu
         VJcSzn2usHUy1hcueneTZAxbX0WIJ/GbSxZcQqCLs5riBu/oyqVMlrHbwbYdGATqrbN6
         XevkFpUuWujEosPpkR/Vjq9lnzSkFDPYZB9dCECqE0OpBr/Bgz2s7iUQBPkcrmFdU3Py
         +LZHudN2XD/KZduddVlkuwmpp3WdxkpwOUshIpl7p6/p7b3bfcWeCi9olwlgW6sw26ku
         wAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9KQGKN1/JTwYz+i5tykBtO8/dfvkSTRXZ7mV96ulxlo=;
        b=propqmSmLpzNkd8tdMhjBKNAzNAwnqf1nz0SJ9+Ncu1gGwn9TYhuBhkRFRJwEmnA5l
         0DeJhovTgOjhZcht5+Hb0/K0NMbggZcnGNiv2pm+pN8fb5qgelGWAaxM9kaaRDezOF+A
         71K2TgWYozh4glRrdCrXKgF9V0+CWZdoQckrhrvfg2LL3TuEBLmG47M4jhz+KxZJ9+uN
         XijBPmwX4/JY9va7wKJNOiDhvS+Cn6+w76h1HTn1xLffm51vCFz4x/5eivBDH3n6TE4f
         UqcKZBZ8uHfd9wAoQplDoppguXpkiwccPY+Raic9MLJ/WFx2ASQzCzjBjcLXXR76UjvL
         L1pA==
X-Gm-Message-State: APjAAAUs2JtNJ8Cu3xhAKgIuz8iUTDj9ZnzDZeeHXL+5Fo+cSw4FChjL
        dGl5SNTRxLllY6aoWPcMtk0QHEq6rLe5Sa4zLDKEb2Km
X-Google-Smtp-Source: APXvYqwjCAdp2pYFgLkejdEEDh9nRCMtaIIni+TVcrXpKnpbZ14+0z+JW8gDE5GUfqGr6bXIV3oih+tOTO8H8yN1rZI=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr20360931ljb.28.1562143213537;
 Wed, 03 Jul 2019 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190628023838.15426-1-andrew@aj.id.au>
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 10:40:02 +0200
Message-ID: <CACRpkdaxiFR3ezt4FzhRxpqc4DYYjsbBeysPUaaQH+_QgYjudw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andrew,

On Fri, Jun 28, 2019 at 4:39 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello!
>
> The ASPEED AST2600 is in the pipeline, and we have enough information to start
> preparing to upstream support for it. This series lays some ground work;
> splitting the bindings and dicing the implementation up a little further to
> facilitate differences between the 2600 and previous SoC generations.
>
> v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
> here:

I have applied this series, I had to strip some changes of the header
because it was based on some SPDX cleanups upstream but no
big deal I think. Check the result please.

Yours,
Linus Walleij
