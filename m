Return-Path: <linux-gpio+bounces-40031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LxCdEL/lVWotvAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:31:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E7751E02
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:31:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="kdFd6z/1";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40031-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40031-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8715C305CEDE
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB413F787B;
	Tue, 14 Jul 2026 07:25:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A073F0AAC
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013947; cv=none; b=CVEuSKpEdmGcxnPZdPDBAqHIv+qdy4+jRSz19AChde++Ghxvw+sVSuSUFjgh9/Vmf7uqaOdTqu940sAu/4iAs5yP9pY6vj5HmIuZ3HYuaf5cliTN4J7sBWYMuyBNG9abvOEB1k/Oq9voll+8qV886mQUzf6loMjZkgjOKjqetoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013947; c=relaxed/simple;
	bh=tlhpfxWNLfu1I4z7wJOpN0fnYBl00+DJVsJb0YfBZgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rb2EH2vpU8spKou9HquUCi5vUmmRP4fiEv2lZeVNr7JHqxk7EAyoP/ht05BqbUARYJ+qV/Dbha7VmfYhb7omHPJ2k+AQvFXLGU01e2EE7qljhfgohV3xWoKzIlG7DZUAcR7EQvtlxHxqLjm2lXydlNoZSz5x39uHpYW/5NII26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kdFd6z/1; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-476d8e647e9so3945260f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013942; x=1784618742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JJCgbulnP4Nf9RZygKfTbaFY/tGF9/egVfE7dbW2pow=;
        b=kdFd6z/1+6esphcPG6pZe61bAjcqvEmw/IbkyhdOwvYcn/ueAcSxPd7Ymiio9NxbNu
         FAuOBZtTnVXafsugaoPnip275sMvVgDzIzxXWmWTbzg+07GGTnv4yxIEl2p8gfYBCO5G
         1/IpyLrDC5VpvhrKrmQQah9jDdaDc9aa94isdeoixZr91R2KRbQVZEo2kb/F3Z+oCc6D
         iYXzpYcApAKgxPhjPVpK3Uog0YYb2T5OTAUFCSy+5bo7vvVpU9gykYyx4lj/+hnUTsex
         o0iDzxga5FVg/IiG+Vlvqr5ohPfDVOQDi9Tna1Eheh82Isv51S+qneR1w1a0e7sGx7G5
         vlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013942; x=1784618742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJCgbulnP4Nf9RZygKfTbaFY/tGF9/egVfE7dbW2pow=;
        b=rCHhN8+WA6Arrqyy4S6XSItalCrq3oH++mpz2wvjXxT0wOfYZrSdi8tPDTSme3va+t
         7S2XWcJGoF2dCLUTYSMxd7aSH+4CQwLuz2ZpSVR0Z3JEVozRrp1+tQh9GaxlsDGPg1mQ
         wOJKUGkZGSQcRCbpTtejGHPr266kuP7p3nc5uMn3N2BznEzw3q73GflLth45n/XzzBkD
         Gqf9RDDHXOms4Ky95ro+iIqoruAfem2R6bHmAmgl86oyBOddGB7Kolumeiq+PgvFgGnp
         RUrPxF1yC8vv7bnbcdzOyEfPXUrjaHETQXMYl7nmkfxDvztEjJTHvP3BRc6nrCCDHtZ/
         v8+Q==
X-Gm-Message-State: AOJu0YxKhwui655OgcrI+RtSArspx0FW/ReUVhTCToU+lKIEkjlxt5Sv
	IPgn/w6nJ2QcCcMTVKvoP0mSA+CKkM7GiAsb0Loh9iELG+uJpHJlMAe59YoGIOyfi5o=
X-Gm-Gg: AfdE7cloczTawMSQrm4qStW24jNgk1Nfa3DU7rstPnqSLYihqr1sOtrQh5h3/87vYJT
	4nCj3TtaEOgX6B8oQP6+XBvFc6/70Pv/A6ox5yEc3CIWkUa/sYajk/3Eld+TLaPGoB59blYSxlp
	tyPZl6NbA8BeNIFoFS6yvkHt0WJ/DnLwZZSXaB6PoIq6ZfmfMn0HKAlSKDkVJJWfn5ZuctTmJcv
	zWScQRdftXbQBp2hfRaT8PCYTiFA4Y+mZtoqvkV64DUqIrjUXTy2GssgKlmV6UJjq5Ym/AUCbYN
	EkE5G01j6cwxCYYOsRloxAwVOU01HKc3V/RpL7FeKYSDSDLYrEqs5SW2pqmHYIn3qPDIViFNfy9
	IJoaI3dDFw3YcV/S+/MVGnZXt/Q/NWAysv/uXytnwbMZlfGu4+nqDDvGAVubf1QJ0WqRe6E+WRQ
	6Dc8O0ujFdBrymGBwXoTnp3sQYJ4V8A8CYMzpZA+X3T+froQZ0gkhU2R8ma8Q96F6YtV4RoLa06
	/3QAHBptriBgzw=
X-Received: by 2002:a05:6000:4a1c:b0:475:f0d1:eb6b with SMTP id ffacd0b85a97d-47f488c0145mr1418924f8f.56.1784013942562;
        Tue, 14 Jul 2026 00:25:42 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464d6fa7sm5923695f8f.37.2026.07.14.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 17/20] gpio: max77620: Unify style of platform_device_id arrays
Date: Tue, 14 Jul 2026 09:24:18 +0200
Message-ID:  <cda5dc90ffd8d73959cc77b40196212e61f87577.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tlhpfxWNLfu1I4z7wJOpN0fnYBl00+DJVsJb0YfBZgQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeRG1v1B/th8HuaDKvgYG8yhpcyVPbOeihhnV EYcVJyPGB6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkRgAKCRCPgPtYfRL+ Tj03B/9lCny1oqwPwfgZEZ7h1FPlX5bzrQMt7xpSwGMFAXrnl3mipEVK0Pc6JKwJDBItIhpyt5O ALpo6BL/lz/PonQRcoJ+kQTwYIYcuo2S/pedgQjcoc8fJDxK3GUXik4REs1qlKCDgqsQygUnWNH fUdA0R4VSPqdVBMoz4l+F0mjf8PihE08XpKOwmZQEPaz4/P2jOYGWQHrXAZ6ieQWc1SMjrONH8l d0fjrlslhFVF799TJg6eXLrnQoWs0BVED5jtDaL5flqcJEucu53YlhljxqRBGBSugEHZX76cGEX Olw4K3CAvd+u2hipHGgcG5aUl7LgGrGhQhINI8c295hR8Sfy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40031-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B3E7751E02

Update the various platform_device_id arrays to conform to the most used
and generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the single offender accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max77620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 2bf3b55a61b5..99ac7ffb650b 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -365,8 +365,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77620_gpio_devtype[] = {
-	{ .name = "max77620-gpio", },
-	{ .name = "max20024-gpio", },
+	{ .name = "max77620-gpio" },
+	{ .name = "max20024-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77620_gpio_devtype);
-- 
2.55.0.11.g153666a7d9bb


