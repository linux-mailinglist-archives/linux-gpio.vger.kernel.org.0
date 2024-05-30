Return-Path: <linux-gpio+bounces-6971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D668D5147
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 945C61C23029
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C11F51C4F;
	Thu, 30 May 2024 17:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8o+K3Aa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABE50A6A;
	Thu, 30 May 2024 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090932; cv=none; b=aDekBS9JuQpLdUy6a92j76Sx2tkM+5pnPfoMZyLCtx7BohIhui9rpBPjGHmR4MbOB/BuZ+A2KEYQHESuQshLOXJ8sSog3kyqt4GiWPjjJpPx6KH2bUYibqCMUHggs23WzfhU6Mi3Aelq7KShRlpNcF4mz2KEw4VCmKyrEyNti/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090932; c=relaxed/simple;
	bh=QlCZRFkms5XUxZAmvyPgDgpBTH0swfmIc3PeTlj+X94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DHjXmr+/frJStmx6pYhqjODc3LCy+3C0GoFmNLxAvrP5gF4IckRFsneKfPpDsGHCUwq1MLh23aW6n0lcAyiZmjyU3OeXh8TDqlxWY4zz0+tSblWe39nYSKogh3S9lvOmEz68Snv46+QJm4qF9ZXwkK7mVR5tvBUoP3hMCf+Fue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8o+K3Aa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f6134df05fso11069935ad.1;
        Thu, 30 May 2024 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090930; x=1717695730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vvOx144hMmKcZJ7FyOqeEE7A5/8Dx8/aLcbQ4I2N3Q=;
        b=F8o+K3Aal9vKH7ziTUljBfgy3i/kHlJmCMTkMkqcATGSTtIwZFi2GIM0Mfd918+4Rg
         5jkHkAhTfQKV54MP37GkE0jLTaoYJ1sslImGA4B0ZJmnWBJM/ixRn9RobIlz8yln/IOg
         DBVGO/vch4WlvtRWR8FtBAz5fdl9I4s+rd0PmCzdyR6uhIaK6GvLcOJNK4c0UZIjZkN6
         tHDz8HN8Ul0Fy+IH85DJvGIsehT6lr5pgQ52MesgEOrFvLyCO9akjBg99yxIf38hAOfp
         dTeo6dQO1RXcXumaXBHa90Ru5l5PFCJFkmHrBDjJXYaQy2POrafXfzkmk6H4RF9QQ+Jq
         aSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090930; x=1717695730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vvOx144hMmKcZJ7FyOqeEE7A5/8Dx8/aLcbQ4I2N3Q=;
        b=I6Li4hRgvXxbx6nhb2g0tKlSQqix+W2oNfSVUVx1EjrMIZNGPnJ9JF7kL3T9XWTvqD
         Zz1YrpovBCa/Vf1iKhlJbi+FWjk33Nn8hn70cvr5YiBZf4flzEA5cHzk/WIOUo3FsNNx
         8e2H8Cox7aTYRWnfsWqiPuY3veqlfZq+2t7vk2OAGpYwzmw6mu4IIpfNNAZ1mmxrsXUB
         FCRHb/jOf/fXjWETbRdKQcvTLnupsM5+iBJvMz012ynkbvRlGpK/bSBrLoGNSgumCrx8
         EZ3yV2O0CZyOX2nukLzCF12vMIgh5ckAQuD7ccVgeMzPhjO+mj8Qc8+DAD6CH1Vp36HB
         WnCg==
X-Forwarded-Encrypted: i=1; AJvYcCV7tu1I/Y+eNXx8SQVRutM7zX507MU07YHUbOg9DoENR5JhU7I0GvwsM6UyfnEGt0OqsEWbYQdcTsx+tJ9xCu6Ir8rIIK423DNN/mwvHupKXtVa5Rq0t7lZkQG0V8vfD6epp8e1H5Kb4v39pUagmUWt4p1LfR4NVDNUgUNmGKf3IALb7Wc=
X-Gm-Message-State: AOJu0YweBoLW1Oq7ziWXwi7sOIddMZ1rgse/BiaPd6u2yi9t+PABb3jw
	JnCFZ2aV2AptpFVyFPB/n+nNB3dQK8uZjHbWCAaA2rXVzMUmGXFR
X-Google-Smtp-Source: AGHT+IHB2jCui3VjFPaKI7PloPrMkVVNvTZtPUdvEts5gXqfvb/mn1hYNbkWCZztahbizn29JZX7pA==
X-Received: by 2002:a17:902:dac1:b0:1f4:b12d:e282 with SMTP id d9443c01a7336-1f619602478mr33686905ad.35.1717090930199;
        Thu, 30 May 2024 10:42:10 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:09 -0700 (PDT)
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
Subject: [PATCH v3 06/15] pinctrl: renesas: pinctrl-rzg2l: Validate power registers for SD and ETH
Date: Thu, 30 May 2024 18:38:48 +0100
Message-Id: <20240530173857.164073-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On RZ/V2H(P) SoC, the power registers for SD and ETH do not exist,
resulting in invalid register offsets. Ensure that the register offsets
are valid before any read/write operations are performed. If the power
registers are not available, both SD and ETH will be set to '0'.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag

RFC->v2
- Update check to != 0 instead of -EINVAL
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 89716e842c63..6e3b1adb95f6 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2503,8 +2503,10 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 	rzg2l_pinctrl_pm_setup_dedicated_regs(pctrl, true);
 
 	for (u8 i = 0; i < 2; i++) {
-		cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
-		cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
+		if (regs->sd_ch)
+			cache->sd_ch[i] = readb(pctrl->base + SD_CH(regs->sd_ch, i));
+		if (regs->eth_poc)
+			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
 	cache->qspi = readb(pctrl->base + QSPI);
@@ -2535,8 +2537,10 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	writeb(cache->qspi, pctrl->base + QSPI);
 	writeb(cache->eth_mode, pctrl->base + ETH_MODE);
 	for (u8 i = 0; i < 2; i++) {
-		writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
-		writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
+		if (regs->sd_ch)
+			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
+		if (regs->eth_poc)
+			writeb(cache->eth_poc[i], pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
 	rzg2l_pinctrl_pm_setup_pfc(pctrl);
-- 
2.34.1


