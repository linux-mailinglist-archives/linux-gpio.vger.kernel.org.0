Return-Path: <linux-gpio+bounces-24901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619F0B33B92
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9116748734C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A208A2D12E7;
	Mon, 25 Aug 2025 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w+VgnMj3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3D2C0F93
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115335; cv=none; b=itrvVbVPY9g8n83SVMrJUXHoL55jy1AH8/lrwzhL1z49RYbOFW1hNp1AUkaGUcl/I+fuRyUNt4wqJL9MwaiO9h6gL4wf5lN09d74v9uZLTpvTacTeqpEycJGakw7n8KZPAYTJrCDNCeAUxLiPCgpckv435PvJblSTibVC2U7588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115335; c=relaxed/simple;
	bh=weXYtvOJal0gfVKqkBOQyBy266M+SxjHRozHrgmLGEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M67vKoDayrjUEsVr0y8oF5LzqzSGOn3jv9/JPPWvCgCLg7AIeOgr749XzcGtWQ82UeXJmTVBu8TQOK53+iFl184AhZ5pQx3Xeh94TPUTjRZA+vU+aT8gy3Qq8VRvzVDAzTOo9rWWR83LLW9ZzLklx9jtiTUzrku6qHT4R7eUSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w+VgnMj3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c68ac7e1c4so1096453f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115331; x=1756720131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=w+VgnMj3fcxH/OnWntMR+y5kK96i2FeCGoHda3nR3gZOe3mzaeLbCdxOFHBqAy7HtB
         U/+GHw13rUJw2Bo/Mx0llCdEq/Fp0NaumM0JustMcVH1HyWder9AchQVwMTpwJ3EW8qI
         +Bndk+LSxmryJkkOmX4og+M11bq7JqqOcVDg/4Bs33pO1/aZnrxmNNZvm6byj03VR9bP
         hBdnTqvMGC/Fx7NJNUH18XjbdrS+w8zxNeaDi1VYwNkO3pWL9UTtkAipA3c1ZEmEL8gW
         shiq81qkbzM32SDilgr5aGxOEKaXzFURYhLGeX1o6bPZPnYc3o/nqoPvr3LJKve5byK/
         x07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115331; x=1756720131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=uywTc0kmvFT7Ro0WojpRG7GZ3e8thlqEsdpqBktOjfZ1dCR0t5Qec+EUIR5a09wblY
         XNQmZI9WgZFpJi1FFAl/i0Z2w/kd0CEgJLfZ/VG4GI7zLaiwKixGThvmGRAMgWjIzwxn
         NFXmNoD/kZX1aUjuuOkA42GKPZIiUFSoQ+/agCp1dfOftqXftBPu6yDKxsrGqNKEOsH1
         CKxTC6F0GYEWQwwneANUjfPLf4gcdqOEwFwkNX+796RieGnLVWY4GmgbV1P7k6dn1L2w
         NGqSzmXlWXb4vQ7r5FH5BulDpSArBJLarlw88Uk7ElPJDsJtfwSCC7axvhrNU60GqTPf
         hN/g==
X-Gm-Message-State: AOJu0Yz3N63g1E9C3kGkJD0Db+eibLIiaPBIrHvU2yJ5Tvdcg1qdUs0I
	NP5NcAKwczXPMl9GTD/Nlvw32Js1N8Cfcv+6iATsoe3PGrmCl1O77+ZBajl+WW+vP/E=
X-Gm-Gg: ASbGncvuJGjYeq1d5xvbz5cVA0vZZRjqJjNKmm4h2dbs8CEtaNxzbMwcQXUMPcsW1Zh
	ZbJm6+lQjoSs/r5U3ymKC1k3GX/9+MDJMXSvCCYnskWfVNY/mITHAvWO6ewt1DyaMOqg7CwwiMc
	Sa3GbiAuknkGwQyyAymT/F8EgV0wVutpVNWeKQdVxVpX2l/1WLWSsxiYtXfWeJ9X0NrqCNvYsob
	WDlfvHYXEbdQg69NKLbu3PxApEJV3OYGYbl7avFJ1RAhIImc3KK3a9RWp9qq5LVgbkrqK4NbAlU
	TdAQrcibYhXZ/+2c+GzKhWIgEWWNT1+OBxb6PhiOau5CHIEwLVuXIECKQrmborQP9Jzl3Xcrimx
	rrGive3NKFzCSs4TtvPE+S8lAu84/
X-Google-Smtp-Source: AGHT+IHWTHIcMhEQ5HQdM6YoOeolJohMogAZDIPB52mBaKmxTUaFs5nkdQ77PxRV7ddsa+Y2+klbLw==
X-Received: by 2002:a05:6000:2b05:b0:3c9:9ec0:2057 with SMTP id ffacd0b85a97d-3c99ec03013mr1335028f8f.24.1756115330763;
        Mon, 25 Aug 2025 02:48:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:42 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-1-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF9StIdV+XMb86jGojQYOxVC3O+FG2OF+hdT
 i78Cbu5/oCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfQAKCRARpy6gFHHX
 crWhEACncvMwkOcPwHAi9aj2OHDq7X5SHxv8s8KrRap+M2V0ErklcQNs1GLob7iWSimgg2QnjeB
 qtJybnFa0IOrpakdguy2J/Rxhl3L3bRl+U2GAabp/gyfdRTE3wV1D4LkuAD37BAfjJ81R8pgHXC
 XUFfK1yQRSp+7Rf1NANuInvx4GYMPqcTWz7Ju8wI1BJdh3R6oTSbcMb6F8+WsQ2QzwUCFYCU+0+
 5XUpZSuNCZ4VHHgLWO58F0hglpj1zAyoPi3lW5c84DCfxfcXRgjbZf68zuXrfIZxNaoE1PXDTK0
 n+nqj2mmgKePqI1V+75Gbv8zLR28FTK/0/EXyERUgxRGJbmHBceAXX2fzFJpvmxYN5Zks/a/8XJ
 g8g5QzjfPG+UnFnGrNSfTEX4gcmuqSCmNITY+3PkFxd3AlVL0NnR0y8ZGf2EEzOJbUZ/exvWBhK
 UM6ox13XeBAuBlYx7ru6QTnvaJNiuLG/6enWBUZusa9cNfbnFNMSEyRIa6o5c5Bfbu3btwMHdmg
 NtiwGbECS+2PceI3NfqmGBIo02UcLUakC3+B+ACRcFZY+Y12U0OK5vAwkEVEChYTsSypiSvxEJw
 cc3WaWYVAUWxYNcIIomXMJtQYPKiUDDGsW37GBu5UPlonio/jlUxf1/ZS2zK43DeordcubSJzBX
 lDY8PScKDVMc3LA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


