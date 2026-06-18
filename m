Return-Path: <linux-gpio+bounces-38694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id geC6FRgeNGrgOwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:34:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9446A19C5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:34:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0leil.net header.s=20231125 header.b=nJsKeg+G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38694-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38694-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=0leil.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2FA30574A6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4556F31355D;
	Thu, 18 Jun 2026 16:34:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE12EA151
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 16:34:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800461; cv=none; b=K5VWkYbkSPRNDfGjrlJdjgOLGw07r+b3hgBtotg0vk02avuZ3v1hmLd+uLNUzTdAOZVvfngCesCQ6G0ytsFjcj3PGEpov1dbtj4mIa5JlcYdySBD9FbtrwduIu5/Y7ZzDPqXMHr2pC7bdwPfZTfirnJkkools+Tp4z1qpNeMg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800461; c=relaxed/simple;
	bh=sH4Ke66JIpnc0MZHo3EIyfu1ZYY+mgAZrrnNVgq4yPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFndXKS0H3mcobXWO7a7wC4pu63W2toTMVBUMkjs9ROzPsTHCy1XxmxQ5cnBc0ENohPEfE4ER8l5jBGc0YU1SUS8RoDGkCgXVsafrV5Nz/IDzv57KVzn83eAc0bT4oItnITVQCgczinKQMlnJ6TdcObRxeOcmsDVFzYxUQ+FSJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=nJsKeg+G; arc=none smtp.client-ip=45.157.188.10
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gh5sN2xjmzpTM;
	Thu, 18 Jun 2026 18:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1781800456;
	bh=PHAWjs2Y1yJ4pF784Wz2QgiwURvcLQMB3ILixgzZUmg=;
	h=From:Subject:Date:To:Cc:From;
	b=nJsKeg+Gzquz90VmPRmUQAvcfpXfE0vRjqm75lM0E2WISsTFpnXqzjWRMd6sb+sPp
	 HwrQ88ezCGzaSD7gYQE2Mz1v6s/NWpwAdV5FqsBA1SxQ1Rpf5jnBMP+MJO4cCbKhH8
	 rPlBwjvMPGpWDHmWXvcr5RUULkEPNy4t6ACdF+WhA0DO7chnFXzr7d+jK9ePrjfOM2
	 Lq9j4xMDApRj9ifDJxdv67AIFrqi5h8VUXMuDkzimwJZpjlVOklIEkaCR3UODZanPh
	 QuizTgRE3se7mnq4j7GhyCNR9H/xuc02/fEOMZ6W1A3M9odtyT3c5yLNL1LIn+TO8C
	 xABidE4dW2z/A==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gh5sL3fJDzhjJ;
	Thu, 18 Jun 2026 18:34:14 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 6.12.y v2 0/3] gpiolib: backport 16fdabe143fc
Date: Thu, 18 Jun 2026 18:34:00 +0200
Message-Id: <20260618-6-12-cve-2026-31732-v2-0-42cc54b7bf04@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2SW7JW7Vk/9hOEC7Sj2AabGRE
 P5dwLvHmbx5M0PSGDTBpZghag4pDP0azKEA1zX9QzH4NYMhIyR8QkE26LLi1mDFtjIoFVnxRxZ
 rCNblK+o9fHbrDaRkU05Q//r0bp/qxk25kV1I4xCn/T7zzv99yoyE1jXkqT2TtHR1ncY4lV6hX
 pblC/IaTQTQAAAA
X-Change-ID: 20260618-6-12-cve-2026-31732-63076d516720
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>, 
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
	TAGGED_FROM(0.00)[bounces-38694-lists,linux-gpio=lfdr.de,kernel];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:gregkh@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:stable@vger.kernel.org,m:quentin.schulz@cherry.de,m:andriy.shevchenko@linux.intel.com,m:mathieu.dubois-briand@bootlin.com,m:tzungbi@kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0leil.net:dkim,0leil.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cherry.de:mid,cherry.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE9446A19C5

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
Changes in v2:
- added stable@vger.kernel.org in Cc, apologies for the noise.
- Link to v1: https://patch.msgid.link/20260618-6-12-cve-2026-31732-v1-0-7ca0d0b906b0@cherry.de

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


