Return-Path: <linux-gpio+bounces-12924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF279C6C82
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 11:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C35E1F2433E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394381FB8B0;
	Wed, 13 Nov 2024 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qWXxsDrW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2051.outbound.protection.outlook.com [40.107.105.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154E1FB8A7;
	Wed, 13 Nov 2024 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492758; cv=fail; b=JlTm3btiVNUilmhG0PyQvIuXeAgB+wnWq7HbNoVdEmZvYzM5peLyxomlFCU/g2BG6kFDis4TxqZQ6lMrnfFQuYW7oPeqdrV+AWGP+eOoBKzYRgf9wsrVyrKTBTVB8t3zKavhw3gJWZDm6Lx2Itf3Qkk2yxfLU5SZeiY4rgxsjLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492758; c=relaxed/simple;
	bh=2CUnFxEi1gUO6FkSTmt5362Z+m6I5OPJaiapfckAFBY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NksL9sfWAR4Ow9IVBt/uEeamwyOJblh8mxVRCzl+ZhB6FpsQtvvFdmk+eMGnEk9UEWFblub1HAIis4XOdIBaMHrZUvo2EZr5fpnZXNlvUBx27ql2evwMIZ7WF75ZX9hIF5OYY7YtHxmgvL8iD6mQM4xCC70Fu6ugBjY1BV1Fxio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qWXxsDrW; arc=fail smtp.client-ip=40.107.105.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1Nv2VU0DAUB/JEfhvipFhL3fPPpAp00gYkB2D937bGRMG8tbE5eBoWZoJq8QJ9kZDtXO8lS73FzKaSL8YZ6fFcLhyW21Iwd6wB1Bu/AsPoIouRju1eosRnY1dYK4tZ/bl3leB/y+BPPmbqmcoJXZrfpGujHrEvm2STgD1U9WoPJ4PFrFODLbYTn4eKyax1BAaj6qqvhB4tDY1jjzPFOdEe8E+wZ6ihRIpYajLVEF3IDeuYRqHBPfmiYV8TUFM+FbTtIhQocbFjSuJ809gsxBXos0mfdZmf2LbU49DilKs6IR5tDHOfOh/OAcOplku+sekhhyMzoJfg61HILDZaPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FRVjwa7ZDIndvL8FaZtE4RvqrXyzjfxHqmTWPGnubE=;
 b=P0H9j6Y8ICm0ufY7sKICJmlDuS2cJq/mhjOX3Lvb0+Ihluc0foFwkw/yqVqmup8dJypE11WLu0VYrxR6ZoPZ97Nls0hADZhfbMraUGtOEnIdJWOjY+Fq7gn01N8ep2tze8JS9h7nN9kADZPeQqiIXLW1z5kjQNVU2WWOIcwgnZH1o/7dFgdA5bV83yyLp0AM/U66RspDvXs+NmCivXBA99bq6I6N5vbqR4Y1wwMLgi+D4tX/YhmgOcA3wFs8DksGnDhiyHcXGdPjYIE+yJCFBuxgNUJl7IwKxSpvVpBE9V9jnqEx9n+VFreMUsO7XCu7IKXSpa/ECs7Y/yEqR7t/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FRVjwa7ZDIndvL8FaZtE4RvqrXyzjfxHqmTWPGnubE=;
 b=qWXxsDrWp5Hb/04sf1YaBhmvD/4Hb7oFF+LQD/kuK507x/aCooyBaBLkh5xbcgDmMjoLXPJO58kwEM5sLSd/sCySZRlgam3vUig3OM7OIcfJ6PGytxuGkhTGDgAsWSycfbpkYCm7jwKQeJbDQoppWYseD9TbTlrcPZF9aZNJxUswdOOSnkcF/MxPuNcFVhf6F3LcDBpOdRdDK92m1Lj/TCcSj4ZRsvL7AoYM32AQhoBYM7T5+62FBjbTz31pbosYrzRuG4BjcF4Ef2RwlVQ2fEQt4aOtFtdW/CZpEmhWrFJFTDY8TvMTzsN6am5K/B9/DJ8c5525P44pyh2fiuasnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 10:12:31 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:12:31 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v6 0/7] gpio: siul2-s32g2: add initial GPIO driver
