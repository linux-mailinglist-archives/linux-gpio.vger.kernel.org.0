Return-Path: <linux-gpio+bounces-27179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD02DBDE6D0
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 14:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBE384FBF77
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 12:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD05B327790;
	Wed, 15 Oct 2025 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mp/u9j+q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7946E324B27;
	Wed, 15 Oct 2025 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530511; cv=none; b=jbRZyPfO74k1Row5g6D4pOJ5LV1Hk2eV3sIlpsDxyfh6Y0BNETmZdX3rKBI3uNSURjMGA/xhDrdCJCGQssjCF6NQeRV2fNg3YqU75sQHls8lchc0kswt8IGKcWullYrExAQhPIYOJjxdRgIjJrzyMTCAmftCY/7iee+IsBtNvps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530511; c=relaxed/simple;
	bh=c9aTXp+I+4A3k1DvpeXMIzErotkE9GitHiUWRAQ2v2s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihSLSUC8goPy+jB9nHWI0o7UL5j12hzf33N93ldJUSTLX/v7Jrf/L8VpYVHnJOeCEPr2enFy0lKqnlj5/As0R2/V73GyGi8RSMzv/M3ca3lGNcbsh8L9Umualqh2e10BoK3H63ctVjWq1pDqT2k2B08ghAuDg5KWBw4Uej9MM+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mp/u9j+q; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FCEs301313169;
	Wed, 15 Oct 2025 07:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760530494;
	bh=2OkkNCfu4YnFSj7smPfoU7koyJr+GcXCwTUxoqvzw+Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mp/u9j+qM8SGyPJRAIYEryWwjOZQHt6KJB6YWdyGwKb3jPB6PWHrWT3SHrYFQNA24
	 sN2G2zAEgOS4ZMfMZJhmXr9dm38adp+cCLbC1qYS3cLHaaG4LA3+HVTfeoL5CtNZCT
	 qFUGsP559oVqrekDfEbDMjB4KUIHLu/PmJdcyblY=
Received: from DLEE212.ent.ti.com (dlee212.ent.ti.com [157.170.170.114])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FCEs4E392056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:14:54 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:14:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:14:53 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FCEqFo1878736;
	Wed, 15 Oct 2025 07:14:53 -0500
Date: Wed, 15 Oct 2025 17:44:52 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew
 Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <20251015121452.7cmsi4tceezroxsa@lcpd911>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sep 12, 2025 at 10:40:40 -0500, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index e80c653fa4382acef964e182ecc4ae5445088936..d916c627eb619d16124772df5aacac9354126808 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -37,6 +37,12 @@ properties:
>            - const: phytec,am62a-phycore-som
>            - const: ti,am62a7
>  
> +      - description: K3 AM62L3 SoC and Boards
> +        items:
> +          - enum:
> +              - ti,am62l3-evm
> +          - const: ti,am62l3
> +
>        - description: K3 AM62P5 SoC and Boards

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

