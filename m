Return-Path: <linux-gpio+bounces-14241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2589FC995
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 08:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930617A13C8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 07:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B211D3564;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjYRt5S5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE621CF5EC;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199866; cv=none; b=doNnTWdQynYpr1lEr7x6YuLQE0+Ipn8p8hbojfRiE6qbvBeS3mTPaUmzlowjZTBKEs9Rg7Yz/TPInd0JHiJtuBUVGDU+2/lADxKS/6BYSuxLNnVM826hUymr5bXgN5BX60gvQLBT9gDQN3T8WmM8MudNfO2XDPELw8gYB7RaV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199866; c=relaxed/simple;
	bh=BIBrJL109H6KPuc+9XD6oy5aeMe7UkZxy1rC+jwAgJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYLxI5qPxRlYjlX2eGkgdR7XYul+yIOhZ4P3RKkU+RMWV7xzXgi9Jq33zon/gpGM51qKu1JePrVhI/kpf9ZHKX12O+Os2b0DLzDTDmZX5OZgRkSkAvmCSLkEb02mEFLlJrx0hO+Fyv0A/0zL4aHN9h9SrmhDtjWTGAsLAp9/ghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjYRt5S5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C773C4CEE6;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199866;
	bh=BIBrJL109H6KPuc+9XD6oy5aeMe7UkZxy1rC+jwAgJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjYRt5S56KSW1Mch3gmqcdMIGSvNR9Z+FoDehJyiZIyf9pT5cGDdd4B5ku6oiMV/a
	 fVp8Q8ahJwlZ8Stk1uoIwMr3oCmlswwRX9FxGIUAZGIp32KWq9uWxnS11baCutYh8B
	 xArHxHAzqtIyXdm5dyKoz4Z5hCh34nsRX6jVQNWlfUiq/CWmx2d/SjN3C7Am+Iamrq
	 OHdVIYeEExXuT2QgA648x43oMuIL7jPMhXDtytOnOyNQFVFRiAocdRCzv0vwwTmIHM
	 ERu25pYGcDufPm6IT9n6ODonrA5086I2CoIo8ijgCsHB5TIAxsXi3fDTvLitWcRco8
	 /uHu7Z2rML1VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB0E77188;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Dec 2024 15:57:45 +0800
Subject: [PATCH v2 5/5] MAINTAINERS: Add an entry for Amlogic pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-amlogic-pinctrl-v2-5-cdae42a67b76@amlogic.com>
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g90Y7KQss/y457N73Cj7ZyZIWWG4o61VIHvixhZOt74=;
 b=g7cEZyocn4mqnd6iOldMmY1d8HKX061PkPn1cFi+PZoXA4CRexByOfogvAjfEpbFFGbKLGHSp
 mtAIA0XZoJkDe/v4ozAil03zcldXydKzNj5hfS/5UxSKud1yzxy2Fas
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic pinctrl entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..b8905e8aa802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1218,6 +1218,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC PINCTRL DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+F:	drivers/pinctrl/pinctrl-amlogic.c
+
 AMLOGIC RTC DRIVER
 M:	Yiting Deng <yiting.deng@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