Date: Wed, 13 Nov 2024 12:10:52 +0200
Message-ID: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0005.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::10) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5668ee-a74e-4694-bc65-08dd03cbaea9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2xobkhmWWlSbTc3eEtEM0tYcnJPYlAyQTd5N3dGQXlCV2h6Z29MaDZ2ZUZS?=
 =?utf-8?B?a2F4OTAxZTZIcFpFajNtSjRSTnBTalg1NXJ5dzE5YS9IcExscEJUMWtHcHV1?=
 =?utf-8?B?VTVkVlpzRkxrQUROZzQrY1NUeFBDSzErUS9MMXBFYVJnOHFUcHFWQTVUb3JZ?=
 =?utf-8?B?OEtGMHFxSHcyWm1Vc001KzhlL0hVb3hnbmlIWHN0NGhZdCtPQmZ2WWtpT29l?=
 =?utf-8?B?UVh0dEptMnRKd1F2R1dualhudm1zejNkaGdtMy9wQUxmMFhJY2NOeHp1Z0dv?=
 =?utf-8?B?Mnp0QlZZSzRCZEI4ZndMRTJXQ1BGcFZIbERwQzNhdmRyc3Fhbmo3T3JIVklP?=
 =?utf-8?B?MlExSnpSTlZTcWJnUjRMN1NaRHNNRnR6bVF0V25RdEpOQUFjTm5wNDdlajZY?=
 =?utf-8?B?RDdVOFlKMXk2Um9ycy9FWUZmRkRwSVVDYWxaR0xCSnZleHA3VHJBbG90dzNa?=
 =?utf-8?B?U28yek5iS1BwQnUyRmtRd013ZnllRnRDRk5yVTJEVkZhQy9Zd0NaV2N4dklO?=
 =?utf-8?B?SW5weHF5Q3Bna25RWWJ6cG11MDI2RzdiQ1I2d2dwWEYyRFdqNHNqN01sdml5?=
 =?utf-8?B?R0tLU3dWbjZtWWFaYkxyTkRnNXMzTlpOclA0ak4rTGlpeFBJNEhuakIycms3?=
 =?utf-8?B?aTZJSGVWZG5GRE8yY2tDajd0SU5DMk5OQWJsdjJCQVg2aVMwbVUxOUgwNGN4?=
 =?utf-8?B?cDlzSlVrM2IvcXhXSWhmNjU4Q0E4NExxMXhhK05hNytYcm1ON2cyanJ5cGwz?=
 =?utf-8?B?Mk9FeW1sTGJIOC9DUnZmSVNHbkFVSTFJbDVkRjhsVXFXb3c5ZFlabXZiNkxR?=
 =?utf-8?B?RVZBcXBnSWxtcFlPeURpa3NnampjKzZSb2RRRkFUWEpYQnBOYnJOYU1YWUgr?=
 =?utf-8?B?NzVrVmJpak81RHJxNDZYNGk3UktzaWo5Y1hKSU5TQURVMW1HV3d1dzJyV3pM?=
 =?utf-8?B?b3J0dEFwQUduUWY1V0N6bTh0U0hWUGljNFo0a21PODEwT09lQ1BnaGdoeGVt?=
 =?utf-8?B?Qk50ck8wdXIreWV0aVVzYWZFSVVZQUJKN3huNUR6ZHRVLzlNOWNxenh4QTlJ?=
 =?utf-8?B?YWZKVi82RzlDL2svcDYrandZNE5sSXJZYy9peHlKWUdmUFBkZSt1ZFo3eGkx?=
 =?utf-8?B?dW4vWjZEU0ZRTzZoandubVcyeDFWZStCWWx1SmRmbXNSdXpHV3N6NGhXY3RL?=
 =?utf-8?B?WmllYUJIQ3ZhMldHdlJTVzlHK1NQT0JLVENOUWwrbUtUTUFhNUlVdzA3QVVN?=
 =?utf-8?B?WXNheCt6RFRsMjc2TUlrTGF2SVlUOTgxbEh6UDRkVUgwbWkwdW92S2Z0V2lI?=
 =?utf-8?B?OUdpazdsdmd4WFBTektBaXFtcm5pd3pFNFpZdUVGUnd4WDdZTmc5WlZBc3hC?=
 =?utf-8?B?MG5kWitoR3hNWExVK2JObmF2cWpkdk9hMlZvUXVIZnVEZHluayt2eGJpUEJG?=
 =?utf-8?B?WUpuancreHNwbDhXL01iMVZaSU1UN2xRRlA3ODVjWVlscWdrT0tuaWU3eldR?=
 =?utf-8?B?VHRHK3J0aStpT1loRitoSTkxVHZROGlLWlJhcnZKREVpWGg1a3ZmUzV2b29a?=
 =?utf-8?B?c1U5ZzFMdnJWRlpHZ0pNTDkwWlU2VFNLbVRDdzFlL0RRYnRvNC9IQjlTb2hn?=
 =?utf-8?B?dWRBRjdUMzdQWlh6U1ErVytiaVBjNituQ1B2ZjdqRkEwWmpjcXFkOUZxbXFT?=
 =?utf-8?B?Y0hyNlJjZTBwVXNTekdOVStEc0FsWG0zc2Z1OWZMZGJaNitiTGdadHc0dDBK?=
 =?utf-8?B?aUdCZmtMdFFuWUFlTnFGOVJTc000czBFVGE0cEo4TUM2ekdnSWsvMkwwRVJZ?=
 =?utf-8?B?UXk4a1V4clVlMGQvbDhLN2lxZlNrcHZOTUdxTXJWYTRweU5YMFZGdnQ5ZTJr?=
 =?utf-8?Q?wQ/DfbRctNkpS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWIraEpUakVuTWo3aU0zdVZYcnE1eVd5VTBOcWNpeHlZOFZLVFFWemltV3lZ?=
 =?utf-8?B?ajZlZTgvdjREdUVPUkF6S1liR1dpVEoyOENuUjRKOVdhMmc5UWErbmN0TGw4?=
 =?utf-8?B?Y1FpWmRoNlRTK21TTUVDdEQralZ1U0MzT05DS3BXY0JpdWFsTW9TVGNjcVlt?=
 =?utf-8?B?ejhiOFpjdlE5SnF0Zm8xWW1wOWI3MlVvdFR2WVl3eFZFK0hLTTkxRTUzVWRa?=
 =?utf-8?B?cXBrN3NwRGV1NVNvNUsvMEF1U0UzT1FtRWx2dnkwN2NKeVV0M2s0dG5ubSsw?=
 =?utf-8?B?Sjl6K0tPTFdhTTBkRThzVUhCbDhFYlVDM2dwMlJqYks1K21vZEpMdjlDL2lJ?=
 =?utf-8?B?UFhlbTBOY1kwTXRGUC9sOGZEZVNMYjI2d0tNV0srQlVSMm5sODdVSkJueHRO?=
 =?utf-8?B?WHFJT0N4OVllZGRTY2NLWDFXUnZJQ3Vpb2lZVFoxdFd1N3R4Q1MraGJ3ZlBS?=
 =?utf-8?B?SkJKenhqQ1NQbjdveG9ieUc3emRuVEJUY2VBNGxuZCtwLzVCZHQyR3Y3d2ZQ?=
 =?utf-8?B?UEY1VHdQTHB6M2ZjUU00WFdKd1JjcG9ZdzhRcTRMbHhTL243ZG9tMkFjb2JD?=
 =?utf-8?B?ZzhGOExlUm5ieDlsYnhSeWRYOUxIdkZVczgyOW9seVJyZkh2OU9CbHo1L3g5?=
 =?utf-8?B?dklwdHFTZVlxZzcvWG84dHV4UGtyU2liOGNYc3gxa1ErVkFBOFpzUE1Nb3pR?=
 =?utf-8?B?cUdUNlZtY1JoS1pObXRkQU9sUkxGdkNPT05HL1RkelVnMmdWdEtxcXNBSkNi?=
 =?utf-8?B?SjgzUUQzSUVKYjMvSzNXMDJFWHlKMlk1KzFnZHNWSHJILzJMRGs5WmsvYTJR?=
 =?utf-8?B?Y3ZidXVJZ2J4RmZjRUNUeFZpRytyTGhLMC9EUFZTRFRPSUJqTnNIblFaYXU1?=
 =?utf-8?B?Rnp6NHdPYnplc1UrTzFJQmxtUjNuY1Y1VVU0d2RUMkxQV09YMWxSZjkvdVVC?=
 =?utf-8?B?Kzd5RTFYaHVRc2phRWRoTStTSElTZ1ZlMVpOZERUemxWeGVwT0M1a2Zvd2FO?=
 =?utf-8?B?VDRoR2ZyMzVEbVNNOFNaYTR6KzlnWW9ZODV4azhmbzNmdTZFTlNnOUU3T0tT?=
 =?utf-8?B?VWdIK1JGcUExQnJiWWxyeVd6K05BSWxobUR6TkZqNExzU2FmQWVJZHh5QmQw?=
 =?utf-8?B?SzByZVJUY2cxSWc4TmlRSXpuZGU2ekwrNzlUZG42azAvcWNYK2MxU3lhZlg0?=
 =?utf-8?B?RXU4KzhydVRBRFh5bCtReDBOcEVZY1dscWJQV2s5WVI5N3RFOTF4ckk3cHdq?=
 =?utf-8?B?ejFRUkZIT28yajFZdTJGR1FlSkVKVzJpZHBDNlIraXVBT0pQZDY1Y1BjdzhR?=
 =?utf-8?B?R2w3ZjhRWVVIUE83VjRJNE5ZV21QN1c3ZzdRUXRibVEzcTBsYlpBL2lHOTk4?=
 =?utf-8?B?WVRJSjZ4bThFRncxbzFucDF3dkpDUEh1VE1ZR0VtL1ZZZjZ3eFNRb0xUMFEy?=
 =?utf-8?B?OUJ0d1hVamErRVRmMjNSY3luODUvTnBkVjRxSmQxRXlzcENFamdEK3BGVi9j?=
 =?utf-8?B?a0NRbm9iUGViWllub0thRWFWN1p1WW9BK0ZwT0JxM3ArcmxjaEZHT2ZaTHZ4?=
 =?utf-8?B?K3FRdStBeTNzRUNEY0FCVjBZREZRN3NYZUtTaVBBQ092V0Z3Qzk5MDdlNmlH?=
 =?utf-8?B?d0YvaWxrZmVheUxaM3JNZG1Qc0dRTnlFd1N6Y0pQSjdaZTRvYmJvZ0RRdWY3?=
 =?utf-8?B?T2lyQk96dHRQaE1tZExLdDgzVTVaZEZBaTFtM2sxTHZ0SzdsTUNRNlhRNERN?=
 =?utf-8?B?VlJnMnZMazlweGM2eSt3NlJmQUxIMDFYdmpyWWFPZjBIdmxSc1o5cFVLc0Jo?=
 =?utf-8?B?eThzems1VWlpMXRudW16dWpXT1k1dDdoKzUzV3lOQ3c0UFVNSGVmbzhVbmNV?=
 =?utf-8?B?Zm9lVFBpWmxEUW9hM3FDcnpIZ1F3UDVRdERVdGE3cnBoWjRLaUhOWlZsQUQw?=
 =?utf-8?B?a0hYaVFDd0M2Y0s1bUU4K0I5VEM0WERadzRpUFQrL0lsNFJLMGNuRGtLVVRS?=
 =?utf-8?B?T0pQakdjbzJ5SllZSlR4a0pLK1BpdjM0aksvSjZvTHcycnZ6eDhRSE9aMXE1?=
 =?utf-8?B?NkRrb2tKWStxU0Q0RzZ1bWZoZXRvYzNJcVFTWUFzdFk3ZW5lUXp6R3d0bHlG?=
 =?utf-8?B?NDU0Z1Q5aEUzU0NqcGgybGl3U1p1VHQ1UTNENGIrRGxnUGFqY2xKaitscDg5?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5668ee-a74e-4694-bc65-08dd03cbaea9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:12:31.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehOwJVI/Yg6O8TUOw1IIIV9iCHJXaisP3YcWOSPl2AlCPmUY1+TJYrnj9Z3c13K8xOVVextIihfxvZ2ZtNqze56mVTcZDdJw94+SAeHPb+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

