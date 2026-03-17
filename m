Return-Path: <linux-gpio+bounces-33618-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA/SNfA0uWnpugEAu9opvQ
	(envelope-from <linux-gpio+bounces-33618-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:03:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA42A86C7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 12:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 823023049466
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D19E3A7F48;
	Tue, 17 Mar 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1XCPTUf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FB3A5442
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745389; cv=none; b=FaETt+C+z89NQvdy0JvD0genHJa6+I80394/MLABgFoIm59+56lCD//kMrc+WajAwirVxiYLJMnvGuHpO6MZl0yhD7fPNLkuvk6lfqrLC8OHwbCIvXPhIY1FSyuY7FoNdCWiEylYOKK6Yps2EHeS3GsNT1odWrhcZIean775csE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745389; c=relaxed/simple;
	bh=u7OttRNb8G9zNYvRXM9DSiND1sHbvu/OmnaG+jxXlvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQfoImh2rzeMErWPNReFeavVNfHK4I+i2oQEZCYuvphLaVZaDEDn6QVgOyAaZExkSSj0mORCsTHskgoVVN72ZrpE1ea9Gjs6scZBnFgiA24OQVZe3Cp+fI92N3zwXab5yKReaf3cvp21y/Dm4ZUZTO4CLakfPJpp14iM+Mva89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1XCPTUf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so33259725e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773745386; x=1774350186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=M1XCPTUfIhfiTB+b7YN8N2+urEE9d0t63no5uj76BOlYiiOXX5BHsLAjI5OicAQlUx
         yzNYsZEQdgUqj19eCyY+COat1XwRWLoER6geHCb4NytqF2DCD79A2zD4BKU+7sacZioK
         RXWtp99VYYXny+Iy4tbK5PwxXN1tkKF/QPSsz/iGJfOO433x7wxa9oT+LLkrAQjTQMch
         DCEsIGghyTSrEYh9YfR9XgGakDvmPDh1WXqlRDSdXOynKCBUZIArfrAh10DHt2RjW+ei
         5Q0GY44wDtPbVIfQaMTQaGAwFSwJKswCuwP+DhoOlZGnDbmPEvWTs6I/+OSeDrzl1mpB
         foZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773745386; x=1774350186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Df0BkW3+WFtbc+05LpOma2mHXyroUqsKpSt0hTLJrY=;
        b=Si08U7X36QzEPGHJNVDmlPEtgz8nBNWq0maaLZ7M9mQfKhsCSLPgnajcXMUGcSgO95
         PWfdfSotQObXRVai6V5NvXW9/TycFIvIHeeubItawLgmF4kHu7k2P8BHEaw6GIarExBZ
         Lvyk55zY+dx0REzSkvMsyny6ZiRa7lo8BcNIep1ozsAqEfLbijsGD5JZKnjNgz+8eesy
         NA3P/xZ4JczTjJ0SXd1Ic6JoHrnFf84azU2i9Sd4QlLvzm4B70MIOrN6BKaQGQLHYu3y
         gbs1xerPWfeSdIXwuY20F2/kF8mSwuOyHahTJBJs0kKfPPqQgygvlDE8ZMhCxH8oCqr5
         ECFw==
X-Forwarded-Encrypted: i=1; AJvYcCVClP0DHjxtDm3WkziT55quelEAAM/kP4JVkzaotqDcjp2nNARDpYnBmrASyA1Q036LEJieKH+a83g6@vger.kernel.org
X-Gm-Message-State: AOJu0YwQd4XUMcUD7wIXSIY/5wxmg56OACKEmC3YuYXBAsfE+degAyM6
	SGk3OgGVML0gTjWMQrgGVEEnklyTvPQsg+7BIiTq3jXKxUcCMVOMqt47
X-Gm-Gg: ATEYQzz7e2XPivgrlvwGtRXrmYQnYpyimQs16537waNuJ6t+ZijFkfWJleyxeW1VAt0
	QbosQqnSl+tAef3ze6iwfNL5OoBpLHq60kCdrLOCs8gt5Tz1zUQ4D4OtP5sjD8TpLmloSTHZn0l
	xFGFUiexNaons+vvG9GlciVC/cReo7RITKhuMaWdQIcNSdYPdwKQngOP6i5TdqMbE7i8HysOLO9
	XuFQOAdZ1w8gio7UjPiSHtpBfAZuqZXKUPbvgmlmT7dOMkWHoZiozn/kMBASxavXlIUJcBsdS28
	k4i/g1ypOdQH99o38XewzrNrRwQyf82VD0djC8/+YaQy4tl9Y65zfHgqGfmWVgzXTtVJgJCRP8b
	mNUXv/MRfld0KfkNkOQt5jueldw+AQq1K2gKJdTdeFe7gl32MpGW6YNbkasGxPrPfM9UwZMVVk8
	+BK10io9eSMO8JLC7d2So=
X-Received: by 2002:a05:600c:46d2:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-48556728c71mr279412485e9.29.1773745385947;
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856e850634sm106157845e9.0.2026.03.17.04.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:03:05 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices without EINT
Date: Tue, 17 Mar 2026 11:02:06 +0000
Message-ID: <20260317110249.391552-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33618-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92AA42A86C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
the mtk_eint_init function is always called and returns -ENODEV, which
then bubbles up and causes probe failure.

To address this only call mtk_eint_init if EINT pins are present.

Tested on Xiaomi Mi Smart Clock x04g (mt6392).

Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index d6a46fe0cda8..3f518dce6d23 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1135,9 +1135,12 @@ int mtk_pctrl_init(struct platform_device *pdev,
 		goto chip_error;
 	}
 
-	ret = mtk_eint_init(pctl, pdev);
-	if (ret)
-		goto chip_error;
+	/* Only initialize EINT if we have EINT pins */
+	if (data->eint_hw.ap_num > 0) {
+		ret = mtk_eint_init(pctl, pdev);
+		if (ret)
+			goto chip_error;
+	}
 
 	return 0;
 
-- 
2.43.0


