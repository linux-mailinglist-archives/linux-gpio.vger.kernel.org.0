Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD951571EF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 21:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZTmZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 15:42:25 -0400
Received: from mail.delivery-170-eu-central-1.prod.hydra.sophos.com ([35.159.27.250]:49982
        "EHLO mail.delivery-170-eu-central-1.prod.hydra.sophos.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726407AbfFZTmZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 15:42:25 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 15:42:23 EDT
Received: from mail.delivery-59-eu-central-1.prod.hydra.sophos.com (ip-172-20-0-142.eu-central-1.compute.internal [172.20.0.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.delivery-170-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id 45YtYs3RYpz1f7
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 19:36:17 +0000 (UTC)
Received: from ip-172-20-0-46.eu-central-1.compute.internal (ip-172-20-0-46.eu-central-1.compute.internal [127.0.0.1])
        by mail.delivery-59-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTP id 45YtYr0kvHzFpVS;
        Wed, 26 Jun 2019 19:36:16 +0000 (UTC)
X-Sophos-Email-ID: d91b1c268f334557ac3a76ff5e120cd6
Received: from smtp.eckelmann.de (smtp.eckelmann.de [217.19.183.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by relay-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 45YtYn64jpzgY8F; Wed, 26 Jun 2019 19:36:13 +0000 (UTC)
Received: from NB041 (2a00:1f08:4007:f0de::1) by EX-SRV2.eckelmann.group
 (2a00:1f08:4007:e035:172:18:35:5) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 21:36:12 +0200
Date:   Wed, 26 Jun 2019 21:36:07 +0200
From:   Thorsten Scherer <thorsten.scherer@eckelmann.de>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: siox: Pass irqchip when adding gpiochip
Message-ID: <20190626193607.GA9834@NB041>
References: <20190625105346.3267-1-linus.walleij@linaro.org>
 <20190625193328.sxvhastsatc62msh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625193328.sxvhastsatc62msh@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [2a00:1f08:4007:f0de::1]
X-ClientProxiedBy: EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5)
 To EX-SRV2.eckelmann.group (2a00:1f08:4007:e035:172:18:35:5)
X-LASED-Pver: 0000002
X-Sophos-Email: [eu-central-1] Antispam-Engine: 3.1.5,
 AntispamData: 2019.6.26.193016
X-LASED-SpamProbabilty: 0.083173
X-LASED-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_2000_2999 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, INVALID_MSGID_NO_FQDN 0.000000,
 IN_REP_TO 0.000000, LEGITIMATE_SIGNS 0.000000, MSG_THREAD 0.000000,
 MULTIPLE_RCPTS 0.100000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, WEBMAIL_SOURCE 0.000000, __ANY_URI 0.000000,
 __BOUNCE_CHALLENGE_SUBJ 0.000000, __BOUNCE_NDR_SUBJ_EXEMPT 0.000000,
 __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __CD 0.000000, __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FORWARDED_MSG 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_XOIP 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __MIME_TEXT_ONLY 0.000000,
 __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000, __MIME_VERSION 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __MULTIPLE_URI_TEXT 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_IN_BODY 0.000000, __URI_NOT_IMG 0.000000, __URI_NO_MAILTO 0.000000,
 __URI_NO_PATH 0.000000, __URI_NS 0.000000, __URI_WITHOUT_PATH 0.000000,
 __USER_AGENT 0.000000
X-LASED-Authed: 1
X-LASED-Spam: NonSpam
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Tue, Jun 25, 2019 at 09:33:28PM +0200, Uwe Kleine-König wrote:
> Hello Linus,
> 
> On Tue, Jun 25, 2019 at 12:53:46PM +0200, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip.
> > 
> > For chained irqchips this is a pretty straight-forward
> > conversion.
> > 
> > The siox GPIO driver passes a IRQ_TYPE_EDGE_RISING as
> > default IRQ trigger type which seems wrong, as consumers
> > should explicitly set this up, so set IRQ_TYPE_NONE instead.
> > 
> > Also gpiochip_remove() was called on the errorpath if
> > gpiochip_add() failed: this is wrong, if the chip failed
> > to add it is not there so it should not be removed.
> 
> So we have a bugfix (gpiochip_remove() in error path), a change of
> default behaviour (IRQ_TYPE_EDGE_RISING -> IRQ_TYPE_NONE) and a cleanup
> for an API change (I'm guessing here) in a single patch. :-|
> 
> @Thorsten: I'm not entirely sure if there is code relying on the default
> IRQ_TYPE_EDGE_RISING. Do you know off-hand?

Didn't know off the top of my head.  So I dug through some application
code.  As far as I can tell, nothing relies on edge rising.  But I would
not bet on it.  And I don't know about code in the other departments.

> 
> Best regards
> Uwe

Best regards
Thorsten

> 
> > diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> > index fb4e318ab028..e5c85dc932e8 100644
> > --- a/drivers/gpio/gpio-siox.c
> > +++ b/drivers/gpio/gpio-siox.c
> > @@ -211,6 +211,7 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
> >  static int gpio_siox_probe(struct siox_device *sdevice)
> >  {
> >  	struct gpio_siox_ddata *ddata;
> > +	struct gpio_irq_chip *girq;
> >  	int ret;
> >  
> >  	ddata = devm_kzalloc(&sdevice->dev, sizeof(*ddata), GFP_KERNEL);
> > @@ -239,20 +240,16 @@ static int gpio_siox_probe(struct siox_device *sdevice)
> >  	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
> >  	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
> >  
> > +	girq = &ddata->gchip.irq;
> > +	girq->chip = &ddata->ichip;
> > +	girq->default_type = IRQ_TYPE_NONE;
> > +	girq->handler = handle_level_irq;
> > +
> >  	ret = gpiochip_add(&ddata->gchip);
> >  	if (ret) {
> >  		dev_err(&sdevice->dev,
> >  			"Failed to register gpio chip (%d)\n", ret);
> > -		goto err_gpiochip;
> > -	}
> > -
> > -	ret = gpiochip_irqchip_add(&ddata->gchip, &ddata->ichip,
> > -				   0, handle_level_irq, IRQ_TYPE_EDGE_RISING);
> > -	if (ret) {
> > -		dev_err(&sdevice->dev,
> > -			"Failed to register irq chip (%d)\n", ret);
> > -err_gpiochip:
> > -		gpiochip_remove(&ddata->gchip);
> > +		return ret;
> >  	}
> >  
> >  	return ret;
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |

-- 
Thorsten Scherer - Eckelmann AG
https://www.eckelmann.de
