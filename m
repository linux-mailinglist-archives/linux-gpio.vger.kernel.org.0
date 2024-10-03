Return-Path: <linux-gpio+bounces-10764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879C98E873
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 04:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56691F25375
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73BA17C9B;
	Thu,  3 Oct 2024 02:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9X/XCIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D117C77;
	Thu,  3 Oct 2024 02:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727922827; cv=none; b=Mf0LkDenD5nBDSBy3pM1w8VHj34InhtakW7IC6TDpZerZ1MrGOoHmw3CjAOvWWHR7pm+dm6lBQtNzvdGgryjvJKTdCwIJkeqGjoxKOBClsgktdFNX6bULCTkJysKJ/Tisn5SYd13BIkVrISqFbzk6ax0qPO8PzXC01N9/Lg7lu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727922827; c=relaxed/simple;
	bh=pXD3its+D6Ck82m0Q6YYxgIi5A33XIqV35PGr+ZT9vk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iY+bN0FoHumITzAmCPFdF3K3+Zc6PR3ur7GHHqnUc6Aiu0c/WQLTCkH8S2J9NugdlYOcVMYCbIuNmuz89Dmul8pmzx+PvaTmo+1BVIf3MgFzh8s1htHpGGfil+N1ai5YnNaQfRRMU2geAJrgIuaOB0b4/v97je9JuCR0XnTgCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9X/XCIg; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2e084dc44bcso45454a91.0;
        Wed, 02 Oct 2024 19:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727922825; x=1728527625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYOhOaNZnjAn4zMumq/IMa/aCdY1Da9KJs3RHuJCp/s=;
        b=C9X/XCIgDU+TH+WQz2YyF4sROw899ZUmbapTIZjXkqbtmaH+OfEzpz/+2onzP4YsLU
         WdB0HvGT2iFMtiY1JbySJQ3UrfknkWE9/AucPKugl5IFXnBybmUH68hCOcz4a9QF5I3c
         Iyj0q4k8BeT5E+tPVgdBWOZnqlbRl1JZ516hmdm68zzhLoUap6UW+B8dk+oGaJCxAHoY
         eRM47nunfZcDmWOI8/zCfpOf698XQvwT3w0MViNF2hCTwMSoTB3WBwDqK4W7O3jCGRdS
         AV3Fp2VYrypS/oE/yEzELgMoxLLQjzPqrTFDDNNHNbXaAUrdDMmHdbhysIYzeQX2eHWM
         jpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727922825; x=1728527625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYOhOaNZnjAn4zMumq/IMa/aCdY1Da9KJs3RHuJCp/s=;
        b=d4Hjb7rk1lzeZv1Le8PcXOcQBJiSSACXnzEbOd+mhFinq5j1CEPfjHLDYUKwTjhHeP
         +HDioACrgsYjEL+YQ02/6twEzUn5m5aIIQ+67tOUwxNBevbneDuFtMTCZBzK4DkbyIgR
         /MKcnTJubDiF3ZQseAuqZCp+Szdj3Pvbn7cczIZluwjPV1wS2SOOovkk9WgKGXSBXJgA
         HkzFZdbzTAHBb6z3oeVucCCVzgXNFMYFv/0IKgY14D7G5wkwCiuSm3DDVX0AmN6e5QOv
         Mw8WoD56IHr19S5xEinz/Kw5tlvRTIhmvZPHHpnI7LatWFyW6zXURXbrHMOSeL3WxcHA
         t0zA==
X-Forwarded-Encrypted: i=1; AJvYcCUyx6YH5lHrzljifwOeuhv1rvJKAh3MAZs5fVSXlc42m9w/LAHCs/9zGHnq7jrUqdWJh4N4QYuN4mQB@vger.kernel.org, AJvYcCV9pZaXDDfJMRkSBhBrkaDFLBHIj79GlliKcxb0Q0tyc/RGlkeJpCnALwHvbruoUApdBSaxNQ6d88rMODnZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8rnlA2kmuaTkXptmnKuDJjGxwFEIyuEbJy1w08o0OFHfSq65
	pTGs2D5zVgjU/40ZdBa5JfuXLrrtMcydpHkxLbEWUW2S9gTpGweapDZkcjptbPvknm9t
X-Google-Smtp-Source: AGHT+IGYxkNOKFaghUlztt39c4/ZdNDHNPlas4VMOl/JXBrzfhjZirZfZNwFdvwyoYrQsXcGP1OMcg==
X-Received: by 2002:a17:90a:8c3:b0:2d8:9f4e:1c3d with SMTP id 98e67ed59e1d1-2e1848d7d29mr2540150a91.5.1727922825253;
        Wed, 02 Oct 2024 19:33:45 -0700 (PDT)
Received: from user.. ([206.237.119.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1bfb1787asm275548a91.21.2024.10.02.19.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:33:44 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH] pinctrl: fix Null pointer dereference
Date: Thu,  3 Oct 2024 10:33:07 +0800
Message-Id: <20241003023307.2138695-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pinmux_generic_get_function may returns NULL, and its retval is
dereferenced without check, which will cause a null pointer dereference.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 1bb78b212fd5..9331f4462480 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
 
+	if (!func)
+		return -EINVAL;
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
 				 (uintptr_t)func->data);
-- 
2.34.1


