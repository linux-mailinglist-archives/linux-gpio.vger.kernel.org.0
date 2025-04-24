Return-Path: <linux-gpio+bounces-19275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9EA9AE99
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 15:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6805D5A2342
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C117A27CB27;
	Thu, 24 Apr 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4Syi+n9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F227B519;
	Thu, 24 Apr 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500332; cv=none; b=E87VPE76DL+5mOd76Tz7daeyyZMaAQZ028bkW2OaAlCT6lZvtsBiHMHU3z3VE+hrF3II5Azs/PdSkzclDShBPD29/hhdJDA/QGxkO5ESueIpNkC/0gg5SR9RrceCm7YfC6wZQfZ1pATXiUcaXfMCKoz3dIvTwMHXL6Ng/9r0Hw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500332; c=relaxed/simple;
	bh=3nDIo3joo5hDVTDe483xOqxeAtcmcvJP1s4R1Z4rnhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YgpVA89ApQkYAOrFscvh6RVYgYtgnA6Bp5FZE27bR0PO94y2l2RBplDzmnNLuBfoKkxpFRZORxvx3Npx0OoOE0XKVTz9A/tkZ5xDVaG6Y9ZsnAD7xOEkYJhA/ch0TuehdLhnRlQsCxYAwD67u6GvfPF8oUp30jvpSvs1cQWshko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4Syi+n9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso4826135e9.3;
        Thu, 24 Apr 2025 06:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745500329; x=1746105129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9S606ivdk88pKEWaj7Kpt7XGN1MosTx0xtmJbQ+tj1Q=;
        b=Q4Syi+n9qn3uggM8XXWTyfrqLqtevw0yu0DbazFvy0BjgaZcdObTn4Mhh7a05ckVvL
         nSd+eo+fCLsIh7LttrQLwB2wXO3kUUeu/9ipRMUUcwyjUjAzzw2WHiR7Md4/vysgARI9
         C51LLYuwo6PZDR3Zs3QJOW89eYuf7U+M+18Q74BoOjFoKnpLkOuspon+FlOfhklRQLbA
         v0RyxieC7I774aFwCVPEEvHITWd+6zgWXfmDBsKdtivrsFCVlcxXWXfm5Sqr1zZFQ63j
         K+PqrPkfXabapIaMbDHVNtOrVhPUQRDsIRCmtZwFd07p1LCALAFVNnx7yDQaIr4jcQFl
         6WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500329; x=1746105129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S606ivdk88pKEWaj7Kpt7XGN1MosTx0xtmJbQ+tj1Q=;
        b=tWAOJENjReVB549Bu2f4bXOlZNzhd070GM1v7uvdKPS88PUDx50TQm118MZOpsx5+H
         l7bmJyqowSkFES6+p0BdM1sjolBoda4cy2slbgDNBObB8fPN3usIBYRslE4eZ8XuuAHH
         ByzjqkCh8XNJPvYFdwB+Kepgzda8eg3pCWbBYAVM5sBoENoAGP+v4PbJ5108JvihlzJ+
         LK4xrI68bqTpgdma/3rl7p8PM5kAom+rAHu56nZbBmJxt3uFZUIrp/oS4SQymhtBT+MJ
         moiPZMmZ8nja3AadImOmFpNLNvBLnMarjqQRWu5SWD66mbIgybNPht8mQEq6LG9g0cxM
         BdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVMuCbRqAjrcj/LU8m6rseXtLAzWppKjGTcxhdIlbSStfzLNJtj0wUQOvqb+XUG8PVibnqRfZ5PlOHH4Q+F@vger.kernel.org, AJvYcCX7hNFGcsifRMgkIDE+i2XtBRsbFR7q50b6R9d56tVooBrz/OUaxSjfXjMM9BVVEiXVjvwANxFA3z3P@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDrv0pcFfiGEXnZy6e8DQxp7A+/ndTdndhF+Fxhk5EM/7X2dt
	euWVOuOD79+LIhH9mGv+cPKUbrbF/B+cb4doApDKvzFF/6mb6znn
X-Gm-Gg: ASbGnctAjjs+8rENI/sele/389YN4c2R/K0QwQqs1eg8R6tTetBfWv7qPkzbufXaA1o
	3qzIVBTmcrVg5EELHEfP4Hgd83ruF3uaw6bkaIwEALdjdjR3r5sYC7ioj9iW3/VfiVoBs1YiwJs
	7HE4/loZrk6FhhOfeOxR2FoyQHQzSHkJyihBrqxWkSPWIcUuGBCbhbI7ort0QU+kpEBiLJjAe4g
	/E3qiOWRFC835ZqC4yOODhWJOTfJQ6Wj48jiniCmoo+wrSc+NmWN9W+/rQocjwdBVPjU5FBvwyE
	WgHPORYWPObNQP/tcxQ2buP61YIXKkYqt85FRmT16w==
X-Google-Smtp-Source: AGHT+IH0jSQHUGWaZfvxTiF+/uEGoyp/1xBue+C21lwbotQk56PUX5CrmPAC7ibihDDtERNxvnwjkQ==
X-Received: by 2002:a05:600c:5007:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4409bda56c9mr24344935e9.33.1745500328918;
        Thu, 24 Apr 2025 06:12:08 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a06d4be673sm2030014f8f.23.2025.04.24.06.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:12:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
Date: Thu, 24 Apr 2025 14:12:01 +0100
Message-ID: <20250424131201.157601-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The sizeof argument is incorrect when allocating pctl->eint->base, it
should be *pctl->eint->base. (Generally, the size of void * is the same
as void ** so nothing is breaking in this specific case). Fix this.

Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..4c2b72a3543a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1017,7 +1017,7 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
-	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
+	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(*pctl->eint->base), GFP_KERNEL);
 	if (!pctl->eint->base)
 		return -ENOMEM;
 
-- 
2.49.0


