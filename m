Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61008294232
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Oct 2020 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437511AbgJTSgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Oct 2020 14:36:33 -0400
Received: from smtprelay0085.hostedemail.com ([216.40.44.85]:59712 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437509AbgJTSgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Oct 2020 14:36:33 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 9B9FD100E7B50;
        Tue, 20 Oct 2020 18:36:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1434:1437:1515:1516:1518:1535:1543:1593:1594:1605:1711:1730:1747:1777:1792:2194:2198:2199:2200:2393:2553:2559:2562:2828:2911:2917:3138:3139:3140:3141:3142:3421:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:4361:4425:4605:5007:6119:7576:7875:7903:7974:8660:8957:9108:10004:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12297:12438:12555:12663:12740:12760:12895:13148:13230:13439:14096:14097:14181:14659:14721:21080:21433:21451:21627:21819:21939:21990:30022:30054:30083:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: cake78_5b17a9b27241
X-Filterd-Recvd-Size: 5026
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Tue, 20 Oct 2020 18:36:30 +0000 (UTC)
Message-ID: <b435953eed76b9247a4b1dab88f268afe76ff470.camel@perches.com>
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
Date:   Tue, 20 Oct 2020 11:36:28 -0700
In-Reply-To: <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
References: <20201019193353.13066-1-trix@redhat.com>
         <5b13773306265f89366b86afba71d2b4a4130e2b.camel@fi.rohmeurope.com>
         <0738b0cc482cfd07400cf8b0b0b2092e671cfb34.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2020-10-20 at 11:48 +0000, Vaittinen, Matti wrote:
> On Tue, 2020-10-20 at 13:07 +0300, Matti Vaittinen wrote:
> > Thanks Tom,
> > 
> > On Mon, 2020-10-19 at 12:33 -0700, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > A break is not needed if it is preceded by a return
> > > 
> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > ---
> > >  drivers/gpio/gpio-bd70528.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-
> > > bd70528.c
> > > index 45b3da8da336..931e5765fe92 100644
> > > --- a/drivers/gpio/gpio-bd70528.c
> > > +++ b/drivers/gpio/gpio-bd70528.c
> > > @@ -71,17 +71,14 @@ static int bd70528_gpio_set_config(struct
> > > gpio_chip *chip, unsigned int offset,
> > >  					  GPIO_OUT_REG(offset),
> > >  					  BD70528_GPIO_DRIVE_MASK,
> > >  					  BD70528_GPIO_OPEN_DRAIN);
> > > -		break;
> > My personal taste is also to omit these breaks but I am pretty sure I
> > saw some tooling issuing a warning about falling through the switch-
> > case back when I wrote this. Most probably checkpatch didn't like
> > that
> > back then.
> 
> I did a test and removed the breaks. Then I copied the modified file to
> drivers/gpio/dummy.c
> Next I committed this dummy.c in git, ran git-format-patch -s and
> finally ran the checkpatch on this... Following was produced:
> 
> 
> [mvaittin@localhost linux]$ scripts/checkpatch.pl 0001-gpio-add-
> dummy.patch 
> Traceback (most recent call last):
>   File "scripts/spdxcheck.py", line 6, in <module>
>     from ply import lex, yacc
> ImportError: No module named ply
> WARNING: added, moved or deleted file(s), does MAINTAINERS need
> updating?
> #15: 
> new file mode 100644
> 
> WARNING: Possible switch case/default not preceded by break or
> fallthrough comment
> #91: FILE: drivers/gpio/dummy.c:72:
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> 
> WARNING: Possible switch case/default not preceded by break or
> fallthrough comment
> #96: FILE: drivers/gpio/dummy.c:77:
> +	case PIN_CONFIG_INPUT_DEBOUNCE:
> 
> total: 0 errors, 3 warnings, 229 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-
> inplace.
> 
> 0001-gpio-add-dummy.patch has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> I guess that explains the odd "fallthrough" comments you mentioned in
> another email. I guess the checkpatch should be fixed before you put
> too much effort in clean-up...
> 
> 
> And for peeps who have not been following - following function triggers
> the checkpatch error above:

Huh?  what version of checkpatch are you using?
Send it to me please.

> static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int
> offset,
> 				   unsigned long config)
> {
> 	struct bd70528_gpio *bdgpio = gpiochip_get_data(chip);
> 
> 	switch (pinconf_to_config_param(config)) {
> 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> 		return regmap_update_bits(bdgpio->chip.regmap,
> 					  GPIO_OUT_REG(offset),
> 					  BD70528_GPIO_DRIVE_MASK,
> 					  BD70528_GPIO_OPEN_DRAIN);
> 	case PIN_CONFIG_DRIVE_PUSH_PULL:
> 		return regmap_update_bits(bdgpio->chip.regmap,
> 					  GPIO_OUT_REG(offset),
> 					  BD70528_GPIO_DRIVE_MASK,
> 					  BD70528_GPIO_PUSH_PULL);
> 	case PIN_CONFIG_INPUT_DEBOUNCE:
> 		return bd70528_set_debounce(bdgpio, offset,
> 					    pinconf_to_config_argument(
> config));
> 	default:
> 		break;
> 	}
> 	return -ENOTSUPP;
> }
> 
> 
> Best Regards
> 	Matti Vaittinen
> 

