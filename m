Return-Path: <linux-gpio+bounces-28054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C34C33A81
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 02:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C979C18C6669
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 01:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8861242D91;
	Wed,  5 Nov 2025 01:24:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023098.outbound.protection.outlook.com [52.101.127.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C3E23AB90
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305868; cv=fail; b=hIqiPou7sZi/2aGP1P+gcbuh0PgtXFGdNQVFE8fFHst3DgWxJxB2orkYbNubo1OWXD+v9TpTdV+QdC+QDZX408nmQMkxRfurGBCyzin/9Z9lMYt1+skCAq63rcUZ4/VW8Mo0cXv8cq/eVhHpPqPZ/2St+m0qeT7eUbhURomFRaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305868; c=relaxed/simple;
	bh=SxPooBlFfIJVH8d8ztzavCPJjTApj+bvZ107znKiUGc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lwDodJsQMNkN36/+uUubLm9Xr16opeXJoI3ubDCRnJxxUl6CQThEBKOhinVRv0p2sTKkprDTG4LuZWpUpu/L+m31r3LAu84BAxvxdrkFFmbxdY5xMluSK8cnevHpf/wLpz5FjvOyNDpxFKqmIW8hpI6dd7zomlcf/jiaegm8U8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/Dmug28bWA/7NlruUoKDht8KHZkhBnYvYrgvx5BWhWiGRw26ileaD4LSILfW2XzZiTpXQR8UDCXgjNe9P73/NZHq+MikENw+oB8Ny8GZy9bFAdWaHbOfubxImgzxeHs4KKjp+AsXUqvBH7tfRHzMgXj+Jmk6yHVIyswvCei5AMTcMQbXyNzbuA3tToyKh+77T4PjNqsVqZCSRcDrJ5GJrIviWxzTKM0d+AJwEB2PtCYdNs67gk998ySUhFfRHcy0iJ/phsi0lwWk/ZA+Zc+gnmS09ZdJucgniYtgNaCKL0PUbMz/oCDpSjpAEk0pqdFGpP5CGr7q484Cmp6NMsJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxPooBlFfIJVH8d8ztzavCPJjTApj+bvZ107znKiUGc=;
 b=QgvS5oQCadg4N+tpp0azlfMVfUJG+g2XXwrmD0QOWDmkTuR+B4315IOzVxEremuAcfxyBaSQzgW35p6Q/PGdWbnKDGsCWgN9GtH7OQ5/yIBfiWmyxekXaB/SyaL7NX72bVA6Bs1sgW9hlW2zo0EJFPhrwPKXIvudulvHW3WnelAgWQz7ynGv9xbruRYTq94Oj9QcKQcrCRtxU928kAQGFO/UoPrPPFRv1v9iudBfJCbC5NCJYw/6nF4hfXTSEw9MtNwNg437/RBaLmNeizWxKj07qmfvknWK1SUFn/dCEV67FDnpHgOG2J4vYjbmz0AdiTSVOcRsbHeqjbat8Za7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEZPR06MB5045.apcprd06.prod.outlook.com (2603:1096:101:47::5)
 by TYSPR06MB6469.apcprd06.prod.outlook.com (2603:1096:400:482::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Wed, 5 Nov
 2025 01:24:21 +0000
Received: from SEZPR06MB5045.apcprd06.prod.outlook.com
 ([fe80::2525:49d:ec9b:ae03]) by SEZPR06MB5045.apcprd06.prod.outlook.com
 ([fe80::2525:49d:ec9b:ae03%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 01:24:20 +0000
From: Fugang Duan <fugang.duan@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>, Gary Yang
	<Gary.Yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHBpbmN0cmw6IGNpeDogc2t5MTogUHJvdmlkZSBw?=
 =?utf-8?Q?in_control_dummy_states?=
Thread-Topic: [PATCH] pinctrl: cix: sky1: Provide pin control dummy states
Thread-Index: AQHcTYsa216vIr6Bv0SHIQCHo/MJErTjSgmQ
Date: Wed, 5 Nov 2025 01:24:20 +0000
Message-ID:
 <SEZPR06MB5045A794DAADF1D151034C2BF1C5A@SEZPR06MB5045.apcprd06.prod.outlook.com>
References: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
In-Reply-To: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5045:EE_|TYSPR06MB6469:EE_
x-ms-office365-filtering-correlation-id: 0ba05520-0569-4ade-dcd7-08de1c0a0be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S05EcSt0Q1VoSHNjTUpIWmI0UGZPVGc1Rm11OXNsWG4yMDUyNCt2L1R5RDdV?=
 =?utf-8?B?eFUzRHBpUmI0aGRnSUpyQVFLOVJMbm9mY3VocUdWa2QzbVpOZFpsOEdDU1RS?=
 =?utf-8?B?M2svN0JNN3o3dWRPSGYwM1E0Z1p1bUk2QXY4bmU4RjhtOVNFZzNROEdyNXc0?=
 =?utf-8?B?SE96eHdWdVBwMGNOVHUwQ0hBTU9IejZJcElUR2hEUi91blpTa0NKZnIwcXVy?=
 =?utf-8?B?SkkxcXVmMW5lNnlxeWhhRlFhL0duQ253d0tqNE42VHRBUlYzd3Bpc2w0aUFN?=
 =?utf-8?B?ZlM5VmJ4NUtSRWx5aXUvRE8ra1hZU1l6NFQ5cVY5UHJRWDRiamliSkVWcHoy?=
 =?utf-8?B?NTVIZ1lGRDdhNWpabjNKKzVpOFhXRWR6SHVsL05HWnlWbnkrWitVKzlqNHhP?=
 =?utf-8?B?ZWFlVTFaUG1uZDBRMW9vTDN1UDN6NGNmYkpJMmEwc3ZiY3piZE9ITG8xQTlh?=
 =?utf-8?B?ajJCK01JZjR5Z3JnME5VblNYMllCN1hEVnNMby9ZdEMzNUdzOVBvMzJ3c3V6?=
 =?utf-8?B?QlRpdWwwZTlnUElGWmJKOVdNNkY3NXFCRzAyMldWT3VTVmdQR3A0alYvOHBR?=
 =?utf-8?B?K0FTeFRRUENIWStXZ0g2c0gxZnhLL2l1WlZMSXBDVlU4MGtKVHh6azN3YWxy?=
 =?utf-8?B?ZEQrajBvc3FkR2xxeGtld00raWlOK3VVZ09tR2QrcmhiNGpJYXNILzRwVndL?=
 =?utf-8?B?aWZqV012ckFlZFJqbFZZd29PcGpwNW8zTW8wTkcyekRkRzJBUFpBUTl2U2Nr?=
 =?utf-8?B?VENNb1JxQnRXZzlLY3pqSzFPSEZvVXE1bHBabXNaQS9mZy9ZdTg2a25WQjlE?=
 =?utf-8?B?Tmo3UnJhWUdIYk9QVUVUa2krOVZMdGlsNFNyWDlQK3dWckpGWENVbFB0S20w?=
 =?utf-8?B?S2JieEsvMDN4bzlIcjVlRzBpQ05KZlh3Sm05eWVLb1JoeWVNQjM1dWo4TnJM?=
 =?utf-8?B?dUNXcFljdzJ1QTY0a1JDZndyeUt1THFNd1lFZmdnOFF5TG1ZV1U4N2VZTVg1?=
 =?utf-8?B?SHBMcWVRY1R3TmkzNUFIczR1RDYvMHVhall4SDNBUG5nUWlWRC91MStPbU1W?=
 =?utf-8?B?ZFpIZUQ5VVdMS25qS2lPYWdzNzFwQVMyN1VCdkE0Zk4yeFgzK0w1a3dvaXNN?=
 =?utf-8?B?WXFyQzRENHIrMEZMVnN0WVU2WFI0a1BNQlI5ZzR6dWQ0UWdKUDJBdVgyQWE1?=
 =?utf-8?B?a0t4cDNmMFN3YnJTYVNna0ZhTDFVUWpua1FJQjRpZWJaOE12aTIyTlZVUzdW?=
 =?utf-8?B?UFNZWFYzYU1MV1JrZ0tTYXBHZHZNelROdHdKc2dQZ0Npc2E5aU1KN3JPbi81?=
 =?utf-8?B?YlJJN0tOMUFNcWs0bWZNajArdjU3S2FnU3NoQlNGWXB0M3BvT0FiMU9OZXpP?=
 =?utf-8?B?cDU0YkhmeHVmRzIzSnRPSnlqVklEamk4Vk5kcWdYdjhHUENoaHNRY2d3TFly?=
 =?utf-8?B?WHo2b1VRbE85SmhnRndZVTE1TEZmazVTMlhzMGR3MXRHOHRoeHZiQzZVMzk2?=
 =?utf-8?B?b1RUVmF1RVhLdHIvQ1hmbUZoWkd3TUx4Z0toWlhzSEg2ZzV4OFN5TXd0Rnl5?=
 =?utf-8?B?TDFWZ1RvSDFybXFCY2I1Mi9TMXZZazFZN1JYQ3drQ2dDc3BLTjB2OTU3NGI3?=
 =?utf-8?B?VFlEdFdYZ3JGaFVFUG5iWVdCcG84bmN4Z2daM08xeW9jNmxQSE96Y3BCa2hh?=
 =?utf-8?B?QlB1YVc5Zng0SHlFOTB3Mlk5S21CbWUvNk5OZi9LOUNiZ3FQaTNNM0t5WEpU?=
 =?utf-8?B?dGZLSUpDazBzOUtjRDFSbkxPNHBHeGlmK2NURllJZDU5N2NrU0JsYnFmWjFI?=
 =?utf-8?B?bDJpYk5aQkR0cWNLMGtSQVIvbitVa2ZHd3ZvK21BUmltUHA5bzFLUFVUTkNl?=
 =?utf-8?B?SWo3RW5qNFpGenVic2xKU0RDSjJWUVJBN0ZuRTZwdFZINWUxRmk4S1ViekxF?=
 =?utf-8?B?R0ZEcmhtVEFXZGVLM1FKVlZsY3lMeVJaeitVdmdvelhmUTBqZ2VTNVAvT3FF?=
 =?utf-8?B?MCtYcm9MbDgyaFJLSnViRkRqbTk0SzFoS3lHQUliQk5TVDFRV2RSVk04dGZs?=
 =?utf-8?Q?dN2ulb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5045.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXBPcURRN0Q3Z3FPSjBXMEtNNFFZaWIyZUFMdXczZWJrQTBxVEF3U2JkS3JB?=
 =?utf-8?B?VFhnN2dya1EyQVgwbUt6V3dXZ0oxMjdZa2xqNlpRZkFabDU2WUhsOGpSVVE2?=
 =?utf-8?B?K1JlNUVBcmdBUEp5RHFPVTNtcWpUSVVQcndveUtMcGk1N3BQU1BncXlxUlhS?=
 =?utf-8?B?aG1KeldOclZsZGNWY1Z1OWhOUHJwSG13a0ZteG8zZnBJaG94WUJMRVJEMFFv?=
 =?utf-8?B?Mi9lR2twMW1yZ3Z3UVNYa3F4WDM1N3JPYithTXE5R1dPbHlJWlFEOVU4dE82?=
 =?utf-8?B?akgvdDZaWW51ZXVzNEc2bStGV0FweW50RDNKRGtSTCtQVHBEMXBOU04zWHJl?=
 =?utf-8?B?bFcvVUNWaUFWdGJhNkFOOWltMUZmWFZaVGNFbm03Ylp4R28yRURDZThCNVVm?=
 =?utf-8?B?SmJOTjlBR2ZsUTEveVd0QUVzVFVxOVcwUmxPTEFRZ24zYzhteW5YcGVZZitR?=
 =?utf-8?B?S0cwUk9ZdUoyM3VwNk54cEZpZkhCbGJwZUYwM0Zqckl2cGZrdjhxR08vL3FN?=
 =?utf-8?B?T2FLdUd2NEZzWUNlMFNZZk1Ed3R6ZUdmWDFsZmNFblVCRkJnK3BFSXpZWFJ1?=
 =?utf-8?B?NXE0Q2RReU03L2RyUVdjTzFueXBtcUhBMytkK2N2Q1BKU2ZyNzJ2Y2xNUzZ6?=
 =?utf-8?B?R2RNWUFCbXJrdm5ZYUlncDFXcWtITlBNaDhiKy9HNlFHbmxMWHFoZ2dHb1pp?=
 =?utf-8?B?aXp3eFBxQ2l1OTBFMzAxaHRVT2FiZ2JyMjI1MzNiMGpFVEIrZTBYNW9PZWor?=
 =?utf-8?B?ZjVQSW13cTlRQ1hudDk1cmYxSTVxTHVMbHZjVTl5NUZYUmx5Qng1OEdIaVNw?=
 =?utf-8?B?dGlZWDdRYXlpUDZaSkx3RTJNd05pMVM0clJpaFJpVFJmdkVxdzBlUjJ0N1Zy?=
 =?utf-8?B?WG8rMmxtOTZpVzlRcTFiVHZhSjZFZUlSbnhmT0JHN09ZQXF1OHNWbVFZRXNR?=
 =?utf-8?B?RWFrMk5SRCsvTi9RK213a2FxaTNKVzRSdWQ1dXdBSVRZVnhiSWpncTBIdHdt?=
 =?utf-8?B?YUs2OWl5NFJRd3l3OFlSVWs2OU9mamdwU3J0SFNyeTJrMXB6a1E2RGZLYUY3?=
 =?utf-8?B?bll1ZTVMTCtudEtLT0VDQWEwLzUvVks5YUorT205cDNSYXdoRWIwQVpIeTg3?=
 =?utf-8?B?R3V4eU84ald3QXh2R2lvQSt6MGdhOFJvSlBIWG9tdWMwc3YyYXpGQzNpU3FK?=
 =?utf-8?B?a0hTNFAwUit1WXM3eEp0YVRsSmdkNVl1b25ycUlpYnp2RHJ2blc3NDcrYWZB?=
 =?utf-8?B?VHR1cktCbGdPNHlZNUtmMjRqcDhyZnArRjZqemNKTUJtSXUvNFRKaGVtaEdR?=
 =?utf-8?B?RnMvREkwd0dYV21yWEhEOUhLZm5RTHJvWEJVWGFQOWhYZkwybWlxSEw5YTIx?=
 =?utf-8?B?dXkvNnIzTURaUE45d3h3ZitCNHdtU1ZQL3IvWjZodHRENlRLMmJKcUovbVZ3?=
 =?utf-8?B?bTVJTU02TVg1NTJZSXJQM2xwcDhUclduL1B1OTlrSmJIQkNWd20xamhIMXVV?=
 =?utf-8?B?NTFHWDBkOEdybDNCNFdmbnNIdENncjZTMU9kRmc1SGExaUY2ZGtKcWgwMjQz?=
 =?utf-8?B?VFg0ZUZENVNMZEdNVjVsOW1qbVFVMmpGT2JlQ3V1RTViNzl4QStrV0NGaUE5?=
 =?utf-8?B?WlBhb0dPVkJXUUh4OFBDSnpXV3Z0djlGMXdXeXBzZkdUOUUxNkpjZE1ndVhm?=
 =?utf-8?B?VzZ1V3AzbStqbEdZelJSWDRGMWhvSHBMNG14Rzl6bndLalErMW4rVWZpbVEr?=
 =?utf-8?B?c3BMRXkrbFlUR2QxNXgwcmlSUGp6Q2Z0a241VTZzeHpvbTVzUC9BM1ZQanBS?=
 =?utf-8?B?aTFFZC92MkdhamhkaGh1SXpuMEozUVVRWUJBUXd1U1hwd0VRbUpBc1gxV0pU?=
 =?utf-8?B?TklWR1M4b3I4bGVoTWFlY2hHUmNlcVBtMnNGYzRVdzcrall3STBpWmNFY0lp?=
 =?utf-8?B?LzZrVExpK0FMc0xDMlFVb0NiNlhXaVlPMHNhSjdRTXg3M3ZEdXlvZTlVOHdi?=
 =?utf-8?B?dFRZZFVPclcyYWZHdnpMY3ZtQ2R2WklvUjRla215TlRlRHRFNkJGd0cvdVpY?=
 =?utf-8?B?WTVVQnk5K01PaHFiVEdCZGp0ZWxlclUvUWczWUk5bHJHWk81Q3llMHJRVnJh?=
 =?utf-8?Q?LD09YhoV7zxwJrKwPFVXS4ih/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5045.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba05520-0569-4ade-dcd7-08de1c0a0be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 01:24:20.7713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyVwSRzBo0Wrma7ySDKzOLS1/rOCr0PvalgqSs0SkEUPERx3pHlNv899+JofGKIQ7jkDUtUdmwMRW5jhyjw60Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6469

5Y+R5Lu25Lq6OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IOWPkemA
geaXtumXtDogMjAyNeW5tDEx5pyINOaXpSAyMTowMQ0KPlRoaXMgZXhwb3J0cyBhbmQgY2FsbHMg
dGhlIHBpbmN0cmxfcHJvdmlkZV9kdW1taWVzKCkgZnVuY3Rpb24gZnJvbSB0aGUgQ0lYIFNLWTEN
Cj5kcml2ZXIuDQo+DQo+VGhlIHJlYXNvbnMgYXJlIGV4cGxhaW5lZCBpbiBhIGNvbW1lbnQgaW4g
dGhlIGNvbW1pdCwgaW4gZXNzZW5jZSB0aGUgdHdvIHBpbg0KPmNvbnRyb2xsZXJzIG5lZWQgdG8g
Z28gdGhyb3VnaCBleHBsaWNpdCBzdGF0ZSB0cmFuc2l0aW9ucw0KPmRlZmF1bHQtPnNsZWVwLT5k
ZWZhdWx0IGRlc3BpdGUgdGhleSBvbmx5IGhhbmRsZSBvbmUgc2luZ2xlIHN0YXRlDQo+ZWFjaC4N
Cj4NCj5TaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+DQoNClJldmlld2VkLWJ5OiBGdWdhbmcgRHVhbiA8ZnVnYW5nLmR1YW5AY2l4dGVjaC5jb20+
DQoNCj4tLS0NCj4gZHJpdmVycy9waW5jdHJsL2NpeC9waW5jdHJsLXNreTEtYmFzZS5jIHwgMTUg
KysrKysrKysrKysrKysrDQo+IGRyaXZlcnMvcGluY3RybC9jb3JlLmMgICAgICAgICAgICAgICAg
ICB8ICAxICsNCj4gMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+DQo+ZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9jaXgvcGluY3RybC1za3kxLWJhc2UuYw0KPmIvZHJpdmVy
cy9waW5jdHJsL2NpeC9waW5jdHJsLXNreTEtYmFzZS5jDQo+aW5kZXgNCj5iMDNlMTAxNDdiMDlm
YzRiNjk1OTNkNWNkOTg1MWI3NGJhMWFhYWMxLi5hNWI1ODNmMTA0NDFlNDJjZWEzNGMyNzViYzYx
ZmIzNmINCj45NDljMGU0IDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvcGluY3RybC9jaXgvcGluY3Ry
bC1za3kxLWJhc2UuYw0KPisrKyBiL2RyaXZlcnMvcGluY3RybC9jaXgvcGluY3RybC1za3kxLWJh
c2UuYw0KPkBAIC01NjAsNiArNTYwLDIxIEBAIGludCBza3kxX2Jhc2VfcGluY3RybF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Ow0KPiAgICAgICAgfQ0KPg0KPisgICAgICAgLyoNCj4rICAgICAgICAqIFRoZSBTS1kxIFNvQyBo
YXMgdHdvIHBpbiBjb250cm9sbGVyczogb25lIGZvciBub3JtYWwgd29ya2luZyBzdGF0ZQ0KPisg
ICAgICAgICogYW5kIG9uZSBmb3Igc2xlZXAgc3RhdGUuIFNpbmNlIG9uZSBjb250cm9sbGVyIG9u
bHkgaGFzIHdvcmtpbmcNCj4rICAgICAgICAqIHN0YXRlcyBhbmQgdGhlIG90aGVyIG9ubHkgc2xl
ZXAgc3RhdGVzLCBpdCB3aWxsIHNlZW0gdG8gdGhlDQo+KyAgICAgICAgKiBjb250cm9sbGVyIGlz
IGFsd2F5cyBpbiB0aGUgZmlyc3QgY29uZmlndXJlZCBzdGF0ZSwgc28gbm8NCj4rICAgICAgICAq
IHRyYW5zaXRpb25zIGJldHdlZW4gZGVmYXVsdC0+c2xlZXAtPmRlZmF1bHQgYXJlIGRldGVjdGVk
IGFuZCBubw0KPisgICAgICAgICogbmV3IHBpbiBzdGF0ZXMgYXJlIGFwcGxpZWQgd2hlbiB3ZSBn
byBpbiBhbmQgb3V0IG9mIHNsZWVwIHN0YXRlLg0KPisgICAgICAgICoNCj4rICAgICAgICAqIFRv
IGNvdW50ZXIgdGhpcywgcHJvdmlkZSBkdW1taWVzLCBzbyB0aGF0IHRoZSBzbGVlcC1vbmx5IHBp
bg0KPisgICAgICAgICogY29udHJvbGxlciBzdGlsbCBnZXQgc29tZSBkZWZhdWx0IHN0YXRlcywg
YW5kIHRoZSB3b3JraW5nIHN0YXRlIHBpbg0KPisgICAgICAgICogY29udHJvbGxlciBnZXQgc29t
ZSBzbGVlcCBzdGF0ZXMsIHNvIHRoYXQgc3RhdGUgdHJhbnNpdGlvbnMgb2NjdXINCj4rICAgICAg
ICAqIGFuZCB3ZSByZS1jb25maWd1cmUgcGlucyBmb3IgZGVmYXVsdCBhbmQgc2xlZXAgc3RhdGVz
Lg0KPisgICAgICAgICovDQo+KyAgICAgICBwaW5jdHJsX3Byb3ZpZGVfZHVtbWllcygpOw0KPisN
Cj4gICAgICAgIGRldl9kYmcoJnBkZXYtPmRldiwgImluaXRpYWxpemVkIFNLWTEgcGluY3RybCBk
cml2ZXJcbiIpOw0KPg0KPiAgICAgICAgcmV0dXJuIHBpbmN0cmxfZW5hYmxlKHNwY3RsLT5wY3Rs
KTsgZGlmZiAtLWdpdA0KPmEvZHJpdmVycy9waW5jdHJsL2NvcmUuYyBiL2RyaXZlcnMvcGluY3Ry
bC9jb3JlLmMgaW5kZXgNCj4xNTc1MTAxNTdkNDdhYWQ5NmI0NTlhYmY2OGNjMGU0ZWVkOTU3ZjJk
Li44MzI1NGE5NWVmMTc0MWVhZjQ3ODRiYTRlNWE5NTE3NmENCj5mNDk3ODQ1IDEwMDY0NA0KPi0t
LSBhL2RyaXZlcnMvcGluY3RybC9jb3JlLmMNCj4rKysgYi9kcml2ZXJzL3BpbmN0cmwvY29yZS5j
DQo+QEAgLTcwLDYgKzcwLDcgQEAgdm9pZCBwaW5jdHJsX3Byb3ZpZGVfZHVtbWllcyh2b2lkKSAg
ew0KPiAgICAgICAgcGluY3RybF9kdW1teV9zdGF0ZSA9IHRydWU7DQo+IH0NCj4rRVhQT1JUX1NZ
TUJPTF9HUEwocGluY3RybF9wcm92aWRlX2R1bW1pZXMpOw0KPg0KPiBjb25zdCBjaGFyICpwaW5j
dHJsX2Rldl9nZXRfbmFtZShzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYpICB7DQo+DQo+LS0t
DQo+YmFzZS1jb21taXQ6IDk5MjI0YzE1MWMxOWI3NGUxOTMwZDIzNmRkMzQ4YjZiMjJhNjA3YTUN
Cj5jaGFuZ2UtaWQ6IDIwMjUxMTA0LWNpeC1kdW1taWVzLWY1ZjQwMGUzY2U5NA0KPg0KPkJlc3Qg
cmVnYXJkcywNCj4tLQ0KPkxpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4N
Cg==

