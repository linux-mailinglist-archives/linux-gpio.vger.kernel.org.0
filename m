Return-Path: <linux-gpio+bounces-34178-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMCCHCBqxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34178-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:05:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889632D3A4
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 00:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B392301C961
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF444395D90;
	Wed, 25 Mar 2026 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ic+CNplu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B3E38F949;
	Wed, 25 Mar 2026 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479884; cv=fail; b=BbQ2bk5tOEZnWY7PEJiYEQbpFiwIy7QqilQF83oN3xP1Lrlwh2IsmdGDcBJtFdU8QT/OO0zIWXk3g84ih7N4+bl7rG0V92e4t2idRO4Tnqzb9u/RqJ8rM2z1hFBBsRyXJ37c67eMy4o+lsyv384Hzh46YhjhR/X4G1ICn6VUhAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479884; c=relaxed/simple;
	bh=Ptt/TpQC+N2e1tHU334VkibMJXEsxKwNk6LsSqK9JMs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rAraenz1vgbPi8E28MWNRCXRx72TGm3WOugxryYlCYi4Ef1h+UdqCYzVsu1JUqqYh3UNzemC81W+8ObcYncMo3RTb0xkAWbRu6xF6cGLq9r0SANJfp+Kc8TaJqJ0+EkvxR6y0u5J+uObyMa+Eh1ivEnu9F2UdLlBae/xGwpcB7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ic+CNplu; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXqCbDueKQaksoFq9RRV+TbVE0Q8S2eB40YUi+rOzOmA94QEjnURuybMHu3uep+ldtxPu1XDIOp33qVLRwKmyRP4jOIJdKaPEHHcgHomcQ2Zu2+e8MZSq8QgC+8XTlVo1QTrbyl2TmdRQaeDIDRzYnBB87PapyKUHo9xxXLfUmz+kSefpG3OYc3ldZjJp637uLmGRGaysXgJeLUPrSiYr9HoekHbVE7diPKqK/bsGstJT7+X8dmtSqEjgCN/YZoHFSHs4kdeBo93v7F26muMlAGhY1Em1fEMqsihjbGbCEPMN92oz1obZDXX5TyyxzEWncXiEuj3L/YuYviKaFno/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiYL3aVB4ZIKEaKk26vFLZVsbHDB3saRnU0wHe9RgBg=;
 b=IqWiWWcv9K1lYebCrnIgyd/slZZ5VFmPcVwQRnkYp7Njb7UOHoCYUlHeKAfRVBytudL//PwgxMGbMC8ysDmUDWsuhWf0N+JNwOPwHTGWt6NdZH3dsl8L8B7mCtd0F/fclZePIhbqz2wNqLDudLzxP8CobIY8rx6S6mKDWHQhZZ996GMJXcei/vUqFXgwOnB9gX62+ZiSrrfB+qgqOCwMtLyamKw5mhqNhF24N1oRg9jTkHzIlHkhkTPUAD4opCyMG9O/0sIqHgi9CgWyHwUehLi/7PrjACpbMxJHBfy1Ycpxa5/o3LMQ9MWcT07A6GA/ynF9OFcmic5ZIce5tjEajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiYL3aVB4ZIKEaKk26vFLZVsbHDB3saRnU0wHe9RgBg=;
 b=ic+CNpluEf6Gb3Qrw0/uCfig2P7ROnhvQZGMO6toFK4NBny605K3kGSZMKmqcYmChMpvKVFHAyERw3OfCtpAC9MXaXt58V9511RhT01SrzeXWSo5SPUsUG1+b1a+bBw7MwdvUYhJ/q3nKd+sXajHVZaqgtyq7OQdlRd/OpXSWe0dvH55nX3X7oppAKBYtvg1/xo31DA3tR1S2U1YOwWEBvf2YMrH70uZT/cfZw+wdh5WGTSYpDKJ56VKDMg2T5QWumvr39JejeravUwKq9IfylzWmupvJ6RUeD6wvkzYUknxRKwA7IWL8UOF2EpGwlDHpLBu2UFeHKuVS9LSI6LE1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB12140.eurprd04.prod.outlook.com (2603:10a6:150:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Wed, 25 Mar
 2026 23:04:39 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 23:04:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 25 Mar 2026 19:04:12 -0400
Subject: [PATCH v4 3/7] pinctrl: extract pinctrl_generic_to_map() from
 pinctrl_generic_pins_function_dt_node_to_map()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-pinctrl-mux-v4-3-043c2c82e623@nxp.com>
References: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
In-Reply-To: <20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774479864; l=6125;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ptt/TpQC+N2e1tHU334VkibMJXEsxKwNk6LsSqK9JMs=;
 b=XHe+h80OX6rDZa9Z2vCe/VNvbiYStmzAhkuZhIjwmdLQhHlSx2JsEXvSSuo3yyEkvQMJxPBnO
 q7W1mHpI3i1CmrXGb7tKEkZvKlaJXNK8N6pq3XD5nf9AnnY1b0AGXbR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB12140:EE_
X-MS-Office365-Filtering-Correlation-Id: 430a4b53-3fcd-4197-fd5f-08de8ac2e480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OR5jeNcqLYDBXWMMrwicNvaDkAdM9mB3k+gXDlBx6MIKUeRO9j2xO/yxv6JHvRro2fO/Nkb8m8hr/h7pmv+xD/zU3uKRud5O6RWQym1TILlng7x5PRyIPeg5lQCebwcUVu8Um3jfQc5e46jL6fzi9MbJPMC+SPn4Dwy8GqTmjL81uTM5AAHjea0nCqlBsjS9x7zZSwkKRgGb1+dL1aqRRHMMklfXlTjTMoyAcx6EdUgTgaFxkFqdR7TFyKHgXXqLlHJcZURkYGHhxiLi36OdxusR5tAeR1SfedOEJ+7QSI9rVoBfSJ6UtDv5bOgdcSFOiVhVoRXYZlQNVXSqevp1NhGinn9U+oF0QconMSemrY0DaYZOQkA/+/G2PbL77OpsZzlw5MqXApCUlsH/m/d5Lz2gxttn2lDt6R7pcqPPtFQUqVwm457xqUkc2N0drAA+xelS3AMegYFAboPjL6DDTdFSJGVklT9KmgVZeiL13j92kbyT0gafQp/Obeet6uH9V2RjQ0f9AGRv0UMx4yVebUyjFK/0yPIvf3slBqFrsVhGrKSkdfV3XFSzGE0ODGErwmkS5fgciEJfhLfjN/b/vGHcdYExWAx/2sHSwADzdBQMLABK6dqTuMlDacGqBfzfyQSjLuy31nBq3zEvFuIXphcHOQmW9ANt9wa0iRFNrcqzUWqzWm/AQhL0AkEFc7xygLv1OMqN1tDfEWqXyigd7HtCY1vXfztWkLQezPmluHfm7MoHXbVdvZFTTPAVpFq4En1/I8Za9QtwofEk2urjLtwz7dnZVDyySm5WjoUwMVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0dnWkhVVUVlQUpOYW42QzAxZmlqdlF4RTRHclU3dUlGdDZDYVdEbTRlZ3Rh?=
 =?utf-8?B?UmdrY0I2N1o2VXc3Kys4OGVIc1Y1czg3RjR6RjEvaFEvSjVQQ3prK2dzQlNW?=
 =?utf-8?B?b3RVWDM5RkgwdXgraU5GTVJaNC9XRVZhWnlaY1ZPYTVXTXNnc08vTlBYVmQ1?=
 =?utf-8?B?RGpVTmJidkwvMUhBcjM3UXdLUEF4RXJJS0RxTVZudVJNYm5JampRMFhOc0xz?=
 =?utf-8?B?V2dJWmNkVTZaTGlBS2txa0ZObExWK05ZczdDclJFOURZZDNlMFJ4NXJ4YXNT?=
 =?utf-8?B?aEZKRkNVSHFDdkYwaFBtaXFtOXVTbUtGQkUxNVlwUzBjdkZiZlkvcW9lVlpK?=
 =?utf-8?B?cDN2OHJFT1ltZ2FISDFoYVo1U3cwVDB1cDE0d3JHaklaVG81bzNTUzFzSERW?=
 =?utf-8?B?aWZmSTRQMkUwL1cxbkhkWC9kWm1NaXB0QU5lRkl3dlk0TDV0OExSTVNxei9i?=
 =?utf-8?B?QTU0VVE5VmRTS1lOM0EzTS8xSGU5K29QTnIwaVYvTVhkUHFzQkxPNWg0UVVW?=
 =?utf-8?B?bERKemtqNW1xQnlzVHR4VTdSTjNlS2tHMjEyVks0a0lza1UyVWU2OG5Vd1Nk?=
 =?utf-8?B?WkQwbHljWDNlSlVZdmJNZUhSY2J0KzlpZlhyVHErSlM0WXBWdjhkN3BVMWZv?=
 =?utf-8?B?N2ZYQ0hvakpEclVvajVHM09mVjlrS0Myc2I2TXA4ZHpwMjlUWHREV0FMSWdx?=
 =?utf-8?B?OFk2TWRkd1U1YlpEM3VxNlZDWjQyV0lZRUJUZ3RRNjlFcmp1K2w1cWpwR21v?=
 =?utf-8?B?ck1lWm1oK2xEWVp0a0JtZ2FHZitVV1NEM2lTN3JoS0x6VDZoUytaUDJlcFFk?=
 =?utf-8?B?S2xyN29zdUlaTU8zTDNvU3UxQXZVRUdoTmhjNTJRMUZRZnpVTUtkbWRsQjJR?=
 =?utf-8?B?YU5aS0cweFhiZndVR0d5QkNzcjA3V200U0lhWjg1aUNYU0pzREhXUE1hcUxG?=
 =?utf-8?B?b1M2Yk9zOFFvaTd0bm5kd0owdStPT05aL2xBZk5ldmJIR3hrZWdRUWZtSk9Y?=
 =?utf-8?B?aElud3FJaFNMb0N0citTYzZUNFRSTEovWmFERVVMUXZyQ24xNGNGNVgvZE0w?=
 =?utf-8?B?ank4dHhNSlIvRHhXb3FHcjZqanhrRnpONVZlOWtUWjNsbUU0L2F0aDhCeFNE?=
 =?utf-8?B?YXlISzAvSEV4Q1dlL0FNTmFDdzQrRGl0R2hsWHB4dVNWMkhnQ1NGaFhqbHpa?=
 =?utf-8?B?UVlObFA3QVd0WEFJU3NYL1dDek1MZEV3TnovbjN1MnZjK05vaEN2YmFSKzBE?=
 =?utf-8?B?Rmtac0FtZytzZGk3b1p0dHd4cFZnL0FLd1FOdTNVVHRHSTZmNEprZktodzhk?=
 =?utf-8?B?WDBLQjkySVUxbi9XcUFYdFpIV2pRTG16QUZvNlB4b3FqNWpUYWdRRWU0bEpP?=
 =?utf-8?B?Q1RKVmtmQmpya3ljSlJBYm5BL0kxZDBiZUpuWjF1ZncvVXRUSnVwWmlLcEIv?=
 =?utf-8?B?Y2ZPc2Mrd05peVlBSU5FWkd2M0hDT3VIazY2c3Z4dmJOSnFMeThPSGhZZ0Vj?=
 =?utf-8?B?RzFsRWRSN2NlSDRWQjRIV05nYVN3N3pQcWlxK3BMWDJhL0pQdTVzdzFqc0Yx?=
 =?utf-8?B?NCtYWktIeG8wcmxrd08zcE9SVlY5czdxUGZiWHhZRmRpVVQ1RVA3WDFxVXA2?=
 =?utf-8?B?KzRFYUx1MzNuVXdrMzJWem1nYXFzZEJKZ1JSRkhDUldhajVWb1lheDVKb0M5?=
 =?utf-8?B?a1pQczZkaUtoZzNsZUxoc0Q5TFdpZkdheDFZUklFUEd1VkxwTWdSb2k2eVdL?=
 =?utf-8?B?RlpuMDlkTW8vVzBzWDJCNnFlaUV1Zm9tRENXc3NqZysxNmZEZ1NTaU9RZHRY?=
 =?utf-8?B?RXo1TVliOFZlM1NWT0VJOStqbnM0WEdGTlpVWU9BZGM4cThQRndWTzZYK0Rv?=
 =?utf-8?B?ZC9oWjhkR1EvOTgwcTUxajBPWGE3SmVSa3UzTTVyc1UwUG51ZVlSNjlqMHRF?=
 =?utf-8?B?RG5kaksvaC8yK1ZUVmlGV3ZJWlRhK3pxUWVndVFuS1lvRFZ6TTNad01FRU5N?=
 =?utf-8?B?YnB0MmEyU0dicUdTSTh2VXpvYjJmTGZtZGFZU3ZWbmllMERzekRPeXlVSVZ4?=
 =?utf-8?B?YXA3Nzd3V2J3RDI2eTF5ZWI4S2FlQXpqZFU4T2Q2NFpSN3YzdVNUSjdOd2FM?=
 =?utf-8?B?bXlDdmlVM1ZwS1dTSDBRaHBvU2hyejExTlJDQ3V3TEZTZDdzVXEyVTJOTUxX?=
 =?utf-8?B?K0ZWdnZIOGJHNTlOYnNZdDNKTjJIY1Q5QmxYZy9lcTVNNlJkWFEyZTNEdlI0?=
 =?utf-8?B?WkpRSkJldE5ldVdkRi81S3pITWRXZmU0NEpoR3VrU3F2elBwMlBlY2dCVFZZ?=
 =?utf-8?Q?BVYs/+vaWsIUAqlk3W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430a4b53-3fcd-4197-fd5f-08de8ac2e480
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 23:04:39.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm8Vvb2gAg+pimg3suJxMgGcKqWBvC7pOowiCbK4W1zE5/Q7kFaQIkUW5wXL92DEDE5pQ4RzGTAY5gDcMTil1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12140
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34178-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 0889632D3A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor pinctrl_generic_pins_function_dt_subnode_to_map() by separating DT
parsing logic from map creation. Introduce a new helper
pinctrl_generic_to_map() to handle mapping to kernel data structures, while
keeping DT property parsing in the subnode function.

Improve code structure and enables easier reuse for platforms using
different DT properties (e.g. pinmux) without modifying the
dt_node_to_map-style callback API. Avoid unnecessary coupling to
pinctrl_generic_pins_function_dt_node_to_map(), which provides
functionality not needed when the phandle target is unambiguous.

Maximize code reuse and provide a cleaner extension point for future
pinctrl drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- new patch
---
 drivers/pinctrl/pinconf.h         | 18 ++++++++
 drivers/pinctrl/pinctrl-generic.c | 91 ++++++++++++++++++++++++---------------
 2 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 2880adef476e68950ffdd540ea42cdee6a16ec27..ffdabddb9660324ed8886a2e8dcacff7e1c6c529 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -166,6 +166,13 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct device_node *np,
 						 struct pinctrl_map **maps,
 						 unsigned int *num_maps);
