Return-Path: <linux-gpio+bounces-39214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3t9JNO69Q2oIgQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:00:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 110496E48BD
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:00:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=GfRbbJOG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39214-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39214-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E346E30B855E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C74416D02;
	Tue, 30 Jun 2026 12:54:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738640BCA8;
	Tue, 30 Jun 2026 12:54:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824065; cv=fail; b=u/6ImiaoH9NTLk14WucO9p8lOefC2RWxTm6PmGVKzAG8YtOJKXKtXz9lBlESwbVlY+1+5Do23dPGaAdGcbd+tm6gAarNdNHEAcmM1My7gHXR+oQdvEBaPP3GcRlUt7pRO1io/kEvbu1MP49FyJaghDhaEI6u3veDY6SjRsv0c0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824065; c=relaxed/simple;
	bh=H/l+GUYn2y8niCizs+qGGDGv5e+ONYl1T1mkHnX3kZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=efBjzYpqx5Rl3Ru6kd8e8mM0Z6DXccI3CCrJRY1F5TlE3gy7wuPBW0Y9ZMQ83uIDM5dgOI4EQEY372x4M80JiqquCXJ0eGnuKw27AVmJ3dBjBIbqhnHAbax0PE8IsM+VQz3bwslk+feEsxX0/kMjAJ8uo4GxrPP0g1PW7+I84zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GfRbbJOG; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxN8+G65j5Eb6MK9Nb1cwR2ZjzKngcMdpLh0s9Hr1xGjKZIHRy8Kph7t1T3uPg2smmyaSUGQt1E+E5TayfL90yNO3LzWTR9wq3e0g7jvm/IeC1wIqJP6YdpYTLR1+Ni6A6ynk0q/3Q69gK07oPqX3BLxToVT3NCr7SaaGLb4I9SnM6O390av9xTBAICfYqF+S7+sMpehcBw5c8MPCj++Kk2dI+6MCeqbOUTT6wTWVr+l93DSWMpHNZRYU6oRaerdEfU0/RnUPN0Soqzqf0jl2aGsSoP5wOmSuks3k1w2cXXXXNGifW6PskDMu+Zd4glYwYKvsU6PpGa4ZL/wg95RHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVTimc0urPISuETDZsisz2HappPZ4/OTLebF2HZYK9s=;
 b=YC+bchy26Jxz16S5smB0/2svQmfGOQ1JcOzpqdyRIP2OIroo271yvlwF4S8FCgVU0OeUx3BTVJeScF26/kV9do1qbCDSKbUEuGwCgKGPSpMa/k6HLexzRxIB8iXxhh0dwb2evpKX1lPI4foKw75TdSkIxYI5+o+zonXhzBb9MoPVU5sGunTbWwiX70cVrsveaSGhx8v8CqhDNVu8fvD0J7Rx64n1DlaND1+RNf2zqWtxlM8M/8aRBGqsQPdz1ufKEOYnEY3rfHRHL59nexcN63op7sXfd4/I1oxTtTmqpwLSR12hQ+NRI6E7Fca1rgeBRs9RgC0q/crTNU1T7Gkl4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVTimc0urPISuETDZsisz2HappPZ4/OTLebF2HZYK9s=;
 b=GfRbbJOGrTKGuZ5RPFQw4qM4WReZpbW4iA5/GMo6ndgFP4KMGpFd4UsACb0rMwLSgI3d+hkPyxZqnxUgkWscDmYvOYd44R4y905GdAlGY7pwcZ4IqfkyIPeDSVvLbPLNXcakY55t4Tc1miWSBM1j7KKtl4n2ojQRILkHf60+FHoRRsxDgi4K0/2kNIRSg8wH3eFyQJnJjELgfv3aYQZllf+KRDhx5RYGyubJWwVMqGLgNSNWrXDAjhhX/RWmV70N8yaxsobTdMCpsaBI+JIh5bM6YyjlM4W/VRa5/E/LlJrRSsfVQquIxqCLdvoOrKHIPoIzAI7tm0cyToOfJ9q7YA==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:12 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:12 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 5/6] pinctrl: s32cc: implement GPIO functionality
