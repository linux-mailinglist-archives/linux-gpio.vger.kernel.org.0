Return-Path: <linux-gpio+bounces-28703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AAC6BBA0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E26EE3667CE
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 21:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C922FDC41;
	Tue, 18 Nov 2025 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUKHMmW+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A02F12C5;
	Tue, 18 Nov 2025 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501676; cv=none; b=VJzjh2t75lZ/YEsRudBluDrPOrR8XOez7z9oiTFGA2cSkBizK0vhHoHw1HEaO7Ey811mJQwYlN+gWGnijUhKqRx2lrUxEYAithPM3azDxiz8HCTTFKyaExCt+HwZW8Z1PEpdvVa5BT/Y3ItCTYehSUJGoyDocTUiJV6jJdiCsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501676; c=relaxed/simple;
	bh=kJ3Ec5x3esk/FIDjU5ZLXWq9nGTqcLYBwozgpnUD/MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tw2SW1yvxkrs0ZzNamuf/aXT7dv/FbFFlw2mDDOTW1Gcrb5kLn/bHpuCE5vWg92OeloGLSxS96UteCIc2k+uHtrFRqP39J4NniNMWJGmOszAoqDxP959nKIUPZkaD7Gjqu7mc2bm7qUEJ/jjMb+0FfZbkzwkLdOxQpURyYvDlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUKHMmW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FA5C2BCB2;
	Tue, 18 Nov 2025 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501676;
	bh=kJ3Ec5x3esk/FIDjU5ZLXWq9nGTqcLYBwozgpnUD/MA=;
	h=From:To:Cc:Subject:Date:From;
	b=SUKHMmW+C5onoNvV/69bxIdxLpL7x0QTkREbzYlPjuaTtkE+EYHKqMY4YeWzfvQsr
	 i3niLzCowRAT8CIg6x9aBhLRwzjJlR6O32aT94OV+dawXy7JEsdPMCpHwZD/iLiMAQ
	 H3VTTkUlPbG6xfDtxfrs2E4+77pilu0aE6yBj927qlTu5JunkBKG5OGCAX6LvRtgAQ
	 Yk1AsKpYbREnOYdKOqmZFe59aQyUxYkMFClnC24olXJQNN5XkP2ZnUpDFGzUmmfy9f
	 WZCwlU7fqUqn2UfLU/grgEFFLMiHCTkHonAEBDeZWMtXshEipaciHtNw4AvjVKPJID
	 HbNFyZ/b4BX7g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: xlnx,versal-pinctrl: Add missing unevaluatedProperties on '^conf' nodes
Date: Tue, 18 Nov 2025 15:34:27 -0600
Message-ID: <20251118213428.36700-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing unevaluatedProperties to disallow extra properties on
the '^conf' nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
index 55ece6a8be5e..81e2164ea98f 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml
@@ -74,6 +74,7 @@ patternProperties:
 
       '^conf':
         type: object
+        unevaluatedProperties: false
         description:
           Pinctrl node's client devices use subnodes for pin configurations,
           which in turn use the standard properties below.
-- 
2.51.0


