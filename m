Return-Path: <linux-gpio+bounces-33592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPfMIpwIuWm+nQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:54:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9B2A5237
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F310308E4A1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 07:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBBD33A6F9;
	Tue, 17 Mar 2026 07:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JCsBCIRw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818F192D97;
	Tue, 17 Mar 2026 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733826; cv=fail; b=ssGlaJCaLZ9QlqVygusCTE4zf4JBiaq8XVqqlqSo2VQghZFbLoqfkanr+dU+s9SsgABBWOkd0KQI9yqnaAB6zJoul0ylyQSdznc2LoGhmnCWrL+qLZaL+xIVUJ3OmM5TOlDXblhQtP2F0bNJ5gAAWFc20D38NkXqFUVn+jMIsnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733826; c=relaxed/simple;
	bh=ZeNcKeW49BLowA9z0KqP+tN5BmsNUR2HM6Bl1VELR8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oENTrwyku1/TlrRDJSx4qCYNKyd9dObZXVOWlFEzOmQnY1mA0yn6UhIUxdfiFEVVaQIh7UGqwxavCNH5FTV9xU7JWgzyOgk1x+eppLh3m325FLzUoU3zEuG6kv70kJnuaNMahX+wKpMMokt7ZlbDSV1JVbpiWxMBztfkGeUhpjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JCsBCIRw; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFCvtRBSAKdlc9BccDCgtPhreyXIPuvsSNeb8jzHIVzprJ1uyH618hB/seTvOtQWqudiehVgF82jbUWWL6dgB6PWF8/8dS0XSFrQ+H1r6XA2VNdUDKcj3I9zOiLR4yMFpf6boKrZlF9W/lPzvtBrwoCVLjrRK0JpP3JiclWsoUTEFuYlaQOTXdXefJf21tNtDeIYfCWbuhC/ut2rHAg0l1ywJU2IRbvuMZaIUitLFQ40IPFzT+fi2D/xhDKn6FhVJ0zgJEzxF3SqB2mKAOCRnRUvrebPpfYv8kcr+sb8bg0/2JHTY9vT9XQRbGDOUOUtANgSyWgqIbS8M9Fc/UynXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IATFCaP6RbcaykxmDy50fSqw2abqojQ6sOWtaumK35w=;
 b=xKBsNumOy9vW8hCkSvKVvGlMOEhAfWssVqusNGTeVd8iqJdflsvQAScIapx+nN7Y5tW/xtOfAd5Muc4s8ksueDy3f3OEw4ZwT/T/SzHKx7xNJ3KRcbs/SYk8sZg5E98i/A5JomckMLamJPpH99kqbwXr9hrnIQYan5aJOiGLmt+I/ME3Ih3iRTlkq4yOMuWkU65f1ZGuRPktTcb1D3jQpFeSBziQ+R4tuvMG6PM5MKsKmoe9thrAbQZnTz+GSd2ntCrbU+MAwle098nDNFjA3hJMeGQwVbS8MQgmVY2eIbpcE17+g9RiRXSiHuZldZDR+OpGQKsoVv5zHW5SgEHWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IATFCaP6RbcaykxmDy50fSqw2abqojQ6sOWtaumK35w=;
 b=JCsBCIRwl2buzYRhycmTcRuC6mTzlh6ulcoDCkZ/iwEPl6IBN+NE/9gCJ/4htZPHiM7u64xpzmwbDF2XNAHuyDViQKQkehiRmVicnkjWG/AOFAm/rEVoE2abw8GNAi5xZkzmTMX1aY0aKB5NzKMu183l6kC6lDp6f0vzk1q8SdRHXnTxAisj4ISdyjtiSFMzhZS/L8TrNM8jHujNhKWulZuOMjbqFmK7UXNkoI7vCSah3idkG7WaRy0grLobbc0ucYvYZdsMdYdTy9Az6kZQC5frtWdn2LFl7vfNF941aDabGrKGXiaTdp2KiagaTLpUzXz0cJaUCkPvvz/360xPCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV1PR04MB11527.eurprd04.prod.outlook.com (2603:10a6:150:280::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 07:50:20 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:49:50 +0000
Date: Tue, 17 Mar 2026 17:05:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Greg Malysa <malysagreg@gmail.com>,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Ian Roberts <ian.roberts@timesys.com>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	u-boot@lists.denx.de, Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v2 4/4] gpio: scmi: Add gpio_scmi driver
Message-ID: <abkZVAGMB-AEnE9i@nxa18884-linux.ap.freescale.net>
References: <cover.1773256350.git.dan.carpenter@linaro.org>
 <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e1dcb617917dfe69efce0b3407f8786e4c971d.1773256350.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To AS8PR04MB8450.eurprd04.prod.outlook.com
 (2603:10a6:20b:346::5)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV1PR04MB11527:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff4b263-8a01-497c-63a0-08de83f9d144
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	jIWaPRm78HaUNvvM5N7JubVvjG3b7B6knXghrnIxuyW8bUriB17NDbgBYjQJCH0IPBrKo1w+rWqx+q2IPIy13V45qJv/Ls+y7gzRscGmYDlBK4LQCAwuLggleWnyVXCU8EMhMM1N9epASWAg66tvpfUvjBVWnnWaUp5daJ2ccM0C6lNONcwBhqHJvPH9PDxfrIIhUWpCVB/o8ex9DvvhcwPVlZgtMh1/1IUkPQARpcng3HByH8h57LUlAvlBXda8+YKjNylxBSQ/vlh2q4Ucdch9x+xHImPsaGQvsLSZ4wJUNG1eZCcyKOLpyT3pPxOlbKRVNNpwwD5DhSi9eebXmXfJArSxZwUGGPTNcL2R9g4X+5HLis1xDzRZCkxXKMhuQScB4amEGM99AEtHeenFEta5ORwrwg01HC6EnWHJMs7KupWzIS6xSx5S94QsSEnpAQjHaFVTz5t2e6XnY5bNvAuc2Ql+tMxVN9JOx7Ly37lqTqWpMrK+USc3T+fJQtF6f31G21mAdIfFSffsCu9Mcf0YPrHaLXjEaGWMHtu6GC7G4aXQuqyiJGg/d0qCgUUJspUGZoW2z3esFqMIMZeKQVz2IiMmToB3Z7MLGov621toOPQI/tc8JXtpOMgcMotI/8mgH85OzDVJTKj8Xm8DEUzIBfukVYgjf7hyvyt+xV1f6XnZOC/vPhBf7Y0bSY9dfBziriXSmJWfw37lDb6sjgIFPOT5sv/MaoJM5TDW/8bVgYYVcvlIM26oKFK9ahrO3Dcuvh406e3PiHr5Rw0DW50qahdK/z/NoDtXe/p+j20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gWj1bnjLGA5+6ae+uMlDQ5TW2OGMlrcPOIPQ9gKTnmUu/UH6WKp7wX+6rmYn?=
 =?us-ascii?Q?PCjT9xlSj5FbP61gIgilcW5zgEN8VbjvwGHQIgmGc8p0J6q3ToyU5k7/1GvM?=
 =?us-ascii?Q?OZL4iDOnMhdmKTxLbi4dCbnl9+aArnf5jOK6djSnDAmj7UjVMTmxEjOwEA0R?=
 =?us-ascii?Q?G3CbBFcjAbLBWMJnRMUbma4BDZPqF3VrYx0hShvmQkyAg3Lb6FIFjLGUoaB1?=
 =?us-ascii?Q?NYvB40hdNCTDGKbWWN7vd+RYD5HVIt3kKXD9aUgK9tpaEqJjl9ondLeUr/Cq?=
 =?us-ascii?Q?SPiADBUeOzHceMzCIFY66/tI4fOhRuwsC1nVKwbiOaibSx+waGXnbc91/8k0?=
 =?us-ascii?Q?EXXpfZXppGazAAdGri4IAWrpm0qblmVT6oe8j+tmErn4hA4rldHILTfVzkW4?=
 =?us-ascii?Q?kwY+qyCgeON32XoCbfDA+q317xr3jn95VL50AkZ/g5wtv4HEhA/kJW9lWIh9?=
 =?us-ascii?Q?DQpz7MoIPDpSNXU4KdOoOoGwhPuscyj14awSJKHob0eiK1sGdwZEbOqPW6dV?=
 =?us-ascii?Q?xamHVgWXbTJfsMyMeX7ENeab1+ip/lrUchkxO38sRg5N7Pr9U+ZEgrPUZ98L?=
 =?us-ascii?Q?N07J0rFygeBZUsdCsGsWtjKHAjno+nfidgJLI7H7oo0xREjJ3gWPmouiO1xh?=
 =?us-ascii?Q?lQUrJ7LCcgFIXgFfgdjH3+VQJ8Cl+ZkELg9/b8WTvISbS65ZM0W/VY1l0fch?=
 =?us-ascii?Q?vdOWHDqOGhmO0mJDNVHJuepS4G+b4RxabwVM1U/Swu2Bc/AUXgmtVl83nfly?=
 =?us-ascii?Q?kEXd6A7NDfNvQkLiBxnN8ljI09uXov8mkR6FqOGUZP86hKB/3j0U9YXLSc1o?=
 =?us-ascii?Q?RjlgXs6dHfde/NU+avyJ/2dYnVno8gNozK8W4dE822LPM+NpZ+YviHR1xUWy?=
 =?us-ascii?Q?F1tdDqBPSzWEYQaGm/fJozFYgXS2XNwYUZdf97467JYve1BcJ0Ulmdrd2W3P?=
 =?us-ascii?Q?UThjRjHw+kh2xfvBYcd5K7Aytkfu2BUd0AvNRubT9E/hJj19jHxHLeI5LBSt?=
 =?us-ascii?Q?fGZLxyGIvh7MXcQS9HpqYQgysuge7XOis5299nJv5/ThxezyX/Knjl+Jgxrt?=
 =?us-ascii?Q?P4B0eIhOzRRFnrXhadJxTAjQBhOvs5K6vhKU16ZcEX/Fh9Aux9q6lTYJlN8F?=
 =?us-ascii?Q?iG5RchZhVmBnLWgGS8lSuw0HEm5HYf6PuBuExRQn4eBOCZJuMIVznCKMZMYX?=
 =?us-ascii?Q?tlB6aCtVaWATr/z08n9476cpeY7KmGDy7RWxyEQk3bYHnkTzExut3KeNdwar?=
 =?us-ascii?Q?VBgQrj40DP3nHSmzfrbD+1VqvqOAVCTetfhdrD2QzqBQogJpl4DOfm7gZB9x?=
 =?us-ascii?Q?9g69vp7x6pDtyK4L3vugRC3gjs3b7ulDvwJo9lMGu1sFURTGVZlpIDm7M7E4?=
 =?us-ascii?Q?dd2DyCRICmlK0n1nDHQcFvv0XwAdhHdEIft0GmBNZjfm7BgqpxAZqezbwfYl?=
 =?us-ascii?Q?sfYr/YarxyyByARcm/C7od7gomob0t6BQbSBwRzVOuRFIOkYVUPTb6SCqxdC?=
 =?us-ascii?Q?OfiRh71qnPdx7H2gdnQWacvc2z7pBomDjsK2ONQmRJ8200i8kG4mJtaC1ksl?=
 =?us-ascii?Q?dZM8gQrBk2wsbpg1seKH6moUOMsMNiw0m+1w3/79zcdwpFqZJEokjKVKL2+F?=
 =?us-ascii?Q?/sOdyVl7EJMtrjuCu9S7pLq3ws/8BMJtQJxMdVwP5d8P2PP4E4yCq11IstTG?=
 =?us-ascii?Q?ekTi5OXxuiKLiceWwwKFTtD05IbR+j/DziTQByTr0VigN7VR0DwkbtKoNq9U?=
 =?us-ascii?Q?08cyPDOF8g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff4b263-8a01-497c-63a0-08de83f9d144
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:49:50.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dA+9baGTS8WV34n5gStOOF84BXB2XsQyzoQxqsydji6xlX9PEz3q4xW1wnQ3aSrCVpFchrArKOl8wZs1Ivjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11527
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33592-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com,nxp.com,analog.com,timesys.com,googlemail.com,microchip.com,linaro.org,altera.com,lists.denx.de,intel.com,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,NXP1.onmicrosoft.com:dkim,nxa18884-linux.ap.freescale.net:mid]
X-Rspamd-Queue-Id: CDF9B2A5237
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

On Wed, Mar 11, 2026 at 10:41:36PM +0300, Dan Carpenter wrote:
>This provides GPIO support over SCMI.  It is built on top of the
>pinctrl-scmi driver.  The device tree entry would work the same as
>in linux.  Perhaps something like this.
>
>        gpio1 {
>            compatible = "scmi-pinctrl-gpio";
>            gpio-controller;
>            #gpio-cells = <2>;
>            ngpios = <10>;
>            gpio-ranges = <&scmi_pinctrl 0 8 4>,
>                          <&scmi_pinctrl 4 12 1>,
>                          <&scmi_pinctrl 5 15 1>,
>                          <&scmi_pinctrl 6 17 4>;
>            pinctrl-names = "default";
>            pinctrl-0 = <&i2c2_pins>;
>        };
>
>The &i2c2_pins phandle from the pinctrl section does pin muxing
>and the gpio-ranges property describes the pins.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Peng Fan <peng.fan@nxp.com>

