Return-Path: <linux-gpio+bounces-32598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JLMKmqrqWlSBwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 17:12:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA721534C
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 17:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB272305D6C8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 16:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33253CF662;
	Thu,  5 Mar 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TTzzn8u+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA13CD8D0;
	Thu,  5 Mar 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727102; cv=none; b=WQVIseCem6Or8QsBTdAPlf08uSNb1PWo2R7jn+sChjqOdqRUQOFEz1ywZ3hglNV5esBk5e2Rb1xn8dtWY2T7Mjy7K/8rtub79ytGJcIW7nVfmdFJ7Ncet60xry0MHOg6qRVyh3OGoyotPl7NfIZQUQxRS9YUY9VeohDudFNiL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727102; c=relaxed/simple;
	bh=78aEbAZcx3mKP7facMIGohoywdi1GimEciZEZX6ITRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9xHlSY2cCODIhTj7rWbn2AQh8odfso/apCk9RE+eXV6+C/wKkMso4Grcs5h/wUNP6z/t3u1BKGEl+D7GHWb22pw04dGbsacKyaieEe1viE9yRWTlwhMJXFMJeT5XnPCxLthEXhz2RNqZ+5UdXpavTC75M1T44zpC/0IBafvJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TTzzn8u+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D8D8B26FA3;
	Thu,  5 Mar 2026 17:11:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDcisMZDRcbj; Thu,  5 Mar 2026 17:11:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772727099; bh=78aEbAZcx3mKP7facMIGohoywdi1GimEciZEZX6ITRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TTzzn8u+XakXCn37Di5dOhpKdwGbnX1lTPn8+ZMh+sheEAEK47GRRK++TZhMEZKBb
	 7lyaGFVF1+MBn3aMeH8IMxXGXpvJ5kJj70MyaN6MGg1gFriH2PUEO7rMe9+hbRZXva
	 TX/oF4JoYTCutMrfUv79z4Q14TKIrBj+oL8RSAND3OSJvGy63T9zjnPPqRk0q8fiF6
	 R98QAeENulgZgbjeut7G5S3DOTYbmozqFkiGv244enoUQGh0D1GlQ7KbOmvRLIOsmu
	 U62GLr+3ZOd0d03uKlciF5Kuu2uq07MYNYsvw/RRTZXPtP+QoTgpBmAP/hA2JY6b5t
	 1cNOSxQbWL0sw==
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>
Subject: [PATCH 2/2] gpio: realtek-otto: add rtl9607 support
Date: Thu,  5 Mar 2026 21:11:06 +0500
Message-ID: <20260305161106.15999-3-adilov@disroot.org>
In-Reply-To: <20260305161106.15999-1-adilov@disroot.org>
References: <20260305161106.15999-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12FA721534C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32598-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,disroot.org:dkim,disroot.org:email,disroot.org:mid]
X-Rspamd-Action: no action

The RTL9607C SoC has support for 3 GPIO banks with 32 GPIOs each and
the port order is reversed just like in RTL930x.

Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/gpio/gpio-realtek-otto.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4cf91528f547..5e3152c2e51a 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -351,6 +351,10 @@ static const struct of_device_id realtek_gpio_of_match[] = {
 	{
 		.compatible = "realtek,rtl9310-gpio",
 	},
+	{
+		.compatible = "realtek,rtl9607-gpio",
+		.data = (void *)GPIO_PORTS_REVERSED,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
-- 
2.53.0


