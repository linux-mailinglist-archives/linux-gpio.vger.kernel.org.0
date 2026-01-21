Return-Path: <linux-gpio+bounces-30867-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nt2EGTXcGkOaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30867-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:40:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5557A5F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE31F9CD871
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0CA421899;
	Wed, 21 Jan 2026 13:12:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5053DA7DE;
	Wed, 21 Jan 2026 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001158; cv=none; b=VSIb+BwHM3Gt2rJlegXQa83XbxEqpU41Bvxvc9dcC1GJudDYyzbSF1flkqBqQRYXE+NBcnofLtYI00MwrhzabC7BguSGu9QuNA2YkTLjixFZyE9RFCoRhTMZGEw+dQoTp8/Swub7HY9ArnG9mGlrTQDtZD+sKeDudoDPlo4r9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001158; c=relaxed/simple;
	bh=qRRYPuxowEMqW4/BUa2kTNfeVgO5eaFWsOgIxiR7aqY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jvg5pUvBVW+FWcTVvPAqV9/kXpX32W4W29IWYYuIOHty6b2wQDAuA+093Ui6/NJMZez53qC9+ZjabNA0mev5TceVrIIXy+RBbeJuHc/a7tHCGs8mTx/YoiJuY9E4MqY79SwSc0WrHvpqWUaiCCq9ed3yJ0DS3krDom7GbWsNWsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 21 Jan
 2026 13:57:22 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Wed, 21 Jan 2026 13:57:22 +0100
From: Martin Larsson <martin.larsson@actia.se>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Martin Larsson
	<martin.larsson@actia.se>
Subject: [PATCH] gpio: pca953x: mask interrupts in irq shutdown
Thread-Topic: [PATCH] gpio: pca953x: mask interrupts in irq shutdown
Thread-Index: AQHcitV7YE7WVJJT/0amc1WwBjPAYw==
Date: Wed, 21 Jan 2026 12:57:22 +0000
Message-ID: <20260121125631.2758346-1-martin.larsson@actia.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.51.0
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445E647262
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [1.74 / 15.00];
	DMARC_POLICY_REJECT(2.00)[actia.se : No valid SPF, No valid DKIM,reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,actia.se:email,actia.se:mid];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.larsson@actia.se,linux-gpio@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-30867-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 89D5557A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In the existing implementation irq_shutdown does not mask the interrupts
in hardware. This can cause spurious interrupts from the IO expander.
Add masking to irq_shutdown to prevent spurious interrupts.

Signed-off-by: Martin Larsson <martin.larsson@actia.se>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 8727ae54bc57..f93a3dbb2daa 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -914,6 +914,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 	clear_bit(hwirq, chip->irq_trig_fall);
 	clear_bit(hwirq, chip->irq_trig_level_low);
 	clear_bit(hwirq, chip->irq_trig_level_high);
+
+	pca953x_irq_mask(d);
 }
=20
 static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file =
*p)
--=20
2.51.0

