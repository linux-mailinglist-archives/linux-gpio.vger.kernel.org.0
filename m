Return-Path: <linux-gpio+bounces-10710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D591A98D8B1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0482A1C22DC2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488961D26EF;
	Wed,  2 Oct 2024 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Sr1BL13j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381011C9B91;
	Wed,  2 Oct 2024 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877603; cv=fail; b=Pdc8a9WvTLopfvHwT4RgE5vw+yrjP7E1ZeuFZButiXyChtHZMOu2asnckOyK1FffroNAfetKmOWlBnZXtxnvDqi3mEl5e7Erj5qz4uTBtKIk1MF00WRhqPLE9F+ZfnEksuSE1dBjGIQTbC1eQSFSvVNO8szRLmjVZPpIRTDowzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877603; c=relaxed/simple;
	bh=+89A2MWcha6lWfvA0EYFPU6Cmt8P46HEyXi/LkUUCLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UDaS1klWawBei70numEJ63DWRoympwlHfGxeuwAOIUfYbyN3lc2LM/Ci8YZH+JdXrVnw/Ju5oJ4rmDPi5lSr/W13CH4uFFwcv/jv90rom8kQX5BU8plv4P7je5KcpMSxgjeg0EvQiUUBCw7FCf3zMi101DkaQMZXqROaO6/l7GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Sr1BL13j; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7xD44+E5KITjEJ95RjRCYmtwZTdpfNEzKa2GUAw4H60YddFOtrSmN02aBQD9hyOLCAMOOZbWK+k3yULPjtOK1hrYQfldXn3m5Zw/ST2YPeMeF0C7kPhd97/vE8AUALtYnHs6oyR91DZpOSI7qVKoEmLct+YWfeGQC90F0y+xyNnoFupyZaz0laNGlUqYuL/gdc7tcGTxEIeMwWgqouBYmxxN1AWg7y7ynhxY9eBm5hG3namDbbKSOou0OFIsowoIEzzWx2GxBKQBRDxER/0+7LN2kHt7KVy+EJEsuNVavFAybxH/pMlU8kNOxxuKn4bgn5oah5SRLfBOTtk4rYHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE6a8vJKdM4TOtNcCUd6LvcEfUDsPI2ewv+9jOagD7I=;
 b=VXOVxSKTb0uMwVkzyLKqghzLdLlCNgpNVL+/ZSsCN62ot6ZueA5Z6W/VDoRBoPkEsQlFh2MBUxkhbVAcS7x6gjv7ihmKnk5RJBsjA5lRTcLUKBjemzgN2orUlA1eQczqCebCn8Nx/K/7jqWD2NyxCXG9BVIP9umumAFYuba3sCvTVZJhOqqkLE6mBGUpRLb9wiZpdgjHXqs5PwMxweE25KnNT1nNOOyXz45vW+J+rQoxGJVX9M2ozlmrolpJzm5USI3i1tgAhmeJuU8EnD3RuQ9p+2nb7u3H1YhqvWlN9ndQMNk/ZU2aiWz9ckfm84CqCUEo2FhEPu0O1JbZ9qfIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lE6a8vJKdM4TOtNcCUd6LvcEfUDsPI2ewv+9jOagD7I=;
 b=Sr1BL13jnq6MTN9f07WMzXmcsluPYxmkRcNyAOJRtbN83HDH+Rgv841inkX6wV5dTnS9peZ4+O5zHxTE/R3+IblA09bRS70QXa9/g1XLc4k2CH/caRDfa38FKHRTmN/i/c2uvkXneB+mCunDstXXr84Q+7iIRes0L6MOwdH/7E3sDk43B0eImz80Cks70bLq+8oqh6ss54hoNVC0nQsJ4nrZyMP4kdynh3w91G43HNVwr5liuKFhSLeXzcVLcPxt7NfV88YuydzH6mb/HytazdA7Rz+qMzoFot2WiprkeQcd/HogPkarA3cHaBEjzMqytvI6wzTKssGHVSig4+cCUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 13:59:57 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Wed, 2 Oct 2024
 13:59:57 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 3/3] arm64: dts: S32G3: add S32G3 compatible for the pinctrl node
