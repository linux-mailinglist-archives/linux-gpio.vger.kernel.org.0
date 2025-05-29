Return-Path: <linux-gpio+bounces-20712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08DAC7C39
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A409E1C04786
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 10:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1A829009A;
	Thu, 29 May 2025 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q3CtZRCJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0528F959
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515698; cv=none; b=S5lO0yjBsFV9jzfB9uG8SHzc/O8bmG3vHBQVGmKCBE5B81dg/mvmnpGqJz1cW0nEDhVRMn7brA1eHEfqsU5+ldYncXrimn1sqYYM07Osgf80UIQdJSlfychLIUp5lC3r1E7+yFhIfRuvg9V42FYa9QQ8ixmaZmU73v08cqeWq3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515698; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogf7fBrgditU1QdEJebVFuuVnKZ7MaDyIQ6wsWMwcc3eGbgCtJkdmuSPtIeHkh7WGPwdmhyjH2jtOfgnPI81clN5vuuUHkJCvMicywZlGgga4gU4HdD2yABSzFH2tT/pPDsNI5xx3SE36eKAiB0TN9D23BDDfJU8qr4ckg9ciok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q3CtZRCJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604e745b6fbso1435258a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515694; x=1749120494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=Q3CtZRCJowoXIw9k5V+3iZoCTdugPF58iaqdfcqz80heP0XsjGP0ABOSveurgOuHYE
         GHm89aeuaU7zghhvq9/WpfhwyhDFWfsHIiBIpUc8JZcguiJTz3BJ1cqwpyGZS8dhzP4F
         drGimBhYTxl3t3ALgQMncORgvKX9iE4HO4/S45E822yfoGb2EPnmH0fCz3x0DD5MAOSc
         ezPmAq4UAUU+JbT7igdYJmMiAWShIssFwVNUlFlIUPLwewCpL/bC8H75h8z21TcPBl2z
         77ZhBj0KvUfYH9+5oOfpBpMnenj70rKWikvl9R0Pp8fwbkUS1ju5hH2DHoIozYrLH1Gd
         xKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515694; x=1749120494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=hBtrK3Jn/T9dKM4YwPx7mhfaWsbHQd3oH4DAfYPC+3CIp/6PsQdMsO9sw5fgDMFXhn
         NHp7E6pB3c05K3nXIu5oyZJcLb+zbAjHDAhMyJQteMng0bMN32H5DNJP/kWUBOh2Ba2m
         aKWh+49BQvoTRiT2e9dGXrQ9xsJ1WBzoNWa6Bg+/WnVYYpFUGxmoTlWlYf6SInl3SJaM
         3tdLmKRr0upoXon2Hc7MPVlerXlxW7w9ZTJkSftaH9CyVr6DEwjbSbyuu+m5+q81nixH
         gppWwZcVkAA7nJ/SD5pXTgqz/s2+mfbbkQ5ftvaiqojC3gjbXXaa+Xnlj98D5+TWbJ14
         Zi5g==
X-Forwarded-Encrypted: i=1; AJvYcCUSWrVOqH8CDmmGMdDIm98mpvqq2f+nHqcuJHyzNRraAzwGDtpa/md+uzgi5FY2DzbI1HpD4ecksLIY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Z7MmbNDlcOyUKgBmgwb6j/g8hp2KdcWpndDcFFBChuR0aW5W
	dExH44jziKp/Ivnnkksm7yOl4yfkFxlAxHipVsQrTzuJJMhopG/iLCzqxU/oCD6fUMQ=
X-Gm-Gg: ASbGncvTQSvjizg0GWkP7monRq2WOfURzz65qcKt5fR/v9/2rpe351Lya6FDeGScTh/
	OwfnR+niKdP+pvRJCl4iv+650tiUsKdOM/HUj+M59e28e0stn+dMLXctVwmXCTL4gKQxUmWKjBv
	nn7JotjPX2oqa/QBy7dhNf7iBBRNYLJ7bP1TWiPbDWyUSozWgaF8OWj5+0NW2XirnhZyVobfLyF
	Q3b8Oe2GqT3itMqaE6xPQEnsO8vnkZE0GKuKxfzFcQEk5CObDL7bvQJn8rVXMC1NojOaaAoPyUY
	mtiyeer15nultZR84G7r+NdF6ce59nmTcbEr80Kh6YfaXdgzO9/8TaaRJJuIEidaq2KFDBhcgtd
	U0msrse+xAS08fsD6bQZhNQ==
X-Google-Smtp-Source: AGHT+IFh2Bjt/nqjLOv5kZdMBtyzXg8Cp6AwiLw6gyh2kIz8WiLSbkCwXlnCYcseB95A5qV9519CkQ==
X-Received: by 2002:a17:906:c152:b0:aca:c38d:fef0 with SMTP id a640c23a62f3a-ad8a1da7029mr467304966b.0.1748515693881;
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aa17sm120147166b.175.2025.05.29.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 12:49:30 +0200
Message-ID: <20250529104940.23053-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3


