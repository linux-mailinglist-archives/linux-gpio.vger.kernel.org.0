Return-Path: <linux-gpio+bounces-24438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C38B2825C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 16:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37F447AAE13
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7005C28688A;
	Fri, 15 Aug 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+RmTbvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A5319854;
	Fri, 15 Aug 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269275; cv=none; b=oHR13Jc2Dsu+IcyCGX1ttk0s/dTbUOjE9UTVmUN5/sWMJWTWRyJqBeGqdMfZGiogElVbQrWknZ8yLA5qPy0lrsgbBPBd//xqLauSIKSX87DyIK5Kb5su6eNH+2di7C4VMAZ3J4B1+dBPLfNXN8Rkuhvc1cXzN2nknNaPeGrO4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269275; c=relaxed/simple;
	bh=nBXn7yVYMkSx4b60bEYQOp+B4EZdjWHoI4Zz/73vbdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4W2xDNRyCOXaYbcShQfSeSXzFeQGbBaSuunno/JkrgpLJXLeigObrxigenXZCzOlETvINq3fOd/FdvrcNwFOfBXvSywca6YsclkCjE/1yl/ZszChLtmgvEeQrb9Vra0XG34nD4a+9O2MKBXmj3S1ZE6Ez2EcKa0n27DmdssKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+RmTbvb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so10494095e9.1;
        Fri, 15 Aug 2025 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755269272; x=1755874072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA3KYLpM8+yaayWTSXitViix5ADQAQVASYCjh14zhE4=;
        b=T+RmTbvb2aqGG1bGG9kV1fUNAsG6kXrqxGx6GopTOkGoeW8kStndvEggM3yuzPF8R3
         6KqHNWgF8/paau13wlUN1vbfzgUoVw0JTGrJB5X4zVfMNzXIR38uDoYpfBSpHUaXUry3
         yTculjIyGJuQXUiY+N8xMhXpig/VO7bUvN6MMrKKySRwhHfOgJfeMyxltDSUOyISibwA
         aaOjpjc25oZwq0EB4FUbv2MiorwhkdlNxfnfieyafsKatAMTX67+ElLixMUU6B06f3rT
         er3DBJGgo8qDJB1DtdsN4HruWO/TXb0PcdqavTtN7XIad+LiakvRtu+ts8lW3FVQfwdx
         q+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755269272; x=1755874072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA3KYLpM8+yaayWTSXitViix5ADQAQVASYCjh14zhE4=;
        b=apkvRQaQsCzjrMYI26f/v81o1ZRiPyixHhfApzxnlhITFC5uuc1eQowU0whyYWFNEH
         Jf4TKYCOz38Q88Rn3jZIfW9kalK8NyvEPjfUuCli8sf0Heeo1CrvdwqIC+6JD1njNRPe
         sO9dXc2OpDJea3wKqha1uXimcNLI+SzFHf83xvyLJ33+D+uk/lhu+o9fnZe8TEQ6/eYd
         EwKI1hjPY/YoYDsLo2cYnmz3dGWCfgSODHMpBXnDbdkd4AQXnVJvwdDKXnqDvCgG1Nm3
         6+fC+MjMIRBt2jF8QWvEJ6T+yrTtgwrO8HmljWMxbQo+/7CCF3lKH1vtwOkQp1gu2fJA
         dq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9qJo1+pSAhSw80hzsqbPDtlck/clapDQ38qY+1Aeu5nMGcDTMA6JSWbK6GV6fBDJ7vZ/u3NSZz0Vb@vger.kernel.org, AJvYcCXLelH1nnxkOMukCzhdBbIeDSZOniW6vV4Cvx2Vo3Z0YlxsHdzoHE6omd522ryVDkcfeHz2cVkSgDjewMzO@vger.kernel.org, AJvYcCXfbB8vO8JzpvoOKkgvHIoba7u50ftDHfCUzW/SS/T4/2lsYIVJhl1vwT0BjwQGQ6JvTu371VfYwONQiIKK6UR1jlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8cUgeprlyyzQ2xeFhiym1K/mT8509Te6n3JYLcL3zja3oTKQ
	ZSO+XFLcDlOBQjqt8Yn9o7amy4a9Hrfea3exrfQZeG4rtPt0Df2qfcdXdXHMBNgt
X-Gm-Gg: ASbGncs8AOfEOvLBFHHrlQwpMtUAKO48twK6JhQLnStj3r6/pXa1KhYamYZe3qs/WpH
	blLcpPvlfXO00ZLXAMx+8nT7I6fUTeiOD89wOjJWeHBQu8qjLhbkN5I1D5r55AIXXeKlxX6LSIH
	g/P4r0RW8cxchX2COR3OZCMbM+lqlpWk6Hz/OHoO7/RsAUT7c1O/HWHamRjekqUGxrPM+8EGiiv
	pdLa40aDguyBaFvF9V6aS4CUnTQRl9Ckj4KoGNFGnhTg4RLItcl53T5b/ZgD46EnMimcCpvtsq3
	yF1vsarGw9JUkcqnWFyFwz2okJVkTFt3B1B2w45crabEoyChZORNCSkDdqyLfudNeWNTnoEGtt/
	JZo36sz6JTFSbDwjsXVetxxB1Ud81qg4hmQnA9NCHeWQgftzLIB7HjaAojZO0hGZipYUuliMhfw
	==
X-Google-Smtp-Source: AGHT+IF4AQdv8H2Ubd0KDc3eR4Bt0X55d9e/goG/kMWA/tESJPnsRm3HrVLqMRbdTHcnycwj+TX7JQ==
X-Received: by 2002:a05:600c:3512:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-45a2182f231mr22466455e9.24.1755269271424;
        Fri, 15 Aug 2025 07:47:51 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6c324fsm59523755e9.1.2025.08.15.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:47:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] pinctrl: renesas: rzg2l: Fix OEN resume
Date: Fri, 15 Aug 2025 15:47:44 +0100
Message-ID: <20250815144749.143832-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
References: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The write to PFC_OEN register is controlled by the write protect register
(PWPR). Currently we are setting OEN register in resume() without enabling
the write access in PWPR leading to incorrect operation.

Fixes: cd39805be85b ("pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b182b3b8a542..2b5d16594bb7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3165,6 +3165,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
+	unsigned long flags;
+	u8 pwpr;
 	int ret;
 
 	if (!atomic_read(&pctrl->wakeup_path)) {
@@ -3174,7 +3176,15 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
+	spin_lock_irqsave(&pctrl->lock, flags);
+	if (pctrl->data->hwcfg->oen_pwpr_lock) {
+		pwpr = readb(pctrl->base + regs->pwpr);
+		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	}
 	writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
+	if (pctrl->data->hwcfg->oen_pwpr_lock)
+		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
-- 
2.43.0


