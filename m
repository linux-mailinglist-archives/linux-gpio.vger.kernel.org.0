Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D37294EE3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 16:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443023AbgJUOjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 10:39:37 -0400
Received: from smtprelay0032.hostedemail.com ([216.40.44.32]:37426 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2442066AbgJUOjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 10:39:37 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 0EF1887066B9;
        Wed, 21 Oct 2020 14:39:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:968:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3770:3865:3866:3867:3868:3872:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:5007:7875:7903:8828:9025:9121:10004:10394:10400:10848:11232:11233:11257:11658:11914:12043:12048:12262:12297:12438:12555:12679:12740:12760:12783:12895:12986:13069:13311:13357:13439:13846:14096:14097:14180:14181:14659:14721:14849:21080:21324:21365:21451:21611:21627:21740:21789:21939:30054:30083:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: joke73_430d3d127249
X-Filterd-Recvd-Size: 2611
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Wed, 21 Oct 2020 14:39:34 +0000 (UTC)
Message-ID: <42c1d07d46655f622c081f45b68ccaffba7361a1.camel@perches.com>
Subject: Re: [PATCH] gpio: bd70528: remove unneeded break
From:   Joe Perches <joe@perches.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "trix@redhat.com" <trix@redhat.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "apw@canonical.com" <apw@canonical.com>
Date:   Wed, 21 Oct 2020 07:39:33 -0700
In-Reply-To: <db6856d5431aac3ff56cd3817312d204c41cf7d0.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
         <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
         <b435953eed76b9247a4b1dab88f268afe76ff470.camel@perches.com>
         <db6856d5431aac3ff56cd3817312d204c41cf7d0.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2020-10-21 at 07:25 +0000, Vaittinen, Matti wrote:
> Hello Joe & All,
> On Tue, 2020-10-20 at 11:36 -0700, Joe Perches wrote:
> > On Tue, 2020-10-20 at 11:48 +0000, Vaittinen, Matti wrote:
[]
> > > And for peeps who have not been following - following function
> > > triggers the checkpatch error above:
> > 
> > Huh?  what version of checkpatch are you using?
> > Send it to me please.
[]
> Please find my version of checkpatch and the patch to trigger the
> warning attached.

Thanks.  This test wasn't particularly useful
(and had some false positives) and was removed by

commit ef3c005c0eb07a60949191bc6ee407d5f43cc502
Author: Joe Perches <joe@perches.com>
Date:   Tue Aug 11 18:35:19 2020 -0700

    checkpatch: remove missing switch/case break test
    
    This test doesn't work well and newer compilers are much better
    at emitting this warning.
    
    Signed-off-by: Joe Perches <joe@perches.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Cc: Cambda Zhu <cambda@linux.alibaba.com>
    Link: http://lkml.kernel.org/r/7e25090c79f6a69d502ab8219863300790192fe2.camel@perches.com
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


