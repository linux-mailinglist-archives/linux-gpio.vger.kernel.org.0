Return-Path: <linux-gpio+bounces-15293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D79A264A0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 21:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B6F1885D49
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 20:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1B820F075;
	Mon,  3 Feb 2025 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CN+kqb9t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5688A20E716;
	Mon,  3 Feb 2025 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614959; cv=none; b=swNs3lUNhKsWGB0cJnjLBPIa1IpbxBWY8LLqrAWzr7mNy/efSSmiid5iOIMxSS40+6oRH2xv9U4TgJwyiQ32uuzNCPY2C2TxQ32cMuknb5zJNoXSJ5oFDJzAu2EHbRYPMm6R0Kbz3llP6QUwpaPioabgayMWHHUKfwMH8JKP0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614959; c=relaxed/simple;
	bh=wyQCBq9DjeAid6FvobzALCpOnFonfXuOOwKS2EAE/Qk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eOD4ft9GaCgkSfbC9HccplLx37M5nKXLjUjShUaRpxAmlHzV+1wvvbXe+a5wcnx2RtEjT+Yj2muyGGZ131ou9dq+Ui0uYCNdWwcXgG6rCPrO5Li1RuP1b/CcnIDimRh96QWU2t38JGF1pYKDhAKmpjb9+TqVOJtYnuEaZs+60lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CN+kqb9t; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2014425A8D;
	Mon,  3 Feb 2025 21:35:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ege8AFfLagUn; Mon,  3 Feb 2025 21:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614956; bh=wyQCBq9DjeAid6FvobzALCpOnFonfXuOOwKS2EAE/Qk=;
	h=From:Subject:Date:To:Cc;
	b=CN+kqb9tPKDRZWtxkgdMx6XSyBV6f+WroWtfmeAlGUZ1lC2PZ0HmzlJZ3jdb99IGz
	 E0iGSXvCaWGOgECbssScIVvaTzZqQd3NytYqUom+G/kgwSQc28BxSYBYUGTATdZRFT
	 QtZaDpOucFvXHwCUN3rU0j5JJLkS11Z7ng0LhlHtFQLasEvEGHkUGkfWPpoZGZxwwi
	 J14cgqLPaZSxEf1nwO8LF0bkLnc/z/l7b39eCb0kDOPBGh5276GuSA91HR+b850tNN
	 e1H1qmJQucTa41zvNloQdL1ENnsnQUaHydtxYHv841RMKgxXxUupY57AjIHRGCCqAw
	 0ziorugmFaD8g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/3] Introduce pin controller support for Exynos7870
Date: Tue, 04 Feb 2025 02:05:42 +0530
Message-Id: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4ooWcC/x3MQQqAIBBA0avErBNGI62uEi2ixhoIDY0wwrsnL
 d/i/xciBaYIQ/VCoJsje1cg6wqWfXYbCV6LQaFqUWEjKD3OR9MZFCe75QqHQKN0a43sUUso4Rn
 Icvqn45TzBzmdo95kAAAA
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=1117;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=wyQCBq9DjeAid6FvobzALCpOnFonfXuOOwKS2EAE/Qk=;
 b=HXBcv69E5BIZnhQpyh7eiIErbwYj9N+jx6T9eEqdpuivBxypbOnA6ZyH8wZEkmm4fNO4kwY5q
 j0tu3Kb/F4wCgqfa+nX73xopN2AL5wlOqqATIWWaY9eONf4785Eez8c
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for exynos7870 in the pinctrl driver. Also, document the
ALIVE pin controller's wakeup interrupt compatible.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible

Sergey Lisov (1):
      pinctrl: samsung: add support for exynos7870 pinctrl

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 141 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  29 +++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 176 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


