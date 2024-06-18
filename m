Return-Path: <linux-gpio+bounces-7553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AC590DAFF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 19:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C36283EC8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 17:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C739A14EC5C;
	Tue, 18 Jun 2024 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hixtjw+W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C3146A88;
	Tue, 18 Jun 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732936; cv=none; b=oB9aE72ufEILP+lsXSrrLtwGigMjsKgJ3T0dWeaVmukxxuzSDthqujmQv8g9w62QohS6AVjcPECgm9mu5XwCJz04abQ/6PHu1tZVHMDB/1EUlx9S/7TOXJjjzgUqceTvRNyOIBTCyoP6GgzT7s3ba4y7BDzo40h2gIXC6djoz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732936; c=relaxed/simple;
	bh=/wBiLkEL7+t/VFljDgwVFcmYJV2Hk3qjaknqUhlnDAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BI5+5kJChDxz6PhjWLg6xr2zHB6MUcu4LMl6ARuZgJmYGj4qr7VIK/CLjHWOKDYyqsbr2TKoAvXckMQczoxkMltPch/laG/fgu+cU721+fagsfEQg+IGD5K2WdSUQ0jGSZ/pZ1PtGqdk+w0SdRcWai8nrcgw9qGurKZGnepNQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hixtjw+W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3632a6437d7so23978f8f.0;
        Tue, 18 Jun 2024 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718732933; x=1719337733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NRB5CjU3SzHKQcYSbbNeKHS7sWtPJ8LEgipC09I/9Y=;
        b=hixtjw+WPl1MDECvyMeCJW7IJe1OVGdWLCCzsKbZHxHRgv2gcxGPKVCukQ7IzC0fCP
         wAZAPoXalW+JUkzUAGoNVXzh9jKSrWsShzwnTt8E+Px+FstkxG/Nzu+BjqcbW/cn7Me2
         BZG8ZmiODfZqv9mUr6S0M6wawQkJ4QhJCHhIGR6UGAj6CFb+n58e9KU/zgDy0W3Cnd1n
         jPMg60FMR1pgc0NVt5z9/xNsbRqKQTqP9fbZSgooral3k9krTZYkmJuLIfsmq9kXrcSd
         zxZP3prkMlNMMGAuUUxaoADLK1qONyHnCsuXULu26F6t24s9auMh+STNzAuZ89zwNe0a
         H36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718732933; x=1719337733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NRB5CjU3SzHKQcYSbbNeKHS7sWtPJ8LEgipC09I/9Y=;
        b=KmgpRrxy2Bpt3vtXLzLtOovldYlBcnv+Tn1Mmvy1HEHQNeiJM1C+3xFV6+0ktlr67X
         R638s85yBjd4MkkCksIL8tw0rYZxdj8JIwahh2X7DGJLceeVLui2vFarnxdbqc0uk/j0
         tO7U7+yzKUWvJN1KF0DRi3mWzybkCZQcAHBdm4GcxZkK9zOkuZtHT/qdi/+BWGN2ByJ6
         xoX7mDCuerZjCwGFBhAxr0CDMBASHUytTKi3fh5DO781aqG824vcujs73BG2mzeIZKps
         kF3qjpOUvKOkVUY8U9I/mhtWWSjAAE9fjotzAvt/w3QGwQl7w3k3zBEKpm7wmLnyf05x
         uXuw==
X-Forwarded-Encrypted: i=1; AJvYcCWyZ7XwrZ3TA+hnNs4K/g8A4EbBzBrS+8X65h0zdQC9yPWoAJPOL+lwGFscSLvpDyuB7yTsRS1elIP8YD6Uv5OIl57lksneJ4DJSG9JWFUEyBLMwQjV75XNT4D+xqQUNIEot2ZcnlusXQ==
X-Gm-Message-State: AOJu0Yyb2adL5ll4GF5rx8ebstwvmeXCVONXhlCoBhCQKMxem7GokVIO
	m9FCyQzv67fdoF8iOCCWf0adinhalI909xGOvykexaBbNHOB2jaO
X-Google-Smtp-Source: AGHT+IEO81914l+l9VHwW08e5/YQkj6Qi+kh58InUi/mkEL3/n/cDSZ7kkWNjUVEgQ92h4wtqfSPxg==
X-Received: by 2002:a5d:6c6a:0:b0:360:9ed3:70bb with SMTP id ffacd0b85a97d-3609ed37150mr4060432f8f.2.1718732933300;
        Tue, 18 Jun 2024 10:48:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:d6f0:b448:a40c:81a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36289a4faeasm1253644f8f.95.2024.06.18.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:48:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] pinctrl: renesas: rzg2l: Adjust bit masks for PIN_CFG_VARIABLE to use BIT(62)
Date: Tue, 18 Jun 2024 18:48:29 +0100
Message-Id: <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Shift the bit masks for `PIN_CFG_PIN_MAP_MASK` and `PIN_CFG_PIN_REG_MASK`,
to accommodate `PIN_CFG_VARIABLE` using `BIT(62)`.

Previously, these bit masks were placed higher up in the bit range, which
did not leave room for `PIN_CFG_VARIABLE` at `BIT(62)`. By adjusting these
masks, we ensure that `PIN_CFG_VARIABLE` can occupy `BIT(62)` without any
conflicts. The updated masks are now:
- `PIN_CFG_PIN_MAP_MASK`: `GENMASK_ULL(61, 54)` (was `GENMASK_ULL(62, 55)`)
- `PIN_CFG_PIN_REG_MASK`: `GENMASK_ULL(53, 46)` (was `GENMASK_ULL(54, 47)`)

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index bfaeeb00ac4a..b79dd1ea2616 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -87,8 +87,8 @@
 					 PIN_CFG_FILNUM | \
 					 PIN_CFG_FILCLKSEL)
 
-#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
-#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
+#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
+#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
 #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
 
 /*
-- 
2.34.1


