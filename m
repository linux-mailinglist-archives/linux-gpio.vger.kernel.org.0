Return-Path: <linux-gpio+bounces-36472-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBuRGF/1/Wn5lAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36472-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 16:38:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D94F7DD6
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 16:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1C8E3015C88
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984FC3C73DE;
	Fri,  8 May 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LYv9Sb2f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bJLkdJBd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B051D5147;
	Fri,  8 May 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250906; cv=fail; b=E2tNiyVEbpTziR9KNLzAM2fZO4xDnsZcrI6HRTL5qHH53zRvmlwwYLa+KqjbaEnhR61KbUjv5dTfULgcXSoTn4Aex6t3KcJMKY6Dx8bRBd4DvJwnx9JFb+LRD4xx/f90wd1bju5dx8vBhCu3e9H2jnZHF0dI/l/rTgAJC8biYqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250906; c=relaxed/simple;
	bh=yhAatIWLYyT1WGHhLeer0MTe4qdBJD3SGMLCFHpaqH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=os53dhhGuAdEz3HfEiye8AIGXs6EqGDKtordHjmEufzPihhHYaByRC4OgGR+x9qY4/UjFSH6X2VcT4GZRZZCEqq3z4lgR2xAGcPwlBkKtWpoPHOHsD4nA4YQ/D3fE5TonWDFn7N5/DGEy/UQKlEYzQoJ8OXVJjsNskM7cX4gijQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LYv9Sb2f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bJLkdJBd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CgB1v529341;
	Fri, 8 May 2026 09:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e3OcsnrQzqj6/9MQJAnBN5jUWwVY9ASwngyJlvd8q8I=; b=
	LYv9Sb2fBtDd43wde1Vx0h7rQhWWBGfEMaGu8PKB2xdTKNmg14oZ3r1jNvyqRAr6
	zBvq07jx4FGlxXynn7qqhD8uP76m6kAkL1bfwAHl5CBmMz68T9DXo7za/9lW5FwM
	7oUcaNdfyt3tmc6R4+o1R6yb/oecP7Pv6JM4D2MDIVbLqP6nb5TuloEiVv12ga8R
	YZuU6TnDtmYirol5vM4WDLi13C2ODirvw1xwW8qzpmcyVQZ0PE1bkOjtrEXkofRl
	4aqTkQzHyvPSPX0QARV+SwWFSlf93mbJwHJ3h3Em0yU20HfjxGoU5vGSx/YPIcsa
	jI9Q+b9IaPjfEkFHWCY9HA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022088.outbound.protection.outlook.com [40.107.200.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e1g20r4mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 09:35:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAXQA8Ln68h3EwKXuVoMZuSdbRbhxsKzCbF0oBlOXS/pbH8Kwzew/Jmgwu7fUWNOVp0abVVmv1pZoDxpjD2BFzineCWq/phnE3ZJazVMKmj5WJ621Njv25mOygmk0xL7Gprz2DR7GIyvNhshzWkWDQXGhDeLbwZ7bLB8ACkGOQASL/FNpL4qm6f9WeXn6RviBz4LqwTOc04hohqHuiF8szWdHgLHhmYyWlGWFb1CDCpHmnYkWN2TbFdJqfY70XVb552rK+dXfZfzxuc55a2kqlFWsSSXoiNCVwi83D84qGME7Cg9+v7BzHQWakccHfEYzfJiaZXXSlUFvdMzRzXLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3OcsnrQzqj6/9MQJAnBN5jUWwVY9ASwngyJlvd8q8I=;
 b=OUx2MRsJFrZMarkrtqnUqREGo+OqcmQzoVVC2/gwdzAC2DG/7BfUeVjIZIXtv44djOg2QNL61pOO1v2fruv08GqZR4YYkPThwNGYSWYBipUFn+X5y0fAmzTDgLb7KAqMcdtv6ZtZ8GAf65jHRcRDD17LfdgfXDtGKm1vhjzkC2B1z0UZUbHjc7+ognPNqtl5+tRODC03I0abO9670k14vXzEL7PhR3YXXT35a4XL+sgPAqOZt6mxBheJ1640Cb8EaN6ftNSk/NSfR758Kqwa7hkco30kTOI1yNhG1RqeaMZHYrCQ5DbAab0sRFPVtKhQx47/uU3Ev7h/GDLW+nvGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3OcsnrQzqj6/9MQJAnBN5jUWwVY9ASwngyJlvd8q8I=;
 b=bJLkdJBdM0w2EDV1so7ep0QSccu/34uv4IiKPSqxz1O+XFDGfoXOvJjyMPlBUBNi4bqzoidZRQZsH6/xmMLra2Yw1etNiss/wu+chf/gjmtuJEVELrY70OXRz7M0cJ1z1q/TDioUI/CjgsA5oaAp4leCP/JY3b8efWD4mIHMbIw=
Received: from MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::22)
 by MW3PR19MB4364.namprd19.prod.outlook.com (2603:10b6:303:49::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 14:34:58 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:303:8b:cafe::df) by MW4P221CA0017.outlook.office365.com
 (2603:10b6:303:8b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 14:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.1 via
 Frontend Transport; Fri, 8 May 2026 14:34:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5C69940654F;
	Fri,  8 May 2026 14:34:56 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B64982025A;
	Fri,  8 May 2026 14:34:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: linusw@kernel.org
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] pinctrl: cs42l43: Fix polarity on debounce
Date: Fri,  8 May 2026 15:34:53 +0100
Message-ID: <20260508143453.1886569-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
References: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|MW3PR19MB4364:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16c3eb99-4af9-4dac-c2a4-08dead0efab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ksqHfwu8hoX+vrgc1hkNK7tFQspRpIwmwo1sB7bRdP6aB5OjHE8lIlaVI1EOm62XuWtANvPb+7e8wknh+4rHfe8lycYs6vd5H+cyC813tgliy+YYuixDASvOblJcHfAjlmsG7JE5Z+d/zWt6MKRJUZ9TMXa5i5bG6bvqlfmKxMtbLN6oM/uqx9eEZsbW35xlFwIsNO278afFGWET1rU+0rJLhk2hEoXikG0C1uXEyMSSRbjPL4nq4GsosBtr4tjFtxGyTu54b3nZsvIEGRCeMwq+9Y3e3W88/NyQGBJs0llxvihwYpb5PY/GKDtaPWjoSlc6CP952N9Ho2dEFchEBt1pEhM7aDivjkz8mgCwALeyTLbttdeH1iA6bJNbhirv/m3KFJ8X97nlBhiMDw/p/EAMvGQYorQcY2oyHv19W701VJytQSp+ak0zVeAz9DPp6NTVnXJRt+bibhwnB5T147PUGMhPHWSFuodpfJznWGkt39BTsULpF4Qqz8WjV+nBQPSGTMYEXL37c7xfbxLnTJYaFw7goQZUNBDGeOpqTwd1J0r8LjAmX6E2hrm3tzW9VAuKvylMdWwxUKrG0KZ4uj0JCiJHjrm88hhugD6nTrcV5JTNUDLV9WFPd8/UTY4yxaCS0F3QP48I3tSOvAGYqOCsJrKE2TvKkeSRWVblWPZDH0BusuTk2as2Z5sKNDu/OTjmJvGmFmBP+rc1Z/DILdp3xdLo4wLokMGgD9EGc6g=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sd1vXGQis86Rh4k0lEF8l4kmXZ4GydqOQ74xV/3Z2r2hh3fj38DYQlES/w6VKfJ8gJAFquH0ayYv6ujFqt5M3UZ7OIlFhcZgKMAKAmT8f6KqrJQxw5A8SMiU+z2B1r14OsxVytpqCgKDS/WRH8hNxn0RB0Po8A3zhR+YcRAJygm/izEq0o0AfaWbMn8JSZilEoq+J9dk5E5ztu53NuxN+dOaK4PHnSminTfYVNhZAPhzNhYlSQMRFW5i6C4ktTyO5xI6YkY5a5cqluKnXflKKDKA45UdsB6Xe03DWl8IVGOnCP2EpIAUIw2wYbAesr2JzUgCmIpiQGBpk8TG+uJ0KjlQYpfI9vKOr6x3603ELF+L6qXUBTazJl69YWVjGojU3P2PwhC8MwIv21aVhNZUSkOHtX/QY7kLbpoxl/jkWkt2jVnOj1msl7DXZ/aOa1RN
X-Exchange-RoutingPolicyChecked:
	Ry5xXVvtDJbpF5o6MBoND7PsF2z4EgV6m/2M/gtbPPiRyJnw753MiNIUPVzHGZpQvprz5ZFSUcmxWvVerI8bB06TKd86wAGNVU9KWVylYT3FsUN9OV9kuLI90ysbgGl437Epq0woI+TjEC5uym+mCW8ZZosY64dyP07grPfxdwKpIy2bo2iScrMqi1SYgh0Lmsq7QW0ORHOYDmv7tlupBi7AL9gjMQxO1+nudVGHrN1OVgPKLj4cq/1vzeN9MiGGQrjtnwGcACYQNHcvVMo9hZrCAHJgFVomRJggZOJSYhGexdUVX7fvYgBZmF7HoqAVDG5rLKCpzc/6RBYHjP5pLg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:34:57.7358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c3eb99-4af9-4dac-c2a4-08dead0efab6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4364
