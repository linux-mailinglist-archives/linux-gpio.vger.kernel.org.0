Return-Path: <linux-gpio+bounces-16204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BCA3A61C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 19:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63BAB1896C7A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEB61EB5F8;
	Tue, 18 Feb 2025 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Hv4RSM01"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0316C850;
	Tue, 18 Feb 2025 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904564; cv=none; b=CRwc2/HA8HZSPq7kJNq60whd+YvVYG5ZY3hqeUy1wafslTQAhqRFQFg0lndpyIAXQVSzLv5/h56SRee82iE9VkA4ekWCJhgSxcMOAHanRY9Y84QtfQ1DLMUs3Pplx14MnkkC5Zt/XvOUpWQe9fHz/W+namCHe2GtzAFbfD7vZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904564; c=relaxed/simple;
	bh=mu4DL52dax5XNXsfxCOUhTgjTpU2ZBw1b0womh5uByM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pKaS0fJ1QDREQxckrYhVAzMmFpRcmbO1rhxtZdr6Yl8PBpN4bq5wqcy38x0iNbumLNSBO7ozi1/yZEUmn3pS0OA+sSMSHBRXcXHQbdgYhthpQdM7ym38HprjrsKdDXzbvPlG/O5EZXxMChJFzxtEoTQtXJlgeSaa7aQvqcKvQQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Hv4RSM01; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7431825F75;
	Tue, 18 Feb 2025 19:49:21 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBDZ0cCM_kBQ; Tue, 18 Feb 2025 19:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904557; bh=mu4DL52dax5XNXsfxCOUhTgjTpU2ZBw1b0womh5uByM=;
	h=From:Subject:Date:To:Cc;
	b=Hv4RSM013Sz9Np6jahU4+eKmOsRGWTHAO3QNvIoS6wZg+ZwInOpG1cGZCdD+w5jwN
	 xpL4FyadDiFwJdv6TAOTbr1iKwy5yIJUpS0oYyOXlSvwqV60b24XEF3LYQYypgPVWm
	 hiv0pWleGiUBbJ74IXh7Lowe2IL1LPZYXHbm3bNRvtYlcumJU7I7eUcZ0QTXvzj3UP
	 H5SizG2B2nZIokOYOwXtFW6C9gEZim7LmnNOj7YOk8Hos7PT+0OnjR5PaHsVyxtBAM
	 UTFDEtxo1Fkr/i+CE78VlltbEpYEI2zRw38AFTk7p+UtBLwf9I9XVXYShZuhrNjquz
	 XAEK/2tj9iOqg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/3] Introduce pin controller support for Exynos7870
Date: Wed, 19 Feb 2025 00:18:56 +0530
Message-Id: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjWtGcC/22NQQqDMBBFryKzbsokVUe76j2Ki6pRB0oikyCKe
 PemQnddvgf//R2CFbYB7tkOYhcO7F0Cc8mgm15utIr7xGDQFGjwpuy6OR+oIlQzuy7KWyGZshh
 I11hqSMNZ7MDrGX02iScO0ct2fiz6a3+5/F9u0QoVUVtXiJTXLT16DuJ9vHoZoTmO4wNsWGwLt
 gAAAA==
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=1290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=mu4DL52dax5XNXsfxCOUhTgjTpU2ZBw1b0womh5uByM=;
 b=PzYnIM2lWsCoLkGa3R8NJ+kI6BmF8pgCNCKA0dWf36zvs4RCqb0sv2q+AkgsNSQZ0eC6dF+lu
 OkC9Rpdsl2IDeRsyPVPJuDIV/cA6OEJ9nCsaYptnVqcbNJUXTEEt+cF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for exynos7870 in the pinctrl driver. Also, document the
ALIVE pin controller's wakeup interrupt compatible.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 141 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 176 insertions(+)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


