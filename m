Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658CB1B1213
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2020 18:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDTQn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 12:43:28 -0400
Received: from smtprelay0139.hostedemail.com ([216.40.44.139]:60660 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726023AbgDTQn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Apr 2020 12:43:28 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 2D475182CED5B;
        Mon, 20 Apr 2020 16:43:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:273:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2525:2561:2564:2682:2685:2828:2859:2917:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6691:6737:7903:8985:9025:10004:10400:11232:11473:11658:11914:12043:12048:12297:12740:12760:12895:13069:13161:13198:13229:13311:13357:13439:14096:14097:14181:14659:14721:14764:21080:21627:21740:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: wire71_b275595b508
X-Filterd-Recvd-Size: 2334
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Mon, 20 Apr 2020 16:43:24 +0000 (UTC)
Message-ID: <f54d6f0a6c31ab3911c2b35caef49df340ab1196.camel@perches.com>
Subject: Re: [PATCH v1] pinctrl: fix several typos
From:   Joe Perches <joe@perches.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, geert+renesas@glider.be,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jun.nie@linaro.org,
        stephan@gerhold.net, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 09:41:09 -0700
In-Reply-To: <20200419164956.3484-1-zhengdejin5@gmail.com>
References: <20200419164956.3484-1-zhengdejin5@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2020-04-20 at 00:49 +0800, Dejin Zheng wrote:
> use codespell to fix lots of typos over frontends.
[]
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c b/drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c
[]
> @@ -418,7 +418,7 @@ static const unsigned lcdvsi1_a_1_pins[] = { DB8500_PIN_E2 };
>  static const unsigned lcd_d0_d7_a_1_pins[] = {
>  	DB8500_PIN_G5, DB8500_PIN_G4, DB8500_PIN_H4, DB8500_PIN_H3,
>  	DB8500_PIN_J3, DB8500_PIN_H2, DB8500_PIN_J2, DB8500_PIN_H1 };
> -/* D8 thru D11 often used as TVOUT lines */
> +/* D8 through D11 often used as TVOUT lines */

thru is _really_ common and a generally accepted informal
for through so I suggest this not be changed.

https://www.dictionary.com/browse/thru
preposition, adverb, adjective
an informal, simplified spelling of through.

https://www.merriam-webster.com/dictionary/thru
While never extremely common, tho and thru have a long history of
occasional use as spelling variants of though and through.

Their greatest popularity occurred in the late 19th and early 20th 
centuries, when their adoption was advocated by spelling reformers. 
Their current use occurs chiefly in informal writing (as in personal 
letters) and in some technical journals.