This patch series adds support for basic GPIO
operations(set, get, direction_output/input, set_config).

There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
However, this driver exports both as a single GPIO driver.
This is because the interrupt registers are located only
in SIUL2_1, even for GPIOs that are part of SIUL2_0.

There are two gaps in the GPIO ranges:
- 102-111(inclusive) are invalid
- 123-143(inclusive) are invalid

These will be excluded via the `gpio-reserved-ranges`
property.

Writing and reading GPIO values is done via the PGPDO/PGPDI
registers(Parallel GPIO Pad Data Output/Input) which are
16 bit registers, each bit corresponding to a GPIO.

Note that the PGPDO order is similar to a big-endian grouping
of two registers:
PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.

I have other patches for this driver:
- interrupt support
- power management callbacks

which I plan to upstream after this series gets merged
in order to simplify the review process.

v6 -> v5
- removed description for reg in the dt-bindings and added
  maxItems
- dropped label for example in the dt-bindings
- simplified the example in the dt-bindings
- changed dt-bindings filename to nxp,s32g2-siul2.yaml
- changed title in the dt-bindings
- dropped minItmes from gpio-ranges/gpio-reserved-ranges
  and added maxItems to gpio-reserved-ranges
- added required block for -grp[0-9]$ nodes
- switch to using "" as quotes
- kernel test robot: fixed frame sizes, added description
  for reg_name, fixed typo in gpio_configs_lock, removed
  uninitialized ret variable usage
