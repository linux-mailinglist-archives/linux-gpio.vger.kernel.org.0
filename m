Return-Path: <linux-gpio+bounces-40012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4iXSGFPVVWp/uAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:21:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2237751705
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:21:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=gEpFqgpN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40012-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40012-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 992EB308D67C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 06:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D613D649D;
	Tue, 14 Jul 2026 06:20:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA837A847;
	Tue, 14 Jul 2026 06:20:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010038; cv=none; b=VRrXOn6tiPzV3jsH34dW7t02llRuS589dgowMYdOxwR7YaixnqfYmZt8+5IkyZgACNcRaRE891UVstBK4wPP4zDg4gekXxKuA3NF3bffELhCX8G8+8i/xqH8uqpRvZ/jLpi9pEI2MNFaM3rDyO9J9MrnB3K46dF06TC0HDQsp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010038; c=relaxed/simple;
	bh=g+/YhdtQSwMbFUHDU1sosrufGCb63rHWYw7lEzc/9LY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Txccmj5lxkmbsNujXG2Ty+LpzC6z5/Bs1oiaUPwRGx+KtPRtjp9VPduHhvhX0ngaF0Bcu9x+5Lj6zehbWed2hrxG60iolj/ANBYUyzU9oODRNzkvIXlS2ntLuxVoObayAVO/oGlwqqp6DFNRWVLwkbaK1BbAsSLeT5DH+oqQliE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=gEpFqgpN; arc=none smtp.client-ip=212.227.15.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784010029; x=1784614829;
	i=markus.stockhausen@gmx.de;
	bh=7DiVzZvG6AgnuHRgRcDDHRh+Budd4Dc5b9A0WfDiw38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gEpFqgpNN6eEqSA+B5SP3dZ65DL1M3fDEfcMV3KTuI3ViShcFwnaYLBDvnYTXp5A
	 +nXccu26B9rnKGIX71e3CdwY4JbhoYn5CPRo/xDVWMvrOLT6jLoC1GzuO1G9ch4bi
	 hxADEuBclyzTtA5/j503qsQ2ox7rkkmofQAJlWztnNKEGL/5thTKxPr7p3cIyiwlY
	 ZIa4Y82WSXP0NVsMPo/oeqKNhDV4EaBw+clvglBAqv5MjMVb0ujRxoFF2NqbN/GPE
	 OgSkkgt7A6f1mTsRi0KW7lW6AypUPhrTvMYYRCu/P2FVwQb04ys5LzqDkz0GesEip
	 LXupHdmCYfCKUS/s5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6qv-1xPU9f3XgZ-00aW7C; Tue, 14
 Jul 2026 08:20:28 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v6 0/2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Tue, 14 Jul 2026 08:20:16 +0200
Message-ID: <20260714062018.3009830-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HbcjX/Wm/bewFp9PAFu9jUqnJIxWTgMuEo1oPKhF0EqWo4wVXrj
 xnthRvF38dP4ddCL60kXhgWnY2LBKctqXtF2/JKPEuR9+1Pfg4X4ndPFGVM7kQzk4Kn9FhH
 X0vdwkmmgjUubScRVqzRhF6iE9ErFfjvvkOGOSoUGlzU8z6+uaau8pxqB6vVwNEaX5IpiHw
 tZRnGW3irvOWUcjP84f0Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YOJeVpMfrxs=;ha31mZjYNuuWb2d+XcdeaGR5znW
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-40012-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:markus.stockhausen@gmx.de,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gmx.de:from_mime,gmx.de:mid,gmx.de:email,gmx.de:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2237751705

This series adds support for devices with multiple I2C buses=20
that share a single clock line.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--

v5 -> v6
  - Add legacy system detection (without dts/fwnode)
  - Add skip_bit_test setting to algorithm options via pre-commit
  - Make use of skip_bit_test in the driver
v5: https://lore.kernel.org/linux-i2c/20260713062021.2995641-1-markus.stoc=
khausen@gmx.de/
v5 Sashiko: https://sashiko.dev/#/patchset/20260713062021.2995641-1-markus=
.stockhausen%40gmx.de

v4 -> v5
  - Whitespace cleanup
  - Send to LKML for Sashiko review
  - Add Reviewed-by
v4: https://lore.kernel.org/linux-i2c/20260709062534.2864521-1-markus.stoc=
khausen@gmx.de/

v3 -> v4
  - add Reviewed-by and Tested-by
v3: https://lore.kernel.org/linux-i2c/20260520173129.1382489-1-markus.stoc=
khausen@gmx.de/

v2 -> v3
  - Fix lockdep_set_class() with DEBUG_LOCK_ALLOC=3Dy
v2: https://lore.kernel.org/linux-i2c/20260518161013.900504-1-markus.stock=
hausen@gmx.de/

v1 -> v2
  - Convert fault injector to scl->gpio (reported by test robot)
  - Use rt_mutex and i2c_lock_operations instead of pre/post_xfer
    (logic taken from i2c-cht-wc.c and enhanced)
  - i2c_gpio_lookup_scl()
    - Improve list control flow
    - Improve comment
    - Carve out SCL node comparison into i2c_gpio_scl_matches()
  - Drop "valid" attribute and directly check gpiod instead
  - Improve fwnode args check for #gpio-cells=3D1 case
  - Add sda/scl cleanup during probe failures
  - Replace dev_info() with dev_dbg()
  - Reflect changed locking in commmit message
  - Tested with config option GPIO_SHARED/GPIO_SHARED_PROXY
    as requested by Bartosz
v1: https://lore.kernel.org/linux-i2c/20260514092042.3265986-1-markus.stoc=
khausen@gmx.de/

v0 -> v1
  - Initially this enhancement was submitted as a new driver with
    a new devicetree structure. After some discussion Wolfram
    advised to make only an enhancement to the i2c-gpio driver.
v0: https://lore.kernel.org/linux-i2c/20260511162528.84508-1-markus.stockh=
ausen@gmx.de/


Markus Stockhausen (2):
  i2c: algo: bit: Allow to skip bit test
  i2c: i2c-gpio: Enhance driver for buses with shared SCL

 drivers/i2c/algos/i2c-algo-bit.c |   2 +-
 drivers/i2c/busses/i2c-gpio.c    | 223 +++++++++++++++++++++++++++++--
 include/linux/i2c-algo-bit.h     |   1 +
 3 files changed, 211 insertions(+), 15 deletions(-)

=2D-=20
2.54.0


