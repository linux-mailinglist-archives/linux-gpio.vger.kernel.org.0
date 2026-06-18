Return-Path: <linux-gpio+bounces-38689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vNjUB28YNGqKOQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:10:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C43B6A17E2
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0leil.net header.s=20231125 header.b="X1/Emyvh";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38689-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38689-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=0leil.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0C1E30E0D65
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0909345CD3;
	Thu, 18 Jun 2026 16:03:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628EB343882
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 16:03:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798599; cv=none; b=OF7CtYF0yOmX8QwdLXIYZ8flShvSP7Bywdg0WH909yWzKsoxLO+BZdsdN5JrSwz5EA3dHE1duRtzfSaHv09BA5Ob1sRT2M48Kxym300wf3b0nuHXVrGhIEVSnXUmW4FIZQvtf4pqqPOLfKvhvuDF7t5ARdl5rTdRzrHpvPzhWEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798599; c=relaxed/simple;
	bh=4NhTXoOQZEs4cN6xbmxVzuH8Qf9Bn1i/4b+0+fEoDcM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/a2Ndt48yA9gmE3bJJEZBpHHiEFYyyPaltGol7Y8JNPdK6clTT5/9kMmMDqbQjZZlWa4xx0VvfKVgGk3tv+JI5a7km7HPosm5vIR4D1KzKlXwmdAj5X89ykAHCyaUhARI2WaTUDD8pjgNtGGFssF/7WWRYyN8j+yyw/MNNUHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=X1/Emyvh; arc=none smtp.client-ip=185.125.25.9
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gh59T6yfWzd18;
	Thu, 18 Jun 2026 18:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1781798589;
	bh=CvD9z9YN4M+/vOXsi6tXS5UgQCp5qSoTR48bj8emK8g=;
	h=From:Subject:Date:To:Cc:From;
	b=X1/EmyvhD6ujMlv6Aeg26+976pX8f0ZRNDzK7W1azwHh1H5FOXxH3/DjRA/PF2eN5
	 mrcBorvPsqDeO4GurIPVIZIEF8tubwbcnwCFLT4yUPka0seUnUpBNos/dcgNzoBo+s
	 rQV+oP8ZSOTLFKvrm1FK+AioA1kjBA7Z9N2Ut9Gw9etU13gI1O7UZoEBzH8wNiv8fg
	 28r1MR/5vWy2I1nZSd9nEKGC7nYM+ic6Ffw2ddf5Jdy8oCQCx3hACc5iMDYpa6b+n/
	 ZTZCoACU7ZJMQ6XnqQWhtwG7hhoHqhcSJWwgoB8dsQ17oxGZYXXWAHqnHkW2emTWUx
	 opTTwGgNhvIjw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gh59S03xCz5nn;
	Thu, 18 Jun 2026 18:03:07 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 6.12.y 0/3] gpiolib: backport 16fdabe143fc
Date: Thu, 18 Jun 2026 18:02:50 +0200
Message-Id: <20260618-6-12-cve-2026-31732-v1-0-7ca0d0b906b0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv0L27JLuNmyNXzEepCywHtC0SCSEv
 1v0OJPMbJA1mWa4VBskXSzbcypApwrieJ8GResKAzsWJ3RGQWKMi+Jh0FPwjOJdkK4hCeyglK+
 kvX1+1ytITVyvcPv7/G4fGudjCfv+BZVCl2x/AAAA
X-Change-ID: 20260618-6-12-cve-2026-31732-63076d516720
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, stable@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[0leil.net,reject];
	R_DKIM_ALLOW(-0.20)[0leil.net:s=20231125];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38689-lists,linux-gpio=lfdr.de,kernel];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:gregkh@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:quentin.schulz@cherry.de,m:andriy.shevchenko@linux.intel.com,m:mathieu.dubois-briand@bootlin.com,m:tzungbi@kernel.org,m:stable@vger.kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[0leil.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[foss@0leil.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,0leil.net:dkim,0leil.net:from_mime,cherry.de:mid,cherry.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C43B6A17E2

Backport 16fdabe143fc ("gpio: Fix resource leaks on errors in
gpiochip_add_data_with_key()") to 6.12.y. To make the git diff more
similar with the upstream commit, also backport 375790f18396 ("gpiolib:
Extract gpiochip_choose_fwnode() for wider use") and 550300b9a295
("gpiolib: Remove redundant assignment of return variable").

The changes between 16fdabe143fc and the third patch of this series is
(according to git-range-diff):

"""
      ## drivers/gpio/gpiolib.c ##
     @@ drivers/gpio/gpiolib.c: static const struct device_type gpio_dev_type = {
    @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, voi
     +	}
     +
     +	gdev->can_sleep = gc->can_sleep;
    -+	rwlock_init(&gdev->line_state_lock);
    -+	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
    ++	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
     +	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
     +#ifdef CONFIG_PINCTRL
     +	INIT_LIST_HEAD(&gdev->pin_ranges);
    @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, voi
     -	gdev->ngpio = gc->ngpio;
     -	gdev->can_sleep = gc->can_sleep;
     -
    --	rwlock_init(&gdev->line_state_lock);
    --	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
    +-	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
     -	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
     -
     -	ret = init_srcu_struct(&gdev->srcu);
    @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, voi
     @@ drivers/gpio/gpiolib.c: int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
      		ret = gpiodev_add_to_list_unlocked(gdev);
      		if (ret) {
    - 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
    + 			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
     -			goto err_cleanup_desc_srcu;
     +			goto err_put_device;
      		}
"""

s/gpiochip_err/chip_err/ aside, the rest of the diff comes from feature
commits which do not fit the rules for backporting to stable.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Andy Shevchenko (2):
      gpiolib: Extract gpiochip_choose_fwnode() for wider use
      gpiolib: Remove redundant assignment of return variable

Tzung-Bi Shih (1):
      gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()

 drivers/gpio/gpiolib.c | 156 +++++++++++++++++++++++++------------------------
 1 file changed, 79 insertions(+), 77 deletions(-)
---
base-commit: 1d3a00d3bacff25652c96e1527610c69e91f7c38
change-id: 20260618-6-12-cve-2026-31732-63076d516720

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


