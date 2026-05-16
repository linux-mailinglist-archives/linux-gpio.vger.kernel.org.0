Return-Path: <linux-gpio+bounces-36960-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGV/KsNNCGoDiwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36960-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 12:58:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B5E55B3E0
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 12:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52FD4300FC48
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F4C3B4EAD;
	Sat, 16 May 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="FgnVLnQ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21E1C5F39;
	Sat, 16 May 2026 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929088; cv=none; b=CKWWyxGq6xOdWbtcX/Pm/UFd5NZUabrxBlPBMkMv6wRCpYOknAjmgKOB1IT79L6jI4XxtfETJWzJTnmqrBHS8YfcOnnwKoRveWliv8wy5yrVAvqFemyJxW5X/9DpzLJ23GXWmmNTshNCRMk9GD5/rSopoTsih2PL8pQfvNN2G6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929088; c=relaxed/simple;
	bh=RW/o8eaNIpBWWcS77fUHazU/f4uyxJOXt9Mmg3gzpUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eB5XTaQMhlims9paC9kRbq7I1nOx8arolHhGnU2ZReGeAs8XvqNlhqR2QcBWObaefWWoix1NuoSUwClTtKFBvCZb5xxIcEcJw8Q1epmIIUhr+HNSWLi75INkb/xLaLLXizHsXXhEYpK04KV0E2QOj8Ing8pzEOApsFYSngkg7xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=FgnVLnQ7; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1778929084; x=1779533884; i=len.bao@gmx.us;
	bh=AYrkXnAJlcI+3UTiFSpesKFeBc6Tuf060NeF7npmuNs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FgnVLnQ7rs27MoYS3mOT+Dhvw7ix3wykojOgdlkwcIFQMeQt/8EauHTxMj1XK/Gb
	 1T9auPKo2dVHB/0zbXTg/Ot4hZbZ6ntZhAbJnuxlIORmumBIQKcqZBoQRVKYMdcfI
	 hKsU+40ZPjZ61KwE2xjfWh6ayEmKldstWWY4WYI0EbPQ22TIZ1c3QPO6AUR+pA3ql
	 BkZC+7jQJlOErmXeNPAv66uF7NH5CCtUdR4TXrrJMJQxVaLEGBcpjnVzXDJJ6G0kM
	 aermC38QYcx7KtrfeRA+jC9TGBWGrLbv+jftuuzh+7WHR5adnYR++tEiEHUXkEPsy
	 RaZdHug00EqDsUHLBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MuUnK-1xFcaM0NQQ-017MrB; Sat, 16
 May 2026 12:58:04 +0200
From: Len Bao <len.bao@gmx.us>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Len Bao <len.bao@gmx.us>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init
Date: Sat, 16 May 2026 10:57:34 +0000
Message-ID: <20260516105737.45174-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o52B1GhrTHEU9RU7aIw8GXyarImzL1p/of52VDw3iDszOi7SlIb
 DFqEbNYgxco3JuHxtBjUfMe6v7aGUIpM4TRJB1pUFt7WOAKi7hGg6qXpAjnb77ZKqYXOch5
 sqHMkMYLk+6wq/CRiiVs+PIjDJu62o6Il61RWV/UOLwj+adfn5EoQxejCiALyTFbqx1QRhZ
 sR4pXDnht4WmRz6rVxGGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d8WWm7WyWkM=;DlxmssNPrYdjqcxn1bqiwHi/9Ds
 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
 HWidOg==
X-Rspamd-Queue-Id: 13B5E55B3E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.us,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.us:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36960-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmx.us];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmx.us,vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.us:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,linux-gpio@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The 'gpio_devt' and 'gpiolib_initialized' variables are initialized only
during the init phase in the 'gpiolib_dev_init' function and never
changed. So, mark these as __ro_after_init.

The 'gpio_stub_drv' variable is initialized only in the declaration and
never changed. So, this variable could be 'const', but using the
'driver_register' and 'driver_unregister' functions discards the 'const'
qualifier. Therefore, as an alternative, mark it as a __ro_after_init.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430..6b2bc0b78 100644
=2D-- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -55,7 +55,7 @@
=20
 /* Device and char device-related information */
 static DEFINE_IDA(gpio_ida);
-static dev_t gpio_devt;
+static dev_t gpio_devt __ro_after_init;
 #define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
=20
 static int gpio_bus_match(struct device *dev, const struct device_driver =
*drv)
@@ -114,7 +114,7 @@ static int gpiochip_irqchip_init_hw(struct gpio_chip *=
gc);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc);
=20
-static bool gpiolib_initialized;
+static bool gpiolib_initialized __ro_after_init;
=20
 const char *gpiod_get_label(struct gpio_desc *desc)
 {
@@ -5340,7 +5340,7 @@ EXPORT_SYMBOL_GPL(gpiod_put_array);
  * gpio_device of the GPIO chip with the firmware node and then simply
  * bind it to this stub driver.
  */
-static struct device_driver gpio_stub_drv =3D {
+static struct device_driver gpio_stub_drv __ro_after_init =3D {
 	.name =3D "gpio_stub_drv",
 	.bus =3D &gpio_bus_type,
 };
=2D-=20
2.43.0


