Return-Path: <linux-gpio+bounces-36681-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAWvCF1GA2ri2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36681-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:25:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646B523963
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA1FA3082B07
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21EB37CD31;
	Tue, 12 May 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A55qzcqL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416E3B810D;
	Tue, 12 May 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599286; cv=fail; b=FhS0h+y/HYrQymKD7bMnufmeJiLyyacOfkRMKqMWN3RgzhEkIQkGKOoBNX+TNjz+HKnXcHv9tQ5rYQ8pftL5z4eObrZtlXfjpTrW4UOI4Hb4McOq9XYvbcuvBQhEmaqEFZ9c+R/M/JlX8L6abqw6lq/0nAON3t6BzR5qs7EpVag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599286; c=relaxed/simple;
	bh=+AmSCqJZKt+pC9dIJtxOBW40oO6XkPuLhXrAs7g5j5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PkYc31nwzubPo/fqaflTenzSfRPuHM7xddp35UzmzVPXTJk+y6SINgjkfeC+EPm8uCrmG6wt9wa0jBJgmEP3kIuHGnm/siLaoWCdzbfbPXnuKkBpYjOyw+4jZW60fF33P5NmqDC2xMxbSVMbsXZp3jwDTwSSE3oY8tESoRbH2+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A55qzcqL; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOjbeisRBv02tetCTmyqsLvcPoKkh8Pq/Pfk9mqA5Qty9GfpgwahiVtE9T5MoNGL8aJjs/IxDgglGCKtP3hDEsBCv7oIq0a86LGbrLtileSxqu96ALuSQ4RzWJe5A1ntPvrxN92ex8y6X0R4O5JkkQ6ehuDddIBh6N+KHjNNAndIY+I61lmQMIw12Qiq7tYqFTDOzfuWuXNjl5/0r42vklW0kWrGnon3jSOOGK+i9cNNr/Wl9E+I1U/EhgOqML9k4FkCyFSmTuVywFEBO6KSzu2wLjQHy9ie/AO4S+Qb4j3gvMsIsu9HTekUpAeIK+efCA7OU9qlGwLBp7TlftNtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AmSCqJZKt+pC9dIJtxOBW40oO6XkPuLhXrAs7g5j5M=;
 b=ldwOxwYN4G+6gniMFmme0oUJkHOyn699nF8MsHS37kkDmUBrjLC0uMyoKHaqqBNjeL/Cluhm8D3sxWmywk6swb6lQ+pNw4e8HQl51/AKir0SiHfREdmMe90y8MPvV+TdASUjbMBglbvgoLl4KlzU5czoYdJp5i8kHwgEhG+zxxrXpSBUaz4i5ZkMjbe1AYrzf7LAZpHovPQZeioEUHuxQ/eL923OHhEv8adi7HU7MPp5CDMhe5MRNxHgLHb0zceVRkrZLpT9tXrHkvME+0tptdYUcILlBXE8h3go/bonuTMUgM4rkVEZ1xlmmvhng9ViEsIx+cnPy/eegEwGSTpPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AmSCqJZKt+pC9dIJtxOBW40oO6XkPuLhXrAs7g5j5M=;
 b=A55qzcqLi6VLladQ1iK1e6eI/5Q3scuMYXcFYbOnfCPsy+GiKOBy3+bA4x8S/u3XRVzD1gQ8Wk8m1bYKLWzqSu46iByh++glYZ1e4erA3PWAPKtEWs2r6ZeJBJyUnV2IRlLI92gfzCMz2o0Io12NjkIlabQLtBW6T/LnxS8EEcKOzgV8RqL88HptTX+bfrSD1qMLu62RMLByLgSZO4V6pNyzbBsi/RQjY9kZtNDbuYx0k62dVGRVA4AFdMTm0fDKuUb05a7vqGHKg4SuPKeXOGaVmcRcVXnFDHLDnh1ojCJ2GArrZPVDSKh8x81TmEKd1jgBg4D4/Q5jbVAAYAlpiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 15:21:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:21:21 +0000
Date: Tue, 12 May 2026 11:21:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6 0/7] pinctrl: Add generic pinctrl for board-level mux
 chips
Message-ID: <agNFaXbd_sMq5eAo@lizhi-Precision-Tower-5810>
References: <20260504-pinctrl-mux-v6-0-8ea858ba3a5b@nxp.com>
 <CAD++jLmXvnf6sSWsGe+++u37ONJpFFvxFMUkLdvvxiiaWuf9gQ@mail.gmail.com>
 <agIwOYrKXlnKbpII@lizhi-Precision-Tower-5810>
 <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=eqEaTcG7P=++Md7fqosmrGbRRPDb90+=Q4q8oQ=xqRA@mail.gmail.com>
