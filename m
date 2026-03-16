Return-Path: <linux-gpio+bounces-33488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNxuDOnPt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:39:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A64EF297290
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8D303040ABE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444338947F;
	Mon, 16 Mar 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nkhtzvZ0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kpAS2y0n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509D4A35;
	Mon, 16 Mar 2026 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653835; cv=fail; b=kTrXPn1h6ho1xxd+8hOhgVMX1fY8DzAK2FGr0shyCOxWuHD5lu8c5B8M/u2wSM/Xmk+vMkmlnqxB58YW5mJblJdLh2Y4PQo4dfx9h1QR4WVPacY8sshVX/s9sb94JM0gOD1I0xytu+hc0Ypfb2fJxHuskc5C3Jup91U7T7wj8ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653835; c=relaxed/simple;
	bh=dI6NdrHzqPO559e2EzMD4PQkqg7wCsrJ85/Zegm2X08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9JJOIxBTIaRsbjBmmgAnlgZ217aaljn15HUb0Y8zmZ3mGb5F8BkaspL2jXMbPKCtW6WD5MdhbsN8g2rp8ArfeO3IQmAZUcm/aH4GVIOikiXrjREqKG4sTb2VWSwiiOYOYERm+aySvxd2Bmap2EJmnhzto5C5Zj9RSZAauGsrqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nkhtzvZ0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kpAS2y0n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7rAqc836156;
	Mon, 16 Mar 2026 04:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=81Y86rXJbCDKq8rR7q
	4ptcjLklZkuPxAaYAuaihIemw=; b=nkhtzvZ0tjygl3WEiKQy2uoJFwllBZInOv
	fJ8upGsbmoLR38IQoeh/y5fexKEow3F7Kq3c8sNY7EfydW3nuUKdPOdSTVl9wetT
	k2ZJaWKfVA8/2KnBE37CB9qnOGXIYLZAuohWKSX71sz8FRQ4x3qpj07sE6/tt1XJ
	xANyS5cUprMCsfBJXEejbiJbAfb5WlX4ADzf2cCIDyGBg2D21N+RZve5uksR0FIo
	f4C/sVgkELAJnoGoS5DnrQXyAJo8jFxZLafFLnA3WL+5oz1NGoM/oumyLajo2vxd
	6/Q89M8tVw6WqW/8lRaaolqh9kirzT5qfzJA4u3dV6GO126ekwZw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023090.outbound.protection.outlook.com [40.93.201.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v1tbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 04:36:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLY+9R9pITCuc8CwQ/FeZ0i7pYCO/nCH4//+HRoZQo91UzH42kqfhwKpk1FS11x/7ccr+44U9DOofORKeZuEBfKfH0JUs4VbihTLi+ox2tlk86VNGi4UNt5SnzQlookYrdWFF9v4WzFO08zZqTZH7x4Mz6jU6EUBTykemmEY6v625p/BzcAuz4zlDzMRFz9AGleWppsVjZCexhBAZdJqGY5g/F7lvLrLsHKCkVC+BdaGG7W61kjtFE63GFqRDQJKAXNn/Q8LA6wSZYIpPy4pb87iSikVd8xiIF74L09LZ20bf0oiNXyXj5o4Zgw1IM34Rzme9Goru4HuY0Z7UgAr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81Y86rXJbCDKq8rR7q4ptcjLklZkuPxAaYAuaihIemw=;
 b=T89K3ge1p5UJtI0ux1jL8ZzSYHnC7HpDBAix05FmjOqaCzhfTUghSy+JnJYWaXm8GRdaHGZZYqNIy9nB75M6NQ7rLXtaNTV0Yg9o5zAm97cHHdz2BemE8cRpWkDsleY+JgOWbDszs+wgDHx3ZFs2tq7JL6sOBbBEHTi03Af5bgQlJ9rw3uiLBJQYqC1vWhu33HwXtfsbomBDc5Oxp3s7w0k5j0CUwf+oU47DgTu9wrZEaeCqNEhv1tFtXSzF7K+VSa8BvELBcovGz22cvzQJR+PaZaFshzN3XebRnoBnXyBnpCATukW3+6tswExUSteOHx4n45dV8RqL6yL2sflwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=armlinux.org.uk
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81Y86rXJbCDKq8rR7q4ptcjLklZkuPxAaYAuaihIemw=;
 b=kpAS2y0nHqPtk8DriQZVEz/swfo2fw+1QGdZ6vTfPObxhUtATLrvozV5lbbV3GPD8QH5XiS0ikkZaADiIMYAiqEl/Zo/WbW47DQoq6ZhNXjCDirzY+4RwYQJFAEw0G5kj+3ikPO1fe+s8JcFnIGiw8mGLg3O6QEN7AmdaPLiYYY=
Received: from SN7PR04CA0039.namprd04.prod.outlook.com (2603:10b6:806:120::14)
 by LV0PR19MB9573.namprd19.prod.outlook.com (2603:10b6:408:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:36:36 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::dd) by SN7PR04CA0039.outlook.office365.com
 (2603:10b6:806:120::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 09:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Mon, 16 Mar 2026 09:36:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 78C17406542;
	Mon, 16 Mar 2026 09:36:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6144D820247;
	Mon, 16 Mar 2026 09:36:34 +0000 (UTC)
Date: Mon, 16 Mar 2026 09:36:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ASoC: codec: arizona: Convert to use GPIO  descriptors
Message-ID: <abfPIZyk8Gch5rxT@opensource.cirrus.com>
References: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|LV0PR19MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6785cb-b657-4ab6-361e-08de833f8476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|36860700016|82310400026|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RMD0GKziH9JzRy1oYlZ7u8Uedh2YVspPYZ7r69tWCQxFpj0lTWibaLO3ovWC9ctqhUoXjZW67BjKHWlsPc3QXjM3JGNyD8KuJyWwp+snqZUetBmBm8UJXGeV41AfdhonMsA80iAD/8by3CofX7cj2s8ecTr1G/FZbPLTuOdc8+iYeEndYbuELoikQ/u2NEcNZvH/LJo+OiNYrnCqUGPrRK1RbO0XxDDmqGYNopmXPsz4N1xglQ3OiHFoOVGzS9LuBmEL13ZsPK3avF+2RpJHVN3wL/6RH1gwUwgS+WUkErfPxo5B9onC5L73LbtYccysmiM7vBnovzaOi34HQRN33yOxbx96Tl0eds9bgfZXTSG0KVWUv81rJulNdchHgdc8oU1Aof3oWXI9/dL4NOh2/644yAYQaWG5tuSbGvIWfLE9i9yZCh8fF+ZQ/TT6GsC+MnOPWoSQG7U5CUXGx3/3ghfuTz0wPIQdsfKTmo8w9WjMaFLS9kloL0fW1YeTk3q8jKOFdNFtXW4Fxzxtpdpa9To0tastH4K7hThjtn8IuddjRnHeztB450gVjA9zfovqFNRtmChcl53ZhUuuTruFkcUWn9mii0cJxZfHDwbKkbUEkKUcjyYkORSxAbZImWUvE8itSOuOcMC/8QYlqG7np2IweFr7g3l01k7Uyumgw4wI5HiYi2QQ/q82GrVHOZUcOuc65cU2+ghMup1G2L+iDFB/6gD3JcZcU+3+AuDFmsYegiMUbgrhRXde5psOSXNiP/ZfZbAgFjZAOZ+hncNrHQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(36860700016)(82310400026)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yrDhD/4QHdwqY/TkPGa0Cj9KWPJgA5MK0jt9+jOcuwPVSD/XndngRzLZRciO43HoSiqclb+vcF9TiYag43zvBWAVU9M/vdCxFomc9v3ALAn97Ajc1Qah2XGis20rM5ym5/KBZbW0gYEHtNi393SiKCwXRUzm04HrFRPBhOImtDEYB7F7uF81QToi1Kd7nzhSaY9ewi9e8JmMo13qL8hIiW5aXgSeDPccSqE/SunJSTURQfVLFeq+yBzywO2YRG7k0h04POxrxvebMq66nQwFKF+VZZ3483gy1ry35rh8zRFggAs/UW0XLekcciJ8481UXES3QGyAb2jkt25m7ngYyot4ZtH/sZilgnOYjDCfW5ipa5FgjJBweLkBypecqrPyxPbIviyrtaTc21iuJ83JwOHdJtYavTFnnotbsJjz4G31oIwIGhy6P5qUcLkMxWN6
X-Exchange-RoutingPolicyChecked:
	rXnIgIOkXU8qAGvMIR7yEnVtLbjt/YuHbIg0a2PmXgzQPmY3He4T5XmhuIJcQ0Er1yxcTWOyq0a1gzY27S4EWVSZx6cIfuiTnrsHNZFbg8YcnCVlqD0Yq8uwRoBkwLHzW1yf8p2qEFE9QLEHGLuTT+PIy6/OBgqr0KcAR1fQgCZAvcrYHqqagdFqqPr135FQFB4r8hEFPE7UIbF2lMoe80gUPJ++ryJsRwWWq8kbdrgUxl3gngtr/5eXVWnzK6bhgOZxEk7w50FdTBbh1T5x/TVUXg8DQyRn/KUND5rFXK/Slf6lZ6LFxQtwyjyCwTM3xG86PORQvHwQequfYCuisA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:36:35.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6785cb-b657-4ab6-361e-08de833f8476
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9573
X-Proofpoint-GUID: gQqcs9RopwTNSOOXMEV89CIqqIu71EkS
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69b7cf28 cx=c_pps
 a=krMX4SE5d8na1K7/klQVLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=PApNQ4Y_GqTqzXxjRcUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: gQqcs9RopwTNSOOXMEV89CIqqIu71EkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX04vLvoN0MsPC
 hv2vZHprYNtcaV1yPbabPpy617AZd+jBV+C9g9lAgRNuEmx0bMkkJ4srVM8IJFeNcmUTFjF+vPs
 ghhFLsH7hn+dZXboSLn53P3URKUeifL9qlaPN8zSseIQCasT3LrYNDxKnOppl2nya+fZ0JazDxI
 Qg6imNoPYc5yeKyOmX9rBLXTbq1Hn9cAE2P/8zVSJrDRS7wcDbe8wQdN0oIYoERgON4uLn8Uy63
 +n2sCZmi5kHFr0bQMsgnjWOfGTVP1i51+fMX6b/MC7UACWNYW3yIwmvhddR/3ixHwgchyR9Zfx4
 5aNVkstMwrlazXxniTYK9VOnzLsXBJ4vm4RPZh2sy2X8USYjn1fGOlTR0Y7APXyjTAviAbXb+59
 KM7skkGl4CdGE3/r5gpAWZnSc1iF6JtY/KFrs6yUKDuN5/ebd2Pd6RqCkeNI07jmrjqYOtWZHEd
 zVFWHh7/tx1a3oQJoSA==
X-Proofpoint-Spam-Reason: safe
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,armlinux.org.uk,gmail.com,perex.cz,suse.com,opensource.cirrus.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33488-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:dkim,cirrus.com:email,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A64EF297290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:56:49PM +0100, Linus Walleij wrote:
> This converts the Arizona driver to use GPIO descriptors
> exclusively, deletes the legacy code path an updates the
> in-tree user of legacy GPIO.
> 
> The GPIO lines for mic detect polarity and headphone ID
> detection are made exclusively descriptor-oriented. The
> headphone ID detection could actually only be used by
> the legacy GPIO code, but I converted it to use a
> descriptor if someone would actually need it so we don't
> just drop useful code.
> 
> The compatible "wlf,hpdet-id-gpio" is not in the device
> tree bindings and only intended to be used by software
> nodes if any. If someone insists I can try to add a
> binding for it, but I doubt there is any real user so
> it seems pointless.

Yeah probably fine, this was also on the definitely more
esoteric end of the driver features. Although again there
were definitely some out of tree users in the distant past.

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

