Return-Path: <linux-gpio+bounces-25053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119EBB39E66
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 15:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2678562207
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 13:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F8031195D;
	Thu, 28 Aug 2025 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UDxeT+q/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C88311940
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386927; cv=none; b=GCH0S7I9u1jwtcy0AU4sG+K7+UcsvHrTNhy2xop39z1VMnPrtApT7ZowSB2xJDyYIYsmbR6BAWZPXtgv/5Ju9j1AZ7nm66sC2UE+AeiWOW3kZohp0lTbUGTw9p7jRTmXoaJAL8lI4h1jjyxmlzkagmJRTkeiS4NwwR5X+C4klC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386927; c=relaxed/simple;
	bh=ZoIUG0DIhl93kANAYC/KTgnrxzk10nq584qp1jORNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q9xxWFVdPWxCbNjBUz10TW3I26iMZjHv1SgOC7oF/gO8ft8WPLbsCGuwHyPRkjtvCbzgr9Toh8BJfgqogVkirlv+5wdVM820bKup4eAgjfxrZRmCDP3lUKpacZiqr8++S3U+BKByc50OqjJSt2KK0Bg7UJW4vsa2ZYgKn/Y9I7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UDxeT+q/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afebe21a1c0so143300966b.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386923; x=1756991723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuiNHpICi9Fji/fQ9rrN9zvOKJszsHimGcUCBamZ0/A=;
        b=UDxeT+q/XzByfuzaddUNdzlWksMM2SSrbqSy9niuu71+kfILDKdcbKUx+v1X22aThW
         DDYQyxyViQBz3+72P3iA7wGVe9+JlkmQPiuArYkQWqF6Yj6CZ5w6v7hCAHAUdAEky7SH
         407h3p0WrV1xl8IO9SGnYbiS0NWb2N1zf+L8ZBpDrG6zVbM6QW/y8fEgctfX9dV1S+dW
         5yJF+rmTXh8GL/KPkkRCBWfTsa4mLlz15EA6MCznMf8/fjyXjcDKx4Cnxf3QEGbXURGi
         wv5kLD/sZAsQfdtD7t6B+/5YayCAsvOY1PzlJv/sRkWr1QziXkAuKYt/7fIuyZ+7sgcy
         46cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386923; x=1756991723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuiNHpICi9Fji/fQ9rrN9zvOKJszsHimGcUCBamZ0/A=;
        b=jSe9z9XSDZMbylAxgYM4yHdHfKOY3m62bAqy+8ngeZo8dQf7xCt3NMz7Oy9WcnOclX
         fpoM+KzvL3lJZxtfeoXECUamDcwJ4WJOVGUzD4WGHvA/ezCWQMfyQSGkZXzQ7v+8fG/V
         SisfInK9HOEzDFo13fV+8ig+bwzfnQb4VUfBMsvO3TETFg/SLK61Fil8A4l9DOpYmC6i
         hAPbgUS1wPH151sXjWIEShzdOzGCfgY2Aji6lhlKQl0HLDg5hiv39B6JxsFmT979mdwb
         87e+48lr6VYgwFqhws5OJJaT7HblKADzz/S2PyeNB3QKOogznbFBV30v563BJgxNQedn
         O5cg==
X-Forwarded-Encrypted: i=1; AJvYcCVonOlRgOtnbGLcakkLru7NVwb+wtLLUxcvG7u2n+uW88kIUJ6fDiUGxSXpi7YBoSru6P1/iR7diOXO@vger.kernel.org
X-Gm-Message-State: AOJu0YwMYp/Nh1kdF8xlWfMmEJQCADD5mvR2wIfGIFMtoDMTaxDES8Ki
	rN0SXGu6tixOKtmlq6vrWhTLZH6Ntn54Tz7rdiItudPesrl4kQfxtXLoLOdi9qWsnRA=
X-Gm-Gg: ASbGncuPx9G1GHg9zQUjrcwbR4xA6iaLagNEQxLPtNDNdpcgtIJ2Ak0o6oMLlUu7san
	2syl1rPd+wEHkVVoahQeNxJUHZu9+mZo7eIIsF3AcbzUqRRZHcYKVg/zHF4N0rrZAfZboghOvN2
	gOcgq+A6ZgRwEhIZ4234pKKa3lwFxDSPMp0ZRNShQN+l9v+puMchuYA4BEWGoEcaV0oCNfTEAg8
	vni94d/eQE9n1R4sYDCWReME9frLZqbqHWwDs3uiRwnf5o+QNWleVkK3c5MGDtL1iOhfUsxVNe9
	Hqe6DYoR0JB6M9jFbFNDwUQe9gVn+ezoQC7WKMiXlm0zUC8yElvf33g+fmV+P6BiLOPCKYOgl18
	q6enTq9KvbfjWaCOCybGn9Kj2YIAbJUrxx30iWgs3Dw18Lb6zbRKbzl4jDDEAAwBzwQUMDZIcro
	6PjHI54xRj+N0xQ7N8g3zSUKpC8FE=
X-Google-Smtp-Source: AGHT+IFlRXZ8/HbEmILGPaaFC7SuIScItZJp+ONwofS1lsM9bJRSD1VLJx+ZjAEGaQZGAUqEEvUm5A==
X-Received: by 2002:a17:907:2d0d:b0:afe:a615:39ef with SMTP id a640c23a62f3a-afea6154a04mr947914466b.9.1756386922803;
        Thu, 28 Aug 2025 06:15:22 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7fd59b00sm872678766b.106.2025.08.28.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 0/5] Add peripheral nodes to RaspberryPi 5 DT
Date: Thu, 28 Aug 2025 15:17:09 +0200
Message-ID: <cover.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The following patches add a few peripheral DT nodes and related pin/gpio
nodes for Raspberry Pi 5.

- Patch 1: Amend the bindings to avoid DT compiler warnings.

- Patch 2: Adds core pinctrl nodes and defines SD pins as a first appliance
  for the pinctrl.  

- Patch 3: Wires the gpio-key for power button and related gpio controller.

- Patch 4: Adds DT node for WiFi.

- Patch 5: Adds Bluetooth DT node.

All comments and suggestions are welcome!

Happy hacking!
Ivan and Andrea


CHANGES in V2:

--- DTS ---

- bcm2712.dtsi: added a proper clocks node to the uarta serial
  in order to replace the legacy clock-frequency property. As
  a result, the following patch from the previous patchset
  has been dropped since it's now useless:

  "dt-bindings: serial: Add clock-frequency property as an alternative to clocks"


Andrea della Porta (1):
  dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
    controller

Ivan T. Ivanov (4):
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  55 ++++++++
 3 files changed, 189 insertions(+), 1 deletion(-)

-- 
2.35.3


