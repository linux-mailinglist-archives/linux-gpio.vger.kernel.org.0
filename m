Return-Path: <linux-gpio+bounces-37103-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCv8Kfq1C2oCLgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37103-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:59:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EA575E14
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26FC0301476D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB492980A8;
	Tue, 19 May 2026 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHzeyuh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4C23EAB7
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779152373; cv=none; b=cvReTbDyr5Lqk/RVCAsJCExEzVk4FzzXQhsdZvSpfKP8/aQB8CE96zLid/u4W7otcAdbI3J27jk/Y7e8R2UadUPLruHLYZ11/rTKM4o+arbSHXWr4C4Bo1+2MAXlB+gLcuHmXaV2hfOLNtWhq8ysbjBSVYffqiipMdN8Qr6y0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779152373; c=relaxed/simple;
	bh=RVGlnfTJCsA2aWIQ+ux2CjHM7mpyQZVo8nD9it64TAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3G1Ryg+qceDCUxUhedf77K434QkCxUfaLSW8VjTecmTk1AL6KX1u11bSg+XzxRWeyViOaRe4fTr/USyCRLV4PRv5uc3u+kGrpddqmaM4KGgzZ3tN3o5dK+P6Mh2YUNdyTh9Y5tGfqpfwaG0I7KdpBSZVRY5Tr99MYCGRhNkBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHzeyuh4; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8025aecc40so1361641a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779152371; x=1779757171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zq27fTWBB40gdJ8oRGobsPvQc9+O/rtZ98vQcdGin5A=;
        b=IHzeyuh465Pl9q/YD2Fri5s9mWiPcOkbp5xze5IWVzI5SxrrpqyHH1qtLESDalMk9J
         OFbHIiloIDJSFBKu3oA8mNvJOt1uvjVAUSZ6Ki+aVr7y/Cmyqc9l3y0QAH6iSUiWMFzx
         2vEr/Z1o8ZkqynxjtAxLJIX9ioe17SA2WzAwY6CIHxIjjQ1XW2AhJghkGgx9q3p0Z/eI
         V0jaWojg5e+9gJxKULq0j+4TcxS+uSzX9d/RCbnAR/jQp4kSIGlA4C8cBAiSgX1xoC3y
         7oO9CVEKZqjS38Tv9DypALhIRQEHDDY7SxVcelCpk9Re3PA8TGsn/Js5UKZpunhNZJX4
         aJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779152371; x=1779757171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq27fTWBB40gdJ8oRGobsPvQc9+O/rtZ98vQcdGin5A=;
        b=a5WDZfNkdHfc+NWRGptHaZbvhEPHPrLmSR9yyotIBzNaLph0Yrc6v5Oz/GKx4oWeA7
         KmQqw91h4VtBtgjyoqBSPP8SZ/yleNr+YBPVOj5Xa+VMhr0dcsWjr4FGqaoo6wL7dVtM
         7CJgPq8ElZnwCvQ4PW1908FInLNez32NUQyikfBunZYNjraOITMuU+aHf1g2aOxL72H7
         46hqlhmlTmR3TFE72AHqBTEZn92zplfP7MT60v2z+nAgHFgD7Z/kgbKnrLq/WTg/Zx19
         dYLKLI32DZwZSZUjjWjAC3D1u8gdZjsaSvmKn+y9acDw+2OsYGDXpx/QjJqJQRBMwPsB
         nKXA==
X-Gm-Message-State: AOJu0Yz1RdukOEEK2VzHYze+FAwLN7vuw9Lez/FzawateHePAn4gzJLz
	vUBGxlwYw3gkeV6dv3pDExwa0AUuk1J3Bu4yn6mXOAjRYHPY5VI1YeBrU1J1xnSt
X-Gm-Gg: Acq92OH/W8IB3sKR+ruvJCnhWXx7bsv9qLeZ8NPWYlj96nAzgWSQJVxfOZrxAfj02Ig
	ow/CEz4IK25uCkbhINAazcflUh+klrCrSLmrGj46rmgiU4RXTpN3uKjXs9NPJULf9I61qOQksLd
	QF7TNeeWuEtx5CnY5Iq/uHOqb/Zd/JhHdd0eGAHMUWwV0OtTloHDytTNwx456GjGuSS5zP7tr9u
	uSTNUkPIltVFoAChDl7pufphVyab1X38N1tU9dV6DeCoHoRZjMQO17ExmuHtdSkaHX8v383XjBh
	QHpiZrLmp1FROrxAEU8e/cRSLRryjSWKRkj2ZVMCldIZvgVe2gjWHrxQcjQZ74Kmm/l4Ku5LMIR
	x83O3AD2s4CWSe8fUte6U+Cd8ZGYup8b8M3GYKixTNcDOqxaQqG490j1TyiActP3Apea9fejmag
	izbfxz5KPEXaaXnITcNM8cA2gCIgF0qu6Vnj1F/+Yq3lwTqHdLcIFTli5hpH0oLBzG80GV0Ukz9
	6NMIm0ZLKWB7VKRo/pd1vn9lCzjpxujMbc=
X-Received: by 2002:a05:6a20:a125:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3b0c009d62fmr19703341637.22.1779152370763;
        Mon, 18 May 2026 17:59:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm14813384a12.28.2026.05.18.17.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:59:29 -0700 (PDT)
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
Subject: [PATCH] gpio: en7523: allow COMPILE_TEST builds
Date: Mon, 18 May 2026 17:59:12 -0700
Message-ID: <20260519005912.628667-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37103-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 956EA575E14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Airoha EN7523 GPIO driver uses generic platform, MMIO, and gpiolib
interfaces.  Allow it to build with COMPILE_TEST so it gets coverage on
non-Airoha platforms.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-en7523.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00fcab5d09a4..ba2e8c802093 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -302,7 +302,7 @@ config GPIO_EM
 
 config GPIO_EN7523
 	tristate "Airoha GPIO support"
-	depends on ARCH_AIROHA
+	depends on ARCH_AIROHA || COMPILE_TEST
 	default ARCH_AIROHA
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
-- 
2.54.0


