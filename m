Return-Path: <linux-gpio+bounces-33637-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAH+J95VuWnYAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33637-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:23:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 404562AAC99
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3E26303D39E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0893CF021;
	Tue, 17 Mar 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D6TEyIEJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hSFvNZVz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E893CCA1F;
	Tue, 17 Mar 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753738; cv=fail; b=f+ba1U1KOZjWeeA0gPvxSLzipbESwn9GXGQ2NeXvVRgbq8KzkXk3aqMpWDHT+rj7fTIcGVIHCaSZ3guisgmlbBTG7mFsFTBUIF015CsFJgzqSGJDg8yX1a8imjSE60Pdjma9MoFAVM1jC8AowUBL589ZehPdGNgo8sY7aGfnQ5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753738; c=relaxed/simple;
	bh=X/HjzNm7IeaBv8VfxlZ0fONSSnvJn+2KMKd5YLhTDfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMfkIiXGqdB3Acrucs4Ijr28ApkYLGHFMn1MGT9xxR0YbO+m8qzIkCwp9m6apXp/NanzQT9BkQwPCdL37DWCaeAPjceHJref6kJYsh421ASbG5dyC6zoKvukiSHU/girfneSEQOGpYzrbmHm8UWVvCM+H4mJCqhnut8fo4Is/1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D6TEyIEJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hSFvNZVz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4IVSD2797407;
	Tue, 17 Mar 2026 08:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=5WA0bVFHwQq2Crf+96
	78wWk0lXKFov+6mtzTdfoOoHc=; b=D6TEyIEJYA08WOeIrf46R9HVZC99fUnKad
	Vp/Nwwg/PSE06J10BYQozxn995zd3fx3Eyrhe4ovL3QcDQNjQSdGBXI10OHeoDYb
	wSF+xPUZQCDcvu+xRFttHHLLdFrOuluHgeT7RgoZSh/duwcgEOef8Phlsh0mYDUE
	S2uNEFKjBmBhht3lA2leBphmUDgrjy/22xY2SbRf71/V2MthM7gg+O0V8t8RWW2s
	CTMU6IfBnBebDSed5Epx07a4nuo18OiHtEANCr+zuLsXNvB833UrqQsJc3M2sPRj
	9Crks4pv2+DfWxrdJtz7/fir5vOJi895sLpAaNKRsYgLkkDvYwgA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021079.outbound.protection.outlook.com [40.107.208.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v3ker-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 08:22:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4X72sQYzDvu9QABhJ59e/zXammXb3Z6kAu9+HSWSFRRC6F0zv26J0yMRAPFpZZExecDHA1hiYnBP/Mr7h2wDwJBnSROiy6tltg1jrgr1mzoeCDpjb7jzAhdWGZL2Ir0Yb8AQMCcEhevQpj/WAydQqkSlY5T4OeTEKcXXdpMTE8VCKTrvS6g379xkMeMPNSLqvo1ZTqFWOEDJbqyotZvRJ0MTVZRpn9540LlYI7wRA5G2VV3smyaAx3BD98D4Q2BM06H7/+t7IdmdzRnoCRtxUnSqag6lSPJoXTqzswjRQpCnFkoUymgzTp7NK3HPBXsp7Lgnq7QgsYfzVdfzgweSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WA0bVFHwQq2Crf+9678wWk0lXKFov+6mtzTdfoOoHc=;
 b=KwlEe3T1ih6KZzyEjSqR9/QNM00yJnbxSYgAvSYayVomMfLXhtc45zRKp9fQLjhKnvaFQSceusVKS+KIIm9sOnv0XXzqM5/6JCSqMKQrCGu7FwAYspv6gCwjjGt9tEEBDEHLn/y7/tzk8PX0AZp0rWjthoZsmRkkMfEbhyqDt8e3IJ+W1TlWwn0QiaNxrDrS2QCAZMZZau1hTdgNqpNxA4xtmCROptc8y3n/ppknVbhaSZF0wJwEibgc+mnSnXtlnWXwg9PiHlL68H6OiEgNu3SZ0Ltfw/QoBtTN8sX8h+7jMl/IwpHAvu3MeV+lDsOXiXe/bX5UZ8mkk0Y/J7RYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WA0bVFHwQq2Crf+9678wWk0lXKFov+6mtzTdfoOoHc=;
 b=hSFvNZVzmB62kPG7oizmMhaBlbQKJq16G4EcyazxLIFZx21mrryftEe5ho9+Gzb8py3pcbneSr2a+nj6YAJJWn4gJGW/KZ3PGQKr4zbQjEYz7/3/YvyuHme6gGRd4jH2Bvi5jMnqe3j0fyn+kxg1evjPuF9NLlQY7mt+ul8WDUU=
Received: from CH2PR10CA0005.namprd10.prod.outlook.com (2603:10b6:610:4c::15)
 by PH0PR19MB5646.namprd19.prod.outlook.com (2603:10b6:510:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 13:22:10 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::3b) by CH2PR10CA0005.outlook.office365.com
 (2603:10b6:610:4c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 13:22:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A1C8F40654A;
	Tue, 17 Mar 2026 13:22:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 83F4C820247;
	Tue, 17 Mar 2026 13:22:07 +0000 (UTC)
Date: Tue, 17 Mar 2026 13:22:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: wlf,arizona: Add irq-gpios
Message-ID: <ablVfujW/bkt4X3S@opensource.cirrus.com>
References: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
 <20260317-mfd-arizona-irq-v2-1-9ea546f517dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-mfd-arizona-irq-v2-1-9ea546f517dc@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|PH0PR19MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 883d48b4-a933-48cc-e54d-08de84283144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|22082099003|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7OiXfeU4cKLWpIIX2aXaMMgm9XXAkRS+pEz61qdQJ97VzjPjFAC9LddXqUjz6GNjWPuFsDnoNYLT2sLH0z3znJDS5Fm8Ku8oGCbobtf9B7E4W9FXXVNwOqLpNUh7D4EjP+m9JszR7p4OPegWLn+XQy/kQM5hvqkkYgyalokgCxz+JuG3TxaHACkcxbas5++vrDS2h2M/PGAaEVmMlwvOe7JCaeR3BiimcddQDZl6Y9x4Z4OOZhGaCKvVOULMl41DF/eehVF8ms9rC0yDFhZstguhYblsI2RUUn7D7Ja/YkKdNtWpR4Jc4+U4+tMBSdUctnHAK+LZ2SkWbAxusOyXgTNGe1hR5EgXGC/DHCROrA7pz8hOzcKlk5DFW/s/GqbtYf5j3uDKM6Mjcgd/LeL0jZZdnBIfLGGEGkpChDDmTLrY556C0p8ZzH+tWTIFYarYMtKaK0cWwkent4J0LfZuHSo0bRPLth9Puxz7Wbuda+enjlf+aDHpjbajHrWossHusd8Q8VgI5dZ21pcYIxZKnnpkFJQG9J+8mwbJf9SRm2ApnHwi2dLwySIgMfNsjXOcsl8MUU+gYi+ni2z5HH5AUvGeqq+QHu9XqGhDt9gjBH+qO9sOUgGHdPZHNy2UhtKvo8Wcegil1nd39Q1pMv2wWAxECat3KuYBqzfgPoxuHf8BjQzWwyvCRxus1CPqZwlimm/PnLUzLm717J9YundyEPwTzsk38tSc2A4pYwf4rCGOGXCCNT7LVUf5RD0V4Tsz+aozm+3FG52pFfk92rBLiQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XrGSCmMPJOITV86urOD5tgU+d21Dm3bxiEcFcfIaZG/wID1qv9CcymoSgRuZ19cYZYkphPP+69q+5QnMWVihH2ZBodGnBd8U6zRtghvrrN7Ajlu3+mgP4tGvSu1MSTu+DUhjlxltbGmZpVytgGdRv2OWtVv+BIb1M83/LgLvLLjIgn+qbneXuuHrmc9VBfe0NTZrHW0HCp382n56O9RW4ZRVzVaHscOoAlKRf7i0td/a4pbz4+rfV7plnjzhhwDW4meiohpVRxbJ6xO+CtG6kfKPSkUvGEVsT70r8dvCYbyxRDSARSNY6vMKTcR7jjucNZdHjSbVAHzR0smEz5Aq6HW3a3AnAC2kc9MrJVSUC0G5GkrdN/fy0H0MH9AIYov2cRHYzJPdpmbXPW8xStCoVyWKk4s1HMTofWgw93oqyX5cGobxawHC9Pwb1aJgQogf
X-Exchange-RoutingPolicyChecked:
	fBl9q45PdYcSD9dlkZy0ujMEnguPR0TEB8xL9Ck2ls5ikqsgrhZHfWqE1jdr6Nhc8Jra4v5uWhmJBS5s+tEPq5OCWqYVxAoqxRnf55w1xWxyHi7X2AnR575YvmlAuZ8YYILOn4AJSUbwalvDW9UUSgGW6YcOd478eKLd6T3VghMW/Wk4D3CkzdcdnNSlHg6EB3Mh+aojmbDYtszzJD2yA/OajvNGXMIx3ZhAz7KCDWVznUbLGCKforeepSzb1mBA70KPdlWV20TCs1nFvwqma5PFHA88wzQa+4dc8skB1wOsVnwCZ5BTwO40eSWVW2P/ZG3YdhZZjjuUOAr2ZaH8Mg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:22:09.0942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883d48b4-a933-48cc-e54d-08de84283144
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5646
X-Proofpoint-GUID: Tx6W1dSWpbI5P6LjNNrIfQGoESmXOxaC
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69b95585 cx=c_pps
 a=OrhHz3+zTO+bBwkwaozMtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=YN3mrttpw4U_HhC6CS4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Tx6W1dSWpbI5P6LjNNrIfQGoESmXOxaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOCBTYWx0ZWRfX1rwmpsHCXbqt
 Dc9u9HkZ5TXuBdzZowRocXnTpywzCn90020kHewWnYLbOM59aZo5S/m4wH0Fx+g2bzEQeYLUhaH
 6CmjZNT76cHFrGbgp7T4ONdxYvB1vbyxreWaLFgSSIseTSeCGBBHFO+XqYktdJAsMDCOg2jR1vm
 bngRDM/LouO1+K4qGDyTpnO5mFjs7v8gm0mXdgYCTsAnoiEFJ26i/bxudGo515yH6FhpH/iElu1
 YqZzneF5SQLniXt/rBgjXMhTku9zsrFfFUYOqkpGgF8GM4hguCLSIiU4kHZnKO7TcOzVVxXi5L/
 wZ+B1GdsRPZA8ko1wd1HYIp9YSvHVapnqyV9OVhaanDJuirnU3ho63oo+uB3oeXoMGZJgKw28Nm
 3hzidB3uZPoo7TFMHwJf9OUhfuFzKCRKojX8LSq/miOvRm5AY/JxXknNkhL0TQ2ZR8rIa1B3Iqy
 DcKQNi66uqdlb16AImw==
X-Proofpoint-Spam-Reason: safe
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cirrus4.onmicrosoft.com:dkim,cirrus.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33637-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 404562AAC99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:28:31AM +0100, Linus Walleij wrote:
> The Wolfson Microelectronics Arizona sometimes needs to poll the
> GPIO line corresponding to the IRQ to counter bugs in the hardware
> that appear on edge-triggered IRQs.
> 
> For this situation, provide the optional irq-gpios property.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/wlf,arizona.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> index 7902f3c5d289..dbf1f1e0a57e 100644
> --- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> +++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
> @@ -194,6 +194,15 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  irq-gpios:
> +    maxItems: 1
> +    description:
> +      Nominally a functional IRQ should be provided in the interrupts
> +      property. However due to glitches in the hardware, the GPIO line
> +      corresponding to the IRQ sometimes need to be iteratively polled to
> +      check for the triggering edge. If this bug is present, the GPIO line
> +      should be passed here.

I would perhaps reword this a little. Its not really about
bugs/glitches. This feature is for hosts that only support edge
triggered IRQs. The codec IRQ output is level based, so if the
host only supports edge triggered IRQs then IRQs can be missed
as they don't necessarily generate another edge. This adds a
polling loop to ensure the IRQ line has deasserted before exiting
the IRQ handler, forcing the next IRQ to generate another edge.
Perhaps something like:

  A functional IRQ should be provided in the interrupts
  property. This property enables edge triggered IRQ emulation
  for hosts that don't support the codecs level triggered IRQ
  output. The GPIO line corresponding to the IRQ will be polled
  until all IRQs have been handled, ensuring an edge is generated
  for the next IRQ.

Thanks,
Charles

