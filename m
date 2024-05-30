Return-Path: <linux-gpio+bounces-6981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7B8D51AE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 20:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D551F23D8B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 18:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4E0481A4;
	Thu, 30 May 2024 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iolEY0IM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408BB21A04
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717093063; cv=none; b=Sr/9b0VvJN9M7yF2UutzLNrT5Hr8JWW/bkCEb58I5FVNMtiFOVIiSdSGTvDBEB10iMLbgeANkbhN+rFsN+ZZOme21jFmZig/ldiD6uYeHXUeShtLPc5Zw5cmrP0IUTJMg2NlboT0gOxnEyAf1KPdkL5ICkZBdoWmCpbxxiMfI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717093063; c=relaxed/simple;
	bh=ZPP5VpAE0jS50DOmxD+/JMa04gPZvcwnDIiYOIqCLxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcNllgBIIxOMoofOmYBT/yjW6cYeEOqWj64+kZa0CUcvrNSI2rR9P54Dhq4Hn2cejr7j9qO9e4F06Xxa/V8sB39WSGOp73XRm9dm9hOOnnRlXbKhwE0WikXYDEdJ8run/QrHqWr3RG3BoW0IFabw+oVDug9SPb3kEOQ500oiyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iolEY0IM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4211245e889so11636095e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717093060; x=1717697860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMib05oQXPrUanpT08q0ERnJ9s6RIYM6IhGRg7ywMwk=;
        b=iolEY0IMcz6829ojvePgUoYOjtj6F2z+Ne0Gmglg25nGTJ2aQxxR69QqbRtxhi4pbk
         gtXZX29AjcL9GHjHTaG8NylXMn7UUBSCfkPfA94gI3kXtXZV7wY+BR6gjKLQ0iEOUWsC
         grEZ0TOb7ueQjzBzssZMGOhytOBL9vYRF5yIlcWrx0v+eKxnoHJBrk9hToeMV9gX+0GI
         MfAYw728GAcJzib3LuDfaGlARIpaAfFkbOyBZsFfRHS8Fd8L+fTt0j/RmC0k8KqFNDKB
         zBM72sEMkougcOumt/LjWEJ39e1r/WdBVRjJbTun26GMikip7slR7SD9d80Je/XP+9sO
         NfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717093060; x=1717697860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMib05oQXPrUanpT08q0ERnJ9s6RIYM6IhGRg7ywMwk=;
        b=PIz77bRiQdP+s4zYPhQyM4kS+hbNdJ3arupK60/dP8DiV6CVd6bSWZcmhHYPnhRjHJ
         7lnT9Q9F46obP5vPjxz1mwe0cizj9H93iw9RDaUF8L4+uF6W97wDodPPOVB1P633s2q7
         LLyFgteVSMVYJyPqGcjU70MctazORQWZBxwZc3GObZGAFqKn1L6IvS4iC33SCphZenwm
         ZhUSyrjhZPMeHYjl/9IPK6I4uwJKMBfI4U6oharp7Q02Ae25quSGbt3qZZ6R4CfCQJRm
         63l8LMsuLswxTJI9GnMa07Xqp3MU3f9kpbu0h3SgmOlvewTfJw675DdqvTEhsV0qYOLp
         p7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpJUX02sX2lknpKC67qddGidVUGHdTAmmDQdqdUhc8mo2PlIWB4XtDrKzbDRrXT96GJNWPUEOt/5XVS3hw7B4DLeCBMBu+tNmrig==
X-Gm-Message-State: AOJu0YzvFTvbZVYpDwDoYt6gV3rLH9XmP/ySIc0R0ALr0RGk70mO0hXM
	jA03cp3o5hLhKrUyTIlDXWDTpKES0ucJnSZLRCdqxBeZTGmOK93s3AwPZw==
X-Google-Smtp-Source: AGHT+IFgHi5GYzT7VHCCjW1HJt7T3WQoTuZSdTcLpucf8fsaPjwJynVo1nNqVUmzWibpSA8YmNMGJg==
X-Received: by 2002:a05:600c:3111:b0:41a:1d3a:3fc1 with SMTP id 5b1f17b1804b1-4212780b0demr27362565e9.3.1717093060223;
        Thu, 30 May 2024 11:17:40 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b858424sm2162295e9.21.2024.05.30.11.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:17:39 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] gpio: brcmstb: Allow building driver for ARCH_BCM2835
Date: Thu, 30 May 2024 19:17:31 +0100
Message-ID: <20240530181737.1261450-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO_BRCMSTB hardware IP is also included in the bcm2712
SoC so enable the driver to also be built for ARCH_BCM2835.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec070281..dfb8dc850f3c8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -219,7 +219,7 @@ config GPIO_BCM_XGS_IPROC
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
-	depends on OF_GPIO && (ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST)
+	depends on OF_GPIO && (ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST)
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
-- 
2.45.1


