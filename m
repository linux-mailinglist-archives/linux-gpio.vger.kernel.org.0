Return-Path: <linux-gpio+bounces-10838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA04990312
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1ABE1F25A07
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 12:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA05B1D363C;
	Fri,  4 Oct 2024 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJsTPQ2m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A111D0E37;
	Fri,  4 Oct 2024 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728045434; cv=none; b=b9pm6KEKjvjcoXm0KdaC7M4AR78SIr+4bq1xRDHr75GB9eYyWIdTjXEHCS38vvbDiXNxpPw4KwJ8RyuwKYD1CWje2Nt/SuRLQIcfiIef8OrrnyCHDr7YLnYTX59xxkAcizUyAxc/rBzOvzrKIN/mcV5aHLX/X9GAiKGRGssvbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728045434; c=relaxed/simple;
	bh=id7grdGNXAFXeKeGrb6nVKSAWiDb/eXl5OSyAJzokxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgdQP3S0dcAu1RGqc1veD+he35msOfAU14j5XsTmBKwCtu7cA2GLxoJ/hqCQ9Nd1uAB8oxGqlm1/k2iILSDLhPdbxO0OJK8OIP5dDZYjgJX8QlvNkoT+JeWvs8+JrLaxyOl9EUmelZm8fRoLGRPQcLA6zxE8S5q5Yi4c7Eq5B3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJsTPQ2m; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d60e23b33so289967466b.0;
        Fri, 04 Oct 2024 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728045431; x=1728650231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwlSNCAo771k5BRm77+2Y9w0fghV+km2XqjlKUt2KU8=;
        b=nJsTPQ2mVEzTcxzdXwbhhmOGo/DsbXc8tZyeNllSmOEqOmO3I9VNtTHpRYGQJLTWPt
         VBzR481JbTj25qn1CQHlauIXfjWzFNLpWuKj9vy+gaHMqcIY6KoZYe3BJk7JMBPJahyX
         eE7N2nx7KKlqsuGZ3nHuceOPht4NE6hJKtkynDS3JeOaRjXR8VK3/yubvCZUMSpH2xCD
         w6hz2/0nFamiRMsH72G2Ry0/32F7vT891a8jQIHmh63aPBYRPHQTY2hYVwFdoqCVqGFk
         WAz8/uI2c+U3I9lK1DvNnGVIeLzjD3Zx7g60LfdlkNKtjTfi2JNL+8YzSRKDWkKY/iY+
         Jp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728045431; x=1728650231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwlSNCAo771k5BRm77+2Y9w0fghV+km2XqjlKUt2KU8=;
        b=Y8wsXaRd7BmEFYTW8Y3tTAGbKr57OivvB02OfbfGi+93IDiTsuM3ELZOZnXGwH6c+K
         bS1QGxxIIBNXOiswHUT+kl9kRlSJj6dypJFPe1hCLMd/sySCye3+K/kEnfPFcwtUWz9L
         dmR5PDRNVZpx1Xwt5XG4LdIGDokJ8N7rBJbkjpYC9/I8uFX0O63pU4XM4S9K9WgcmgRJ
         DXB7aUBv5q1Mb8w3cU7OdiBYw1JS/E9fgEq9xFDmRrpvsjRZII1WGg6CnbJgI5TDpHQV
         nY/rw5B/9gtczmRLQpcCi2/axPHY79b30u6GXMNsuYSv3aVbMCazKppD6oZ48mZHrk6v
         GOAw==
X-Forwarded-Encrypted: i=1; AJvYcCUAyaV92y1TzV6ZPjBpmrgdXe55sj4uOvAYvmmV+gT7HcQf4QLL7a6KEgWGZAOXNIA8Pb9xsZpXcDpef9gY@vger.kernel.org, AJvYcCX3UEJaYSVN1T6kD61fSXhFIpAvqC+PAqkXQ/Xx8cy+utbUGjA866qPf0Z7F1OknF4o8HkuQRu3jGcc@vger.kernel.org, AJvYcCXo13mV+XYyn0IDdF/8/Xpj5LDUBlRmV7FcS95WCX+sbDNOJMrGczfqskfHaZxLK3bE1TtYuF6rVYhPb1Q6Wgaih00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnutGKODsOfS8VZ3tqJJzXbrqNUckrCraHhLOdUahqMtpcLyE1
	fR94cSeTmkyD/8bCXL/vv9i0wfNfVCpoJAZb4JWDLryqZae7FmTRdFqY8Q==
X-Google-Smtp-Source: AGHT+IGH077f3yrGtSebb4Fk484F/ZepvBTHu+4EiI3uKYDDGv4DeCONyrcBY6oJ7nzZEBn2mduHvA==
X-Received: by 2002:a17:907:745:b0:a86:9d39:a2a with SMTP id a640c23a62f3a-a991bcfbc70mr259824166b.8.1728045430740;
        Fri, 04 Oct 2024 05:37:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910285ad0sm221601166b.34.2024.10.04.05.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 05:37:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] pinctrl: renesas: rzg2l: Add support to configure open-drain and schmitt-trigger properties
Date: Fri,  4 Oct 2024 13:36:55 +0100
Message-ID: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add support for configuring open-drain and
schmitt-trigger properties for pins on Renesas RZ/V2H(P) SoC.

v1->v2
- Added `drive-push-pull` property to binding doc
- Implemented PIN_CONFIG_DRIVE_OPEN_DRAIN to disable open drain
- Included RB tag

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow schmitt and open
    drain properties
  pinctrl: renesas: rzg2l: Add support for enabling/disabling open-drain
    outputs
  pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  4 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)

-- 
2.43.0


