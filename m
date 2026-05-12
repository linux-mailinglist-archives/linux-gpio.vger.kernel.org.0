Return-Path: <linux-gpio+bounces-36699-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBayIMWKA2pN7AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36699-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:17:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC252906B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 22:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3416304B2BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA633B388B;
	Tue, 12 May 2026 20:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gez81Wgi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B923655F1
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617023; cv=none; b=N5Axkz3F/9Huy5TQU2iMn3VuTAKZMTrSnXUafAr+ZgU+8ABUmJmYkDoM8TFlX4soADlhBX1ZwzN8m0FIRI+8/UiOJJhx8yq2ESKrVp8noN1PFe7CGTFpRoOw3dEhgEmGzt5G9RnA9KrrX6+7fVIpcFXPE+LVySRUE1rc8/LuXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617023; c=relaxed/simple;
	bh=97qM24lBz73MTGs2Ev7Dn8ABPmphQjfBKXokj6vSwKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s46ih3lf3d0HWR0/6a7dx1TOfQX773JM9kHVp1mbRJCPiVeGstnVF+630hyoImjieAtH6yfWEPEo8yZIpBlbP3mk68I3wJ0Xl3K1gkkGYeT/w43rJmIa7HKbnlgSuyKs32e+7wW04L6BCe+7nS3Qk3DEHtJ2g+1OR9sYrHNk5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gez81Wgi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-366375c4076so2808176a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617021; x=1779221821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fioO7dt+DtRipfouwWizM+WF82w1PhyP2cJ94Qb6G0o=;
        b=gez81Wgii1VBlXYuOwhXTGUpmdyrO6X+vXiX5WeSmvJ6cWnelAiO8s04GVmKFmqeAJ
         6csPOxPOU8iXuPYfI+Rzrnoy2A9DNspIel3n4N/yrRcHyFLDHbqU652VOdzv5qcmt57C
         4ltce2Mt5wI8DmrP3kc1iUMRciAYvjomLc58K5cxWz0fYGYvdPC33dUtfH+0wBOduc00
         PFZeaU7PglWMMu+Q3B1gLFdtRd6pUZvoZNNdjcd7XUnFwxB6ee1qj318vccy7sYEm6ZY
         QLzTshhl7i7pUDultf4tbda9xOz+ZB+wJlT4WvWvrjL4l2vk/D8iA5qTAuKSTdNsyDph
         Bzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617021; x=1779221821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fioO7dt+DtRipfouwWizM+WF82w1PhyP2cJ94Qb6G0o=;
        b=V2tcTqGDVUxMuJPTxNr8c3RerQz2oVM16Yubvzr0360DAeJG50UR52eS3qkIzqJI1y
         yBYe7CyGTfeoftV/CK8lkW3ThQ4cGLCPEFiFzx8QYwqVPq6nHE9UrPn/0r+VIlgGG6oU
         9b/knYyiDxV40RL1ix1ltUuVomGM7jGx6G+vXsiusdMiZmQwGrlmO+3iMBg9oyLvIJuD
         gl1PKri4XRE26LJv0M+i3+H9YyqPgylKx/hRKrOCfWUnLDMKy8z+xpDFOjiNXUJPn3bw
         eWIJcFfK+ZTbyo1CFjB7ejs1nqLsNollbs0r64Dk087/Z6MNHHIlNswngU2AI5yMi4WL
         1L8w==
X-Gm-Message-State: AOJu0YyJpOPtEpEkpYjObvlYL5lAgcP+PL9izXp1T6tRpGmV8PKFOMIE
	qOkRISMkNupB+TdS7qLd9/NXzOybAAtSGCCjug0W4nQSBG+BDME/3qU6LIlq+jEO
X-Gm-Gg: Acq92OH9yxgRtfozF5W7EWtOYm9TyMSo1H8nMJmc/XHiX3jRG1g7VCODeuv2N3DhmZ9
	YkwnGoFoH0ko9T0lmGXLlUIg4oPSH/VydwvxuAA+mE+MyQQpgSKKorxxVZxNewryBbeg506Bg1y
	GJn6m0/lDlwo7ZQ53LFVcWKfi4jvdJ6QxtxfKiQQIpANlBjLPweTjky4s013YL0wGELC9S/FNC7
	TX3VPmcxGvMRkS6wC5ZdXm1P+S57hv2z+yhLS65P1M0+dJCLYfTqelr/iHMqZjiVPLHK0zpmzmP
	r9nczB3RYm18p96F/eeLM1hhSFVajS9dld/GW2hkDq89cwFITg51ZxUenZRo9981stV3bX/RTBI
	9VNOILnxD2WyyALFWET2e22P8q8bFu7GAmhsoMrq7Qom8FILbAG6BG3KYN8Oz7yutmdg5yf02ts
	tH6LUE08UazCSDxf6Kjo4yZl/8jdPI7Yq0EcCNKqnAtmDKqLAGwel8ZkLafYnKdB4JO+xJK0RH4
	l+3BxKanKFT5F+7jvop/m0h4wtHxLCFoSk=
X-Received: by 2002:a17:90b:3149:b0:366:132:fda6 with SMTP id 98e67ed59e1d1-368f3ab6d1dmr530731a91.11.1778617020651;
        Tue, 12 May 2026 13:17:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm12863093a12.8.2026.05.12.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:16:59 -0700 (PDT)
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
Subject: [PATCHv2] gpio: sodaville: allow COMPILE_TEST builds
Date: Tue, 12 May 2026 13:16:43 -0700
Message-ID: <20260512201643.17351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 29DC252906B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-36699-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers,
and builds outside X86.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-sodaville.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: just add COMPILE_TEST. Moving outside of menuconfig is wrong.
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c9a0d53da6d8..92281c14653b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1912,7 +1912,8 @@ config GPIO_RDC321X

 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
-	depends on X86 && OF
+	depends on X86 || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
--
2.54.0


