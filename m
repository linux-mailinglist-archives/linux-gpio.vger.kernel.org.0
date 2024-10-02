Return-Path: <linux-gpio+bounces-10728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF598DF07
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 465DAB2B3B8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA801D0E1B;
	Wed,  2 Oct 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="EZ1bd3+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79611D079B;
	Wed,  2 Oct 2024 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882756; cv=none; b=rOixJGvMOLq4w6NDRySJmuhAh77HQUGndV1wdkxGxZBc3+Nz/XjKR/RzBdttJvEOuDQvhQ4AzowVjBuwz+huq7uja0uK7/hnunsezvuPx/sgQJ00Wi57a8DFSB8ZwMhDDIa+/sGryrLxq4XaYMR22wsfyUjZDiBVFvAyGsrlt98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882756; c=relaxed/simple;
	bh=/ksrsem4yrZgkxO/BU14EtvhqZBfYeLI1LRypRJU+2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4cVghc+qyB1+Ttb41ZFYB/EISBVV/eustch0Iz5Y692oevnJF2kBgZI5xE9cSrvQlRILha74Xn/51kSx+Lte8mIgQ6ONlIuUgEUcA787yt5hzJbclRvhET3yKYyFCrJLfUcmfy438hIWHkmO6ZsTqgdsMfFvWSGzsDCJLQ76mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=EZ1bd3+g; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E57F923CFC;
	Wed,  2 Oct 2024 17:25:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpMuBsTKsd5Y; Wed,  2 Oct 2024 17:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882752;
	bh=/ksrsem4yrZgkxO/BU14EtvhqZBfYeLI1LRypRJU+2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EZ1bd3+gz3/2f7RM/51yPLVUiUdQ4zR+IkO0EMhlqYr9QX1qxyJhwhUh2I+ev503E
	 CfyqCRsqeuqrKvoCX3YRbW+m/BtL48XFWs0wI9N6H+mKdErj942EJS9jhZdOC+rTqX
	 eMCQpkeyYpMXeq+mmF2gOtL7c3L5Nzhqq0VJWYjau6O5egSa5YCKpFte4hyFEOgImT
	 pNraPIq4fYeX4nYtuTpF++IKDHkX/X4ZFyI/UC8WSF2XDt9PFq1CS/8RlvWU5ymKpW
	 QP5OxMg4KMIOZeuxg46tqtlQMW/PvOX2uMpjTrjaVB0qU0rCqlH0O4htXNpgBBLbs+
	 +znXaaYw9bxiQ==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Wed,  2 Oct 2024 23:24:15 +0800
Message-ID: <20241002152419.30364-2-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
References: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document linksys,jamaica for Linksys EA9350 V3.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..98dc4819a5a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -338,6 +338,7 @@ properties:
 
       - items:
           - enum:
+              - linksys,jamaica
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
-- 
2.46.1


