Return-Path: <linux-gpio+bounces-8692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB6E94D3F2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 17:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D0CA1C20D48
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F4198A2F;
	Fri,  9 Aug 2024 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gwi3kjUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB54198842;
	Fri,  9 Aug 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723218436; cv=none; b=bsQZnSVDtY2zLZ1/+4uVJAKg3o6pbcYxJvqYcieKD0Nq/EGx7wyOU+vdiatRft1mVWUDFk4amp2OyT99Bj/uIsW8nN1qD7kU8XUyR+xHzCdQEtRXMZH91UXCBMOa0nXNA4ajzvZK+jLMaUC61syZLdYTLpdhxGPoJrdjYsesmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723218436; c=relaxed/simple;
	bh=eH+L9/wHm5CFYI7OhmmVQjIZbhRJIWPCb4bTeiWi1sk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HFwfW9yLjxV0oL6o8IdQbgg0K6aypWa6m9ka4b25cf5r1VKLgOEhfSnedAfLLlBqLeHdWrH0QbkYQuMbdkPbeyIIloig+BZM95V+zEQb2/wq+bceooa/ejSEpavxzrWykMEEjbgeNBLzes35UTXuymNoz1BCRg80Zixt6xes0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gwi3kjUK; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 479FkqaM037705;
	Fri, 9 Aug 2024 10:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723218412;
	bh=iZY5s6omfe6WhbDkhJ9bML2+QpZyvW4JgRzEQl+vTVw=;
	h=From:To:CC:Subject:Date;
	b=Gwi3kjUKulWFmGGKJTfvTSx3D/XHhlsEQulu4edqar2umNSc82q6+AK9Bt0qismqq
	 H3ZRLq0Nf0Vm50LrLy0Ty5vzO0C0oPtpoCSXm2vQaccmRruh1LaWGbhY/tROVjZFFT
	 NNtL4Zj6d0jsl2TRWIsWYgJSaSjo+dTPSUxQVUWU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 479FkqSC111721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Aug 2024 10:46:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Aug 2024 10:46:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Aug 2024 10:46:52 -0500
Received: from localhost (uda0499903.dhcp.ti.com [128.247.81.191])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 479FkqNB068987;
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
Subject: [PATCH 0/1] dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property
Date: Fri, 9 Aug 2024 10:46:37 -0500
Message-ID: <20240809154638.394091-1-j-mcarthur@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi,

This patch adds the gpio-reserved-ranges property to
gpio-davinci.yaml. This allows davinci gpio controllers (compatible
fields: "ti,keystone-gpio", "ti,am654-gpio", and "ti,dm6441-gpio") to
use the gpio-reserved-ranges property.

This property will prevent users from trying to access gpios that
don't exist.

Best,
Jared

Jared McArthur (1):
  dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property

 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


