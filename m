Return-Path: <linux-gpio+bounces-28657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C891C694F1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA33A4E4E2B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DA43328F8;
	Tue, 18 Nov 2025 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EHuSsXBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13830103D;
	Tue, 18 Nov 2025 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467924; cv=none; b=bDTWEZwN4zuTx0pmCxJc03gCTSEXeLDIswEQzoFfTl09Pfr5DSY6A14Ikz/aeqdi1/ZqtR/n2aAjv2/fgHsGK7zIJvGFKEo8Fpz8/y/P/xQhSLNlBKmXeJFr76QsW8kqnPeBK5J/4AOQhHyFiWJWFCE2aqRNLGPBd9PuNLW/+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467924; c=relaxed/simple;
	bh=oF3NBnUTMYZQqrPLtkeu7JVKLmo3Ji3y6mQW/QBg1Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNaLi+3ZidLr9P+szK2dFyC6fL3wXVL0HMBrQP1gVn3y/jgtdvhJDp3uoF9FNJmbiYu2DKuW7XwABnFwI/8m0tbgp1e2TVHOeYL+5BMpouzi3XWZp1X5CsgwY3UvQ/ZSQrBXJT8eqAXBFv4Uvf46wVBtnJ79WWT3mzsIIJRQP9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EHuSsXBa; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 963071094E2;
	Tue, 18 Nov 2025 13:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763467919; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TDmsa/pzlfmaieUPYWrn6Qbx+Sof3bJ81BGiUv9KizU=;
	b=EHuSsXBaYqbBlFshrEIX/pllIptth/KuRlPdft8TVCz0i3e4lnutZf0TJ6nvA01rGKLZjk
	DP3wv4DILSTWsgTRvsc95U3EnmHxOW271ysKFFovnfwoXKzHzCQERM58VClqOGUgt5JE4V
	X6Bs954/oN2qasmhPEey/DgEse/UMOD7ng10HXar9Z7Zi7dzYRdAaJbhWwzaWd+aYJwNZ+
	lJVmY5cuXHBiwcF4PwiUcCuSNIjoP/0f2Utl+RI2IWrVwQ6eTn6qFcJm10HY+hduXu0Qkd
	nHX2SlzUWtFoKQA1QOnyGIvkQPrgNT/NToCf6VaHn6xo/bJqLnNwmOy0avmwLQ==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gary Yang <gary.yang@cixtech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline
Date: Tue, 18 Nov 2025 13:11:24 +0100
Message-ID: <20251118121148.88165-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Fix the following DT schema check warning:

./Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml:68:1: [warning] too many blank lines (2 > 1) (empty-lines)

One newline is enough. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Gary Yang <gary.yang@cixtech.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
index 36977b0d745bd..8ed53496c386f 100644
--- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -65,7 +65,6 @@ patternProperties:
             enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
                     24 ]
 
-
         required:
           - pinmux
 
-- 
2.51.0


