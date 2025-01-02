Return-Path: <linux-gpio+bounces-14423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4D9FFE43
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B29E3A2158
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2EB1B4F09;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXYNMcH2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7EC1B4134;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=kdJxm8F9ACR+BvnxD7B5yovGUr/9lDeOEdKVM8UBO4Wyycc59jbNZP7ZwRwIgkjZw9E66Gwx43oCjnM+lzRQD7VSYxWlkURnYhKgZQ3np7XbMKJlQeO51+kyPyIO1Pu0vb54ToCm6fJ8R0y1FYSXxlnGRkqCEwjGESNGmSnxdz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=3IuI6Je6+KzTU4VEUrEMJiz+nfBZ75oArtG+0/qEXpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oobj17p8LV7gnugZCYryaxt7uA2JE6jvdGKv0jQv7vQT5SP57s2B8k4HKE87xlV4l3GP5lK5kaDaz/EmoJKKwNyhrn/ZqzEb6vpV43nS/vnQu1L6gDcAJjvds3N0dU8YkETseXYxv6p+5rD97bl9g4DEcAKiWkOZiI/qwm0m4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXYNMcH2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B13C4CEEC;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=3IuI6Je6+KzTU4VEUrEMJiz+nfBZ75oArtG+0/qEXpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LXYNMcH2allQiI3peCetZ4GsFekCTANyRFHBpDj4gD/wP5L2UBgCxVouf+dvwVwFK
	 Lmtj+9rIB8fuHM+lRsYN1INHzDOVB+fmfxZcFNkO8raJiLiDTRhdPvV1XYiaKBOO2n
	 xHzdvmQp9ocz552Non0szpI3wV7pR6LWJ92UHV+YQtScbxVo+s5fYrE9YrzA+Z9PNO
	 y+IPPl32S5mAO43ye4BK+8F9kFiS0AtmssDThBHndMfHEMGdgWjAG4kMUKjtgLugS5
	 uvkI3lgVmfNN1xTZozacRTl958aY3SX4HyfAJ4kskJFNvkP3yuggyDxf1+w0s1Mlpz
	 Su7x37siyUeUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B36E77197;
	Thu,  2 Jan 2025 18:32:21 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:48 +0100
Subject: [PATCH 07/19] powerpc: dts: mpc8315erdb: Add missing model
 property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-7-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=689;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=i2m+p125oOMi3j6Rp3j8r0hNlqhm4mTOC27OluxVi5k=;
 b=jz8B5ynuEhfVPpf7QliuUWYwuGE/+fLv6S4QEVZTSRKh9vuo7oKhx4K5ZB/3HV0XhXRxx4tyP
 owTd0RUdADtB3j8aGvSMkGCN+0FQkHxUZK5mCetV0Jkq/2JyV31JdqG
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The mpc8315erdb devicetree did thus far not have a /model property, even
though it is required by the devicetree specification.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8315erdb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/dts/mpc8315erdb.dts b/arch/powerpc/boot/dts/mpc8315erdb.dts
index 28c06faf8ce0eb330a0108eba321b4c1127a8ae2..44e82d8b26302b72676badd70c5ab26eba3d08e4 100644
--- a/arch/powerpc/boot/dts/mpc8315erdb.dts
+++ b/arch/powerpc/boot/dts/mpc8315erdb.dts
@@ -9,6 +9,7 @@
 
 / {
 	compatible = "fsl,mpc8315erdb";
+	model = "MPC8315E-RDB";
 
 	aliases {
 		ethernet0 = &enet0;

-- 
2.45.2



