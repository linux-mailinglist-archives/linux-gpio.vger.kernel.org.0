Return-Path: <linux-gpio+bounces-28513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BFC5DB12
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 15:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2065D241A3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9578132BF43;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWJ3rmxF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6131329C56;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131911; cv=none; b=nbJFMibIqgLs2Xxg9bj7GLXUutPxe3hGq7VR1ZekEanrv9a45+WPdB45Q5uZq5nbDZuqCE4Y2Jc0qQ87JEpouz5VsE+Rv1iXvhGeW8oLS9ftcNrsOkNcAMjbmKvMUx35S9IrWg9nSi+LM1z14Ixf69Efz3L5Z8YetmEcz6abFL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131911; c=relaxed/simple;
	bh=EjbdbDnD3IopXMcmkWrh9clCT/CeEiXpaDYGKdNLcUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dtclmz558koSeNzL1BfFPuu7xQwJkMsMa3jn3Z0/DrcniCr3vXNKvw16IfBSJlInyiuAcTuv30rvtaVnNMzSa4uow1vgJYNXcznP0q+r+g7qwwkgH6vB6F27fHt2vegman+VOeSA8mQPEp8EPMwnSFzYHq/rvYAZlzwYQp1E8+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWJ3rmxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C882BC116B1;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131910;
	bh=EjbdbDnD3IopXMcmkWrh9clCT/CeEiXpaDYGKdNLcUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WWJ3rmxFzlTkNTFt12NBdVV6HEBnTm4RdBDwUSZDFh95vcDqdSxn2iZ7STMw0zVRX
	 U5AhBWyGx4qsaqn2xjCOOpVI82gd/77We+elvjdIUgUgD9XiLYgw9VMGIw1hBuG4GA
	 cMhM9/08T67cgnPlExkIX/ZEHybiUKMFSXnvE/Y35Fi9gbSw1eCsgjiisJ19C2gG1r
	 +WohuS7jUqpvTaQC3Uj2Oek2YKYc4ZJV36rmiDPXCepHcO5yrQlp9AoYD1jSaRN2Iz
	 l8K93utdG3XgHx4kZ9G9klh/WwswmdZiBdZ8yJlbnkG6VLKEusKtg0ZFazMmMB7JLS
	 yTcew9PbwBDUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C274ACE7B1B;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:51:58 +0200
Subject: [PATCH v8 18/21] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-18-47499d907990@analog.com>
References: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
In-Reply-To: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=VF4KSVJI1GCWF1vEPraFbtaDI8K1Hqm1ue911q30Ry4=;
 b=I3hrqQh88HtJdgJh7YtFufUC74pJ76fjE+VyiMLOrKi4iVdmfsKcc8BmJ4VlgcSUGSO5FB6ux
 Ob+1yLW/9r/AmXjKgU0sXgu5e5PYVtXX1elwYvf/FJQyWBgUAs5QaN0
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