- ordered includes in nxp-siul2.c, switched to dev-err-probe
  added a mention that other commits will add nvmem functionality
  to the mfd driver
- switched spin_lock_irqsave to scoped_guard statement
- switched dev_err to dev_err_probe in pinctrl-s32cc in places
  reached during the probing part

v5 -> v4
- fixed di_div error
- fixed dt-bindings error
- added Co-developed-by tags
- added new MFD driver nxp-siul2.c
- made the old pinctrl driver an MFD cell
- added the GPIO driver in the existing SIUL2 pinctrl one
- Switch from "devm_pinctrl_register" to
  "devm_pinctrl_register_and_init"

v4 -> v3
- removed useless parentheses
- added S32G3 fallback compatible
- fixed comment alignment
- fixed dt-bindings license
- fixed modpost: "__udivdi3"
- moved MAINTAINERS entry to have the new GPIO driver
  together with other files related to S32G

v3 -> v2
- fix dt-bindings schema id
- add maxItems to gpio-ranges
- removed gpio label from dt-bindings example
- added changelog for the MAINTAINERS commit and
  added separate entry for the SIUL2 GPIO driver
- added guard(raw_spinlock_irqsave) in
  'siul2_gpio_set_direction'
- updated the description for
  'devm_platform_get_and_ioremap_resource_byname'