Date: Tue, 30 Jun 2026 14:54:02 +0200
Message-Id: <20260630125403.546375-6-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 77967723-912e-4569-458f-08ded6a6af28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|3023799007|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 2Ga/haUdMgUR8a7g89oI+pf5R2B99Rfy8T0/vmOFqbDz/raam8aTnHT0P24YecFgpdNixs65rJ8IouAhbglEkRajMndzaIJH6QjZyh12HKYgAUUloO+Fzn6IkMCS4SBGf8/bLRXxI+wcVZKsjCQgH/fj9uANjVpjnPhYhb+LXPrx+38bHK0l+8H3r6MinhdNkFdmdCmdkSmiHuYKI17SmyBmZrx3tVKYI15yHsSycUxzjWzrOLMYFRAwn9r9QNKvx6e/IzdiL/f1YFgfBeLuMgeQWBYD2AxY/+Y3VRGuBIFICyHlyjccPJoy5DRfB4CWFbBxR4s5YiZbEN5Z4HQbHF1MVroJrgrscFy3dSerWfnVFwXCMVVvcQzaSNuOze1Rv+FZrmJ+fMzYBgXxlxLuSl8AgNw7eWYXVUSdsY0/vC4RfbQhP9/4KMz6oBpKGhnwMOigV/aWEOxsYJamEgIDKoIx3yDxFV9JQwGsW80kRMka6vOUh7/C9uCAJytdcAuxhdG0wfekjke91b+e/YApUg3X4VOKZp9I+zBAQgdgbXH57lVIh1vtqi59WUoiv8BEuLHpVAbHCbT5crtxx5LfnRzbCZjbakn4F5aKNbk44Wn4JLTb+YJRs5tXgIbo5t19t5vnvbZiLXAaSkhYA3Delz9Kee+BagriPjHLC9V4pis=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SGFSRktDc3A4T3lRNDhpVEZaNlBpMytTMzNqNEgvUEZsb2N0L1VBY2FUeVBE?=
 =?utf-8?B?SkN6bGtPR01hRHFLZml0TEgxbVY1OWVsWFlBMTV4MHVQSEpidWhwVDRNMmp5?=
 =?utf-8?B?VUFXUk1STnJoWHpMT2ZPZlRVV1g3NVVRWVM2T2l1cXkvOTdmMWNpRWhMdGRy?=
 =?utf-8?B?VlQwTERKZk9VUEpXbldQMlMvcWJCR21kT2pTdm9Ecy83Q1l0UWRUQVpjRVB0?=
 =?utf-8?B?Zm1uTEJhYjFkTFYrbE05bHRwRWNlZEw2WWdBeS9JLzNFbWV3eHlrQkpxWTU2?=
 =?utf-8?B?TU8yVlNtcEJoL0h0K09RZno3UWtuVmZZUm5NUUY2K1lQZ2NGQVFCQTNyMXpu?=
 =?utf-8?B?Q1lrR08yb045UlhaeVZDdlVHNUVSTW53Y3pOZ2Z0N0djRmtvYmJtTkZGR1Bl?=
 =?utf-8?B?di9zVUhEc3QrTENYZWV2TS91Q2lFcXN3WmRHb1UxMzRzVUpiMkh3UUc5UlZy?=
 =?utf-8?B?anAwMERHWUkvaTlsbFBZaGN5TVVLRHRva29LMmdWelZHU2FuQmpST28vcUtN?=
 =?utf-8?B?S2l2ZEZKYWFyWU1MU09XdWRJU2RQZk00MUNJMjJrbng4ZDFObXVPNXk1NkJJ?=
 =?utf-8?B?bkRDdmprWFRHd0hLNzFIZWx1a1lQakIyMzNTT2VnY3RXMnk0YWRlR3NIR3Nv?=
 =?utf-8?B?SjdkVDAvUW5WWVFya010L0puMWF2QUpaNlpDYWdmRGcveHhLbkpZMEhvVzln?=
 =?utf-8?B?M3RpK3BYL3dxdnM4TDR6QWFrU3d4VVJMM2FpV1E0VVFFaVV4eDArazNXVk1Y?=
 =?utf-8?B?aytvdTBhNDVqZGZMRVVhWmdiUVMvZmIzQ0t1L2lWLzRobUZLSVJxcVp6NURp?=
 =?utf-8?B?QnM3cVhqb21yMU5XbTVuaTRnUGxZT0tsMnZPRVRBMW93NHZVaFdQSWhYTVNm?=
 =?utf-8?B?a05BZE50UTdJejRNelJmS2h2K2FpT1JYVUYrSmp2WmlwZktEUExxRGdrMmFJ?=
 =?utf-8?B?UHNZZ2l6dEUySlpWTnIvRWtqUTJNN3dJbFFPODNXODNBOUlYbVpEbUxFWW93?=
 =?utf-8?B?WXRkRkg5dW5Mb1JWb2doMndCTlkxVEU0VktyM2dMYkdPM0N1VVdDU29pNFRs?=
 =?utf-8?B?SGs1Q3lJdGV6aFRLNW1Ba0ZsYmg4VVJYV2NiSWdZTWF4bUhldm9rUnNnK21Y?=
 =?utf-8?B?c3ZrdmNxN0dHOFBVYTlONXpkKzBGTU16QlNjUEg0dlV2OTVjVjZySmRXVWdC?=
 =?utf-8?B?enlNMmZYR2Jmd0ZIYWd0L2pwU0RJK3dLM2VjRGJ0aWpQaWlHbXBLVERYRW1l?=
 =?utf-8?B?UVN2M0s3RFFsQkYyOWhXdndMVFByaWZZUmE5OU0vc1g3T0tSNUZzcGJZK2hl?=
 =?utf-8?B?MVhPTk01akQ2M1hadFcvVDRUQTByNlJLNzdyMTdBWHJyMlJmMENaUjc2U0Y5?=
 =?utf-8?B?blRTVE5MckVER2lYUXhscktXa09oOWZhZHJaNUV4Z1dCWTBNZDV0dWpUbC93?=
 =?utf-8?B?OVFWVEN1WU5CdXA4aTlKeFAwbE9oUTFnUVpxaktNNkgxOU9pbGx1SU5uZjdO?=
 =?utf-8?B?S2xwZXZoYkFQVnk5OVZmQzlXYXdLbzFmV2RXWUl0STJhcXppR05zajA1dllv?=
 =?utf-8?B?VW5RcXJ5Ky9hMWc1WWl3U2JKaHZHVFZIQ24rSER1ekNPbFFvY0V2WUZpdy8v?=
 =?utf-8?B?WUlubzBVZGREUFN4NFNxTytia2Rpa21meTFVZlBxRHR3Mkh2Q2Yra2lzOXlH?=
 =?utf-8?B?VWMvT1dsVjh5Mk5wREtuNDhNUllHOHVjQS9kOTI4L1VXbFlQMk1ndVRTRGhv?=
 =?utf-8?B?UURhZHhEMGk0S0Q5dGNWYnJhbFJiWmFDMEkxVWVsYlBuaHFhVmViTXJTZ25F?=
 =?utf-8?B?ZHIwcE1Xb0ZLTmlXMFMrN3h3L3grS0lkVndqeDNjSCtJZjhwY2Fad2tmWVU3?=
 =?utf-8?B?SHBveTdvQWNLbHN4TmkrUmFHMmFFVWlqRmlDQXZxeFJDclB5dHM2NWdFTXNO?=
 =?utf-8?B?STV2bENtWEtwV0ZIYWlyVzZGWDhuNlphUkZBYTBPRHErSVNZQ3R2NXJURFFM?=
 =?utf-8?B?OXl3eEoxeWZlWjVNTXd6VW9JVHUrL2RwYXN6MmRjOGNqbytSbHZYeVFPMXNE?=
 =?utf-8?B?ZlVJQmtNQzJCNC81dWxtdUVSNTVVTFY3dXVJNUczeGJHUmlQNVVCQjQ3K2Jp?=
 =?utf-8?B?MVBOTWVWTk8xMGQxVkdYNWVabzhqZ3Z0ZTNyOHY5RUFVTm9vaHNYOTYyZnFT?=
 =?utf-8?B?ZXozZ2swNmRxaG1zYU1POVpzbGF1bnhneVNiamhSTlJ3U1luR280QTdST2NH?=
 =?utf-8?B?YUEzanBIYktIeWdOcmUxYlJGM0FGb1hRd2JKWHRhb0pTZC9WS1N1cW1ZZ2hH?=
 =?utf-8?B?elQyMkp6TmUwUDZTN3hzOTh4MVpTaDlKbC9CWFhxSkpRby9EeTVITkdzbEla?=
 =?utf-8?Q?QVgKMzIewfS3aUTJNqFGDbS1pRv3S5JWmL2Uc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77967723-912e-4569-458f-08ded6a6af28
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:12.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVH7f85KdNPZX99OQKctPybonzyI+nS1JJdvkWZHmNC3l7/N4ERFnzVNqpG5HYL+96HBwPQX/Uk4x+m+01xj+jz2ogzPQ0FJ1F/uN/7wsxgmC/iHPuuS+f3Z1bPrMbzG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39214-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:mid,oss.nxp.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,cfg.name:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 110496E48BD

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