+
+int
+pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+		       struct device_node *np, struct pinctrl_map **maps,
+		       unsigned int *num_maps, unsigned int *num_reserved_maps,
+		       const char **group_name, unsigned int ngroups,
+		       const char **functions, unsigned int *pins);
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -175,4 +182,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	return -ENOTSUPP;
 }
+
+static inline int
+pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+		       struct device_node *np, struct pinctrl_map **maps,
+		       unsigned int *num_maps, unsigned int *num_reserved_maps,
+		       const char **group_name, unsigned int ngroups,
+		       const char **functions, unsigned int *pins,
+		       void *function_data)
+{
+	return -ENOTSUPP;
+}
 #endif
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index efb39c6a670331775855efdc8566102b5c6202ef..20a216ae63e91b69985ea4cfcd0b57103c6ca950 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -17,29 +17,18 @@
 #include "pinctrl-utils.h"
 #include "pinmux.h"
 
-static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
-							   struct device_node *parent,
-							   struct device_node *np,
-							   struct pinctrl_map **maps,
-							   unsigned int *num_maps,
-							   unsigned int *num_reserved_maps,
-							   const char **group_names,
-							   unsigned int ngroups)
+int
+pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
+		       struct device_node *np, struct pinctrl_map **maps,
+		       unsigned int *num_maps, unsigned int *num_reserved_maps,
+		       const char **group_names, unsigned int ngroups,
+		       const char **functions, unsigned int *pins)
 {
 	struct device *dev = pctldev->dev;
-	const char **functions;
+	int npins, ret, reserve = 1;
+	unsigned int num_configs;
 	const char *group_name;
 	unsigned long *configs;
-	unsigned int num_configs, pin, *pins;
-	int npins, ret, reserve = 1;
-
-	npins = of_property_count_u32_elems(np, "pins");
-
-	if (npins < 1) {
-		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
-			parent, np, npins);
-		return npins;
-	}
 
 	group_name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", parent, np);
 	if (!group_name)
