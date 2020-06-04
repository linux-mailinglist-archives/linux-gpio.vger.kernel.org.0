Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08811EE135
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 11:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgFDJZV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 05:25:21 -0400
Received: from smtprelay0206.hostedemail.com ([216.40.44.206]:50826 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726444AbgFDJZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 05:25:21 -0400
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jun 2020 05:25:20 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id E1D56182D351B
        for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2020 09:17:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 7FBE8837F27E;
        Thu,  4 Jun 2020 09:17:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:968:973:979:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2693:2828:2911:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:3870:3871:3872:3874:4250:4321:4383:4425:5007:6119:6755:7903:10004:10400:10848:11026:11218:11232:11658:11914:12043:12219:12297:12438:12555:12740:12760:12895:13149:13230:13255:13439:14093:14097:14181:14659:14721:21080:21324:21450:21451:21627:30054:30074:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: lock32_040a1d426d96
X-Filterd-Recvd-Size: 3759
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jun 2020 09:17:36 +0000 (UTC)
Message-ID: <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Date:   Thu, 04 Jun 2020 02:17:35 -0700
In-Reply-To: <20200604083120.GF22511@kadam>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
         <87h7vvb1s3.fsf@belgarion.home>
         <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
         <20200601183102.GS30374@kadam>
         <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
         <20200604083120.GF22511@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2020-06-04 at 11:31 +0300, Dan Carpenter wrote:
> On Thu, Jun 04, 2020 at 12:08:49AM +0200, Linus Walleij wrote:
[]
> > Fixes means it fixes something that was wrong in that commit.
> > That's all. Whether syntactic or semantic or regression or
> > serious or not does not matter. It is also not compulsory to
> > add it is just helpful.
> 
> Fixes tag should be compulsory for actual bug fixes.  We had a the
> Bad Binder exploit last year because commit f5cb779ba163
> ("ANDROID: binder: remove waitqueue when thread exits.") had no Fixes
> tag and wasn't backported to Android kernels.

Fixes tags IMO should be exclusively for actual bug fixes
and should be mandatory.

Perhaps:
---
 Documentation/process/submitting-patches.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1699b7f8e63a..285a84ae79de 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -636,12 +636,14 @@ idea was not posted in a public forum. That said, if we diligently credit our
 idea reporters, they will, hopefully, be inspired to help us again in the
 future.
 
-A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
-is used to make it easy to determine where a bug originated, which can help
-review a bug fix. This tag also assists the stable kernel team in determining
-which stable kernel versions should receive your fix. This is the preferred
-method for indicating a bug fixed by the patch. See :ref:`describe_changes`
-for more details.
+A Fixes: tag indicates that the patch fixes a "bug". i.e.: a logic defect or
+regression in a previous commit.  A Fixes: tag should not be used to indicate
+that a previous commit had some trivial defect in spelling in the commit log or
+some whitespace defect.  The Fixes: tag is used to make it easy to determine
+where a bug originated, which can help review a bug fix. The Fixes: tag also
+assists the stable kernel team in determining which stable kernel versions
+should receive your fix. This is the preferred method for indicating a bug is
+fixed by the patch.  See :ref:`describe_changes` for more details.
 
 .. _the_canonical_patch_format:
 