The updated SIUL2 block groups pinctrl, GPIO data access
and interrupt control within the same hardware unit.
The SIUL2 driver is therefore structured as a monolithic
pinctrl/GPIO driver.

GPIO data access and direction handling are implemented using the
gpio-regmap library backed by a virtual regmap. The virtual regmap
translates the gpio-regmap register model to the underlying SIUL2
registers: MSCR for direction, PGPDI for input values and PGPDO for
output values.

The existing pinctrl GPIO callbacks are used for the request/free path:
they switch the pad to GPIO mode on request and restore the previous
MSCR configuration when the GPIO is released.

This change came as a result of upstream review in the
following series:
https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com/

Support both SIUL2 DT layouts:
- legacy pinctrl-only binding
- extended pinctrl/GPIO/irqchip binding

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/Kconfig         |   3 +-
 drivers/pinctrl/nxp/pinctrl-s32.h   |  35 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 701 +++++++++++++++++++++++++---
 drivers/pinctrl/nxp/pinctrl-s32g2.c |  47 +-
 4 files changed, 717 insertions(+), 69 deletions(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index abca7ef97003..711c0fe11565 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_S32CC
 	bool
-	depends on ARCH_S32 && OF
+	depends on ARCH_S32 && OF && GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select GPIO_REGMAP
 	select REGMAP_MMIO
 
 config PINCTRL_S32G2
diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinctrl-s32.h
index 8715befd5f05..028578a090e4 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32.h
+++ b/drivers/pinctrl/nxp/pinctrl-s32.h
@@ -2,7 +2,7 @@
  *
  * S32 pinmux core definitions
  *
- * Copyright 2016-2020, 2022 NXP
+ * Copyright 2016-2020, 2022, 2026 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Linaro Ltd.
@@ -34,11 +34,42 @@ struct s32_pin_range {
 	unsigned int end;
 };
 
+/**
+ * struct s32_gpio_range - contiguous GPIO pin range within a SIUL2 module
+ * @gpio_base: first GPIO line offset in the GPIO range
+ * @pin_base: first pinctrl pin number mapped by this GPIO range
+ * @gpio_num: number of consecutive GPIO pins in the range
+ * @sparse: true if the PGPD layout is non-linear (resolved via pad map only);
+ *          pins not found in the pad map are invalid for this range
+ */
+struct s32_gpio_range {
+	unsigned int gpio_base;
+	unsigned int pin_base;
+	unsigned int gpio_num;
+	bool sparse;
+};
+
+/**
+ * struct s32_gpio_pad_map - mapping between GPIO ranges and PGPD pads
+ * @gpio_start: first GPIO line offset in the range
+ * @gpio_end: last GPIO line offset in the range
+ * @pad: PGPD pad number serving the range
+ */
+struct s32_gpio_pad_map {
+	unsigned int gpio_start;
+	unsigned int gpio_end;
+	unsigned int pad;
+};
+
 struct s32_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
 	unsigned int npins;
 	const struct s32_pin_range *mem_pin_ranges;
 	unsigned int mem_regions;
+	const struct s32_gpio_range *gpio_ranges;
+	unsigned int num_gpio_ranges;
+	const struct s32_gpio_pad_map *gpio_pad_maps;
+	unsigned int num_gpio_pad_maps;
 };
 
 struct s32_pinctrl_soc_info {
@@ -53,6 +84,8 @@ struct s32_pinctrl_soc_info {
 
 #define S32_PINCTRL_PIN(pin)	PINCTRL_PIN(pin, #pin)
 #define S32_PIN_RANGE(_start, _end) { .start = _start, .end = _end }
+#define S32_GPIO_RANGE(gpio, pin, num) \
+	{ .gpio_base = gpio, .pin_base = pin, .gpio_num = num }
 
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data);
diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index b9b757e28bff..35e2f8a18ef2 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024-2025 NXP
+ * Copyright 2017-2022,2024-2026 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -39,6 +40,40 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+#define S32_GPIO_OP_SHIFT	16
+#define S32_GPIO_OP_MASK	GENMASK(19, 16)
+
+#define S32_GPIO_OP_DIR		0 /* MSCR direction */
+#define S32_GPIO_OP_DAT		BIT(S32_GPIO_OP_SHIFT) /* PGPDI read */
+#define S32_GPIO_OP_SET		BIT(S32_GPIO_OP_SHIFT + 1) /* PGPDO write */
+
+/*
+ * [15:12] = GPIO bank / gpio range index
+ * [11:0]  = real register offset or pin id
+ */
+#define S32_GPIO_BANK_SHIFT    12
+#define S32_GPIO_BANK_MASK    GENMASK(15, 12)
+#define S32_GPIO_REG_MASK    GENMASK(11, 0)
+
+#define S32_GPIO_ENCODE(bank, off) \
+	((((bank) << S32_GPIO_BANK_SHIFT) & S32_GPIO_BANK_MASK) | \
+		((off) & S32_GPIO_REG_MASK))
+
+#define S32_GPIO_DECODE_BANK(reg) \
+	(((reg) & S32_GPIO_BANK_MASK) >> S32_GPIO_BANK_SHIFT)
+
+#define S32_GPIO_DECODE_OFF(reg) \
+	((reg) & S32_GPIO_REG_MASK)
+
+/*
+ * PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 enum s32_write_type {
 	S32_PINCONF_UPDATE_ONLY,
 	S32_PINCONF_OVERWRITE,
@@ -72,6 +107,18 @@ struct s32_pinctrl_mem_region {
 	char name[8];
 };
 
+/*
+ * struct s32_gpio_regmaps - GPIO register maps for a SIUL2 instance
+ * @pgpdo: regmap for Parallel GPIO Pad Data Out registers
+ * @pgpdi: regmap for Parallel GPIO Pad Data In registers
+ * @range: GPIO range info
+ */
+struct s32_gpio_regmaps {
+	struct regmap *pgpdo;
+	struct regmap *pgpdi;
+	const struct s32_gpio_range *range;
+};
+
 /*
  * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
@@ -98,6 +145,12 @@ struct s32_pinctrl_context {
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
+ * @gpio_regmaps: PGPDO/PGPDI regmaps for each SIUL2 module
+ * @num_gpio_regmaps: number of GPIO regmap entries
+ * @gpio_regmap: regmap bridging gpio-regmap to SIUL2 registers
+ * @gpio_rgm: gpio-regmap instance registered for this controller
+ * @ngpio: total number of GPIO line offsets
+ * @gpio_names: GPIO line names array passed to gpio-regmap
  * @gpio_configs: saved configurations for GPIO pins
  * @gpio_configs_lock: lock for the `gpio_configs` list
  * @saved_context: configuration saved over system sleep
@@ -107,6 +160,12 @@ struct s32_pinctrl {
 	struct pinctrl_dev *pctl;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
+	struct s32_gpio_regmaps *gpio_regmaps;
+	unsigned int num_gpio_regmaps;
+	struct regmap *gpio_regmap;
+	struct gpio_regmap *gpio_rgm;
+	unsigned int ngpio;
+	const char *const *gpio_names;
 	struct list_head gpio_configs;
 	spinlock_t gpio_configs_lock;
 #ifdef CONFIG_PM_SLEEP
@@ -356,88 +415,84 @@ static int s32_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
 	return info->nfunctions;
 }
 
-static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
-					 unsigned int selector)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct s32_pinctrl_soc_info *info = ipctl->info;
-
-	return info->functions[selector].name;
-}
-
-static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
-			      unsigned int selector,
-			      const char * const **groups,
-			      unsigned int * const num_groups)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	const struct s32_pinctrl_soc_info *info = ipctl->info;
-
-	*groups = info->functions[selector].groups;
-	*num_groups = info->functions[selector].ngroups;
-
-	return 0;
-}
-
 static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
+				       unsigned int pin)
 {
 	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
+	struct gpio_pin_config *gpio_pin __free(kfree) = NULL;
 	unsigned int config;
-	unsigned long flags;
 	int ret;
 
-	ret = s32_regmap_read(pctldev, offset, &config);
+	ret = s32_regmap_read(pctldev, pin, &config);
 	if (ret)
 		return ret;
 
-	/* Save current configuration */
-	gpio_pin = kmalloc_obj(*gpio_pin);
+	gpio_pin = kmalloc_obj(*gpio_pin, GFP_KERNEL);
 	if (!gpio_pin)
 		return -ENOMEM;
 
-	gpio_pin->pin_id = offset;
+	gpio_pin->pin_id = pin;
 	gpio_pin->config = config;
-	INIT_LIST_HEAD(&gpio_pin->list);
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
 
 	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
+	ret = s32_regmap_update(pctldev, pin,
+				S32_MSCR_SSS_MASK | S32_MSCR_IBE,
+				S32_MSCR_IBE);
+	if (ret)
+		return ret;
 
-	return s32_regmap_write(pctldev, offset, config);
+	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
+		list_add(&no_free_ptr(gpio_pin)->list, &ipctl->gpio_configs);
+
+	return 0;
 }
 
 static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
