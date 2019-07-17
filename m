Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC36B913
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 11:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfGQJQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 05:16:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33044 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGQJQZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 05:16:25 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so22889638ljg.0;
        Wed, 17 Jul 2019 02:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rPah5Qpv5P0JRwz088t4Ysl3stEYDPS6P+J+WjV7Sf4=;
        b=GN12OzSbEqkvl8H4gTw+/y0fraiRutEjxuekhhpuPy4G/YvxE93ztxKWuLhvUm5h3t
         IS+/xizzRzHNl1SmOBTpK9bq0Jg9A+95vej8amq4DFxd6C67D4RLzoaVq1wbD2HM+kdP
         aSJ0bsftBtZi97s+1CxoDGHvupsNSIvSHqlNLz4TKGElkXvGPIVFMOnie2t/S0mj5aBu
         aDYPH67ex5+cAHMitm+WRXm0b9XEG+x8djVsy/C0/K0hgwr57Ks87l+KRSVjG4SLxkDf
         F16wNdi/U2j6oH0+UTgoT3sYIiYhK5wwbHmL73ZoW0GHoafN8w8VDgU+HdUioYNivEnO
         XlxQ==
X-Gm-Message-State: APjAAAVeaNvvNpKK1skjExrFUbcKBlA0ukTLKVkE43wSiAIfo37DAkbJ
        BXYHPKw1qlS72bdE/lBGYyM=
X-Google-Smtp-Source: APXvYqzxDjM6kiTgHolhJTGqH1ygByQkQ7SS/tOO9TW4F/owWJscMGcGhNgkD2g8HwgS7ftZ+rmMuw==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr19583499lja.238.1563354983092;
        Wed, 17 Jul 2019 02:16:23 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j3sm3344403lfp.34.2019.07.17.02.16.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 02:16:21 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hng2v-0003l5-9H; Wed, 17 Jul 2019 11:16:22 +0200
Date:   Wed, 17 Jul 2019 11:16:21 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>,
        Johan Hovold <johan@kernel.org>,
        Vincent Cuissard <cuissard@marvell.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com,
        Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: WARNING in gpio_to_desc
Message-ID: <20190717091621.GC16694@localhost>
References: <000000000000a55d7d058d51ad4f@google.com>
 <CACRpkdYbuJ_yJ+UKtvWrkmBCbQzfk-1mn1-A836dkNMrmTtZow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYbuJ_yJ+UKtvWrkmBCbQzfk-1mn1-A836dkNMrmTtZow@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 16, 2019 at 11:52:19PM +0200, Linus Walleij wrote:
> On Wed, Jul 10, 2019 at 1:07 PM syzbot
> <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com> wrote:
> 
> > HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> (...)
> >   __gpio_set_value include/asm-generic/gpio.h:104 [inline]
> >   gpio_set_value include/linux/gpio.h:71 [inline]
> >   nfcmrvl_chip_halt+0x4e/0x70 drivers/nfc/nfcmrvl/main.c:259
> >   nfcmrvl_nci_register_dev+0x2d4/0x378 drivers/nfc/nfcmrvl/main.c:176
> >   nfcmrvl_probe+0x4e9/0x5e0 drivers/nfc/nfcmrvl/usb.c:344
> 
> This bug is somewhere in the drivers/nfc/nfcmrvl* code handling
> GPIOs.

Right, and it's my bug.

> It should be converted to GPIO descriptors and fixed up, see
> drivers/gpio/TODO for details on how to do this.

Conversion will have to wait, let's fix the regression first. :)

> Johan/Vincent, tell me if you want me to forward the full fuzzing
> robot crash dump.

No need, thanks. I got it the report.

Something like the below compiles and should fix it. Vacation starts
today so I'll revisit and send a proper patch in a couple of weeks.

Perhaps someone can feed it to the bot meanwhile (no time to play with
it right now).

Note that this issue has been there since 4.12, so guess no one uses
these devices...

Johan


From e9d9d0ef5ffd6b306cffb2f4e2514f503aa626a5 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Wed, 17 Jul 2019 11:07:13 +0200
Subject: [PATCH] NFC: nfcmrvl: fix gpio-handling regression

FIXME

Fixes: e33a3f84f88f ("NFC: nfcmrvl: allow gpio 0 for reset signalling")
Not-Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/nfc/nfcmrvl/main.c | 4 ++--
 drivers/nfc/nfcmrvl/usb.c  | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index e65d027b91fa..529be35ac178 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -244,7 +244,7 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 	/* Reset possible fault of previous session */
 	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
 
-	if (priv->config.reset_n_io) {
+	if (gpio_is_valid(priv->config.reset_n_io)) {
 		nfc_info(priv->dev, "reset the chip\n");
 		gpio_set_value(priv->config.reset_n_io, 0);
 		usleep_range(5000, 10000);
@@ -255,7 +255,7 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 
 void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
 {
-	if (priv->config.reset_n_io)
+	if (gpio_is_valid(priv->config.reset_n_io))
 		gpio_set_value(priv->config.reset_n_io, 0);
 }
 
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 945cc903d8f1..888e298f610b 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -305,6 +305,7 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 
 	/* No configuration for USB */
 	memset(&config, 0, sizeof(config));
+	config.reset_n_io = -EINVAL;
 
 	nfc_info(&udev->dev, "intf %p id %p\n", intf, id);
 
-- 
2.22.0

