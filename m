Return-Path: <linux-gpio+bounces-29668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7C5CC645B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 07:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0837E3075C2E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 06:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FA930FC01;
	Wed, 17 Dec 2025 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ftx9YPMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB430F53E
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953173; cv=none; b=VWSIcZ/bG2bx0MgpHSORPBoC4/CAOSwOKe2Rh8M1L5yDNunm34GertX13IWiAvdzTfj/Q52ouGmEWpTG69GpAGkp38esT8+6L12ujOjsOgbzR/kQDdhJ+f8TbccpEV98TpWYaQwc10RvbkZVlm9dXblNJyPY5y72CjxwWIerUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953173; c=relaxed/simple;
	bh=rW5DsqsMjWWHjQEsYx8z72EgddoKroWZmXvjEjgRKCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSPDIkjgmsP9VNZba91kAaPiMTXXz7ehODEbn+qsEtbRELqfssxUxKV3jmukMPASOSNHxqn6OMl5NTOYpvObFkLoj4/ohn9odOvLWvXEf0Cs52C+41w9EPhkqqiew8OT6pqKOOuOVsgy/knE6uNqLd7DmBUzbwmwXDoS41uXrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ftx9YPMT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0c20ee83dso39668305ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 22:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953170; x=1766557970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAuFqjrPqhJgxHFq4ApQDcmO10xNy8KFtK32eik8LWY=;
        b=Ftx9YPMTRTcmeFRRSrN96LuwdSqV5KJOWzwGAs+91qiFmoQdYy142joCTj/dyvj0Ou
         DRu3v9Y/AVk8/A0WmY9fCVfwNDY9ddCAbI6hbxDqBpiHdxmRB+FtNok4MCSSONFfnwDN
         wn2pAxv005ZCUAh+eUg2m6iYEvA3sXu7zWBKM4nESzqhicX2G3CdzKkUUoJgnQy+egx+
         p/7jtmAlTPa6mKE0BQoG1xLGn1WEF7j9I2jHBmOnxHAqB9jomSFICE00SIClGO1oMiN2
         4gIiW/MzyhwI8iaWIDn1yUc8SaQSXMSI5CXu4zKtbbDT7meHZd1v+87VKZuBKDfVk6uc
         avQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953170; x=1766557970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GAuFqjrPqhJgxHFq4ApQDcmO10xNy8KFtK32eik8LWY=;
        b=XrU936tUmlaLvFmjrnbtcUpkBFronQ3R7uKeOriGB6G0FvFMrs+FZw58Z/EnZT5YDp
         DBHVXXkeoR08R5eOmucbnNtMI4GMsbEIKHAuh2vv9IRocqkEeBg+d+rxfQ2u3pIfKF6B
         u+c2DubeOXHRH0mGs56q8vrg33qTqeR5rTYgIhEh99BzWdoHe8/XZFRkJzTPuDVF5mSJ
         mnbT1KDmI4r8x06PBRHR/wbaBcMYI1kCyqHRIz2GWn+ge0vQkFHSWuJgX0V2I5PeY0c4
         Xpt8HrjGfTHZazIayJsUnaGNVAUxg5Ga+oi8NQ38p8Zy7mhpksCzvFSYYOh+OR8PMp7n
         LcZw==
X-Gm-Message-State: AOJu0Yzijumu4ZKud7qj+K7heAzqie6sUQ2ccoFD5MGNRZcK4jobB2mN
	gk8Ha9pUdRckkph/V3ssG5Cs5tzKDiv1HosQVEUYhmAeUmkQAmU7tSDrGYcSfg==
X-Gm-Gg: AY/fxX5TULsQ8T46qFKSIAcoBU9T5SjNpPcyDRM7WlRdcf08egJhS8Yw07MTXSHkipc
	+KRTxo0a1J1dgY9SocNYFIK3KkgMetYG5sQy0VNpWEIAbexIxUpVgEpBQTJhxJlz2UwouUkGwym
	qMI14IRWctQFJZFVTXKFLq6yN32Dgrq+JLtmUeq8aVxqC+rec/GaWMeH1HEQA7wS63NBE9BN03j
	aIOmPBIYd2W+W+PZokHABcQrsHPdtR8meRTx4ydiLzd/3qlYbh/vEpMQaglidv6VLYyBNnCEcvC
	WLuaYOBGt8E44unT2B/EFvCOWREDjNX02RulEyUxmG+1Jy9hJN5IMaR7Ib8A/v34XplFbJVTLQs
	LvKr7lJISIdillN69NX9/KpkVy/TckNgRLTmZokbHqc+XaH70lOq7xp2mhA==
X-Google-Smtp-Source: AGHT+IHudpsqgqJ7Pe4ds+hiM2td2fNRGmgBuTl2BOB1qROmTwkI/CR4t8ZKV2sv4NUCyUWIZY0O9Q==
X-Received: by 2002:a05:7022:5f14:b0:11b:78e6:8323 with SMTP id a92af1059eb24-11f34c39981mr8587226c88.37.1765953170349;
        Tue, 16 Dec 2025 22:32:50 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm61454672c88.13.2025.12.16.22.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:32:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] gpio: realtek-otto: add COMPILE_TEST
Date: Tue, 16 Dec 2025 22:32:28 -0800
Message-ID: <20251217063229.38175-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217063229.38175-1-rosenp@gmail.com>
References: <20251217063229.38175-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows the buildbots to test compilation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..fb6b479700d3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -600,7 +600,7 @@ config GPIO_RDA
 
 config GPIO_REALTEK_OTTO
 	tristate "Realtek Otto GPIO support"
-	depends on MACH_REALTEK_RTL
+	depends on MACH_REALTEK_RTL || COMPILE_TEST
 	default MACH_REALTEK_RTL
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
-- 
2.52.0


