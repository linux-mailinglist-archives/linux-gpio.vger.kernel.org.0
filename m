Return-Path: <linux-gpio+bounces-11762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF99AB31D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5843B284189
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20261BD4E2;
	Tue, 22 Oct 2024 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yxvjuSDx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B01BCA1C;
	Tue, 22 Oct 2024 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612796; cv=none; b=YpSRxXVaAiivjKXQ8fvmly+qiUhINQdf2Qfb0iOQuZwzxfIJrUKDKiadOQAGUs43JQy8nW/Xxt0ItqaM6JC515CwLuwg7A/vSgTslTHnkypGct8QwXzuKU2sxPtPdQQylMdoSaufYmr+nB1fvKWE1D3z6ES94klW2L1oDfmCFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612796; c=relaxed/simple;
	bh=G3FzhTRWTRA0XK6WN7LzjCpAfzJhZOsWGLmjz9zylpc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwInw8l/2voWvOI6T5FhciIHviBGjEHsWmgrniJhjA/a0ETKyQjGmQoOSJYla0Adyf1ZQq4R/Cj//6XN07yy7OFKcSRns4+pYPrpgrCIybVxCzOKCl9hyV9WQwi1jYXqCQdzp8/mLjUqX6G10YgCsu9MRdP5E3vHQRAEjSGNR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yxvjuSDx; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MFFfBY000841;
	Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	kp7MjGJCZdo05GYSByP8raBHpUBQpYxoAxkRiZbXM+g=; b=yxvjuSDxoapiukrn
	JGY9I5w+YGYNib+kdA5ys/s/GHS8M798FGU9SPtKhpMyS8f4gJ5U9okH3KwVdvMo
	F5hn6Cv5FbY2urpJZX8KLCVPmNAGMj4ENInf2yybaCVrrl66+GNVoCQls8bZ2PbR
	7b0+Y2jkIcuum8dhRefJYUu5niXJTY98oIFCDVG210nBoRQR0vqEagKteYOjv1Sq
	E5T8UJZbGoBE+ugexIVgxujSqv5hNZ9lYSdkQ0P05qREgtNrwtOMSHlGd5JlJDos
	eo52W5djqmaeQVOMNeE+BsD+8Hhbp3edNnXqQRKbTyeBzixyPodawo/OXG3ixdlD
	vtxDZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42eehmr587-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 089284005E;
	Tue, 22 Oct 2024 17:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB8E326E86A;
	Tue, 22 Oct 2024 17:57:34 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:34 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 13/14] dt-bindings: pinctrl: stm32: add support for stm32mp235
Date: Tue, 22 Oct 2024 17:56:57 +0200
Message-ID: <20241022155658.1647350-14-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add the compatibles st,stm32mp235-pinctrl and st,stm32mp235-z-pinctrl.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 0a2d644dbece3..d7ee43fc5167c 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -29,6 +29,8 @@ properties:
       - st,stm32mp157-z-pinctrl
       - st,stm32mp215-pinctrl
       - st,stm32mp215-z-pinctrl
+      - st,stm32mp235-pinctrl
+      - st,stm32mp235-z-pinctrl
       - st,stm32mp257-pinctrl
       - st,stm32mp257-z-pinctrl
 
-- 
2.34.1


