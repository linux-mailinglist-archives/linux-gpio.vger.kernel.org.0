Return-Path: <linux-gpio+bounces-12718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F689C1B1D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 11:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD7CCB244DD
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 10:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64A51E377A;
	Fri,  8 Nov 2024 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eHA/0RGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410C1946DA
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063011; cv=none; b=aQkI5voA4JklOsf4ovMU3sMskSrKemyTBQZRAbPixWF9kIOXZoaG2HoNgFwTTiOYYXZyaLn5fW0hWHS51B9nW1LG+W3UG+KjJmd3PyjTZ75ad+7aH4igGV4GVTfJ8OtAQk/Qx5O9jXVdQjWHuefGJE4Lg1BdbR3uqiIkqRvd/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063011; c=relaxed/simple;
	bh=PpgS7pghguQQqOaLBn/7h6GRo5W88qMATqga6s+AMZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rmEv0IydNqlqTZr7eEc+jqiJ73/Wf/ss8078e0zeKqQSjQDPqYvy7NZU4nDozs/WwjUz01DikR8LNy32yKhCbdJ8TZXj3Voof52GGl1rgQAVHfiR25UQUnEiZ6WLvgxSWkAV1baf8maeyFHh6EViLC3/vAAS69V6qBvngEQorcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eHA/0RGe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9eb3794a04so275687566b.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 02:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063008; x=1731667808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HGjqJtVN8yse62LSp4lxH7xSh7mrFcmEyzm1hZzC2U=;
        b=eHA/0RGe2PEYO6q4VzHM+lEPnNZccGZOzSIqDnYyEkRgQjTlvDSjQWQ88h3DenLN6O
         zP0LW+Yt/h6XdhhtRGu0EAR0HZHhPb138mC6Hb1l4pkcPHz4tRjk0/p051Ucxa2qGNjH
         Gm0TX8ukZ3zGZREKwqQl+WTjAQq/Ot4htqJqf0LftR8As8RmJEgsp+e+b/hSqkOaXOEn
         Kskk28QzbQYm3dW41z3Ta1ZKFFAY7uTWdVLDLl5J3k8/1FIOQST2EUcdl/mxw91xj/Kn
         yGCGUtuQPLLhcpGYLygDGWqdP7XDnppXn7jS30mzmFyTJoS/FIr9LvPB4QSZE0Ofs0dX
         u99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063008; x=1731667808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HGjqJtVN8yse62LSp4lxH7xSh7mrFcmEyzm1hZzC2U=;
        b=Ps6faOnFpvefQR6VES+9jF9ALRN3Tl8ln0wgANL+WtU6zBUmmzDUj+aV+RxW8XS+8e
         SbivRtxd0oIrRTVhDrCQO3OHptil0yEtsyY2TTVCTSmmTu9wx16RsCjrmKPTdNmgaBsP
         CMhVo51fm/oSHR+iMytKoltLWpRCND3Wr/iJjHUaYR7Yd2YsAa5xK9jw7P7LPP9DWGGy
         +ZQa3PmaVR2ty0dOa9DB1ujFIx7TN0KbE4zQU3wRYJ/rnr0+T0Gn738OrzH0ZWElRv6X
         VxM75YMy2nQzMFSZ0rFZgZbXnJf4GmSTqfVzSwOa50HiuGIIlHjzG2USM9RaXm2telV8
         ILkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3P+mlz1dydykjKn3DIgs0XlaJGfqNG0ZQHfeWs/hjvq/264AgCT+qncDyPSO128EQJ0oLwgvIPVkK@vger.kernel.org
X-Gm-Message-State: AOJu0YywiLnuzJu8xKReb9b/ZOvHnXCpliyoFyPYT8js4Td/A7+I8eYD
	QJ5kMGq9uZPk8Uo9IbiiujFwToncPiqE6dS5+2Qw/xgqCOMZe6FCyF9QrV0TOMM=
X-Google-Smtp-Source: AGHT+IFrd1TDLAec9U58LF9s40xqazfiJUW3NmUcK/yIbfcJMdLkexaEXIhuu/tXhcUQIO/IrHqAbA==
X-Received: by 2002:a17:907:3d90:b0:a9a:c691:dcbc with SMTP id a640c23a62f3a-a9eefebd066mr197835866b.12.1731063007655;
        Fri, 08 Nov 2024 02:50:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/25] Add audio support for the Renesas RZ/G3S SoC
Date: Fri,  8 Nov 2024 12:49:33 +0200
Message-Id: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series enables the audio support for the Renesas RZ/G3S
SoC along with runtime PM and suspend to RAM.

Patches:
-    01/25 - add clock, reset and power domain support
- 02-04/25 - update versaclock3 clock generator driver to support the
             5L35023 hardware variant; versaclock3 provides clocks for
             the audio devices (SSIF, DA7212 codec)
-    05/25 - add pin control support for audio
- 06-20/25 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
             were also included
- 21-25/25 - add device tree support

Merge strategy, if any:
- clock patches (01-04/25) can go through the Renesas tree
- pinctrl patch (05/25) can go though the Renesas tree
- audio patches (06-20/25) can go through the audio tree
- device tree patches (21-25/25) can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v2:
- fixed typos pointed out in the review process
- dropped da7213 patches already applied
- dropped patch "ASoC: sh: rz-ssi: Use a proper bitmask for clear bits"
  as requested in the review process


Claudiu Beznea (25):
  clk: renesas: r9a08g045-cpg: Add clocks, resets and power domains
    support for SSI
  clk: versaclock3: Prepare for the addition of 5L35023 device
  dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock
    generator
  clk: versaclock3: Add support for the 5L35023 variant
  pinctrl: renesas: rzg2l: Add audio clock pins
  ASoC: sh: rz-ssi: Terminate all the DMA transactions
  ASoC: sh: rz-ssi: Use only the proper amount of dividers
  ASoC: sh: rz-ssi: Fix typo on SSI_RATES macro comment
  ASoC: sh: rz-ssi: Remove pdev member of struct rz_ssi_priv
  ASoC: sh: rz-ssi: Remove the rz_ssi_get_dai() function
  ASoC: sh: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
  ASoC: sh: rz-ssi: Use readl_poll_timeout_atomic()
  ASoC: sh: rz-ssi: Use temporary variable for struct device
  ASoC: sh: rz-ssi: Use goto label names that specify their actions
  ASoC: sh: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend
    the SSI
  ASoC: sh: rz-ssi: Enable runtime PM autosuspend support
  ASoC: sh: rz-ssi: Add runtime PM support
  ASoC: sh: rz-ssi: Issue software reset in hw_params API
  ASoC: sh: rz-ssi: Add suspend to RAM support
  ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add SSI nodes
  arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
  arm64: dts: renesas: Add da7212 audio codec node
  arm64: dts: renesas: rzg3s-smarc: Enable SSI3
  arm64: dts: renesas: rzg3s-smarc: Add sound card

 .../bindings/clock/renesas,5p35023.yaml       |   1 +
 .../bindings/sound/renesas,rz-ssi.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  96 ++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  47 +++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |  66 +++++
 drivers/clk/clk-versaclock3.c                 |  67 ++++--
 drivers/clk/renesas/r9a08g045-cpg.c           |  20 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |   2 +
 sound/soc/renesas/rz-ssi.c                    | 226 +++++++++++-------
 9 files changed, 415 insertions(+), 111 deletions(-)

-- 
2.39.2


