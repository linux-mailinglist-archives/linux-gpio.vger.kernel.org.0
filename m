Return-Path: <linux-gpio+bounces-16208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F471A3A7C2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 20:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECFAA17302E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 19:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1521E832D;
	Tue, 18 Feb 2025 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jSoaoPlm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1E121B9F6;
	Tue, 18 Feb 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907551; cv=none; b=ZsYySK0fsU9yunJREoWK7KwA9NzHhoYMlXeogYzTWrmcWoBGs25s3NTNTM++RTNjiWar511WSPq5rDKUVBEV7GQNW7713FmUYa627FtwTfEgryAt0B1hmEOydgBzIsoeDZQYrjaV5JdAj0R5w9+gRWWK5Y0a9brwI6oyKVsp+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907551; c=relaxed/simple;
	bh=BUmRBQS7vSVK4+++U/KthdXTDryoLmrIklLjtJcZ1Vo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e+8o/8Ig1d78iNWiQzRUxxW6Dho2J3UjIWimEii0kRRJ4qGFeiekrjaDqmXBT49wSZd3aHgheSynXEg0WDKZXJtSZ4hQkK7mmrsMcUdSIr2drWW64PdYauRjVL/oLyb+G1QtiTaAQyewXJKt11j2yuIilnAwns5rQjDDOus+5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jSoaoPlm; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739907546; x=1740166746;
	bh=WRWCrhEHRicreqE74v8mN3C4gV8L2h9iONUII3AvNDk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=jSoaoPlmTTo/Q0TzthJGK0sW3g7wDWKp0Vv4kmjToHoiaeg+GHpJOkMLaL4NYm/0A
	 Uso+8VN2nrg7rqpLYhvblkRPDFSNNE1HcswnqUxdgM7dcgljez73O6cXPE/DNSaiOy
	 ydKE8xLc0vcSjB2ocT9tmOCy6jLlvxywCvaUz0YO+TK3BD4/qZbdvBzbi2VkU6/YM0
	 iFgqoP/YVM04EvDlsgob7lsc6iR0iZ0bWJxQ1EAmXIgPBWsW0yU177qcmNiCfkTDDg
	 5uZNM2YBhtU4/hz6a1WvIT8jnXLiCj33h+0PbWFACYUGXFcv8yvGRBRGRMmTrtpYsx
	 Mm2H7AEAOYULQ==
Date: Tue, 18 Feb 2025 19:39:00 +0000
To: linus.walleij@linaro.org, brgl@bgdev.pl, corbet@lwn.net
From: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>
Cc: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: [PATCH] Fix typos in admin-guide/gpio
Message-ID: <20250218193822.1031-1-maksimilijan.marosevic@proton.me>
Feedback-ID: 97766065:user:proton
X-Pm-Message-ID: 36be57bd05e33619a1b93190053f9747536e2b97
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fixing typos.

Signed-off-by: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>
---
 Documentation/admin-guide/gpio/gpio-sim.rst      | 2 +-
 Documentation/admin-guide/gpio/gpio-virtuser.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/gpio/gpio-sim.rst b/Documentation/ad=
min-guide/gpio/gpio-sim.rst
index 1cc5567a4bbe..35d49ccd49e0 100644
--- a/Documentation/admin-guide/gpio/gpio-sim.rst
+++ b/Documentation/admin-guide/gpio/gpio-sim.rst
@@ -71,7 +71,7 @@ specific lines. The name of those subdirectories must tak=
e the form of:
 ``'line<offset>'`` (e.g. ``'line0'``, ``'line20'``, etc.) as the name will=
 be
 used by the module to assign the config to the specific line at given offs=
et.
=20
-Once the confiuration is complete, the ``'live'`` attribute must be set to=
 1 in
+Once the configuration is complete, the ``'live'`` attribute must be set t=
o 1 in
 order to instantiate the chip. It can be set back to 0 to destroy the simu=
lated
 chip. The module will synchronously wait for the new simulated device to b=
e
 successfully probed and if this doesn't happen, writing to ``'live'`` will
diff --git a/Documentation/admin-guide/gpio/gpio-virtuser.rst b/Documentati=
on/admin-guide/gpio/gpio-virtuser.rst
index 2aca70db9f3b..7e7c0df51640 100644
--- a/Documentation/admin-guide/gpio/gpio-virtuser.rst
+++ b/Documentation/admin-guide/gpio/gpio-virtuser.rst
@@ -92,7 +92,7 @@ struct. The first two take string values as arguments:
 Activating GPIO consumers
 -------------------------
=20
-Once the confiuration is complete, the ``'live'`` attribute must be set to=
 1 in
+Once the configuration is complete, the ``'live'`` attribute must be set t=
o 1 in
 order to instantiate the consumer. It can be set back to 0 to destroy the
 virtual device. The module will synchronously wait for the new simulated d=
evice
 to be successfully probed and if this doesn't happen, writing to ``'live'`=
` will
--=20
2.43.0



