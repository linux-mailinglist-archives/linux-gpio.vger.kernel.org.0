Return-Path: <linux-gpio+bounces-36647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EJpGoPVAmpLyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:23:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57451BC2A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B42DE304294E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 07:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BFF477E58;
	Tue, 12 May 2026 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P5s05HhI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789F36F8FD;
	Tue, 12 May 2026 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570563; cv=fail; b=trh0YLczC4MV3BPWNxM5oqW2qcuNPa3HFM+8swXdAUIiuzBGSBhuvpRw7ahWClKevBrNDI01b6XAaX2vbI4C7Edf++RMnGDm54JaGwXrrv6LY7LXqEI6KBO0oL4dlrgbWrdzF2k3rasF5+5CTizTnGPGeC2q9iPzLjVkzzGKRn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570563; c=relaxed/simple;
	bh=0XSZ3QjbyfTg/VSzInHsJxAyfZfBra6qnG/6aQnw2Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kT1wfCc5zzKmWK9cWEA/VlZTTyukxspd9ObayaAa4LM4ea0QiO0kjbgWm4ghFfTPh79beexm4u4hshVGrmE1wrk0xwXPVAv4urzH7Tt4beu6lWpesoQKKMi5I/Ymyyt8l1jzk6T26NxfmeY2IsFhGX2bClb1f3QmXOsUSwwa4mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P5s05HhI; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHPXc06QFsAqg5GQpW5DGgjZt6cCqYvVCHda9mM+Vhx+jggBQpNAN8xMP2sDxQ23gdb3K4BIUyRAFEmATj35LtA9SO81Jlf/O1n0FXvCmqJoOwy/+NBH3095NTP3Pf1WLF69eHIJSiDDOa6szw3CpKtRbAXUOtgfB+nh+4Efd/DilVblzoohL7Xdrv5EVl7KBGTGCM+flD05Yzq9A4yyWcEDbHYFdYImVqlK61tKMnqXJHa4vgUiFEoRIixLEimg7oS0xRGrHcBg+RgVSy40Pof/cGJZv5ccPUMVw76MFV++5TOYjT5ZZ2+9F8SaiYh0wjZPAOMlV+B9snSxknBUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BQvqsDPIiLLXee18uinEnscC/Isnx6/C0B1jtawMyw=;
 b=qE6ibZnk6+5wJQLXDPYbVNdueZUDgtprimNzIKarMvPrz55Q3Nb02LsPq3mBINOU4aON7G5KTQcsL+IGEWpawCm6JdxMf3JUIUbJb+gqfVskslLo6d72LoAJs87+Octtl6qR31xtHhC7lFsz9xaAYvi5NxC2ncTmHg0FlxXRzx/qGRMB8Bz8nA2jdoZ7LV8+DdqhF6I5z3c/ZuLW1jQ97z4SiZU02k8eAeYvQz5eAKF7pqVFsFXcnO6jd/fqxNF0tDcFdQA6SWgk2RoH+bSgVb9DRifAJTyBoX1y+w1nq45+r9g9crYcAjen3Mcn1Xr+un5yMfUU0UH2oZE6sW0TqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BQvqsDPIiLLXee18uinEnscC/Isnx6/C0B1jtawMyw=;
 b=P5s05HhINtVO032fIHBmfXGFkMDCM0+6tlGgkD8bGKsMuFY0I+mNWh0Ws61olnvNXA337XU4at45fPSsRhKXQr6e+a8me3OwQaEGP3hORwpvauwRkL+uZNDt4XuVKMXPe5LWqocj9W0Sod9K9MuMiP251m6Bqs/7pyhJoqEP8xkDUx8/3CAyb8qIVGJxOdhgc7debqdB0uABlp3bZqnXPgfh+26q9+bgduLVkMKjmn/KTz+BJCjcx7GiwoP8waxlfObz/99mLHxQb/1Q96c9QIU8UP5F+SKx7YsnlBrWm5yGdbDaiEtw+rzhKYHVyD7yfBBXdOtwg/KmN0tMdFrd4g==
