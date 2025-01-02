Return-Path: <linux-gpio+bounces-14431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1A9FFE55
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7861883375
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D21B6CF8;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvMfwT+n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C41B425A;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842742; cv=none; b=O8T7Hil5miPJxlULUG8t0iA+lJgPcRHr02mmFv/2D4g321oG+CTxr25owlQ83t0qiEyn782rwr47iQOBvpPvs9EEwLI4q/e6zdW5Agf05Rg93HInjrq9Dr6Iild9JyZ2X0jpNxHaVK+dgDANOPPVJSwg9Wh0t2qX8acSF7t1D6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842742; c=relaxed/simple;
	bh=y03cb4wbkJsgpcDVgkqHzQqW3P9VgCOSpkaGH+61Xxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5zsCIa4Z1zvxCNFptVt0XnMu1FXH0wVNVxu869wYsdCp63x/v6/8JfqPZNeBEg8mMKeW/mQWxFQvfY0/wK4zZB48ezQn1P6VcC8hlzEJq7YwayCrYjkVCiX3qVUwYIIEHuhshcn70y4JVaP1lk6QBoU1VgXk3Nrt5zGYmMA4B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvMfwT+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 953A3C116D0;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=y03cb4wbkJsgpcDVgkqHzQqW3P9VgCOSpkaGH+61Xxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YvMfwT+nmj/dnRXngQckHyNSh8yyr59T2fYo/VD+8afSbt2xyU92NpgdgW3RpZeIC
	 CsTl/o0DbdL3itGJvqN5pQwb3TtU1Cd5VGVa9JVPApalHnDYUbItVqTHCdG4MdFc2k
	 FlNQfZ8f/K56fYntIfuLnat7vq4HgOk21GNyJwVjjrvGabZY617VyVVkiISpQgPq6u
	 AvegsM+tH/HncnPppAdoUrkTmV910rIqKpAxCy2wvhMtCTMJrhGKIEadlZ+vX7GjWs
	 UkRawZn3RI4cPxGwuPdrkbHE/qxvhxxoNbX2MEi2rKKvtsaYDmCvMjBDMTppw7Oqe8
	 8cSkCzMh/NCMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACA1E77197;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:56 +0100
Subject: [PATCH 15/19] dt-bindings: vendor-prefixes: Add LANCOM Systems
 GmbH
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=888;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cPDycNl9By3Hm5+1t2n1h/bJeTOlBcJ2oe1IgSAfN6U=;
 b=JRK8A4LytpWFYp4wFnkZVdi329GFgJOOHAqqi81i/HoTMERuo7v01lvfwpwuGoeDe15XGIdFE
 kebxru9TD1CBOOAasWFhF3rU6HfzY4Rac07KuLWFyVyBs2GeaUMP2bo
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

LANCOM Systems is a manufacturer of networking equipment.

  https://www.lancom-systems.com/

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..56d88162b184e45d6b05fc749d77ca952a5eb2e2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -812,6 +812,8 @@ patternProperties:
     description: Laird PLC
   "^lamobo,.*":
     description: Ketai Huajie Technology Co., Ltd.
+  "^lancom,.*":
+    description: LANCOM Systems GmbH
   "^lantiq,.*":
     description: Lantiq Semiconductor
   "^lattice,.*":

-- 
2.45.2



