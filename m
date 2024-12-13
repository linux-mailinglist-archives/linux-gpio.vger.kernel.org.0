Return-Path: <linux-gpio+bounces-13871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6999F13B3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAF1C283C71
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF5A1E5711;
	Fri, 13 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTqw1Rvi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9118A6AF;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111176; cv=none; b=uyo3BrGg8MrB+ONMqnhC/ehhOogS/G+xunOMsqx2K+TVndfos2PEvTV9vfT7yPaxAB1/QcN3eqYN5sJUX8cRcnsfn3RxxXjyi9F4l/VXswNIkhFPJTpUhUJzCi/DCIwqRhdmtNRzRjoj87rBIgum9iaNysEoqYxsrYP/PKfy8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111176; c=relaxed/simple;
	bh=GvOmLTFEkM5iuaNjmFU/JhBuR+FiDXXVEqd/0xeOTh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alMMLbtaAk4fNK+uoh9vYdT6a6dZJFlFhmPJDQoTLunqKGZkPLQEy0eTNqqt4OccdBCepZYgJWMM5O4o8g9Jb1h54hAwEnaDQ3l2JH0Fk+hCnOP+jpQySK4cHxxwn8vGRUFDFehZXnXiLIMe+qeWpNMRRxZNcp0BjTKCj3ie43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTqw1Rvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519BAC4CED6;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111176;
	bh=GvOmLTFEkM5iuaNjmFU/JhBuR+FiDXXVEqd/0xeOTh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JTqw1Rvin0ipCdUiZug8a88SZB4djhx8GXDDuANDxY7Xv52Na4tqmCtf3Yyb/HuCI
	 xJ64S5/3Sd2RDV/sJcgWWjz2ONlVe2l9afYpkR6w9a47NyABgLAYG5NYcpnLEQUh2W
	 Zqjr4UNYCOHYLAkQXYoLCZFezf5KqWS66L9A1xGMGknAzyQWF0ayGIKnwuDqkFg+mR
	 Y79H0uQBXc4DgPF0Z/w6B18nCFlpVdeX8kNQ64bxEs1TfQ1MNGP+dYClB4f+HB1QP9
	 mLNXotI4gAuM6RgGI683W03KqDCVBSB9tLA7gwQoKih+N6Vbfj3kpW5xjHImptCMtT
	 sqCmkXeeCgKfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42104E77183;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Dec 2024 18:32:47 +0100
Subject: [PATCH 1/4] dt-bindings: gpio: fairchild,74hc595: Add On Semi
 MC74HC595A compat
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241213-gpio74-v1-1-fa2c089caf41@posteo.net>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734111175; l=839;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qxi7ezuDAqwzYk6ajkrcBy3FpR6YWEwtHIQ7XHElelQ=;
 b=hW6LL0mzoKrCGQcv9Jg8Mict776E/boeDHjzroqPMbulfsQw2jXCecr2t8NRT280JUHEpG0b0
 SLdwnLo7s+RDxoBgnPCHNnV/mgqWp5WsnDVSYzqB0u9zWmRjBJx1Mjp
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The On Semi MC74HC595A/MC74HCT595A is another part that is compatible with
the Fairchild MM74HC595. This patch adds it to the DT binding.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
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



