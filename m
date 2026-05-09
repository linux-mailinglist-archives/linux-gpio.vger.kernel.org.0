Return-Path: <linux-gpio+bounces-36480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGTPMLuA/mnyrwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:32:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C14FD0DA
	for <lists+linux-gpio@lfdr.de>; Sat, 09 May 2026 02:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F2A3026F28
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2026 00:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8E01CAA68;
	Sat,  9 May 2026 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKh9YZOg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666861D5146
	for <linux-gpio@vger.kernel.org>; Sat,  9 May 2026 00:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286771; cv=none; b=LXgRKXof79jDbAgzj2j7SHDBd+lK6K9Q1TJLXJhvvDNBpPNpsZDpOOtcSnSAPnmyyTF4afqHvI1QcezNSceF5u2d42Hlaa/oPb7pcvaLZSlWbikCY64gMo8f8B87HZ5f1pEGJXK+Cqq66mUvzq1XK4dKpcP/XJK3kZwUKt3oc7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286771; c=relaxed/simple;
	bh=cwAJtaIa3HAbxdD9fPSDi6pvOQg5BHTwme768t43EHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gm3+hpteuCYvWj8msz2HmWeemzI8TMHBXJdinnkXkW1ahvqTVt5n1vT1KaaIYO7GNK84Ukk/fA+X7lPmk/IIPpoqAb8JHQb0mPK0W2VcMziPFNwG7cSo8dgWczZJXqnIiUEBioKuITsY6rtFlRLmfpVkDxA6lLElC8UrPkKwL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKh9YZOg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso1267761b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286769; x=1778891569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRY9lec9jfKBu3OUprYTLDApFu69WThjVKh+9vZTH68=;
        b=LKh9YZOg/81rBPHXEylfWMDVRg1iZQ3jL+OXvyy+SbwQDGFTSb+YsfxJrj7/23uK+I
         Z3vQOWhqGWTUUrEf/4S08Rj+Z8/3t0K7GQanmH5o/HdUypUaCpROChIFp3wmnqsSmb7Z
         DRjDNgB1OcfqF6Eecfxk56osRxN5jn101pPOehMT1r5JubY6QaS9NQBau4SGOHUl7QUp
         yp3v5G1o8TMZLwgv6nk+VSu810nVzPrcyX0yI4Mmva0iWgZfb2x1Tr+AHEe+xx7Jb5FW
         vhPX/WubOrq9z+g3YZiFqhF4fw2XbzPPX4sW86gqd7SfLAgG0kl87Ki3IcGWu6j0GOjF
         fbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286769; x=1778891569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRY9lec9jfKBu3OUprYTLDApFu69WThjVKh+9vZTH68=;
        b=Pb7asg4KelkgzBglmCjf+YTEluxjWHz18SX4ycaVSE7yE64SWVLZVdjAJturzCf9zQ
         n+5atDcK8jiiB7dvmFQn2FlJKeztLRIpOMRh8R9aGb06ooGyS5E6lNtFpOgFh9jpQszW
         4SabU0mO4PcWoq3w5tW6NYO6FD1NDizF2rU9U+wUu3sB9yqbeizCRwnfRXfKSqB4hTCI
         hFDCyIvG13CGuFs2nTPVCFtsjDTQ4FixGKG4ILAvyIMRb7/LKuX7msmhzB2m25PhIPLJ
         7YFHcB/znyYBucsXGfxfOrJslcQqacf8lcPZ5owf2pdYaIIL48Ol4UaDfURohRQyrfUP
         T/1w==
X-Gm-Message-State: AOJu0YwK4pj78RhA9821cJuQeQke1eY6lETfACBsGR0iRNOqtrC/ItAb
	fYMNvlwPgzcfC3b9hvbCM5jbsTob7zH0wLWa6wgj3MqjvgQpz9EZU1L/o0q1wBxL
X-Gm-Gg: Acq92OGYlsgnyQvTGwr6961m9VRWbs8tCpWqiunL1k9+OxRd+12rV/wsIDDK5gJIB5/
	XJ95bIslZ188xQP+HnDkoc3umkHXwcIo/BappzOzUzyte+8eakgN7iM/5NCLQwUYZo6hIStKMkD
	3CvjYmsF38JkDIMovIEPkwlgH4W/9TKzeZ5RTgFxxlkSH2j/ZXmtRzKnO5VM1Xk/UVyFGrnRUJt
	RvM/8bRGIjOg7I+E+l2S0jSYcfeb+POyHUjrwfwJVMbcl2tY+yXMeqaBbvzQG3wpBhJbuUQPYS0
	UMoVKA5qw1rJNE6jpUrqUfPgdTBmuBKX1bXyK3/tTe9dNNnivuE+fipYTWIESds1akkbrVKvORo
	S4zDFl2C0D4pjaOkHCZAJL9CNpvYemYnR4CAKsutpTausauieCLXgMDoIreIMxGHF39+lBeD3Rg
	beeaBztRNi2832bRMdemPaC+SIwgs1LdoRkEFXHFc67ghHs1+qC0uEei+u8aFZFlxe7803X0tYe
	AW3KJZlVze/pRJn2eA0jJn2B00bWZquOOY=
X-Received: by 2002:a05:6a00:2e96:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83bb8b74857mr7784664b3a.23.1778286769291;
        Fri, 08 May 2026 17:32:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm13648108b3a.22.2026.05.08.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:32:48 -0700 (PDT)
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
Subject: [PATCH] gpio: merrifield: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:32:30 -0700
Message-ID: <20260509003230.955814-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E89C14FD0DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-36480-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Intel Merrifield GPIO driver builds on non-X86 platforms when PCI
and ACPI are available.  Allow it to build with COMPILE_TEST while keeping
an explicit ACPI dependency for the ACPI lookup path.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-merrifield.o \
  drivers/gpio/gpio-tangier.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9e1ed0f451b9..51f510fa8cc7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1818,7 +1818,8 @@ config GPIO_BT8XX
 
 config GPIO_MERRIFIELD
 	tristate "Intel Merrifield GPIO support"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || COMPILE_TEST
+	depends on ACPI
 	select GPIO_TANGIER
 	help
 	  Say Y here to support Intel Merrifield GPIO.
-- 
2.54.0


