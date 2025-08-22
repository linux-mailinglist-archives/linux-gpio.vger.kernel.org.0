Return-Path: <linux-gpio+bounces-24791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B305B316BB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 13:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F601CC681D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 11:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C7A2F3C33;
	Fri, 22 Aug 2025 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a03O7Z6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C72393DC4
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863422; cv=none; b=foTE7imnu9VpAE/0ry3umOmgMUopEw2ts7kR2n2JKzs0/mrH9JWYMF5GFLhvKprzzfDFnHkjI1ShztsoLlUV33+gThezqd/ey00YKXI9I61qstfeNV//3pWZGALXWyAZ2mOouqsOxnULRinTHv+57ck2fyUCk3p3h+grnBlPa1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863422; c=relaxed/simple;
	bh=AUceWVg4cmUX+EOnNIi2iW2pokVMopg0Mk5hfK83ZNk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=dPJnTSV6emR/sj7Riia+mkoEdRd3IrRVatqbNC8js/1lsjRqq5d2VcsFFtU3WztO9nOQ8hY/+40MatHvOGbda2Oog2RcmHyvleSRHP8tmbR/oJbowuBKKSQTZS7U2SeAPcAfTZQBSDlPMXngloUWwH1x5i/I9fiSmf4N4z9O8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a03O7Z6u; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250822115018epoutp0434079ec43fa5d46365496494a9828857~eFHn-_zvl1410114101epoutp04k
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 11:50:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250822115018epoutp0434079ec43fa5d46365496494a9828857~eFHn-_zvl1410114101epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755863418;
	bh=w2pjATg3JKKJ2idLOP2lpbZQuTVp7H7ONvzjqtbWJc4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=a03O7Z6u1dmM9+lj9QIfAF2b9/LXsS7W5yjHlsRINlcVATBDb8k30freJxRAyQNgW
	 zLwVeBw6RO8jcqU5P0TVBBwt6nhPEOUSTd/Tksqhoa5r3cBfNFdWvfJwhpwSzO+cIp
	 A416ekmKuy22lEuBoJWnbkBrT8c5N1DYe+1l5fxY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822115017epcas5p371083af5a6c2202a80fbdfca7b60f2db~eFHmn9RLY2494424944epcas5p3a;
	Fri, 22 Aug 2025 11:50:17 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c7dm83LXgz6B9mC; Fri, 22 Aug
	2025 11:50:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250822115015epcas5p40c0dad62af3fe03fa959d801a92ab15c~eFHlJzcqY2572625726epcas5p4W;
	Fri, 22 Aug 2025 11:50:15 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822115010epsmtip11f59577f929b28e42a40e14193d643aa~eFHgclH-C2666626666epsmtip1h;
	Fri, 22 Aug 2025 11:50:10 +0000 (GMT)
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
In-Reply-To: <1096f050-f617-4e86-8948-1fc8c3936b04@kernel.org>
Subject: RE: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
Date: Fri, 22 Aug 2025 17:20:09 +0530
Message-ID: <000101dc135a$ece160d0$c6a42270$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGJY/8wx4BImu0YLFPVfwpfqUmFNgLoPtc+AoauMBoBa5GkcbTdGWdQ
Content-Language: en-in
X-CMS-MailID: 20250822115015epcas5p40c0dad62af3fe03fa959d801a92ab15c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<CGME20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa@epcas5p1.samsung.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<1096f050-f617-4e86-8948-1fc8c3936b04@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 22 August 2025 11:56
> To: Ravi Patel <ravi.patel@samsung.com>; jesper.nilsson@axis.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; linus.walleij@linaro.org; tomasz.figa@gmail.com; catalin.marinas@arm.com; will@kernel.org;
> arnd@arndb.de
> Cc: ksk4725@coasia.com; kenkim@coasia.com; pjsin865@coasia.com; gwk1013@coasia.com; hgkim05@coasia.com;
> mingyoungbo@coasia.com; smn1196@coasia.com; pankaj.dubey@samsung.com; shradha.t@samsung.com;
> inbaraj.e@samsung.com; swathi.ks@samsung.com; hrishikesh.d@samsung.com; dj76.yang@samsung.com;
> hypmean.kim@samsung.com; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-arm-kernel@axis.com; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> gpio@vger.kernel.org; soc@lists.linux.dev
> Subject: Re: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
> 
> On 21/08/2025 14:32, Ravi Patel wrote:
> >
> > Link to v1: https://lore.kernel.org/all/20250710002047.1573841-1-ksk4725@coasia.com/
> > NOTE: The first version has been sent by Coasia.
> >       After that, it has been agreed between Coasia and Samsung that Samsung will take
> >       ownership of upstreaming ARTPEC-8 and ARTPEC-9 platforms.
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

Sure, I will remove "--in-reply-to" while sending next version.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof


