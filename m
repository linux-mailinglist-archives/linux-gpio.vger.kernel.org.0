Return-Path: <linux-gpio+bounces-36481-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDrZA/CA/mnyrwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36481-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:33:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D914FD0EA
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 983ED30090AC
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 00:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C321DF25C;
	Sat,  9 May 2026 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6Q0Xr9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99A1D5CE0
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286827; cv=none; b=YzRsdIJtxcE15ugOanLFi0Ajs4TV2xCte3NOL6Lx1r3Rsceq+NsYd4XuqSJpbbLYF73KXv+NOzzEpGib+zoyPbaSdTG1pxRH9/ykcflr77FFcY4xEuqKWgp2APFn5bhndD6QZ8fqijSOpk+apGzvrt4cUjmpG/TTSuTAV5pBWjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286827; c=relaxed/simple;
	bh=w4nfqVFZGrK1NCIJntiRJ5nGBcZBg6USWQRdZN0VlQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JM/xk78QhIyvrKfK2MkJEDaTjLQl1kbxjm9erR6QYJ0YYb9/Rm74prpObtcNe2fgcTgPHplJOBGQtK8qmDnHG90GpDugnxumGnbzX2eHvUeaw58YvwGq9/AkWbAIohjVZBKrt6kQm4jnP1wz6wP8JNJTXxATCQf0nveR6QrdNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6Q0Xr9p; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-837b39eb078so1726767b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286825; x=1778891625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLJ9gLG7pbZKIRQypRSLrX+188/WO/6+lZX979t4oqk=;
        b=H6Q0Xr9ppN5R+zkvHiBuDYGQA/3V9BYVI8hSJgtSv5mkgujxCX1/RxAp8DVJmP8hyr
         anjuyNxJnB5iXXXilk7cPqwkRcq1tDbinrIpolzfy1FSqv6JPY9J0Vehb5fY8XhuHyzO
         xn1fCJbWsNdU8pkwbALRuCF5rWxSRmYWrl9vHpZvILS5PVqYqMoFtBsizXAQvhCzHccc
         BzZCfP0Vn2F65T5IbdDOHzY1vAtBamTZCNJ68qoiZwqaL4vVX7iyPqPnb7llmK2DDQtp
         yJvsrcgfkwU4ntM45D+7RLrCadqHpPqRZhVI6MSwqzRheDuLPXJhv+kwGKjwlltcNn1g
         +HPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286825; x=1778891625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLJ9gLG7pbZKIRQypRSLrX+188/WO/6+lZX979t4oqk=;
        b=eKY+TPiji0HtqYcC2KBX7UymcmVWLDAN29nKtFFOHhd+C2u3k4XO3UBkRqr9BnlhoA
         M6aJPAzB0dG8+eSXE9UPisjhPbEs7S4HaUtJ2gkp/7DDnRNUZq46qcYsLVJNmFZRHe0R
         PxJsibWBcYs1j9mG/er8EXcuoqmUtXVpIjH7vcwIGo4Q1AKCJrz08dhm1iz3upcJbj7g
         JGaN7QwnD08uf34K0jlPUbMediOjZbdrkKZfVfG1L6y8BzU0NdE72fNN++cjJh5d63YK
         y3wf+275XsO/RwksbVDNQSO/pGyuHh0iIU3A9DefUIyH/+TLkJSrjJ/0Buf/qrumz5ax
         H5HQ==
X-Gm-Message-State: AOJu0Yymor0FE+ZmjEjv39mxH6kqRfa48EoFN0w+f8mBE6PVn6mz+A4s
	GZfo3taHflCxWi1sfi4sQpZJf04W7EQN2uSRtbXP21WLWihkx4bzfGbtcVzAs/7g
X-Gm-Gg: Acq92OHxM33zPUm8yUFPGvQyFVkfOy6guQGOlhhhmOACCvWaUAOG8A16EFJhKqw7245
	nSFdjcCz7yvp5zN3yKhVo+/LfIJyN+AM0643IlOp1MpJoRtNERzxCVGO5Yi8vK1IkS8aUYPqVJv
	DFWWzTrfi7vuZwsOhxkFC2DmmL5T20KUojFkM1dBvMnlrCZkiCfLFDXILBZS3HtbclMsl85BGHO
	yO/fj3jM5F80A3HC6krCWi8M7jdSe+ra3E3aheZwVmGKlK4pejOHB5tfarnMd7haRwvdTLAQHE1
	4BbptuE7d1aFAIfvbJD5p078s7grSVtgVIPd9VkB8KDlSk6C1aUJyB1LF0dsKcTQbKyjezgCWd0
	L6vZ10AUKXwoq6E1pmYLBWi96gLRZkWWO30O+J8DVAs9ijGPgw6QIs8W0KpYYiBccFNbfpSz8/Y
	5gkUvaIE9al525h9etbrlbWAVq3AfUVGoghD69Pq/VqVlK/mfKgqoaF/X/3kxFH+nNTlAGHlUNr
	+y4k663widd2N491QYOEJiDZsfyoZDA9wU=
X-Received: by 2002:a05:6a00:6c90:b0:82f:4f63:31e1 with SMTP id d2e1a72fcca58-83a5badbcf7mr13179463b3a.8.1778286825102;
        Fri, 08 May 2026 17:33:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c00sm12593925b3a.32.2026.05.08.17.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:33:44 -0700 (PDT)
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
Subject: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:33:27 -0700
Message-ID: <20260509003327.955942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 96D914FD0EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36481-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,lkml];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers, and
builds outside X86.  Move its Kconfig entry out of the X86-only port-I/O
menu and allow it to be selected with COMPILE_TEST.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-sodaville.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f8e34b16fd99..9e1ed0f451b9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1908,16 +1908,16 @@ config GPIO_RDC321X
 	  Support for the RDC R321x SoC GPIOs over southbridge
 	  PCI configuration space.
 
+endmenu
+
 config GPIO_SODAVILLE
 	bool "Intel Sodaville GPIO support"
-	depends on X86 && OF
+	depends on (X86 || COMPILE_TEST) && OF
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 	help
 	  Say Y here to support Intel Sodaville GPIO.
 
-endmenu
-
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
-- 
2.54.0


