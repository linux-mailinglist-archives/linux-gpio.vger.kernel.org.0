Return-Path: <linux-gpio+bounces-18051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C64A72C4F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 10:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F9D33B8829
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6463E20C482;
	Thu, 27 Mar 2025 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imWLnvke"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1845A20B1F5;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743067598; cv=none; b=NBgp2Rn04ES9Cy8DqAALGBJv1VfLfTtciXoaya8vMJHq9cBHn3BkVjTQ0cEoY2GBcSb9E3ixtvVl+DmhwSKEJR3wImo8hgnfjaDsMeafK8AphNvaXEikApA1cyL4eroTiz2ZeV8MPZQVrizc2M33i5U6C2pdV5lESBUtmdMOC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743067598; c=relaxed/simple;
	bh=MBw8/ACFWUtiSMTIE+tw97Aq8o3QGA5ONAcZtl4MtsE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TXGmKIaUDLnDo2MLO7YaP1MYN4VQLvVsGlrdt55SdEFb+Vjq1yRqC/oKm8aIHe6Cq+DD6kFEXT0regS8YjqKqB0EUjQvoflqFuWSmbAXHdCJlay2qkymmRu2N1Cd3zCUG5co1FX4PuzQPYXeL+uFCgP0AtFBb2haMzby43kLYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imWLnvke; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BCADC4CEDD;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743067597;
	bh=MBw8/ACFWUtiSMTIE+tw97Aq8o3QGA5ONAcZtl4MtsE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=imWLnvkeh4ff21wwqMbBzEN0A/wC4ZedyIkhfVbmHCKnlFhCyUmfDzE9bBfhNE/+Y
	 rZHTf3a65ro0+017bvzEkspZPccDX7dibZ1pNRlz7CGzUmLycp4dDzkOU/chHBQn+w
	 cb2VcVVa3dnEAKlRSHT7BQ/AQwnJ2ILO+DCRn/DTxOdI0lB83BjUPXptcxW54vdC28
	 /JilObvrgqpZL/TdA4ESgc5LClJ+5eGiu1qyKWZgvIAGjIFqtmZ+7Ppni3CwSPnjZW
	 qAWzjY8yONIRMhjYLSKnX0fabbF5+15hZHsrWOJUe2iO0lTgvWyNUGRfb7QG/ZaALd
	 efpeRDhUWyhuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6699CC3600B;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Thu, 27 Mar 2025 17:26:34 +0800
Message-Id: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoZ5WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ML3URT3YLMvOSSohzdNONks2SzxESDVPM0JaCGgqLUtMwKsGHRsbW
 1AJ39vfxcAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743067595; l=623;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=MBw8/ACFWUtiSMTIE+tw97Aq8o3QGA5ONAcZtl4MtsE=;
 b=2r8IzIYkQPHPdhntWxW+/CTIGjNovPpbnjAweo/oqs2razhgvAfjqxIzYJhjniWECQa0hhn1+
 d8AovbPfI/BCiMloXLY3NdsgKc3BCiIgUxgK+PgkMHoxiEKYL2KDlDr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  9 ++-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)
---
base-commit: 73a143e436311183186ab4b365a84c662f2c9651
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



