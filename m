Return-Path: <linux-gpio+bounces-8777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3A9559A4
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2024 22:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E83E3B211AC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Aug 2024 20:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B73155393;
	Sat, 17 Aug 2024 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="emidydAn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2134.outbound.protection.outlook.com [40.107.22.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA39460;
	Sat, 17 Aug 2024 20:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723927580; cv=fail; b=N9TZxlrmtIG7Ny8agDAEl8T6SXEVvv+brdpWrQ4h/VR0JHyAkIRVNuc10HY+lKvbNrn1TZdApB0xCFipUwqYVIIDFY/tIULQLl5bt48oBvOXX97yAEEUUDW3m781XStC3QOC+Cl02QaTqgIU50r/e+cfuEOdK0OA7fBJ8rcfzKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723927580; c=relaxed/simple;
	bh=aDG4HT5lmxsBPub3dunv6ayv/luBHYDsDh5G3thcafk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bqnueXUnfrfaJhEheLz0yCE5ldN2LDWEdz7jRmwdfVC48bsV5t5cp+nf5nwokzwFdJAsG78NchjvhAqlqSWpBwgF9/2et8SChfNSbnUqtjJAaz4HGqnUdgjoZRkkh0MEMF8baKSvoOQUMibD4q0IzLlbrNMOP5hL7Uxpxqi2+F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=emidydAn; arc=fail smtp.client-ip=40.107.22.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLXYGNBOJWVoiiBlSR/R8BYitDxFwlxcybctN1L4HQ2L2afT+K3oNdEBo08sp1eEGrll4JUtO2X/16wEVD3DBCWDcBprwSaKLawoDFBQTN/3bVAVYNH0MefbD3QLZrIxZGNSCg9JKeQQuGc+RVEY95k/+pMOFmm5Ib+GTDZzy+mO/xKF970LoJvEm5TYxuT0NJdLJGpuK6EYFHFS2PfWhKrOM9uKH5MaOFCCQ1hzfFmUJkysDfnUXU/AaEXFSb4uhlBxnZ+dFwK/qAyM+rn4kz/sYU1ZZ+9SXcWRs4PMhNCEA0tIsezxuPRj7wgtiI1/87+u9ZaqbayUojpW0k63Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tNrGTMG+9Br7iCypM297NV5/Z8qO16vb395VLCtwgI=;
 b=tRGbtljYaO91YkRUjpgKmJO94eKLJCvnv6BDnHKs16M1IpxgbAZoNSZIz9rNKdEikDRfkqQlA7BZWDVHGb6ZtX1sr0csfSg1888eriQ0Ap//qrNzPm2DguaTpBV+jgftFOidytpRDgyYZrfMJUuakD0XtgIROSL19PGaQyQSMTYTuUklLvuEjqP9A3bCZln5eb7UElgJa56fWb+/p4ZgkbBQgegc3GCP/vWs8SCLd1Kwe1Y5acYOhBA8tkM2bCXanRuPT0fWcjhkLRJKgukB+RgMpCP5m6QDSWt3NGz6fK8ME2vgpKnlxNFyeVsnywaQiwxM2Bcz/qxsjJ6i9utHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tNrGTMG+9Br7iCypM297NV5/Z8qO16vb395VLCtwgI=;
 b=emidydAnOR62SZjTpiPTLy0Ne21CR+FZtDk1fA4HbTUdsroPjy3IHkZw2uZIsX9Joe0pQZ+nAVAoc7wScry1tcVkwb3mFqVlxLrosr5uU8f0tzXPDxwKuyEGUJJH3eyhQnw+MsRVV+HJPSvQcCBovoHHEB+YhyROLa10fvPygo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com (2603:10a6:20b:2db::18)
 by AM7PR08MB5351.eurprd08.prod.outlook.com (2603:10a6:20b:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Sat, 17 Aug
 2024 20:46:12 +0000
Received: from AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35]) by AM9PR08MB6034.eurprd08.prod.outlook.com
 ([fe80::9ead:b6bc:10eb:ef35%4]) with mapi id 15.20.7897.010; Sat, 17 Aug 2024
 20:46:12 +0000