X-ClientProxiedBy: PH8PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: a32967d9-ffba-406e-571f-08deb03a1f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	ax3HX1x4WJ7jDB8nZfUkMKsnkLzbut6f/YPImtSppkjoCcM/OPwkV4VkeWfM3DZ2zxYgTnMc+XeMuBlyrbtivyOSkZ/kXFXk89c7r2afYRbHCklY5vEh6vBN4vRcpZ3F/o9Ljc4EgEnLBBjfGhsuIXH04w5bRoZPv8vJfbBLfPZ9YfBYgeQdSs2hgeepVgYqNjS5nnA32djBXArHXSdlHkqDeR//ZIfZc5/1PdAkMu84Kn3VzIznn91zQ/vGyjIkWJmLbNwpcbhTtBS3eXaOeTN6gpBeiQbsQhFVoOvQG5xHqpGO1iafM3HyEF5WoiStMa79A2OqprnR4ONK/HTBHN1g+B4kzfj2giCnKJpK65pkzYXxN/MNMERNTs23OMWWMATsnfYh2xG5UE9QKtPrSD7kJdoL7OSZgMUbc4zpWjuEbkq3w3eN5KDI4UVMzFXXPoTP8jzS0dPEMk6KsZjY/y59nbtdSxzB1k9StO1yHLUKqRUufrE2dKr78Em0T7wGiu2mzFWJdU6rH/WoMTO/NCGSS7orpoTOsQPIo4XBNGBQkISjhK386FrWe6ewYWDyPrji1d8LvA7dJJ2zkIZNTP0n1Z+FJ/10Z5JIpx1S563/ZxNgl8t6FslrmlsC2S/koqCMbMsF3JLyHBBLMzrae5/W9um7kyAhAUIL7RtUJUKaGv1yoTHHswxffEcfVbSrn44eMcfV7yjEzuL+OTm7zZxl0HdbGwcXa65RbJRghQBtzridvPpAsf5QerW6YVPj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtaOXdWUUp0TTNFdXJxRTUxVXVtUUdZL3JWeEUrbHdrNW1yQy8yY25kYXhh?=
 =?utf-8?B?WDdkNUMyRDl1V24vMzE4N1RFYlk1NlFSa2g4VkZ3L1hWaGc0cjdHS1RVS3ow?=
 =?utf-8?B?cXZ5WnplUGc3cklCbUdpdHMrR0psNGJuWVhvS3lOajl2K0RSQm43WE9iSmdI?=
 =?utf-8?B?dEF4SUdTRmFWbjRTck9CQXZFd3JhNGpzcC9IeVVmOURuT1I1OEZlWFVqV1Vq?=
 =?utf-8?B?R2dUeUMvSlpZYkMxaitGdENGK3ZRS0NtUXc2L3BlL1RvcUIxanhwdndtQWt2?=
 =?utf-8?B?V0hkbmduRUZNdFV3aElTYlZyVEVMZW8zUjVlazhiZWFRK3NlSGE4dWs5SXhR?=
 =?utf-8?B?bVNESUJCNFNlVjFiMzVqblFNT3VkRmtEVU5MUXlDT3AxN3F2alZWUjVpY3ho?=
 =?utf-8?B?YTMwclU5L1Y5Yms0bDQ1VE5IcFBQV1VDZ0dheU1EVXBmcnBPTHNUejlEREgr?=
 =?utf-8?B?bUJ1Q053TTJEc3Jla3VISGkvMkdIdlRncTNXRm5iQmd5Mklvd3F4WnljKzBB?=
 =?utf-8?B?RDRDTVNTY0I2N0wvbldKV2VMd1dJd0xGQW9VWUZjQkEwUUVCbk5Ha3B0NnN1?=
 =?utf-8?B?c3FLd0RYd1NtcUFremUzZEJuV1RkWnhOUzRvbTJvbmZMSDdqK3pIem0ra29Q?=
 =?utf-8?B?LzdQK3VDT0ZZb280NXJmSDliMDkya3RRS0E5QTd3ajI4TUZqYWhrbXhSanZZ?=
 =?utf-8?B?NnVDUWZtZllmTTRRV0ZtNUFNSU9DTGdGNzdleFF0RXk3ODdhN05GMVRqTjdt?=
 =?utf-8?B?VEtIakcrajlDbFZhNFpONGdZN3VpYm1LSEF6UWEvUjdPMS9wSlE2NkkrVDAy?=
 =?utf-8?B?MGFJY0IzRmJzckJycml1NXVOUEdjQzdiVW9kb1Z4bmtFR2VtbEhMVU1HUU9w?=
 =?utf-8?B?WE5ZcmFrbUFLN25OY2tUYmRreW0vb1dIQW8zcTYvN2ZoUE1YeG9VbVZ0akMw?=
 =?utf-8?B?dktLYjFwZWRwdmMzQVdEV01KenV5Si9RMlRHL2R6MGZReXIvbmIvVUwxUE5o?=
 =?utf-8?B?YWZqTlBtMFBPeC9IQ3BNVTVqbGNqQmppOVFScFdndVd5eklIRFNDR1lFT1hB?=
 =?utf-8?B?RkRKZ21hWTFoUUNzbVVkSWhxbjZrN2k0cG5EWGQrVG1BcG50Z1ZKamxzSlZC?=
 =?utf-8?B?N2w4MTUvMlZxaTlRL1hLdk5Ybkh4RS9FMUdSeEFLUVpXTk5sOWMxWXhEelJZ?=
 =?utf-8?B?aFJpQnRJN3htWEkrQzFzSFBhZGVuR2RZZkl5TXZKeXVDUlZQR2lsVDQwcTd5?=
 =?utf-8?B?MWNydHZQRHRucUlGSENVQkM4MWJINkxUa3lZVXE0U285Z2dybWlWMmxJYzFh?=
 =?utf-8?B?VThSTnBRbGhtOU5wK1UzOE9ZaDVhN2NTdWtUWE1ONGVTRWpPbThlaWtja3B5?=
 =?utf-8?B?clBNRStIME9ER0F0N0FVZkM5a0cybS9Kekd3THZ0TUU3d2lhYnh6SVl0aXQ4?=
 =?utf-8?B?SU5QQTdHK25zRTNLUUhaZ2RyYStqMmsrRytwa1IxSW94Tmtpc2F1NzJLamk4?=
 =?utf-8?B?a3VSQWFLQ1dLZVVQVkhyMHNoN08ySEg3TERTZXduS082S1RyN0RpSUVjUXhZ?=
 =?utf-8?B?OGdJbk1QeWEyRTRTNms3czFvaGxGaXNEc2l2ekVYcTAzSEUrbzRxR2tQTzln?=
 =?utf-8?B?dThTNTRMWVpBTUFtcEJld0g2SkVVQkdMUVJoQjQ2VVNkQWt6dFlVTCtJelZv?=
 =?utf-8?B?WFo0dlowd201aGwvUm9ja0dXN1dLaDdHSHo0TnhVblZTVWYrTFlrVmNsRVZS?=
 =?utf-8?B?THFlUE9qMk5iQm5YNlNVaWVsYlo2NEpUV0xQUUpKdytDcC9hSERiNE50Yzc3?=
 =?utf-8?B?YTlZY3IvNWlHWDcwTHdtdXhxZjZPMW5odlRkam1yRGNtUE14aU15aW1zdkFT?=
 =?utf-8?B?OTAzd0dabXE4K1pUZE5qaTJkZG5QMzhOZUNJZ0RNWm8zWXN0b29hWDNDbHZh?=
 =?utf-8?B?VU81VkxYMHlnWGVOU0s4RWkxdUF3VzBoY2hVRGJ5Uzh5bXlQTnhBN2tyejB3?=
 =?utf-8?B?a1VKb2hoUFBOREgwVjZrY3MrQ2hhRENRb0dINk1iRktFTFlGbmF1YVZVK1dh?=
 =?utf-8?B?SjBoY0YxeUhDcEN4VDRBN0sxZk9MZGgxUHMxdXE5cytBMUE2N3ZnR2VEN0pw?=
 =?utf-8?B?ckZ5YTFJdHlXakwzNjhjR28vMTdwdFBxeVBvSXlRUk0yT05IaVVWQmJZWWhu?=
 =?utf-8?B?UlBNNlBOMmpDekhkT1l2bGlMVVFUUjliaTcycDBvNEdjZkpzZ0dlOVNmRmRp?=
 =?utf-8?B?ZjlRaXlZVEJ0aUlBR2grVEZXNllSSnY1OEtORVFMVGNoa1B4cGFES0hCbFgy?=
 =?utf-8?Q?Yu1U/aCB7daVjx1glc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32967d9-ffba-406e-571f-08deb03a1f27
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:21:21.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX6Zj5lTW/X1zHfKdjtwZZ17hU2x+xrit2M2pkiFIiEXT4C6aaZ2m/RpPcn2Q+4zQzZPszLUhXh6K0IdPAlI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452
X-Rspamd-Queue-Id: 8646B523963
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36681-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,microchip.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 10:34:35PM +0200, Linus Walleij wrote:
> On Mon, May 11, 2026 at 9:38 PM Frank Li <Frank.li@nxp.com> wrote:
>
> > I fixed a build warning by missing doc 'np',
> > https://lore.kernel.org/imx/20260507152117.240612-1-Frank.Li@nxp.com/
> >
> > Anything need me to do futher?
>
> Sorry was busy!
>
> Applied this fixup on top of the branch and merged it into my
> devel branch for v7.2!

Sorry, I missed picked up fix patch during rebase.

https://lore.kernel.org/imx/20260512144806.22447-1-Frank.Li@nxp.com/T/#u

Frank

>
> Yours,
> Linus Walleij

