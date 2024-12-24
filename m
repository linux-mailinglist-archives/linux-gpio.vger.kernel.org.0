Return-Path: <linux-gpio+bounces-14189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA19FBA60
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 09:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D62165C05
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2A5190486;
	Tue, 24 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbBt3anw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E391632DF;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735027365; cv=none; b=R1mjfS5PmQrw6TK6Fqa+pG3n06TCYT4xjw/C3Hzpm9TT107O2/Tn/HIaecQZLcFrIN3JmHfm/WnyXcScrpcYYSLwFTwtTkmUhqsuBAnUKDcjCmSFeXoG+/tNihR6L/DJ4a591WEPDlImDY7vAXvZ+SsMFmGb0snjPiclTBT95vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735027365; c=relaxed/simple;
	bh=m5JD8DDlIqNcrMZvybpzxJ8IuLTC/ikDf/lWWsqO4yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTQk9Aj+dTZ/T6hcF9O+Z98osHxS3klub7uOs+iTphPCwiMqQ5Y98UX0Ln9z8C0zksGT/DlFJ9fdn4afale2dy+S7E3UxkeerJnOKPysNlBMTsPpeJ1qdhkk+MsfdENTIxZP6RxgR+llz7AFGgSE1jFKBQkjSlxqnQR5A1eGrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbBt3anw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DA64C4CED6;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735027365;
	bh=m5JD8DDlIqNcrMZvybpzxJ8IuLTC/ikDf/lWWsqO4yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VbBt3anwy3+9GWgfoZXvEPGD2BlznLiJhIuZg1i4UMLc1aXGJBgj8hhwiAUtbKuDk
	 CQggFYqINedRnbY0G8f2dg5O4fuVnUA47obUKC/9BF9lEmdti3fgvR61QH+tq2EAy2
	 plB+vYvHUiAbI9QTFIkbYo5xPYHRanFsT1lXvj5Nboij+dvgmvTLkO12d6ucmA6npF
	 FoMyqRE2JIyOAUZ4jfJk3LJnTPd2XbEEqMN/TVAk773kZUGF21M62sk7dDHru7KRLt
	 cgGvCa/itCdvaIfBOKbxErKllvMDCXVW4zj/WTY5DxSxRIuTnO6S5Y5zCvQT6dfvgz
	 sN3AjSEIDdOZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C03FE7718D;
	Tue, 24 Dec 2024 08:02:45 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 24 Dec 2024 09:02:10 +0100
Subject: [PATCH v2 1/3] dt-bindings: gpio: fairchild,74hc595: Add On Semi
 MC74HC595A compat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241224-gpio74-v2-1-bbcf14183191@posteo.net>
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
In-Reply-To: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735027364; l=933;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kRxTSu1HdOpqsgiZAHK+n4V47vBOIKc1nzOE3XdI/dA=;
 b=yqL44Q6TJ4G9EcqnUgbmginIfmf+4LeMNfv+Fw1xgQqj4U/YFrLA6FYWf9Cbe1AQhg9rOMehn
 YqfcExlmyeTAsLTrWtGK8zcFValDvLM087LAike133vNxSbe+egbxxm
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The On Semi MC74HC595A/MC74HCT595A is another part that is compatible with
the Fairchild MM74HC595. This patch adds it to the DT binding.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

v2:
- Add Linus Walleij's R-b
---
 Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index e8bc9f018edb1253d700945f006e19598efb299a..629cf9b2ab8e4a63fbe17f56792a46d2066d40c3 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - fairchild,74hc595
       - nxp,74lvc594
+      - onnn,74hc595a
 
   reg:
     maxItems: 1

-- 
2.45.2