Message-ID: <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
Date: Sat, 17 Aug 2024 22:46:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
 angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
 ansuelsmth@gmail.com
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20240816225257.GA2411475-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF00002BA9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:e) To AM9PR08MB6034.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR08MB6034:EE_|AM7PR08MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 01635f51-7df5-4401-7474-08dcbefda16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0h3OU1wYnE3M3JQckdjRFZGQW51Zzlac3Y2cTEvZU9DbjIxcHFoK1VjMGpQ?=
 =?utf-8?B?SGVQa2FuWFM3QStpNjFLQ2ZOTWZheVhVU2ZvNm5lMC9UNUlOWDZRTEVpYkR4?=
 =?utf-8?B?L3VUVVE0c1dQTU0zVkovMlh2YmNaV3NhRFVxL1pYUVZWdFNzMGNPNnVxUGht?=
 =?utf-8?B?ZjlaYkFDckxITzZFajlrTHBITC9XcFlpcjFMZG9wc2g4L09oN0JkcUtKQkw5?=
 =?utf-8?B?SjlUa0NsM2lPazV0Z0ZkUlZRdVJNS3RTbWFuYjN3TXY0L2hoYWowNituNEZD?=
 =?utf-8?B?TGU0REFyRTF4cTl2Nk5pTXBxVGdxY2w2ZjRRdktNL3h4b0RDanlCT2dIbFV5?=
 =?utf-8?B?aXpCdmJ1NnZ4VGZ3VVhqUlJYS2RwM2Y2NUxsSU5UNVNjT1RMRWV6Z2FlZmxp?=
 =?utf-8?B?Uk9HejhVUUtteGZnQkZVdVVLbG13ek5pSG1OYm1NTnQxVzQrK05EZHhocjU5?=
 =?utf-8?B?Mk54VVVkbGt6eUw3VVd4U0EweWFXMDdXQklmOENqZXpOZk9qbHRnWDM1SjR4?=
 =?utf-8?B?eXl5M3VBMUdOLzY2a0h1YXhZbFZFK2s5L0NpRmRpcjdCUEFBZUF4K3g0RFlp?=
 =?utf-8?B?cXFEM3dJNTAxWUhqS2pqaEk5ejNGSE9kS1VRSWdJVkVOYnRjeU5OZURTUjVY?=
 =?utf-8?B?aWh5ODRIaHpHM0x6WmFYWktPZTVGcVJNSnVzQVJWb0JRdXFMZDh2UDIwNEV6?=
 =?utf-8?B?Nmx2bUE0MHJHT3dYNW41V2JFQkxFWEtUWVpGYTlubjhYalRlVHAwNkNRcTAw?=
 =?utf-8?B?U1lNaUFWNFJZU25velVzTG1YbnYxbGlWcVI5dXJUOW5hZTI2alBOMVpsaTAx?=
 =?utf-8?B?Z01Sa2drZzQrcWV4UEs0UEhuQjIxRVprUU1adEFlcXYyTjhzazZUNVVLTDFR?=
 =?utf-8?B?NlNvbEEramFkMC9pbzlzRHBoRnprU0QwcVoxNHhZZkVXVDE1Y2ZJbHpGU3dp?=
 =?utf-8?B?Z3h3Qk1jUVYzUFI1eVFTaGs1OGdNeFMzZ3NMQU5RL3F3WjFPem5lZnR3SzJ5?=
 =?utf-8?B?T0dWSWRETTZXaWp1SHVFaVpXS2pZcjJ3cFFLYzhkT2ZCMHk2U0JaeUwydHpT?=
 =?utf-8?B?ZEUrMEhQc1FIU0dxZWlheFNHR0I5L2hEUHFjTGZEeXJ5OUtMbHpoM0FwRXkr?=
 =?utf-8?B?R0JBa1BMK2k0NmFjdUxQUnJPeXZpS0hXeTF1bHNLT2dLeGpVZkthUWViWGtw?=
 =?utf-8?B?TCtPZ3JnTysrUlBoMHJZa2hvSmpmRDIrY1VhcTZLbkduNlV6RkZOV213T3NR?=
 =?utf-8?B?aTFPall1RDBYa1lJRlpvZ3NIaHRtSXRQVmtUMFpXS1NsUUVjbHE1SGFBYWo3?=
 =?utf-8?B?NzB6MnBJL2I5ZzlBVTZsem01WllEcmcyK0dlaXMxa1BTZHJRU2pGS2xsbnVv?=
 =?utf-8?B?SnJ3RndqTUJXSDRqUnpSTWxGck5yVGYwNUhhSkhhNVc5RU82TzFzMjg1Q0FQ?=
 =?utf-8?B?RHBxVy8wWmR3SmRnazNLZ2Y3b0NnYUNNMVQzME9DNUdWU09wTlVyQjBQdVlw?=
 =?utf-8?B?d2hYLzdzOGtOU01tcEpWd2tCRVJPbnJhYjRERzVJYWwvZmpVWVNiV0hYVUJt?=
 =?utf-8?B?R1dYSTVEcXBuOUU2YVJIb1hTRVp1L0Jib2M0WC9EVHNreUgvajdQZUVBM204?=
 =?utf-8?B?eXd6SkhYZVBibkNMTlIyczhlVURnbG9yamZBZmI4R05FVlk3OWRmbHB3M3Ju?=
 =?utf-8?B?SFFseUJzdGVzc0RGQVZ4TXVUZnJWdVdrd1JSYW0zWmVTa3BzVzdSSzRYeUJk?=
 =?utf-8?B?bzZoN3MyTjRPR0RYZDMrY2pOVS9jRTlnQkRaaFRtWTkvWmxYSGljQjZ5MGQ3?=
 =?utf-8?B?WDRZWUMvYzhhVVJTRE4rdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6034.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlXZVlsbEFmQW1Mdm4rRnh0QmdySlVNQVY4UkdiM1F4OXk2aE1BbW1FVFhY?=
 =?utf-8?B?cTFRSHJsWm1HZXMwVDg3eWFQbkZZdWQraWlxYlRJb0FsQ1BRc1ZRdFltSW5n?=
 =?utf-8?B?T3l6VGIyZ2pOZnUyWXZuem9SRnNqK0hxTzhDa3BTclltdnlhL3FvaU43c0cr?=
 =?utf-8?B?ZWJadTh5bEJhQXJKVmxrakxQdFlxaE9PQXVkZS9XNEltUDlMdkRERTRCaDJ5?=
 =?utf-8?B?dVBQMWZiZVlwaS81aDMySXJ4SXROdXJ0NUpZVHFIYzRFK2tWa0ptdmppMDFm?=
 =?utf-8?B?VktBVlFKV2tOOEgxK0ZwM2lSZlVyRjMyWnJNOXJwUW83eHZ6eWlLUTNNUjRE?=
 =?utf-8?B?TzJtekVOVW5selhQWlRhUkZCQVErWU50ZGhHZGQwV1BPTUFEaW9XV3JVVjBI?=
 =?utf-8?B?b3JHWmtJQStuR1VlN05IU2ZGU2dOeU5kSVVIWnBDUy9rc0tBRTlRYTZsZHJN?=
 =?utf-8?B?T3JWUk1scGEvZERuaENFYzFlVGFBNFZqZDk1WlY2aUYwVjVKWGo3T3pBUWh2?=
 =?utf-8?B?UmN4NVBjNEN5dmttbmtIU0xGS3Y1c2ZGa0ZXdGFIUTRsSnJ2aXRMN2cvWkJ6?=
 =?utf-8?B?djc5aDB4Sjk5NUU5bFNqRlRLYjB5MStNaHlsYXo0YVJOaVp4VEllclJZQkV2?=
 =?utf-8?B?K09HY2sxM2U2MUc4d1pXNzIxekt6ZWRuOXlRa2QzMlU1MGEzWDF0ZnpGcmRF?=
 =?utf-8?B?YThPUG1aMFVIamFkM1JBdCtRQW1NdFpwVHFNUFU2cDV5R0NVVVJYU3FtRTVi?=
 =?utf-8?B?RzV0ekNISHRYTENJcC8xajFCeXZtQWV0bHBaSGRiYlBHWWxhQm5KeGlhNGgr?=
 =?utf-8?B?RldhcGxDMTd1anlxWVdxazVlSXJ3cnVBMTZyMzh4Y293cllSWmZ1SFA1QllX?=
 =?utf-8?B?b0Y4eTNrR1FrbnRGV1Z6Rk9wSkpZamhWbUNkbGxtK0dYcU1iRW81aW4xY3BP?=
 =?utf-8?B?SFJwLzJuYm45NlZOb045allKLzRWWG52dm1scWdxajBTRnZ6Qy8zcXBEcCs0?=
 =?utf-8?B?S0dlQjF1ckk0WHJLeXNXUmtsaEppcTBIdFV6OXR2djMwYTh5blNxTTR4K29a?=
 =?utf-8?B?dWZjcVM4NlhRUnh5ZzUyYXlROTkxeUxPeUZkbnlWUVVmQ2JEQ2VUQ1BiRHNq?=
 =?utf-8?B?TjRhekIzcEt0SDg1dFVETi9RaXJMazhtSXZlV3JNRjNGQmZrNmovSDdhcm1W?=
 =?utf-8?B?bmtmN0ZEUWU1RnFkT0Rob0F1cU1VeU1wMUdCbXJhc1psekpGTkQvdU5sUHZl?=
 =?utf-8?B?M1RUWXZhODNDaWNNU09KMDJ0dHZFMndvVDJXL2lZQ2x3T2FSQXBXZUJrLzBB?=
 =?utf-8?B?K2FnMU5vcDd5aHRxMytpbDI4UmltOGhpZzRZSlU0dm83WlY0OGdCdHc5TTNP?=
 =?utf-8?B?NDk2MHZmN3ppeVlMRUlkNGNTL253OW1lRmVINURDWmt2bXAraTRwQjdtcUlJ?=
 =?utf-8?B?VEd2WHZxNStncHdGTVpFSDEvZTBRUG9JRS83VDRMcGNVL2FYUmh5aE43NXJj?=
 =?utf-8?B?Vm9ZcWEzVHVWdHRnRXB6bHYvNHEvZnEvLytMc3Z0MjJGUURpcmc0bjYzVjg4?=
 =?utf-8?B?Vk5GckRwK0ZqZUpUMWljamlnQnc3RWd2aVNOTlZ3N2NicGdyUlJialBVaXNy?=
 =?utf-8?B?cVJSaWFxNGFKc2hxaHRNMEpFYXJzU0dQODZQSmsyWGJaYm9UQXRjd3pjZ3l0?=
 =?utf-8?B?cjlLbkNSeEUwVjlLdGVtMmh5S3g2M2oyd0UyZnB0SmlCeElINElFNkx0WVJi?=
 =?utf-8?B?YmgwcU84c1RJT2RrNyt6K1pqWWI1ekdUREVCWnJma2trV3d3TU1BM0pKcHQ4?=
 =?utf-8?B?UEZWZm1IWVkyZnlwbm1rRUNBNXFGSHM5bUNyYW41WGpMQ2ExNlY5YjhEY2gy?=
 =?utf-8?B?SndJeW03YjlKSGtsUXBzQS9PeThDcHh1V0NVQ0tad0Q2R2dtR2g3eFoxaWNH?=
 =?utf-8?B?ZDc4MXh4cjlqRTZMK1FxUmF3a2ZiYU1EbWxxMEVUaXZvbStkblVFbXZ2VUwy?=
 =?utf-8?B?OCtXbmFyZWtZcDNqUkhMdm14RDhjd3pobmNBaU9EYXVJV05SWFdwdmZ5aXow?=
 =?utf-8?B?T1BCcEVMRnhHMFdrYTlXK2V1c1c2UWhtR0ZnVFpSV0x0Vll3WnY3Znk1bVhT?=
 =?utf-8?B?V3hzRDZXS09Oc0VLT0hpWWVwZmp1Y1JZZGdRQnhkUFdKbkFsMjEvc2hmdzFR?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 01635f51-7df5-4401-7474-08dcbefda16a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6034.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 20:46:12.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+KtyJYo7OX1VsabDl4AtkLWw9oyQJdwP3HuT8rZOz9ShdeQSN4xpK7+wrj7wvC0Wo+DENcmbSIO+OjC73hqL277fD44zlmIaesxRV8PbCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5351

