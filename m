Return-Path: <linux-gpio+bounces-30499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C6D1A286
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BC2630A36FE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 16:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DBE1B3925;
	Tue, 13 Jan 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHVkvVZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA5EEED8
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320916; cv=none; b=PoVbMAdMSoGGTcr1Fxz8UYywEQryJtSEwRuSmRb6ffiqVRaSeHACu7VVg99x3EUCEajTbJOJTVHt1fsbloQq++Lpd/XVSrDhpmueJeAb1ZzwF1Vy6gInmnrGvjDehEncSV/lBSyoDHn70nD/ZK1mGhUv6HG/pAazfFafxvLzNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320916; c=relaxed/simple;
	bh=RA2MpMFiQcW8woGky10vbDaNAxzlqZLD9Qto0cY6qXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAdyVlrKglzWgzv3Iomj8XjcMQOjzwm1U1vFvnLbux0IkqroNzjnEkCRv17Bgz6HzKXFfxpDO53O9MYVVHq5fx6QUCBNfkruuE2qenQWFRLacjH008HNaieVRFsT6r+QAMbFu7ZEgzNzf2jTLpQfmLFJ2dQrsgldsZrVqSbBSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHVkvVZp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so42937575e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 08:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768320913; x=1768925713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFO76MpaV7TKA3kGHuuWwQjUOsm9CcTqHJpQLHw5X70=;
        b=WHVkvVZp2tFn5fN3VtseiKJ4MUg2bBz3rTLusO4W+lEFKP2Yx1ZXpSxk0l+3Tts4l0
         kgrgL4f5xvg8bgqt1ss7OxTbRg0kK2MA2idmBMM9ZWlsmOHJxGoHA/0cLrQXjCF4BPTZ
         lgJ3LtWMfzrt3z0/2dHULeRYcZEW2cEIAHXahwm6H/maf7DBqXm//hszdUPIlHjU6uHg
         f5YUetVj3ocJ95zdOMcwbApYj1KwOjx2Fs8DASZ+SS3MSL4PuQT469C5pNh1yuFB2DNM
         FcbB9Q9Seq79gCJPeCn+IqSo4At3FSu8CeBe6yn9yAXFdB6yLtxyCjY8f6suGJF0sK0B
         udCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320913; x=1768925713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFO76MpaV7TKA3kGHuuWwQjUOsm9CcTqHJpQLHw5X70=;
        b=Go+siLMT6TEl0SUVO4HLKKBIp0vngviIV8E5exRqvATOq8RnOoVd8Ejm8eUAWkDrPs
         Ngtnl0mr3XsAiSCdiSSuW3XGWX4axM6z5vLyDNUan3xOVuu1c+5dOGIYGffbwxfjOshj
         uGu4fRg//XKDL5uCx9kweIMoiMPdu7W8IeYHp1pk8QWUg3lbVNuAgHahDzBpDVEoGd0P
         YV46orDN/pmRTY5VQ2Dbu2PhRB0afqtD6iEqLiPBC5cWT68NlmeR+Qg1ZV9lYh4ajgXH
         Y2irggmKu/xizH4cPc/HQieyqFtj0vdQtPY/fpXURi3i/5Be5h/xFJXMt2cCewGuAe3K
         JS8g==
X-Forwarded-Encrypted: i=1; AJvYcCUoOYz1rDjLpKherjYX7C6SdIzWuo7bN8dlu8GnWvfjm69rgudMcqdkzKINzMywSN1SDQ2kgypWSuum@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuu+XZads/0bcZ6P3sb8HXumEeJL/LOqg8bprAcsyG1ykmaSj
	COQzKijZfgMRaXy3aRsCi+ZefKityPrXyU2iwcvNkXk4jFg4Q9eslK0H
X-Gm-Gg: AY/fxX4c3vHssTIqzbhVbgbXk0Wf1rUGBZLZvCseyLbusy7xej7n/5v03nZkwgqqDNZ
	DyevurTJjAvFy5IlHygQeMZa7AinbuBa72Z2MERy/ecYJlOwbBMroc+dlWagkbpG2yMGIv8ZVEu
	O5k4R5aWIvIng3pn20G3cbCaHvuW8q4JXm6PZfg+ZxrK+2lje9Iv3ffbbEyleSeVU3ZTpK2HdLL
	70KaeOxcihuePp9/ANDyPnlyixQmsF3kxD05qyE6z+Do32BWspBgd/s/DQY5zQh8ARo4AFXVeC5
	e7M9uzAykff/AQaXYXmtD1OcA7fj2wbpszY1Xy6KGoZiIuerLYMhOW9/wacYrcYVOoULD6DvbRM
	xXSjm6JzaM091nvC12TTWWCHC33KIHEcwI5hJQLJv1/P0OndhghKMW16E+nPF8p1gRdwuQK9ib8
	o/OTQ4SKq1nqjjRYSMGrUVm4Z+4sX4/7neU1DX+C9aRX7Onx5BO9OU07OObC7GEnIL
X-Google-Smtp-Source: AGHT+IHTmM9+1s27vLw2S1CrS8QJkz3b9Itz6K3HmIo/KuWYYIxo4nw1Xc0bBi5bp063eE8Hi+T2eQ==
X-Received: by 2002:a05:600c:890e:b0:479:3a88:de5d with SMTP id 5b1f17b1804b1-47d8f284042mr148197935e9.36.1768320912845;
        Tue, 13 Jan 2026 08:15:12 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm403936465e9.4.2026.01.13.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:15:10 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
Date: Tue, 13 Jan 2026 16:11:34 +0000
Message-ID: <20260113161152.3688309-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113161152.3688309-1-shorne@gmail.com>
References: <20260113161152.3688309-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the opencores GPIO controller.

On FPGA Development boards with GPIOs the OpenRISC architecture uses the
opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.

Link: https://opencores.org/projects/gpio
Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Since v3:
 - Removed example.
 - Re-order this patch to be before adding compatible string to driver as per
   device tree binding patch rules.
 - Add Reviewed-by's.
Since v2:
 - Fixup (replace) patch to simply add opencores,gpio and add an example.
   (It was incorrect to specifying opencores,gpio with brcm,bcm6345-gpio
    as opencores,gpio is not the same hardware, its 8-bit vs 32-bit)
Since v1:
 - Fix schema to actually match the example.

 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index ee5d5d25ae82..a8823ca65e78 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -23,6 +23,7 @@ properties:
       - ni,169445-nand-gpio
       - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
       - intel,ixp4xx-expansion-bus-mmio-gpio
+      - opencores,gpio
 
   big-endian: true
 
-- 
2.51.0


