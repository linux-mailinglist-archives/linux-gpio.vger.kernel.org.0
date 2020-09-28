Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F173727B161
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 18:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgI1QGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 12:06:40 -0400
Received: from smtprelay0062.hostedemail.com ([216.40.44.62]:41254 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726551AbgI1QGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 12:06:40 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id EA4BF8383102;
        Mon, 28 Sep 2020 16:06:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:965:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:4321:4385:4390:4395:5007:6119:7576:8660:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13018:13019:13069:13148:13230:13311:13357:13439:14181:14659:14721:21080:21220:21451:21611:21627:21939:30054:30060:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: coast39_3a00add27182
X-Filterd-Recvd-Size: 2060
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Mon, 28 Sep 2020 16:06:37 +0000 (UTC)
Message-ID: <12317bbc7712d96be8f52a3bf574e47628830191.camel@perches.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
From:   Joe Perches <joe@perches.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 28 Sep 2020 09:06:34 -0700
In-Reply-To: <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
         <20200928104155.7385-2-brgl@bgdev.pl>
         <2fcfd81f62ec87d9b75cca32468d8b9583faec47.camel@perches.com>
         <CAMRc=Mds0ccYBhRJnCQ0NEPkUpWRGtyX4FKj4+4rxN27_gfobA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2020-09-28 at 18:02 +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 5:59 PM Joe Perches <joe@perches.com> wrote:
> > On Mon, 2020-09-28 at 12:41 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > 
> > > There's a common pattern of dynamically allocating an array of char
> > > pointers and then also dynamically allocating each string in this
> > > array. Provide a helper for freeing such a string array with one call.
> > 
> > Isn't this also common for things like ring buffers?
> > Why limit this to char *[]?
> > 
> 
> I don't want to add APIs nobody is using. What do you suggest?

Change the argument to void** and call it

void kfree_array(void **array, int count);




