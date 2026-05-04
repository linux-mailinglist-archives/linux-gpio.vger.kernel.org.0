Return-Path: <linux-gpio+bounces-36069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHNpOI2d+GnHxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:22:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69E4BDCCC
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35610306DBF5
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CD53DC4C2;
	Mon,  4 May 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ACmrfOBf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F97F3DBD71;
	Mon,  4 May 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900323; cv=fail; b=bXBg04UkrIjDnsU02nJOP2F6C0bDBsBT51GfM7xhurN6MsNuUt7DIF2M9dN8pnrlpvkPy8kRA++9aV1D9nSUW/LpQYNBtMW8UMq+SEOfWw5qUHOTzL6kcm9+Ysbhw7G43yLc5rSvhmjPOdKMpVzbaxU6M6x3tXbeKlgC9VP8AP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900323; c=relaxed/simple;
	bh=QrRg6z4HUCLQt5+1hiTy/A/LPNtl0OovSYWc1Hr6g7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RDY2uuCef0dXhssdlvEzWi/Q6HcOFa100R71H4WDtS5a+r5SrvLG+0CuXRdCPlWPGBPd6p0arjbKxtpVwIGCr/Ge/G6+tbCEs9DPbzNfDgfnQPwQKSsxtKybs8qrmffgMrww2wi9gMRGRcdePVFue4AfTv/DDWsNrjDK45EViUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ACmrfOBf; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4TVcF8/CFECeMd4kiF0fLt37EMfWJzxd9uNE4i9BJhYSMO8DlpcMS5asBQ6XyZg/v9UiNA07VTcruqfDhlBGC9gUZWKYYgZPkrfO8ZJhWvoMguNZMrgEorMtNavf8luKJtYZhzP3O+qoeOcPGFqidDpOONTITal5ExULq5JzoYej+cCiZHFnQNEAlbqfbLS/anS6k8n8032RpDt0krmi8JHxVD/TykKsm6cr7bIelCnA2mBRHSitBaHL8zHrnju3vnvDvOIG6DIU5VNpBb5sqKk5NZVvIpcL/x5K4tnAAsMQ91/nBTtAUsElQdlRlxsnl5wRHvpd9ht6982u8XvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd9WsGVc+B6zlJlmKmQ7+C1dICQsJp9GHcqLEnX0Ohs=;
 b=rizxuPeP3lLCJudXxW6ZYVRjLZUmQv4mLgM7+hseRxd/zmMGIG3gQj2/suyX6997uyBfhqPDLLoHUZbNFTCmaLfdwAocSC4aj0/xB6RwiFYevDtpZKsTEUnopYPPlhWLnkWP5BE/isOYAxjUoTpPgLmuPjh4u1DPWXa5Arqb/avK2HF9O+Ey782hlycqcUDHnabRp2eoxtqZ1wdWihQhZvFQ5o1Qnnj/ro0Hyqo4a+7NpHY/zy4pf1O6wg5Q3w6KM5MHFx5MBy1YfYdBViyQfusyLwx2rQHtqf6s7CE7zYWcejDruF5ei9s263d84zBBlH+jPIPg8Y3mNm3Fu2bAXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd9WsGVc+B6zlJlmKmQ7+C1dICQsJp9GHcqLEnX0Ohs=;
 b=ACmrfOBfxKPcrTk0hGk1UWNjZx0LAip7gXT4EdFjgo44k64Sy1vnN1clxuBlVLl8TJ8b4Pp5oSu3t0HVkExpAHyVJjz1CQDfCZpVyzYr7Uw1hMeO4wH4xyUkv5HzGGFEzAZf3DjO5iewzDYWvpFr9xQ7tjKDz4d3g4+UAQ072ZkKmPTV0lAX0dnnGQJdApIY8oaSfb38BFjHba2j/SGHJmhyPXKMh0QriDKUWgidmP2KrS2E/3XBKaC4YR4DPtIFamkq2ILQGc6C89BwD6arCa3HMqmrcJfa6MfHT9xQQACcv7rIx51HjIAH0tC/16bsHeQGjXJQBW7TynUQuz0qOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:54 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:54 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v9 3/7] pinctrl: s32cc: remove inline specifiers
