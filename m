Return-Path: <linux-gpio+bounces-18789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2570A88363
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 15:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81CCB16D158
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 13:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336912C2ADE;
	Mon, 14 Apr 2025 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJcJCmvq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05462C2AA5;
	Mon, 14 Apr 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637424; cv=none; b=YABfi3MB++8tnl8G4qJdPRLm2th0ArMq3OemuFmU+22u8VvUpqm83uN9d9QXQv8I05LkLDbnX5dS1kRIYV/NPuhHdxtfL7tVJuAqT2utHOc3b4csOBfUQYhQj0cLIqXglTYZUnL6G2lLFT4qcNMuJiekwoIhnd9b9p5RcBJWjcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637424; c=relaxed/simple;
	bh=pK4wU4mod5JTUm/l7vr1AtMMQDpxsHfsu1cMbkKNcrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sVnBW+RTjgafMxW7KfeIoXpOSjE2i8Em35wLQ818Vpxbh90vnf5uw3i+tU14uXsVHvluv+wJ27foyMlLOtVdVPk2OC7AM53vlIryuijDxX4lhRmaI5/Xtu3I/cc56Ub9Epsh0zPCU/3EuMh1we1ChrZ8OPrhkLwn20A9I9FsVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJcJCmvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF88C4AF09;
	Mon, 14 Apr 2025 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637423;
	bh=pK4wU4mod5JTUm/l7vr1AtMMQDpxsHfsu1cMbkKNcrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oJcJCmvqeQpbtEHv8GExglmSmnZrHzfzxa0qehgsCfD/o0J7En5cCqGcwGQinE0iw
	 Gcac7iGFmTIOjc6OCdLEHACcPREypfTpQrIZ7uN3qg8CNVAvGulCtUI9YFIdV3IQ1n
	 iWTQsJmp2h+nQfRQSfWTY0KN7e6QElGlND8gore3MMe13nGWYe+IbgFWqivOozI6w3
	 vgRVRjjcjtVXn8NUewLhTcpdQ6NKvuMUq6KqTJedDouIkK23wKqx+ab34adLuYdPHh
	 yMRAEg4xlj/ZO5MU+693kafIWZGExGbPDSIxrwxSUJrxR1RH751QUMnFTP81tA2zWM
	 2dAWzU/qONZSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 13/24] gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
Date: Mon, 14 Apr 2025 09:29:46 -0400
Message-Id: <20250414132957.680250-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132957.680250-1-sashal@kernel.org>
References: <20250414132957.680250-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit b8c7a1ac884cc267d1031f8de07f1a689a69fbab ]

The regulator comment in of_gpio_set_polarity_by_property()
made on top of a couple of the cases, while Atmel HSMCI quirk
is not related to that. Make it clear by moving Atmel HSMCI
quirk up out of the scope of the regulator comment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250402122058.1517393-3-andriy.shevchenko@linux.intel.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index cec9e8f29bbdf..a0a2a0f75bba4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -247,6 +247,9 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		{ "fsl,imx8qm-fec",  "phy-reset-gpios", "phy-reset-active-high" },
 		{ "fsl,s32v234-fec", "phy-reset-gpios", "phy-reset-active-high" },
 #endif
+#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
+		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
+#endif
 #if IS_ENABLED(CONFIG_PCI_IMX6)
 		{ "fsl,imx6q-pcie",  "reset-gpio", "reset-gpio-active-high" },
 		{ "fsl,imx6sx-pcie", "reset-gpio", "reset-gpio-active-high" },
@@ -272,9 +275,6 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 #if IS_ENABLED(CONFIG_REGULATOR_GPIO)
 		{ "regulator-gpio",    "enable-gpio",  "enable-active-high" },
 		{ "regulator-gpio",    "enable-gpios", "enable-active-high" },
-#endif
-#if IS_ENABLED(CONFIG_MMC_ATMELMCI)
-		{ "atmel,hsmci",       "cd-gpios",     "cd-inverted" },
 #endif
 	};
 	unsigned int i;
-- 
2.39.5


