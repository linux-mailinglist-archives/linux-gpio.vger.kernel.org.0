Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C8BFAC32
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 09:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfKMIqs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 03:46:48 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38758 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfKMIqs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 03:46:48 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so1247172lfa.5;
        Wed, 13 Nov 2019 00:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=W3tx9vTcRy8ZJ0agDP289YKSWdvALbninjws1EFtXz4=;
        b=OZeGXd/7D+NEOw7+O/VOQ3izsgqYzg+LYQjAJvoYpoYim4nLj8FPb0UuqdQNeC/y9M
         TujCE3mLi5BYY5tDKvRigetNAp8piHBSCWJ3aC6mT4Ek27DLQ5gDy/XdLjHhdLKHkfkP
         Wv7IiB0DUj95dXl2O3lwYSCmDZfltwTKIDWVVYoeBQRRUDmrhRd5575dO7m03YIr5Axd
         RRFxUtJE5HDzMtbcs/CaxiOOk4zlzs2yFIBtCjRaLB1q2l8haPMC2H4o8PQ7hvygpFAB
         UpPN31/QdgIhFqD946RlEFPCREDWqY+iMdhHvgYCBR1IKQPivsobwGZwhPf6R6ec9+XO
         QRjg==
X-Gm-Message-State: APjAAAUoWKuuGbZ5W5XxMwGvIWPYVC/m1PHqV8Vkonz+w2c93HDJfDkh
        eH+A/m62rlWASChvmcmgm24=
X-Google-Smtp-Source: APXvYqzDo3RRDc/L+ac2pf0TnNoACT/NaQN97wtt5KkBBc107dV3OctDPavVkgKPOnh+rRtiec+KFg==
X-Received: by 2002:a19:8092:: with SMTP id b140mr1789808lfd.13.1573634804848;
        Wed, 13 Nov 2019 00:46:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y75sm689653lff.58.2019.11.13.00.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 00:46:43 -0800 (PST)
Date:   Wed, 13 Nov 2019 10:46:37 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "thorsten.scherer@eckelmann.de" <thorsten.scherer@eckelmann.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Message-ID: <20191113084637.GA23872@localhost.localdomain>
References: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
 <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
 <20191111072715.GB4117@ws067.eckelmann.group>
 <e38b59d9c8bcf81bbd49fed2d9d17350d4dc4866.camel@fi.rohmeurope.com>
 <20191111104252.5ixcb2tpnj6n5e6t@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191111104252.5ixcb2tpnj6n5e6t@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 11, 2019 at 11:42:52AM +0100, Uwe Kleine-König wrote:
> Hello Matti,
> 
> On Mon, Nov 11, 2019 at 07:43:50AM +0000, Vaittinen, Matti wrote:
> > On Mon, 2019-11-11 at 08:27 +0100, Thorsten Scherer wrote:
> > > Hello,
> > > 
> > > On Tue, Nov 05, 2019 at 12:30:58PM +0200, Matti Vaittinen wrote:
> > > > It's hard for occasional GPIO code reader/writer to know if values
> > > > 0/1
> > > > equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> > > > GPIO_LINE_DIRECTION_OUT to help them out.
> > > > 
> > > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > 
> > > for SIOX gpio:
> > > 
> > > Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>
> > > 
> > > > Patches are compile-tested only. I have no HW to really test
> > > > them.  Thus
> > > > I'd appreciate carefull review. This work is mainly about
> > > > converting
> > > > zeros and ones to the new defines but it wouldn't be first time I
> > > > get it wrong in one of the patches
> > > > :)                                                   
> > > 
> > > Applied the patch(es) and tested them with SIOX device
> > > 
> > > Tested-by: Thorsten Scherer <t.scherer@eckelmann.de>
> > 
> > Big thanks! It's _really_ nice that someone takes the time to do the
> > testing! Highly appreciated! :]
> 
> without wanting to devalue Thorsten's testing, I think testing your
> series can be trivially done without a runtime check as your patches
> won't change the compiled result. So just compile once without the patch
> and once with and compare the results. If they are bit-by-bit identical
> everything is fine.

Right again Uwe. This is correct for most of the modules - assuming
there's no __LINE__ or time related macros used. Few of the modules did
get actual changes though.

Br,
	Matti

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
