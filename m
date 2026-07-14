Return-Path: <linux-gpio+bounces-40022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K3ohIsTkVWqYuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC54751D4A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=O4V2c+CX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40022-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40022-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAD7A301EC1A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96483EBF19;
	Tue, 14 Jul 2026 07:25:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7D3F1ABB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013930; cv=none; b=n9DJhdzW42pK6NTwWokaVseQFSGsAbf46AlqtJr6cw00qd5vSFmIt9DBY4EzpTlS0BhQq2WtDLVLdtKyOspHW1PRaIYx5W3B7rOr7JOWJK0hy0GS2iRBW+R0OkNoEMahzbThkEW1gyx6pnsUztFFvVJKinJsywcr+7+gLVd2JnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013930; c=relaxed/simple;
	bh=bkwlINiazla+tZRSHtoxnsVLP20L2oXwibDxhkxj7js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2AYANgxemNYsyzgOn4zHSSl+ysuml7yIQFOqeH8C7bKSqqIr/KAvziwlE3gw7VsZA+tqhA7R855WBxsqqIhxA4QEK/K2iAe/4Y/ZagYoKoLYY8iJhwFBiRSMKRiUHRopB4yD/Zir8w3btg7zeuelPFbsoVXNZgNekD+NLcvBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O4V2c+CX; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso27255625e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013927; x=1784618727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WUteuwME2uGYWU75R4Isd7MT7Vc8E+akRTgRNZu/pPU=;
        b=O4V2c+CX9Zszy4+3u46KOalSuM0mwMTsjNG8mDYcwBkf7vQgDkiy9awAE0plWzjhoc
         +S9GZ14U0VAOWdsMAzcwfCQgU5oS6f5gEpreCBgxtiKeVIlBn5axi4dOfC/WLzG28sJW
         CarpG0VeoUjVC2Uj/X8St2YBga3/trWPrjVgrtT4AyWvRqCpaMT/eTg2YGM9oCMSfTSe
         Bl/1z4b39sI52RjV3GV0OhXKQRE9YzSsKS10RFPmMM+WGcf+v9TdTeMVRh9GnGBnrROm
         SXfv+FRrD94sivY7mXc6WqxjvQuB7Ea5E+3lDMIc0XgGzzWaCLFRrAaOMr5PolrjJHb4
         6/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013927; x=1784618727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUteuwME2uGYWU75R4Isd7MT7Vc8E+akRTgRNZu/pPU=;
        b=EDkIEx2SUlwj2FKfqKu02get1UW0ECcsaObJ7YTZvkL7YIR2F51RfxhBKmAr7xgBDi
         kiHpVuJUwWzf2j3M1uVXmK8dqjjeVPXR92r3WX3lgTn+vuUCpqzqhebQbgd6bvYLCR1N
         6SURqL5GDMEmxfJ2NaSNi1SlRFOmfPxLkkWVlASsaLR9xaBJwPZI5SZYQXNdEik1UZZ3
         c9gcsetc+Mv7t8pHH/ZfC6ta0ZsQl8X36nM5PjdRlp4v2ftmodFGzVZLBgmzoql8I5uY
         qYDzUY7m1ZSJMRkBuPzug2kRDo2quOKBNhr5IfIxIgZPZ0dOaxdxldLjOf1imJin7MZN
         e4UQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh/LzPbqbc9MPvo2uyu/afncI4XwLN+0/L6dbxQSwG0/1j5DOQKkYovGdAIXZmEmcXDDURawc2TGDt@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9X6YoBedd3MDovggOdLYmd1lE66xqcQWCtG11rz60PDsR/Fj
	VGJr2PHk8rA4/42GF0DT6kPCauNsTAVyyq1fwpfufVADGutlvi+4j0hKpYopGHe0zYo=
X-Gm-Gg: AfdE7cn34QPMVwZBrxK2sC9Z1+fo21Frg39PcInzonO7p/S/C0z7rp5u/wNZVKaTUP3
	9jr+E29dtYDUO3Ur5SEc+xYvFa+Pck5jxjjVnIjpFjobJmPPLhcVrf1sHcnhFVeTaX0GFfLtB9q
	7y5lebZd9ZA+yMaC2PHz/PEyA1wV6cOldkgF1c+fhxzdOq/kJmXBJ0Gya0hC0ZcD0mHon3otuCH
	+PoRvhcUTZc2KGPEoCKcE7HJwfWhsZOVVQUBOaUqs4N/beQRGaahHC4Bv4UbkGJSbUPF2m+07Z6
	N29W7/mWKXhcf9duDdSCULGFoAvUN8xrVWGpCBPqthRyTa1Jb+ag2eeKw1CGOhckOuoUFoUZPRU
	sp2VxVtOabXGmMGL8b0OMuE/oXnNwaYLJ7UuTX55dIV9/Pvv1kiofm+mCBFLxPjDLVVLbcEn5ac
	6Og17biovwReuP/OMwuKc2OVthgor5SaBiqH1rWgQtZH5KouPX0suLCvjRQs3N+1+G4Fuj8aCfB
	gYd
X-Received: by 2002:a05:600c:5392:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-493f8826bbfmr121147925e9.28.1784013927447;
        Tue, 14 Jul 2026 00:25:27 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2dd8376sm210228315e9.2.2026.07.14.00.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/20] gpio: pxa: Add missing platform module annotations
Date: Tue, 14 Jul 2026 09:24:09 +0200
Message-ID:  <4549e409313d4781714cf6fd28302c04e3a4164f.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bkwlINiazla+tZRSHtoxnsVLP20L2oXwibDxhkxj7js=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQvKuA8ovccN5tLhz+Y2wAG2+n+zwCLNHh9/ xDEmTmqp5eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkLwAKCRCPgPtYfRL+ ToeGB/45Q0i0txkjV3tV1SCPK0vMpVb8duQ8bnp8RYEN0lrV35+Q2XuGnWbt6gkYUgu2OZHoP/g Oku5IFXOb98v99pSp9pvOgIlj+QlPpJTykVuo+zgnrN/fcj8rYlYLVwk51cQLRCLoDWLuvKQUrp REB8RWRMoRCZbxKLmOU3ktj3RY01xID+f6VWgv0usNqhMRbCwcVCtTG6gpMDRNwh5Vk2OyMQ9pz 3lRCUrn593hBy2JvWZTe2hMZFJqcPpzWX1sAK6QA8BQoKgk4Ti5xz63zY75o+8xH2HHMslFuF11 Epy/zZJXDP4Jvok+UzFySp4UXakiM9HhT19NFzK+PnvbJpAT
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robert.jarzmik@free.fr,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40022-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[free.fr,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFC54751D4A

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 317e3bc925eb..7aaed5b30e7e 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.55.0.11.g153666a7d9bb


