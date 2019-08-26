Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8819CEF0
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 14:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730597AbfHZMFr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 08:05:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:43554 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726962AbfHZMFq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Aug 2019 08:05:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 62E2AAFCC;
        Mon, 26 Aug 2019 12:05:45 +0000 (UTC)
Date:   Mon, 26 Aug 2019 14:05:44 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Message-ID: <20190826120544.ccbtjkgvk3ao4ak6@pathway.suse.cz>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
 <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
 <20190825091442.GA5817@taurus.defre.kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190825091442.GA5817@taurus.defre.kleine-koenig.org>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun 2019-08-25 11:14:42, Uwe Kleine-König  wrote:
> Hello Andrew,
> 
> On Sat, Aug 24, 2019 at 04:58:29PM -0700, Andrew Morton wrote:
> > (cc printk maintainers).
> 
> Ah, I wasn't aware there is something like them. Thanks
> 
> > On Sun, 25 Aug 2019 01:37:23 +0200 Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> > 
> > > 	pr_info("probing failed (%dE)\n", ret);
> > > 
> > > expands to
> > > 
> > > 	probing failed (EIO)
> > > 
> > > if ret holds -EIO (or EIO). This introduces an array of error codes. If
> > > the error code is missing, %dE falls back to %d and so prints the plain
> > > number.

What was the motivation for this patch, please?

Did it look like a good idea?
Did anyone got tired by searching for the error codes many
times a day?
Did the idea came from a developer, support, or user, please?

> 	add/remove: 2/0 grow/shrink: 4/2 up/down: 1488/-8 (1480)
> 	Function                                     old     new   delta
> 	errorcodes                                     -    1200   +1200
> 	errstr                                         -     200    +200
> 	vsnprintf                                    884     960     +76
> 	set_precision                                148     152      +4
> 	resource_string                             1380    1384      +4
> 	flags_string                                 400     404      +4
> 	num_to_str                                   288     284      -4
> 	format_decode                               1024    1020      -4
> 	Total: Before=21686, After=23166, chg +6.82%
> 
> But that doesn't seem to include the size increase for all the added
> strings which seems to be around another 1300 bytes.

This non-trivial increase of the size and the table still
includes only part of the error codes.

The array is long, created by cpu&paste, the index of each code
is not obvious.

There are ideas to make the code even more tricky to reduce
the size, keep it fast.

Both, %dE modifier and the output format (ECODE) is non-standard.

Upper letters gain a lot of attention. But the error code is
only helper information. Also many error codes are misleading because
they are used either wrongly or there was no better available.

There is no proof that this approach would be widely acceptable for
subsystem maintainers. Some might not like mass and "blind" code
changes. Some might not like the output at all.

I am not persuaded that all this is worth it. Also I do not like
the non-standard solution.

Best Regards,
Petr
