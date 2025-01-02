Return-Path: <linux-gpio+bounces-14424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F269FFE42
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE2318837B3
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAF91B4F08;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHFVUiOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F41B4121;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=gEs1rEPNv9Rq5+O2z0wnWEE2VqCupcCpGqCZv8nlfd7mA6WIQKAtHRjRuFX6JUnXR2Pc0iITKT6M3mIB6BIf9od4uOj5obEmN5AEXZcW1L2mODqfJmL1eQ0TQoVUf3jHDi8asDASVTS100VrKednOPXHQ+AR/F1exufY2Q1mFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=yfwmhYwiUSm9JlLr+hh+O0Bt/U2vgFRgg3zxSAIQS9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/c8fHLa8DiYQS7DRuHhjyTbu/l9PEweM49qxkInIqLWVrxhkzCcGGuS9UZ2Ld5lQSR5FvXbj40usWMZtiNeyJHNUlFvR8KH8WGvjvhAqAUO0KNetLt790sqe+CdHSddbbo344cI3I4e/Uj0kWqrj+1njr9F+5zribXBBFQyhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHFVUiOZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA86C4CEF3;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=yfwmhYwiUSm9JlLr+hh+O0Bt/U2vgFRgg3zxSAIQS9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZHFVUiOZiYkzaQGtgHJr+NXmNv1sffFV7GHI16jLrGBqZ5qcRfVZwGTDEPXATAQRH
	 1H6be+UlJgs9mhvKJZeiAebyFVbZPMu5ZGuI1HLiGyObGaz59vlovSAoPiM4vaFqqp
	 z9XmSGKxj+9FtbqITxq3vx/SRSHrLU7ejKmiUQe93VY/x9xM/CoTZQxuKIcptf9KwZ
	 zlimeCR9a1cD4iCFWltYUX+ZB6SsmqPopuJ5wR47FnL/kNhx/QxkVWalLWizfzWM3g
	 3MMPM+CFMpDq8w2jdMqaD3dvWijBGChUZE24W3AjLnyRNhFaBKSePuOJYCweCJDC7T
	 tvAOxuX1uagOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25334E7718B;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:50 +0100
Subject: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=893;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=XjJyRLNOBRP8dGxJA13fx4b2smChJ2cfKB3451J6wqs=;
 b=gmnc4iytyw/+dvM1kg+2tdYLt8bjZsFxnmFDZtWUSklxe3fMmDu7KXGlPW8DD6cw1T4smCFzT
 mLXZOMO1dRiCkO80JYXYkXfSTVloW/oUetQpX+gD5lCg5yh6cqAzjFz
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

In order to produce useful FIT images, the kernel needs to know which
devicetrees to build. To that end, follow the same approach as other
architectures, and enable devicetrees per platform.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

I've only enabled MPC831x devicetrees, because that's the hardware I have.
---
 arch/powerpc/boot/dts/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -3,3 +3,8 @@
 subdir-y += fsl
 
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
+
+dtb-$(CONFIG_MPC831x) += \
+	kmeter1.dtb \
+	mpc8313erdb.dtb \
+	mpc8315erdb.dtb

-- 
2.45.2



