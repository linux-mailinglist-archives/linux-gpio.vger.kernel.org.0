Return-Path: <linux-gpio+bounces-14427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47E9FFE4A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08C4161EC2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFD51B4F3E;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4LV9qV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F21B4155;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=l+JwKfRzokjz+iFsea4ugo3pRyTEWjh/KZp9Jl90pDxvkBHcNIn2DR/yUeQ+2pR6jwchjcgxumN22MBYDe1dZACTv0vwUppwSk4LuW1i1GO87KiY2LL7wqQfdwV9seNiyLxoS/0gIvcn+FeL6Mv/4t+Fq9r+rD+S0C3qSsjB374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=cRbD1xOLj/k5kb2AcJlWgFePDr45LI87NCwjMv+jncI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAQHeT7ye3XraBAZRpzYWUKm9pzv/TqtIstqMEkpluT8BhwEtnDFszOhq187B6sKpgf5WOom4XjJ4IL9IWPsDf4VsokT85H3QPMlexODYVYxb8TImWtMPqJyqY+IBfSiuVc2EH1xO4p/0C11Ou0h4MhlzB2bzoNzvGH5o8FZkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4LV9qV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E70DC4CEF4;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=cRbD1xOLj/k5kb2AcJlWgFePDr45LI87NCwjMv+jncI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r4LV9qV8BN450Yak6/1181aMEw4ByjaEBmzgubOGJUNpvXdFEdjL3YfSiYg3qbgEf
	 IYqqBxGCimTDMEsFWOcUnJUu1OjQ3fKqbh5kYYj5b2dJFqAK/zosFUW0DwJ/l1ikEP
	 NUW6SDmVq81Am1NIBTfeF68qsWMqzYNqvbzCM6USL1ueRdriFR/YAbTevr0MqdYPRf
	 nLHg7ItmBJUvyfXKkTuMQgzNjnoo971qaMlqB66g3L0iaUTxct7Y3M+KK2Jn9uWS8o
	 Bd4EgNMIVzI4+VIAmNG8CeAZUXe9Je4VqUXa2DJR+xWk7XMFq9iVm3YWWzD+UX0V59
	 x7IqLqHAyLhvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B1EE77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:51 +0100
Subject: [PATCH 10/19] powerpc: dts: Add MPC8314E devicetree
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-10-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=700;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=iJjsNtyNoaNU2zY47Wv9zZ+eAHSNUrFXjwgqJp3n0GM=;
 b=/hziTWMuTlV1P/hE3RO9qdSuDxn2Tgq0iTXT9NLI1DfKaJCijj1zAtFX2/zROAJn+CSjfQIeV
 aVmXNG9Z377Bcy1AgtoBVBdsz5VRDJOAmy4W6DgRCvAQXW3mczS1ogD
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The MPC8314E is a variant of the MPC8315E without SATA controllers.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/boot/dts/mpc8314e.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/boot/dts/mpc8314e.dtsi b/arch/powerpc/boot/dts/mpc8314e.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..65a96a485dded5d4918d96b38778399d2f348190
--- /dev/null
+++ b/arch/powerpc/boot/dts/mpc8314e.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2024 J. Neuschäfer
+#include "mpc8315e.dtsi"
+
+/* MPC8314E does not support SATA */
+/delete-node/ &sata0;
+/delete-node/ &sata1;

-- 
2.45.2