@@ -51,22 +40,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 	if (!pins)
 		return -ENOMEM;
 
-	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
-	if (!functions)
-		return -ENOMEM;
-
-	for (int i = 0; i < npins; i++) {
-		ret = of_property_read_u32_index(np, "pins", i, &pin);
-		if (ret)
-			return ret;
-
-		pins[i] = pin;
-
-		ret = of_property_read_string(np, "function", &functions[i]);
-		if (ret)
-			return ret;
-	}
-
 	ret = pinctrl_utils_reserve_map(pctldev, maps, num_reserved_maps, num_maps, reserve);
 	if (ret)
 		return ret;
@@ -103,6 +76,54 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 	return 0;
 };
 
+static int
+pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+						struct device_node *parent,
+						struct device_node *np,
+						struct pinctrl_map **maps,
+						unsigned int *num_maps,
+						unsigned int *num_reserved_maps,
+						const char **group_names,
+						unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	unsigned int pin, *pins;
+	const char **functions;
+	int npins, ret;
+
+	npins = of_property_count_u32_elems(np, "pins");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	functions = devm_kcalloc(dev, npins, sizeof(*functions), GFP_KERNEL);
+	if (!functions)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		ret = of_property_read_u32_index(np, "pins", i, &pin);
+		if (ret)
+			return ret;
+
+		pins[i] = pin;
+
+		ret = of_property_read_string(np, "function", &functions[i]);
+		if (ret)
+			return ret;
+	}
+
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				      num_reserved_maps, group_names, ngroups,
+				      functions, pins);
+}
+
 /*
  * For platforms that do not define groups or functions in the driver, but
  * instead use the devicetree to describe them. This function will, unlike

-- 
2.43.0


