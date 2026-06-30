Return-Path: <linux-gpio+bounces-39213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G1DdOka+Q2olgQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:01:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6746E490E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=JeT+0WeC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39213-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39213-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BDFB31694F0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E28416CED;
	Tue, 30 Jun 2026 12:54:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3F413D87;
	Tue, 30 Jun 2026 12:54:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824062; cv=fail; b=jxc4xfVy1ydJDVJb7VxUg3iuvLrAYAtWvS2MILSHJ8wAR4xsrb0aeuX3x7sXuqvy0IfUjUL4n8+aPNi/25V4cVL2vt93gZaz09+fOOD0dd6N63nKvMSNymrjmrrRHdlKwbI8N1PXarwbmx6UXEZvm6nQJAIv9rvWCLwyaU2ZIx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824062; c=relaxed/simple;
	bh=s76/grDfoIKAdbCf4XrcriC2wzj7hltuIEEgRReRRis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QHKRh7ojDejd4WfHKtzjSCCCGL+m2Ly9DlOLWWyAmPhturbfJQBYMruXjCqFLOib1ScCEbN8iKb9aoVGRT++LsFNmFFCla3ULZ8uxbO4/4nsC0UL+aOeq+nqCKlvS2QyGeTxa+w6Jx3n/AD5ZRXe0v39LiPAPwxhubqteK5ME9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JeT+0WeC; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQkmodYtfFW6S2kXV9Eo6ohiUScbccC+1VY9SUvs4nOIseaFmi+9r3fjXEfGI2Eqc8b10hAIqv8AsXL+teI5PMwc4xOQ7XXtrf76qdP8piQvScuFyAk74T5lzs5sta5vdGZRMExXQMvNwsGk2qvjcQYum+TWM+PmEHDVR3W6RYFixWwHJzaIy9VeX7XSvo3+uilhwY3A9riJAZMLNI9bhiewUUoy7GN4xFSeL7REzHFlvii+NuiHGo+dz5+ZPwd4INwwlQrdf7BxY5PWDJyOUnyRJrqghp6zqeSrppUfuPxa99FNLcpMnphKxsA5m7Z32p6HCqa7JtGsJR0hBFGezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u7LotEabaIc765M/63Rl5RoFnrjm9xy8ZbD1p2AIbE=;
 b=cWwGDz6li+/q+Nrna3zd0P5QG6wqJ2Sm69dFBIckuV327R9umG55BCzb3r7+dekXiA0crEKutOUS3rexPKBE7OkmOPuxH2UdMTIA53jIYjlkwvc16rKou7rhGkWA71HpEtsOkdxRzlLGplkkHQGF3psz0OWJmyEz37wt6z7Cf19JPNCmk6kxRUyouUYHaRc1PKE9ORbxRweLyGXe6GDTBvKPFPj0rL3QnTsWFnkmhD3KzA3F7yg49WYF5MD6qYBdefA0TReyZpAKxcdH9p56C/dhNRMFGNYPJmb5hfHpQLZ0U53gFsCjCwyxnIl2bIzyyHDSDvMCTrCb5AFyMJKDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u7LotEabaIc765M/63Rl5RoFnrjm9xy8ZbD1p2AIbE=;
 b=JeT+0WeC3IhC5jggOjwVTc2EVIGlTbmkcNtqaCbDbdbwSA3YAQC2ZOWsF50LLnR9QZkrj6JeeZNUAhxThxOcDUxOy3N01DshKlSw919EFRXeelRdRArK6YMr56JEtqT3xe+oaX2fxJmXqV0Z1i+lj54wXW63xg5A4RpFhOjwxjPo218DWKGzVliorq6a2ke/D0jc2/RacPPss0JYGXM2YJkhz1fi3kcDt6WV0znbAlxe6X8Rgb7S1uqluS1IOEly5/haeLxPdAc/YXlMbS+pvVZCvun9Sj4Yvk0qRnr0UxlID0+7mOpXhnbzSeA7TS0T1J/IivdB7JzJnUcFvc/xAg==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:11 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:11 +0000
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
Subject: [PATCH v12 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
Date: Tue, 30 Jun 2026 14:54:01 +0200
Message-Id: <20260630125403.546375-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d491631c-0ef6-4ff3-4ee3-08ded6a6ae53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|3023799007|22082099003|18002099003|5023799004|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 GoHWZ4uNUhXEDIb5rVOitDonZ5Z+QFftyqkpZN0cPeeWy4UjGIAlCnqb2klKA21dTIv35RUGiDcpcipNPYmjUtRE2NmpESgQJHYu90zOtF7UmPpyd98yJv4NBXXZ1v94ZULVdH+ptDG3e4b3zgh5CDosXe+/oTQBg/ILiodRYBrnfuyqo3dk89jfXJKiMLGw9CV5Tjwp98dU2OhvydJXm8AtVnDyz5gkkQjHJW5v/XTs++TQT0kAkZPjtvXOCM83uKNNLG0kceEmCituTYNhWPPj8ZUoeZcamjJ/LVtBwykV+YCXKfLJKuXm4XLSKTOzWoXQ7j72e7OKzeYeL7q7k3qRQmWmrbQo/dHrxfmnciprZAFoqLnNhs/9Y2gj4ipjdbxSZBenUT4MNddrno9fsqvi34PoQkV4D1H8kOORh7t+y6qkDMa9Llh5EJFk4BBQDNFwoKmywzv0rJw+Duq7CSSOoKWQj87ZSnEHW9EgXdSRh+lH/SqJU9+YSAiuVhrUXQYgzaK22WLBio2+kW3h/MY8pBREFiMa3V2lyfy6n9AAVfKbl9siy1lTJhJRy/Cuv97PHgFvO6hNUE1li7Vg/hNOtRSu0OB94eZclot7AdGgTvrCn7DHalP61y5Q0HbKdbcoua6xHQGxNyoGbTAq2TrBVwCKAa05u3mlVGg9aao=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(3023799007)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SFNMTkNjZzhJb2xrbWtCOXJFMGhtSDdBYTdYZGpISDVUZ0haK3NwanYvWG1B?=
 =?utf-8?B?UjFuUEYzNlIrQWh5dG1Sb0N3VEdBa1BtWU1lR01JU0JyRkxyZ0dVZXdkS1ZQ?=
 =?utf-8?B?MGFEeCtOUzdyQklkT2dWNDcwdVE3OXcrRDZXUTZBQzlYTGRveDZoNE1MbExi?=
 =?utf-8?B?cUoyc0ZsZlMvMGpERUtZa3hzeFlzbjVrNHlpZzFJVzd4Vjk5dDZOTkYzYndC?=
 =?utf-8?B?cFFqU0JieXJuZEIrS3ROWXFnSDFMOEluNldnYWh1b1EyL0JuOVE5U3FqaWta?=
 =?utf-8?B?Y3o2U016bzF0M2k1aW02TmtlaENUcEpoM1J5K2FETnFZU0h3MjRWK3pTK1Za?=
 =?utf-8?B?Si9ITXFnSlZvcjJyN1o0NG45ZGJZenhwcEpxNkpVeVJWOUxmdGQrMGFlU09H?=
 =?utf-8?B?TkFyUXE0VGd5bWtJRlpZcTNrSVZYdWZUK0MrZWRrRy9CZlhURVEwZC8yNEZG?=
 =?utf-8?B?dStWUTFQb2pTYzFLei91YXg1VFdYaEVROFNWNGIyMTZ3RHpVYzNIRTJoUG12?=
 =?utf-8?B?NVhsdXdISXR2UEtWK2NsUEZLckFaUUNtaW94SnRoU25tNTBVU29GZ0tnRExF?=
 =?utf-8?B?aW1aT1RHWFVYZmd5bnF0aWthTmYvdWNQd2hVZUFPQXBnYTVwK2g2Y0twL29X?=
 =?utf-8?B?NVN2a1RkWHlhTnllV3ZMVmlvZG11S0hUc2gwQWk0b2lMQXYwc25oeENDa0Za?=
 =?utf-8?B?M2ZmOFBTRmhPc3g1WStUdVZFZkU3aTFPdnhEc2VqUmxON0xXQjF5T3krRUJm?=
 =?utf-8?B?T0I0enUwYjlWeFZvQ1ROdU0vSXRSN3BtdnVyeWp3MG0yTXIvbzFmcVJOZ0Jv?=
 =?utf-8?B?SzF5ci90MlRMbFhFRDAwV2ZvZkVMczRJY1M5c0VWUk50R0k1ekx4Y0wyMFFk?=
 =?utf-8?B?aXFmZWZkUWI3RTNiRUdMRlZFUkxBNU9EbXVIMXA0NHp2Y2tBRkFESlpqYTFN?=
 =?utf-8?B?UlhqN2lmNmw2QzFvV25zM29MbTVraWZybmR2RWhqNzRzajBHYVh1WG5BTGdV?=
 =?utf-8?B?UU42b1dyQXdvZWFwenRkWURXczdEcjYwM3JRK2dXdmpnWHByRUtlMzBGV3Vl?=
 =?utf-8?B?NUxpYnRwZFk1ekpwaGJsb2RWVXlia1owc3lCdG1xOXNQWlg2bjdDdEJqTC9j?=
 =?utf-8?B?WXNJcmMvSGMrK25FREEwR3RHY0VqVk1QaVk3TTdLb3JxamZTMnNiVjNIMTZt?=
 =?utf-8?B?ekRjeDhvcStobTQ3UFBCU1hITnVEdU1DUGxPKzdCOExxRVd5U1pmcVZ3Wlpt?=
 =?utf-8?B?endvRnVYZUorMFlnS0x0VXF1S0NZbXF2UDlFdXFYN1lvUkVmaDU0a2UwVFg4?=
 =?utf-8?B?enN2dHZxazNNYWFGQXhiQnBETU42cGlvbDdUbE43S2dpSGRsZEg1TmcxS2Jy?=
 =?utf-8?B?czdmaGtWNGs0RzI2N1Y4VDlKU1VJcUJMdFFZS3gwVENvdzJvNkh1OFNDN3pr?=
 =?utf-8?B?S3F0bVpSaWlEMzZaMHdiUDM4NUt6S2g0QWVtQksyNXNPSmJEcUVKL3hydVFh?=
 =?utf-8?B?cytZZTJlMldFY0lFZUxCUnFXYlE2UFZhZGZnUEhldTVKaDU2MmQ3Zmc3MVRZ?=
 =?utf-8?B?QjdUYzUxZ3BUaWQ5OG1EcHpIeERyWHo5VXZaeVlFUHR0N2c4bnhqYUliblRt?=
 =?utf-8?B?Vm9UTFFsVHp1U3RmSWdGOWNNYjJqS3RmTlE1WWF2QXJBU0Y0TGt3TDJxZFBn?=
 =?utf-8?B?UjRuRHp2ZEticVNpWGdmMk9rN2hsNTU4eVQ4ZTE4UjFDQVdpamRuQVNQWUV2?=
 =?utf-8?B?SDAvN01HeC95RlRiSnFOS2paOUticjJpQkFDcVFNL0xQbE4xWi9QTXBLeWNV?=
 =?utf-8?B?OTRlME5sUzZhcFZTaDk4MVlWcENLYzlqS1p5bkdQVkF4dHpyT3I5cGxTNXNX?=
 =?utf-8?B?SkttR0dBd0dvdWhlZWdjREhOVHNKVE5sVEg5VTlHazFIWmN1cnlGeXlzYW45?=
 =?utf-8?B?dEJNRzJhMytrUXR0Y3BsN1NwYzJrTXBDMzdKVjNqS2Y2b1VBMXQwbnBNUDA0?=
 =?utf-8?B?Ryt0RnhYSTRCQWx1aitQeUVpVUM2bU9IbHN1T20wMkI1RFJ0V2JpVGtBcWhO?=
 =?utf-8?B?MWQ5S0ZEbS9SeldSTzNzTDdLeUZXa2ZhZTVwRzF4d2R2dzI3MDBkYXUvcVRK?=
 =?utf-8?B?RTZQMnZVTmZRakJCMkpubmxOa2E5bzFiRkc3bjhYK2drb0g1ZXhUVDFjQ04v?=
 =?utf-8?B?MDdOWTUzS2s1V2VkRjVvNHJqTGhkTm5veVlNOFg1L0JIYTBmaVBxd3NBVEhD?=
 =?utf-8?B?UFZraUFzOWZqNVFyYllPWVh6OGZWNG91bVdZeWVUYjBneVlWcDZaMWhPK1gr?=
 =?utf-8?B?Rk5MK3A0UnhnNXVQMHkzUUlLUWRmdmZpUXBqeXZCUjlhcHNKN2xaMEUwRy8r?=
 =?utf-8?Q?0tlvFozkFwZSlXhifRptEuBRIPkyRPI/jHU3I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d491631c-0ef6-4ff3-4ee3-08ded6a6ae53
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:11.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyVXGAtgmFrAMDzcNSOh2YZYeUAC5DErRwQzSMXoASSNq+8C6v1BsgOIHbiJNuBl88bFxvm5y7ycgFOFlTqm9xpo8NtI1x1Y14sbOG8v6GwWCIugVtCQlNrayg/mfhMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39213-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,NXP1.onmicrosoft.com:dkim,nxp.com:email,oss.nxp.com:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD6746E490E

Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
external interrupt resources present in the same SIUL2 hardware block.

Besides the MSCR and IMCR registers used for pin multiplexing and pad
configuration, SIUL2 also contains PGPDO and PGPDI registers
for GPIO data and EIRQ registers for external interrupt control.

Add GPIO controller properties because the SIUL2 block also provides
GPIO functionality, and gpio-ranges are needed to describe the
mapping between GPIO lines and pin controller pins.

Document the interrupt controller properties. The SIUL2 block
contains EIRQ hardware as part of the same register space. IRQ support
itself will be added in a follow-up patch series.

Update the example accordingly to show the complete SIUL2 register
layout, including the GPIO data and EIRQ register windows.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 90 +++++++++++++++++--
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..36f2393fa406 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2022 NXP
+# Copyright 2022, 2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
@@ -17,8 +17,10 @@ description: |
     SIUL2_0 @ 0x4009c000
     SIUL2_1 @ 0x44010000
 
-  Every SIUL2 region has multiple register types, and here only MSCR and
-  IMCR registers need to be revealed for kernel to configure pinmux.
+  Every SIUL2 region has multiple register types. MSCR and IMCR registers
+  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
+  registers are used for GPIO output/input operations. EIRQ registers
+  are used for external interrupt configuration.
 
   Please note that some register indexes are reserved in S32G2, such as
   MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
@@ -29,14 +31,22 @@ properties:
       - nxp,s32g2-siul2-pinctrl
 
   reg:
+    minItems: 6
     description: |
-      A list of MSCR/IMCR register regions to be reserved.
+      A list of MSCR/IMCR/PGPDO/PGPDI/EIRQ register regions to be reserved.
       - MSCR (Multiplexed Signal Configuration Register)
         An MSCR register can configure the associated pin as either a GPIO pin
         or a function output pin depends on the selected signal source.
       - IMCR (Input Multiplexed Signal Configuration Register)
         An IMCR register can configure the associated pin as function input
         pin depends on the selected signal source.
+      - PGPDO (Parallel GPIO Pad Data Out Register)
+        A PGPDO register is used to set the output value of a GPIO pin.
+      - PGPDI (Parallel GPIO Pad Data In Register)
+        A PGPDI register is used to read the input value of a GPIO pin.
+      - EIRQ (External Interrupt Request)
+        EIRQ registers are used to configure and manage external interrupts.
+
     items:
       - description: MSCR registers group 0 in SIUL2_0
       - description: MSCR registers group 1 in SIUL2_1
@@ -44,6 +54,28 @@ properties:
       - description: IMCR registers group 0 in SIUL2_0
       - description: IMCR registers group 1 in SIUL2_1
       - description: IMCR registers group 2 in SIUL2_1
+      - description: PGPDO registers in SIUL2_0
+      - description: PGPDI registers in SIUL2_0
+      - description: PGPDO registers in SIUL2_1
+      - description: PGPDI registers in SIUL2_1
+      - description: EIRQ registers in SIUL2_1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
 
 patternProperties:
   '-pins$':
@@ -86,11 +118,38 @@ required:
   - compatible
   - reg
 
+oneOf:
+  - description: Legacy pinctrl-only node
+    properties:
+      reg:
+        maxItems: 6
+
+      gpio-controller: false
+      "#gpio-cells": false
+      gpio-ranges: false
+      interrupt-controller: false
+      "#interrupt-cells": false
+      interrupts: false
+
+  - description: Pinctrl node with GPIO and external interrupt support
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - interrupt-controller
+      - "#interrupt-cells"
+      - interrupts
+    properties:
+      reg:
+        minItems: 11
+
 additionalProperties: false
 
 examples:
   - |
-    pinctrl@4009c240 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@4009c240 {
         compatible = "nxp,s32g2-siul2-pinctrl";
 
               /* MSCR0-MSCR101 registers on siul2_0 */
@@ -104,7 +163,26 @@ examples:
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
               /* IMCR430-IMCR495 registers on siul2_1 */
-              <0x440110f8 0x108>;
+              <0x440110f8 0x108>,
+              /* PGPDO registers on siul2_0 */
+              <0x4009d700 0x10>,
+              /* PGPDI registers on siul2_0 */
+              <0x4009d740 0x10>,
+              /* PGPDO registers on siul2_1 */
+              <0x44011700 0x18>,
+              /* PGPDI registers on siul2_1 */
+              <0x44011740 0x18>,
+              /* EIRQ registers on siul2_1 */
+              <0x44010010 0x34>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 102>,
+                      <&pinctrl 112 112 79>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
         llce-can0-pins {
             llce-can0-grp0 {
-- 
2.34.1


