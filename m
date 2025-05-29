Return-Path: <linux-gpio+bounces-20760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D0AC7F40
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 984D77B136B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED172327A1;
	Thu, 29 May 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eGS1Igyc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E822FDF1
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526575; cv=none; b=mw9xK3wKYy3aWzAQQmhtbNENkszl1M1cFLj5QZhZnN68KvPd0UgKQM5HCim5agS5d9UPffA2UtXo/FJDFGZC1nRgN9CtNrA9vhvpEa5+jSiI0S7EBZSRrzJXutbsuag2HUPzJdiRypSEScDdYe2AcWryrl6XBph8np/NuXRjPcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526575; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnaqLTs6sKPLQ6WXA2A/yHPi4PmD3BH9jMlJjOMhszNUYvHMyP+qoxNvdPavv2ubiMD8qrl4JVWHsL4ieYd4FzMgzLn97I/yUyahZRz2J/Ap1cYwFw8WWnqc8cCWfU40QeGerKGnjR35FprKk/o3CJsh6/DD4MfOECG4y7jelZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eGS1Igyc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb39c45b4eso133431666b.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526571; x=1749131371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=eGS1IgyclvGSIy6260QVKug6Q0q5318WFzJYqZpFW2iiEJRks596dnO0gEv7Mts1jQ
         vP6w5iMVryhjTcPJAG9Zuk/MYXUL76oKXan9or++cRwzkImkistF80MieiI1oz3Oo+ek
         X6K7Nwa65BCxfawoNNE57SiLEDs+6RAcESlAGpsCvZPSTOQZJyIeeIpzziWUPPHJN4xt
         6ZlR8K9uoaNJecLTZf4knKI6qI1xy12bhrerEqe3Bv832ypvT50gvmGPwKxFoAQmEcjg
         DWJyKRR8XLkx0zgi6ycwn9AYrOXB96R+bNjPVNss03usyD6XQyfv1uvP8emZpkg8nMqZ
         nEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526571; x=1749131371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=CWoJyL0rNFts1J0TZTkTf3WqVIoATx7Jj8Sd5ibwxVcqApKN+jrAxMQqfBNo7vilR4
         POOy/Az3/oBzLbrlET+uchV96D6l3Lry2WyoYNDZJpMwSgaRRrL/mEZtDXk9ZKnQGrD0
         mayWTZfpYfeRW3rCFgkKbB9OEXlj23N8lmQcn/VDMkb+w06frEKEfbkgM+ckfsGvlXsD
         BKa8UlsMzGVj1Qv5Fte1p7939DF4nwOw51kiwUUcgWOoHFy/XOrGNVI+R9N4JPk/M1D+
         Wgk6LDJ3cM6ynDm9HD5UdUyTTPeSSeB/8tIC+J45LRjDBQTJUW60w2nRqOoi8oqhaO9U
         UB5g==
X-Forwarded-Encrypted: i=1; AJvYcCXtZZaXbtmeGarIhBv4s8h3dw0dtGr3NT6kVbyZ8ZBfTkhEaXKilBZG8RAv5PCWkFgdaPbkkLrU3A+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg488dd+URZlS5ep/cyxEBKwmd9sCtiSibhNWzN+XQw7XVgg7m
	436bX6CTsRj3EO3eij7dJhkjc03yvgkqaPZionWGReS3ofXg0s10IgaEByE4tz0yG2Y=
X-Gm-Gg: ASbGncsNBLQ03h6b639PcIJ5N26u48RiKT8Ye7eT7zjofmB6csZbjeQvvTu9Vn9nvcu
	Ne5HGYTaEd8qFiFFGAvPApgl5xFoj72ZEkpws8Hg+I1VCMxRdXJFOSDuHpWq8wbe/9u5x84jWPu
	4v5ByRyHgLKOSVN+zjdHf1Rjh9qi1YJ6KJKpFqbnWwZ06/bVlZThA1jFKNmWqT0Km1iim+6uqkH
	+IoB5SA4+R9ePXyUYQBZ1TbfS4ZZQU4ByAAopEyipCqWUSL8u+Ao8xRF1It0z4gr7xxOSEBDOPG
	/1xMA/uYJk12N4ef/2jInXW6/RcPIUl6dvn2oF4dqHfeZ/xuwAZDpuWqBasUH88oGJl98n6GQNF
	wgwIY9Y7aYktAmBhc6q1icg==
X-Google-Smtp-Source: AGHT+IGTIeG3mVlDM/pGEiWdSac6XNjdCnFnJho9+z4FTO/GHQp7LGbIzdlwn2yCN4YylKzaO3lweg==
X-Received: by 2002:a17:907:72cb:b0:ad5:6928:1492 with SMTP id a640c23a62f3a-ad8a1fcd804mr607783366b.45.1748526570900;
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm144764266b.183.2025.05.29.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:30 -0700 (PDT)
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
Subject: [PATCH v12 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 15:50:50 +0200
Message-ID: <20250529135052.28398-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
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


