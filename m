Return-Path: <linux-gpio+bounces-14426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFE9FFE4E
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25711883958
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E089E1B5336;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGNIlX5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1991B4153;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=mpRIi4Eylbs8bRUbVXaCPSf9mbq2wi9CUQgoekJS7wWeeQCjID3oYJXfLHAfkNVyT/9f+zzisgOKsHmI6Q85A9p1+R50XUPYZcbjKHooOjigCQ50juLnjK+WmIhS6RB7gouq39jL3F+ti+GtRKohI7w9LfgkgRdwnNfx+HdTHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=QivrMCISY/M9jftEcOcP9Vtuv5+lW7TayYL2Dl6/xKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEfVeQblZeX2PJZNg/uPHQho0vAyulwG/3dz56E78GfnZdDS1wV5ghzXMuzQYUx72r/n996bBfDCDr83ydqv5l2sdcBoWGIIaKfScZkxrjBaFqthVHEOdmayC/I6NOGb24v43WbSM7BWLVhSNljs3r93WQkLxacXtdK8EFiWU+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGNIlX5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49296C4CEF8;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=QivrMCISY/M9jftEcOcP9Vtuv5+lW7TayYL2Dl6/xKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DGNIlX5wlhBPP4C1I4SH/xY3eU37ehaVXY6HvbRfNw3N7SklIKwT5KCeOhJN7y076
	 /TzS64bDz/7zRHqy7u1hLqx7y+/Hbd7esAtMYfdV+Yk8i9CaTMgAQsD/9jJtO6dhb/
	 hlihu/opJR5diiXlT8aI68aS6Qh4AE2QlVkEiHNrRtUFZ0/CIOnn4Mu0l/pn42r5LO
	 eqTA6CinKBLAdEOWarCTfRZIS//ZN466IBoifPEgQEHXV14a9uOA3g6sFkJC7BJ+o2
	 PH0K/Qpn8O7v17SFIpJu8qBFXzBzkS9Oxc2yShc5xxFiNlh013UspMzBzcuJVf43Ls
	 qFy5mkoNSODbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B03E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:52 +0100
Subject: [PATCH 11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible
 string fsl,mpc8314-gpio
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=808;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kQbjf8yyMIMYDlp9Ljafq6qH6mq2lFyMb6vI0TaGZAs=;
 b=6WNaCpNbcbNLwRTLw2myVEFq6VrIiHRNr0CdOsGX97lbFkdnQDEHvS2wyUJij1FgVkdkVkiMq
 Uonk+3ZBOeDCWPZf3mcIL66HurU56+XDeg9abRg9o6/0x9Ds3gipzGs
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

This is for the MPC831{4,5}{,E} SoCs.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
index 84fd82291ee4031a55f704977ee0db084caef08a..f1b60ab3f356b99f936d7d8bd5e03f9ffabd0f93 100644
--- a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
@@ -15,6 +15,7 @@ properties:
       - enum:
           - fsl,mpc5121-gpio
           - fsl,mpc5125-gpio
+          - fsl,mpc8314-gpio
           - fsl,mpc8349-gpio
           - fsl,mpc8572-gpio
           - fsl,mpc8610-gpio

-- 
2.45.2



