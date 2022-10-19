Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89F76040D3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 12:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbiJSKXh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 06:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiJSKW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 06:22:59 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E65C8950;
        Wed, 19 Oct 2022 03:02:34 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id CF34633924;
        Wed, 19 Oct 2022 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1666173625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iR8uS4Gx4LUrjoOa7cKkotplZsy+7+DUm7VXca8j8Vk=;
        b=qk52itcPxIK0JYJIi3Lrj54e+dtHIlQeHi6ZYF0FDwxWlMQhelJJNQhmNUS1f86htn1Xka
        3pgdL7jeDWGAv/Xsx519Lwgtk5IQgrsiiCt87uyBNDUZYcXKpnvAr+ZVrDQofc7P5ldqj4
        6qPVodH8VgXZUIZ4NmbL7RdzPT2GDiM=
Received: from suse.cz (unknown [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 3E4AF2C142;
        Wed, 19 Oct 2022 10:00:24 +0000 (UTC)
Date:   Wed, 19 Oct 2022 12:00:23 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y0/Kt9CW5vYcxHhK@alley>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 2022-09-06 14:19:44, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
> 
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -625,6 +625,38 @@ Passed by reference.
>  	%p4cc	Y10  little-endian (0x20303159)
>  	%p4cc	NV12 big-endian (0xb231564e)
>  
> +Generic FourCC code
> +-------------------
> +
> +::
> +	%p4c[hnbl]	gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
> +host, reversed, big or little endian order data respectively. Host endian
> +order means the data is interpreted as a 32-bit integer and the most
> +significant byte is printed first; that is, the character code as printed
> +matches the byte order stored in memory on big-endian systems, and is reversed
> +on little-endian systems.
> +
> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cl	gP00 (0x67503030)
> +	%p4cb	00Pg (0x30305067)
> +	%p4cr	00Pg (0x30305067)

Nit: I would prefer to keep the same order (h,r,b,l) everywhere.

     I guess that you wanted to show exactly the same results next
     to each other. But it is not the case on big-endian anyway.

> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cl	00Pg (0x30305067)
> +	%p4cb	gP00 (0x67503030)
> +	%p4cr	00Pg (0x30305067)

Same here.

> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 3c1853a9d1c0..31707499f90f 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1757,27 +1757,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
>  	char output[sizeof("0123 little-endian (0x01234567)")];
>  	char *p = output;
>  	unsigned int i;
> +	bool pix_fmt = false;

Nit: I would prefer "pixel_fmt". I am not a graphics guy and wondered
     what "pix" did stands for ;-)

>  	u32 orig, val;
>  
> -	if (fmt[1] != 'c' || fmt[2] != 'c')
> +	if (fmt[1] != 'c')
>  		return error_string(buf, end, "(%p4?)", spec);
>  
>  	if (check_pointer(&buf, end, fourcc, spec))
>  		return buf;
>  
>  	orig = get_unaligned(fourcc);
> -	val = orig & ~BIT(31);
> +	switch (fmt[2]) {
> +	case 'h':
> +		val = orig;
> +		break;
> +	case 'r':
> +		val = orig = swab32(orig);
> +		break;
> +	case 'l':
> +		val = orig = le32_to_cpu(orig);
> +		break;
> +	case 'b':
> +		val = orig = be32_to_cpu(orig);
> +		break;
> +	case 'c':
> +		/* Pixel formats are printed LSB-first */
> +		val = swab32(orig & ~BIT(31));
> +		pix_fmt = true;
> +		break;
> +	default:
> +		return error_string(buf, end, "(%p4?)", spec);
> +	}
>  
>  	for (i = 0; i < sizeof(u32); i++) {
> -		unsigned char c = val >> (i * 8);
> +		unsigned char c = val >> ((3 - i) * 8);

This hardcodes '3' but the for-cycle uses i < sizeof(u32).
We should be consistent.

A solution would be:

	int i;

	for (i = sizeof(u32); --i >= 0;) {
		unsigned char c = val >> (i * 8);


>  		/* Print non-control ASCII characters as-is, dot otherwise */
>  		*p++ = isascii(c) && isprint(c) ? c : '.';
>  	}
>  
> -	*p++ = ' ';
> -	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> -	p += strlen(p);
> +	if (pix_fmt) {
> +		*p++ = ' ';
> +		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> +		p += strlen(p);
> +	}
>  
>  	*p++ = ' ';
>  	*p++ = '(';

Best Regards,
Petr
