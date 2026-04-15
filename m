Return-Path: <linux-gpio+bounces-35165-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFLBNedz32mFTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35165-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:17:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A42A403ABA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F216304E276
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C811437BE6C;
	Wed, 15 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="miKOb32Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED21537AA78
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251777; cv=none; b=tlxP4GZMUz4urKm4Wu9HxoI5Xsjkfs4XqEkNHAcRDGVQEL+R+kFHIpSTgqzhT2yGFVdIZSzc7+zUuog9QLPGh+Eo4nkmgpIlj2BbQ1ojod8YPAPHiwJz8pd9qC7akZBtDdmUt3tA57u269swQeLvriRhhbHb2in0jp0SYtDTPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251777; c=relaxed/simple;
	bh=H2x1lln5ugRuhbvN9TZ84Wo/S7v5rtbx5oU4HY5nFIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X1efIUsyOWWOaVaYfqT5tbMSqSahtHK/eOCklafmg+1JJvqqHh8YNRnDBiX6IlViWwNHZE0gcvnrg7aJOz3+8INxqa3LQqOaG3A5vd6bTS6ox6XFfwCZanLFTy5+39wjak38YwQi5VdhLNMF82ROPHuKk5y8r9AW5UsMpPiEw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=miKOb32Y; arc=none smtp.client-ip=83.166.143.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fwdqr3HzgzxMX;
	Wed, 15 Apr 2026 13:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1776251768;
	bh=0lVK8Rm2lzilyfbtzFHxL8+WN33t4Abpn2Ws9XDUDb8=;
	h=From:Subject:Date:To:Cc:From;
	b=miKOb32YgKIwEKFd7U+z/LpG0mhkJZNOpA4AR5o3mekxVRzgh4v1R45RwY1o/A0HG
	 b31MIh8RYCK9rMJav0UjKmQD9o35zxETqf7chWsrjxtdeNJ2TLBjADWKp2N3norMmU
	 CEV0bnsbgbPwkZNQe/fESng1ivNA55h0szZ4Xkv1CWO9bB3iQLU4obkQnvBKPVRZcU
	 irNwqkCTDQ7uAh6b33K977/zw8hqecvoT2ZqoVFAwOheU5tdhRHbRdqZPrnDnQT6+Q
	 VQ11nHvvMM3InVW6M4F6DJTt89tMzVOSf5yweGWBdDm/HBlFN0HRUfyBUYvGjosWeb
	 7tZXm02/ca1yg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fwdqq02pRzv9G;
	Wed, 15 Apr 2026 13:16:06 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 6.12.y 0/2] gpiolib: backport fa17f749ee5b and a7ac22d53d09
Date: Wed, 15 Apr 2026 13:15:39 +0200
Message-Id: <20260415-6-12-gpiolib-cve-2026-22986-v1-0-3a7a6de332eb@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTukM2AjXsW4aOuAYwiQVomGc
 HcLLP/3km+BJFElwbVYIMqsScchB50KCE83dIL6yA1s2JqazmiRGLtJx149hllwe5C5uVhsja+
 rioJxjiALU5RWv7t+A1sSlz+4H3v6+JeE90bDuv4B7E4unocAAAA=
X-Change-ID: 20260415-6-12-gpiolib-cve-2026-22986-f0b4331c0aa1
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, stable@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Pawe=C5=82_Narewski?= <pawel.narewski@nokia.com>, 
 Jakub Lewalski <jakub.lewalski@nokia.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35165-lists,linux-gpio=lfdr.de,kernel];
	FREEMAIL_CC(0.00)[cherry.de,vger.kernel.org,linaro.org,gmail.com,nokia.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[0leil.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cherry.de:mid,cherry.de:email,0leil.net:dkim]
X-Rspamd-Queue-Id: 0A42A403ABA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Backport a7ac22d53d09 ("gpiolib: fix race condition for gdev->srcu") to
6.12.y. To make the git context difference between commit a7ac22d53d09
and its backport in 6.12.y smaller, also backport fa17f749ee5b
("gpiolib: unify two loops initializing GPIO descriptors").

a7ac22d53d09 fixes an issue reported as being present since 6.9. It's
been fixed in 6.19 and backported to 6.18.y in fb674c8f1a5d8.

The git context difference could be even smaller if we also backported
d4f335b410dd ("gpiolib: rename GPIO chip printk macros") but its
cherry-pick conflicts so I decided to not include it for now. It was
backported to 6.18.y though (because it applied cleanly and helped
a7ac22d53d09 being cleanly applied as well, see
https://lore.kernel.org/stable/2026011530-owl-savage-9b8e@gregkh/).

The changes between a7ac22d53d09 in v6.19 and the second patch of this
series is (according to git range-diff):

"""
      ## drivers/gpio/gpiolib.c ##
     @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
        gdev->ngpio = gc->ngpio;
        gdev->can_sleep = gc->can_sleep;

    -+  rwlock_init(&gdev->line_state_lock);
    -+  RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
    ++  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
     +  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
     +
     +  ret = init_srcu_struct(&gdev->srcu);
    @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, voi
     @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
                ret = gpiodev_add_to_list_unlocked(gdev);
                if (ret) {
    -                   gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
    +                   chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
     -                  goto err_free_label;
     +                  goto err_cleanup_desc_srcu;
                }
        }

    --  rwlock_init(&gdev->line_state_lock);
    --  RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
    +-  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
     -  BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
     -
     -  ret = init_srcu_struct(&gdev->srcu);
"""

s/gpiochip_err/chip_err/ aside, the rest of the diff comes from feature
commits which do not fit the rules for backporting to stable.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Bartosz Golaszewski (1):
      gpiolib: unify two loops initializing GPIO descriptors

Paweł Narewski (1):
      gpiolib: fix race condition for gdev->srcu

 drivers/gpio/gpiolib.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)
---
base-commit: e7a3953084a7050ca349010deb22546834c2e196
change-id: 20260415-6-12-gpiolib-cve-2026-22986-f0b4331c0aa1

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


