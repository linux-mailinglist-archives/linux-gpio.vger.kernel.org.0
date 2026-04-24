Return-Path: <linux-gpio+bounces-35445-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGMZD6nI6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35445-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:34:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6235458C46
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C382E3012CCD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29722DF144;
	Fri, 24 Apr 2026 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ALt1H1q8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDA29993D;
	Fri, 24 Apr 2026 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994350; cv=fail; b=NRaFejx/VQ5BSbuXVAY3pg1yLsN8qEbkmDRhSt5qN0oOGNpVb+1pjlJ/GafWuX+Eww7PqWuib3cyZvrRnhP/uigBmNZYp118DhUxD8fH5pey/jYgN9hyeU54yQEWvR/B6T3pDPzSwWqR1U6QN/ii0GZGwubSl4lGM2BJbqUhG4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994350; c=relaxed/simple;
	bh=jkCrKYeikdmQ6amES6JQPBP8RYWnlxuQ8EwC1bsJlOo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rWEgKfQcIuRKfJOKqCvCj11Kc9zL6UF9Zi8VVwM9oHQYQxHv6BrGy4U380MLGyyzPqE864aXLcFrz1ndaVklbzS8bcSpwAGbnrIUCz+TM1UTv2CbIrrsIvOQo81q8+18BoSTC9V0xqvPvDBBJp9901XEx4i48hDRbTjzDwMJLMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ALt1H1q8; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2NtaSKNFwIbt6aGuxN89Z+fkWupty4RPrzsBDDsH44947WDXhvn7szXVeh2DToU0ucmedmxvruOHLnfXBZRsD6zXwd9Mr1qaQg5RJ+UKSWctTRDHu2vqOj07S4W6vpmI+5zQWS31MPS3g6eiDxBGlZluFdd1qNVrSgICcUfd58HlM0P54ktxN2NTh0kHmPAcNRDF6vSABMpSYm3t2Fpl4J+fnYUj2DyD430Qn4gpbmRZUxrtNoGCtKgatcmSZ6V8Bm32+I73ypUaEL1Qfh/nIRNrxsvK7wQa0WQoQXDGmbC1q+62XfnehEQe6xu3MymTmK6KvWshYA8lABxKkU0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd6mzEqqLW3aU7Pmn/hiiKp76VY1eNSZg565Ecotyy0=;
 b=wxpu4zKWS5+hgh3JGGla2VpvHiXNal/3LUXIm4UBkQffIcOtUx4Io+Y5hW5KTj5WBvh5AX/vkhx8Lg9tdN3fsCOIaN1NbncwxcG3UrKEm1IICdexh+w9rPcFFFOTYtD4RNrqRhjYqZfmQt4yyf/FWTERJEN+o+3bkjAceunm/AQ4JRwghn12q+nAc0XT9WJ7UVK1sEPDdC39Id7yUWQk19BPqhkRI7hMnI0LrMp150Slo1FmyPumqj9CCSgbP7RCu7EUdIupldV+zSo2XKUI4jNcUX8nFuYjP2nW4/SES+o2hRGQArgCntzaNTu/g343fmgioU2ngX5FJq77ToxaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd6mzEqqLW3aU7Pmn/hiiKp76VY1eNSZg565Ecotyy0=;
 b=ALt1H1q8RXJ0Ra5IygqP+GXQyhCipSUb7TgUm0QDgSJZjbFtcPspTpy6ikqytNbvpakE/yk1OGGQjdjZWCRwIF3pNZQ0FfA4bCQy6UV3ZTzBequ4C07C7ajTQ0/O9DrsOv23o9hB1Pgr/yeLl843YXbaoAubb73NZm/uaB5l/KegWM7ksvLEa9Pyen6V0zRf6b9FkkcUFUNWeg8picoHjPlEzPpJdGp3AQmaZvWIx+vaR4NT22ca9d6MwsZZfq+q5LuGcaqGy+Xbg74GvTrUMciGdWtijd/V1soy59+Uy+ZvzCwOlKqvjEgrQXUuPh/15moGPt3GeV5DtNjaiufpFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV4PR04MB11730.eurprd04.prod.outlook.com (2603:10a6:150:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 01:32:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:32:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 09:34:46 +0800
Subject: [PATCH upstream review v6 1/4] dt-bindings: media: ti,ds90ub953:
 Add support for remote GPIO data source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ds90ub953-v6-1-a63cf480f8b0@oss.nxp.com>
References: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776994498; l=2701;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=pXbWQO4uMjgak74FrySFaYJsAa3sTB5MlYPpyYgRVr0=;
 b=Qu3ZwxMiM9Q02Huc2+QCrQY4hfY6M8liYLP9mLfIT8m1xRv+eBGRYfmMEDfFXiPvUDKpoOIkM
 EnuF0x9/CfTB2ZV4Eo6ET9ufZolkwYn2pAidOMZs1NEI0aC5nZq2zYF
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV4PR04MB11730:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8e0d71-4968-4cfd-9704-08dea1a1564a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	l44/McnxU+j08V68E9IKral2mACFuDZWmQphGDeJpTbxz3svO2jwxZDv8W8B8C5diRZlao8RDbYOVJZFwYR7SSBjkNLjle18/HPFsc8Uwl8NQ3IpkyKc8d/2W7VT8RnvW7pWVQG1f7doyh5K8k9cyz3xy84RQuR0amJoHqmInfp6Fp8SXN1ei8MZBSPj+9Xw4pg7ylwL+TtTTBbj4oEb46NqWSZqesiYcQJxHPMvnpXvQeRQBWDV+7OAYKoRGfdto52fmwiKcr4xVAKMVF3pErJ98F6tMoSyZDuq7TzDJ28nPgD50OlnkabtfmeSsO74pqZ20holFa0wpNNYS3VMFo+glhum/JyOnLIwngaNkOifYS5FJF6d/b+D+euEcwnQZu0y2j8h0zvAzfX/PDJInLn5ML664+0JDKlxi37yzkuLLUfkvQ/lS0mxrcJ4aQbT17Ty5D1nZWH7aCxSO5U+SHGyYpqvskD5dGe5Mc+MmA7Eddy33D+NDXeiZ+1hXPGPxK0XUG9aXeIdULuzKjFt6aiviY/rGWM5+/BhUVjMQB0BNAnoffpakkzpIgCErpnc4k+mnuf3p6iI5sCSqL+DNSLWMzw/OHz9gUw61xsweWIGiYQlsRghdHpFQhGftVbtcIvxBhfdqS4LisqlH2VYFLOfHvvITWw7qiNZXVwQEdv4bWzWZc2SwWX6QcCdH9eRF1pZ6MWeB25wMx0PAsn+RBGF8yRrm0wAjqghmjc5tKmCulYW494XYtrMIaAOtiJHQxdpJofLYfHQn4EMx3thcpoo5vCQc+KGf+rY+4+pBUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk56d1NWUmhhQU0xMklrek1UOU5FdjVuN3BPREFHb25Ydy9Vb2F0cGs4WkU5?=
 =?utf-8?B?WUxOSVFKWUdJVGt3eXl6SDBLM3Fkalh5Ky9nM05qdjJ3UjJvUmRRUUlpKyt5?=
 =?utf-8?B?eEhOQ0x1cms2b1ZObFgvRDl4RUxTNkJrZTgrT2pvcGRzNFlVR0pOaGNscFhN?=
 =?utf-8?B?YW1SdFRRTjZURlV3b0pTbmk1QzA5UER0bGcramh1R1YvcXN2R3o3MEdxZS9s?=
 =?utf-8?B?VWtGdGIwekdyVlFiVEJFQVlvZDIzRFBrTnJQeSt2eWR0aVVDZDNGU3RyWENq?=
 =?utf-8?B?T2IvU0UzdjdkZHZXSFpXLzJLaWNxVHBNaThVM0Q3d3pweHVEeFAxd2Y1R3hy?=
 =?utf-8?B?aG12NGNKQTRGR0pVKzBjY2pTeUh1dWpxSlpuRG85eXhiYjJNbGh2bERnWlB5?=
 =?utf-8?B?ckpCY2xNMEx2ZmREa0psUkV6V3ZoNWxGY05mR2Q5WWRYOXZSdldVaHpLWDNW?=
 =?utf-8?B?amVSYlJBYm5odHZZLzhpNjJJbWZ2ZDlHSDVsR1dPZ2VlZDVxdklaVDFiM0Ji?=
 =?utf-8?B?TDBUTHlGRkJua0ZEUEpJTUlJY25JYXJXeDAybk1UTGtNNWZXalZGYURGRlRB?=
 =?utf-8?B?S3pyTmJqQjJYVXJmd3FxQSt6Vi95NnRGZ2dBU09zUk43Z3E5dWhESitiMnhD?=
 =?utf-8?B?Y3pwOUl4eHNITDk2OGt5ell6R1R3cGZ5a0s2V1lxUGF6ZWp3TG1oWGN0VjFk?=
 =?utf-8?B?ZXdzT1lzeDZjQW9VZ2p5Z3orSEd5K1ZBa3JjOHNHVUh1MndJTlNLcDRaeFhO?=
 =?utf-8?B?d0xHMGt2WVVBK29EcFBxaStlMmR6bXUyVTAxaGt4NmFIeHFGVHNhVFZHa1cx?=
 =?utf-8?B?ZnBZL3htSGpxNVRXWDFlaHpsT1ZhR2k0S3hLbUtoYlM3MHhZNjdSaExkcW9q?=
 =?utf-8?B?eWJlN25BOHEyVWhjNVl1cDVuN0FyWjFxME45VThsV1lXcmpmUHp2cEUwRHNP?=
 =?utf-8?B?L09qQllSUDNmSThRanJTQW5GNkExa0dxSy83ckFBVmJwWS90TGZGcFp2VlZs?=
 =?utf-8?B?eWMwZlhYNlZDVnlGeVJrR3d2R3hDKzBEem1NU1k5M1pHdWJHL20wK3Jod0Rn?=
 =?utf-8?B?UWNZNWx1anV6cnU0TDBmc0hJREcxSGJBc0dnQno1WUtyNmRnbUhjd09JQWpp?=
 =?utf-8?B?SUY1cjdpMnMxbmdhWVBWeWhTaXJzOTAvc1pLQlBHZ2JiRkxFa2ZxN3I3Qko2?=
 =?utf-8?B?dm12Qy9zRHE2LzBhT0ZZd0hpRG44WnFZMVR3S2ZNMXpYcndPdm5MOGUrN3NN?=
 =?utf-8?B?UVRtTHdpcURlSmk0OUovSW13RncvWlpUNytXalpWYUk3Z2xhYzl3ak5VR3M4?=
 =?utf-8?B?STNLb2ZtUVNBRDV6QnVHL3VQQVExclU5RDA0anJkZHU4L0RpblNTaGJGeTdY?=
 =?utf-8?B?b3dwSW96YXd5cGFscmlOLzl6d0NyQTF6blBjOFdDWnpsYlY4RUhyaTJMTno3?=
 =?utf-8?B?MlJxTGkvQ1g1N2VNemhyMVJlUDRPRlY3VTVvQ0twakNMaTUxM20vWWNuZVFM?=
 =?utf-8?B?MWExWXl3WjNqbGtqRXY2aW0zTW05R2NwSnQycTlyOWt0WmlUK0NtS25zU2ZJ?=
 =?utf-8?B?eElIZWlBZVhPZjREaUNlajJNVExMQkVCTmRDRU5DU2dyaDBBRndTUnNsV2to?=
 =?utf-8?B?cmZEb3FLalltS2dLOWZDb2l2OEZVMU5FTXZ5cUdWSHdyTWhRbTRma0VDK291?=
 =?utf-8?B?UDJjQTUzbktzZjRmc2NtTHdsL1lGMUliWXdLRFZRZ1pQRHloeWh1dHFyak1X?=
 =?utf-8?B?QWRXV0NTWmxpbGlaNzd6Sml6ZkZHbXdsQy9pNmg5Nm5ZcmZFdFBLdUs1S1E5?=
 =?utf-8?B?MnpqSGgvZ0RQazJ6NldLdEl4eVNsQnFFMkwzZzhsNXp0bFo5bWhtRTh1b0Nx?=
 =?utf-8?B?Mkl1WHFLOGRFeW5rbFBVWGhtNVIzeUhZOExrYmhrckZheWJoQVg4TmI4NnZJ?=
 =?utf-8?B?UXd6K3NOM21ZNmVFQ2tNaDVFRFQ5NGZUbmNtMDFWbFFiS0t0c3VNa0tNcjI0?=
 =?utf-8?B?K0J3eFZIVE1IZ1EvVE51T091U0k1RURlM3JYd2UvS3VaNmxCckRWd3JRWUl6?=
 =?utf-8?B?SXY3My9GV3RZRXRnaFFJb1hkZ29RMXpPQWpzeUs3bjJNZGdmRGpEeHZQUDRr?=
 =?utf-8?B?R1MrY3NhVUVoWXN6MnhBY3ZWSkxQSmo4emU1U1RKN3ZFMDdTdXlDVlMrYzNr?=
 =?utf-8?B?RUNkdit0UG03ZE5CcVNsL2c1ekNLeUtSc21hK2laeUNnN2VGWEswbWNadkdB?=
 =?utf-8?B?MkE2Z1JkYmpYN0ptK0NTRXIzS2VSdjNVWldMM0R6S21teEoxOHN6OEgwenV1?=
 =?utf-8?B?WExrK215Q3NzOVY2NVBUMHY1TFBTWHZTSC9IMkJIeXlNTW5WUVZ3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8e0d71-4968-4cfd-9704-08dea1a1564a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:32:24.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rr87SkwIi8jTHNV6TWldQla6roQexWtFAoMq2covl1EoaolOOnC0JAwRcNrpH8s0TRkg/MmvL/0KBQZueDL01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11730
X-Rspamd-Queue-Id: A6235458C46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35445-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
output, it can be programed to output local data or remote data coming
from the remote compatible deserializer.

Add GPIO flag in second cell to select remote GPIO data source.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v6:
- Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
- Updated dt-bindings documentation accordingly
- Dropped Reviewed-by tag from Rob Herring due to significant binding change

Changes in v5:
- Improve the description for "#gpio-cells" as commented by Conor.

Changes in v4:
- Use folder block instead of literal block for #gpio-cell property description.

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.

Changes in v2:
- Remove new property ti,gpio-data
- Add third cell for GPIO controller to select GPIO output source.
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 6 ++++--
 include/dt-bindings/gpio/gpio.h                               | 8 ++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b7..da63771bc236 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -21,8 +21,10 @@ properties:
   '#gpio-cells':
     const: 2
     description:
-      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
-      number must be in range of [0, 3].
+      First cell is the GPIO pin number (0-3) and the second cell is used
+      to specify flags. See <dt-bindings/gpio/gpio.h> for available flags
+      including GPIO_DATA_SOURCE_REMOTE for remote GPIO data source.
+      Flags can be OR'd together.
 
   gpio-controller: true
 
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index b5d531237448..d04a494d96ad 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -42,4 +42,12 @@
 /* Bit 6 express pull disable */
 #define GPIO_PULL_DISABLE 64
 
+/*
+ * Bit 24 indicates the GPIO data source is from a remote device.
+ * This is used in serializer/deserializer setups where the GPIO pin
+ * on the local device (e.g., TI DS90UB953 serializer) reflects the
+ * state of a GPIO on the remote device (e.g., TI DS90UB960 deserializer).
+ */
+#define GPIO_DATA_SOURCE_REMOTE		0x01000000
+
 #endif

-- 
2.34.1


