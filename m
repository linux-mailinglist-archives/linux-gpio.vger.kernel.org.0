Return-Path: <linux-gpio+bounces-16133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38448A38423
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2A33B568F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57C821C19E;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ3TKYm7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773521B1B4;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797692; cv=none; b=NEohMgEb4/J4x+dO4QjU4BLAI3CUj99IOXmfFs+AIos0xo8DjGisytU+URUALjTIRwKCCqHa+ugjY7Bp4WjsrgpdbiGSjHZt1HaAGadKQNVfFvnyzHA/aixYCFePtswGZ/XtQI+oHuqo/PdznS3ckqe1Owd3tP+KBZBDlpnp+U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797692; c=relaxed/simple;
	bh=50LXAdQ5iCgOH6wLijxYspU9uZxYNQjnh5u8g8wSwJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iRNZbUJuhRvNxiAsLx62R4gscRgcnrnbs0s9VjYjTKohL7QAYM0Asyt9GqGFpH4jQHZ1e5eCpQUy+zVRGQFb6tq3+j2a03iCFHeiaf7LxhL3sqIHEtDBrI/DTTNtE2TM+592D0IPMNeEXBQlkGOIpxok7vy3cbS0gXZRnMfLUEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ3TKYm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAF83C4CED1;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739797691;
	bh=50LXAdQ5iCgOH6wLijxYspU9uZxYNQjnh5u8g8wSwJI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eQ3TKYm7WXmT8oeqSyW5qhlP3NjUJ3YAL7CytsOWGuNrWC/gmuz2Rp8lh9MOehT51
	 d1DuoiPT8Y0JfV871+wq2okIbFmUOlVT1ig6pMSzYcSg1rNWNFUkCPudv7lYJda0mz
	 R6TF5SZN8mCu6lCZ7z5HUgdikAlA7NRTF0n1RVcrHC8Pn/MwYfiqw/fReYqvmWdKmM
	 nfn+4t384mKOLx1ulJBsMcTAVp9YaE40H71fIqKHjTEZCrc8Z2SaeARx5dfz6y8WCF
	 BABa9ssBzToxnEsiKw58qs4Jo12fZfPJV5hJ+qaakZ4oZ5K5+y3y6fLnz5eTEG5pjf
	 w11ETvsc0Uc9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE261C021AA;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Subject: [PATCH 0/2] Add support for the PCF8574T I/O expander.
Date: Mon, 17 Feb 2025 14:07:50 +0100
Message-Id: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKY0s2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3fSCzHzdguQ0C1NzkxJdU0vzJEtDSzMzY8tEJaCegqLUtMwKsHn
 RsbW1ADoLLbFfAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739797690; l=688;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=50LXAdQ5iCgOH6wLijxYspU9uZxYNQjnh5u8g8wSwJI=;
 b=GNuwei57M4SHpZgsMdxN2IXvdgxcY6iaK+hI0/kedLn39n/2hueWxNDkFXyWwWyrnnapYX93K
 HqHANwueWJjDuVZE5Wo86nA7FxxTWSxyKS6ilvcibW3pj9BtMSYrTBB
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

This patch series adds the driver support and the documentation for the
PCF8574T I2C I/O expander.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
Tóth János (2):
      drivers: gpio: Add support for PCF8574T.
      dt-bindings: gpio: Add support for PCF8574T.

 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml | 1 +
 drivers/gpio/Kconfig                                    | 2 +-
 drivers/gpio/gpio-pcf857x.c                             | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250217-gpio-pcf8574t-597b9196639a

Best regards,
-- 
Tóth János <gomba007@gmail.com>



