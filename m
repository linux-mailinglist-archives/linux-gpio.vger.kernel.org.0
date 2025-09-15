Return-Path: <linux-gpio+bounces-26169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E35B57BC1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3FAC17A623
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1992D63E2;
	Mon, 15 Sep 2025 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="mrh2NbHx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44E30EF87
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940446; cv=none; b=HMUXux0q66G6LM5QwGZx47b1Iq09D5P4ajwKN8LeqJ/YeuVSPtCMth/HJQ0AeIJ84qPcEznP4MLOqXS4a8UvNNsHjRbl1BjlV4hGmbaDm6txlfGJDa106AOdLezzoSvqqRQF/5NxTcYrlyxlaaqQD3NzTmxLVct1+SAa+tmBCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940446; c=relaxed/simple;
	bh=nZ7OKo1OumVzkuKry68ZUJeaNsWtdwCoQlST8Zyjk5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hdtl29y7RBD3/BetIz0OIe0b55CKFC0t5EgFlPqSHDc0OrH+/HWAn/y203LS4OtRoJEqdXyY65i8E8iRSgpvHcZPdMWFzrxPpIW6oApq4BfkoeR7eqA9qjJliADbGkecIL583fVIS+GvB2k0YTMk5BdrXellcjIWpYT5bKiMwbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=mrh2NbHx; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mrh2NbHx0ApUEq6mOLe51fG0WP5c6GZwIxnZXPh5zzAsiHX28BeTTHgK4ARDvNuM3zf/zMPq4HRMC3XpO4xAcg60zZmrhd4D73R0O6qTK2xTOqGjdn/Na3neNJIc7Z1XO5Ez5yGpdb53j1YGfRfsuGgApfcOG3OnEF8HtyGKirGRuSJetp4bPc1hl69xPPWA72kUWBbFdgmkTdwznUc8BKp/xmu8MZdRTJL+3thPTDtacmBQ+lhUjyTwLTYPAL3ifO/G5HTbl/krO55g6vjoye2ESvMIBz5H+yNZu+sIlioiWii9odijx17Zr3HXxEz6qf+fcK4JXNNuHGIh1U2TKA==; s=purelymail3; d=purelymail.com; v=1; bh=nZ7OKo1OumVzkuKry68ZUJeaNsWtdwCoQlST8Zyjk5k=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1506483826;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 15 Sep 2025 12:46:27 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/4] Add support for mt6878 pinctrl
Date: Mon, 15 Sep 2025 14:46:22 +0200
Message-Id: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4KyGgC/4XNQQ7CIBCF4asY1mKAtoKuvIdxQdtpOwkFAtjYN
 L27tCs36vKfZL63kAgBIZLrYSEBJozobI7ieCDNoG0PFNvcRDBRsQtTdExnJRX1aJsUDI1P711
 IVPOWc8lLBl1N8rMP0OFrh++P3APG5MK870x8u/4lJ04ZLbpaqkbpugR1G8EmbcwctYVRozVoI
 cSTCz3ZNibx4fLyqyuyK6pSFlzromvET3dd1zcjm61oJQEAAA==
X-Change-ID: 20250908-mt6878-pinctrl-support-a1d117140efb
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757940385; l=1613;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=nZ7OKo1OumVzkuKry68ZUJeaNsWtdwCoQlST8Zyjk5k=;
 b=vT5USx8yXGrkJw4bzhrJotrS/vOL8+/o4FILRu/5UGNxjhXiDDrY8dLNbeJwsoMscv99/cDg/
 xlLNTYlDzbIBG6pVYxyM0/nPSLh2vnIdVsyKZaJ0U31pjsEmSWEw6k5
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Hi all,

This patchset adds support for the pin controller found in the MediaTek
MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
instances.

This SoC also uses the new "eh" bit for controlling i2c driving, support
for which is also added here.

Changes in V3:
- (Krzysztof) DT binding: Limit gpio-line-names

Link to V2: https://lore.kernel.org/linux-mediatek/20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org/

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  211 ++
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      | 1201 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1478 +++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 8 files changed, 5155 insertions(+)
---
base-commit: 9bee9db994df9f1a2572e3ecd61996fbe9a871b0
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


