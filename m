Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88866633F40
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 15:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbiKVOt4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 09:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiKVOtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 09:49:51 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74A96BDF3;
        Tue, 22 Nov 2022 06:49:46 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 7D40A21BE4;
        Tue, 22 Nov 2022 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1669128585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j9AuGuLYTdJN+k3uXzcchb8mQnKbhGw+TLUgV+tqJrU=;
        b=MEQS0+y9gcppN8qOpnYaqU7svgu2b3vPgGRXci1z6NL61cL4i98zh4U8k84lKJCd/gXFRo
        Yn4RT0BvfG/CQMNRq0mzn65SnyEDIOv0RYOvo1nC+Uhzpjf3f12g+C8FW74uxEvRhF8K98
        wR702WHORWcWBEPCtw7JhNzXykfXhKY=
Received: from suse.cz (unknown [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 6EEC42C142;
        Tue, 22 Nov 2022 14:49:44 +0000 (UTC)
Date:   Tue, 22 Nov 2022 15:49:40 +0100
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
Message-ID: <Y3zhhLoqAOaZ7rMz@alley>
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
> ---
>  Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
>  lib/test_printf.c                         | 39 +++++++++++++++++++----
>  lib/vsprintf.c                            | 35 ++++++++++++++++----
>  3 files changed, 93 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index dbe1aacc79d0..92a488884cf8 100644
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
> +	%p4c[hrbl]	gP00 (0x67503030)
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

I though a bit more about the semantic and got a bit confused.
It might be because I am not familiar with FourCC. Anyway,
the description in the commit message provided some more clues.

The following documentation looks be more clear to me:

<proposal>
Generic FourCC code
-------------------

::
	%p4c[hrbl]	gP00 (0x67503030)

Print a generic FourCC code, as both ASCII characters and its numerical
value as hexadecimal.

The generic FourCC code is always printed in the the big-endian format,
the most significant byte first. This is the opposite of V4L/DRM
FOURCCs.

The additional ``h``, ``r``, ``b``, and ``l`` specifiers define what
endianes is used to load the stored value as 32-bit integer. The value
might be stored as host-endian, reverse-host-endian, big-endian,
or little endian.

Examples for a little-endian machine, host native load &(u32)0x67503030::

	%p4ch	gP00 (0x67503030)
	%p4cr	00Pg (0x30305067)
	%p4cb	00Pg (0x30305067)
	%p4cl	gP00 (0x67503030)

Examples for a big-endian machine, host native load &(u32)0x67503030::

	%p4ch	gP00 (0x67503030)
	%p4cr	00Pg (0x30305067)
	%p4cb	gP00 (0x67503030)
	%p4cl	00Pg (0x30305067)
</proposal>

Best Regards,
Petr
