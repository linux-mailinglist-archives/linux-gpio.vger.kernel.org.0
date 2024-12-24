Return-Path: <linux-gpio+bounces-14188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F49FBA59
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F75F7A1E05
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C32B19048D;
	Tue, 24 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cee27PdU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEC15575C;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027365; cv=none; b=aSIImgBqOMaQxPjY8Yi8lqDbo3NUVNZ0twYRZY8qfSTlkW8W9Yx1bHjM33z9c+fj70BkohTHjaodXDPQd0ux0oN2i/BrJgOr8/tzStriNAlI4ECCsmyzInAH1hdVLnOx40stQt4c0oWPjfXVT3RONUxP//EncacsXnd89fMY5bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027365; c=relaxed/simple;
	bh=X2HxQhOFO42ryLga7t3u+bd9WRooGQb2H92J31Mv7xw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bHj5pXKnKeA0Wc/AGd1MKpczWHxSAnt5r/WutkHVBwperxWr4ygE3B1W0RoF7xBHhEX95cKLMVPkO7W9eooc0H5K/vK8bemR92OpC68z8Gb1nEWdq3q78KCYvdkHMAMWSkpq16PLS5RqXBHD4LcYGmCGiNP2QpPIyaZGAvLt1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cee27PdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 609EAC4CED0;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735027365;
	bh=X2HxQhOFO42ryLga7t3u+bd9WRooGQb2H92J31Mv7xw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cee27PdUIMNFeLfoCbnkLshONBy1miGB1v9Qwkj0njhecuRQ9CF/kIKPbANajQuHf
	 /AE+JX5OWFwpMG4J4t5uNvU35MpzQwU2RX+DDLWR/EZR6HgwlF48FnMEqF75jxcOzm
	 /6Fb8ldm8Ita0P9q2fFvYtEqU/hiXaPXanfvDzYFToEE6Zp5Rjc7D2P+sqtCPlTC4G
	 WEWY3XE3rj3hZ8dwhcn0FTI79V1IJBRj8znRcheav2Ai5MatTKWT0xsOHWyiiEpWgx
	 aAggec4de0cC1i8L3lBu7kb0G3kAMZPjHDTD/M+OjEnPTATW0AK97SybmlcckGlza/
	 skjVn1+0YFtDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D40E77188;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/3] gpio: 74HC595 / 74x164 shift register improvements
Date: Tue, 24 Dec 2024 09:02:09 +0100
Message-Id: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIFqamcC/2XMSwrDIBSF4a2EO67FF/Yxyj5KBqLX5E40qEhLc
 O+1mXb4Hw7fAQUzYYHndEDGRoVSHCEvE7jNxhUZ+dEgudRCCsXWndJNM2PQKuWt1sbDOO8ZA71
 P6LWM3qjUlD+n28Rv/SOaYJwFKx2/P5wNWsx7KhXTNWKFpff+BUXVbeKdAAAA
X-Change-ID: 20241213-gpio74-66ea33da446d
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735027364; l=1093;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=X2HxQhOFO42ryLga7t3u+bd9WRooGQb2H92J31Mv7xw=;
 b=DIOx5rgvxf6Qyxf8eEYfltlCxDu7Su4IYEfpxMT6fFLDTdQEw+rnTYYJZuytHAamYW+BKNKkc
 tYh22Hu5wy7DNJBE+myBPL0HwuEOATs02IYSvUzt0KgXfKt+IlqWOuY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

This patchset adds a compatible string for another part, and clarifies
the role of the latch clock pin on 74x164-compatible shift registers.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Remove patches 2 and 4 (latch GPIO support) in favor of a new patch 3,
  which explains that the latch GPIO acts as a chip select
- Add missing spi_device_id entry in the driver
- Add Linus Walleij's R-b tags
- Link to v1: https://lore.kernel.org/r/20241213-gpio74-v1-0-fa2c089caf41@posteo.net

---
J. Neuschäfer (3):
      dt-bindings: gpio: fairchild,74hc595: Add On Semi MC74HC595A compat
      gpio: 74x164: Add On Semi MC74HC595A compat
      dt-bindings: gpio: fairchild,74hc595: Document chip select vs. latch clock

 .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 18 ++++++++++++++++++
 drivers/gpio/gpio-74x164.c                             |  2 ++
 2 files changed, 20 insertions(+)
---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241213-gpio74-66ea33da446d

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



