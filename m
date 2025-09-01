Return-Path: <linux-gpio+bounces-25264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F7B3D7CD
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B5E189BA19
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 03:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A62223DED;
	Mon,  1 Sep 2025 03:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lRghJs6W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65594221F06
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756698106; cv=none; b=hLMmAY/AVgTuSYeS2qzA9n7wXNq1Aoe0MI+bBbamsrJ6WJGHo7Ns7QDQlcLWuknsci8/uea6WTiMuXYXqcaDbhPbd+ImH/PF3b7n+qNZDrGmgAptv3+uf74yutS2xPXFKDQxzalapQ/l8PghtVFi2HOknxW+ULudHK2b8Y3jcZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756698106; c=relaxed/simple;
	bh=d9Zuq+VOrL8MIyXST5jKsQIg+vODZlLmLXbPj9ULA5A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=LEwgcbmmPUKASLIVy5ghmgaNLwB0xQzORoCpEj3PKPoJNhcGB0Br9Hhz6KS0YNIF1wbxCnyU0oqJWZOFBxk9LQ+uQ3k8fljYIrrtkeSJuH2jmyGuG7h3GKqCa27pp9Ql4PCZHkt/Xajcx+8EQvZyH2yvgGx+4UKU7+wTPgnJNnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lRghJs6W; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901034142epoutp010591dc4c8e50e65318e2dade2b8bf870~hC53qWbmb2984229842epoutp018
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:41:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901034142epoutp010591dc4c8e50e65318e2dade2b8bf870~hC53qWbmb2984229842epoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756698102;
	bh=2EZz/ZSexN7h2df50VcWK12q3iXM1vJoQrK6dhmIGE8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lRghJs6WiItv3rLjqm+pzd30UDC510OACcd4G9b54EPLEvJjBtDVl1wjZP1FgxHFZ
	 5sfwIdjmx5M4o2AZD5opByFkST+fjM9o1DUAFANbXSyFuAFqtLQad2xrcu+gvxrEmI
	 uEMZRud998UV8PjWn94gKKRUNaZDRTi6Imaajgvg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901034141epcas5p1a451644c752ee167db2534393cd4b54a~hC52zjwJa2089620896epcas5p1q;
	Mon,  1 Sep 2025 03:41:41 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFZRm46C0z2SSKX; Mon,  1 Sep
	2025 03:41:40 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250901034139epcas5p41f782871e58b5f6399fb3742f8b2e662~hC51ORnB22310123101epcas5p4j;
	Mon,  1 Sep 2025 03:41:39 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901034135epsmtip2835c6e93404b742e12a1de642383dbc3~hC5w2B8yt3100231002epsmtip2n;
	Mon,  1 Sep 2025 03:41:35 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <pankaj.dubey@samsung.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>
Subject: RE: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Date: Mon, 1 Sep 2025 09:11:34 +0530
Message-ID: <000201dc1af2$537b4e70$fa71eb50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAMDo+/eAkhMLtUCILeh+rRrNiow
Content-Language: en-in
X-CMS-MailID: 20250901034139epcas5p41f782871e58b5f6399fb3742f8b2e662
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
	<20250825114436.46882-5-ravi.patel@samsung.com>
	<b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 31 August 2025 18:55
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org; arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com; inbaraj.e@samsung.com;
> swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com; hypmean.kim@samsung.com; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
> 
> On 25/08/2025 13:44, Ravi Patel wrote:
> > From: SeonGu Kang <ksk4725@coasia.com>
> >
> > Document the compatible string for ARTPEC-8 SoC pinctrl block,
> > which is similar to other Samsung SoC pinctrl blocks.
> >
> > Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> 
> 
> No wakeup-eint interrupts here? samsung,pinctrl-wakeup-interrupt.yaml?

I don't see any use case for external wake-up interrupt here (as of now).
So wakeup-eint entry is not present in dts and yaml both.

Thanks,
Ravi

> 
> 
> Best regards,
> Krzysztof


