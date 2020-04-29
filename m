Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F911BD24B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 04:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgD2Ccw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 22:32:52 -0400
Received: from smtprelay0004.hostedemail.com ([216.40.44.4]:44880 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2Ccw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 22:32:52 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 20E12180A7351;
        Wed, 29 Apr 2020 02:32:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:966:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2110:2194:2196:2199:2200:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3872:3873:3874:4184:4321:4385:4605:5007:6691:7903:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12663:12740:12760:12895:13069:13311:13357:13439:14096:14097:14180:14181:14659:14721:21060:21080:21433:21627:21990:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cause42_52f75aad21c32
X-Filterd-Recvd-Size: 3266
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Wed, 29 Apr 2020 02:32:50 +0000 (UTC)
Message-ID: <8e225a3166998c441049e9561703f357919d5499.camel@perches.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just
 "unsigned"
From:   Joe Perches <joe@perches.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 28 Apr 2020 19:32:48 -0700
In-Reply-To: <CAD=FV=VtUEgwwB6C4GhTKx3TP37=i4shtwbG41r=wkELcpNmyQ@mail.gmail.com>
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
         <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
         <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
         <CAD=FV=Us6LyfgeXvxnqq+KhHN1djok1y+W_xzSb-KGFy2wgEMg@mail.gmail.com>
         <bc5c8165908facbb4781b2f29903dfacdf625e83.camel@perches.com>
         <CAD=FV=VtUEgwwB6C4GhTKx3TP37=i4shtwbG41r=wkELcpNmyQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2020-04-28 at 18:04 -0700, Doug Anderson wrote:
> Hi,

<slurring but replying with hi again...>

> On Tue, Apr 28, 2020 at 5:57 PM Joe Perches <joe@perches.com> wrote:
> > On Tue, 2020-04-28 at 17:50 -0700, Doug Anderson wrote:
> > > $ git grep -P -n '\bunsigned\s+(?!int|long)' include/linux/gpio/driver.h
> > include/linux/gpio/driver.h:352:                                                unsigned offset);
> > include/linux/gpio/driver.h:354:                                                unsigned offset);
> > include/linux/gpio/driver.h:356:                                                unsigned offset);
> > include/linux/gpio/driver.h:358:                                                unsigned offset);
> > include/linux/gpio/driver.h:360:                                                unsigned offset, int value);
> > include/linux/gpio/driver.h:362:                                                unsigned offset);
> > include/linux/gpio/driver.h:367:                                                unsigned offset, int value);
> > include/linux/gpio/driver.h:372:                                              unsigned offset,
> > include/linux/gpio/driver.h:375:                                                unsigned offset);
> > include/linux/gpio/driver.h:462:                        unsigned offset);
> > include/linux/gpio/driver.h:660:int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
> > include/linux/gpio/driver.h:661:void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
> > include/linux/gpio/driver.h:662:int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
> 
> ...riiiiiggght.   ...and now I run your sed script _after_ my patch
> and I get no hits.  ...so I'm still confused about what you want me to
> do that's not already done in my patch.

So you did say it's the g&t.
It seems I only looked at the first diff block.

cheers, <hck>, Joe

