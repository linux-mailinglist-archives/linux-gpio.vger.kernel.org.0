Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71075622688
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiKIJOs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiKIJOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:14:14 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6FC222B8;
        Wed,  9 Nov 2022 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7FkDY4oj1rMqWjAFX8ryGroL69XLlGkF+Dk3sIIItkc=; b=jS8KQa6iYyl1mZl9jYXbxIE+f1
        yDaxqbKVroPuSxw1V06dCavLSTRANfnZAxIBBNdRZ5m/wofYn4D777ru3VpB9ORNMHRM6A0jITtm+
        2xbh6uA8DrhW0ztoacIrSgAWwTTpFW2fg5iPmJj4kFK4zFsXcfvqrg3jKEBb+Mz/D4bqIGKoHOdN+
        PY79dV+qctzz6Qt2LNCY4+pzFokF4QLLJHVaupTrJ5pFu+NQpmt0CoIr4acGmhoAejb3ttpE6o/J4
        BMfDym3GeSAV4cM/KmhuouWiqRhUG1jugfqrVTw+XFl2wXbcjgJZnHdH4/NShTUhJU0yNr3+oowpZ
        Uh1pkkGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35188)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1osh8A-0004Gg-2W; Wed, 09 Nov 2022 09:12:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1osh82-0005b1-Jp; Wed, 09 Nov 2022 09:12:14 +0000
Date:   Wed, 9 Nov 2022 09:12:14 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Y2tu7ptiYXwB2D79@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
 <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
 <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
 <aa665829-82db-74de-d802-e01fd52c998d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa665829-82db-74de-d802-e01fd52c998d@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 09:36:12AM +0100, Krzysztof Kozlowski wrote:
> On 08/11/2022 23:09, Russell King (Oracle) wrote:
> > On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
> >> On 08/11/2022 17:33, Russell King (Oracle) wrote:
> >>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> >>>
> >>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >>> ---
> >>>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
> >>>  1 file changed, 37 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> >>> new file mode 100644
> >>> index 000000000000..1a415b78760b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> >>> @@ -0,0 +1,37 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> >>
> >> Does not look like you tested the bindings. Please run `make
> >> dt_binding_check` (see
> >> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> > 
> > Oh ffs. DT bindings are utterly impossible to get correct.
> 
> Why? You write, you test and then you see the error. Srsly...

It's utterly impossible for me to remember the dependencies. It's
utterly impossible for me to remember the make incantation to test
this bloody things - especially as I need to limit it otherwise it
takes a very long time to test.

The whole bloody thing is just too sodding difficult.

I'm not going to bother with this patch set any more. Too frustrated
with this piecemeal approach and the crappy slow tooling and the
idiotic incomprehensible error messages it spits out.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
