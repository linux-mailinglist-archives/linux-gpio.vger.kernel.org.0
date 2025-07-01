Return-Path: <linux-gpio+bounces-22523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEACAEFF6C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 18:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FFF0485EBF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 16:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189E927B4EB;
	Tue,  1 Jul 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al6e3Hsx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0381B0421;
	Tue,  1 Jul 2025 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386615; cv=none; b=eSuqY7WqTI3LW7GxkCLRqIuI3lTQSFe349IsjrzKVrZ2J2Qe/Aoobn5FrNjCpycd0tDVD/ZZdY+p0O1N/RrmHd1/jyMYpSyTOJj1BAxHWgYEIUcHlISeDxGidOMJFfyNn4JFtxQeR+NvG8/9FmOnAfiSNgSjBTT8ZyTmcL+9B9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386615; c=relaxed/simple;
	bh=3qZxGcUCL8yUx8MZF2TFCYR3sejIWvsEYohTLNJWEOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn0oA82xhLksxqAYBtTrqFHArUCTbnzJtwnmktbnRFiGbsl6nNc/7oLfEiCl5qjCwKAqJDlDvIra0zs/EKQk467dYh0eZ3pKH1R1CmSyMTLL8guE8v9boGCuSsmq+QTXMqIvMonQWjlnf1/i/JHUrrKOZl6Ni4NH43fnHEtiqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al6e3Hsx; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adfb562266cso956920166b.0;
        Tue, 01 Jul 2025 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751386612; x=1751991412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTmFA4aPB/W9P0V8JeclHzzTX3q8ZXA7XKdFioTvB1w=;
        b=Al6e3HsxpsLw+UShtoTo8nnxaWPonHz13HnE1WseTnUuaSE13P+1SAzpKZ+FrEVHSf
         5DXqsY9AEzhz/vUDQQHGCJotKMFt+HPTkX3b+FPyDD5NR/wl/uR3FG+OamY6BUIsRcsl
         h7FdNJlegWeaf07gQtXudD1xEY/UuBY1V+CmI4EtFWdPGHOlI6qa/dIQKSKOjf7aqiwG
         aIz1Cm1E6PBNzpwCTIVJsrjsm6bPOti7bYcK4GmHVMAyLVhBEvV0yMn03vXaVTarUwXD
         x5qEXEkgJ06nHriNIorrZ1yapNBleWv4jZ5UCtJv4i/uBOtQsX5sgfSLnRj04vuinhZd
         Vj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386612; x=1751991412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTmFA4aPB/W9P0V8JeclHzzTX3q8ZXA7XKdFioTvB1w=;
        b=QLAjbOpYvRMxYVBLBR6UhGb7Mx0A9l1L0INMDFD/2bs/OjTVstuHyNMcDQFotYlI/A
         PdSFIWhevYZY8fqq1npkiPMoU1pUBZLn857/e7+XKf8qi1aZgeizRSE38Da9Kn5Voe76
         mMR/sqUnRHueEbaPxA2dBrueAyb4UGE1UMa0+fidrwKyn+ofO8XrhmfdQ/WPWKtjYKCS
         AZ4XKNo0WZ0TFex1Z722ho+35weA2IEy57bWJxQXhCKGw43c9mHiqefRf/yc/GKR4wXS
         IIfcdgqKxTjBU5pX8Scbg9nvoVWgsXo3TVg+jWLfZixb//3Bl/x5d/8VZ4hBdGR0et98
         984w==
X-Forwarded-Encrypted: i=1; AJvYcCUvFKt/uHdVzxfFbMSV++OYFaB926AkHAxlmnNnP6uIa7WzLDB9JeHd+Zp9UFOwl3EKJhSRzlPdkxQ9@vger.kernel.org, AJvYcCVGBuQkACIj69R0QoYAyQ+tCbNumhWM2XbUdxFXkmd0Wekfl/fJztP9yFmyuc8126mQMx/ALbNqCp5KpYJf@vger.kernel.org
X-Gm-Message-State: AOJu0YxUNgAPv7a4oeius9oi6ZRK2errmKnYd2vuny7iyRSU4wl/iUdb
	LoPjeE5Jda87pJKFH/j/5CmpSOORLc6YRwGN6KKmnqvO3kkYJ+/KGzJyNrvBQcJ9Jss=
X-Gm-Gg: ASbGncsiHgVh3LU8jIPUPWiIAGI/VBSia9cOKgSDg13WvLJdoHBFNK6SRaWVAhuuU5c
	SyKBOTv5IETu4XT8nFICYtWGWsG2n9CHA0CMzHvLEKSRF2I4L7zUHj/Qh1RyZP4vB4CsjaF6nJn
	5nGef35SfVgJZMpylLPXJg8WpuCiUdHyC6xrbJEaAgP7apIWFG4HQRMHgursqvND1qt9lBt6Lx8
	GdxRk7QOcM9RdyXVHT1QbUBdCn+b3fb6HmD3/RuzI5sSVWx5uYCxORuu9MpI9rGW44PZ1G+J3HP
	xc0Z9dtru3R+aPQE01uJQ0EL4KDWQ6/7gI63ga4/WBGMZNhLCBWol+ELP1UYKnTvUNCew4hAXCE
	cJQPyaKN/x7RzOsXqpGWOt1po4ooO
X-Google-Smtp-Source: AGHT+IEsD4lairdpieBaEbIz7rLx8esmQYycgMR2qL4JtpoNQMd/AN0u20bJjnktWH7gzZ5RRaPSEg==
X-Received: by 2002:a17:907:9702:b0:ae0:aa0d:7bfa with SMTP id a640c23a62f3a-ae35019dd75mr1672924766b.50.1751386611826;
        Tue, 01 Jul 2025 09:16:51 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1cc9sm885869366b.168.2025.07.01.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:16:51 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH v3 0/2] *** Add support for TI TCA6418 GPIO chip ***
Date: Tue,  1 Jul 2025 18:16:27 +0200
Message-ID: <20250701161629.9782-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for the Texas Instruments TCA6418 
GPIO expander chip, added to the gpio-pca953x driver. It also includes the 
necessary device tree binding definition.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
Changes in v3:
 - Fixed Conor Dooley's email address in dt-bindings patch
Changes in v2:
 - gpio-pca953x.c: address review feedback: remove some else statements, 
   turn some if-else statements into switch statements.
Maria Garcia (2):
  dt-bindings: gpio: pca95xx: add TI TCA6418
  gpio: pca953x: Add support for TI TCA6418

 .../bindings/gpio/gpio-pca95xx.yaml           |   1 +
 drivers/gpio/gpio-pca953x.c                   | 139 +++++++++++++++---
 2 files changed, 121 insertions(+), 19 deletions(-)

-- 
2.43.0


