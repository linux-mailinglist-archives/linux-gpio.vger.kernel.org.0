Return-Path: <linux-gpio+bounces-33037-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFSIDKSCsGmwjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33037-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 21:44:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE72257FC1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 21:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390BD308C632
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 20:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1403E5EF6;
	Tue, 10 Mar 2026 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="r6XhJI2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF8261B9E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 20:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175457; cv=none; b=Smu63F9srJFzccgag1KIF3eKf9VYlnHI/2c2Xr/pruU+LUOvXjbcuSKFk5q7oUtm87C56oQi0SoQbR9ioRlfPxsGnCGwisXcfdKUHsgPq41DXSnenm67XZQjzEKLZkjiGpirzYi2Clh4Q9rlXPW+fB9NhLnHiJ4gP0gWWAq5rZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175457; c=relaxed/simple;
	bh=oP4V5LKJn3ZGHb/eEc+Daxs0iITMaUXbxAWPx2PXgnQ=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=gnt4r4//q5yItRPdR8IKYQMkfEHMLam35bNjzH0eZz26DXfCg3Des6eC1llf5gLvzC10DpvphIHAKGgo8NHoutsPqcao0qgY9iGM+f+hN8lW9WhnZG/oSdmtrWq29aFR1ITSLH8PyzsFL5CAawJ/RX+fFyhH4cJKo5mdxBUTMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=r6XhJI2f; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773175446; x=1773434646;
	bh=lrA62+FK7AEIOP8bJ09JCwTGb6kp6z/4PBG1lTkADn8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=r6XhJI2fJgOnItYvyIVaAaLJJwLFepYtXKE9dgmUCU8zzjz3nWmrMCXPVfmjdvA2h
	 tD2UAaCX9yaC2D5CDqa0neYCxW97KRV4Ke168BgMzB9fNPVPU8xjE1+iGXNWxOJvon
	 0aPoCtzMtoZFFAyMDcosRi4FXKJDcZ4Iq434hNsY17av6IGb0o2WlIf4UwgB+rX6IM
	 f3Zj3ewjkKtY45UkpVM+3L9TPUjT7u8CDgUn1XTYSXbNLq7KWzQL3lOnIBUQT+6jaT
	 GNIE6nakPOAxE5Jftn1i8cjg/dopxfrk7DGZ+5rSFd/Tof7fENz8UOliDLoxgOYsbS
	 iNM2aZ3pyiuGg==
Date: Tue, 10 Mar 2026 20:44:03 +0000
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1] gpiolib: clear requested flag if line is invalid
Message-ID: <20260310204359.1202451-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 8231414b1b3e62e4ce4d8f4c456f3e0cb4c66d12
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7AE72257FC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33037-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[protonmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pobrn@protonmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:dkim,protonmail.com:email,protonmail.com:mid]
X-Rspamd-Action: no action

If `gpiochip_line_is_valid()` fails, then `-EINVAL` is returned, but
`desc->flags` will have `GPIOD_FLAG_REQUESTED` set, which will result
in subsequent calls misleadingly returning `-EBUSY`.

Fix that by clearing the flag in case of failure.

Fixes: a501624864f3 ("gpio: Respect valid_mask when requesting GPIOs")
Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ada572aaebd6..9550500e1690 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2465,8 +2465,10 @@ int gpiod_request_commit(struct gpio_desc *desc, con=
st char *label)
 =09=09return -EBUSY;
=20
 =09offset =3D gpiod_hwgpio(desc);
-=09if (!gpiochip_line_is_valid(guard.gc, offset))
-=09=09return -EINVAL;
+=09if (!gpiochip_line_is_valid(guard.gc, offset)) {
+=09=09ret =3D -EINVAL;
+=09=09goto out_clear_bit;
+=09}
=20
 =09/* NOTE:  gpio_request() can be called in early boot,
 =09 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
--=20
2.53.0



