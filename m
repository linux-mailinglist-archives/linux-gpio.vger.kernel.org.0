Return-Path: <linux-gpio+bounces-11452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441E9A0EF9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A3E2887B8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F4B20FAAB;
	Wed, 16 Oct 2024 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="BsZ7CwrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B720F5C7;
	Wed, 16 Oct 2024 15:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093734; cv=none; b=GGrdndDZtIuPSuEJD0oH6Kl70PgO67mW424QtB5r8Hoi64pvky079rz6LbBHLfSK1hxrgRLaJRTHGoVBIqs2ZkfNEn1nbHwazubqRg2exVaFA9xOsYcw5ypy7MQAoYsy3v/Bs8nea63WzTudyP8wsFU4Yrl01jhUEcdEWj4uAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093734; c=relaxed/simple;
	bh=aEl61Jkvijpf9OerpfhDqw0WYK3RLYshQbKuFh5YI20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZbmjWttYeIsDN/KXS+XuU/PhKxjIdBY5XMdTRYezgPkTW6H+AJ2HVJ/OZpOWjiF/sUNRk5yN8UrK/kdpOKHu3gxeMNXGZzbW4HTwpgKXeodq73M9PPAwvPuvQR0z0Vc4JYHRc0t9LJ7gLAGzuBVgiCiHzHWUBakuhkvenMW8z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=BsZ7CwrE; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFkT6wLNzGpQ7;
	Wed, 16 Oct 2024 15:48:49 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFkL3Yj3z8sWN;
	Wed, 16 Oct 2024 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093724;
	bh=aEl61Jkvijpf9OerpfhDqw0WYK3RLYshQbKuFh5YI20=;
	h=From:To:Cc:Subject:Date:From;
	b=BsZ7CwrEtU03Z5yW8z/2ZRnTQWKXHdtuGr4CELUOeO7glImLZQwyF5dygPXIOKs3v
	 NSR37she6FU341gJCaOyi3YoDXzR1N9J478uWKUj5DrVhdo5m8/Lw0kTPY7A0IoqhE
	 i29dYLLtZ7ADXhUTCSCO/v580zO0OTTv1InD9bmDODWqVryA4VoiWOEmjq3C6b8fyg
	 MVZlbA43gMUII1sJ0CZKEApJA3aiE67f9W1LWGaS8SssukwPVGFai1sFzu4iW1Bi0Y
	 eonlz1Y1SLs2mc9YmS7Om8MacGDVOGYbVxjgbABKXEEg4FnwsCppGQkcbACpyWHHuG
	 CsJpAY7JrgjvA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/3] Add Exynos990 pinctrl drivers
Date: Wed, 16 Oct 2024 17:48:35 +0200
Message-ID: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds support for the pinctrl driver for the Exynos 990 SoC.
The pinctrl bank types are the same as in the Exynos 850 chip.

Changes in v3:
 - Reword cover letter (remove chipid mentions)
 - Rewrite message of commit <cbc4242192b7> ("add exynos990-wakeup-eint
 compatible")
 - Move device tree changes to SoC bringup commit.

Changes in v2:
 - Moved bindings from SoC bringup commit
 - Moved device tree changes from SoC bringup commit
 - Ordered pinctrl nodes by unit address in SoC DT
 - Moved the exynos990-wakeup-eint binding to the correct if.
 - Added pinctrl aliases to SoC DT.

Kind regards,
Igor

Igor Belwon (3):
  dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
  dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
  pinctrl: samsung: Add Exynos 990 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 140 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 145 insertions(+)

-- 
2.45.2


