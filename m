Return-Path: <linux-gpio+bounces-36068-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP2INLmc+GmdxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36068-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:18:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9904BDBD8
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 15:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B2533017E56
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8663DBD70;
	Mon,  4 May 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DCHhSdPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BE3DB649;
	Mon,  4 May 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900321; cv=fail; b=Fp4HeEkR7pp/i3l+dBl0GnMUH1V1GS4vPGil5Rd8GxZnwypxsIe0mAtyDU2c34ANuQrUucyBWEJM/zIWgZaOnY27+86JwlHtnKV/XY/Nnxqvp7MVSul1aeqE1FubSwGrtNSjZts2L8dPJtc46mmYo76VqkRdiikXQigp2PVwqWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900321; c=relaxed/simple;
	bh=jc0+MD27whEeuSyWunj7hx7uD0i0tYvrtelFerLYemA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aaJML3oBfTn4J1kjOgNzBEMy7xB68YYNrOeDV6KtFVmxpwnnho4uiW8945mdCGCzRAgFugl21wkLYxHc7WrIEfUew/y3aDF0NpEQ/SDW0b4WOl849CdPHFePto9cCXuB0Yr0NEtOuSLPrQy9cm8v1t7e8SbKRXbyX6AKad65o4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DCHhSdPM; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flexrkvCIyGBL7wvxO/fr/MG2sJcJNNDMFXKhIRwEVJwie855IW+hlTrWzCXaa1T9/VoquUMd1K3HJhZH3VhjJXR1xvIxj/GdI4phG7stRz+jo8tqn5S7BtRkS6n11oMwfZ0MNCROQbUF+ZlwBLQ/9HTqM2mJl1QLE3VokdXbzv2NcDaYPbJpMmEa6VEju7njc6CZB+D5NzUOg0zzw3dXpJRdmXMXqZ9D22k8Lp3RNYLYDJvYJofc++hl9lCEcNynfBKJxvxrVe2k4i8/im6uYn18B3t9qyH0IGw1//0rv7BQC4vvGw2jF9hGkGi+38ZHu+Oe/09GeamAmTWUOjWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwIjFPM+W6uPMSHOmuAZcqqOoIUlorblCFe1v+NRf3E=;
 b=KI2OGpoqzyByTLN4Uy30Q3Oyucn1q4jqnh45crT7TCmoT6Q76yLQDzM6PfkrhWdwmpT5f2rNx+Kaz+YAvJh+xL35rozwps1qAzMSJbkLjLtATb7hrQnXLXZ9xqt+TrJXyvquPoFHkTtkn4+6RARFwqz/9T7USqQ830AN8Yt6BjBhzHWoxK9ZBUgPwY2EfgXuWkuJI8IVcW7nIsASokm3NfFJgTm+dFTDM0bcTN78I2usQY5msoRbEsHyt5Avm3A6wieoP8OYLsbsNSZoorEZMlAArFzia7ynJpY6Tn6MbYTTJbOGn8gu6aDclq3gTbqxvFNH2BLRovI2PbXYsKFmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwIjFPM+W6uPMSHOmuAZcqqOoIUlorblCFe1v+NRf3E=;
 b=DCHhSdPMXbDcUg3gz3e72XmLD7x59vdZRk6Kv6BFvyA9FZA+X7klIOgyxWHhl3YmES+bCaoJT/bM0rdnXBKfN6Oz1C7WX4dsQBuWjczD0D6lo5adQd/7D23mLe9VxGAoiBX7h7/kCyjDlHQ7l3U2ZE0yYtpsp4Cq1RcC11radpBhbHJVXu7Qvcoa18hAAjkiH5SEQBKUayX/1rAuIaoKRm3qWBrlM9a3rdnB0nrecKZ8cU2ZObQ2wcB9MqjpVmzVvWcgvTmHX7d+Q0IyOzZjbI4VxSY1p5a54podMr5+0OPppg3IrRSIrZ2wiwdfj4kKu0s82SmaJ1hD61xlxC8hUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 4 May
 2026 13:11:52 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:11:52 +0000
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
Subject: [PATCH v9 2/7] pinctrl: s32cc: add/fix some comments
Date: Mon,  4 May 2026 15:11:43 +0200
Message-Id: <20260504131148.3622697-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1539d995-7445-4efa-bb2c-08dea9deb52a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 GDNRjpLUHSOY2+VDljiPWumQAprdg04quD2yHnGw95aOPgLmleB6KRjHz4A08gDQe28prEAuQgWrnb2k66BuEbbgm0Y+m/MufrN+/918f8zKx7A1xO2Kxk+FQDPNU2KcbSJ4caY2Zi/2OUTVxhK5tus0J3z4bzp0rZ1bhjCqpIhREANnkUIU9xt0TOhVcSf4P3eTHcMvTLrbC9LJcX9sAAp+B/rmLi1VhJkiYx+LwY107Q6zs0UCbdXY2+wLTwVz8nGNxLQLDIDcovkHU/yheh59g/U0ou7YZgliPZ8B8E706EDcknafjXKZLiCadasSaIvRgGWt0TyYhNvVhY+R2B3y0KBicigPJUR90IXEjNPfOG3BXtpoiLTylpZaJJ/jVipga18W6SR77Kq8WTyiENzWSPre4hS7z1ejk4vCWV304sVIWGjJuEj9/0Yk4qS3qnFsq1gSSAg/DCglqjk39Pe4yFKc699H9Ev3/+zSaedDm/aL1UJjRlII4N2yJ9kxVL9GYYB7I923Q7+Vn0p8t64fdfNL6+OinP3iTkBTQcNeULZVyXYeiIbnMxSaowme4SV7vgGQ3gNuqWpqgRgK2r7cpJ/eAWsTxijZnqsWrM48t37mVq/D+QQzDklYR6yYoi71Wi3jeQ/ZNtGTCs5a55V//Czs3bxGBouzgkJ3008d2dNoSuOMvjZ30bnDOLFtaBZT/6qbnVhiM9x5G/IT3/57sD+PauMyNo7E1P2iBL8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1NwNEhpZ09EMnZvdDJ4WHBTN1pZa0xTSUFmLzluVVZhNGhmd2t4MllleU1Z?=
 =?utf-8?B?MTFEOVp3RHlJZzFpeDcxTFdzYlBBcW9MOHY4VWZxVTdGVXgraVF6UGM0ZWxT?=
 =?utf-8?B?QUNhSU5LbFdienMvdnhjTXFScjd0eHRhdS9tc0gxc09UY1A4L2VKMFlMSlpa?=
 =?utf-8?B?SnVKbDl2c2pkaFkxTG5weXJxenZBNUpxOU55UDFsNGswTEl6Y2lvMXJCam1r?=
 =?utf-8?B?dVl5QVMycE4raythdUF2WGkxZG5kWEt6ZWZWRStWYUdoMEQyUWIvOTRKYTBx?=
 =?utf-8?B?R1hLWHJMSURwZmRKRTJWMWhQTXJ0d3d5aVlrS3BMVkQ1YkRmS3IrZnd1UXJy?=
 =?utf-8?B?aVRLK05DNkhoNGhScDNsZVMwVVdNQ1FWOWJUQ1dWMVNObXRWM1N2SWZGc0Z1?=
 =?utf-8?B?YkVuNEZNQUR6MDhJRCtOb0FaRjJFNjlvd013LzVVS3V1RG9SQ0UxL1RvZytq?=
 =?utf-8?B?ZnV5VnVZZFVKZUNtWVpXZCs5cEV0L2liYjNMWHd4TGRNYlE2WXkvdXpVTmxS?=
 =?utf-8?B?djRYa1prb1NJR2dWRjkyUnR0Q0t6NjlhenZud3JqWDZCQ2NIM3U0ZDY3c0NF?=
 =?utf-8?B?OHhJMkg1T3pheDZhWkJEMFY1SHpjN2d2TWdaWGg1b05PYXJVemdmYnRPWTdR?=
 =?utf-8?B?elNSRXp3TzgrVVYweldYWVVWZ21kdWdmc05NK1VmOU1yYmYwYUc1Ym5iaHU5?=
 =?utf-8?B?MHN3Q1dzSFk3YzRCZStnM1dkNE4yN1V1Tk1hMnFrKy8zdzY1Z3B4bUlvTUhE?=
 =?utf-8?B?RUhpaFM2YTFqWXpwYTVoRkp0cy9hcFhaZzBQNHFHTVQ3d0lpOFY5NndPUVg4?=
 =?utf-8?B?RzRKZ2pTaXJjT0lKbDR0cmVFaDE1ZEl5aEVRTVpIK25NakdRZW5teTlXQ2VQ?=
 =?utf-8?B?VGxQYk5OMnpsVTFJd1ZTWVNMamdGM3NBS3ZOaE1xQUhPWVJGakFWZG50MCtu?=
 =?utf-8?B?Uk4wMHA2cGkyZFNYaGM1NkR6TFZzSzVrbDE2blFMVVI4S3Y2Y2Q5K1lZNm5n?=
 =?utf-8?B?L3haR21jZWhKTGdmdWJybkdPS21FTisvVjJMVlNwWU9oNUdTVzFjVjdWMTZZ?=
 =?utf-8?B?V0pIM0JSeHV4U0Q1bmoyektmQSsyMFVSV0RVbmErMW50VktDTEZlNlFzbVkv?=
 =?utf-8?B?VXorNVpqc1FpYkZFRExPWlBHbys4dWlhQzhBYnZxVnUrNGQ0cGZxZUJVRWFB?=
 =?utf-8?B?Yzd5M3JuNTZ3d2JnY2ZKRkRTVFlNMGNuaENRL1ROWjVTbWRTWGMreS9PZm5j?=
 =?utf-8?B?QjRUS3ZSaFFoem54cS9UUlFPY3F6bVowc1NBdkFXTk9iZHQ3dUxxTEk4S0dp?=
 =?utf-8?B?YTZkS3dGOUVLb1FldDJIbGNKMUJvQ0tYbWdaSkpoQ2xlOTE4NnZLekVyMmZZ?=
 =?utf-8?B?OElkejNLbTNTVFRrM0ZETDh5QzhseFNPNWVSdCtlMjJBdEhON2o4TmdadUR3?=
 =?utf-8?B?Y0FkVXRBODFUbW1rUGYrZ1V0L3NwUVFWMlpTTzIxU1Q0aGhROFllYXpvbVpm?=
 =?utf-8?B?VHlOQUJQbDRhaGJYdy9JMVExWEt0VGs3cUpaYTB0eUMrVGxMUUw1MnhUenVJ?=
 =?utf-8?B?VTUxQzA3ZmJkR3hiZldxVXlmdGh0T0ZFTGQzMlYzV1YyUmZNUnFFSDBFYS9j?=
 =?utf-8?B?dHJMM2tJM3Z1aUhtd2FGQ1JFTXhQL1FRaUlNVmtiVWt5RXNaaXZidlNSeUdx?=
 =?utf-8?B?Z2JHUEF2ekYyamFkQVhod1JkeUhPYmZVYjBXSENwT3hmWk5XTjcwekg4ZU14?=
 =?utf-8?B?azhHeXVCb1VWQk1lYm5kaFM2Sk5JZ0srZkNxNnlRVlI3TjhBNzNYRmlGRWNo?=
 =?utf-8?B?R3gxQ1o2ak0wbDArNGdJbUhxY2ZkWkx0amRXaS9PQi85VDNEbTRyd1ZLbmxx?=
 =?utf-8?B?RER0b0pid3k4bUpQT3ptamNxaFplMjlxZW0zZHdJQll3MGcrKzdkS3lnYkRW?=
 =?utf-8?B?WGM5UUlkYXk5dk5BY3JvZXB6WkNEVWNsem1rRlBUd29rNGt4bWd3OUw1ZnN6?=
 =?utf-8?B?OVRjYVkxc0gzcGdNSFIzTG5POG16cUJLWEoyM0lmWXNJeldqSmFTSnVQZEE4?=
 =?utf-8?B?RU5hdno2UVdvU2dzczNKMmZFekZubk0vSWMxclNnT01MQ0xWNEhuV0hQSzND?=
 =?utf-8?B?T2dwMDFWNWozemdiQ21ZTHl0VDdoOGYxQkhXVFUrRnVCU3BlQXpZSE5ONlQy?=
 =?utf-8?B?c0dHMkJIVkdRTnVsRnFVNTlhSHBuTUJvQ1NrN3FZclhya1hFZXA4Z0J4eEd2?=
 =?utf-8?B?NDEzVzdudFVGNlVvbis1WjlVc0RIdlNKK2k5M0haUWVZNnFUZXpIMjd2bm9O?=
 =?utf-8?B?dWFOVGh0TnNhejI3WExNWDJLR1MwKzFYM003WUJwMUJKVHVRRERRMkxoZzFL?=
 =?utf-8?Q?/B0v2zVieuvrMi3ocPwvHrEVPY9omqogpVR8f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539d995-7445-4efa-bb2c-08dea9deb52a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:11:52.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP/VPy5ADeKvaUy8HVroZ6VRv65ir9Qd8JFgtwfYfU1OG7U51oixyQ62bMR8QAjqrqC3YfUzUNgsd9iH/ctkgGk4DsuhPO9c15QHuDD+nFpOpiFxlNyGHq4oUsbuvOZJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
X-Rspamd-Queue-Id: 6D9904BDBD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36068-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid]

Add/fix some comments and print
statements.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 56be6e8d624e..558d9ae1fa0c 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/**
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
 	char name[8];
 };
 
-/*
- * Holds pin configuration for GPIO's.
+/**
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -78,21 +84,23 @@ struct gpio_pin_config {
 	struct list_head list;
 };
 
-/*
- * Pad config save/restore for power suspend/resume.
+/**
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
 	/* Check beforehand so we don't have a partial config. */
 	for (i = 0; i < grp->data.npins; i++) {
 		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
-			dev_err(info->dev, "invalid pin: %u in group: %u\n",
+			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
 				grp->data.pins[i], group);
 			return -EINVAL;
 		}
@@ -970,7 +978,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.34.1


