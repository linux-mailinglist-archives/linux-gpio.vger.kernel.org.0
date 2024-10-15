Return-Path: <linux-gpio+bounces-11323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB2399DE62
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE581F21C3B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE05C18A6CF;
	Tue, 15 Oct 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="K1USKFV6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6FC189BB4;
	Tue, 15 Oct 2024 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973825; cv=none; b=npP0fcBXU88OXSeUGfC/CcuIvr1P3jUNm7U13exj+QoWVCL101I28eYgbGO7wZXBTDlQhosuw0JCWPpF0kwmHuY2CDrDfYl1T68hUCcN5kwEu/IQH86XUEmdoyfLcX9yf74yY4unOtB4tIH2MCFGOxcpftunmd8zW+WZAHo4ZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973825; c=relaxed/simple;
	bh=MMes7Mz2J4J6EW4rS0Ksg6aHaba+XK0hz+AuKwJcFFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dof+gfJz4+7TpH10zoYCI+5M2yK9tUzCJnNMG7RlbTObU/wXWpwtBFcz/Wz/EuHF1d0/l0Q+4SMfE1CXsqdLHNHgub1yYXmze1rhcFiJEFOFBcb0HgNPjJjUSGRDHhYHD4W09lPhPdXS73mQcx0dTZ7+OgpBeLKPOfQ0rJVE4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=K1USKFV6; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPNb0RvJz4wRF;
	Tue, 15 Oct 2024 06:30:23 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPNR6Xsbz2x98;
	Tue, 15 Oct 2024 06:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973817;
	bh=MMes7Mz2J4J6EW4rS0Ksg6aHaba+XK0hz+AuKwJcFFQ=;
	h=From:To:Cc:Subject:Date:From;
	b=K1USKFV6OqTr7OQxcrIJNfqBIsNgckUEaBpbLbQs+9PSGcvaYVQ7+z+dfMeabwp1F
	 r8YYo6qcNqvShmCw4e/csAOuIwe4flUhfgnVdt84RStTHhMy0vkXkBK4zLecUldpQc
	 5aZijCg6BrD1Pd2NpnrjLerQAbq5fXTko3QrAykVJSmFohC0L5WVDkQcS3/PbuYmuE
	 pEoRGudbSwuXMHCfSvhokHXRO5fKJUNuayvRsl6smKJEXcFO0GB/xjqONzDs7KRjAQ
	 1aopJ6fIrIWDkz87LaaCwDkSRR5qFofPNXdnqY12N8fp6aK4gWcBKpSQ7FRLuaLjPK
	 JVCyEvK09Z8hg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add Exynos990 pinctrl and chipid drivers
Date: Tue, 15 Oct 2024 08:30:08 +0200
Message-ID: <20241015063010.713407-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds support for the drivers for the Exynos 990 SoC. It
consists of the pinctrl driver and the chipid driver. The product ID
of this chip for chipid is 0xe9830000. The pinctrl bank types are the
same as in the Exynos 850 chip.

Kind regards,
Igor

Igor Belwon (2):
  soc: samsung: exynos-chipid: Add support for Exynos 990 chipid
  pinctrl: samsung: Add support for Exynos990 pinctrl

 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 drivers/soc/samsung/exynos-chipid.c           |   1 +
 4 files changed, 144 insertions(+)

-- 
2.45.2


