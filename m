Return-Path: <linux-gpio+bounces-23095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D42B00512
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB7A91C432A5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C60E2749E4;
	Thu, 10 Jul 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F6dA+mAr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3CB274673;
	Thu, 10 Jul 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157341; cv=fail; b=aHdEcvPpdvsw4yZO26eerKBZtv9V4Hbsx/7TjY6JPA48QLwLTioSyJjX40NulsOZbyRwCBu3aOgVwFJvDhGLBDvWOyAxOKEp7gMPpVZ+13InkfOmTWpTT5zHd7FSotEbU5FkXZWEFqTglC/g2VVpp+G4jWwGRFJvgRO6Ei4Rb14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157341; c=relaxed/simple;
	bh=/7u4+5EhCQ3ushr0L/Y2EsKtbhOjzzEp32ehLXnSe1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BAzdcNVXYhaDs+9qdTAxZfBuEvZQ5iQWWKDNm6p/TgSNSO2m4tvpDbJJp72i4PatfSgWK4SpgovcYqM5T7KQPR7WSzzW3JRcPg6UUYsjhBaILBgCfHE8z2ZdNyrq66iTDzq6LQUk+GQy30T0ZZbmG0wQH9RiJ0ZyZLz1p1vQJZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F6dA+mAr; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGBWosBdJo5XeulMThB1qOvu7QQyZ3lBffNsfN4ICag4vtyAn7BWN13ZQDLtQWDy7v8yd1YECcRz2gXJH1uWc+OtghI5X/GFnXn93D0i4uj8LK6Qmux9Sk81FRVFU9qRgkshifuMgCdX0MLCCTRxuF7qZgBOxCxP354sIL2h8JyBwrgTjJfr1cGX0sP9luMlC6lHqcIaEL1OUwtVUsLOSV6VS7Ur93Z0p2EhNevsGowrmowLNIIdtQ6lrPHIX85IZ5LnUv6V9u7m6QI1XPTNL8BEss1ZZoIpo/eo1JE+54iVfKz7fM6nVNtT8l16lsTvSxf84yYhg8iUW2sO5SBT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpzGVSHso7zV8jESoGYpoLdev9m+Vt6c/NibGYUZgTw=;
 b=L61KwNp4r2RKjNd1c+nijizQ7IM4xJR1RQqIhOjgfW+KoEnyrKc85tn1SsiXRNMxKlosqhg4c9gNsL03D0qpOdvpeYPcjRNDB43QIIC6zYhYv4YEMdDNPbFXNhPZIa6yacSYN2M6cfD+eh+bayUhlcCkkp/WIyD4mLIRdzraty5dxXtkQJD0S2aOu1lE2dHV3ldpsXID1I1jbkfHrmTJp+MPT6pOEOsdp64skjOPL30ee4I8nBpmRzEZvI86zxXfOLYsMwuC0GjH+jWE6Fc3BKYWfGQfiDFf5A8Oc84jpw2zMpi42CE6YCivVZhbE6tKB3Gg4vOpWSekFvXE3Ob/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpzGVSHso7zV8jESoGYpoLdev9m+Vt6c/NibGYUZgTw=;
 b=F6dA+mAr5yUqYjwRL3MQII5G9arbmCUjLLPzOz/yPMJpcLk7FDjQrbBRl81eRF85InPOvLuPIEVOFtB2sI0IdFWBJJwNEleG12OxW27zBlkNnXhHIZuivB55JBg0fo9NeZ1RawVZvzq00STLyTlQIlcezOzO8VIWDU26U0BahCiNUnM1dNCUJ4NrgM33WINrtU9NcnuEdxQoxxzwJizfANpCWNxkXfc+C04oEG0H4Rj9yD6dshi7lk6WQ2sISwRtQKFk9iOKJ90w2M6RJSCMl+WB9JTZNzXP1fERuritEvJGP6hJ56DyJS8mGtL8Zk4WCmz2y5DjFlfeZ+4DTql27w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:14 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:14 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 06/12] dt-bindings: pinctrl: deprecate SIUL2 pinctrl bindings
