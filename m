Return-Path: <linux-gpio+bounces-29387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBECAD6A3
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C4B3053FDF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B731D727;
	Mon,  8 Dec 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvNoDuzJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2631A7EF;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203197; cv=none; b=ZJQXecPGlcFTAuSG18LAfPHDSX5aVKrrGASpwZ0XivF0x7aKWLp41ZssyvQlCi0pBhm/1LNXn1b9sFiUZ8p7k7BDsvdAcX/+DnSkyqLFLtoV4to1N5fiRPJGuXuKJKWcbJzsZ1D56e1RLFld2DDpRCc2nBW2OOC4tXyRKNK80yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203197; c=relaxed/simple;
	bh=EjbdbDnD3IopXMcmkWrh9clCT/CeEiXpaDYGKdNLcUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMSV/HNz9MbYEy4/w8jeXysamYWs9/vxko7OZSl69FQ7LLlL7CfVvTXoCCXervAC384f0J5CqaKeo5LebjLB8jpbN9zfSDuaMh0Wp3+Wgli1Bq9K9ncQavv81B05hfxS+Q/n81yOdQeg9G2AdpsZkJFx1RCAYaQ99d8e6KHTzYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvNoDuzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BFA6C2BCB8;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203197;
	bh=EjbdbDnD3IopXMcmkWrh9clCT/CeEiXpaDYGKdNLcUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JvNoDuzJebNHDHUAVKb+8qesPCo8GZE8j8NX+QPt8+rWxUo8MKnMWQHqU3+ZtVRXl
	 1qrEWwA/i4t/cfE+Ifj6zaHF/LpZ3IjlORQLje8KGYIsBrWUIPHzDJFbcka45kRaYH
	 z8G7BX61ipVqZSNKzSK/w6mQMvoOy3xiz4M1UjpYyPhYh5cknes7eEVeG2gvgA67+Y
	 +zrsMZKmgyUw+lvkOT6xOI7YKQ5Sx4aqkPmDBkhXWD2a707H9WCf7vJYo8o5/Qqhbt
	 LhZklbV+RhRUTn5JZPBBYmXDJTd8M0nJxCrYDtf0uzJO7U/KZRSomzgRJcpSTUZCK2
	 h39gHyi3j7TaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D015D3B7E2;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:13:10 +0200
Subject: [PATCH RESEND v8 18/21] arm64: defconfig: disable deprecated
 MAX96712 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-gmsl2-3_serdes-v8-18-7b8d457e2e04@analog.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
In-Reply-To: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 mitrutzceclan@gmail.com, Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=VF4KSVJI1GCWF1vEPraFbtaDI8K1Hqm1ue911q30Ry4=;
 b=1PI/X+8dtqcjrCDZiCpIp9D0uFO6nMnGCdvnnmKD7qx2fVhf+uUqKLfBFZi0DRseWNm2sDFlq
 Yq/Kg14C9dmBdKoUw/ecK2yrLDBerajHaMeSn8zvyUjSzsjfsENxedz
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..298cc76fe7b6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1319,7 +1319,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.43.0



