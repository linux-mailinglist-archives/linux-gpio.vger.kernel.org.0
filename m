Return-Path: <linux-gpio+bounces-25761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22925B499A7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2DCC340E2F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5167624678E;
	Mon,  8 Sep 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Tnu7FzlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD5246BB8
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359115; cv=none; b=VWxt4QIX81yXeWhS5I8QdqXwXKm/H/QBxw5pPgARIGWx5mNCFVY5z7QlFqlQdbaD9XsJ6Gxaafxu16zOeJzycpdykTTCtu07QcDGLyL4eqEIQq+ijDDKsqP8HXDsI5DDYuz+N6VJcimh6kWH23H4saZE6RbGHYTP/ql0Av1NXEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359115; c=relaxed/simple;
	bh=9F2TNgdH1pNDHLwB0pIr1YxFZjkobiXp5n7/OLvFJn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rf6ozlCvZI/hGHoHkQxTKSLaHaE1QK1/r7OEpLYWFf+7FrSLAkC707Nc9vt3IWy3iCgvwYOddxjbMHkJv/xbRh5gsAcJVTFpHXRfdCYLJsv64GRYQdN9H7wlZNLlfPXaAGiyJCvaeiumoN7LaZUwYTGCjxytfhf2x8R7fB6JVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Tnu7FzlN; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Tnu7FzlNRrvAkepIltGvjpu9EdsiMA10UkZXaZVXkcnFa1peLRj3E8wl6ynPkTwOwMxQEQSt7xTF+kh0S40yBzp5lJ/He13/W07ehhlM7oD5YrpbYqsSp4/gaVGa/4bBsnk5ODMI+3c2/OyI+Yq2MC9FiwbNfpAoYLOPr98MAj0ijI3Z9x25zkgg7YVn7F55kZHVOlUfQL86k9K0qWS5Vr02VvFjle7t0EHmSTjsvh4O0Dk9mwqK1xVE9lkEd5JgFllDbV9+uf/stStJkuebRcPYoXUZiyhVgyp/jHiOGwYawBbn68O53kZFbbtmH219JW8BczfN/dwfeaFnsul7sQ==; s=purelymail2; d=purelymail.com; v=1; bh=9F2TNgdH1pNDHLwB0pIr1YxFZjkobiXp5n7/OLvFJn0=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 292196779;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 08 Sep 2025 19:18:08 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/4] Add support for mt6878 pinctrl
Date: Mon, 08 Sep 2025 21:17:54 +0200
Message-Id: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOIrv2gC/x3MywqEMAxA0V+RrA004qP6KzILH1EDM7WkHRHEf
 7e4PIt7LwiswgG67ALlQ4LsLoHyDKZtcCujzMlQmKIyrbH4i7VtLHpxU9Qvhr/3u0YcaCZqqDS
 8jJBir7zI+Y77z30/5GtqiWgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757359086; l=1603;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=9F2TNgdH1pNDHLwB0pIr1YxFZjkobiXp5n7/OLvFJn0=;
 b=wI4YdYlwNvX69+y3MzJHzF6UO6pNEeWKFAjvc+aSn8WWJDIMJQsllOvMaB2EBg5KV3E3rULTy
 L1mHuP3micEDVGsrwXEWOIfrNFSLazxHtZeK84LMp02aFUXnREqFYo8
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Hi all,

This patchset adds support for the pin controller found in the MediaTek
MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
instances.

This SoC also uses the new "eh" bit for controlling i2c driving, support
for which is also added here.

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add support for eh bit
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  209 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1559 ++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   60 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   24 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   30 +-
 include/dt-bindings/pinctrl/mt6878-pinfunc.h       | 1201 +++++++++++
 11 files changed, 5342 insertions(+), 6 deletions(-)
---
base-commit: 64074b8d93abdc35ae90e38ab5135f0b13ccdf68
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


