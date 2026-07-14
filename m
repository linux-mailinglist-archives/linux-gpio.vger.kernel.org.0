Return-Path: <linux-gpio+bounces-40017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nw5cEaTkVWqJuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:26:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B072F751D30
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:26:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="a/gLvsUS";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40017-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40017-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2088C305973D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536743EFFB2;
	Tue, 14 Jul 2026 07:25:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0A03EEAFE
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013921; cv=none; b=dLc1S2N2QUfCeX7BiUQ8+unrF9SykiruoUvzQkc0I148bgWHZvqfSUTsqzVlI4w3kkU4tIVw4d51sZq8+m6oG/M65JOW9SuXLTy1cVz3E+TcWnzcMd2dBLZ+mNBRaaHipRuDhmy2X+4dWsJlb8sfDI04/TCDGT7jLsrZ/SPgp7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013921; c=relaxed/simple;
	bh=zNudPnZfpECzuygYS5dd/9YFmWl70aaN+xMCCcjfptM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhF+fFIOTV+tjz0Hvte0ucIhPcDCgr/5qE8J0YARARD84AsI1LJY3Ge6jlvzQ+0K3dZloMV4DgY5rXVCAIIfuN+DBiwfC67/fbSbpoxEI0IcrgWGYCstdv+RSSp3M2SqNPJ23RT/M89VxEPRmdY41l2dUOjbXiIGeqG5622bqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a/gLvsUS; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b1710405so20871885e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013918; x=1784618718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2djTFedTjPysCreoUk6vChsb1jrTfwtD6lTerjagjV0=;
        b=a/gLvsUSd/my59gzZbOn7fvWcKIR3SxXE9riJaQdFgUygoEFApnmRueTtZZ1KkX430
         tIkUmM9QD+ZlzO7NfI2Sxlha55AbJeoVGjY3naV6KBIUUhMrKro8HSjM9xCG+hbx6jlg
         Oi7fEnUSe/9586WIKYMOF+CxwyIwNz/pUON5D4xrCPyUjlz/NcfqxqxUabLtP96KtouI
         aVIgLut//VpK57uodWvP1nHrk/fbeONX0T/l6fSSsSyGKO8UbviTAhD7H0wiEgK80CFS
         ZVEVT/aFzV6sR9vGeWYSkmEqP5Sk4QvYLI0CdS0nCKM9NuiAF309iafNw7ELmMHpAUeu
         KM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013918; x=1784618718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2djTFedTjPysCreoUk6vChsb1jrTfwtD6lTerjagjV0=;
        b=pIrkhajlEb/5cW0EoHOY7R9DPImVf8RXctPtTgANpgKIujcbJaLqO5dFrxHUYK4qrO
         s/tWoW/Ricvlb0NSu3vLPk0fPZqhVUR1Ivi9WSGnI0Ccye2PHtQybhLrPrJAZig2xazh
         GO1XPHgccN3sDI0CqBX/ELZWkiXdq3z78oEFZwFS6RMVI7rBIvQEFwSoUbzOlMhs7dZU
         IN7BbV61LF1FBhmRS0xKnXKkovX4tSAMfD2XeOBGx//gvcP82t7n/s/hv9Yi7clEH522
         f8Qm/xlkHqUhfGmtA4ODjRHxzbseCEaQDepTCCp7HlpNpJqKS0sWhtD3KDtET5VHsHQZ
         XIMg==
X-Gm-Message-State: AOJu0YzarDTWr4gxTrcNOZO6AA+Ex/s0TnInKBLT0tQ0WCJODwciK1BR
	+s21ULoSCO5P9DyaVF1tmREKGc8VUeh4ykw4EB9gvCU2zn5JU+5vv9m4leLk4HWaMZY=
X-Gm-Gg: AfdE7cmiEBctviXOboaExS/4po49/MlgSVakmtFy546/i1UoUHUuAKrWxmx7z9qzRHx
	QwzgDM9kI7p17iPDdju/SlGbEZrIomjtwuzseg0boqFzxt0ba98taKQ9XJc5C6MaKwpRDQwmhto
	ztl+MoAY9gfJqUxp1opkvzjOda3T54Bz/nCMZ2ghniex3+I8B/UW21NuC3oOZP3yve9rnYW0k3m
	/C2/DD5uS7Z0DF6G5L453TUrxUZek9kIWmDIMPMeBdx/8RZcM0a6SnsMeykOdF9AQfikLL2Nkdt
	362WIJ2BxkO1LKE1QgDXLlVqAHNSvmlxKYFhydEDW/Q8AwEdDLNswK4gaghRdpm/nYOUDbG2vAW
	J4Y3khuSUm8x8Z3CgxvaLKTcOL6acQ9g8NbMRVGBAZvcmzxEjZKpmar9BmLiq7TYpxSlIiWy0cd
	Lx9yMzLnqpBz64rHP7DCrhNxtB0nDw57psNct6PwbcvWMjUUn7/sohulXQlqFWA6MxCoO923eKc
	bm6
X-Received: by 2002:a05:600c:c04b:10b0:495:21e7:fd53 with SMTP id 5b1f17b1804b1-49521e7fd96mr17309375e9.18.1784013918023;
        Tue, 14 Jul 2026 00:25:18 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495086ca93esm54134645e9.0.2026.07.14.00.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/20] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Tue, 14 Jul 2026 09:24:04 +0200
Message-ID:  <8faa34e82a46ed01bd59829e590121e95614f821.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zNudPnZfpECzuygYS5dd/9YFmWl70aaN+xMCCcjfptM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQjht25zpssLO+5PH4ggjbFRdVQ/CngLHL6g UDpwC2g7LyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkIwAKCRCPgPtYfRL+ TmLdCACUss6Lv2o5wFHtLbfr1eTNC2rgMJ5XWOHmgizZ2+bQO6ifq+3ZQAQ4myhrJa1t3yDSzvS eQurBbhz0QBdxn6UG2BvmvsJNWbZFz7FxSvMrl/Watkz+IC5J53k3Xa1zkowBK17hMSAGSUIXF7 JWf+dfhU4dPMPIr43ojqjWROSSSe2Nc3WwRVwWoU38BzlNWH0RVd50gRCAX4vIMoBwZK+AcPFK5 CA4f2+YXPJtPFep2tb5C7Ow47/HpS1PLgOH+8aHuZqLs7JGY1xj+68QKxV+26dYjpwqbjG791iA WmGRoUo8XFsBVrqNoa98YAhy+6R4Zp5mNt3zUMDcudXjm1oo
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
	TAGGED_FROM(0.00)[bounces-40017-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: B072F751D30

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index e9c531eef452..6928241c1d19 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -813,8 +813,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.55.0.11.g153666a7d9bb


