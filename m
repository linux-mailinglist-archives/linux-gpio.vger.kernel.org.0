Return-Path: <linux-gpio+bounces-12247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A949F9B32B6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC1E283032
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06061DE2B0;
	Mon, 28 Oct 2024 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fwly0pM7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C731DE2AA
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124446; cv=none; b=NQ8MPwVW3MmLRIO0oHtpeIp1/gzbD/Z4DFTEgRBh6DBS2wPiHaLFhNMUnwFcBKoTq7o7Fn2vvVeks5E6WivmHk5HqEWKews7dw6hbulxwFY5i7UTTqpBLsMpIYhao6ghEE5MOddlw3C4Ak7w86aUoVTL1UGp5QRt/aK77JUyo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124446; c=relaxed/simple;
	bh=GYXHeaG8wpR2BIrXpx816pDyYa9dHkRtT9dpld+pBs8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehpoFfdG0uXed3xVY4tRFSGa5QL4AnRmYNMdJoVdMFiZ36vZwLmwyFkoiB1r/u/rymyamucMow9gLZNrsgzzYDhmJj3Gys5wYmtiSNCRHwqaGeLNCQjEeafyS/e9c57UMJgrbd3RcHK9dCKPQYGk84Ur7V1TZrmBv9TlpvrBTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fwly0pM7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso587623666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124441; x=1730729241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW6kvc4ZbQp7jOxwPlUXi8bHuXjPpwn11nTKKI/C1qY=;
        b=Fwly0pM7JZeed2l9/IOqhf6VXgJap3Odnu14FTJlEGBK9leaUm/+lGtlw51jL14whJ
         i+96cfa8Z4i6HCXX39/mC2MOE0yTiM6KxGDt04DB4uXFpN5bBhDU/ZNHXxQv7JnGDOci
         9C1mnU2yr7Ll0ONE/+Y5jxfxWJyMI3SFf8aF72UmQ2RVjc6m7pljGOyy7QMKqX3OEtyy
         WMwgTYTXUKvRNbI2mwd5YI3cPDfjraeyiPVSd8RaeZsm8V9FriEF/rjx9rl9O8Gxmcby
         RYJwTD7UbCHUCJqzx/nIjP3mI9pWXWDN+rV/u4dodCc0YBzdGZGafCzIh0sSTkw76M0L
         D8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124441; x=1730729241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW6kvc4ZbQp7jOxwPlUXi8bHuXjPpwn11nTKKI/C1qY=;
        b=f4oIf+370xTb1y3MQGPH1E0JRUhPFhadDLGZrKdWXCynqpkSyfe1Cp6V78sburgQNo
         dtMXsHmdCvmzyKW2lMJ0wStnwctXhw0vIdYnrJcXUNpyoElSNLwxESRLX9S16OZi9UHj
         ToNYKs8d0vM+T7z7wm9Wuhg3b9LH2m/6gEchP2OzcMQ0Mozf94+yPsnTp6LfoMqbVe0/
         cnh8XdaRW7R0PPG1ik+qlhI2j4s20Vl2rGaYLvMTpHnzA8Rud7D+8MZESgPW9Eg0B35l
         PioDalEO8pz0VULdmzxmpAqgfaXBoj7n7OiAFo7cHk4WMJEIyIYyD4HRv6yTTa/hz8kD
         SFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh2dfHQaP0Dqvf6NzXBN2t7x1e31FinJk40tctg4Zglx4ucLCDR+cEIjvUMwbFv8lAOLxh3RQNcs0O@vger.kernel.org
X-Gm-Message-State: AOJu0YyoUhV9v0jX5qJUEdcUJo8wvH7OFmECAloKcq0VyGzaOMEx4uPt
	PiphfthN1DmWbBFwxlfF3A/aSsEHLu/FtBYVZNJediSgTJlJ6xhzA6MyfmU32Hc=
X-Google-Smtp-Source: AGHT+IE5csQvNeeQQV2TiEg3S3V6yZpGcfTplYGENkEB1u6HmkJa4la0HF/+Zf2tdkb6gQWZYObepQ==
X-Received: by 2002:a17:907:9452:b0:a99:fbfc:5ff3 with SMTP id a640c23a62f3a-a9de5ce1611mr802908466b.18.1730124441130;
        Mon, 28 Oct 2024 07:07:21 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2982ecsm376935166b.106.2024.10.28.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 06/12] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Mon, 28 Oct 2024 15:07:23 +0100
Message-ID: <3029857353c9499659369c1540ba887d7860670f.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
translations. In this specific case, the current behaviour is to zero out
the entire specifier so that the translation could be carried on as an
offset from zero.  This includes address specifier that has flags (e.g.
PCI ranges).
Once the flags portion has been zeroed, the translation chain is broken
since the mapping functions will check the upcoming address specifier
against mismatching flags, always failing the 1:1 mapping and its entire
purpose of always succeeding.
Set to zero only the address portion while passing the flags through.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/of/address.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 286f0c161e33..72b6accff21c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	}
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
-		memset(addr, 0, pna * 4);
+		/* copy the address while preserving the flags */
+		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
 		pr_debug("empty ranges; 1:1 translation\n");
 		goto finish;
 	}
-- 
2.35.3