Date: Wed,  2 Oct 2024 16:59:20 +0300
Message-ID: <20241002135920.3647322-4-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::18) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: 556ad45b-6367-4cce-d7d3-08dce2ea7f7e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0JSYUJ1YUJRSUNFcjhPckdGTHhNSXEvREZNWWl3ZFgxSTRqbytVeFowaEVh?=
 =?utf-8?B?c3Y3d2tTb05UNTlObzMwQXdPS2NCNXJPZ0VCSk9QUE9CZDZjVVI0Rnl0eWRh?=
 =?utf-8?B?NEIwa0lUd0VkTlFwTGh6YlVHUVRkbDErenByUk9hQWk5QVFUd2lDR29oL2hJ?=
 =?utf-8?B?WEpBcXR1bEsrdFJVWmlhSVYxL1p2eUJSMjE0UXFLSVMrc2xHeFZHejRGVURW?=
 =?utf-8?B?aGgyL0UyZTB4aGhydFhPaUZRRzN1YzE3eVdQSW4rNG01UzBnKzdxeWJUbnpI?=
 =?utf-8?B?ZkYzYVhaeEVORTVwYkErMkRWRE1CekxhM1pBYjFUUHlGZ3d6UUNVZTlrcDVS?=
 =?utf-8?B?dWxkdXB5TVlHNEplRFJVOVU4d2FLREVtWVgvYUNPSXhsYldqckYzcnRnY2Fm?=
 =?utf-8?B?eTJFYURNbDlhT1hkV1pIUGZuSlJyZEJrSmU0RmpzaFZHcDJrZ0liOFlQSG5q?=
 =?utf-8?B?MkJOMmZDeTVxdTNHR2lnRHhZNXU1Y1NueUZxSVZvUE56QXIzbVJuakMyU2pR?=
 =?utf-8?B?YW5uTG1FUTdONDFEY01wSWV6WktyREQ2eGNTMjJpaHJoSVlMd0Q3UVI5NFdl?=
 =?utf-8?B?a2VaL1IvMUhyZXJtM1dvbTI1aDFDVHdZeS9DdklZQ1IxT3l5VGdQUktrbFZY?=
 =?utf-8?B?WW1CblRPVnYzeHVlQmJTQzQyLytwTEZvWFRBbFVMakFSRGh5U3B2d1FCZVEw?=
 =?utf-8?B?N002MmFoRUhZQVB1ZTFNdDM2NWtoWlB1ZW1aVElSK1FsaFVzS0Z4R2FTbmVX?=
 =?utf-8?B?VVpqNUtKdlZWTzRtaVBmR2JZL3IvYUIxallxd3pZTmZoUTJNTy9aYWxKaVB0?=
 =?utf-8?B?ZHRDV1lLMXV3UVMvYzZCY0w2MmV3QmcweHpNTjVEeFhRcjB0Q1Irb0lMN2V4?=
 =?utf-8?B?d2JlLzNoL2I5ZXdjUU14RHFqd010Q1A5OEh3WFFReFR2TGJ4c0ZmcGxPSkhl?=
 =?utf-8?B?LzMzVEY0KzhGcVE2WC85a0RRSVdSdlNvenp6VUl4WGRWMWw3VmNobXBnalVn?=
 =?utf-8?B?aGRSd2pDTDEyaGowNVNJaFpFbnhBWnp6RHFpNlVubHRmYko5cFN2TVdhNGF2?=
 =?utf-8?B?bUN2VmI3MStDVVJhU25Ib2t5dzgrMkFWSXRBcTJzcVVxandPMVpaSGJ6Yk9Z?=
 =?utf-8?B?cUZ4aWFTSXpjQXk4NDdwUnBUMWJMUWlLRHpWMW5YLzJRVzFXQUQ0WkFPbWts?=
 =?utf-8?B?QmJGNnpyS011cW1HUUNCME83YnZlcFU1WkRqczdnYkNId1JyV2pUUWdDb1pt?=
 =?utf-8?B?dmRBY29GVlcySjdjWVpDcVdsTXlDTm9wYU5kMjB5OUYyV3dPNHVDNHNYZnp1?=
 =?utf-8?B?aENlU0lRMWx0Q3Vkd3d1MW9YQ1NaTWNvY1Y4WDRtS1hoSmZjQVpld1MyZElB?=
 =?utf-8?B?cnNkVXNjaklkWERjaTFqSnZFcVZjWSsxekUyRXRaM1h1YmZpcGxxci95Yysz?=
 =?utf-8?B?RVFLZjVzS253UWNWSUVnbzRmem1PSEJ4TFpVZ00yUXBuMUZ4V0crZTNBMFR1?=
 =?utf-8?B?eXJRMDd4anVxa0wvbzB6aUJNdnBDSVBTbnh1R0lNYUJnenYxVzNBNWFJUnRN?=
 =?utf-8?B?WDNCTWNPZjdJdlFMYmxqRnpRNVNQYzdaNFZxMEt0RGtSanZGeHgyVnpXNEFo?=
 =?utf-8?B?RktHQytmd3NIQ2t5L290YzRmVTU3U3JaWHdaSzdTQVNnTFI4QmVPMnYzSnov?=
 =?utf-8?B?a3ErbE9yejFxbGFabDlUT2tWYjVSS1FLV1ppOXlGK0R0UldFZVpsWDN6SVM3?=
 =?utf-8?B?ZzI0RlIvYTVhNDNkODlHTWF1V3lIWEdGU2VVUm9xd3F2QzYwL3ZlNFhvSm1Q?=
 =?utf-8?Q?etK82835xszpyxnt6EMbmNPEEFWcf9N8k5iDM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDFVdUFTWEZiUU80WERPNDNiNzBveitpQU5BY3Q2V1ZzVGpWREttb2xsWlFE?=
 =?utf-8?B?c2lvVDd6WUlPNTV0SE5UdGMrMGxKZVJVdStmckprdThNckFQNFpUQmxzMm1v?=
 =?utf-8?B?YkJkYlI1MzVZckRreGphZVNSZmV0elJ2ZE1vdTc4emVacExaNWlkVm1kd1JX?=
 =?utf-8?B?Z05HQ1NTY2IxbExhM010TDJERURhZWtUbGJadG4yU080cHVKWEZRT3kxZS83?=
 =?utf-8?B?eVhQLzhPSThvQS9tTWl5dzNBY2d3bkJIdGh3ZVh5NnJBYmJBcEVjTGxUOXRt?=
 =?utf-8?B?S2NOdDd0ekxZdFVNOFFzTXdEWGpXcGZ2SXJPRUhFczNHbGdaSklPMXJkK2JR?=
 =?utf-8?B?LzhBN0kzUzIwNEtHNStOd0JzNWl5TGhvdUQrMUx4RkdYa0RFYTVrSWhrWVlk?=
 =?utf-8?B?TW55dldrYjk3YUJVMzVzalFIRUpnWVV6VnJGNDhmZitreEw4bHAvZm4veG9J?=
 =?utf-8?B?K0llNjkvQmkvdkgyUlNmU2tDVFZLalJWbHBYVW9wVWFBZk5KWmliTDJsSTVN?=
 =?utf-8?B?U1BJYzdISzdURDJGdE9TbncxZUVRVDlLbncxYUhtU3dHMEFuTDROU2R6SEVp?=
 =?utf-8?B?SUNWd0VYdGducDN1SnVtUWVBMTMxWno0ejFxQUQxcUJZZWFLY1dhOS9MeGor?=
 =?utf-8?B?RmZxNFhldnNuZUo5SmpMK3d0SXFjcWM4K3NLVkZ2SW03Mk9ramZWaFFVdmVj?=
 =?utf-8?B?L0h6R3JZWjQ2QnE4QmhmdkxRV3p5dVBFakM1QVJnSWs2TS9jMlNUemJwZ2E2?=
 =?utf-8?B?YVBmMDduZmJPaVdXaEt6YnhLZ2podGhuUktIUm0vWlBWdkdITHpEa05tSEw3?=
 =?utf-8?B?THVaWHNWZU53UEJBRUVIUE1wTU1sTm5IbnFJc3hRbnl4bzYyeFZNenM3Mm9m?=
 =?utf-8?B?eGd4R004MGNuOTFpdGZMZmhicjNST1N6R0JiVVE1N1ZSMUlXWkt0RER5Nnhu?=
 =?utf-8?B?Tkx6RDZRRFQxa2hzdnJBa2lYTHczUytmdlh5TFRqZmJQWk9TTktUSkFQSHBP?=
 =?utf-8?B?Vys1ZFRnQkNSWUJJNG5YWTdJNWpVUjc5UWdCZXFmUWU3cHIzYTRyZ0tyZ0xQ?=
 =?utf-8?B?aEFYVFdROUpjS0g0RVVIQ3ZTMmFUSnhlZ1lHcndwVVlMZHVFekxvNFNsRkpv?=
 =?utf-8?B?ZElicUNxWFFITWJOemJ0T2FJWDR2cDVrcExqWU1HbGYwYjRlWmVGNURYLytx?=
 =?utf-8?B?ZndXTU5IaTFZMzBXZnBmOVh3cGhqMUN2WnRhWWp4VVQ0TlRmamk1djFLOXVL?=
 =?utf-8?B?V2dmMjhzbHZhTllEamh3OWU5dXlja3Y1azJjMDdXT2tYRFB3ajNwUDNDVW96?=
 =?utf-8?B?VGNKendKMHhZcFZTNktJRWZHMWRDclJXSTF1S24zZkRrekV0b09DTm1USlFW?=
 =?utf-8?B?WjRadUZlVDNnd2lKR2NTcFFGb0lmVG9ZZUZNTVNldTVHNjVXRTd4TnV2Vk9C?=
 =?utf-8?B?bTY5NHgvOWJFWUxqaG5yT3QvQ1gyMkJwM1hpUnN5c05sYzgydkdKcTM4TXl4?=
 =?utf-8?B?ZGZpTVVUT2huVHN4Q0lrUGw3U2NGSFo0RXRiWHZsNkdlSlk0a1pZVzRRSDJK?=
 =?utf-8?B?Q2ptb0xmR1pVYUh6Rmpxa3l2NTYxSzlySUpLWVVvM1Z5UEhiaUwvSDUwMFFz?=
 =?utf-8?B?NHY4emFxdWdYWTNZYWdpQ2FEQjV2N2NtbmZEaHljMElMdFdTZUxYQWV6OHhs?=
 =?utf-8?B?eEFqbTQxMy9tZzJXQzVmbXRMWHZma2ZWMXVoamNWZUhrOVloNTRlMWVya3VJ?=
 =?utf-8?B?SjBIaDBWSUI3bXJMVUJDOEN6YmRiSDhqSUIzRVI2a29naUxOVUlWd1lFUXZZ?=
 =?utf-8?B?UzZ3ZEQ2UTl2Ukw0QXZtTTI1ZjkwUkEwQTVUeGJYdXZ5TkJreEM5ZDAzaE1W?=
 =?utf-8?B?cm5MTzdHeFJnakRxbzFkYXRIL1VsZlkxeHlzdGhtVlhtSjN5WDJIRGJiVkFI?=
 =?utf-8?B?d0x3Vm1zcUlsV3YyaEI0dEwwOG9YMU5udStLclByMDAxQ0VtZE5FbGVrTmNI?=
 =?utf-8?B?MmYyU0cvQUJRdlBlSkpNZXRkN09Jek11cVRrQ2IwWEt4bXM4RmxtMEtmaERG?=
 =?utf-8?B?SFhPZ0lTVFdROWpxSmJkR1RMaEJETmFOZ1doMUdpYU5aK3VobTZBRld4N1BC?=
 =?utf-8?B?ZG1vaHZsNW9RbWNxRFJaRkhENVAzOHBvQUIrc0FXRnFyQnFwWEZaelhGTFNv?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556ad45b-6367-4cce-d7d3-08dce2ea7f7e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:59:57.0932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UfE2u+k/xKUcvYXbp29RlrgC/iTCgq5+rWkOsfzLH2jBoxDO/QleFhqCzIU3U9HbPEEDikGGBdGw037ngb/gx7lcql0ZwgF8oUdvvGCXYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976

Add the newly introduced S32G3 compatible for the pinctrl node.
Currently, it will fall back to the S32G2 compatible.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..f6aafe44c9d7 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -172,7 +172,8 @@ soc@0 {
 		ranges = <0 0 0 0x80000000>;
 
 		pinctrl: pinctrl@4009c240 {
-			compatible = "nxp,s32g2-siul2-pinctrl";
+			compatible = "nxp,s32g3-siul2-pinctrl",
+				     "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
 			reg = <0x4009c240 0x198>,
 				/* MSCR112-MSCR122 registers on siul2_1 */
-- 
2.45.2


