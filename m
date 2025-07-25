Return-Path: <linux-gpio+bounces-23822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58568B120CD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F04B3B0F50
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF1E2EE619;
	Fri, 25 Jul 2025 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B7RIOhyf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7EE17A2F6;
	Fri, 25 Jul 2025 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457192; cv=none; b=Ix24nuQCl8DJh/2spzQpfISAQjA7TcHhb+aRSrwG3d6lj4eGxYauDiv3BzESYQOjgDKz68FbW2oR1bNE/AuO/gTPEq6jcAEPP6kzNpE2oN1zZj5ndWXZpyELNkh1IHHtWd9RW9jFSlz//F9P12OrpAMUUTMNpy5vridHIgz1FSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457192; c=relaxed/simple;
	bh=meYnIjzl7nC328j1X7tKnCKfhvXyG4iKQmvYUD7Wme0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JceOQZDYxRtarOnTcTPQtNZqraqWBNRh1bz9dNh+5XQHuSW24XyZrUipLlnM9aIIxJ540ZSY9aPcBCEHJa9XU3vcDGDGrgv6VgrJPN+ICUQKYe6oucAv76aCjEDZK39l9cv0ioHsv1igq6oR9vKdeEeH81Gx3vnYY/WgCwkkBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B7RIOhyf; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id A0694441FE;
	Fri, 25 Jul 2025 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Was7fZ97bXuHBZTu5UyDFMzUodkIqUeVg40SMOF2Ny4=;
	b=B7RIOhyfKWdG6nGm9LJf/UyPgsBN5xz16on62ycbB0BEzLNz8VqUszbnumGHVrPSZw3V1/
	P/BpX9X8WazzWYbwLrYogSJ3/z+aE357CM7hiUftgK7/TUHxhTTdQrus8389NTo4651Q7u
	84s0q85qU3pRaVhTuE15WxQUJ+K0pVtVc6eXGh1Hsv8YuKJ1P6VO8v+xe2HHM9XHr01MjG
	LXqy5MkTTen506ZWXh1HUXR1S1V+Xo14evdIr52NItHo+dcy83Y0Fy7vDibukqS4qlsNoh
	8+HtXe1S0UJW+wcAwhwu5gAhj7xIesv5TW7RMiEixCo1AU/Gkx+oEd6VjKsZCQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/6] dt-bindings: gpio: snps,dw-apb: Add support for Renesas RZ/N1
Date: Fri, 25 Jul 2025 17:26:10 +0200
Message-ID: <20250725152618.32886-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

The RZ/N1 SoCs uses the Synopsys DesignWare IP to handle GPIO blocks.

Add RZ/N1 SoC and family compatible strings.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index ab2afc0e4153..ceb71b5ac688 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -20,7 +20,13 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: snps,dw-apb-gpio
+    oneOf:
+      - const: snps,dw-apb-gpio
+      - items:
+          - enum:
+              - renesas,r9a06g032-gpio
+          - const: renesas,rzn1-gpio
+          - const: snps,dw-apb-gpio
 
   "#address-cells":
     const: 1
-- 
2.50.1


