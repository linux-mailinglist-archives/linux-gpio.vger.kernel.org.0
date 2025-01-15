Return-Path: <linux-gpio+bounces-14812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA13A119E2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333587A36C0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0C922FDFD;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKOc0Bcr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948722FAE6;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923323; cv=none; b=lN3o7/niqVEu3WJbC15AfA0tASJtyC9Gef/9g2qvJxqhka4rUwQ2ayGfISf8hDbL+SfQPTJ85wdjUkFutgz83BcrPf6Nh2YfCUyVd4gjkD01JGA0XXGF7PcUV+ZqXQzK3y1/cT34aZzaR+K4wiZvOxzWEEu3C5kLdT8y9xf4W7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923323; c=relaxed/simple;
	bh=BIBrJL109H6KPuc+9XD6oy5aeMe7UkZxy1rC+jwAgJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEPM5t5F+ex39tBmdXFudgteWgQs+yKoFeQ9xJJSSS78rAF1pFhbT0wdaakUYkLtgcGX2GmDZeXhbH+J603kZhQUNtuUa37i3xPKmmtm+eS411Wi8kNIIYD5fu4jA3YmV2YFgugtXXGnOKKqj5lLidUnxJO8mPf3yZwSwbN3Q4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKOc0Bcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC9ABC4CEE5;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=BIBrJL109H6KPuc+9XD6oy5aeMe7UkZxy1rC+jwAgJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RKOc0Bcrm5X41ZbqYtlsmXyDmrTX/ieqZibiHTx79/tGZBoTdefHjsc+TejpJGEqt
	 E/n9fvOxziAbpeEcEQJo3vVMbLyaWDQuxioIoBwPvGyOvCADsXnDt6A+DiJhlz7F4A
	 Tf/AmVcsFws7ZxdwcwGFKdeeoKxo+s2bC2QZEdW3srhOd6jlddOFk4Zz4+aPIDmzqs
	 uksWV1WoVy2Qf+1OHJGFP8g1Y341N+J01JqXBrVUnJYbpfsS9QvPuS2f3U+gUaJsn+
	 ocFiVYkTz/doImiKQ1YZcRJJYrdU+Z/qM8ecNr7i7qniw2ZFX3YOaLgFC5wZ5W01iM
	 Se/Cu47UBH0Cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D09C02180;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Jan 2025 14:42:03 +0800
Subject: [PATCH v3 5/5] MAINTAINERS: Add an entry for Amlogic pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-amlogic-pinctrl-v3-5-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
In-Reply-To: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=g90Y7KQss/y457N73Cj7ZyZIWWG4o61VIHvixhZOt74=;
 b=c4t4ZWSqUQS2jrEX0OzSMuVwpF2kpjDeorFlg/oJPUPhTONBvWoiUWXGhhCnOG+rWLY0Mb7GK
 MGhjx/Ol4ViDSIfhoM0oWU5PcEH7nmur1scCcIiko2qBnZbB4OfWmpe
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



