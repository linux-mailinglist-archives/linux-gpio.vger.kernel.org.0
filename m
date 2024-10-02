Return-Path: <linux-gpio+bounces-10755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2398E6D9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A00AE283A75
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0471019F12D;
	Wed,  2 Oct 2024 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="oWqv+tb+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3519E990;
	Wed,  2 Oct 2024 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911780; cv=none; b=F0xz0cQsFblEXjO6pupdEUxJ+qUv6vQik7WYnwbaRhoDKEQzeT6a6kF1Rak1ii+m5xbTDQzOOpdj9OQrF5SXOusqfOJkMUUJAOoUXCS29PA4uwEivvzvTcqeHP3kc6rO5pN4G5a0rSiH55giRt7WOyeXZLMg4Zz/OkNJ4vYanMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911780; c=relaxed/simple;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDjEyBHBciYeeSBsvquo9CFHy2U6RHJg90yAC6A2qTDhcX89sZUocbLtIFh/syStWpVEgIxnMVSToV60MH/gd/W9e2KtFZ2PXQJuNcM9fNyNSFbIPBoddY3xhRnyX3E/Tq+MOPr7Wefg26DzJU5zH6Lzn/Fp7BWk5ZKnnE7nVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=oWqv+tb+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3A23F23DC9;
	Thu,  3 Oct 2024 01:29:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a5JiFpjWvMb; Thu,  3 Oct 2024 01:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727911775;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oWqv+tb+lgTNU1Q0Ps+DRaVNGJI+S6TqaWe+tOJxtb3iHZSlsI1nyuKDYB998owzu
	 mmMtv6T33a1sOE079iLdUEK9esH0iEbNhkjUOjdUIVPuG5Qp4Rc9jGRqGLdH/WQLyd
	 4sgn9G05M2LIlAlBnx+tB9+95I5zpfqYUqy+9bg7Ju3gE8dbJyW4i8WHBohboXewNh
	 rrJQ7S7ueReCO4D6Bm4XtgLrR/F3Wh+JmVpGGyzDihgMgvlR3iWdy/16y7Xn4D8guc
	 KAPA4Gvqf3ojsj/wht+aunLoudsDtZtkaICTakLd1hdUBxVaL0Opq14EhK7CWYfucR
	 gdJ8gXLYp7r9w==
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
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Thu,  3 Oct 2024 07:28:00 +0800
Message-ID: <20241002232804.3867-2-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document linksys,jamaica for Linksys EA9350 V3.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
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