Received: from AM9P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::20)
 by DB9PR10MB7995.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:22:32 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::6a) by AM9P193CA0015.outlook.office365.com
 (2603:10a6:20b:21e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 07:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:22:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 09:25:57 +0200
Received: from [10.252.13.51] (10.252.13.51) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 09:22:29 +0200
Message-ID: <c0dc5b7a-50be-4b4c-bdd7-ec6f92083070@foss.st.com>
Date: Tue, 12 May 2026 09:22:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <tanmay.shah@amd.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, "Shenwei
 Wang" <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB9PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e71eb21-8021-4d83-8b09-08deaff73b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C0J3qLL7sVkaqFzhoNnB2T1tPR5WriMJDYGJp6A6aQQZTX69JzyDQwioKvZKJRUWvZa5UxzOc2asbUYuuy5UDpkryc33Lgiy0Lqg1RZCzuo8wp9do930/1YhUA3VzxptpHjuu5obOOPQBC9y6PnXp2f7PIKchU36dsZx4+VCnijfK5Aw7dxfgDwv6s1xHrqOPqmMHju7plciDQo+RtkoVcgR9CmZnGYzrMtKmFUQCuWRMMwHsiz5soDUit0k66APamhJdrz1VIivokfLUsTtSd1R75QHt9K3crxe5cvfJficQObH4kG/T93wQlVSROniPl+MZ7CXrrMcw2ZXss2K/eJ0qz90X/iA2p1479MtLPbZbmgafvPNxAL78XswIgIqeV4Vq2YQ+FK4nuEDDtweXlIvZKJWUBj1vNIZvz5vRjbVZiABeBiWRtHfbCa+D4NUELNWALOf8pM2y17rc6VbfQ0M4GiiP7lasHu2AJoMPkyT1UJp93aUd1eCQIvPhgXNzk0nEdN+rB/fuydM9o9eBT43I54cm7U2p605Wt3qVtetvcZlEVtGW55jKRd6eHmdjuyR5NA/y5EeAHze3S/EKFssd8itEA8V3X4oFcsPUR6YwFSzlJNlM9tcfwB3V6Qvb/8OsyCS7ucTr/Jg4DfhNejpNDmyWsKg5EKVpslTpzOvRMX9P0Ke779/a6Z8KVTd
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bVtiIqSoF9pwSyv6C/BmQcI9qYWFUvsnie2aSbcdtFRpdfvmQpSGigNGW3Mqv+5hOczapxA9xlGT2eO5rc9MWh2ratAczCaHwpoESl/J98rOCTnfvdvzJGSFQC/6k8sXIRg8vke9/FpBdBUEnrjTSWuqoKhxNBpkL/o2lPSTijElZYzRe3JriVQJ/TyTYlUa5Q570M6NWbczxOSaco8UsMgBnQaiuo0AQCx2vuUS0j+BDZEFqXeWeShPVaw2F741HUU1fskmaZ4wBb9C68AIujYpNKKD9FNriR/RunPw3jFd4VubmPpetIViC2dDeDulVjNQDr5kMUiTgLdNx8Kc+YBhdJvNIGjKXEtRoFX+mOj+csSac1NoFst0Y+CRGXzsLypqoY2JrrcvlcDFk2q4hn4eZyeryffuUEXZF1gEJrZVxndrO4n7nrP5CyKRR0OT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:22:31.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e71eb21-8021-4d83-8b09-08deaff73b3c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7995
X-Rspamd-Queue-Id: CB57451BC2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36647-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,ti.com,nxp.com,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim,sched.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Hello Andrew,

On 5/11/26 20:18, Andrew Lunn wrote:
>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
>> GPIO controller.  The remaining issue it about the best way to work
>> out source and destination addresses between Linux and the remote
>> processor.  I'm running out of time for today but I'll return to this
>> thread with a final analysis by the end of the week.
> 
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
> 
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
> 
> Maybe we can get together and decide on the final design after the
> session.

I won’t be there, but I can join remotely if a call is scheduled,

Regards,
Arnaud

> 
> 	Andrew


