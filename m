Return-Path: <linux-gpio+bounces-24866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19113B332B1
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 22:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989181B27757
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 20:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4231623E359;
	Sun, 24 Aug 2025 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="KrFkjzdN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward202a.mail.yandex.net (forward202a.mail.yandex.net [178.154.239.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0680A239072;
	Sun, 24 Aug 2025 20:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756068650; cv=none; b=qs0Tb9B21KK4atQovTe2hFlmuggVJe+idKlLKM6yXySLXw5sy1kUhmjRnogFJLILu7TSd95YtBwaWrtj3ply+aDD52m2OVMdlkjzC4KdU3Mt+ynDjJ6FVmkMbaDhNm0SETuvcE8/01fYaqP38+krLlM+Z1DsjhFkukhSblvpzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756068650; c=relaxed/simple;
	bh=fqEukYyRD5T1ITLm7ZKJ9tO/J2dsjjzmG78Xal6Ywtc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MKLAVJAwSbL2JZ0NfIGY9i6rT0gwV/jKxrAWfo+qYzu5Wz7JVoMzs6uL28gCpRr3qFJUiwSlICsGBbeFlOYu9rN81hGOPnO/9Jz4V8RboLGL0R5r8CauwaN0Kun6ZZQM0sluWrg8fINuhBhpcBEqPo8l4iR2ql60IO+Vb7Lf2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=KrFkjzdN; arc=none smtp.client-ip=178.154.239.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward202a.mail.yandex.net (Yandex) with ESMTPS id 10A97846CD;
	Sun, 24 Aug 2025 23:42:18 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:e8d:0:640:bba7:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id AA5A6C0056;
	Sun, 24 Aug 2025 23:42:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 8gd6rXeMneA0-7dTnpZxT;
	Sun, 24 Aug 2025 23:42:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1756068129; bh=xCx8FW0uSugXQ6aPOTyb0QRe4AEJBbn7xSyH0CrfJQw=;
	h=Cc:To:Message-Id:Date:Subject:From;
	b=KrFkjzdNwgpWqhtlWn5eDL4orQ3/p+r0qceAfvFHqHOGh9yqRdX8iArjIdbtO9h27
	 9BNhWsxwjeFolvuhRWvXYQDb7qVJRayTvem6NH4+tFtklCciRldU1LTJUwmfIW4UoX
	 9PBudzpBy3x9/cBLhARNrqTHZprQOhMFbSF+2f0Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Nickolay Goppen <setotau@yandex.ru>
Subject: [PATCH 0/3] Add SDM660 LPASS LPI TLMM
Date: Sun, 24 Aug 2025 23:41:58 +0300
Message-Id: <20250824-sdm660-lpass-lpi-v1-0-30ba0c8fa025@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZ5q2gC/x2MQQqAMAzAviI9O9iqjuFXxEPVqgWdsoII4t8dX
 gI5JA8oJ2GFtngg8SUqR8ziygLGleLCRqbsgBYbG7A2Ou3eW7OdpJophsJgkbAK3hHk7Ew8y/0
 vu/59Pyf1xCZiAAAA
X-Change-ID: 20250824-sdm660-lpass-lpi-a8b02a23861a
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756068128; l=1795;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=fqEukYyRD5T1ITLm7ZKJ9tO/J2dsjjzmG78Xal6Ywtc=;
 b=T5t4PS0KtnxJJOV3bnLzFDo+afkgI6Sud1MJaZ+4muVdsWTXP8nNVVbFfblKh2Fbk5FOWpLr9
 J1ZHnH30xXMByNYe7d3adsNlsdmw1NMzwaFOBe1oCoZC+dw3D6klaiK
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
introduces pin_offset callback for LPI pinctrl drivers to support
SDM660's quirky pin_offset function which uses an array with 
predefined offsets [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
Nickolay Goppen (2):
      pinctrl: qcom: lpass-lpi: Introduce pin_offset callback
      dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl

Richard Acayan (1):
      pinctrl: qcom: Add SDM660 LPASS LPI TLMM

 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     |  74 ++++++++
 drivers/pinctrl/qcom/Kconfig                       |  10 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  13 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   2 +
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c  |   1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c    | 196 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c    |   1 +
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c    |   1 +
 15 files changed, 303 insertions(+), 2 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250824-sdm660-lpass-lpi-a8b02a23861a

Best regards,
-- 
Nickolay Goppen <setotau@yandex.ru>


