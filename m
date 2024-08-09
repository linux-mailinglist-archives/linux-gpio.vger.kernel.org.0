Return-Path: <linux-gpio+bounces-8691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A994D3EF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 17:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E68D280CDE
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 15:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69781990AA;
	Fri,  9 Aug 2024 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QCAzmdq4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0E198A2F;
	Fri,  9 Aug 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723218430; cv=none; b=KXf1So4ZiDCOQHtV6o9Sme6PBeX0Oe/1a02rEvZbgvijWW7wh2//j0U8t1WV63KGIz0WC8/Xi0wAVFcBlBK6NHj6Wjw7KEE65w2B95zFH23fyX3bcus7fKdIlJeprIi8yeskqPIIK4+NJXOGi3Gyb47Zslf7yyPtRDF4tNqSgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723218430; c=relaxed/simple;
	bh=/6eFR07vRmXSBKu6vtd9hqaw2+ponu2foN23xSw8iCc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5hsgzRIngqwslx/AIjLGGPLg9/BKgMN/Elavw0oVubnk2dQAWu0uSehlDdXL4kQLqg5m65cLubA3DPdWqnlwHIdQWe9HGY740kyS5HvytT53cYn7hosA8p0EfYGpus+3JHYXXbfCfgyNEXtNDCSmZOZCRFkT52THoSt5tNjIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QCAzmdq4; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 479FkqDd013121;
	Fri, 9 Aug 2024 10:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723218412;
	bh=CgDTPQTNHq29hCNM0dCX1gxjH32pApkrHsZTDCra1mo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QCAzmdq4y+C50Id0D2lnBHj4S1+HPGxloJNohmowoZSv4zA6GHCmMlqZkncQ6eDt/
	 m8fSxEhlvk2EMGtCTV6OkGth59gciE2coW9w+BJHHxlZFnYCsHx5iheK56nibagJ2C
	 OLT6jr5A30VB4BL3yGKY+adT2+CPYAs+PFvCWSv4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 479FkqM7111724
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Aug 2024 10:46:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Aug 2024 10:46:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Aug 2024 10:46:52 -0500
Received: from localhost (uda0499903.dhcp.ti.com [128.247.81.191])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 479Fkq4f068990;
	Fri, 9 Aug 2024 10:46:52 -0500
From: Jared McArthur <j-mcarthur@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, Keerthy
	<j-keerthy@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Jared
 McArthur <j-mcarthur@ti.com>
Subject: [PATCH 1/1] dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property
Date: Fri, 9 Aug 2024 10:46:38 -0500
Message-ID: <20240809154638.394091-2-j-mcarthur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809154638.394091-1-j-mcarthur@ti.com>
References: <20240809154638.394091-1-j-mcarthur@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Current definition of the davinci gpio controller doesn't include the
gpio-reserved-ranges property. Add the gpio-reserved-ranges property
so it can be used within device tree files.

Will prevent users from trying to access gpios that don't exist.

Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
index 10e56cf306db..1434d08f8b74 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
@@ -32,6 +32,8 @@ properties:
 
   gpio-ranges: true
 
+  gpio-reserved-ranges: true
+
   gpio-line-names:
     description: strings describing the names of each gpio line.
     minItems: 1
-- 
2.34.1