v2 -> v1
dt-bindings:
- changed filename to match compatible
- fixed commit messages
- removed dt-bindings unnecessary properties descriptions
- added minItems for the interrupts property
driver:
- added depends on ARCH_S32 || COMPILE_TEST to Kconfig
- added select REGMAP_MMIO to Kconfig
- remove unnecessary include
- add of_node_put after `siul2_get_gpio_pinspec`
- removed inline from function definitions
- removed match data and moved the previous platdata
  definition to the top of the file to be visible
- replace bitmap_set/clear with __clear_bit/set_bit
  and devm_bitmap_zalloc with devm_kzalloc
- switched to gpiochip_generic_request/free/config
- fixed dev_err format for size_t reported by
  kernel test robot
- add platform_get_and_ioremap_resource_byname wrapper

Andrei Stefanescu (7):
  dt-bindings: mfd: add support for the NXP SIUL2 module
  mfd: nxp-siul2: add support for NXP SIUL2
  arm64: dts: s32g: make pinctrl part of mfd node
  pinctrl: s32: convert the driver into an mfd cell
  pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
  pinctrl: s32cc: implement GPIO functionality
  MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver

 .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 +++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  26 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  26 +-
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nxp-siul2.c                       | 410 +++++++++++++
 drivers/pinctrl/nxp/pinctrl-s32.h             |   3 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c           | 564 +++++++++++++-----
 drivers/pinctrl/nxp/pinctrl-s32g2.c           |  25 +-
 include/linux/mfd/nxp-siul2.h                 |  55 ++
 11 files changed, 1089 insertions(+), 200 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 create mode 100644 drivers/mfd/nxp-siul2.c
 create mode 100644 include/linux/mfd/nxp-siul2.h

-- 
2.45.2


