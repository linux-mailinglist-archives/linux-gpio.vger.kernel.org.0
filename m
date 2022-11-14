Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B79628403
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 16:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbiKNPeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 10:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiKNPeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 10:34:15 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38244AE63;
        Mon, 14 Nov 2022 07:34:14 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 9C2321FFD1;
        Mon, 14 Nov 2022 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1668440052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iX0twiutIXQvyzjvENfNYeTzi5iV06fn6/uJ3rwwZHQ=;
        b=CSqUQJ08j5/qIt6kMB+TN0dttJya6Uhm0czVdp3AA47iPq4SLqKwE0jAXalRa4kxsrFQiv
        Ue+cwR7I2ZEkuCD6NoN7jvTBC/sog6Tt4IKCxLbydvrfyKmt2pclKFrhOQGYKiVjtT2JW2
        rdKzXoU7xcaRXSO722vtMJPAQeuhPsQ=
Received: from suse.cz (unknown [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id E91DB2C143;
        Mon, 14 Nov 2022 15:34:10 +0000 (UTC)
Date:   Mon, 14 Nov 2022 16:34:07 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
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
Message-ID: <Y3Jf7xz2CQjJuEeT@alley>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 2022-11-08 16:33:22, Russell King wrote:
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
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Petr Mladek <pmladek@suse.com>

See one nit below.

> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1762,27 +1762,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
>  	char output[sizeof("0123 little-endian (0x01234567)")];
>  	char *p = output;
>  	unsigned int i;
> +	bool pixel_fmt = false;
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

I do not like much these multi assignments. I think that the result
was not even defined in some older C standards. Though, I can't find
it now. And even make W=3 does not warn about it.

> +		break;
> +	case 'l':
> +		val = orig = le32_to_cpu(orig);
> +		break;
> +	case 'b':
> +		val = orig = be32_to_cpu(orig);
> +		break;

Best Regards,
Petr
