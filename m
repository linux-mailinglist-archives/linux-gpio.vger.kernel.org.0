Return-Path: <linux-gpio+bounces-33153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEwQFyp/sWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:41:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA133265964
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69F6A30C5B7C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0343C1973;
	Wed, 11 Mar 2026 14:38:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696D831F9A9;
	Wed, 11 Mar 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239893; cv=none; b=bS56Ph4YDWqdnmGbV17cvy4husWnLDPU7g7N9ptckQdSnH2BGkbh3sSB1+A1Pixkgsc4Z2OsfoXwCK1O2CrbW9Snn5JAGq+tRwoiFACXX4qxS9TJzyilcik0OmZTwHGGYIoRzfQAyqKehC0jCYQREO7yR7b8IYQGhrenvxjAYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239893; c=relaxed/simple;
	bh=sF4w8VwjlNPcVjdAIoEuag3HF+WY4mwy+hibhNG3SWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nSwnv1gbZxQ2vL3veFV5V2dLh+CRAVN8JmKKqf+5YhDmGZIwI+eVXrop2zP8CsuycpfDc20hLYwLlIwPYUe765ckk89cKfgBuVVYzFOEn9uXTETyi0O8n+5xz9rUOqRGSo2EeRXETU2bf+3GZJaVgY0b7TEHSAS5Xba2LBhTMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 1381EDF9223;
	Wed, 11 Mar 2026 15:31:40 +0100 (CET)
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id E8DF82003DC;
	Wed, 11 Mar 2026 15:31:25 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 0/4] gpio: kempld: Support get/set multiple and interrupts
Date: Wed, 11 Mar 2026 15:31:16 +0100
Message-Id: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33153-lists,linux-gpio=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DA133265964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series update the kempld driver to support current versions of the PLD,
add the get/set multiple ops and implement the interrupt controller.

Alban Bedel (4):
  gpio: kempld: Simplify the bit level register accesses
  gpio: kempld: Add support for PLD version >= 2.8
  gpio: kempld: Add support for get/set multiple
  gpio: kempld: Implement the interrupt controller

 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-kempld.c | 289 +++++++++++++++++++++++++++++++++++--
 include/linux/mfd/kempld.h |   1 +
 3 files changed, 278 insertions(+), 13 deletions(-)

-- 
2.39.5


