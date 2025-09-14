Return-Path: <linux-gpio+bounces-26110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BBB569E5
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 16:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1157618990F9
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 14:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5D726E6FE;
	Sun, 14 Sep 2025 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="C+mmaTMw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960F26E175
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757861698; cv=none; b=VJW3xIlTXpEbfU/HXEnP88cL+Ego3YgRHu1DhZuWvG4qySrXzSkxZ1d03fPTupDrPUiYixVXTrkvNI5QgA2ol/jLq3vt3UxZPmUoOQJp2jXicW7+/Jesy8AqTQ0gfnOcl+cmBz2WJQfE+OKSMYegxf6zMXu34gN2ht0VMQM32OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757861698; c=relaxed/simple;
	bh=9DkDs73cZykCmkmg3df0Vd7zFxbD5eZBfhpDkbzHxAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=egiAkkmOeHKpQu93x1/4zcYdKC89+HBrnET4JY/zsRSPrZDV289aQDiM2nerYp0Mdk9NpskLZMCjF40YcZ9M+cxQBnYQWtcO1ePcbmOs4Yvam0omDBVILFhO6ybfv6VN2X3W3BSvzMje8xD3WLXlIolFEfzUdcpQGCns8Q2rrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=C+mmaTMw; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=C+mmaTMwjnogU5w2g633397v2KlZAuXWdNLGk/OIvLZ0ImFKhCkwQgWzUK6BPcw0Ho9KGvfWvL2b0cWRVveI7CRtZoVNfCDWhTuGeW1fEPNU6eCtdyUrYBVAf4KopmagI3A+Y61LQeNnskIRZ98LG+T2Kbo+PkTfgXQPJUGuWvS4u7WXgcrH3ydUMKe7rTCfxSiyVfhuM84d+8SWCH1c966Wxd/72iFVMa0gtUpNRTXtsEWe4wQFXkf6M1xxjtGZKahCQAjHIQmWtzNADTotuWyeP1PGiJq/eTXN5L5FvVixyY7qshBSuyAa6LlTpuxEmpXwfpF3CvATGSSf1mkNkw==; s=purelymail3; d=purelymail.com; v=1; bh=9DkDs73cZykCmkmg3df0Vd7zFxbD5eZBfhpDkbzHxAE=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1880024390;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 14:54:29 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/4] Add support for mt6878 pinctrl
Date: Sun, 14 Sep 2025 16:51:58 +0200
Message-Id: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7WxmgC/4WNQQ6CMBBFr0K6dkyLKNWV9zAsCgwwSWmbaSUSw
 t2tXMDle8l/fxMRmTCKR7EJxoUieZehPBWim4wbEajPLEpZXuVdapjTTdcaArkusYX4DsFzAqN
 6pWpVSRxakceBcaDPEX41mSeKyfN6/CzqZ/8mFwUSLkNb606btkL9nNElY+0ajcPZkLPkkOPZ8
 yiafd+/CP+FMs0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757861668; l=1670;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=9DkDs73cZykCmkmg3df0Vd7zFxbD5eZBfhpDkbzHxAE=;
 b=KUK37uPMFx1/1uBIfny5ukgD3ZcYfWwEoKjIjy9Qm4d26LSJfkA+EiPjTOLjqjHGVFCRUwNWA
 qGnY10D1OmeDdSXKmMFXqJi5u11RgnRiERGGA4+1flfnzR/o0bqSomg
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Hi all,

This patchset adds support for the pin controller found in the MediaTek
MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
instances.

This SoC also uses the new "eh" bit for controlling i2c driving, support
for which is also added here.

Changes in V2:
- (Krzysztof) Move over the pinfunc macro header to dts directory
- (Angelo) Drop useless eh bit commit
- (Angelo) Fix s-o-b on debounce times
- (Angelo) Massively simplify pinctrl driver, use PIN_FIELD macro,
  change eh to drv_adv

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  210 ++
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      | 1201 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1478 +++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 8 files changed, 5154 insertions(+)
---
base-commit: 9bee9db994df9f1a2572e3ecd61996fbe9a871b0
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


