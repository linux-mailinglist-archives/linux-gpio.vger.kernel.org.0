Return-Path: <linux-gpio+bounces-10131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597E979479
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 04:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780891C20FDD
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2024 02:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC6FD2F5;
	Sun, 15 Sep 2024 02:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eaE2rx/9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681BC13C
	for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 02:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726368222; cv=none; b=aTKkmvhxcr4+6KAb4CtE4tsnVAQ+MpRx/0GLDIUK4l8dx7YwIwDFb3lBw3gk+BXYVIxvWft3GtJe34kxPL7gnck7Yw3GCcyN/yuF8vuywQ8iCvJ06clXvmYd9b7OFPBsge2mlTl8V0XmR0OSZ3Sig3vfeJeGn53q2rgLnfuXGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726368222; c=relaxed/simple;
	bh=nuMvhK4B2YL1JqNj2MIqtLUPJEThULLYeQBNub/zOuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAt8UBHABEjOQVwmkpT4fTNIrxykWn6WYMhU5p02qFAYtI0Cy7C4eG2cQJuDtvAnE+cB7GBiEvfig0vvRyzsJtZIqEAcmczC+CaxDSG6ow5QJ3QjjgFv9K+e+q4CW8A68vbDaIE3RXUakci1NiZTEu2vIt6GeboglhakOLrpxWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eaE2rx/9; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbc9a60480so18798877b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368220; x=1726973020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=eaE2rx/93j7gAhhJR1epMe7vq/EIuwjTWEepuD0+V5to6WEsdoXY3ny1BM5zWnexgL
         7gvXlFVCyVwyMoB5dvM5pQHHHR/PYiK1qeUy6du9wyH/xnijN0ufLRdooM4LMuxHt0R0
         tLnGXngkOLdHJUtvmOaYUPplvFtEiy4ovDS6vmvgm9RJmZYzJPXiGlAZxHVRxvBWC/Tz
         wB9v1EBLk+F0+QJlvIhfafJOh6e93r40Ostl/3jYBqopgHHZza8yxo280J5GSKNS8NZm
         JRtSFAgozHN40sV0xk1816sLpvUQnKgjtFFU57noAj1U97p9YOdXkoX2jSDzrta9cc0w
         dd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368220; x=1726973020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/oLJOaGdN8OJwPD6NoJC1cI8myFT/cKMaiS1JkV6LQ=;
        b=cWlQylDzsHuQO/S7fictqA5miUdnZGuqLhNv6VT+lAOqr5o/x70pPNKCIPWqqVfFUe
         kf54jj7wTCLC95oGPTgZlBiXP3G14tdPGgGtET7Av8oGUhe/7NL/+gnW7hyH23Wh4nq7
         iJb/UtaRpfc4Ht7IuCSgVphKd2OD6c/J6o44Y/c40Y5GorZBoAKMddJ6CPFX8aBxEFPi
         1zxYWsZb8Vl2VJLo0nENK5ppOFKYWV/c0k6zGpGONgamuIuu6i2qVJftD1JN8c/Eh0MH
         j8ICYUFntXTHznYLgmJbXzqw6DVNmpP0u3UdD4gQ7gfoyVh38KKBGYM5Qj+Cc6zcbD5m
         GUZg==
X-Forwarded-Encrypted: i=1; AJvYcCXDD+orwZFBy2ZkGfNuk7CEIjVFkuT+LKGjr8BBXrthbDaqAy3ztBbFSGqsUmME/5ZKDQhZsytU302j@vger.kernel.org
X-Gm-Message-State: AOJu0YwaST7UXWTzj+El/Flc/njHYb869r4Gv3rw7io6HmLyFma9JzQT
	7ylqgVEhdjOTIdGRX41Ugl6Cbe7Mbi4A33I+FDyGOlH+OkHJplBmlSgw4nzCw9I=
X-Google-Smtp-Source: AGHT+IHgtKYdkQzGTUjtDGDlZx8yYEHu7Pmg82NTgYIWtYxYiQsQ05Cr457i4bcoTnKB0UNQZg8r4Q==
X-Received: by 2002:a05:690c:385:b0:6db:7a8c:6640 with SMTP id 00721157ae682-6dbb6add9f4mr106171627b3.5.1726368219617;
        Sat, 14 Sep 2024 19:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:43:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:54 -0700
Subject: [PATCH v2 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-th1520-pinctrl-v2-6-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 530648ad64f6..276f7e8a2c9b 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -41,6 +41,12 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -60,3 +66,36 @@ &sdio0 {
 	max-frequency = <198000000>;
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};

-- 
2.34.1