X-Proofpoint-GUID: divRi87EFjxSlHZooOBOctGoI3Ic_feY
X-Proofpoint-ORIG-GUID: divRi87EFjxSlHZooOBOctGoI3Ic_feY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MCBTYWx0ZWRfXzqNhSjUmWzvj
 Oi9PxxBg3CaLn8+oQhjFaN/OIdyhUpugUy69QwyIJP8ZguVuV4vt4U4vJ+aq7W/YvaC/KCzHB3m
 PPkO87X8GfO1l+HcK5ngZq/nZ5Azy8QyaN049LntJn4gF+JgB7ga1mNehKuqy6QmeSHuhw+TbWy
 gnjMb4QoUnbzyG952lrpYBSmGSkqWWibzgVDCW4wscJ+qDKI5J9d9WDpDKlOufQuQGtC1DmehIp
 viCCeJ+Te5T3sARf2uD3XlxxZzyFhlKM+rBdz3b1XNTk/J8lt9L21/AVK4UY1UrHWcTu8kwgN3Q
 h1i686TQ6L7qp/6RgnvotaS4QUlU+nK4l5mZOoajJgujUQlIlCTOJ0MuLBSpWZtexfW1kPhISR2
 uAiuFAIaMXoQpnwKBzrzjRzSytLkf5xJp+5NrP+j1u9AjVJe85/4ZFlIeOs9r1PFLNHSOy2+FRI
 0E8zHJAp3Bfj+qVxSSQ==
X-Authority-Analysis: v=2.4 cv=Nc/WEWD4 c=1 sm=1 tr=0 ts=69fdf495 cx=c_pps
 a=72vqVjiraSETVmPwcAq+qg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=qN92CfSCw-KPgYjlivQA:9
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Queue-Id: B69D94F7DD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36472-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensource.cirrus.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus.com:email,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The debounce bit sets a bypass on the debounce rather than enabling it,
as such the current polarity of the debounce is set incorrectly. Invert
the polarity to correct this.

Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 3cc1835206077..305233fc19876 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -343,7 +343,7 @@ static int cs42l43_pin_set_db(struct cs42l43_pin *priv, unsigned int pin,
 
 	return regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL2,
 				  CS42L43_GPIO1_DEGLITCH_BYP_MASK << pin,
-				  !!us << pin);
+				  !us << pin);
 }
 
 static int cs42l43_pin_config_get(struct pinctrl_dev *pctldev,
-- 
2.47.3


