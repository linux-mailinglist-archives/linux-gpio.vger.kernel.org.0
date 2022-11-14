Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910406284EA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 17:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbiKNQTC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 11:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbiKNQSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 11:18:43 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04196DFA;
        Mon, 14 Nov 2022 08:18:29 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id B4DAC22C5F;
        Mon, 14 Nov 2022 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1668442707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0tL7xPSD03f3HZ+4HQQQ7sQ5enemmDpf5Sp5cZ89xFw=;
        b=oWvuMqKJhtkNpedSgvnQGk4xFBCkRyJ7Ke9fIutR/Lc7G/sifitPB/TZk+jWmaLllrk9R4
        OKXNLgokyF/Vky+YYw3QVk2SaFT+t0DtJgztAH1VgUhEphielJwf/CWWY2zmJwUoGy6lOR
        /Rr4Dzm154RIXwpqI13iQCAKf+QwqWo=
Received: from suse.cz (unknown [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 559E52C142;
        Mon, 14 Nov 2022 16:18:27 +0000 (UTC)
Date:   Mon, 14 Nov 2022 17:18:26 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
Message-ID: <Y3JqUtLcnGVR7kb6@alley>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
 <Y3Jf7xz2CQjJuEeT@alley>
 <Y3Ji1B+Kar6OSBn3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Ji1B+Kar6OSBn3@smile.fi.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 2022-11-14 17:46:28, Andy Shevchenko wrote:
> On Mon, Nov 14, 2022 at 04:34:07PM +0100, Petr Mladek wrote:
> > On Tue 2022-11-08 16:33:22, Russell King wrote:
> 
> ...
> 
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
> > 
> > > +		break;
> > > +	case 'l':
> > > +		val = orig = le32_to_cpu(orig);
> > > +		break;
> > > +	case 'b':
> > > +		val = orig = be32_to_cpu(orig);
> > > +		break;
> 
> Isn't easy to fix? Something like below?
> 
> 	switch (fmt[2]) {
> 	case 'h':
> 		break;
> 	case 'r':
> 		orig = swab32(orig);
> 		break;
> 	case 'l':
> 		orig = le32_to_cpu(orig);
> 		break;
> 	case 'b':
> 		orig = be32_to_cpu(orig);
> 		break;
> 
> 		...
> 	}
> 	val = orig;

I though the same. Unfortunately, this is not valid for the "case c:"
path where "orig" stays untouched:

	case 'c':
		/* Pixel formats are printed LSB-first */
		val = swab32(orig & ~BIT(31));
		pixel_fmt = true;
		break;

It is pity that "orig" is handled differently for the pixel and the generic
formats.

But I am afraid that there is no good solution. The code will
always be a mess when it tries to implement a messy definition.

It would be nice if the the FourCC format was used consistently
in all subsystems in the first place.


IMPORTANT: This brings the questions.

	   Is there actually a standard how to print the original
	   number in FourCC?

	   Do we really want to modify "orig" in the generic
	   implementation?

Best Regards,
Petr
