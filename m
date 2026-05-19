Return-Path: <linux-gpio+bounces-37104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEWGGS22C2oCLgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 03:00:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9A575E35
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 03:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 201973016D05
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 01:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E407258CE7;
	Tue, 19 May 2026 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKASs4P9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334C62D5937
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152418; cv=none; b=RgtoLqaFw3VP9wpL7KHeXmGt4visZzYQviCdZ4i4rkiKNOpMbQYM1bdc/JkrjqWz/pWxYkQfc5t5qShk98Y+zukvZWoBB4KmjNUMQA0dQwINORQ2+MyxyIRTwWmrobmdeGCagshOsFt4Q6RaCihqihGE793dh2vLObRS1RWudTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152418; c=relaxed/simple;
	bh=9/4QdOoYt5GXCxv767gp0C8p+Gqp7DJJXOLTLhCLH2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bs0pLTGeCzP57z0FXlEpHxgEvRTtHQKToFAWvDLQbRk3ta/hBynjwjv5hbUItK0BxRvkEnlzZsGyOn4frGryCpjk4HCgK+xZEVz5mc5PnUsKun617MXFjLbYk8sFnYt9NZtymliJ8puU0uyXvjwztH3Po1Zf8VFmLHY/2wNFpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKASs4P9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8379e010b01so1207840b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 18:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152416; x=1779757216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbNWklWh6Fsmc4pps8xgmKimSXfnh3n3C2bAnfYPLH8=;
        b=hKASs4P9kFN+QdSraxFjS8nnWqQGZ8yMCkzMCHco+36aIHaXKfTQA73Y6Gb3dxXQCL
         mu/e2wH0gqQy0TSp6dvQ64doEGg3tUmbaUPMtR2KiAtBvpW3ijuvMkv1IcnQST5PvAGL
         EwmkzJENr1eCywye9LVWW5WMwRDZlhwIr14yM8H120MKUkM8Ki2cQCVpeK7lus9s0zKc
         Xjxvg1eCCzBaCjvkSPaL1qW2t12JZV/r+XsAfWbzGkuNoN69vyH7EzHx5vUqx1raMUSZ
         6M5RiwEPx3ZyfXpWwkGo8fnF4H8yImIAfD3Mf8Zau4zZWwkbhSK8dBYvf9EeKoXZqJ26
         EjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152416; x=1779757216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbNWklWh6Fsmc4pps8xgmKimSXfnh3n3C2bAnfYPLH8=;
        b=Wj/Hw8CV19NsSogFywvdKpk2WlXVPKClsaVRv3j0sZkLcwsCZFJsAyQD4pEWrWNTuC
         ndawY4Oa25tp7rmNnkYIytZ21PVvIxYls85KREVMOEmolpI3hdiyRlKQIwHQATm+7lug
         Ku/5V4Lh23yO7RYE56KkXgvTTKMC7sgls1IHfFqh/w6LfkPkdgnn5GR5mlXo8+RNxcDt
         PnfJYVBcDSwXGvdCOQHjhNHuUSqNoSngKIc/3aX66dZNU19/0sjr+2IWhB3e1FGCEJNx
         /0F7GxOURZTuoV3Kx2aAzGMPA6uw8iwxfI26HvWIjR4umgyf6CU2oGGiRDkKBQSwu7fE
         LoUA==
X-Gm-Message-State: AOJu0YzG6ZDGdtKN10vC10pTpnK1F3fTYB6V3zeBWyDiSAhxHqTDJfp4
	ijeymHmlo7lBjJ6/wpcuwngm0T4/iDPQHoQQXhLt/1HL9jP8X5SUjDcGRW1/6fnk
X-Gm-Gg: Acq92OF1IYzVXGN/shaZ/+lGwezoZnidQCjhrNL9NO5Vcn+aG2Bk+obwrQmYJVl5dju
	3xNemzv1KvFmCcnb0zD+CbOf/PkT7TBUfSZ/PmN3Ooe/O5xNgSxnLSVkSm2DVXf4N6WkVyNbBXf
	/YiNki4XjkU4s47H1QV0MR1WtLtvJyHFJtpuzRLhQ+iNIUHsvb7cRrqhHM4ZDT86cu1OPzHOmG9
	swQhtKvrb6yOT+az69BoFG1ySHvhAedHl8/sT/ICzF32/yCidVLrvcSxXbmA68YdCMKdvgJr34N
	fqUt6haShAxVWURhhA6tL4CoCyh01xadvjygqv1RIJ535bLM6LMECFj3fYBcmYUqjtoEgf5DHDr
	RlkuJ33QHqGY4vzbmpJL6Dz6BFouY84B/Azyqf/j142uwFPRJZk4FM9WeW6w2ifIfE9bH7HzTec
	GsgRSG58cpbR5VgACd5F7Hn/VbKaP+2bD3hyo57q86c5rAZAAr7Dq7yMTQE3w+AgcdRhfo6KITr
	+ICqRgbI4TsLsiUDiHLinEj2TT4N4qNRBY=
X-Received: by 2002:a05:6a00:2293:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-83f33cc684emr18154151b3a.19.1779152416542;
        Mon, 18 May 2026 18:00:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660easm15638026b3a.11.2026.05.18.18.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:00:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: xgene: allow COMPILE_TEST builds
Date: Mon, 18 May 2026 17:59:58 -0700
Message-ID: <20260519005958.628783-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37104-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 17B9A575E35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The APM X-Gene GPIO driver uses generic platform, ACPI, MMIO, and gpiolib
interfaces.  Allow it to build with COMPILE_TEST, matching the existing
coverage for the X-Gene standby GPIO driver.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-xgene.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ba2e8c802093..9ea5c2523fd4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -825,7 +825,7 @@ config GPIO_WCD934X
 
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	help
 	  This driver is to support the GPIO block within the APM X-Gene SoC
 	  platform's generic flash controller. The GPIO pins are muxed with
-- 
2.54.0


