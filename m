Return-Path: <linux-gpio+bounces-6219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DA8BF4F3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 05:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE371C22E26
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 03:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C851427E;
	Wed,  8 May 2024 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HioRFU+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2041.outbound.protection.outlook.com [40.107.14.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9217597;
	Wed,  8 May 2024 03:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715138689; cv=fail; b=euKKU4C+lu0u/kNGbih3P0J/uCym8Jb5wFmNpbWj7uNfcS7a6bHVLlE4TIqWxQGiQA9VU6MCp+6bAR4uPggt5B4DJuYkCrFWpWs0HEMKN07o7Xk698C0yHJPdkWUHbfLCCPrJBuZeap4TLBjHfvNgMdd79dnwjdVQVp9oUWrubs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715138689; c=relaxed/simple;
	bh=6vI6esihawUEAsMpS5AmmUzpDZmYxlKj+KMmJXgWIqo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PbOjmOHpgXt6jbQ7q0kGVCAe+JI6VEX6f0u43YHcqDcxngL/gYgT5lnYtUrc1tkYohQ/3+PfWFWe46MUa85tZLCNiPS/t6gAf3KpeGzZqsFj7colnyms3P0BsSpQhYTvdR1tSSh13McAeVBmbraBqDWHiDQzX6p5A9Ws3qCeqrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HioRFU+3; arc=fail smtp.client-ip=40.107.14.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc0/uQmhz40N1O2a2VXMAXai9NQQyX+PCy3SlkEzSVKwaV5pdEVwmhR0Xc3RUkqnL9o24XeqdMIUVNjGT4A0s8m06n1TJxbnpRbsUp+fRRqL8JJsDem2MGWiwHi5szDcYSoNsBIyfG1SooanZpk+1RR8TYnhzWpvD3DAPSaQkzthPn3ouC4HjSap4Zi56Q6ECEV748H/eQBD36DxW6UltxvXGcsFQjcd/oq2LdNVmbi7taUY2WsOr3geB7OJdEeLEjtRdrRknpoZZhwTeeJDjvEiNXNCDUbGSAaOHr+N6SqCnElhk8zsuhpu2HES8HWEFx686gJwxEP8KM9XHJOuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=nhD5+pCQOQAa0OIZ71b2A/zWmCSbkAj1xUdTYjDZv0u642qprQj3M6oTQNDEvle5muzpcEfyva3scF466v6DKvIl2J41NlAi5A9MmxVtkN5OoA6r3j0YctVT6X2u1D4KVT8Mr/zRPd/ejGwCLiqthh9rpR9JLR7nn5jSb0Exu0PPLuRGR3is0FDMMhz4NIlk2J6qJ7CCunsqzjkXSwTfKde7ahHITiCCRbNATN5Gau4CxFTFnf+okqK9Pp+bEOvhg/5kqmAp3XeGcix73yqcfKtH+5RsfyUuuZq/xxmJloCLJCeVCOv0Oi8ms+NPxd8m4cxTTtuPJKSfnzorO+jd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSpuIAfuDc9u8B2QwCMoSNaXFE4wvMyesjB0lNEUwr0=;
 b=HioRFU+3Tn+PTMNJm8eG4/dwHGvOwiSOWzgqTobJ1Rt1jRtbVSAs1eM+ZYXt78OemuZ8tDVCZmL+YF2PmqbHEPVkQexO6+Uo9/UugoNo5wfxqWns+/BjkoarJ7RipRq1rJUOzsWEwLhoe5YqJ+inbMTb50mLXhvyBk7P0MXQwCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS4PR04MB9243.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 03:24:44 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 03:24:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 May 2024 11:32:03 +0800
Subject: [PATCH v5 2/3] pinctrl: scmi: add blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-pinctrl-scmi-oem-v3-v5-2-6f2b167f71bc@nxp.com>
References: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
In-Reply-To: <20240508-pinctrl-scmi-oem-v3-v5-0-6f2b167f71bc@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715139159; l=1313;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=gKhGtuOf4rXyBBJYl1QLNqh0NrD/5voNP3TjnJqoeg4=;
 b=f8J2dC1jUowWxxCz38xpguv9hzy3LMhb6tNKcbxvkdbZxXSD3mfITh2d+r9C8d/AIr4VRo+T/
 d7Ws8L27QxeD/S70eQmgzcSgM5Kq3/7JcX6siEJT1t6SB5lSWMM0Iwk
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AS4PR04MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 283f659e-2420-47ff-209d-08dc6f0e6826
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|366007|52116005|7416005|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWRTd2RmUXhoRDF5RjBjdGo2ZUNDWS9tMUFMZXJneldPdlA0bjhIYlR4VGR2?=
 =?utf-8?B?b3ZSV2lZd0tIQU9IM3IwVmFKOUl2MmxraXhidGtpWVZrOTR2YnEzQ1dOaUFs?=
 =?utf-8?B?ODNUaHR2ejlZRkRpQlhrNmhZK2VEQXo5a0VuVXY4OXF0UmMxQUFjYkZvSSt3?=
 =?utf-8?B?K0YrNitPMytuL05Nc3ZubmdrakNMN0Rad2ZFbUVHMkVmbXhTSjdQQnVzU3F6?=
 =?utf-8?B?S2tOSlVMVjE1REVOc2RZUU1TVlB3OGdSSDdLellFLzVyL1d5bXRzSi9PczZV?=
 =?utf-8?B?Zkd0eWpmRmNDRHRkY2dmbXprNEJNU0ZESTNiQmhHTk12dEtFUjRzTzMzTTFy?=
 =?utf-8?B?NGRUYnhoQk5sV0pNMGt6MkpHVlV3dkJQdUorbE9TRFBuMVlIeWVSbXpWb2FH?=
 =?utf-8?B?eVlSR3hvd3VJNXN1STlrbVpPSUR6SzVHVGF6ek9NZmJic2MzVUJNMERUMHRx?=
 =?utf-8?B?VDJBa29TamUrK1RiekErbG45VEFjWTRqSkUvTzdVYS8yNzVtYlBWVDFTakZZ?=
 =?utf-8?B?UHVzMlZ5c3MyNDY3ZTFoME4yNmZyT3NoTjVCUTYvTmhVUXdTNFV5YWpJQnV6?=
 =?utf-8?B?b05pOHBFTGxZSEFIMnlsaWJOWGs1YU9qNWs2SEluZERNMXRqSHh2RVVMUXpL?=
 =?utf-8?B?TW5oOFhJVnNFeEUrcWwrdjkza0pjN3JUTnVwQW1aQm0rY1lxNDd6ai9UUXFP?=
 =?utf-8?B?WldSbUlsaWlSWUtXa2xaaHQwdFcwYmhWbmdzclQzSWt2KysyQ2pQTldIZ3JO?=
 =?utf-8?B?eGVuTGM0dFdFNHJzOWE3S2RUV3g2RjQySVFZRUh5cHFyN3ppZFIwcVY5M1Rk?=
 =?utf-8?B?ZUprWkkyOG5FdnBKQ1Y2MEtDRlZpbzZvcnh4NnlOeVNxN0R0OVpoaXRwL2d6?=
 =?utf-8?B?ak5tNS9hay9YR1JaRENZSC9LVEgwMkhJWmVxTU5VMDA4cWo5Wkp0R3owMHI2?=
 =?utf-8?B?YzdkdnZnd1hPUXIvRmJjTlovQzJndlhBUjcySEwzK2FXSFdpOHAwVDZLNm5K?=
 =?utf-8?B?Z1EyeEpJMmpnb2lXMlkzUStUZms4a1VDc3pJSXJ0b2xwYXF0TXdHK0pTTEpw?=
 =?utf-8?B?c1NzcjNVRlVJZUZtMlBic1c3S1NtRVU2T0UzQmdrRE4rQUo2YzJWV3hwajFn?=
 =?utf-8?B?MnhJWnFlUDhqZlpDSHBUWVFBN3JwWWlkSy83NWthNDRmbTFVeHI4azNjc2Iy?=
 =?utf-8?B?Mjc1dXFkODhLMmJHTS9KZE9PWmNsZmlCUElBdTh6ZjlFVXVuZHRZa0lneHRX?=
 =?utf-8?B?S3lqd0Q4QmE2OVllV3M4dmhQWmdOTG9yMGtDOHZPNmlHNFQydGtBQm9sNVpp?=
 =?utf-8?B?TGtkd0dzWXVLU256U3VINGpqOENDMmc0WWdaV2EwVzlDcGRSNXpRS2hhOWd1?=
 =?utf-8?B?QnJVbnpROHBsNnZ0NWFPL3dZTTkwbnpXUEhFdjIxdFYvOGxDSW5yOWhLQ0Rz?=
 =?utf-8?B?Q3ViWllES29qVUo3Q1MyZVMrY1VqZGg0QXgzakcvSmJSUGVjYzEzeWp6SkFQ?=
 =?utf-8?B?ZVl1dU93T0VKZmZMV0RoT0VwVXlLOUlLVjBodkw2MmpDYTd5L3BIZkNSQUNL?=
 =?utf-8?B?OEJhM1RTeFdickZ2VjdOZU56a2dVcHJraU5GRjdtZVJ3Vm1waGcrQklTc2xm?=
 =?utf-8?B?Wm9xTVBtc0EwMUJPejIvTE9GbmlHNVE4Nk5xWjUvZ0NXTVNCakVJTTJRb0gx?=
 =?utf-8?B?L1FrMjVvTkN4ajIrK0IzNm9jWks1dFhEdWNLa203UndRNlZIUktXR05TRzNZ?=
 =?utf-8?B?Q3JpakErRVVHZXlwUDJZRGVzcXpubFhvazZsWWpvcnFmNitqY3N1SGtDdHEw?=
 =?utf-8?B?T3ROY2NCMXRUZncwWkcrUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(7416005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dktHZHZCSGQ4MmlCVzNZbG5IbFZNTy9oMkt1bXJGZU9iVXNSVTNLbFh4dzVj?=
 =?utf-8?B?b2lTQ0M1SGVJY2xLVUF1OFpkckhIYXpNOU1rQ21QWGZMQmE0bnF3SEoya3Ja?=
 =?utf-8?B?cFdtZGhaSXVDQkRuSWFabHd6SFhBOFZIRnpmWkJJWk1nQk9IYmNUS2EwREhX?=
 =?utf-8?B?Z2dma2ttWDczY0Z2WXhreUVHeU16cXZiOC9WZFJJR3N3aElnU0pYenNYZVd0?=
 =?utf-8?B?bUFoNThBUVN4Q0l0MWxxYnE0eUNDQWJmL1Rxem9BU1NSK2JFbFgzbEd0ZWtS?=
 =?utf-8?B?TEFpNWN1ZkdFZE9xdW9UVmxQYWhyeE82OC9FSmFaN3hXK3JNOER5QTFzTDV3?=
 =?utf-8?B?NEtBVkhYd1pFU1lobXduaUFVdFFISERuaitHaXN4ckhxL1dPbG9sait0QytB?=
 =?utf-8?B?MjNEcGtyZDgwOHFsYVlRQ04zaFVsZ2thVDVpd0JUS2JjK20xSWJTRTBPTmFS?=
 =?utf-8?B?bDZSRnF4NXpQeHltN1hzemNuZjZuNEhwZW1NRUVpNHJGNVRnWU1VSHl0ekJ5?=
 =?utf-8?B?dFZaZG93dk5ELzlLN21JNEJWZS9ORXVodHlLRTZ6VXlvZkxtTy9YR0xjbDRJ?=
 =?utf-8?B?dTYzaEVNaXZ4ODJjcmRYazFDb292THo3Uyt2aGZhc3ZlRnRXSUVaSmhYbWNW?=
 =?utf-8?B?by9sZE9BY3dmVnArVmc5V1NUS3k5Wnd0MGw5dmNmT25NRnE1WDNJaVBMUWpS?=
 =?utf-8?B?VjlaN1JBRVRma1U5Yy9QenJvUUJWUFRqQTNYUmxLNmlhYXF2MFptTU40UDN0?=
 =?utf-8?B?ZWpGejEzeHg0K2NCV2MxWURxaEY4STBLbC9sR0ZxYWQ3YkhlcDdrSmwxMzNR?=
 =?utf-8?B?VTdSaWYrMGZHSlYzUmJkVGlRSjRDZUZLRWZvTnRWQjgzWmRVRHlBQkVnay9T?=
 =?utf-8?B?ZGlJTGJYNG5EZjAyMzJLd3RZY25DSVhGdzh6MUJJOFMrdkNxcGVtRzAzUGJu?=
 =?utf-8?B?KzdmT0hLbFVreUkyOGx5VzhEYXF2UDBJWWpRSnU4K1pxc1VtVXRJekV3ekg2?=
 =?utf-8?B?REZHWmlmV3VnWWhOK3FVWHVsK082MldOTFc4eWYyRGpaUUFnUkhIT0F0RVdL?=
 =?utf-8?B?NmdKTWxsRlZtaU5HZ2RZMk95amdWVUYvaEZabDg2eXdrTG9DdThCM1dTSWIx?=
 =?utf-8?B?NTVrdENIWEpqdTFTL1gzNUx1eFVIL2xxaEd6SjFEbG1YSEZ0V2ZaakVFb0c2?=
 =?utf-8?B?NVIrUnZQS0F4RTBYVUVqMFYxQzhSeFplVW55VXNNRDZtb21jZUxRU1lwdjEx?=
 =?utf-8?B?TGVkM3ZUTjBHbXlFNzNZNVpNd2NlbWpla2kvWjFpNlppdVpKK3FzK25scGp2?=
 =?utf-8?B?eHdOekRybUJuS0tPejJ3UGZqQUZ1V2V1c09RSzlpeDdYazNkVE0xUFMrNlBN?=
 =?utf-8?B?YkxnVFpVT0p6YVRKaE54OXdmSGd4eVVXVXlwaVlzWlpQQ0I5Z0hEZHIzNlRD?=
 =?utf-8?B?WW81Z09GVHhnQjBwdkVxUVZBbUo0OEpPbktBVkpBWmd6KzNrYkt6dVlBZUpN?=
 =?utf-8?B?V1ZaVS9EUiswWTEwa21MV21RMHVlMnhUamlsTzd2TnJGM3B5VzRHdHVWWnRz?=
 =?utf-8?B?aGo2b0xXMWNvWDZ2T3dQVmdWK3lWbEVGV3h6SE9KTUxBZjM5RjE1dFJGbzFw?=
 =?utf-8?B?R04vWTc5RVFQb0szdmpmRWcxck12SkN6QkdWKzJ3aldmMnIyQ05FVTdiTW1j?=
 =?utf-8?B?RE5MeTQyRjE3M21BVitFZmd4VDdwWkxCNC94WmJtVjNNc2ZVQk0xZG5NdEps?=
 =?utf-8?B?V01HZU9MOXhqdTJNMUxhaUtoUXZyMTZWb0RJRElGY0Z4VUd2UUNKZG8zNk01?=
 =?utf-8?B?eGlNWE9FZmxQYkFUaFM1d01ZWmxtUmF3amt0bmNHRlJydDRWOFA0NUpzLzNF?=
 =?utf-8?B?Umx6RHpkbjU5L0Z2UGFtVnFZZjduTFlYaGlOZnlMU3VqNENwb2RFVGhWOTdv?=
 =?utf-8?B?YnlFdWFucFk5VU1oOFJFV0dzaHBHQTdqWlN0M3dNL2htNVhYbW9HdlNhTjRE?=
 =?utf-8?B?NjJScHV0M2c1L0c1QXpIUHFmaGNzR0ZjVlhCUXV2cXRRZElTV2I5VDlZS3p5?=
 =?utf-8?B?THE3TktwaDRuSS9UQm54MXh3L1pldUprbnh2S0Z0OFlPeW5pSEtiZG5rbXM3?=
 =?utf-8?Q?OLOYmzseMONXdfe4R1fMGrDJa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283f659e-2420-47ff-209d-08dc6f0e6826
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 03:24:44.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vv2bK3eT30q9XsS0spwWCCE03pV4geixA9Ixzls5xPDTXLdxQlTgAFcg/WttIojdR0U0sE7iS2sls/4b4mDFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9243

From: Peng Fan <peng.fan@nxp.com>

i.MX95 will have its own pinctrl scmi driver, so need block
pinctrl-scmi driver for i.MX95, otherwise there will be two pinctrl
devices for a single scmi protocol@19.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 036bc1e3fc6c..df4bbcd7d1d5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -504,6 +505,11 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static const char * const scmi_pinctrl_blocklist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -515,6 +521,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
+	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
+		return -ENODEV;
+
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);

-- 
2.37.1