+				      unsigned int pin)
 {
 	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
+	struct gpio_pin_config *gpio_pin, *found = NULL;
 	unsigned long flags;
-	int ret;
 
 	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
+	list_for_each_entry(gpio_pin, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == pin) {
 			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
+			found = gpio_pin;
 			break;
 		}
 	}
-
-unlock:
 	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+
+	if (found) {
+		s32_regmap_write(pctldev, found->pin_id, found->config);
+		kfree(found);
+	}
+}
+
+static const char *s32_pmx_get_func_name(struct pinctrl_dev *pctldev,
+					 unsigned int selector)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	return info->functions[selector].name;
+}
+
+static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
+			      unsigned int selector,
+			      const char * const **groups,
+			      unsigned int * const num_groups)
+{
+	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct s32_pinctrl_soc_info *info = ipctl->info;
+
+	*groups = info->functions[selector].groups;
+	*num_groups = info->functions[selector].ngroups;
+
+	return 0;
 }
 
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -649,9 +704,9 @@ static void s32_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 
 	ret = s32_regmap_read(pctldev, pin_id, &config);
 	if (ret)
-		return;
-
-	seq_printf(s, "0x%x", config);
+		seq_printf(s, "error %d", ret);
+	else
+		seq_printf(s, "0x%x", config);
 }
 
 static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
