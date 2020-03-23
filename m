Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87ECE18FCCD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbgCWSii (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:38:38 -0400
Received: from smtprelay0236.hostedemail.com ([216.40.44.236]:55556 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727586AbgCWSih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 14:38:37 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 8EAF5837F253;
        Mon, 23 Mar 2020 18:38:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:5007:6119:6742:7514:7576:7809:7901:7903:8957:9207:10004:10400:10848:11232:11658:11914:12043:12295:12297:12555:12679:12740:12760:12895:13019:13069:13161:13229:13255:13311:13357:13439:13846:14181:14659:14721:14915:21080:21451:21627:21939:30012:30046:30054:30055:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:7,LUA_SUMMARY:none
X-HE-Tag: beef27_67eacf456a42a
X-Filterd-Recvd-Size: 2819
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Mon, 23 Mar 2020 18:38:33 +0000 (UTC)
Message-ID: <de4ee117f047874788ea64c4625c96d40ec0a35e.camel@perches.com>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add Segey Semin to maintainers of
 DW APB GPIO driver
From:   Joe Perches <joe@perches.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-gpio@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org
Date:   Mon, 23 Mar 2020 11:36:45 -0700
In-Reply-To: <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
         <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
         <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2020-03-23 at 21:06 +0300, Sergey.Semin@baikalelectronics.ru
wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Add myself as a co-maintainer of the Synopsis DesignWare APB GPIO driver.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -16084,6 +16084,7 @@ F:	drivers/tty/serial/8250/8250_dw.c
>  
>  SYNOPSYS DESIGNWARE APB GPIO DRIVER
>  M:	Hoan Tran <hoan@os.amperecomputing.com>
> +S:	Serge Semin <fancer.lancer@gmail.com>

nack - S: is not the right line type prefix

You need to use an M: type line not an S:.

The S: line is for subsystem status which should be one of:

	S: *Status*, one of the following:
	   Supported:	Someone is actually paid to look after this.
	   Maintained:	Someone actually looks after it.
	   Odd Fixes:	It has a maintainer but they don't have time to do
			much other than throw the odd patch in. See below..
	   Orphan:	No current maintainer [but maybe you could take the
			role as you write your new code].
	   Obsolete:	Old code. Something tagged obsolete generally means
			it has been replaced by a better system and you
			should be using that.

>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained

like this...

>  F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt



