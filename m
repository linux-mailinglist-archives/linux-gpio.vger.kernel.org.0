Return-Path: <linux-gpio+bounces-30977-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF5vFKJEc2lEuQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30977-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:51:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6773A02
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A44373009568
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EC62F90C4;
	Fri, 23 Jan 2026 09:51:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38094376467
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161882; cv=none; b=ZdyXEZ2dyJdkxDC+92O3lVJ1rx+1syWFD4A65ppQla21VIljYOjz8TWWMNfWlzwguCdulTHGKXlrVFP40rcBK6aHH18cyvFl8+KDSSCQg5hYkO2VKjJk6MilJvEsMh/q4jlEhirc8gSU9TpB/5paHZDCsGjxY0nhuCxDaZx3QsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161882; c=relaxed/simple;
	bh=k7nCVCN76BJkjjhLlmB3XfyG5x986SpFimxysg6JeAg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DjUz4D/kuG8xcc58+aP6LNZg5Ulmu9PHbwwRjw4h/yK1cuzLIcxCpDVoPIoNv5GaLXdsFjEQwzV/LqVeGgBVPrY1eL2hqcVM0ITSizqWWEYCrhwxDHNg1EeqE8+WfxO2OQnZ0Z+w4BbKAjkZdJG5wOKHdpgip8sDpONLOtBsrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjDoq-0000nr-GX; Fri, 23 Jan 2026 10:51:08 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Date: Fri, 23 Jan 2026 10:51:04 +0100
Message-Id: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhEc2kC/x2NUQqDMBAFryL73YBuwGKvUkpQ95kutElIxBbEu
 5v2cx7Mm50KsqLQrdkpY9OiMVToLg3NzzF4GJXKxC33bcfW+KTRCLa3Wz4hCtxvEOexupjWao8
 vg6Fnvs5iBztRfUoZi37/lfvjOE4hgmK2dQAAAA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30977-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: B7A6773A02
X-Rspamd-Action: no action

There are various helpers to simplify the handling of optional gpios.
The devm_fwnode_gpiod_get() lacks the _optional variant, and drivers
have to explicitly handle the error for optional gpios.

Introduce a devm_fwnode_gpiod_get_optional helper and simplify the
BD71815 voltage regulator driver by using this helper.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Michael Tretter (1):
      regulator: bd71815: switch to devm_fwnode_gpiod_get_optional

Stefan Kerkmann (1):
      gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper

 drivers/regulator/bd71815-regulator.c | 15 ++++++---------
 include/linux/gpio/consumer.h         | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 9 deletions(-)
---
base-commit: c072629f05d7bca1148ab17690d7922a31423984
change-id: 20260123-gpio-devm_fwnode_gpiod_get_optional-e96227cd393b

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