Date: Mon,  4 May 2026 15:11:44 +0200
Message-Id: <20260504131148.3622697-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::14) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: a8668238-b0f7-4fec-c814-08dea9deb63d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 drp/cug8tQGWaHkTKNvyDxnhbLdKvGLfdu2FA/XiQD5QSXTL+rfG83gHae/7fr7As9gGgioJUX+6COkypdDuTvGBVAg9Gr9TTNtsdiUqpRUqXFF21lsMvKxTYhdSznGCa/2L0judSnt0Ekd4BfRuT4xAugyTrc5QhG5Eu/r1et7DpFyGJk4KeALHVtSZXP5xVWRaTmgf+qOSVuS0/9ouWjJUay6RDo8YnongAJTPbHq80KN5sDupGsAToMYeoU20lcani7VPCaoZ/e9gm5S1ajaT4NNPvdhLYYBBkcDuyFVPnsj/V6HORVibZDnbDaDiac8224ivRvUofWc5mdKNuuoeKc2awQAY5vjCcUzm2qnWwzZKaB3pM1PMee9ofPFpu+pjOp85/ib3rypyzsN7GgP9l8BeqAwY/2Np3VP+W9FANTXdcAzJ6Za6ou8ujd+UgZ1Gt4+UK8yb4DPy8q+mZcCGJVUUzQ9RQJFW/X5tR1UPIos4oHhgSSe7hB/lJoAZd/Tu2dkMkVqvCAERDceC9omv7xnWoiTMotyI+N14nIytTDD1QuUzm0QXJO/Wz/DSHqM8qIW2JNgMEgeu0L4QQdza4YWhClNA1+QuNjubPTRn11fFbTaM80IPqEkUoU1l9OX0imQs4ddMC3xZM8IzlX6CrETw4ewgOISXX3zkvp3uB6AI7oLJzNk6+mT2UO576HtMfC/83IOmfBVpXdQIVcohJxHePTN2NrH42b1kAXA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RkhBL1FpUlZoWS9LaEdYQ2F4d21wWnhUcS8xSG01M3NZREh4U3VhUkNheWdE?=
 =?utf-8?B?UkJsUnlZZm9Sb04va2hzb2NZUXNsZDZHTVRYZWNhM29WRXBQQTBDWDFnTHhK?=
 =?utf-8?B?VHdraDlLc1NlajRtYnNpSW9CT2srWis1Wmp6YVIwQkpjNjBXT09VMXk4aUJN?=
 =?utf-8?B?WGkxY2NNcjJuR3FJUjJwTmJOM3ozSmJ1ankyN1dRbWRtRXNVS2Y0SlFoVm5B?=
 =?utf-8?B?ZStlY1JiZTlkRVY5TktNUElVOUM5K2NTQmdsRkpjNVlydjFCaXhLcXFPZk1V?=
 =?utf-8?B?bys3S25vd2M1aldDU2tabEw4UG05TTh2ZUlZUkZwRGRMWjNWaW1kME42SThp?=
 =?utf-8?B?UEY0VkZyT1FSMTlDQTJoK3VkY3FXZ3E5eWtHcHgrWW5kSmlZNmpZWmF6d001?=
 =?utf-8?B?UEhCbGpZaWkvcDZSWVZKdGFyMUVwamhSb3U0Y1RJZHJ1clBML0xkdkxFMTQ5?=
 =?utf-8?B?QnIwZjFJZmtYMms0djNaRlgyT0JjbmlYclZuMjJ4RG90WC8rZ0NhWGlUMkZP?=
 =?utf-8?B?WnQrNUhPREh5NEREdk5LbG5WWmk0d3pFcnl4OGhDOHhpTmpXV3g0b2xPVHVx?=
 =?utf-8?B?RFFhY1VLOEVHS0lCcVkybkhEeUY3TUlNdGxnQXpDRUlBREpjQlViUWpuZVl2?=
 =?utf-8?B?UXgrY28yekV2czk4YjJOc2VDVVJzUEZ2aE03WUtqUHhLTHJPMU44TkswbEhi?=
 =?utf-8?B?K2VPYzRQczhFdFZ2NURrc2JNaDh4M1hSMndlbTZWdVZlNmdvaXVWd2VqVndy?=
 =?utf-8?B?VmdrdC95aGtYM1lLOGVLdW9LanpNcG1mbmc4UldBbkFKSjB0WTZFUnluZUhS?=
 =?utf-8?B?dVlkcXdSZE5heEtYR1lFS0gyQWNsdjdydVU2dE1palNxM2J1UlRlM1dsQ3RG?=
 =?utf-8?B?K1A0Vk0zRkFmb05URDQxWVpUTE4wb2VOZU9YdHMwK2pBQ1lYcTQreS9lSzlB?=
 =?utf-8?B?bmMzMXVJZGJJTnc5VGpHdGtVL3l6QzJMdXdrM0diSW53SElMSkFTZHFLaEsy?=
 =?utf-8?B?bGUrSVo1MWdYUnMrUEFhN0c4eE4wZjdDY3BENk81b1FEM3BWWkpsaHhkNXFo?=
 =?utf-8?B?cXBlSXlib2tTV2FhWmJXUm5tZVIvcGo4WVBaZVUxTVFSbXJqMDJWcjhQcFRZ?=
 =?utf-8?B?ZU9RTXkzWld6YzBzSURUbHlpSGd4S3N2aFIwb2ZHMUlBMnY2eTEzdjhrT2hC?=
 =?utf-8?B?Z3YyY2xTSDl5NC9QWE44UUF6R2RWQTYvdjRYZzlKOGxmMWZPblFvV2xrcHVq?=
 =?utf-8?B?ai9hRW5iNXk2bnE2a09nY2pRTnJFQlIxanRFalh4K2RwaERtMkF6RUJ6UTZ2?=
 =?utf-8?B?Lzl2MjVIZVppVE5BVDdkbUlxUDE3MDZBWkFGaWt3bFpsdHdTcXRjTTJLSmtH?=
 =?utf-8?B?WFR3blp4SGFETFFhSEpaMDZRbDBCNm9jRnFUQUhRYlorZ2NDQnVyeldXUVBw?=
 =?utf-8?B?dmRjSGVYYzlvZnkwajgwUGxOajEraEppQ1lrcVUrUjhKc2xhVlpYdUNRbkhW?=
 =?utf-8?B?SXdaS2NkNXBvbHlaTHhPcTM2bGZQSS9wV1RmM1dPbUtLMi9QenZuSGRKUEty?=
 =?utf-8?B?UDRIVW84b1JPMTZRWnlMYlpsM3htVGZrL2hoc2IwOHVBQ2liSElJb0phQWpy?=
 =?utf-8?B?bTZaQXd3K0dIR2JTOEM2bUJrb2hQN05OQWNTb3UwNU9mL3ZkTnppMlNLN1Jx?=
 =?utf-8?B?MnFJZHNWaTRncStxMVJUYlFZWEo1ZWs4MGVBUXJxWkRYaXdFMFQwTFNnbkh0?=
 =?utf-8?B?YjZnY0dDT1B4RGxRcTZFYXBhSkhpTkhDc0VaaERWeVMxNUZjS3dnU1lmRmdI?=
 =?utf-8?B?Ujg1T0dndkVzeDlYeEoyQXoxVlRrSHZacEVEc2J5K1dYQ2lIaEp4bnpmSTVK?=
 =?utf-8?B?RE9FODJLeWExSjN4OUhzblN1OU5MMFRuc1pad3A2aDZSV0tqeG0wVE9jWEtS?=
 =?utf-8?B?M0dtS2Q3SWpFeUk4aXF6cFh5Qnd3Q3kzSVVrL0xhZzBJam41NElMendSUmNl?=
 =?utf-8?B?Q2xsMk55NmUrMmFpTnZ2cExzR3pBVHVwMUVVNnBSRk1wME1RZDAwZ1NwVGZP?=
 =?utf-8?B?V3hxUFFldGVkWTJwVlRLdDNvU1ZDRTBUK2YrYmhZRW50REY4UnoyOHZReWFy?=
 =?utf-8?B?bDZEdTNSNHl4V3hKdHpJTFBiNVVpZC9PeEpkMThXZG9kSHYzbWlEK3NPdm5S?=
 =?utf-8?B?RVJ5czVPbWM1WUVtTHY0cHB6THkvSjZPT2JJWFk5cDl3a0MrZHdlLzIydjhF?=
 =?utf-8?B?MzVPdHpMTlQ3WE5KZ3VPcEsvaGdHanpHcm1SdkdPdE4zeGlIbFVWK09GanIv?=
 =?utf-8?B?VHJTRE5xaWZXcVBZMjk3OUJaZDE5dGl0TGlFWlRpWEZVQ0p5VHl1WnZNakxK?=
 =?utf-8?Q?m9JnuHx2+p1fzGxiURcn2aUQ65MZpDNjK7aIl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8668238-b0f7-4fec-c814-08dea9deb63d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:54.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R40SgVN0msJ3HZ4f1b9/1ks3FPz8JcIjgoq2jnnJBcEt+vfO0uWSJPJEIBZxSKfbs6K2oqQ8pKj2jasjFvTNVsHsfXD6ave0c+FUkleycX2M8+O7LuD0PDppBuOVwnvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: 5A69E4BDCCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36069-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]

Remove unnecessary inline specifiers from
static functions.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 558d9ae1fa0c..1c95e0022020 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -131,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -153,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -171,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -484,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.34.1


