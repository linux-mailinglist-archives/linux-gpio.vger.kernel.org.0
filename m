Return-Path: <linux-gpio+bounces-23097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3DB00518
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C239541351
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF6C274FCF;
	Thu, 10 Jul 2025 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bzvVtMOD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42C1274B47;
	Thu, 10 Jul 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157346; cv=fail; b=QZcdcimAFsuvLwBBuTepC7PvSnlgQZrWAup2qsCCQtxjRnBrcpij0yQIzv+gSexN/iF8k6tZQIRPbIiwvW9yUPyoH+dQvtPynjoO36Rz0g3M4f81hxcVl1iPODN7F4TUZBfH53o7G0qOsbokq/TS45YKA+h9wNy9AJ3f3RbyVfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157346; c=relaxed/simple;
	bh=8dX4kEQR4kRyuFSHUL+LFhob1X8FqIEmnsS/zfPvkt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDPFhHmr4/SdR00bUzEWeZZ0v3oix/IziDflfu0A2LC0AxTg0y1V3P09vga6vCAfbLghrZ8f7h0LTTQocPdA/nDtrevU7ixs/V5u6hxbVpcUGLgQ7u9jCM4oR2abyx4TuNVee5o41jEkvG2oTTX0cd6T9wqkI0N3VtrfiYhUj5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bzvVtMOD; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgUJpRhPRsjb2jmjusXVLGOS3vdXiso5iUssqPj+UzQlUOoBzbmwGRY2erbts1md8ygAZ/7yPuyF6eW56WWiyxglEcIrfP1bwP0kbn1xe//uVvVfsf75fz+h37/5asxmDGbTQnMCoLh1ZVfeDL1TfkxRUOvmcOdFEgkOasSfiGvL6f5vxtGThNhRY3rX503+WQd9bJiiZQzlHFp2p+OK0YNIIiBAkdtOBtq21f/r5n4hbvhVG83LeIy9hTHmutGSz0Wf15ImaBtLa9AnjtPK4QIpXBFeX7rHHd4QdyjizxGlMIC0S3RXk+L+/Nx4LcRNMZQoBwn5ifB5tuTm+XAbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQI22sxSbYGAd3lHz9lYehKFnDrIhAEMTfqg+y6LJpM=;
 b=dnQnE5BbYqEX9nWUbe7fmyUN+eQAO6ZNBTKtABhvqd4aKeQ0PBrDoSEkBmBkHJg83ceeKYMMhYFb0C5MswVdbjuH5mSNYW986Fm73ntEWO2OZp8pVY8F58hT/LLX45RT1zsizb6Z2mT65fEuXuXrKN+xy8DR5siUIZ3+7QQ1mu1WK6jEO/0KoyWJy9K+OjuzsJ4ba95gm5RnkDZtKYzJhFYl0n9obV9P9schyFnyZVH5BiM0K9zHQ5vaPLCOBiEpSlmmJk7lZ4mCXp3W7SvdSitVoTVf0kSnq98Q363ijXBPRmt/JC8NNKhv185mJ1jARdr8ZRwYYOxFv5Ws6BCz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQI22sxSbYGAd3lHz9lYehKFnDrIhAEMTfqg+y6LJpM=;
 b=bzvVtMOD3v5/tiqhoFYyu3JPCueMNdg2gPUKVzjki1oafwYyrx+A/cVtevYfQ4ImOOIAgJ42SySxeJOxkHkxzZvtWBgo1x5J89OeCFflRVAQXhWu0ClHX4Ffr9mEhq1zPPEwlVSColtPAmG7jEadd6+sJRfcJ9/dz41r6RxcVFRsxvm4mHaQd179hdy3x1Y7rlu0qvp6jPM+FFCPW0y0kHFB7Wu9EfqIZVQELiRQd3pjFVNVRPkzs8t7RpFkyDXN1AxrdCJ/VqCaYoiUDDkr7rJ+WiEAbZnKiZ8Db28z0X863MFk1soFv0flhbaBOI2QjD0Fv8khzKDylnE1BRuv0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by FRWPR04MB11282.eurprd04.prod.outlook.com (2603:10a6:d10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 14:22:19 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:19 +0000
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
Subject: [PATCH v7 08/12] pinctrl: s32cc: implement GPIO functionality
Date: Thu, 10 Jul 2025 17:20:31 +0300
Message-ID: <20250710142038.1986052-9-andrei.stefanescu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4ab7acf3-68a8-4665-7498-08ddbfbd2dc9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFl2ZVAydHlvR1I2dms0UHJ6UEFxeFJwelNwZmhLYUNKL0xPOVFDYkFhZGNn?=
 =?utf-8?B?d2J2TExlVzFKaDJRbXEyTlg2VHU4WHFIUkNZUExBSmNDTWRDeWtEbGc3elE4?=
 =?utf-8?B?b1l0dklnTUdHT2VhQ3owa00yeUR4OGFENDVta3J5VEd1eDl2Rm0rTGo5U05V?=
 =?utf-8?B?ZjNEVjJjbHRuMjFSdEhMaTZVcmdlMUZOcGVENjZac1Z3T3gwVnpKVmgyTllR?=
 =?utf-8?B?QWRVaElpdDZoRVl3S3BIVXV5Q1JzVDNVQitQTWp6a0c2aVhoS3ZVandrTEpS?=
 =?utf-8?B?QlpIUGIxTXllRURUWGQ1ZlRVM3AzQnVPQi9JL3hRMGJrQzVhUGdVY2RlYlpN?=
 =?utf-8?B?bUFrWEl1MW5oblFKWlMrYWM2Wkp1MC9sUzNDeG1kczY2eXIyUlVJaTNiMkI1?=
 =?utf-8?B?cmh0b1RyYkxpeWRkNllvYlNOYnR4VjlpNVJNWHV0NGdmSGRCd1pVNmQyWjlF?=
 =?utf-8?B?TFZmUDh2bXNOOUNBSWtSK1ZxZDl2SFpRZ2YwUmxqY1J4NnJOaWxEWG1Qajda?=
 =?utf-8?B?dUE3aEdGWVhMUHJ3U3ltMmlKNTE1cmV2REdCbm1KYVNRTWVTY0hMUFBPREJv?=
 =?utf-8?B?VEIxOXhNa1Q3WVNMbWhOUDR4T3F4UHk0UVJWUk4yQ2VGbUtCdnNiOFdMbHRW?=
 =?utf-8?B?L01PeFB6OERzZTZNcys3dVh0NE1pek9LeWxNVU5YenRSWmNrOUR3ZTdHOEpj?=
 =?utf-8?B?S2ZRYmRGTWtqTml3dmNqYmVwQnZXRFdQMi8ySXUrQ1B4VlR0Y0JMeCtidDc2?=
 =?utf-8?B?YmdVQUNkYlBmRlFaL1Q1RkpvTTVGOExmNlRGZGg5ZkNmMS90bnhGdVNKMTBC?=
 =?utf-8?B?dDhIZGNxNFptQlgwcTZtRmd1S3V5MWQ3VjQzME5oZE9BK01WcnJWQXh3cG8z?=
 =?utf-8?B?MndHZE0vakx6eFVQL3pMWTVYK1hMUW1nSnVZaE1KSlQ1aWVva3JFT05aYXJX?=
 =?utf-8?B?Yjg2d2JqOFQ3UVViTU9tU056SXdWOHpEdjJyMTZaN0liL3U3NnAvODB2MldJ?=
 =?utf-8?B?eWVaWlc0OWc2TU44M2dnY0VGRjZWNmViMFlrMEQ0MklVTkI1c3NpYjA1YUxw?=
 =?utf-8?B?Y0I2SkFvNzRKQVJsS2pJYVNPbElydlAwTGdNTStxUTVZY2RSRE9JQ1d6ZlpX?=
 =?utf-8?B?UFFvWlZZOWdHY0ZXQk5udjk5VDl5ZzNZTjJSMXB0S2ZSVEsvb2dhSVBlSmxt?=
 =?utf-8?B?dytKVDdyK3YvbEFMd1YxbmdQMDhYaXVVYW1kclpFQVVqRWFGRjMvSm5qdnU0?=
 =?utf-8?B?N3JxV0ptcWVYS1h5aXhQcm5uSXBBVy9zUUwwNkxxZ3gvcUNUcFhkTlFCR2d3?=
 =?utf-8?B?aW9XUDV0S2MzdVlIL2pKdUVRWmIxSm9mbmJZVzhtalRWSU5yS1RkdlM3OWEw?=
 =?utf-8?B?QTFlV2QxWHFLbjdTUDRmU0RVVFhkM0lNVitmd0pKRldPWnhPbU5BM0l1YTZN?=
 =?utf-8?B?U2VVUytpZGZRUU9OM1dDTm5SVGlzUXgrU3FwRE9iSG5KcUZWMCtKY3dqdWR3?=
 =?utf-8?B?clVoeHlWTzdjZmd2MWFzU3prYitxOXRrSFo4aEF0LzVzWnp4VVJsdmllQjh3?=
 =?utf-8?B?TU8va1o2emJhbHQraFJIZWpHK1p4QWVFTVFxT0U5S1FrMEhKZjNpSDVIbm1B?=
 =?utf-8?B?RmFQRitnVW1VY1JpUGFrUGdrRUJIamhiaTF2YW9uaFJsbEc2K24wdVJzQnhx?=
 =?utf-8?B?djFqRFJIdTVnU1RBQWZyaEh5WHFPV2JxY0FTR3lnTFlmeTg1c2RYNGFRYmFP?=
 =?utf-8?B?NWxFRjBBZTdQZ3ZzR2tBeXQrQXVReW83OHQ2bDBTYWc0b2ZiRmR5Tk1PYnJM?=
 =?utf-8?B?eURIeXZudjhjUld3Yk5uakFrSmdja0M4RTEyeWMwUGN2QUJ6MUk3cG9hVlZ2?=
 =?utf-8?B?R2h0OVpmbDYzUDZZazRVekp4a1N6eEtLd2lVbEZreHF1ZXh4WTVEZkFBYW9V?=
 =?utf-8?B?cWh5NkMxUFRwdjBaZjQwUHZFOHFXNVJTYnNCVGo2TTJkOVRBUmlMck9uMHd6?=
 =?utf-8?Q?GS3E33hta7xIYKRMOtbUcjYdwhqkas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZVcTJFcmFWYWlsWmJ1Q1N5Z2JYbVd2Rm5zVWZvNDFYSHFqa0xYTXBreHFh?=
 =?utf-8?B?dm5iUForZWhYQkgwSWZaMjlYYWRkWXZ6U21mTkczNlJ5bGFhZ3lWNk1COENG?=
 =?utf-8?B?b1ZyOFAybSs4SXltVG9za2tPYXpoaGtSSmdvajR3WUl0bGVNZ0F4eHpRV3RV?=
 =?utf-8?B?ZWdrcndYSjRubEJBdk5hbFBBdUYxcDNZUUs2cGl3YVBqM2JtWmc5R3loNysr?=
 =?utf-8?B?REQvNWhXcmg1YStsK09vc3piYmlDaC9mdXRqNHlDSkcybkhwbHFRWmRzdVRt?=
 =?utf-8?B?TElOem1JQzdPUWNrL1owY1p2a2pEK0p4UUJhcmNLTmpMZ3RjZFJleGM2WWlD?=
 =?utf-8?B?S2g0aVR5aGZ1SHhPbmI3anFkSDJRSC96cG9BaFZDNmwwcFI3RkpCWi9FRndn?=
 =?utf-8?B?VSswRExTenF0cy9nczlybHUveGhLb3VCRkVnZHVFb0pVS0VkbUgxZ0lmSTFp?=
 =?utf-8?B?YmVMdFhjdUdGNGdGRi91Yys0K1QzcTVRbUtvdUpzMFprK2JQcGNwRFROVXB1?=
 =?utf-8?B?TzdLSmRHV2E0ak9tWW9HY3JORVhQanY2cWxpenMveW9IVDAzbkFNYUZRQTNj?=
 =?utf-8?B?NnhaN3JVQ0dHV0NKaUNKN21qVXdTd09vU2o0L3FLa2hvdWJiYzZLNEIwRXBq?=
 =?utf-8?B?c1dyMmJSOXB1WmxiTHBsbW1OdEdWU1VoT3o3a0NSV3BqK1hmSzNXTW9hS1pK?=
 =?utf-8?B?YzVKcHp0R3pIanZ4OFo1eXh4ZmF0dXFQdEw0RXpIRnhyak0zcTFONlZzTUp5?=
 =?utf-8?B?MkVxQnhRK0sxWGZrQVVFMy9sTCs1RHVLeXhJR09GeGNiZXU4U3o2Q2lOWjQ1?=
 =?utf-8?B?dG01cnFHMFd3em1ScmJQQUIrS3gydlNTVTA3eHgrendsSUl4VGsybU1VRU5o?=
 =?utf-8?B?TU5qZkdEd040Zk0xU0lxNGt1S0pmQjA1Mk5nMXJ2NkkwbzdBaFdBUUtKcGNr?=
 =?utf-8?B?TjlqN2oxV3p6eXB1RGJrdmd4Ry9JTTBST2hwZ1ZNdnZZMUpQd3VPbGVYNnB2?=
 =?utf-8?B?WXZTSHhGd0V3RmkyemRxWWNocFJqNjMvQXcxUFZzWHBUdWFrZzZVLzhPK0M2?=
 =?utf-8?B?ZlZWTGFzNHh4QmJlaGhnSmxmMUVOM0orZm1VeG5URFF0MnY4SDN4YndNYU1j?=
 =?utf-8?B?TFNFT1JxRXZqTG9CcUtDR1MxU045MzdrUDhPbFFVTy9nakRXT01DS2ZwaFVJ?=
 =?utf-8?B?bjFYZysveTlPV1p1T3I3aXpKNHd4VWVPOGlwdU1jUi84K3BySGhydm0vR0xK?=
 =?utf-8?B?aFhmR1NyUytueVZhYzgzSGwvT2kxczhGODRJdkgrV2VrWWtYcWZHUXlLN3Mw?=
 =?utf-8?B?cTkvc2d4YTN3RnBUNzhhTTZ5YWdMUndaeitVS2FYMnlCRDExank4VHZOalo2?=
 =?utf-8?B?UWlkZVpDbWVBRmMrR0U2VHFzbzBtR0JmaWMzeEl0bGRBZjJTanFRSklOOWhG?=
 =?utf-8?B?bWYyL0ZCR05iTGlHLzNJWk9ubkRMSldXN0d4bUZkWGVQY0lGOXdRNkNsemc1?=
 =?utf-8?B?K3FwZkt5ajkzdnZOU1EyN3YwVVU5aHg0UVdtZmVrYmJna0dUbURJb3dNVlhB?=
 =?utf-8?B?aEZSYm9DcWt4NDh0cVpuSGNpSHNjWHRaVW9RWWJpZUFYOWN5K1BlU211ZFI3?=
 =?utf-8?B?YlF2OXd2VmdqNkJYWklZeHVtWjJKdmtkZjZwNkFGLytJbStHeVNCODJGMFhJ?=
 =?utf-8?B?MEtGWk9ENElJcHVWM3gvaEIyclBMaWN1S0I4a2M2WS85b3phZU0wYlRmTndZ?=
 =?utf-8?B?dk9Nb3hKZUxjd3JFcXhMemt1N1RzSjVzRlV5OGFiemYxMU80MStHMjRTYWxM?=
 =?utf-8?B?ZVN6cytzM25GQk44bXVTYm96aUlhek93QnFab295R0pvTld4S1NINmNYZXJZ?=
 =?utf-8?B?RXVUb0NGSDV1MGdnbnJ4R1ZvWWtrV2RSRDhZOWJTbHRLUjZJbFlXSjBxNzdM?=
 =?utf-8?B?VGZVcWljczVEU2IrWnBWaUNDYjBhMTJpK3MxR0FNT1VGckMrUEdQdklEc0la?=
 =?utf-8?B?N00wOG80RXoxSWpURno0YVpHREVnY0RhcVJib3pqMEduRnIwNG0waUNmSGZk?=
 =?utf-8?B?S3NzMzloS0JCTXRxT0RyTnR2T2FaOWtCVHF2YTgyWFR1cUE0Q2xGSGpCLzFN?=
 =?utf-8?B?UEpUYkozOUd3ZTFJZjAvSE9NTUZoWXQyWWFaMnRPLzZuT0hxRmVuSkM0Qy9r?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab7acf3-68a8-4665-7498-08ddbfbd2dc9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:19.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNKtBXwuqweZfUzk0tMXZvJTzR4dcuZxTg/EvV2Itx9GJBIujaytB2xFu0q91FhB2R59Drjq2FZWv6Y0UAWpjiQJZONr0zc/J/C/xelshd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11282

Add basic GPIO functionality (request, free, get, set) for the existing
pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
coupled.

Also, remove pinmux_ops which are no longer needed.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 402 +++++++++++++++++++++++-----
 1 file changed, 340 insertions(+), 62 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 18b81b246bec..8e9da792d035 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -40,6 +40,14 @@
 #define S32_MSCR_ODE		BIT(20)
 #define S32_MSCR_OBE		BIT(21)
 
+/* PGPDOs are 16bit registers that come in big endian
+ * order if they are grouped in pairs of two.
+ *
+ * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
+ */
+#define S32_PGPD(N)		(((N) ^ 1) * 2)
+#define S32_PGPD_SIZE		16
+
 #define NVMEM_LAYOUT		"nvmem-layout"
 
 enum s32_write_type {
@@ -99,6 +107,7 @@ struct s32_pinctrl_context {
  * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
+ * @gc: a pointer to the gpio_chip
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
  * @gpio_configs: saved configurations for GPIO pins
@@ -110,6 +119,7 @@ struct s32_pinctrl_context {
 struct s32_pinctrl {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
+	struct gpio_chip gc;
 	struct s32_pinctrl_mem_region *regions;
 	struct s32_pinctrl_soc_info *info;
 	struct list_head gpio_configs;
@@ -398,66 +408,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
-				       struct pinctrl_gpio_range *range,
-				       unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin;
-	unsigned int config;
-	unsigned long flags;
-	int ret;
-
-	ret = s32_regmap_read(pctldev, offset, &config);
-	if (ret)
-		return ret;
-
-	/* Save current configuration */
-	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
-	if (!gpio_pin)
-		return -ENOMEM;
-
-	gpio_pin->pin_id = offset;
-	gpio_pin->config = config;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-	list_add(&gpio_pin->list, &ipctl->gpio_configs);
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-
-	/* GPIO pin means SSS = 0 */
-	config &= ~S32_MSCR_SSS_MASK;
-
-	return s32_regmap_write(pctldev, offset, config);
-}
-
-static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-				      struct pinctrl_gpio_range *range,
-				      unsigned int offset)
-{
-	struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_pin_config *gpio_pin, *tmp;
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
-
-	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
-		if (gpio_pin->pin_id == offset) {
-			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
-						 gpio_pin->config);
-			if (ret != 0)
-				goto unlock;
-
-			list_del(&gpio_pin->list);
-			kfree(gpio_pin);
-			break;
-		}
-	}
-
-unlock:
-	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
-}
-
 static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 				      struct pinctrl_gpio_range *range,
 				      unsigned int offset,
@@ -481,8 +431,6 @@ static const struct pinmux_ops s32_pmx_ops = {
 	.get_function_name = s32_pmx_get_func_name,
 	.get_function_groups = s32_pmx_get_groups,
 	.set_mux = s32_pmx_set,
-	.gpio_request_enable = s32_pmx_gpio_request_enable,
-	.gpio_disable_free = s32_pmx_gpio_disable_free,
 	.gpio_set_direction = s32_pmx_gpio_set_direction,
 };
 
@@ -706,6 +654,297 @@ static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
 	return container_of(chip, struct s32_pinctrl, gc);
 }
 
