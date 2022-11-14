Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB736284CD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 17:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbiKNQQM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 11:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiKNQQL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 11:16:11 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0386264CA;
        Mon, 14 Nov 2022 08:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=znnsShYF3xMT+VtpHIRsweTjuKslFaebTs8rKcGhy3I=; b=NGUAJ3PUj4W0JFQSXxGJbcBUQ/
        brGT1l6wHh1sn8UkG+adbRc1r/md9kAuUOyuoiYNhiMF3I9bAj6W/J8sz8zl9iW2n3AyilbK83oj8
        sLiY1dHAeT/yqkV3pDilb7JLyvUm1ifJ7Uo9zzS5neCknjQO163obDLUM1D8yxpLg0HJYnwlYe0mA
        Kh/W/GfeEE7fYcxqJ7mBB9Mg/m2okIiKlpFm7MYsCRTQcLGyRn6uTu9oOYFxjDft1giaLeAm0a543
        1NaB/+pX8T2qz+SUHEUklMrrabJ0L/LfN577N8YG6DVUXzagS06rcTwuxXMFTO3/iESar/IXZVSXC
        SimKFuMQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35264)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ouc7o-00014G-14; Mon, 14 Nov 2022 16:15:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ouc7i-0003wN-OK; Mon, 14 Nov 2022 16:15:50 +0000
Date:   Mon, 14 Nov 2022 16:15:50 +0000
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
Message-ID: <Y3Jptob4bGL9Weel@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
 <Y3Jf7xz2CQjJuEeT@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Jf7xz2CQjJuEeT@alley>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 14, 2022 at 04:34:07PM +0100, Petr Mladek wrote:
> On Tue 2022-11-08 16:33:22, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>
> > 
> > %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> > it's useful to be able to print generic 4-character codes formatted as
> > an integer. Extend it to add format specifiers for printing generic
> > 32-bit FOURCCs with various endian semantics:
> > 
> > %p4ch   Host-endian
> > %p4cl	Little-endian
> > %p4cb	Big-endian
> > %p4cr	Reverse-endian
> > 
> > The endianness determines how bytes are interpreted as a u32, and the
> > FOURCC is then always printed MSByte-first (this is the opposite of
> > V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> > allow printing LSByte-first FOURCCs stored in host endian order
> > (other than the hex form being in character order, not the integer
> > value).
> > 
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> See one nit below.
> 
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1762,27 +1762,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> >  	char output[sizeof("0123 little-endian (0x01234567)")];
> >  	char *p = output;
> >  	unsigned int i;
> > +	bool pixel_fmt = false;
> >  	u32 orig, val;
> >  
> > -	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +	if (fmt[1] != 'c')
> >  		return error_string(buf, end, "(%p4?)", spec);
> >  
> >  	if (check_pointer(&buf, end, fourcc, spec))
> >  		return buf;
> >  
> >  	orig = get_unaligned(fourcc);
> > -	val = orig & ~BIT(31);
> > +	switch (fmt[2]) {
> > +	case 'h':
> > +		val = orig;
> > +		break;
> > +	case 'r':
> > +		val = orig = swab32(orig);
> 
> I do not like much these multi assignments. I think that the result
> was not even defined in some older C standards. Though, I can't find
> it now. And even make W=3 does not warn about it.

Err.

It's been supported for decades. I learnt about it back in 1992 when
I was introduced to C by another experienced C programmer. It's been
supported in ANSI C compilers. The Norcroft C compiler (which is
strict ANSI) on Acorn platforms back in the late 1980s/1990s even
supported it.

I think you're a bit out of date.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
