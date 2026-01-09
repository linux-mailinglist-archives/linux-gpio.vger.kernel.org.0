Return-Path: <linux-gpio+bounces-30349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65FD0A7D7
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4056E3035A93
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0157F35C1B7;
	Fri,  9 Jan 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gke2i48I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8A35BDA8
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966269; cv=none; b=D18Wjt5ZnZDYO7vt4g+hOpSDGehbc60JizvXwukgEHVQKnu1zzmgDcbkwuPjTibyzBe++tfueU9kR9zVMR+vIYz6vZxcLJK294xp2O5sA4qgfnN7YFgdbO5nueXyfYbOr4eZ4g4e97AKAVTrnHLf4TGSOcKoTrTeMY4ocByD7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966269; c=relaxed/simple;
	bh=jf9GAe5/XNqHlZ0uwLx04THFw3xzh+ejemb3PhLVe2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX6DUjnSZmzUCse9qsHpTkgaCIc60cz1DuGpUarS/ut1sQ5z2lVBi3CEHzDao7fhfeAeXkoEB+yPcs2MU/05ydNQEtzrACCZFqul+PNDoqNOHm67gMW2zN7F1j/xYCdjnkdghSL+BpDV0tCtZ5e1argZKEl1/9nf8HsPG7adNlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gke2i48I; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3449849f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767966266; x=1768571066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vV3VW4TRk7vZrwF4cTlZDuh2FMXs4uwC6OYZ3cT/LdI=;
        b=Gke2i48IcfjM/bRpfxBtqVu8ltAGYvhcufgkZ3Zu4eVnd9Ze9rj8brM6F73LutVCR0
         NT4VZAg/Z10756miBhKhvCnMQ+okCN0j7ZvqUM/DYMt1Er82BoHAKJfgfgRZBE36qw7y
         uQEgOphk/A5Ib8iy7jO3A18XHuoUGKC825chLrKYlidA4UO1YNAELi4ZMu4VJrFmVUaI
         lJrFLnT+U8w79/ex9HeVuOFrnPMUtF3Ar+RXKN5E1fpCB7f4ZDZfj4OfvRw3xxOc80IN
         s+QShDtWiQTwfLCC4wVQXron2aMWhovuqsM3x6Vhh9rCUJlXeTfd+mYx5IHrAw4xpJ3K
         +itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767966266; x=1768571066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vV3VW4TRk7vZrwF4cTlZDuh2FMXs4uwC6OYZ3cT/LdI=;
        b=SFAZ+9GEfcFe5/YESV9e7Xq1uT/u6j6OiHpBpneOTQ6Yew4Gr6ahmqftkPi60qXw25
         ADIo4sogWRbrm/UKYMQUriHryrWy/ZnWCXZ66IdALQvgcS+4yiFi/jmZcA28IQbzYFMh
         p8dJi++WAHXooANu0PWslUuVO9kVGbfGIfAhZglEUMRdmgwhmXPbgAwiGsyh3QySfxey
         cXb5pULnlPlW9NphClIUP5oYKVEQ5vh1JuwNdRFtbMEx0+AaqYMvw228qsvRZVFBKnHf
         VL+edGrHun9lqLuaxCVDq127U2KkjHSAJuQoWW3dq9x97l9ww/nTnoC83or1SsXiAxe4
         kNyw==
X-Forwarded-Encrypted: i=1; AJvYcCWfDICgFAo7RS/HklhHEPANB9ZxkQW8bYXDx7EPhar9pqug3Q2QxaKtR84uSvB1r0O+EtSOfFUw7p94@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeHSP8fTch6+KEXIw2RoeT36IEYRB4gItkHoli0uOuEr/F6PT
	A2ZxnjfN96Ze5qkGSwOWaZTsbgscuOjBJ+4lsjyqcd/rAi+rTvK4/NVr
X-Gm-Gg: AY/fxX4hixQVcqpQ1xlJi2gfyjG02705NICo0r624CPBLfGPcdReYeYA22VbWVGMLGQ
	OU9wgRanN4OZhYLaiOf4ZDpWwKMD6AJuKFTF0oqg2t2C21/7NVULrICqz+qRz1AuekbjnBn8NwY
	d+NfMUnN4po4TE5EdJUjw/xQNQ2EStuTxjvXvjmx1nHNfHIqpTZR6mquq3ztwHPVm1iE+KzFnVA
	iySHGksicWEbke6r/AI02HQ+0btCFLKpNRz/+D3iVaiWQHBPko3ApXkdv7cRRLrXTwgj9C6pQZI
	WUcEF47GVBcldo0aghxrG9Eq0wvxQUAscihERAv/S1fhX07IfBDxmtKAadQCUzcz5GYy7ezQsTX
	3BoQM6AbWOJYoQTp68rjfHeGrWF9NkLo+O01ueEr8qIBb/y0VP2hfb2VAaamlG1k3T/KRKMttYL
	A+Z/Wi3KawxHKIN4tCh0OngBVpEdZfZcxa89Asd163YCdDoItutLtCe3ZAGqcJsYHa
X-Google-Smtp-Source: AGHT+IG/REh9ssKpIfP140JT4H5xk1mVz4P63JNqcaC2JTUABJbr0Ck3OTN6x5dTXPTtf9t5owUMcA==
X-Received: by 2002:a05:6000:40cc:b0:432:ddce:284c with SMTP id ffacd0b85a97d-432ddce2b0emr1487056f8f.17.1767966266056;
        Fri, 09 Jan 2026 05:44:26 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm22111616f8f.18.2026.01.09.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:44:24 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/6] gpio: mmio: Add compatible for opencores GPIO
Date: Fri,  9 Jan 2026 13:43:52 +0000
Message-ID: <20260109134409.2153333-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109134409.2153333-1-shorne@gmail.com>
References: <20260109134409.2153333-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On FPGA Development boards with GPIOs the OpenRISC architecture uses the
opencores gpio verilog rtl.  This is compatible with the gpio-mmio.  Add
the compatible string to allow probing this driver from the devicetree.

Link: https://opencores.org/projects/gpio
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - New patch

 drivers/gpio/gpio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 5daf962b0323..edbcaad57d00 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -724,6 +724,7 @@ static const struct of_device_id gpio_mmio_of_match[] = {
 	{ .compatible = "wd,mbl-gpio" },
 	{ .compatible = "ni,169445-nand-gpio" },
 	{ .compatible = "intel,ixp4xx-expansion-bus-mmio-gpio" },
+	{ .compatible = "opencores,gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_mmio_of_match);
-- 
2.51.0


