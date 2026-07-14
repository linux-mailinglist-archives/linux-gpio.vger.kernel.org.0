Return-Path: <linux-gpio+bounces-40011-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nq+yLkPVVWp3uAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40011-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:20:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFB7516EE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=M29BEGDF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40011-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40011-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 824E13058D9E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 06:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803B33D7D93;
	Tue, 14 Jul 2026 06:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA532281525;
	Tue, 14 Jul 2026 06:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010037; cv=none; b=WXCdpzjGzqj6LYA+Rj7LYQgDKhzVvmLJdtG37Nzb+Z73uu7aWz45GNRMCIZolVnjIOUVlLakdwx89Oc1m65x3dYAfhd3LOLDanuah6AU7MY3Nf6j3sFE9EuvvOxUfauSksgvMCKeUruQfsnlkbBlPfu3x1Mm4/2+xQ+CA7itKQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010037; c=relaxed/simple;
	bh=0cEndoD0RSiayClQwWa022DXlQ8SuZpIyLPxQm+m/dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWoWaZx6Uf+9tSxFCu55ivkYV4nw2RBPME/+/yjJXeb+nnpnVEomegIDd8O0AtZD6WF1oyad2oiAKbqrOg9306I+10GtPloG0HQYaY7cqjzpETz91n6HGdn/21exRz8FrQLjrZHlq2+PE/jmzuBVh+fetI2/H8Hb7X+ATWxuhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=M29BEGDF; arc=none smtp.client-ip=212.227.15.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784010029; x=1784614829;
	i=markus.stockhausen@gmx.de;
	bh=SCU+g1Q54pIAKmlekAdvDSCRya3ekTVYOJwisBHbRqQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M29BEGDF6JQK28SCitsdj//kO2ud2T88VVr5gaSAMQVUlCPVLcCzXu5CXI8EHJID
	 nasZ8/fahHbMy05ONK9AhcAeQCrrCiFDjmLgirDqZLuylm3n7lofBf9FPiOSg2ncB
	 nXI3EsyaZr6rgR0P07XDkp21Tm1eP+wAFDYljV8mxPLkGP+IGblNDI3yexVwIV4Ee
	 N6Tvge7C2CFDfe9YV6TYO8z5YYk3hNHCELbbhOIYUkyM+iifc1pQEw62V9qsm/OUd
	 5jU5WesSuY5+qWX0KuVv5efBRY6DOmAOx0XpshW5u1Y10DGuwGAwn6XxNM1fSDrPR
	 zkGx7hOD8pV4R3ZxXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1wTEhe0J03-00UrKk; Tue, 14
 Jul 2026 08:20:29 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v6 1/2] i2c: algo: bit: Allow to skip bit test
Date: Tue, 14 Jul 2026 08:20:17 +0200
Message-ID: <20260714062018.3009830-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714062018.3009830-1-markus.stockhausen@gmx.de>
References: <20260714062018.3009830-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lmcjE8a2NcaSV4p/cCyBxoNTLCMW/5EGeSh9HI/KGFhS6ef1RlT
 FqCZzIzdnSgjzOz2lU4J3BnBegSpQRYf3QDvqe6YpUCAtx0oDa48kkLzo/Y+Svfd5VGvWHI
 kW+JplyPv3uvbgn9Ku6L6bAH0r+C6d4ANwA8oypboiRa/OgVBKHuakI+4tCnPGU3GGjpogB
 vfLzxZhJPeW5wJ44ZDNkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0V8YWA10NUk=;cGeEJWMKSOl4AjJgRw9u1lR2CPv
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
	TAGGED_FROM(0.00)[bounces-40011-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 12BFB7516EE

An I2C bus can make use of shared resources. E.g. two gpio based buses
that share a single SCL line. To synchronize access to the bus the driver
might use locking with the help of i2c_lock_operations(). While this
works for normal transfers it is not available during initialization.

Especially if i2c-algo-bit module is loaded with parameter bit_test
it will issue some basic sanity checks that will access the bus without
locking. This might interfere badly with concurrent transfers. Even
if these are well synchronized via locks.

Allow the consumer of an algorithm to override if the bit_test is allowed
or not. For this add a new boolean attribute named skip_bit_test to
i2c_algo_bit_data. If set the test is not run.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/i2c/algos/i2c-algo-bit.c | 2 +-
 include/linux/i2c-algo-bit.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo=
-bit.c
index d1d9a6c1a1e2..7ca565cbff5b 100644
=2D-- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -639,7 +639,7 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	struct i2c_algo_bit_data *bit_adap =3D adap->algo_data;
 	int ret;
=20
-	if (bit_test) {
+	if (bit_test && !bit_adap->skip_bit_test) {
 		ret =3D test_bus(adap);
 		if (bit_test >=3D 2 && ret < 0)
 			return -ENODEV;
diff --git a/include/linux/i2c-algo-bit.h b/include/linux/i2c-algo-bit.h
index 7fd5575a368f..c4c43aec1e67 100644
=2D-- a/include/linux/i2c-algo-bit.h
+++ b/include/linux/i2c-algo-bit.h
@@ -34,6 +34,7 @@ struct i2c_algo_bit_data {
 				   maximum 50 us for SMBus */
 	int timeout;		/* in jiffies */
 	bool can_do_atomic;	/* callbacks don't sleep, we can be atomic */
+	bool skip_bit_test;	/* override bit_test module parameter */
 };
=20
 int i2c_bit_add_bus(struct i2c_adapter *);
=2D-=20
2.54.0