On 17/08/2024 00:52, Rob Herring wrote:
>> Hi, this is by design because of the register placement in the gpio block
>> and the fact that the pwm functionality is intermixed in there also. As
>> example the following registers are all GPIOCTRL:
>>
>> <0x0 0x1fbf0200 0x0 0x4>,
>> <0x0 0x1fbf0220 0x0 0x4>,
>> <0x0 0x1fbf0260 0x0 0x4>,
>> <0x0 0x1fbf0264 0x0 0x4>,
>>
>> To simplify the driver code logic the complexity is moved to the dts because
>> of that.
> DT to OS is an ABI. Don't put the complexity there. The driver is easy
> to change.
>
> Lot's of h/w blocks are just bit soup. This is not special. If a few
> regions is helpful, then that would be fine.
>
> Rob

Hi, the pwm functionality is to blame.

The following is the logic that populates the direction registers 
(GPIOCTRL).

     for (i = 0; i < ARRAY_SIZE(pinctrl->gpiochip.dir); i++) {
         ptr = devm_platform_ioremap_resource(pdev, index++);
         if (IS_ERR(ptr))
             return dev_err_probe(dev, PTR_ERR(ptr),
                          "failed to map gpio dir regs\n");

         pinctrl->gpiochip.dir[i] = ptr;
     }


As example in between 0x1fbf0200, 0x1fbf0220 and 0x1fbf0260 we have pwm 
related registers.

The gpio block could if I count it correctly be split into 8+ regions. 
The dts list contain 18 rows related to the gpio block. So the savings 
would be ca 10 rows but a register mapping list in the driver would be 
needed instead.

Is that savings worth the addition of a register lookup table ?

MvH

Benjamin Larsson


