Return-Path: <linux-gpio+bounces-23959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8DB18529
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73D9C1C8170C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 15:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2496627A906;
	Fri,  1 Aug 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiCKUR+C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434541422DD;
	Fri,  1 Aug 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063162; cv=none; b=btFwhq6ppy7q7CWrDUH27g+40+r8I9zoLEY/Y6N0KdkiKDQpBqBWiyH2UxXxzyhp75+H1o2Pj6rXawTWMqvdoPeRDye62nvvums51Xt51Hyie64Bs7d9THyM5Fm+6C8LWcztrSFWRC13gPmesUqefw811eZZp9SG2klmnUSRs8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063162; c=relaxed/simple;
	bh=RSoZTDSpA+faNokCcp7QWtxa/Jn9sdfWEuMdvA5/xUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgZ14cSmpd1Jz0ae9GB2s1KE4+YW5RVIqHTDIryQgZzXnEp7bL/lgWc8G4le1Mq6Ea3J0AI6m698oth5NplA5ATG2/XY0O+JmAIGyIRYJg5MOxTFlFB/SVLuIgzS8tL9/6ZI9s6Sd3XYRTlja4ZtNOEIe9X/MO2iHoAnQovK43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiCKUR+C; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so673485f8f.3;
        Fri, 01 Aug 2025 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063159; x=1754667959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMzk4iJUExERyZV9Rf8ctC6S98zhPlnJ17uKJ5nE/oc=;
        b=IiCKUR+Cx9xWIdinr/MhYwulfvp8bV7oAH0NZwXlqZVsmtnUSs/IO2Xt/DJrMOe6Jv
         yWlcORve+qsVJ5TIAX6mcvDfw9g8b7fIy4nDra5j9s8vzkmMwnCXVkfmH3RzhVajD1Fr
         hCbXY7VDOLlUDgFgE/0l7/IneuIWcRW68tuUWjbSgyFXTuL+h5Mv4uXQMpSUSPcbR4PS
         WF6oaFQVFUZIIVv6CVp4A4UPmx7j8vnV6zRcXQD073XL7xNwaLvIo4ws7BtFDB4dnwmB
         piagIvf6KaAJ5+P+hSsF5YeLS6u8GoZ19E7O2U605oubAT72+GtYWJ1z554odB6o/H1k
         zKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063159; x=1754667959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMzk4iJUExERyZV9Rf8ctC6S98zhPlnJ17uKJ5nE/oc=;
        b=l0kniIeQmmI4kK0EPYzV/0ijZqjMb6Lsk3smbVDMjYSWecuiTOO99UGIHtKrVlIidR
         iR+RRR8QFDnfn3HaQiUcu6r0y7aprSI+I035fXslKEJVFH4TrgRQC9cKT+QCZPcjjdn1
         zHcl3HYCyACieW+wC1RqO3ClofaFQU9I8u0fhoLooAy4teHtyLPwwe9XB1PIcTSVTqmL
         G3uGf0b5i4pG/Ap7rfgoZZe+wVjJU6dzCog0qcgHPQ3GkhZ+xtT8MtfOiFnshC+ozoCL
         NSS+HG365dCJiR4A2jtOk9m0pZSusZP8JCfE6R2oDSsnXfw8MDZe0cO8Ro72H31DovKc
         S6hA==
X-Forwarded-Encrypted: i=1; AJvYcCUeTzx1+Nu6rcwUsMcaV77OfCQs2fTnWY+kLQl7YEmZgMuwzmc8AVP2iDOTfrdVO8GQEAnE3waUBmjg@vger.kernel.org, AJvYcCVeaPaKkPTDHr9jkkiCWESRCqUOVCkrahRh1qACU0R7XuO/IbkmygJEE4zUfHJ8f/sDms12i2n9F3p4wbGW@vger.kernel.org, AJvYcCXgXm8LHBtYAEkIx0CMxXglCwH/uHk+YouZ/a5N15jIql+WLBgnIqB/ejH44G2+wjx+CMErBBcyKkE7Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxral6EylV/78um5ZaBls5BYgAq6fzmjF6ngSvQd37WWI6QG+EJ
	0z9u8QysZNNcN8csCpppjHW4lbIt3juZNVWXuw7Qm9C+ZTGWKIuZyNuJ
X-Gm-Gg: ASbGncuSV96qeoPQWjvsEfETOLbestmEp3EkaWvgWLqkzAT8o5pbeyaWjfy4Gw4e/ZM
	BUrJsAL0ElfWZT2F5NCrz6gA+yBhBlnmHXK1S444GOmFmU5otwu3HoK+BToRvbAaFjHP3W1gZua
	ctCu6IGE3YbDi7uLdJ0BxbeVdzDDlqGGxmfAhU2rasB37njPwjBbTA9RL34FUgOeGd5JUqAjlw3
	SxC+bz+PituBuCjPGrZ6lPhBABgM0mtaiQ/AU3a477fR/OK7hdQ1CeUUgYk1JHvq7tDHr/NPTpI
	KxeKZyPKQXxtvjoHRrrL830VEWnBMax3YuDareoFyLh9YBa1S/g9/uJkobQ7xcAdXuVgubpBuUU
	UYbbMv54b6OROw4gnt1ANCn7ajoDxC2SDo4l3wTf6kT25YKHPhUBOlNrGtBGK2CXCtXVi4misfw
	0Kt14bwho=
X-Google-Smtp-Source: AGHT+IGEvgiYgPl5kr3AkH3cDbPWk5Gs9WqRMsbuf4pjX+io5ipn0V6k9e6x6c39P/yjjZkeIDLKlQ==
X-Received: by 2002:a05:6000:2007:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b8d9464a92mr253834f8f.1.1754063159421;
        Fri, 01 Aug 2025 08:45:59 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469582sm6194406f8f.52.2025.08.01.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:45:58 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] Add pinctrl driver for RZ/T2H and RZ/N2H SoCs
Date: Fri,  1 Aug 2025 16:45:47 +0100
Message-ID: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
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

v3->v4:
- Used patternProperties for pin configuration nodes
- Expanded example nodes

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

 .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 177 ++++
 drivers/pinctrl/renesas/Kconfig               |  13 +
 drivers/pinctrl/renesas/Makefile              |   1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 817 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +
 5 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

-- 
2.50.1