Date: Thu, 10 Jul 2025 17:20:29 +0300
Message-ID: <20250710142038.1986052-7-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|FRWPR04MB11282:EE_
X-MS-Office365-Filtering-Correlation-Id: b53cf270-5e74-49be-58b4-08ddbfbd2add
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTlsMzM5N3ZiWjA4MllUd0lsMWFrZWtwQ3ZqVE5SVVpXdXgvcERlbk5rVW16?=
 =?utf-8?B?SUNjdGZUQnFMWXFCWTNiS292UGtPdXNZdWJrdW41dmFtdW1tZVNzcUlVajY5?=
 =?utf-8?B?Q2JWbGovZ1hzYWRGaUNTdGNHLzFOYW5wOENPTGpUeWdmN0NuRGY4VjVZUFBH?=
 =?utf-8?B?aXdISVZCZXV3N3p1VlJoRWtvWkE2N3NYVFROSTdFenROUmVzTC8yVjRsSy81?=
 =?utf-8?B?a2x1Z09YekVhT3EvTHFtRU5pSTUxRi9QQXdTdnl1Q1VMVkQ2TjBJSjcwL21L?=
 =?utf-8?B?WmNyVVhIeE9hTW1ObjJpcEtBZndoRm5senFrS3VnRTA5VVdXVlh4dkZpcmtS?=
 =?utf-8?B?bUgvVTZjWGlPRGtmTTBtaVlUa2QzbXhwYUdHSVJzTlFRNzBiNlhsd3QzUXdT?=
 =?utf-8?B?aExjUkg4MkR0NFlZNHpxSng0RWdDUVh3T0hmS202bTd4SytJWjFDZ1VmU1hq?=
 =?utf-8?B?TW54L3VDSUpNSUZ5TnV4WVBMaUVSbG1pcTA3VlJVTGp5U0VBRGFPVG5UOG1w?=
 =?utf-8?B?N0lhU2lBeGFVcFVhK0ZTMm5FZUtlSmoxY0Y4dUphOG50Q3hYbVhjZGJ1TXNK?=
 =?utf-8?B?cStuM2RaWHRieG50bTFDN3VsTEFxQkN6SEZXNnZxeHd2TWZjeEVIKzViZkhK?=
 =?utf-8?B?eWxYZ2tENHVFZDMrQWRQcTAva1YxK1p1SjRpUk10dm91eUFrUnhPVkNiNkVM?=
 =?utf-8?B?ZnFUdXhoRE12enRIRGh5NXcyZmt6enhWOG10dW5ISSs1U3RKak5JZnd4Sm5l?=
 =?utf-8?B?eHVzSy9LU2lQeVpUNFp4OGphTEJoSXZFNVBRS2ZHaGZqbGxYTllkVVBiZlAr?=
 =?utf-8?B?Q2NodlNReTRSS0VCbjBFNytCWFpVR0hNcG5KVTlpMExIbHU1ZTB5L2VmMFg4?=
 =?utf-8?B?OHVtTFo3eGt3cGdONktLdlZxZHRhb1ZLakh0VVhYRkJUdm5SWVhmNndTZk80?=
 =?utf-8?B?ZlRBT1E1TnNPeitEYzNWOHpEN0swR2Vvc0J3N0k0c3VIRnlWNnEwdTFycURt?=
 =?utf-8?B?RHBXV2J1bWl3NTBERWtuejBDWDZINHZDVjRSOEJLZDdxRG5RVEJtbGRJbDFj?=
 =?utf-8?B?NWcxTVdSeFdRbFhMeFgvY2NmT21SUEsyd1lIempkU2wyaWpSL3QrYzVrY0ky?=
 =?utf-8?B?dXg4ek5HMnlyMjlhTjNiL1pqbnJXakk3MVNJSmcxY3JGRDM2aGE0eDkwVVJh?=
 =?utf-8?B?bFpGUWlWMGtFU010SVNRMkk3b0lmMDdsK2lGR09MZ2hFVnBQTGhJN0pFK0lI?=
 =?utf-8?B?dDk2WFNreE5tSmNTOXova0x3RzArQXBpb0VqcUFqc0t5Sm8zazFmcHh4WkJz?=
 =?utf-8?B?bnVXRmQ1WUlvd1NySEpnalZwQVpPTUpBeXZCWjRUSGxOMk0yTUFUWmRZbWhR?=
 =?utf-8?B?Ui9QTGpkeGRFdmFoakUxWXRyTlEvVnhGdUFLUzlyaVRhTDJBVVhHajJYaWJq?=
 =?utf-8?B?Q2VaUjNGSVpDOGR6VnRVcm9MYUlPOG9USzBtMTI2Y1Jkd0o4U3lSbEF3MDJK?=
 =?utf-8?B?aGVoVUpkcFlxTXZUMDRZanNoQlJzUE5mTFppWDlnbU93dXRWcmQ0L1ZiVU5q?=
 =?utf-8?B?aTQ2dFZvS2RseE5QelUrWU5hQWlKYXd0MDk2Z1hLdmNyZlFJeGRHUTl0SFRK?=
 =?utf-8?B?MWNYMGlwNE9USTY2QURzZFc1R1NIeWxSWEZwSmpmU0VkeW4wUnJ5a1lOTmR2?=
 =?utf-8?B?YkI4UDNWcFAyWloya25RdzZLYm5UVUhRNHpDUWNmVjd5ZmlSNVY1R1diRVdL?=
 =?utf-8?B?KzJpNEFzZzRPQ3hqcFU2T01pb1k4WlRHUDk5cXVFOXlZMms0aVBreXVkQW5L?=
 =?utf-8?B?WmhmOGlIdlNMU1NUd0pnb3d2cmNWV3ZPV2V4NFJNMWpUZjFML1JMcjRKclpy?=
 =?utf-8?B?S1Z1cU9TbHNSQ3J4dWdGaWtGUVA5dlNoZmp3emVOSTFwS0F0QUlXalNBV0U2?=
 =?utf-8?B?dEtKM3A4QTFyTWdNWjJFV2kraGEzbndOUzVzREJyVFAvZWNqS1VTSy85UUxx?=
 =?utf-8?B?MDBZK283Qi9HN3lpbWt4WER2UFZRdkVFUTljMDVlMXppZE5BTWZaRXExdEdJ?=
 =?utf-8?Q?vlaoFP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJjZ3BmUk95MmJYTGZsZ3g4S1BvOGVzUUx1YUh2ZUc4cjBxbjVxNWR0MGIx?=
 =?utf-8?B?UWNBNmdvUGlvQjF2b1NwVnpreWZwYThET2ZpVmJ2RS9BNnBwRjJXeGJqQk05?=
 =?utf-8?B?Rmpmc0ZpSW9pYzBUcms1RU03Z2YrS3JQOGo0WG4xQmw1VDNacjNjaTBubTU3?=
 =?utf-8?B?MDMzQkgyYjJHQTYzcTNNd0tlbHVnY3A2QmthSE9WMFN2NnYzcnR4Q3Z4emNn?=
 =?utf-8?B?ZGhNclh1YzR5VjQwYzY3TDdDNFRRQjR6VjNueElQK3g4SFdhZ2NYVHZGSlM5?=
 =?utf-8?B?cTVZSWJjb2pnSGR5Sml1OVo3L0trTGorQVliL1ZPaWRGb3VQQ0dHRE1NMkxr?=
 =?utf-8?B?bnF2d0Jqc1BDWVNrQk9XV1VselJYOTFtM0dOU2lmRy9ET1FEU2phYUhMdlc2?=
 =?utf-8?B?Njg3bVZpOVRKTHlqcStkcUg5Y2l3d2FyQlF0Vi90ekdMWm5xWlltc2JXOEcr?=
 =?utf-8?B?eTRqb1pjRXpzeEx0dTMzMENPaGNHV2lvcW9Sc2FrZ295dytmMFZtVjl2Wmhs?=
 =?utf-8?B?N3hkcTdUMmlUT1RkK1BiTzdtU0xrNFdkYUpKZSs3eW1OcHd5N0Vtb0kzdnRu?=
 =?utf-8?B?N0ZZMnc1RzRBc3UyVTJZTGNUZVNqTjZzeUN4SWl1a0IxS3YzMkpmUmxSQ1Zr?=
 =?utf-8?B?SGJWVXlFZHJKQWZZZUhuNTZBQ2Nza0V6TUpjMlA3d2JLWUYvVnA3Y3JVUFJu?=
 =?utf-8?B?THVNN3RMZ1FuVHp3QUoyaXNLcTNYYUZudXEvR1NpTkRINEYxSVZIWDFBdU92?=
 =?utf-8?B?Mm9WenBCREJuUDVUSW84YWtTN0VrODBqSlJ6MEpoK3hlRmVsVHpYaVRPeFFn?=
 =?utf-8?B?eGFHYXFSY1ZMeTJ5QVVtS3NSemNRdEczc1JRYkRBK1dyeEVuNzJOd0l3dURG?=
 =?utf-8?B?L04ySHlBTXRVWjltaTl4S2NkM08rdWcrN0gzVmJ0YlgyYUx3Wk5QekgvSUdD?=
 =?utf-8?B?WUFkRE9UN3o3OHFReTNwbFVJZ3BsWWtnVTlJZzJuNUNHY2d5Z1J0Z09KOHNw?=
 =?utf-8?B?ZFh3SWl1WlVKeEF3dHU2WlVybTJXMjQyUzlNRjRCZ20zeWROY0lZcDdyRUlM?=
 =?utf-8?B?L3prdU1ReDZlUHlrVTdtaWcwWU1Rb2NpR3FaYVliSEpjcTVTemphTGlRMVBL?=
 =?utf-8?B?RUY2M2tlekZpTkJocGxvdk91UlFDTnRIbjF3cEJzN2o4cDlBYmVFWTRmazU0?=
 =?utf-8?B?dC9RZGhUa09ObG43a012UWg1Q3BPeHh0SDdHQmJmcVhSVHdXdWR0WGtOV01p?=
 =?utf-8?B?ek9sU2NrLzBtcDJySmFQa0traTlKcVVORVdwUDcwZ0VuelNYNkRIdE1nQzJL?=
 =?utf-8?B?aTNtVTVRSXdieDQ1SFgrdk45VlZaT3BlL0V4UW4veC9MNzRMODQrckViR3p3?=
 =?utf-8?B?WktreUZ5VFdSajdBL01MaVpMMEo0S01nd2RkbkkxTmIxWExjVlhhQXU5bUxj?=
 =?utf-8?B?dXNtbFVyLzh4RjZNY2xEMFNya3YwbXV2M3BkVTc3amxBZGUzV2phVElCdEl6?=
 =?utf-8?B?M1lRYzE2NlAwdFBkcjJEZVd5NWhaL21WM0picVU4a05OcCtXb2lxU2hFOFF5?=
 =?utf-8?B?cjVOMFBsOW9weFBBVlBWL0RjWXBDZUd6QklDZUc2UXBTZmUxRXRUOXZ6Y3FP?=
 =?utf-8?B?Tm9uTjRDenREeUdKMXlUaTg5Y3c5QTQ3ZXdLazZxNWJMUlJidHhad3BRS1A4?=
 =?utf-8?B?SzhBR0tHd3JZM3hJMXhsQkpueGYxY1lhUHNteElkbnFGVHIva1ZpM0JuRk9X?=
 =?utf-8?B?c1ZXaW1NUmpJVDgra2NqNExreWFOaEJUYUlJQVY0LzNoUDJHTktoeTMybys5?=
 =?utf-8?B?NndZRm10ZzY0TGJOVEFMQUpZcjVtMUlnb0tqWEtXQlN1YkdpYmpEUjFqRzZw?=
 =?utf-8?B?OTZSdjRpMHlLUzJlV24xaVl4VGkrTWhEdk1qUDF1SVJQL0hOcDQybExxSk8v?=
 =?utf-8?B?SUw3TFR6QXVlMXB1YzhLQjRDZHdHT3BYNXpuN2NheGI1WkkxeFNzUjR1Uzdj?=
 =?utf-8?B?Um9YTEp2dXFFRmVnb0tDQURvOEwwV21QR0JwN1NZNXVKRXdGay8yVDRlY3d2?=
 =?utf-8?B?bW1RNEZGZHRJKzc4MWdRYUtVbVZiQXR1a3dkcVYraXhsMWlSRDNSVzlFd0Zz?=
 =?utf-8?B?TFN3TnBPL2FraTBaSStaV0pReUR3M1hRMlEwYlZFMkdkdW9Lb2Z0VHZ1azFV?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53cf270-5e74-49be-58b4-08ddbfbd2add
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:14.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLwCtyuCeuXLN/7vsJWZD03AeAHAKZIDwQ1D7udHBGeRY4vH7zNnzL8A47+FgarAC/pt1ZC+TS6xryhqJHRr02iX/3tSyKid1WGMgSqArx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

The existing SIUL2 pinctrl bindings don't correctly describe the
hardware. The SIUL2 module also offers GPIO control and exposes some
registers which contain information about the SoC. Adding drivers for
these functionalities would result in incorrect bindings with a lot of
carved out regions for registers. For more details see the discussions
on the community [1] and [2].

The existing SIUL2 pinctrl dt-bindings will be deprecated. The new SIUL2
MFD dt-bindings are to be used from now on.

[1] -
https://lore.kernel.org/linux-gpio/20241003-overall-unblended-7139b17eae23@spud/
[2] -
https://lore.kernel.org/all/a924bbb6-96ec-40be-9d82-a76b2ab73afd@oss.nxp.com/

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..332397a21394 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
   - Chester Lin <chester62515@gmail.com>
 
+deprecated: true
+
 description: |
   S32G2 pinmux is implemented in SIUL2 (System Integration Unit Lite2),
   whose memory map is split into two regions:
-- 
2.45.2


