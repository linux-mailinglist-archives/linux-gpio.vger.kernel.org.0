Return-Path: <linux-gpio+bounces-7578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 639CB90FF50
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 10:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739001C238A8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758E81AB360;
	Thu, 20 Jun 2024 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFzZA4x1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A21AB35C;
	Thu, 20 Jun 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873154; cv=none; b=QjdO3ttBX9mOVOgozOXN0W8qe64WNMFSfBr5/6VaVBwj8v5CFCWtRAL34h0dLDObUf/3giOm4OH0v3pbdhlVC/8futD1qz8hcgTWMSN/QK+71C+W8gFTphY/4o7O+WsR29HrMXAS18k7pihwE+RjgNPbWlCdi7Sd4sqbiYjs9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873154; c=relaxed/simple;
	bh=pn5rNLu42ohg1ucDtE+47TMdMgMf32bhj1+yFejcyj8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pfP4WeIf77za/a9LatHFi/yM7gBi3kAkd6BQpPTp+cXDR9PwhXf8f2afECfpsYjWxI5xl/Fvo1zRqQjBmII5WYdLyMHCs0KVzV08PaAJ40atNZWZQ/NIu5lUdHaWXRUdjnlcnc97xbWB4uiqBsCNgumC0vGur+Mee2jt90M2YKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFzZA4x1; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2598ae41389so342241fac.3;
        Thu, 20 Jun 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873152; x=1719477952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43KWYYRyoYmhNOn4BNyMreQoj2jRjYHSjwBPqztaSRQ=;
        b=DFzZA4x1CJTVKGofZ2d+M9gMPi+SWZMm1T2iC2PUE6oYNQ2eJjfSCbAQmhoCD8+pbI
         o8cISCwasUoIJrcAkZ1BT1ZFakG7YMsnfLci2uQCfoW08MHLvQnpki6tPjfEz9u7iX3F
         TCldkxmEV+F+nmtVJvdieB9UMQH2qaOgqHzNXlU+JWjZo431lBJkDtqryU8jkPXZGELN
         B2gMWduJHeIIdw5lXw9pB22CLXvJV+OJkKP7Qtv6MbpaZtbscm0qTxW3ujMiLrysELBT
         9o+2nOgN+imCsNSReKEF7ik5aYqfHAiZZ6mvcTrtixOsabPS0TAkUPpf1Ycg92sabN+p
         /M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873152; x=1719477952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43KWYYRyoYmhNOn4BNyMreQoj2jRjYHSjwBPqztaSRQ=;
        b=mhQegptBhRO0AmA3E9Emb/yh7kFBYgkwMnG7HoCL1mbyIdr4G58034MYSiOmKJM2Dt
         dbtIICaGqJdHBYG3+6/4BgCcrIwyXLJp7ZgoE6ag9GJNskYCd/lsoofIwH9RtucWgiic
         ghxGWWju200JGyUMdssvs6mHQo+OOhn0r+bzKvAN0Qm4lHB4pZKlGOVf+BB4GxlKQb89
         Zkb65VNpNddFK3gXuFSM6jSZMsJJoFTO5rO3oqdy3vCn2Euf5G29alpzkmhCXtg/7Xv1
         gjj/3AgdSgYe85n1/AQlLdWzayI2vR8H2/LLZh+5DF+9MhUSyBZVJF2tlwMMeRnskh93
         sXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmuOvSifKPfbO9kaWxbVy0WcbZm6jaGLEWfZBZfCuZpvQZ157rc8qVG3OWohdMIRw5xz2B/8WhPJUSjEiwx1zmMwdSXplIQazDr867r3V4dbWU2bea1NX4tg//jzL+iFEij1btmazJEL/1dY9o1n+3Z/b8X0YfQ8bTeJLl1aEfWPkV2Ng=
X-Gm-Message-State: AOJu0YyYfrHne4KeqwdnvR6xHrDM97uceXAoyAVAADwtW5t5pNiFvk5z
	HCH3qhJL+PLcIERBD4Xdbi/7uBV/TsGTkMKgrUWtiufmG4FM9T8C
X-Google-Smtp-Source: AGHT+IHUTewqsAsKC5xSUqbLqUEneEIJJdmKam3OZ0MLUfraam+NlYP/6BgrAchuTs1OQ6A+N03g8Q==
X-Received: by 2002:a05:6870:b50f:b0:255:1819:b458 with SMTP id 586e51a60fabf-25c948f70cfmr4718438fac.8.1718873151683;
        Thu, 20 Jun 2024 01:45:51 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:51 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v3 0/2] add ast2600 NCSI pin group
Date: Thu, 20 Jun 2024 16:43:35 +0800
Message-Id: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

LINK: [v1] https://lore.kernel.org/all/20240613080725.2531580-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20240620012512.3109518-1-potin.lai.pt@gmail.com/

changes v2 --> v3:
- fix commit message typo
- move dt-bindings patch forward

changes v1 --> v2:
- add NCSI pin group in dt-bindings document

Potin Lai (2):
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
  pinctrl: aspeed-g6: Add NCSI pin group config

 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  2 ++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c             | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.31.1


