Return-Path: <linux-gpio+bounces-10953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEDD992C00
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01104281AC6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F521D415B;
	Mon,  7 Oct 2024 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OiwRIYel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB8B1D319B
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304794; cv=none; b=TYw01Arfg3AmBM30l50V5uQO3fazIZFunh/B5GUX+KpY1C5QWHfWtWvn/U7uaPdaWYY9gVltIXDzflq0qyuYzUshJdlLrljaExFqVlYMqwzSVT+7fwV8ChWmH3dUP8AwI2+6Mv67o9ejTf131qhRUWTaGV0rVsGONizIEpfuyUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304794; c=relaxed/simple;
	bh=wzpt7n4M0YQABunSYCuMvT4laNaolsnpT6JGQVQisq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVo70vC6SlkdW5ZvWJmWYqpx17LaufsAlGVs+6zENUNuGGsu1a1kkVFyA5oxU4NOfBDxF+XjEsA+bTgpJrbO6l40dV0ZpJnVMqRor1SR9JQHPoebn4DwOfCSrYEx7wjNPHBUo+8b5zij42RnqRVnRAZ8PlXEkpiW8qRlVrPW9ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OiwRIYel; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso318475a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304791; x=1728909591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVy087ignhx8Qr39VRDg6uatjxWZzzMpiZVqjT/QJ18=;
        b=OiwRIYelx6+by84RJeb33NnCp/tMnvOo0TsScuzfiTUUHgWBnTlhKXsI0uSAXpJqlc
         4SWs6eX2IUPf0mtYb9i+qnxSvV3Jric6eU8vEIJ5AJROLEjJDJsPQ4nRercNpfpEBGpw
         EVF0CwO+JgMnXsqTdI4yfJBxvsh1DHLYpfY/qo0hxiIsUUazhSgXK/4oukjJDVpjPw9u
         cjOF5Xk9N/mzMbBGsPl/fFg+PsWX0wvWsUOSpJtV1xcIDU5K7boQfSH1+sPY3a56wjAU
         qV+CKFI43791/VU48grJwB2u4mBYNdxkQtfM28cSWA9oBsIkf2QcCe5wdiNURODHUMm8
         GAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304791; x=1728909591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVy087ignhx8Qr39VRDg6uatjxWZzzMpiZVqjT/QJ18=;
        b=YuszJiX2Z/v0qcRX9M9dbrFchKoDzucfmT/7il1746DpDR8GwH9RG+gtaoP1NmJ1MZ
         yotb4l67hXl9F8sFfirB6dt5puE2NvKMa2Y+dnSY3OouWNUEp4a/0UK2yS4g9KTuKPIU
         h/yYlLDezyed+BMTUemd5S67KYulwIwELBTeu91jTa9Xe4HRuUbLlAy/3FK8hlZ/jdoe
         Vcd8ky7UPOPE+7Mr0YjJFWLv4TlyxRbBu9gMTvFZdcTdQAhARMcWIt8rwvFyKVfskYrY
         Z4qVx7a5XyojAo3Wyy6FJvCDkSLpEw+4GwoYH2Tl3x24zq4NqQPWX3SyU68MtxpS42Ar
         Z3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWtETNjnoD9M6aAvyNp1Bo9QZL42zfRh9anTZec2EZY3iOh2Zmis3KkZbcwTcJmKkiCNgXfzIAzAH5M@vger.kernel.org
X-Gm-Message-State: AOJu0YwUC3EKsmYryJYEEBN9a5IJhEpyYoU7nsiubw80vUi/Op31ZNF/
	Is0iZLWY7mFdiILR7WqPlkPr23CBCeaweHVZ7embohk+gsSdxWqgOlSxcQQL9HQ=
X-Google-Smtp-Source: AGHT+IEy5GKg/nXhQMQUn4foWYz0mYMSu2W3P06/cB1glnoAkN+XlhE1TotI+oUpl1LOtWN5zL42ZQ==
X-Received: by 2002:a17:907:60cc:b0:a99:5b7f:9e3b with SMTP id a640c23a62f3a-a995b7f9e4dmr208232466b.33.1728304790890;
        Mon, 07 Oct 2024 05:39:50 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994787fa61sm239841166b.169.2024.10.07.05.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:39:50 -0700 (PDT)
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
Subject: [PATCH v2 05/14] PCI: of_property: Sanitize 32 bit PCI address parsed from DT
Date: Mon,  7 Oct 2024 14:39:48 +0200
Message-ID: <c7eddb5f95e08930007ad2516589c7b7cc08b3ba.1728300189.git.andrea.porta@suse.com>
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

The of_pci_set_address() function parses devicetree PCI range specifier
assuming the address is 'sanitized' at the origin, i.e. without checking
whether the incoming address is 32 or 64 bit has specified in the flags.

In this way an address with no OF_PCI_ADDR_SPACE_MEM64 set in the flags
could leak through and the upper 32 bits of the address will be set too,
and this violates the PCI specs stating that in 32 bit address the upper
bits should be zero.

This could cause mapping translation mismatch on PCI devices (e.g. RP1)
that are expected to be addressed with a 64 bit address while advertising
a 32 bit address in the PCI config region.

Add a check in of_pci_set_address() to set upper 32 bits to zero in case
the address has no 64 bit flag set.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch has not been changed from the first version, discussion is
still ongoing here:
https://lore.kernel.org/all/ZwJyk9XouLfd24VG@apocalypse/#t

 drivers/pci/of_property.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 5a0b98e69795..77865facdb4a 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -60,7 +60,10 @@ static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
 	prop[0] |= flags | reg_num;
 	if (!reloc) {
 		prop[0] |= OF_PCI_ADDR_FIELD_NONRELOC;
-		prop[1] = upper_32_bits(addr);
+		if (FIELD_GET(OF_PCI_ADDR_FIELD_SS, flags) == OF_PCI_ADDR_SPACE_MEM64)
+			prop[1] = upper_32_bits(addr);
+		else
+			prop[1] = 0;
 		prop[2] = lower_32_bits(addr);
 	}
 }
-- 
2.35.3


