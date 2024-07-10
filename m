Return-Path: <linux-gpio+bounces-8173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD392DC03
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 00:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BB81F2617E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 22:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF1014A605;
	Wed, 10 Jul 2024 22:44:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-00174802.pphosted.com (mx0b-00174802.pphosted.com [148.163.137.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A7848E
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.137.153
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720651480; cv=fail; b=uLKoqt63yASf15gz9at47/AA+F/aQaqSY8jj7TykD5o3Q9lrNwgCbqeBEdJ2CiglBvyldJAOKDWBILEgua7q9aMr8Pts+8WQp6KpIJpEEB9tfghwbDKDKks33mojF7TKTGS7fSR4yJs0W4dwG9Z8qR8jB9GPnEiZzmB/rai3cus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720651480; c=relaxed/simple;
	bh=Jz5z0P7TEo69I3GlsdM7/8G1utnbROPstdopTLxZPVs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AzyrRzbWZ7yYNZ3xXncEQ3Aq5FJRmtLV2cuEDwSTSSNxtYigegcLB301RxPaGqiGLnMRsnpMz6oGvIQZnoo9N+DX7mck/WYLILbDz1FZFjatV2E252IqC3EZWOJ0Uky+G6cGs6i8956Wh/eC4ddhg+Wz9fQNFJwSdS8jeXXnMsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=heilatech.com; spf=pass smtp.mailfrom=heilatech.com; arc=fail smtp.client-ip=148.163.137.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=heilatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heilatech.com
Received: from pps.filterd (m0172409.ppops.net [127.0.0.1])
	by mx0b-00174802.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46ALmjF9003812
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 17:36:11 -0500
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011028.outbound.protection.outlook.com [40.93.13.28])
	by mx0b-00174802.pphosted.com (PPS) with ESMTPS id 409d4s3gxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 17:36:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUEIx5Wo4fG6FxcEwo7TbpXlHtOzOwzpiNxnE/58SSgVcIZQpNdzUB1YtQm8C3Vc1W+YhtDExYhAtIDJKhKg4T2iOrZeqQgV6BLGOXl73jWrd8+gRccKc5pt931rPcpznoLZvFonaLPcOUuv9zii3ICRtTqJinPXXPGNNOiFgeihgl4sm+INd6hJea3OTqG0ji7A69RiTXEVG/rcIBwNIXiHgbfV8Zo8k7y/m6SP8M9NhuvxNexiF9SnDtBM5YvhTj8dVBl/PgmNqKmgLQ0GHQQhrGShe9u9ZSPTKK7RmcAWvwN1r8mU9jRAX/Km11rYZ595YUr2qP542BJMC6tTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz5z0P7TEo69I3GlsdM7/8G1utnbROPstdopTLxZPVs=;
 b=GIcqC1AICKHB9C3Y0hd3n+z/vJqlf6xfyBenqPRr5zpjJxvn8b7TaCf/QuMPYQ/bRAJMpjmi7D/39sG4ov6TP+IOd9/3T8JMaJgxvVEuVSUrae1OZ1qS5q25R5aUT9yBbmDwBKSg8K10qko7d2vUAnv9dP09hE2LtA+bV9rZssxrNz3rGTj04Jr8IK6EeKZrXvLJfIGIHWR/LZxU2ZZpcz8KcC+yrUlOwYB5LqsFLCh3P3FiaKbF/E60fy3wNDtIdgvBr/nwLrNF+wePJsiy4Whamx8Uff6QJE3dMOJSo49nRg278gGkZJFHAtkeoHCDWExB65lSY272tQU0NXdUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heilatech.com; dmarc=pass action=none
 header.from=heilatech.com; dkim=pass header.d=heilatech.com; arc=none
Received: from SA0PR01MB6170.prod.exchangelabs.com (2603:10b6:806:ec::14) by
 CO1PR01MB6758.prod.exchangelabs.com (2603:10b6:303:db::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 22:36:08 +0000
Received: from SA0PR01MB6170.prod.exchangelabs.com
 ([fe80::560d:33aa:15dc:408d]) by SA0PR01MB6170.prod.exchangelabs.com
 ([fe80::560d:33aa:15dc:408d%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 22:36:08 +0000
From: Akash Borde <Akash.Borde@heilatech.com>
To: Akash Borde <Akash.Borde@heilatech.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Seth Drew
	<Seth.Drew@heilatech.com>
Subject: How to set GPIOs persistently high with libgpiod
Thread-Topic: How to set GPIOs persistently high with libgpiod
Thread-Index: AQHa0wurQTN7JtjoJ0WI0mh6f6zs1w==
Date: Wed, 10 Jul 2024 22:36:08 +0000
Message-ID: 
 <SA0PR01MB61705F8B19335B41339F2260E6A42@SA0PR01MB6170.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR01MB6170:EE_|CO1PR01MB6758:EE_
x-ms-office365-filtering-correlation-id: 688744ae-494a-4c0e-25cb-08dca130b143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q2NuVXpCUnlqQmJUQlpKRWR6NkR6R2ZzMkZTU1I1LzBzZnRkeDZEMm0zb0pk?=
 =?utf-8?B?RS8zTEhwazRpa2dqMnJJb2FHZEh4b1hpS2tEN3NMbU9VaU9XVDJyRk41QVdl?=
 =?utf-8?B?VmI4SmJndWJ0T1RGVVk3SnY2azZXNkkyaU1QTmM0T1NFWmhIYWUxRElvWElU?=
 =?utf-8?B?NGl3OEI0WkxHbGx4c0puNnBuVmlEdFZ6R1o1RUVNUXhoSENzck5rbkp1VWNh?=
 =?utf-8?B?TDNJb1luSGhKQ1dNZWpPMlFWcU1mQlhDUEJuZmN2VktpMW1xTDhhSFNIYmZD?=
 =?utf-8?B?dXZ4SGN0TjJoQ09aeWdzbXY3cmwxWEh1bDRlcGFjNDVtdDBLV0hlc29jeVBC?=
 =?utf-8?B?bjhscW1DSU5DVWxSQldWeXBxYURxcFhZbTJCS2hFMk80Q1Y2Y3dCQWdGTk94?=
 =?utf-8?B?K2xtbkF5MXM1VU9pVTVsaEJrQ3ZqUVFXMWduS0ZsbGdSTmM3UGNJK3d0eFgw?=
 =?utf-8?B?S0xVaGhDc0tPelZGaDhidUxaS0xIZ0hyR0JlTGtSZkNGT3RacHFUZFFjQjVW?=
 =?utf-8?B?REc5dkJZOFBNMUZwR0pOay9rWVVSZVQwVnhNNXNLbEhpaG5KeVNxT1Q1NCt5?=
 =?utf-8?B?c3lmUUhDNSt5dS8wSFVLOEJVRlVEbWlIWTJINks5RkVTNSsrdHlyd0RYb0Y0?=
 =?utf-8?B?SEJFdU1TbHdMdDNjQUttTm5FWHZPaGdaL0J5d3RTQzJSMGNEL3MwUUZlczJh?=
 =?utf-8?B?MUNDbHh3MXJTTitlWXpFRmxyZEZpTHFYd05raW1JNmRjYVE4VEVIcVVJL2cw?=
 =?utf-8?B?TTFhNXoyR2l1MXdvaDltbE5lbStRVThuY3RjVHo1VmNJVTRmOGUxSDJEemZG?=
 =?utf-8?B?d1VmTVRtOVZkSmFhaWdLN0Y1a3Vwek9YbS95RzlaUGpZUEgrOWNPU3BBYXZM?=
 =?utf-8?B?bFpBZWYrOW5iRGhHR3dyVk1xNEFWVE50eE45bmFSSnRCcE9TTlVHUUovTmpP?=
 =?utf-8?B?TmxWVjhqSTFHY2kvOEUxUnhobi9QVjh0cm12K1ZCNjBhVmVwYnR6Tll2YTZJ?=
 =?utf-8?B?Q1NqVzh4L2FCUFNzUi9EOHRCRUVheWxoTGQ2cTJWeERoVkdJTUdDQWxSQnFQ?=
 =?utf-8?B?YlF1OE8xem9FZERQb2tDcVFZYnBGS3VLMCttZXNtMC9BQWZiM0pxUUxuTXJH?=
 =?utf-8?B?VnNhSG1HR3UrREFYUWVHK1pqZlZSOHplQWxYcDZwZ2NBMUdSMkdvVEN3cWs0?=
 =?utf-8?B?T2hTaFBhclFrUXlNRWRKVG1pZ01KMzMvaDNQQTdmcHNOUW5QMVpwZ3g5cU93?=
 =?utf-8?B?WFlDVjNZNGMzMEs3Y3hsb0t1ZzZiVUtDM2YzOHFtcytZVHdQeCttZ3hLS2VL?=
 =?utf-8?B?UjVDalVZaC84S0VZZlRCYWpxczBPaXgxQmFqbmFvR1JhbllEOTVDY1I2bnZV?=
 =?utf-8?B?RnZyWnlzNkh0MEtDMHJJU2J1OWZXa21IcDJ4elFrWVB1b1JxL0Z4cm8vdENE?=
 =?utf-8?B?aTF6NlBpY0pVVjRVTTV4SEl2R0t5WUY1M3ZCQldYa05ReEU3dGJXeUJ6MEdF?=
 =?utf-8?B?bDdMeDNtNUtLdkoyNlA5azNRSWhrZ2JOK1hDZ1JmWmx1OVgvVWx2WDR5cDRD?=
 =?utf-8?B?RjNVK0d2N2xBcDRSL1pMNlZScVRoQlNSUGdlR3BOTmVFSXZUUWd2RldMTVRF?=
 =?utf-8?B?S3NSUFhhRVBZZHBDSEQyWDVXQVRsZFpESUFFR2pzWmhYR3hxTDVMMGJIY295?=
 =?utf-8?B?WHFyMFI2OVRVemJQM0tScm9IOEhnS3ZMdndPNFhLTDNJRWV3bjdUYWIxdS8y?=
 =?utf-8?B?VFVxVXo5RWhXUmMzV1hXam1BeUN4MDNnRGp6ZDZSVnhlZ2NEdG1BNVVEekhT?=
 =?utf-8?Q?Lst+Rg6wEWYeBxKjrKBgNcLuDnfpMnpkvlWoA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR01MB6170.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K2dQWmFvdEJrN1FWc3hnUGpxN3ZSYk4wd2p2Z0pyajV6ak82Tnp4RE5WQksw?=
 =?utf-8?B?TWxIbDI0SlZWM0t3eWJLck92UFhaQlRtYnpFTTcrNkMybFkzTUp0OUcwUXRh?=
 =?utf-8?B?L2w3UVVEeGxLV3lHVkg2dFFhVlU4c1A2aHhXMkZJUVR1UStqbGhaQmtubFNF?=
 =?utf-8?B?QkpLMjRTd2RhcGFYdVZvNHpMSkZoZnk0NUdiTWJpODV4N1dsQmdoamRnbmpj?=
 =?utf-8?B?MlhuOG9DMFFHVGcrQWxqQ2xHRDdia2d5R2xhLzhIa0EzeFlxc0RQQ2hKQk9P?=
 =?utf-8?B?YmtIazdTK0FGMytGckVpN3dHNVYxSlhJVk0raW9VbFFBcEVja243Z3ZvQWZT?=
 =?utf-8?B?OTFDazJrSGZDS2o0c3F1QVlTNWdjUk1ZMUJzT3BjUkJCVGwxd0F3S09EY0py?=
 =?utf-8?B?TGM0b3BtNEhnLzVBall1RWdoUlk5dHNnNEp1K04zM0o4dUJhTXlHKzFOZDZ4?=
 =?utf-8?B?QXM3bmNDUDc3UmxNUnJDZGFFU0k5SXpDV0V2QWR6YVlWaGVyRDkrZ3RpVk9J?=
 =?utf-8?B?RURoRE1WbzI2SHlubGszbmY0L2ptRWJaTzhJcm4raHI4d3htZkRtSTZPUEtn?=
 =?utf-8?B?RW5QOGxVWWR0YWNiNnNydXpVR0hpbFhTRW5kVUtWSW4rYnNqd0tyN0EzUElp?=
 =?utf-8?B?ZVUycjJBS3dJZDJCbTIrWDcxTWxURVZjU1lUcFpZdHFwUWhwVUZYZ1p4bGJm?=
 =?utf-8?B?ckhWQlZRRHRVTjJhWFZDL2phWGFRRWZuV1V2ekdjZGl4akxDdDM4TVFNM0Nl?=
 =?utf-8?B?NFZnaWd2NzZDcVBxVDQwaG84UWI5REZBVzdGeGFERlNEcWZIS1JLZHY4RjJj?=
 =?utf-8?B?eUJkMjJqU1dhVGxPNGExVnJMVnNRSHJXbUh1cVg2ck5wUVRMclErQUFhOFUy?=
 =?utf-8?B?RFhQTmFEaGV3NDNsNFNoUGNQSTVPSWhHWXNGNFgwT01Sa0lSaE5TYnYzYTlU?=
 =?utf-8?B?SGVPQ3d1bCtLam42YTdDTTNCZDVpSDVxMUxXSm5wNDJVTGhPcWtlUHBaY04v?=
 =?utf-8?B?RTVxMXBBbVFLZzF3NDJtVG51RXFWYjhReGN2d0NxRS9rcDQzRkt0NkI5WEF5?=
 =?utf-8?B?dHZ3SjFOdUNuVUsxRmZITmxhaVBPT0ZKVmhsUzZ0SHRLUlMzLzd3UGF1Ym5r?=
 =?utf-8?B?UnFJOTYvREo1M09GMXQ3ZnhLZU84TnVpVk8xQVE0dE9lUXc0UEQzSkR4SGJQ?=
 =?utf-8?B?bU9rMGdUUkJVM1F0MGhmRFdGc00zRkZ6MzF3U05RalJzS21uaDdERTIwdHdN?=
 =?utf-8?B?bEZnTmhCNmkrbDY2dmZSUmRLcHhrOTJiZ2JERGNvMlVEZjhlK0g0cmphRDhZ?=
 =?utf-8?B?dmF2Vk85bmlHTmxKUkhuaWNsT2dSb3Uwa2luZXgrUHZwQ0lPUjlEWVVmRHBS?=
 =?utf-8?B?N0ltNk1VdHZndkFmRTZ2SWZSZzEyU3l0cDcrdWhVbWVUOVFKbGpEd0VpRDgz?=
 =?utf-8?B?MElQeUFReVBwdmdxd2N3MC83R0ZLTlN2Q2Z2N2lGb0RuazhRcDdYcHVNR2tn?=
 =?utf-8?B?UG5oWFdzZDYzV0VzUkw2M0R4aUFJNmpiQi9YNVhSTmpZNHMxaWI0NDBwZUJE?=
 =?utf-8?B?Ujl4VVlOS2h2NjNVa1k3cktvYWx2VHRJYVpYc0Z1SWJFTTB5Qm8weWl0K2VI?=
 =?utf-8?B?dEx1SUlITzlkOGNQTFZyaExyZUl0VHFzRmFDVFpST2NxTC8zN3JZQW55Snha?=
 =?utf-8?B?Z1RtOHlUaEtFSkE3N29kbkhlQzZpOFFJWjJmVlQ0SXNxRFlFSzU0bnltVVVB?=
 =?utf-8?B?MGlaems5bFhsbGh5Nis4V0FJZUlMOUFvRDA4UU1BRkVGMEV2S0h3NU5KVUFx?=
 =?utf-8?B?WE5DZTRxYVFYelFxTmEvLzRyajR0aEtRWFpwMGZiU0lrSkFlMXpsY1Jkbm9K?=
 =?utf-8?B?QnE0WDhqWVdxT1R3ZW9OOFJxcGd5K2N5cnVWV0dISXZVL0RGS1U1cWwzMmZZ?=
 =?utf-8?B?Qy96d0lFRWFuaWJIb0dSWTF2RWlXelZJYmIxelVSQzFKMyt6R1cvUDh0QjJN?=
 =?utf-8?B?c0ZGT2ZISUxYR0VyWjFsQzhOUm9MOENwZjl5ZEhJRmRGRDArSTYxSjgwd0Jy?=
 =?utf-8?B?dWgybFJMSSt4Tzd6OWdQRkdHNWFNMU0vZUJiN3JibXlRbDZOL0YvdXkydVZI?=
 =?utf-8?B?dHl0dnd3SFp6SWY2cXJybS9Ha3c0QzhIYUhLRXBMOVRGVk5ZcjBrWFZOQlhQ?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FECFD085B790EC4099C0FBD56D521769@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: heilatech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR01MB6170.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688744ae-494a-4c0e-25cb-08dca130b143
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 22:36:08.3621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d2d3f03-286e-4643-8f5b-10565608e5f8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmSVYrLpkVBJFfe6VKVGfC5VIv0GVvGkzfDLUDCTUR2U+1DevtFRT+iDYOIwZznAgAC/PQfN9pWIKFh1Rc2pXyxnsvsTfboE2jnfZYVq5A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6758
X-Authority-Analysis: v=2.4 cv=GJ1aEfNK c=1 sm=1 tr=0 ts=668f0cdb cx=c_pps a=P5WujBTXSBe8sApKbu0jwg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=iPDCyfAhTBcA:10 a=xNf9USuDAAAA:8 a=wDTd696-PyBKZ--f7MIA:9
 a=QEXdDO2ut3YA:10 a=5rhmdFM7rlwA:10 a=0lgtpPvCYYIA:10 a=SEwjQc04WA-l_NiBhQ7s:22
X-Proofpoint-GUID: mtVT-PsD7L3nbsX9HVtGSfvwsCIC8qDb
X-Proofpoint-ORIG-GUID: mtVT-PsD7L3nbsX9HVtGSfvwsCIC8qDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_17,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=731 bulkscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100162

SGkhDQoNCkkgd2FudGVkIHRvIGxvb2sgZm9yIGEgd2F5IHRoYXQgd2UgY2FuIHNldCBvdXRwdXQg
dmFsdWVzIGZvciBncGlvcyB1c2luZyBMaW51eOKAmXMgbGliZ3Bpb2QgbGlicmFyeSBzdWNoIHRo
YXQgd2UgY2FuIHdyaXRlIGEgdmFsdWUgdG8gYSAoY2hpcCxwaW4pIGNvbWJvIGFuZCBiZSBhYmxl
IHRvIHJlYWQgdGhlIHZhbHVlIHdlIHdyb3RlIGZyb20gdGhhdCBzYW1lIHBpbi4NCg0KRm9yIGV4
YW1wbGUsDQoNCmhlaWxhQGRldmljZSMgZ3Bpb3NldCBncGlvY2hpcDQgMjk9MSAjIyMgU2V0cyBH
UElPIE91dHB1dCBQaW4gdG8gMQ0KaGVpbGFAZGV2aWNlIyBncGlvZ2V0IGdwaW9jaGlwNCAyOSAw
ICMjIyBSZWFkcyBhIDAgYXQgdGhlIHNhbWUgT3V0cHV0IFBpbg0KDQpIYXBweSB0byBwcm92aWRl
IG1vcmUgZGV0YWlscyBvbiBvdXIgaGFyZHdhcmUvcHJvZHVjdC9hcHBsaWNhdGlvbiBpZiB0aGF0
4oCZcyBuZWVkZWQgYXMgd2VsbC4NCg0KSeKAmW0gbm90IHN1cmUgaWYgdGhpcyBlbWFpbCBhZGRy
ZXNzIGlzIG1vbml0b3JlZCwgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFub3RoZXIg
b25lIEkgc2hvdWxkIHJlYWNoIG91dCB0by4NCmh0dHBzOi8vbWFucGFnZXMuZGViaWFuLm9yZy90
ZXN0aW5nL2dwaW9kL2dwaW9zZXQuMS5lbi5odG1sIEkgZm91bmQgdGhlIGVtYWlsIGF0IHRoZSBi
b3R0b20gb2YgdGhpcyBtYW5wYWdlLg0KDQpUaGFua3MsDQpBa2FzaCBCb3JkZQ0KDQo=

