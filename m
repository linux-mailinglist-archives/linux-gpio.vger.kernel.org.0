Return-Path: <linux-gpio+bounces-31080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM21AmR6d2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:29:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437C89776
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01A5302BE1B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB7933DEC8;
	Mon, 26 Jan 2026 14:28:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01833D6D8
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437700; cv=none; b=iHzonVWaY1KbPjmx8RQ8vnwMFTahVkBaSqimygufBDAi3yThC71BogQngferYLlEN6/JpO/rjWn63g+xz+IlL5ChXUj5E8fI2QnxP27RIyNUrQomwyt6KyjbcXGw1ysW4GLwjKPiY8Qzg6snJmQD+i5LS2exFQHNBcX1EHcCLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437700; c=relaxed/simple;
	bh=/UN6Y4qMNHdqi3iL2QDwLVUvSmtyMRWz+EhFAk+nQ5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hgBFmHwho38QF8yRrQHDckOTYys2k59THk9O45YSR5rlFDhYbciIRyowc8BArpN0nssRDeruHuF87uk5Vi01934JFCkYjHXmFzig8kRNYA7jTQBhIdg565KBW4qKR4ztqY/IULO94S3YGGv08mKuj+3501I4y3VXZ1jKo4xBs18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vkNZe-0008IN-8u; Mon, 26 Jan 2026 15:28:14 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Date: Mon, 26 Jan 2026 15:27:46 +0100
Message-Id: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJ5d2kC/5WNWw6DIBQFt2L4Lg3io6Ff7qMxROWKN2mBAKU2x
 r0X3UE/Z5IzZyMBPEIg92IjHhIGtCYDvxRkWgajgaLKTDjjLSt5RbVDSxWkl5w/xiqQh1BSQ5T
 WxbwenhREy/ltUpWoRpJLzsOM6/ny6DMvGKL13/M0lYf9r59Kyug81kKwpm740HYOjH5Hbw2uV
 wWk3/f9B2wy1CLbAAAA
X-Change-ID: 20260123-gpio-devm_fwnode_gpiod_get_optional-e96227cd393b
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31080-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6437C89776
X-Rspamd-Action: no action

There are various helpers to simplify the handling of optional gpios.
The devm_fwnode_gpiod_get() lacks the _optional variant, and drivers
have to explicitly handle the error for optional gpios.

Introduce a devm_fwnode_gpiod_get_optional helper and simplify the
BD71815 voltage regulator driver by using this helper.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Add kerneldoc for devm_fwnode_gpiod_get_optional
- Link to v1: https://patch.msgid.link/20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de

---
Michael Tretter (1):
      regulator: bd71815: switch to devm_fwnode_gpiod_get_optional

Stefan Kerkmann (1):
      gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper

 drivers/regulator/bd71815-regulator.c | 15 ++++++---------
 include/linux/gpio/consumer.h         | 36 +++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 9 deletions(-)
---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-gpio-devm_fwnode_gpiod_get_optional-e96227cd393b

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


