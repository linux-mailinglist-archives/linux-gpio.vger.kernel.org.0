Return-Path: <linux-gpio+bounces-10954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C353F992C05
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBFD61C22348
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DA01D434F;
	Mon,  7 Oct 2024 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SfPm4Kkj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABE1D358C
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304796; cv=none; b=IzEQtyowWEcgjMzuZRXybjo3GBMbw8AIJtgYnPg96VLdN98MfuYpfmplX7Z+i1G/yfFOCazV5lKJld6AhOegOPVL3A5lHuseK/XXbVF3rwogFPflwQ/bAKH2smcMUFhbHQ0uhuNYDpvnBvCjAjzLbOzc96CiQKLcuW/iXAtcieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304796; c=relaxed/simple;
	bh=oF/rpJB8SDnKjbKxg5VT3ASBLt57E9z1LMpaipmd2+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qt5yYOG+oanrc8nA1MGMN3iznnDLdTCSnvVuJUoPCevjoap8e+avDif1cyiaYtJJ29y4sIfm0zgB+5AMHDWAPSM4DYk+LU3oCuTrw44QsMMGiYbZF3K+xJk/DrZ8JeHaKG8VIYi8GvbOhXnlpTzXWy0Hngx0xeBmdhiN+9Bligk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SfPm4Kkj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c5b954c359so5130417a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304792; x=1728909592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmMJCoFVCCoMSDMdNDybyaBIx5hGSa7lQNj9sEKg2KA=;
        b=SfPm4KkjXBG71GoPcKYuiGfZ4HG8hkHOY1l1nKA9ljIHhdd1wvJCF8nPziQaV5VPjr
         hjGhvaRoKmRSkW74bPwBJ6fvthxFD9TTUNbWdIaFgX2Z9/4fcYmYbv/7xh6jrU9YGc6X
         LG4kAGyk/fOAD5ddg0JXMnlSar/IGfm9WHvpuyA5qao1B+e5fsqD1mamCGMxmz/P6Wm4
         50QTh8g0A9xNrEr4ZFeasR+JiecBGGJqYqi1KFR5hsTpp7YeMPn3S4ASyeHs13i8Pg/n
         cTm1ByNO0cwySxBnp1z/1gxZBCF5jDdBtzQkeIkz7w2rnq/yrhgmRkbMaVGVA1BmebBp
         5mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304792; x=1728909592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmMJCoFVCCoMSDMdNDybyaBIx5hGSa7lQNj9sEKg2KA=;
        b=wsb6Wcc4UKLL19TZT+qR7cYbgEWmVdtFvzCy9+ipqsrq0bkarD9jRGSe6UvVqlcddq
         0UKZK5qAEGTb0eMFucRa5AyFqEbXV70OrsUx3T0hU0C9xR9HeERvEPpUBlxXUnGvPwqd
         +LbxSdZmeoPjoqP73mmpE9jMmJ1X675KJ2rSy79hy5tz1oY06q6jW5Lz+4AOOx0KeWT8
         NxgDJk2tGXLSXupOW87dvFhi4xqbm4+WXbvz1xw6k3F+Pv2EwsBo3sRJydiktL86jgPa
         uiiUtgKbnA0jToGT60miKS/aS/2XWI6wpNLOMDgDm54dcvgeoFN03L+pWptB/WDLwsex
         tSJw==
X-Forwarded-Encrypted: i=1; AJvYcCVRfLOSgCamzSqwI+p7fwMO63Py6Zdw0vziJBfcWFivrm2e3Co1VmLGH86e1nBThbfErhZXy8HbMSbd@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiR8e3W6aYEJNE9YtqmLA+pfe3gFByp/HvmEU0R7Vs+w59Cfp
	RQx83GUWl3HR5UMvaMVaWuXPtf2/AQKX83OlU0kn63gMNSXJUlgY8ialVrZa53k=
X-Google-Smtp-Source: AGHT+IHTBvg5M5ry0Kp6n2llss528AG1tMlkKm6Eq4xV0RUgVViw5ZHoodaCTq7bcUKV0kUcKhVe+w==
X-Received: by 2002:a17:907:7da7:b0:a99:4a8f:c83f with SMTP id a640c23a62f3a-a994a8fca5amr566416566b.5.1728304792074;
        Mon, 07 Oct 2024 05:39:52 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e664fb9sm377591066b.88.2024.10.07.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:39:51 -0700 (PDT)
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
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: [PATCH v2 06/14] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Mon,  7 Oct 2024 14:39:49 +0200
Message-ID: <3bda3b90df5a36cc902213383287e79b34195485.1728300189.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1728300189.git.andrea.porta@suse.com>
References: <cover.1728300189.git.andrea.porta@suse.com>
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
This patch still lacks an entry in the DT unittest.

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