@@ -669,8 +724,11 @@ static void s32_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	for (i = 0; i < grp->data.npins; i++) {
 		name = pin_get_name(pctldev, grp->data.pins[i]);
 		ret = s32_regmap_read(pctldev, grp->data.pins[i], &config);
-		if (ret)
-			return;
+		if (ret) {
+			seq_printf(s, "%s: error %d\n", name, ret);
+			continue;
+		}
+
 		seq_printf(s, "%s: 0x%x\n", name, config);
 	}
 }
@@ -683,6 +741,477 @@ static const struct pinconf_ops s32_pinconf_ops = {
 	.pin_config_group_dbg_show = s32_pinconf_group_dbg_show,
 };
 
+static void s32_gpio_free_saved_configs(void *data)
+{
+	struct s32_pinctrl *ipctl = data;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		list_del(&gpio_pin->list);
+		kfree(gpio_pin);
+	}
+	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/*
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static int s32_gpio_get_range(struct s32_pinctrl *ipctl,
+			      unsigned int gpio,
+			      unsigned int *pin,
+			      unsigned int *bank)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	const struct s32_gpio_range *range;
+	int i;
+
+	for (i = 0; i < soc_data->num_gpio_ranges; i++) {
+		range = &soc_data->gpio_ranges[i];
+
+		if (gpio < range->gpio_base ||
+		    gpio >= range->gpio_base + range->gpio_num)
+			continue;
+
+		if (pin)
+			*pin = range->pin_base + gpio - range->gpio_base;
+
+		if (bank)
+			*bank = i;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int s32_gpio_pad_map_xlate(struct s32_pinctrl *ipctl,
+				  unsigned int gpio,
+				  unsigned int *reg_offset,
+				  u16 *mask)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	const struct s32_gpio_pad_map *map;
+	unsigned int bit;
+	int i;
+
+	if (!soc_data->gpio_pad_maps || !soc_data->num_gpio_pad_maps)
+		return -EINVAL;
+
+	for (i = 0; i < soc_data->num_gpio_pad_maps; i++) {
+		map = &soc_data->gpio_pad_maps[i];
+
+		if (gpio < map->gpio_start || gpio > map->gpio_end)
+			continue;
+
+		bit = gpio - map->gpio_start;
+		*mask = BIT(S32_PGPD_SIZE - 1 - bit);
+		*reg_offset = S32_PGPD(map->pad);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static bool s32_gpio_pin_is_sparse(struct s32_pinctrl *ipctl, unsigned int pin)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	const struct s32_gpio_range *range;
+	int i;
+
+	for (i = 0; i < soc_data->num_gpio_ranges; i++) {
+		range = &soc_data->gpio_ranges[i];
+		if (pin >= range->pin_base &&
+		    pin < range->pin_base + range->gpio_num)
+			return range->sparse;
+	}
+
+	return false;
+}
+
+static int s32_gpio_xlate_pgpd(struct s32_pinctrl *ipctl,
+			       unsigned int pin,
+			       unsigned int *reg_offset,
+			       u16 *mask)
+{
+	int ret;
+
+	/*
+	 * Try the pad map first. For sparse ranges (SIUL2_1), only pins
+	 * listed in the pad map are valid, return the error directly without
+	 * falling back to the linear layout.
+	 * For linear ranges (SIUL2_0), fall back to the linear pad-to-PGPD
+	 * formula if no pad map entry matches.
+	 */
+	ret = s32_gpio_pad_map_xlate(ipctl, pin, reg_offset, mask);
+	if (ret != -EINVAL)
+		return ret;
+
+	if (s32_gpio_pin_is_sparse(ipctl, pin))
+		return -EINVAL;
+
+	/* Linear layout fallback for non-sparse ranges. */
+	*mask = s32_pin2mask(pin);
+	*reg_offset = S32_PGPD(s32_pin2pad(pin));
+
+	return 0;
+}
+
+static int s32_gpio_reg_mask_xlate(struct gpio_regmap *gpio,
+				   unsigned int base, unsigned int offset,
+				   unsigned int *reg, unsigned int *mask)
+{
+	struct s32_pinctrl *ipctl = gpio_regmap_get_drvdata(gpio);
+	unsigned int pgpd_reg, pin, bank;
+	u16 pgpd_mask;
+	int ret;
+
+	ret = s32_gpio_get_range(ipctl, offset, &pin, &bank);
+	if (ret)
+		return ret;
+
+	switch (base) {
+	case S32_GPIO_OP_DIR:
+		/*
+		 * Direction is controlled through MSCR OBE.
+		 * Encode the real pin id in the virtual register.
+		 */
+		*reg = S32_GPIO_OP_DIR | pin;
+		*mask = S32_MSCR_OBE;
+		return 0;
+
+	case S32_GPIO_OP_DAT:
+	case S32_GPIO_OP_SET:
+		ret = s32_gpio_xlate_pgpd(ipctl, pin, &pgpd_reg, &pgpd_mask);
+		if (ret)
+			return ret;
+		/*
+		 * Encode both the GPIO bank and the real PGPD register offset.
+		 */
+		*reg = base | S32_GPIO_ENCODE(bank, pgpd_reg);
+		*mask = pgpd_mask;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int s32_gpio_reg_read(void *context, unsigned int reg,
+			     unsigned int *val)
+{
+	struct s32_pinctrl *ipctl = context;
+	unsigned int op = reg & S32_GPIO_OP_MASK;
+	unsigned int vreg = reg & ~S32_GPIO_OP_MASK;
+	unsigned int bank;
+	unsigned int offset;
+	struct regmap *map;
+
+	switch (op) {
+	case S32_GPIO_OP_DIR:
+		/*
+		 * Lower bits contain the real MSCR pin id.
+		 */
+		offset = S32_GPIO_DECODE_OFF(vreg);
+
+		return s32_regmap_read(ipctl->pctl, offset, val);
+
+	case S32_GPIO_OP_DAT:
+		bank = S32_GPIO_DECODE_BANK(vreg);
+		offset = S32_GPIO_DECODE_OFF(vreg);
+
+		if (bank >= ipctl->num_gpio_regmaps)
+			return -EINVAL;
+
+		map = ipctl->gpio_regmaps[bank].pgpdi;
+		if (!map)
+			return -ENODEV;
+
+		return regmap_read(map, offset, val);
+
+	case S32_GPIO_OP_SET:
+		/*
+		 * gpio-regmap uses update_bits() for set, so it needs to read
+		 * the output register before writing the updated value.
+		 */
+		bank = S32_GPIO_DECODE_BANK(vreg);
+		offset = S32_GPIO_DECODE_OFF(vreg);
+
+		if (bank >= ipctl->num_gpio_regmaps)
+			return -EINVAL;
+
+		map = ipctl->gpio_regmaps[bank].pgpdo;
+		if (!map)
+			return -ENODEV;
+
+		return regmap_read(map, offset, val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int s32_gpio_reg_write(void *context, unsigned int reg,
+			      unsigned int val)
+{
+	struct s32_pinctrl *ipctl = context;
+	unsigned int op = reg & S32_GPIO_OP_MASK;
+	unsigned int vreg = reg & ~S32_GPIO_OP_MASK;
+	unsigned int bank, offset, config;
+	struct regmap *map;
+
+	switch (op) {
+	case S32_GPIO_OP_DIR:
+		/*
+		 * gpio-regmap sets S32_MSCR_OBE for output and clears it for
+		 * input. Keep IBE enabled for GPIOs in both cases.
+		 */
+		offset = S32_GPIO_DECODE_OFF(vreg);
+
+		config = S32_MSCR_IBE;
+		if (val & S32_MSCR_OBE)
+			config |= S32_MSCR_OBE;
+
+		return s32_regmap_update(ipctl->pctl, offset,
+					 S32_MSCR_OBE | S32_MSCR_IBE,
+					 config);
+
+	case S32_GPIO_OP_SET:
+		bank = S32_GPIO_DECODE_BANK(vreg);
+		offset = S32_GPIO_DECODE_OFF(vreg);
+
+		if (bank >= ipctl->num_gpio_regmaps)
+			return -EINVAL;
+
+		map = ipctl->gpio_regmaps[bank].pgpdo;
+		if (!map)
+			return -ENODEV;
+
+		return regmap_write(map, offset, val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct regmap_bus s32_gpio_regmap_bus = {
+	.reg_read = s32_gpio_reg_read,
+	.reg_write = s32_gpio_reg_write,
+};
+
+static const struct regmap_config s32_gpio_regmap_config = {
+	.name = "s32-gpio",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 1,
+	.max_register = S32_GPIO_OP_SET | S32_GPIO_BANK_MASK | S32_GPIO_REG_MASK,
+	.cache_type = REGCACHE_NONE,
+	.fast_io = true,
+};
+
+static int s32_gpio_get_ngpio(const struct s32_pinctrl_soc_data *soc_data,
+			      unsigned int *ngpio)
+{
+	const struct s32_gpio_range *range;
+	unsigned int end, max = 0;
+	int i;
+
+	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
+		return -EINVAL;
+
+	for (i = 0; i < soc_data->num_gpio_ranges; i++) {
+		range = &soc_data->gpio_ranges[i];
+
+		if (!range->gpio_num)
+			return -EINVAL;
+
+		end = range->gpio_base + range->gpio_num;
+
+		/*
+		 * gpio_ranges must be ordered by gpio_base and must not overlap.
+		 * The GPIO line space size is derived from the highest range end.
+		 */
+		if (i > 0 && range->gpio_base < max)
+			return -EINVAL;
+
+		if (end > max)
+			max = end;
+	}
+
+	*ngpio = max;
+
+	return 0;
+}
+
+static int s32_init_gpio_regmap(struct platform_device *pdev,
+				struct s32_pinctrl *ipctl)
+{
+	ipctl->gpio_regmap =
+		devm_regmap_init(&pdev->dev, &s32_gpio_regmap_bus,
+				 ipctl, &s32_gpio_regmap_config);
+	if (IS_ERR(ipctl->gpio_regmap))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(ipctl->gpio_regmap),
+				     "Failed to init GPIO regmap\n");
+
+	return 0;
+}
+
+static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *mask,
+			       unsigned int ngpios)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	struct s32_pinctrl *ipctl = gpio_regmap_get_drvdata(gpio);
+	unsigned int gpio_num, pin, reg_offset;
+	u16 pgpd_mask;
+	int ret;
+
+	bitmap_zero(mask, ngpios);
+
+	for (gpio_num = 0; gpio_num < ngpios; gpio_num++) {
+		ret = s32_gpio_get_range(ipctl, gpio_num, &pin, NULL);
+		if (ret)
+			continue;
+
+		ret = s32_gpio_xlate_pgpd(ipctl, pin, &reg_offset, &pgpd_mask);
+		if (ret)
+			continue;
+
+		bitmap_set(mask, gpio_num, 1);
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct s32_pinctrl *ipctl)
+{
+	char **names;
+	unsigned int gpio;
+	unsigned int pin;
+	char port;
+	int ret;
+
+	names = devm_kcalloc(ipctl->dev, ipctl->ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (gpio = 0; gpio < ipctl->ngpio; gpio++) {
+		ret = s32_gpio_get_range(ipctl, gpio, &pin, NULL);
+		if (ret)
+			continue;
+
+		port = 'A' + pin / 16;
+
+		names[gpio] = devm_kasprintf(ipctl->dev, GFP_KERNEL,
+					     "P%c_%02u", port, pin & 0xf);
+		if (!names[gpio])
+			return -ENOMEM;
+	}
+
+	ipctl->gpio_names = (const char *const *)names;
+
+	return 0;
+}
+
+static int s32_pinctrl_init_gpio_regmaps(struct platform_device *pdev,
+					 struct s32_pinctrl *ipctl)
+{
+	const struct s32_pinctrl_soc_data *soc_data = ipctl->info->soc_data;
+	static const struct regmap_config pgpd_config = {
+		.reg_bits = 32,
+		.val_bits = 16,
+		.reg_stride = 2,
+	};
+	struct regmap_config cfg;
+	struct resource *res;
+	void __iomem *base;
+	unsigned int pgpdo_idx, pgpdi_idx;
+	unsigned int i;
+
+	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
+		return 0;
+
+	ipctl->num_gpio_regmaps = soc_data->num_gpio_ranges;
+	ipctl->gpio_regmaps = devm_kcalloc(&pdev->dev, ipctl->num_gpio_regmaps,
+					   sizeof(*ipctl->gpio_regmaps),
+					   GFP_KERNEL);
+	if (!ipctl->gpio_regmaps)
+		return -ENOMEM;
+
+	for (i = 0; i < ipctl->num_gpio_regmaps; i++) {
+		ipctl->gpio_regmaps[i].range = &soc_data->gpio_ranges[i];
+
+		/*
+		 * GPIO resources are placed after the pinctrl regions
+		 */
+		pgpdo_idx = soc_data->mem_regions + i * 2;
+		pgpdi_idx = soc_data->mem_regions + i * 2 + 1;
+
+		/* PGPDO */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdo_idx);
+		if (!res)
+			return dev_err_probe(&pdev->dev, -ENOENT,
+						 "Missing PGPDO resource %u\n", i);
+
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		cfg = pgpd_config;
+		cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdo%u", i);
+		if (!cfg.name)
+			return -ENOMEM;
+
+		cfg.max_register = resource_size(res) - cfg.reg_stride;
+
+		ipctl->gpio_regmaps[i].pgpdo =
+			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
+		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdo))
+			return dev_err_probe(&pdev->dev,
+						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdo),
+						 "Failed to init PGPDO regmap %u\n", i);
+
+		/* PGPDI */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, pgpdi_idx);
+		if (!res)
+			return dev_err_probe(&pdev->dev, -ENOENT,
+						 "Missing PGPDI resource %u\n", i);
+
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		cfg = pgpd_config;
+		cfg.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdi%u", i);
+		if (!cfg.name)
+			return -ENOMEM;
+
+		cfg.max_register = resource_size(res) - cfg.reg_stride;
+
+		ipctl->gpio_regmaps[i].pgpdi =
+			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
+		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdi))
+			return dev_err_probe(&pdev->dev,
+						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdi),
+						 "Failed to init PGPDI regmap %u\n", i);
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -709,8 +1238,7 @@ int s32_pinctrl_suspend(struct device *dev)
 	const struct pinctrl_pin_desc *pin;
 	const struct s32_pinctrl_soc_info *info = ipctl->info;
 	struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
-	int i;
-	int ret;
+	int i, ret;
 	unsigned int config;
 
 	for (i = 0; i < info->soc_data->npins; i++) {
@@ -721,7 +1249,7 @@ int s32_pinctrl_suspend(struct device *dev)
 
 		ret = s32_regmap_read(ipctl->pctl, pin->number, &config);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		saved_context->pads[i] = config;
 	}
@@ -736,7 +1264,7 @@ int s32_pinctrl_resume(struct device *dev)
 	const struct s32_pinctrl_soc_info *info = ipctl->info;
 	const struct pinctrl_pin_desc *pin;
 	struct s32_pinctrl_context *saved_context = &ipctl->saved_context;
-	int ret, i;
+	int i, ret;
 
 	for (i = 0; i < info->soc_data->npins; i++) {
 		pin = &info->soc_data->pins[i];
@@ -745,7 +1273,7 @@ int s32_pinctrl_resume(struct device *dev)
 			continue;
 
 		ret = s32_regmap_write(ipctl->pctl, pin->number,
-					 saved_context->pads[i]);
+				 saved_context->pads[i]);
 		if (ret)
 			return ret;
 	}
