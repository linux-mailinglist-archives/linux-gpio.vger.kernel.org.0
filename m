Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD886285D2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 17:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236958AbiKNQrL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 11:47:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237983AbiKNQqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 11:46:51 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D6A2FC2E;
        Mon, 14 Nov 2022 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=alWvsDEk2ast4MquuTzMfCnex7hE3JeGIqS6LusDl0c=; b=OvNCoOdy4QPkxzrWrzlQEsdgNV
        IOkyFWL5tNj9hbIYkCtlE5b+1M5vHpQW/8Ov2fi7vXAOpcqdarNLBWSvWvKdvDIr/QX4q73+jRcIf
        8GIUJwV/R+bSYqFAaOlWqrvjnj6tY//rU8nxSkHoHXnaoCWyL9POP77DQwHeCoSuDETFVLKAYZwYm
        xoKYaFRlopJfoWF/aL9NazAcP0/ds20rr8+jRpROGOakFpt1ez+BwMuZlTPWvM0lLXokZOmJZvCNG
        Cp/OlsLmdWNEUZ7MgLpqmClu3fnd5wC5Ny1J0i6ZiZNcLAfkiBtC3JHd9i2v8I/kiZ6H0naNZaxCw
        qxoLBaqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35266)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oucbY-000169-1k; Mon, 14 Nov 2022 16:46:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oucbU-0003xd-Jm; Mon, 14 Nov 2022 16:46:36 +0000
Date:   Mon, 14 Nov 2022 16:46:36 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Petr Mladek <pmladek@suse.com>
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
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 2/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y3Jw7PQVzjjaNniF@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
 <Y3Jf7xz2CQjJuEeT@alley>
 <Y3Jptob4bGL9Weel@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Jptob4bGL9Weel@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 04:15:50PM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 14, 2022 at 04:34:07PM +0100, Petr Mladek wrote:
> > >  	orig = get_unaligned(fourcc);
> > > -	val = orig & ~BIT(31);
> > > +	switch (fmt[2]) {
> > > +	case 'h':
> > > +		val = orig;
> > > +		break;
> > > +	case 'r':
> > > +		val = orig = swab32(orig);
> > 
> > I do not like much these multi assignments. I think that the result
> > was not even defined in some older C standards. Though, I can't find
> > it now. And even make W=3 does not warn about it.
> 
> Err.
> 
> It's been supported for decades. I learnt about it back in 1992 when
> I was introduced to C by another experienced C programmer. It's been
> supported in ANSI C compilers. The Norcroft C compiler (which is
> strict ANSI) on Acorn platforms back in the late 1980s/1990s even
> supported it.
> 
> I think you're a bit out of date.

Oh, and it's not like there isn't precedent for doing this in
lib/vsprintf.c:

841a915d20c7 vsprintf: Do not have bprintf dereference pointers

+                                       len = copy = strlen(args);

If you grep lib/, there's many more examples. So, what is in Hectors
patch is in no way any different from lots of other examples already
merged into the kernel code.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
