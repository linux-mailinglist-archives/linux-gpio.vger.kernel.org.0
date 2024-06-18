Return-Path: <linux-gpio+bounces-7550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8590D9E2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 18:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F8728A238
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 16:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FDC13C8F0;
	Tue, 18 Jun 2024 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="peWq96JO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792813C683;
	Tue, 18 Jun 2024 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729488; cv=none; b=jEJDp6s3PoDNajXcDS9raA/XuQ4YzA1Vf74pcQS8G5tjZa6uwaa633IYQ9qYvXPRLT0VTIRax0IzLKo20iIoAf2xHfhrFNBKSE0E6yGDOzLuaumTFLtgI6yVXgdny5ikSs0dcKI+i0LfRyx5netffXDqv7wyO2Ms41+MgsRNNbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729488; c=relaxed/simple;
	bh=N7GfkgAKpubybyIPqNrNcWjaVoJe0OB6dqcWUjT03NI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b/wCcD9NfJavh6dHAyj5qdTKDQ3TyE22pkMozQRPQcJINHxgf6v/c1D1x29ic2CIBtt1hMRzaXM9aE3/YTcJ9QwdP7z3MY+FtT31VAa1v7rEus3BArfbvI/PmzbZr6a6Rka/0xpphfZtyttJ8YziGEqeOBwPfBcjGt1/efvSIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=peWq96JO; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IGpDMF076556;
	Tue, 18 Jun 2024 11:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718729473;
	bh=Lskly1cpf/KK45sXXzIGa0MObnom7s5TrJAIodueiVc=;
	h=From:To:CC:Subject:Date;
	b=peWq96JOt2s62Np7PdA1WTiiX3iRmEThy5SJtE28l8lEq/RCwP/HJQfCPRIYfHLFI
	 0cEICnC4gsAlmI+O1E0RuNcBvJ74NdE0vfgGZnIOVYinKhuJOk7OVvNKhzQdECYkEg
	 0x5Zo59rVI+1/tbmLABybEPYOGqdnqPP41iNpl44=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IGpDGA003937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 11:51:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 11:51:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 11:51:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IGpDWx008333;
	Tue, 18 Jun 2024 11:51:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max count for "pinctrl-single,gpio-range"
Date: Tue, 18 Jun 2024 11:51:02 -0500
Message-ID: <20240618165102.2380159-1-nm@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Texas Instruments, Inc.
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

"pinctrl-single,gpio-range" allows us to define a dis-contiguous
range of pinctrl registers that can have different mux settings for
GPIO mode of operation. However, the maxItems seem to be set to 1 in
processed schema for some reason. This is incorrect. For example:
arch/arm64/boot/dts/hisilicon/hi6220.dtsi and others have more than
one dis-contiguous range.

Arbitrarily define a max 100 count to override the defaults.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
I am not sure if I should call this RFC or not.. and if this is even the
right solution.. I am on 2024.05 dt-schema for this check.

I noticed this when adding gpio-ranges for am62p platform:
https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544

It is possible that this is a bug in dt-schema, but I have'nt been able
to track it down either.

behavior seen is the following:
pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>;
generates no warning
However,
pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>, <&mcu_pmx_range 32 2 7>;

generates "is too long" warning.


 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index c11495524dd2..416a70db14af 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -74,6 +74,7 @@ properties:
   pinctrl-single,gpio-range:
     description: Optional list of pin base, nr pins & gpio function
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 100
     items:
       - items:
           - description: phandle of a gpio-range node

base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
-- 
2.43.0


