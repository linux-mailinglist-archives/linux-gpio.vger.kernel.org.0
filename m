Return-Path: <linux-gpio+bounces-6974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D08D5152
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7BBF1C203DF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381A853E1A;
	Thu, 30 May 2024 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjm8j4Rj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50553E0A;
	Thu, 30 May 2024 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090947; cv=none; b=K4UmNHmqUWCIgwKDOA7WYXKWJQ/FZpXm/zAKpdmCz9KlV2uSI/Iw4a0Zoc+VXuhWey5UK88hWAKWEbuXl5xMwZe5I/wo+xytSrUDdWZyJGZbuXYe6xsBOIyNR4RJWVOtiq4LWf7Kd+c00P9g0mbd+BwI9sa26BCtnTk5cjI/D1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090947; c=relaxed/simple;
	bh=enrbLfIqbMgsaGiKXaUzTFdWpObNyqhxtAnxQv+OKu8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gj7okO7e0kTsFTdYABWNT9rQY69CFKNkq7krOvXh6K4MB7WgSkZJHV3gQUDMsVBoGgGIQJdsR++QT3+uGIYKdATASKyChh5k9U9/ZpAUT7JoOTB3TRY3oUtiq8ItOFdqIBaj7yeg/ojgDiLeOpaASsUhohJcWbQWLt+F7NsV8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjm8j4Rj; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f480624d10so10052455ad.1;
        Thu, 30 May 2024 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090945; x=1717695745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2tib0SqcDm28UJ2V+pduBqYa7NhxgcQli18CyJVXdQ=;
        b=hjm8j4Rj5uKSgI1kU7nMQuxVGcr2iUaoH+gxl0+esSpVyzTvXhGA/ucSO4qJ4xVsJi
         l6g5LRT6Lo+woAHnAjAWw0r3k/ld9YqtkS9md7sB9ldi+bN0cAeQJxFepFDri0itpPpH
         Yh7h4AAL9q3f6Q6k1QXjlYB7fvjIMLjUdftVNDr9TifstsOp8POXXuJuppuPnz6thGol
         eveEpTIZ6vwwDJrpbBwQ+BC7epRVkHu8Af3umKeG6f4k+HVgYY4rsiHyi0g06RlEfnDI
         BBgAFfEXkmItjm/bfLFS3IVJ0rP9/hkEhSk5hilBVrgqB5xmRV7XJQ7FDpG6LV/SVMbu
         t0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090945; x=1717695745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2tib0SqcDm28UJ2V+pduBqYa7NhxgcQli18CyJVXdQ=;
        b=plcMMJx2C3HAzreYvKKu5vuisYWj2p0q+Ilj0iwBK7maKYK85IWyX71L/T/lfPVGxV
         V6GXKccB030DbFxuaOMZ0+2UCa41/xdTmjJTVFJSNggaLD0hAd2o1BshWieLXnhJJyzu
         XTW/5oxLQL2FBu0fmJ81v8vQyiJTrZximdE97ADaR6ULu59yXmQLJ811S6GE5sp7MbnL
         T2GVrp9qZUtyxuiJkIYdmFk2ADT7nkWT2j6FsUHPzBQ+LfiBYUauIODiyhdrRAIrPLh7
         JNUd8AM5NGt/+L5V5SncGl1dghudnP2vEsEPchGsgVrZfPReXxl/ilqRAVOmoCWf11mm
         oCSw==
X-Forwarded-Encrypted: i=1; AJvYcCUzlS/9kuPGGEaz5kAyTaUf+avQWRi52ua2DYmJlXVHE0C39Z1UqUC3/iY8EY9WZjakf9h9ZRcJ9ygXE2TTCKPSzgkDJQisgDXTIOTGPeOcaZncPDoI3/93V/OW8H3d3lqe/jScSWuFu1Ru9kXdYpD5xcrLZxkXZex744b3UwJiad8H47s=
X-Gm-Message-State: AOJu0YyUjO9OHbL/KaPeDPbCtGHY7gIIz0F3LOw33qx7oF+lIN8B4D+v
	sQwegrlOV5fG2xU90YkGE1i0uS49sMvuMBMmjDM7B0sE1qS7bCuQ
X-Google-Smtp-Source: AGHT+IF49NPt3yYwEhLZK1bI0CuirM7vxrcUBJu1IoxUjvZ1x/XkLlE07vTLdsiCbkyp9LMZgKJ+jQ==
X-Received: by 2002:a17:902:e882:b0:1f3:b9d:87e6 with SMTP id d9443c01a7336-1f6192f06e0mr29661625ad.8.1717090944939;
        Thu, 30 May 2024 10:42:24 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/15] pinctrl: renesas: pinctrl-rzg2l: Add function pointers for reading/writing OEN register
Date: Thu, 30 May 2024 18:38:51 +0100
Message-Id: <20240530173857.164073-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch introduces function pointers, oen_read() and oen_write(), in the
struct rzg2l_pinctrl_data to facilitate reading and writing to the PFC_OEN
register. On the RZ/V2H(P) SoC, unlocking the PWPR.REGWE_B bit before
writing to the PFC_OEN register is necessary, and the PFC_OEN register has
more bits compared to the RZ/G2L family. To handle these differences
between RZ/G2L and RZ/V2H(P) and to reuse the existing code for RZ/V2H(P),
these function pointers are introduced.

Additionally, this patch populates these function pointers with appropriate
data for existing SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Renamed read_oen->oen_read
- Renamed write_oen->oen_write
- Updated commit message

RFC->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f8a1a1f2eebe..807851c33e48 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -255,6 +255,8 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_variable_pin_cfg;
 	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
+	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
+	int (*oen_write)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen);
 };
 
 /**
@@ -1035,7 +1037,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		arg = rzg2l_read_oen(pctrl, cfg, _pin, bit);
+		arg = pctrl->data->oen_read(pctrl, cfg, _pin, bit);
 		if (!arg)
 			return -EINVAL;
 		break;
@@ -1144,7 +1146,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = pinconf_to_config_argument(_configs[i]);
-			ret = rzg2l_write_oen(pctrl, cfg, _pin, bit, !!arg);
+			ret = pctrl->data->oen_write(pctrl, cfg, _pin, bit, !!arg);
 			if (ret)
 				return ret;
 			break;
@@ -2623,6 +2625,8 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
@@ -2636,6 +2640,8 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.hwcfg = &rzg2l_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 };
 
 static struct rzg2l_pinctrl_data r9a08g045_data = {
@@ -2648,6 +2654,8 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.hwcfg = &rzg3s_hwcfg,
 	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzg2l_pmc_writeb,
+	.oen_read = &rzg2l_read_oen,
+	.oen_write = &rzg2l_write_oen,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.34.1