+static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
+					       unsigned int pin,
+					       bool output)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	struct nxp_siul2_mfd *mfd;
+	u32 base, num;
+	int i;
+
+	mfd = dev_get_drvdata(ipctl->dev->parent);
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		base = mfd->siul2[i].gpio_base;
+		num = mfd->siul2[i].gpio_num;
+
+		if (pin >= base && pin < base + num)
+			return output ? mfd->siul2[i].regmaps[SIUL2_PGPDO] :
+					mfd->siul2[i].regmaps[SIUL2_PGPDI];
+	}
+
+	return NULL;
+}
+
+static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin;
+	unsigned int config;
+	int ret;
+
+	ret = s32_regmap_read(pctldev, gpio, &config);
+	if (ret)
+		return ret;
+
+	/* Save current configuration */
+	gpio_pin = kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
+	if (!gpio_pin)
+		return -ENOMEM;
+
+	gpio_pin->pin_id = gpio;
+	gpio_pin->config = config;
+
+	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
+		list_add(&gpio_pin->list, &ipctl->gpio_configs);
+
+	/* GPIO pin means SSS = 0 */
+	config &= ~S32_MSCR_SSS_MASK;
+
+	return s32_regmap_write(pctldev, gpio, config);
+}
+
+static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(gc);
+	struct pinctrl_dev *pctldev = ipctl->pctl;
+	struct gpio_pin_config *gpio_pin, *tmp;
+	int ret;
+
+	guard(spinlock_irqsave)(&ipctl->gpio_configs_lock);
+
+	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
+		if (gpio_pin->pin_id == gpio) {
+			ret = s32_regmap_write(pctldev, gpio_pin->pin_id,
+					       gpio_pin->config);
+			if (ret != 0)
+				return;
+
+			list_del(&gpio_pin->list);
+			kfree(gpio_pin);
+			return;
+		}
+	}
+}
+
+static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	unsigned int reg_value;
+	int ret;
+
+	ret = s32_regmap_read(ipctl->pctl, gpio, &reg_value);
+	if (ret)
+		return ret;
+
+	if (!(reg_value & S32_MSCR_IBE))
+		return -EINVAL;
+
+	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
+					  GPIO_LINE_DIRECTION_IN;
+}
+
+static unsigned int s32_pin2pad(unsigned int pin)
+{
+	return pin / S32_PGPD_SIZE;
+}
+
+static u16 s32_pin2mask(unsigned int pin)
+{
+	/**
+	 * From Reference manual :
+	 * PGPDOx[PPDOy] = GPDO(x × 16) + (15 - y)[PDO_(x × 16) + (15 - y)]
+	 */
+	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
+}
+
+static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *chip,
+						      unsigned int gpio,
+						      unsigned int *reg_offset,
+						      u16 *mask,
+						      bool output)
+{
+	struct regmap *regmap;
+	unsigned int pad;
+
+	regmap = s32_gpio_get_pgpd_regmap(chip, gpio, output);
+	if (!regmap)
+		return NULL;
+
+	*mask = s32_pin2mask(gpio);
+	pad = s32_pin2pad(gpio);
+
+	*reg_offset = S32_PGPD(pad);
+
+	return regmap;
+}
+
+static void s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
+			     int value)
+{
+	unsigned int reg_offset;
+	struct regmap *regmap;
+	u16 mask;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, true);
+	if (!regmap)
+		return;
+
+	value = value ? mask : 0;
+
+	regmap_update_bits(regmap, reg_offset, mask, value);
+}
+
+static void s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			 int value)
+{
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_OUT)
+		return;
+
+	s32_gpio_set_val(chip, gpio, value);
+}
+
+static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
+{
+	unsigned int reg_offset, value;
+	struct regmap *regmap;
+	u16 mask;
+	int ret;
+
+	if (s32_gpio_get_dir(chip, gpio) != GPIO_LINE_DIRECTION_IN)
+		return -EINVAL;
+
+	regmap = s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
+						 &mask, false);
+	if (!regmap)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, reg_offset, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & mask);
+}
+
+static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
+			    int val)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	s32_gpio_set_val(chip, gpio, val);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
+}
+
+static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+
+	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
+}
+
+static bool s32_gpio_is_valid(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	soc_data = ipctl->info->soc_data;
+	pins = ipctl->info->soc_data->pins;
+	for (i = 0; i < soc_data->npins && pins[i].number <= gpio; i++)
+		if (pins[i].number == gpio)
+			return true;
+
+	return false;
+}
+
+static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *mask,
+			       unsigned int ngpios)
+{
+	struct s32_pinctrl *ipctl = to_s32_pinctrl(chip);
+	const struct s32_pinctrl_soc_data *soc_data;
+	const struct pinctrl_pin_desc *pins;
+	int i;
+
+	bitmap_zero(mask, ngpios);
+
+	soc_data = ipctl->info->soc_data;
+	pins = soc_data->pins;
+	for (i = 0; i < soc_data->npins && pins[i].number < ngpios; i++)
+		bitmap_set(mask, pins[i].number, 1);
+
+	return 0;
+}
+
+static int s32_gpio_gen_names(struct device *dev, struct gpio_chip *gc,
+			      unsigned int cnt, char **names, char *ch_index,
+			      unsigned int *num_index)
+{
+	unsigned int i;
+
+	for (i = 0; i < cnt; i++) {
+		if (i != 0 && !(*num_index % 16))
+			(*ch_index)++;
+
+		if (!s32_gpio_is_valid(gc, *num_index))
+			continue;
+
+		names[i] = devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
+					  *ch_index, 0xFU & (*num_index)++);
+		if (!names[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int s32_gpio_populate_names(struct device *dev,
+				   struct s32_pinctrl *ipctl)
+{
+	struct nxp_siul2_mfd *mfd = dev_get_drvdata(ipctl->dev->parent);
+	unsigned int num_index = 0;
+	char ch_index = 'A';
+	char **names;
+	int i, ret;
+
+	names = devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return -ENOMEM;
+
+	for (i = 0; i < mfd->num_siul2; i++) {
+		/*
+		 * Pin names' have the following naming: P${letter}_${index},
+		 * where:
+		 * - letters are from: {A, B, C, ...}
+		 * - indexes from {0, 1, 2, ... 15}
+		 *
+		 * If the pin is a multiple of 16, its index needs to be 0.
+		 */
+		if (mfd->siul2[i].gpio_base % 16 == 0)
+			num_index = 0;
+
+		ret = s32_gpio_gen_names(dev, &ipctl->gc,
+					 mfd->siul2[i].gpio_num,
+					 names + mfd->siul2[i].gpio_base,
+					 &ch_index, &num_index);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Error setting SIUL2_%d names\n",
+					     i);
+
+		ch_index++;
+	}
+
+	ipctl->gc.names = (const char *const *)names;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
 				    unsigned int pin)
@@ -996,6 +1235,8 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	struct pinctrl_desc *s32_pinctrl_desc;
 	struct s32_pinctrl_soc_info *info;
 	struct s32_pinctrl *ipctl;
+	struct nxp_siul2_mfd *mfd;
+	struct gpio_chip *gc;
 	int ret;
 
 	if (!soc_data || !soc_data->pins || !soc_data->npins)
@@ -1078,5 +1319,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 
 	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
+
+	/* Legacy bindings only cover pinctrl functionality. */
+	if (soc_data->legacy)
+		return 0;
+
+	mfd = dev_get_drvdata(pdev->dev.parent);
+	if (!mfd)
+		return dev_err_probe(&pdev->dev, -EINVAL, "Invalid parent!\n");
+
+	gc = &ipctl->gc;
+	gc->parent = &pdev->dev;
+	gc->label = dev_name(&pdev->dev);
+	gc->base = -1;
+	/* In some cases, there is a gap between the SIUL GPIOs. */
+	gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
+		    mfd->siul2[mfd->num_siul2 - 1].gpio_num;
+	ret = s32_gpio_populate_names(&pdev->dev, ipctl);
+	if (ret)
+		return ret;
+
+	gc->set = s32_gpio_set;
+	gc->get = s32_gpio_get;
+	gc->set_config = gpiochip_generic_config;
+	gc->request = s32_gpio_request;
+	gc->free = s32_gpio_free;
+	gc->direction_output = s32_gpio_dir_out;
+	gc->direction_input = s32_gpio_dir_in;
+	gc->get_direction = s32_gpio_get_dir;
+	gc->init_valid_mask = s32_init_valid_mask;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Unable to add gpiochip\n");
+
+	dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
+
 	return 0;
 }
-- 
2.45.2


