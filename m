Return-Path: <linux-gpio+bounces-22888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77EAFB5B2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 16:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A83F4A0A79
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 14:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F62A2D8386;
	Mon,  7 Jul 2025 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPJGe6Pa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85525D917;
	Mon,  7 Jul 2025 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897933; cv=none; b=Jt1/ewq/Ay8odNWJ5QE4s6UKxP/ZpLHufuWBFJYQc6QV4dxDOs2SBSV7iq3SzEHiW49cmkXEqxvY6PHfwiZi8dSyyVij8Nu7xewlytMZRDMKLpxipSgor/wCJSpMBHuWHGrdraWciMuKhw2BlwXTvkKZ+P1s0TswdJsRdIB65Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897933; c=relaxed/simple;
	bh=S8BUoaXZ7olFH3uRVtg9D3QA/CtuLpeXzH3AK5XJdc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JT8ln5nNL8nbOKj+7ZIC/euQTuN/oU13sRiASff3K8uLdiJIWTuAl9Y3E9bPV2aNQbDXrNChpOV5coJstFi7D0ZdiBUm2tOkovVzkzmrf1ZzcyoYRt9vpkeBT+QblKyxTAdiGSZlHGOztMbnd1f1PjT+sbbM207KviBxw80lZho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPJGe6Pa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1659972f8f.2;
        Mon, 07 Jul 2025 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897930; x=1752502730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JivUD0LYQz0co2hD7krYAmcSS9AjAmky7B2TUpH+jko=;
        b=YPJGe6PaP4mLzGnBM0czwtZ8FmhvsXHSGSdNvH+hhKQmbLGVx2/Ps/8C0LrZfhD7b+
         mfo0ZRHVJYrIbdw5B/dSfAEczLUywnZe/W0/4wtRzwPHO6NlH0ctNTIIGycSD0FgBshE
         Y0d3lQqgih5Jlg2bIJ5KAXohPVds1GrzwDY0AwlMILqTqMxSot9GDFAii6l8+23TJaW1
         cK71+e+ho/TXG0TczxNHwfoulg8jICS1qAQpQ5btRcaBIGRhQ8YxfcISdmMdUCMPjo7l
         6UvGjPl9pBiMs2Q1mF0sIjyG5381tmXH/qlJGp3EbHFhNhiLpWOW1On/zsI++TqNdj5J
         UuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897930; x=1752502730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JivUD0LYQz0co2hD7krYAmcSS9AjAmky7B2TUpH+jko=;
        b=NpjizsfsRbvidCRwWrEuxt6VxOVFCCRYHZNG5r6QiaRhlXjlppQAiuBUKODi5rS+Ek
         3nH+oQMl7mQ1vW64Qsdb8pQn8VkWeaFQgGKl7gdG9mAaaX/fVRoNgxsbNItbD6uiSmij
         /RKNmrQfElh19QQWyQE0l0iex1Gjws6Gc9PZDIkRT7I9k+ULwaeZM44bH126nAUrf9iq
         PaQlQNe2igGrT92nuQNEfwM/SlZDhi7WiblEGttjC70JedJ4KK4c9fNik0b4aj9ajraX
         DvzSxmXJJsGv2XVnP7xwip9Opg/PQGwA+slSdTq9+Z8XECfEo0NaL4heTrnHAVcZROMK
         RoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuKi7zdaoEvBWDcC/wQTb4L4rv7DqDDjF/SzYR1b+jzaxe1IXGzNqiav4a6esnB/klMx2iuykV3aDmUA==@vger.kernel.org, AJvYcCWsT5WLKgL9ID2rKIy5ofaERqllDCChhkbg0uZXARy05TMA45uhJ94UETJXAZcKMAVn8etbmwYi5qm/zpfZ@vger.kernel.org, AJvYcCXqSenk4BxC3lesL7bNq94xK+50h+dDOZFRhjKj48z/8nD+b9V/UGHLYuWs39IdXJwqSK4C0cmmjX1G@vger.kernel.org
X-Gm-Message-State: AOJu0YzU++kuY7JTbWuRNnpzz19eLIoAUWKgr/9TbEVEDDHWmwiaC+VP
	FtF0Z/5LUJ980WHDxltv5wlabt3Vui6BdmNw6F8mkYymQjyBOW6ceWcH
X-Gm-Gg: ASbGnctusChv3U97BCymUjaqS10A9Ui7b3KY3CTtC1wpuFPRBYoOaahU0SnLL234gS6
	jv80BnAUJ3tiZ/ioztY7yGzxd2GE4tUSNP6+RM4I6MZ5Yiunw/s48IhUqNsEFXiVf2PrsXUKU83
	WkdR/ce9R15i1seR3gd0+e8m1LarlX+IXQlm8K1X8JMWliOuzicIvokRXo7RUVEljgKi/8KnYH+
	y8LrPtYVtIad8K5P2s4LjlkIsuENnXj99z0qMg2eWK0U7G2JWaLVmZ69SFu2RwMQA0Yrpd4fCER
	rRwgsgWbTRsCsKvpwoHdlZNv0TTgmTIRSeDoeYoryGjKKZaamkWIzxLf39gDJx0Kgrh7nzDyPkY
	CGF+iTqp5TSQ5/sQBOUg=
X-Google-Smtp-Source: AGHT+IEkkepmVVbtFHULbK3Cfz3lNzwzLk7ZAREHJnOwAMsBvkCvEaQ9+BmHCL1CDVASYnR7e7Knmg==
X-Received: by 2002:a05:6000:250a:b0:3a4:dcfb:3118 with SMTP id ffacd0b85a97d-3b49aa429a8mr5754682f8f.10.1751897929582;
        Mon, 07 Jul 2025 07:18:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b966cbsm10131868f8f.49.2025.07.07.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:18:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 0/3] Add pinctrl driver for RZ/T2H and RZ/N2H SoCs
Date: Mon,  7 Jul 2025 15:18:45 +0100
Message-ID: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add pinctrl driver support for the Renesas RZ/T2H and RZ/N2H SoCs. The
RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins. Both
share the same controller architecture, and the series includes
documentation, device tree bindings, and the driver implementation.

v2->v3:
- Fixed Kconfig dependency
- Added dependency for 64bit to avoid build errors on 32bit systems
- Dropped refference to gpio.txt in the binding file
- Added missing include for bitfield.h in the driver

v1->v2:
- Added a new DT binding file
- Added support for RZ/N2H SoC

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
  pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC

Thierry Bultel (1):
  pinctrl: renesas: Add support for RZ/T2H

 .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 132 +++
 drivers/pinctrl/renesas/Kconfig               |  13 +
 drivers/pinctrl/renesas/Makefile              |   1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 817 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +
 5 files changed, 985 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

-- 
2.49.0