@@ -928,9 +1456,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct gpio_regmap_config gpio_cfg = {};
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	unsigned int ngpio;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins)
@@ -956,6 +1486,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	INIT_LIST_HEAD(&ipctl->gpio_configs);
 	spin_lock_init(&ipctl->gpio_configs_lock);
 
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       s32_gpio_free_saved_configs, ipctl);
+	if (ret)
+		return ret;
+
 	s32_pinctrl_desc =
 		devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_KERNEL);
 	if (!s32_pinctrl_desc)
@@ -974,6 +1509,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
+	ret = s32_pinctrl_init_gpio_regmaps(pdev, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to init GPIO regmaps\n");
+
 	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
 					     ipctl, &ipctl->pctl);
 	if (ret)
@@ -995,7 +1535,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to enable pinctrl\n");
 
-	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
+	/* Setup GPIO if GPIO ranges are defined */
+	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
+		return 0;
+
+	ret = s32_gpio_get_ngpio(soc_data, &ngpio);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Invalid GPIO ranges\n");
+
+	ipctl->ngpio = ngpio;
+
+	ret = s32_gpio_populate_names(ipctl);
+	if (ret)
+		return ret;
+
+	ret = s32_init_gpio_regmap(pdev, ipctl);
+	if (ret)
+		return ret;
+
+	gpio_cfg.parent = &pdev->dev;
+	gpio_cfg.fwnode = dev_fwnode(&pdev->dev);
+	gpio_cfg.label = dev_name(&pdev->dev);
+	gpio_cfg.regmap = ipctl->gpio_regmap;
+	gpio_cfg.ngpio = ngpio;
+	gpio_cfg.names = ipctl->gpio_names;
+	gpio_cfg.reg_dir_out_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_DIR);
+	gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_DAT);
+	gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(S32_GPIO_OP_SET);
+	gpio_cfg.reg_mask_xlate = s32_gpio_reg_mask_xlate;
+	gpio_cfg.init_valid_mask = s32_init_valid_mask;
+	gpio_cfg.drvdata = ipctl;
+
+	ipctl->gpio_rgm = devm_gpio_regmap_register(&pdev->dev, &gpio_cfg);
+	if (IS_ERR(ipctl->gpio_rgm))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(ipctl->gpio_rgm),
+				     "Unable to add gpio_regmap chip\n");
 
 	return 0;
 }
diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
index c49d28793b69..f9546c67a269 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
@@ -3,7 +3,7 @@
  * NXP S32G pinctrl driver
  *
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
- * Copyright 2017-2018, 2020-2022 NXP
+ * Copyright 2017-2018, 2020-2022, 2025-2026 NXP
  * Copyright (C) 2022 SUSE LLC
  */
 
@@ -773,17 +773,48 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
 	S32_PIN_RANGE(942, 1007),
 };
 
-static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
+static const struct s32_gpio_range s32_gpio_ranges_siul2[] = {
+	S32_GPIO_RANGE(0, 0, 102),
+	/* SIUL2_1: sparse layout, PGPD mapping required for all pins */
+	{ .gpio_base = 112, .pin_base = 112, .gpio_num = 79, .sparse = true },
+};
+
+/*
+ * SIUL2_1 GPIO ranges mapped to sparse PGPD pads.
+ *
+ * SIUL2_1 does not expose GPIO data registers as a linear pad
+ * sequence. Each entry describes a contiguous GPIO offset range
+ * and the PGPD pad servicing that range.
+ */
+static const struct s32_gpio_pad_map s32g_gpio_pad_maps[] = {
+	{ 112, 122, 7  }, /* PH_00 .. PH_10 -> PGPD7  */
+	{ 144, 159, 9  }, /* PJ_00 .. PJ_15 -> PGPD9  */
+	{ 160, 175, 10 }, /* PK_00 .. PK_15 -> PGPD10 */
+	{ 176, 190, 11 }, /* PL_00 .. PL_14 -> PGPD11 */
+};
+
+/* Legacy data for old DT bindings without GPIO support */
+static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data = {
+	.pins = s32_pinctrl_pads_siul2,
+	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
+	.mem_pin_ranges = s32_pin_ranges_siul2,
+	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+};
+
+static const struct s32_pinctrl_soc_data s32g_pinctrl_data = {
 	.pins = s32_pinctrl_pads_siul2,
 	.npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
 	.mem_pin_ranges = s32_pin_ranges_siul2,
 	.mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
+	.gpio_ranges = s32_gpio_ranges_siul2,
+	.num_gpio_ranges = ARRAY_SIZE(s32_gpio_ranges_siul2),
+	.gpio_pad_maps = s32g_gpio_pad_maps,
+	.num_gpio_pad_maps = ARRAY_SIZE(s32g_gpio_pad_maps),
 };
 
 static const struct of_device_id s32_pinctrl_of_match[] = {
 	{
 		.compatible = "nxp,s32g2-siul2-pinctrl",
-		.data = &s32_pinctrl_data,
 	},
 	{ /* sentinel */ }
 };
@@ -792,8 +823,16 @@ MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
 static int s32g_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct s32_pinctrl_soc_data *soc_data;
+	struct device_node *np = pdev->dev.of_node;
 
-	soc_data = of_device_get_match_data(&pdev->dev);
+	/*
+	 * Legacy DTs only describe the pinctrl resources.
+	 * New DT changes extend the same node with GPIO resources.
+	 */
+	if (of_property_present(np, "gpio-controller"))
+		soc_data = &s32g_pinctrl_data;
+	else
+		soc_data = &legacy_s32g_pinctrl_data;
 
 	return s32_pinctrl_probe(pdev, soc_data);
 }
-- 
2.34.1


