Return-Path: <linux-gpio+bounces-40073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4oSwDfpjVmqb4gAAu9opvQ
	(envelope-from <linux-gpio+bounces-40073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D3756EFB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 18:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=Dkez+6NM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40073-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40073-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3090B3059CB5
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 16:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19874ADDAE;
	Tue, 14 Jul 2026 16:29:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C1445AED;
	Tue, 14 Jul 2026 16:29:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046573; cv=none; b=QHjtdmB47lOgoMFGApnH9Ak8Ax7iH8I5d2ubf6jcB5KcX4ZEvR3VhSofWtgHb5ZsYKotCoDFw/oVIq2s691LKjpJlF6ObRryzQmiksJjxQJ6Sd4wp6HPXxKNOI4ZxuDASvag2AituqPaNxWfgJ5SsunWbbWWEH0KJTeQHNLN5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046573; c=relaxed/simple;
	bh=+DpuzDYvOyCt2hgHKT6TFwAkQhhr5I0gz9C0T05yC98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gweRxP3RgFjTIRhmyIAWfsmouzUIVzFXgapo1v55mbWQMWPk0ovalq9fgeIP+CFyOURuVL6uIm8NU9TL2O5jBCe0DeXhTHYsXB4be2Fc5nzslJ2De6X26uXPxmxqmLbknkRfplTy8ohf+mGdZzFPMRJfOLVcviRTXl5VPcmxZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=Dkez+6NM; arc=none smtp.client-ip=212.227.17.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784046565; x=1784651365;
	i=markus.stockhausen@gmx.de;
	bh=t8IcvYIG6mT/KUG+1U2ZJbZ0ol8RTEje2lGqEnkDpPY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dkez+6NMgnX/CId0Ca6OfnjDeSqNaocJkyC+Vi9uQ7kL/TBituzJJegRvGuY55Cf
	 MftCxEQh96dgAb/Z2T35/iEyZpXGORYTkdeUk7ro6et61eJjJu8jMNvSv8L0NvmDy
	 y/fKlpikwh31QPYkuOHw80pFY00McktRDfgzrgIA4U48wOkxt2IZL+MO5Jei9+WzA
	 FmH3PvQ6X2bSAtzml1buHb+uxyXnwx/wp7qum3SsCbPs2F6ckhcqrPC9Fuk3Fw/dt
	 b0wyIJrM/0rV2NkrRGcDprfpf86SZKj6xal90irMWhaNFex5ki3VgSp35iQizmbso
	 G11rJ4l0QslhFpxbkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiTt-1wcA0G1mVp-00QnOo; Tue, 14
 Jul 2026 18:29:25 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v7 0/2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Tue, 14 Jul 2026 18:29:13 +0200
Message-ID: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nhd7icA89N3MChPyNZrILhby2LHTAf+YlfIh8qH62FKwO/+sGYa
 3A6k2Lb2H05imZiqvzv904DiIf7fzobeSggxPeW03PCreGWHIH0FZKWI67qwIn/yUE+LO0q
 7p2l19LvGaauvWhm4P/Ive1IDdRd7rhP934ioWGIsg1+yCUoez7RFhV5zKEwyWr2aEHuRl6
 NrfjolS9lEBaoUuuq+zkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5loakI5hWBY=;PD7p4dAI9Y7I7PQ/s8wI5isDIEk
 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
 =
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-40073-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:from_mime,gmx.de:mid,gmx.de:email,gmx.de:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A49D3756EFB

This series adds support for devices with multiple I2C buses=20
that share a single clock line.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--

v6 -> v7
  - Handle devicetree GPIO node attributes opaque. E.g. do not=20
    interpret a pin from args[0]. With this generalize the shared=20
    SCL detection by simply comparing all attributes.
  - Gracefully disable pin sharing if devicetree lookup does not=20
    work as expected. This avoids interference with otherwise sane
    setups.=20
  - Disable bit_test only if a (potentially) shared SCL pin is
    detected.
v6: https://lore.kernel.org/linux-i2c/20260714062018.3009830-1-markus.stoc=
khausen@gmx.de/
v6 Sashiko: https://sashiko.dev/#/patchset/20260714062018.3009830-1-markus=
.stockhausen%40gmx.de

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


