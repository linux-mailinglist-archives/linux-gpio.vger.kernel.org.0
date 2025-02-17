Return-Path: <linux-gpio+bounces-16134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B26A38424
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8563B56AF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80C521C19F;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxbNDskE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779021B8E0;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797692; cv=none; b=EHN6TQ+TY11jbqh57+djbC+Z3o4M8TEx0KiPspRFNMsOYDBBy04rt0jxfmsU1gH2CeHYnlLkmkgs3PkurRnXhqK4A6pSb8bXiNoSRy3At9k83YwDmV8QUS39zcfFo6BcH2aNEVYzqBO1TzreNk4vK3yDW9BwZZGZ4Yf6C4zKSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797692; c=relaxed/simple;
	bh=BodtHJ757N8P2h1BykC4Mk8zepWOwp559FjBvN7beiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laz5EcM2F1k9zkk8f/PCzajp26ObmBg83CZEFRh3Tox/EJUU/3L7CDE8ZOySvvnkoBtFFgh5OS8t9BA37pvuTrZqSLLHlAHcCfsM4lUmBNQ41nKJjp5pxLirH2d8CnknBDn+KTxsekAJQEwH/gCrQGK8AMYkcyPI1A7RiwkPkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxbNDskE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC53BC4CEE8;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739797692;
	bh=BodtHJ757N8P2h1BykC4Mk8zepWOwp559FjBvN7beiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pxbNDskEbuqE+53ni6AJuIq0kIYzIh4MjrP/m311Kl04vUcO27X87AM9bsdhehkO0
	 uMgxqkJiABV/efCmtUxyPW/Rbf3ZbYMxMnQLALYAFVy+8iJB+AB7kyHBZgiKcLoOQ9
	 Z5S3ndLIPrjBaR8omJ/VT03fHdT6cHrH440q00JrcPRubCpYotXjfRHPgcYMywUjQh
	 PSwmiLAcLLX4Fm5bTB5DIMDhAWP5CBF2i7CMsJAepPlgIlXd1xJP6mRDA2o9lEqU00
	 HuCFLLPDlvxxxOuMCbAr9nE8XNC5YbBHDty1KIdMbX6KwCq8pfkqo+N0uZC3eWk4i0
	 kfxHRbqY0YT8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E28C021AD;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 14:07:52 +0100
Subject: [PATCH 2/2] dt-bindings: gpio: Add support for PCF8574T.
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-gpio-pcf8574t-v1-2-137e140df5fc@gmail.com>
References: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
In-Reply-To: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739797690; l=668;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=B6J4izNH3fp6JISZ2syXUSUwyTFFQEArfTvkcwoUcp4=;
 b=yLBLbSdGcT6u1xG8ikX06I9UIbLWAP3E3AI1PGayeGeSFpL5P9PNIvj/yFxJSFXOVzE7nyU/d
 4Ls+m2twM8GAr6xHtu7zw43GjKDEDNiTOWiXl1ULWXqvRSQzEMZVvxA
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add the necessary documentation for PCF8574T.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
index 3718103e966a..cbe4cf96e942 100644
--- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
+++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
@@ -34,6 +34,7 @@ properties:
       - nxp,pca9675
       - nxp,pcf8574
       - nxp,pcf8574a
+      - nxp,pcf8574t
       - nxp,pcf8575
 
   reg:

-- 
2.34.1



