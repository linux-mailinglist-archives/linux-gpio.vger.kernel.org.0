Return-Path: <linux-gpio+bounces-18131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B140A7728C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 04:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1F0B16B93E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 02:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC85A1AA1FF;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMIHModY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71696155335;
	Tue,  1 Apr 2025 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473183; cv=none; b=epA3CpHRqB6CvdVz0ZeYTRMllGNiFPut/9S5yQv7OcG6GX7a++JNPHciTKq7YbfS2YmizPvEQotBhJXIB/StmJxDEUgTAznLUDTCaiT5Tz1MzAWpmKMnijl7VcoOppBGbqiPe+t2vI29NV3Xqy9dbvqqvqHCNMSV5/mETrHa7LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473183; c=relaxed/simple;
	bh=N7COEdohT/p/ERmnPBTo3f+/HD3+Lg9hkfh8iPLCO6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=icanXXrGaT/NBA0p+Y97raEPJeYE7UpV7cp9EN/NHXqKx7W3wih2BI4UbQHZarprMX/5fEdCPLR51NcsgejiHK+SuJGZ2Og9eyzQqeATV9KvdlvpWAV3zsPfHiSLShM/A2pnbcagRBiUT8SyoCUP404/FFFW+4qlzRsOEbotIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMIHModY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E948DC4CEE3;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743473183;
	bh=N7COEdohT/p/ERmnPBTo3f+/HD3+Lg9hkfh8iPLCO6s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fMIHModYqcEylVKxLJ6SmmPyvchKUR3hqtbEWgvctIhyHENySUPfe0qFRFHT+Z8n6
	 oVCp5pUIpuwWlRzt9Yvp/bN4QaMOah3SZ+4BUV9QgNCHn3CKkZgmpSolzm5Qiu7ASZ
	 f+8suDjEk67RyO6k0GZF1YIDE9p7zpBtIVQ2IcgVTdbHTngIffp+hRn8plgpl/55Fr
	 Yj2ScPhyb+F2lV+dujfvsELIYC5U6dD8c5xW7s5dTUfsRVU6WwIiVAEH6w9bKy8c72
	 b/0OC2psWgGqQ0c4YcM42vQ9j7rmbqZaCiderJH4zsHpRqc1MVdQalFwth5iciHmpo
	 Cwv3Q3QnNyrbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A7AC3600C;
	Tue,  1 Apr 2025 02:06:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Tue, 01 Apr 2025 10:06:20 +0800
Message-Id: <20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxK62cC/03MQQqDMBCF4avIrDslJhqrq96juAjTqANqJJHQI
 rl7U+miy//B+w4I1rMN0BUHeBs5sFtzyEsBNJl1tMjP3CCFrIUqb2hq3Hil3c84KNKkjRG2GSA
 fNm8Hfp3Yo889cdidf592LL/rj5HNPxNLFFi1SgpVtVRpdTfL7EamK7kF+pTSB97BAKWmAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743473181; l=788;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=N7COEdohT/p/ERmnPBTo3f+/HD3+Lg9hkfh8iPLCO6s=;
 b=/Y71x73Ay7L8h/1pL9RFzAr9jHHiKfMAvm5TBYQ+ExyBsiJw/DB6NQztZwR2sv6rXORs5CGwt
 OubXuc7SDE5CuePXh35gvVlaSnQmYqT1UZVqhwBFS5QKKzPURSETDhr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Modify bindings according to Conor's suggestion.
- Link to v1: https://lore.kernel.org/r/20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  8 +-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 2 deletions(-)
---
base-commit: 79e0ecfc780aaf8c0b6658607f75a661a5f00736
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



