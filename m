Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DCC1BD175
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 02:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgD2A55 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 20:57:57 -0400
Received: from smtprelay0186.hostedemail.com ([216.40.44.186]:37892 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726274AbgD2A55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 20:57:57 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id CA2BE180188D0;
        Wed, 29 Apr 2020 00:57:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:421:599:800:960:966:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2110:2194:2196:2199:2200:2393:2553:2559:2562:2692:2828:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3872:3873:3874:4184:4250:4321:4385:4605:4823:5007:6248:7903:8694:10004:10400:10450:10455:10848:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13161:13229:13439:13618:14093:14096:14097:14180:14181:14659:14721:19904:19999:21060:21080:21324:21433:21627:21990:30054:30079:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: swim79_7f4e863aa8e34
X-Filterd-Recvd-Size: 4026
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Wed, 29 Apr 2020 00:57:54 +0000 (UTC)
Message-ID: <bc5c8165908facbb4781b2f29903dfacdf625e83.camel@perches.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just
 "unsigned"
From:   Joe Perches <joe@perches.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 28 Apr 2020 17:57:53 -0700
In-Reply-To: <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com>
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
         <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
         <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
         <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2020-04-28 at 17:50 -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 28, 2020 at 5:38 PM Joe Perches <joe@perches.com> wrote:
> > On Tue, 2020-04-28 at 17:23 -0700, Douglas Anderson wrote:
> > > When I copied the function prototypes from the GPIO header file into
> > > my own driver, checkpatch yelled at me saying that I shouldn't use use
> > > "unsigned" but instead should say "unsigned int".  Let's make the
> > > header file use "unsigned int" so others who copy like I did won't get
> > > yelled at.
> > 
> > There are a few other unsigned declarations in the file.
> 
> There are?  I swear I looked for them before I sent my patch and I
> couldn't find them.  Then I looked again upon seeing your reply and I
> still can't find them.  My eyes are bad, though.  Maybe you can give
> me specifics?

$ git grep -P -n '\bunsigned\s+(?!int|long)' include/linux/gpio/driver.h
include/linux/gpio/driver.h:352:                                                unsigned offset);
include/linux/gpio/driver.h:354:                                                unsigned offset);
include/linux/gpio/driver.h:356:                                                unsigned offset);
include/linux/gpio/driver.h:358:                                                unsigned offset);
include/linux/gpio/driver.h:360:                                                unsigned offset, int value);
include/linux/gpio/driver.h:362:                                                unsigned offset);
include/linux/gpio/driver.h:367:                                                unsigned offset, int value);
include/linux/gpio/driver.h:372:                                              unsigned offset,
include/linux/gpio/driver.h:375:                                                unsigned offset);
include/linux/gpio/driver.h:462:                        unsigned offset);
include/linux/gpio/driver.h:660:int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
include/linux/gpio/driver.h:661:void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
include/linux/gpio/driver.h:662:int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,

> > Maybe do all of them (and remove the unnecessary externs)?
> 
> You mean just remove the word "extern" everywhere in this file?  Sure,
> I can if you want.

Up to the actual maintainers I suppose.
There are only a few extern function declarations.
Most do not use extern.

> > trivial reformatting of the function pointer block too
> 
> Wow, I must be totally out of it.  Maybe it's the gin and tonic I just
> had.  I don't understand this comment either.  Can you clarify?

	int				(*foo)(...,
				               ...);

might be better with fewer tabs between return type and function pointer

	int		(*foo)(..., ...);

cheers, oe

