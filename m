Return-Path: <linux-gpio+bounces-13939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484B9F467B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 09:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4660F7A5E2C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECE21DE8B0;
	Tue, 17 Dec 2024 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wPfWUBUp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4E1CF2A2;
	Tue, 17 Dec 2024 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425360; cv=fail; b=LXMy2ULvwgoVu5IaZqiHo9APpaTU6/MfLxsrdqLG8ZqHcgWCgrhJFXomQKaY+U7TYrC3usWyx4CBKDxCi7Pgs6Im5JREJ8mMv7kBWA9Sx/QVBYDfzr0clzscgfC31h73CJNHHJGKV6sr4O+ZJL3iBxlzkW6Nrnb3NQHyyma2YDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425360; c=relaxed/simple;
	bh=rsQBDzU3lQsptbq9M/wtUFbPdlvb65s5E7+uHn9HI2I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjMVtJi9ACsDVBoOGl9Er9nwkKNC+4Tvog+pm31AqfZmzdxgp4qKHWGUxAbolRaKQO049nAXgCBOyXRneOYU5P27MR6cgYQaTzaLKni0V6RmvG/I7dllEx5dvn1O74OTOXaET6FZ8dsCNhgcsTzZaDlzWMKfjzJC/M7se5Lxd2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wPfWUBUp; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqCn65qIXhcaIptFuoBI2qh8L0s+NFk9Mv8D12n5EGKivUCQONgl4Fn+Rxf4TNTjCWr39+G7HzsbW0el6hINw/PwtFbItTtdYlac2zimsTU8pmTQxgrWclS+H5mve2oSYAH9ALfuBvXrP9dsepeNOdyOEofwH5R8p56QimF6Pm1Bz57sdEQGhBabvHgMYfwKASP+9e3fmnvOld7sXCqKPnXilvEFo1ECRglWtPxl9//oFuDqCixSA19CbjPIGJuxgZCHfzRl+wecKrNVjwoKwPnrHkC8AzZugNTmPTDstPPaMoOps8c9IUo+l9q0BGXcw/UMszRScLif9c5O2jgk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsQBDzU3lQsptbq9M/wtUFbPdlvb65s5E7+uHn9HI2I=;
 b=w7cmQNd2oO/xKL7xVp35a0/EVswbQVPWHK6pPUn9yVSpPhFO5l4EPIRTfuU1E/T1DhQBd3NIyL1iYesIY4cfla6UVMI7uQoxqHoTNixfQshqZ9comoutho5d59thnJMODw+ZEHNJLho5C3gC8FUAjD+tYDbJREvl9Cl1meEBJW0ilfmaudI6P16Yhl7tpUGl7XanzHxpp0l5HAl8g3wy9DaqyYzcudga8ccq9U1ppBYj16ZolIu2aZQq5l4hE6F4N48izIdlBxrprLQM89AePcY2dQ70CT7kbr38q2V8ZWbwjESOa/Cpwt5T4qDxNGYCSE738uazWwKMh3anGwHA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsQBDzU3lQsptbq9M/wtUFbPdlvb65s5E7+uHn9HI2I=;
 b=wPfWUBUpFXVBkJ0HpFQxduE/y3TjQ0iZMQEgCvPHX02DBlpD8e2fZ/00T3ruaRadVCzEKf9v1qQ1cQL7OjTJrqMSH/+t8ydESvBewh/39msFA7IssVOh48XnAZZH4pEEPG6nKRLh+dkSbbRFpL7Aq0INweehVX6uMrcdaN/NZNA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13842.jpnprd01.prod.outlook.com (2603:1096:405:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 08:49:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:49:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index: AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17Lp+scAgAAL3NCAAAomAIAACu5w
Date: Tue, 17 Dec 2024 08:49:12 +0000
Message-ID:
 <TY3PR01MB113469F4CE8DB86978C03E3D986042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
 <TY3PR01MB11346902114D33FA66F4C3BF686042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c57d3568-68f4-4e5a-874f-4d9f0cc1f2f3@kernel.org>
In-Reply-To: <c57d3568-68f4-4e5a-874f-4d9f0cc1f2f3@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13842:EE_
x-ms-office365-filtering-correlation-id: a5f0eb47-f0d1-428f-6040-08dd1e77adf2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2JySXFIWkREcjFrNldlYVFFN1FMZGFJaktNZVlobzRyMEY3d1JETStzWTJo?=
 =?utf-8?B?bnRnNjNMcnI5cVhWb3dSdFBlNkkySjhQaFhkaFZhMTRkVFhmZWJKdlZBSEF3?=
 =?utf-8?B?bjJmbXhib1JWV1NoSVQzdktnZVFyRlVKSVhGaFBhc3VNcmhZdjBLVmw2eUVk?=
 =?utf-8?B?aGtGRGFMOCsxVFBZTGNVT2IyNCtUalZTQXkrNWdvcnZqRStSc2dFUVFFSjdK?=
 =?utf-8?B?bkNBM1JuVmY5TWNDcTE2WWdJWlBUcjJwbzJDS2t0SXJTUTdXZ2Uvcm5hZTFD?=
 =?utf-8?B?UVNvZ0VtYzVacmJhdEVUSEtYYzE2SDJWUVpJVy9lZG8vYkx4a0s3UkkraXNt?=
 =?utf-8?B?ZGtiNFFXRGEzOWhFT041YzUza2VuT29henFTempQOVhRT3VHaWl0d0Rzb3gx?=
 =?utf-8?B?TW9XZW1xYUhzYUp6RHRKT0tvb3JMdzVoV2hXb1o4VGJlckZsT2p1NTdDcHRv?=
 =?utf-8?B?VWtNQ0lhUlRFSGxBNFpqVlQzSzdnTERVcjZpVFQ2OUtWYVFsRW8yUENSVWI3?=
 =?utf-8?B?TFVSL0F5bEMxKzVOeWx4RFd1MEdlOHZoRm52ZlNPcXg1bi8yZ0lPZS8xa1l4?=
 =?utf-8?B?OVEzamIrZFB3QXlOY1l4MXRDdGFjQWhaUGRub2lLU01yT3huRG9wNjU0OXU0?=
 =?utf-8?B?Q0I5YnErREx0a3hzVEh0ZzR2eGNhVG8yTVpWWDkxNWdjcnBGb1dlTHBhSjdN?=
 =?utf-8?B?Wm14QnhZWVF3VlFKcTJaNlUyV1NhOWNOSHplbmZYSWxxQVBSeGJMSUtPTlg5?=
 =?utf-8?B?b3dPTWE2S2l3cElQaDFQbnR1dmJaYWRDZHBqZEM4T1g4Nk5hV3UwR0dNSHF2?=
 =?utf-8?B?N240S3N4MS9XNzhxUUZjMlJka1V1TG4rNnJvTDQ3Q2N0RE5EQXlsUmtSK0lQ?=
 =?utf-8?B?RFZsaCtiUDV6SlF1dWZheUNyTTBzbmRrU3Izakt2ZzNGdGh0ZERlNDhGQ3ZH?=
 =?utf-8?B?NzhXUGxvQnI4T0xjeFdRN3IvUFNiWXd5SFpnSFExNXNFR1Q0enFsb3hCWUhz?=
 =?utf-8?B?SWZpTUo1QWI4OVd1VmZ4UGwyQXpWYlRuRkFNWmQvRzVSSGZGeXloZ3dEazNE?=
 =?utf-8?B?akY1TUMvTXV4OVpsQkMrdjlUZHlRNDZoZWZBYW1mdnkxWDdpNVU3ZU14S3dZ?=
 =?utf-8?B?K1pPcW9QYlUrNnlzQnNCRnRsd0l4cGN4bWVCUGhWdmRjQisxT2xoYnlOandJ?=
 =?utf-8?B?b0tJaEpmZWhUSExVYUk4eXdITzVlclRjSGl2RDFLd2FadEFiZWZEZWo3Q1A0?=
 =?utf-8?B?M015ZEhnUEhUSXRxWUlVakVCZTlWcm1XRXh4c3MzVzNiWUpjS3dTTksrNnJF?=
 =?utf-8?B?ZXZXUDk5cHdJNDBuL3JERGordFhrMllrM0JOMTh6R1BXVmM1UFJCM1RWUFZU?=
 =?utf-8?B?UjJCRkNwNGlITDlvYzl4azlFQ2k4WXJxSkRaSWVrS0lQdHNkbU1nWHRWM3hw?=
 =?utf-8?B?UGN3NzhXQkpWRjJ3WmFCd0drenZ5Rnp2MFFWMTNva09wWkdlOGt6ME96V0tV?=
 =?utf-8?B?bmpRSkFCTkc4bDJlRU1RemVvS0p3N2g0NzFNeFRpeVd3SU1OQWIzWHZYSnMy?=
 =?utf-8?B?VWxiZUp5SnhTd2Z6QkxVVmtUZUVDd2J2ZENjR2FlbE1YczJ2elZtQllEeFdO?=
 =?utf-8?B?Ykc2Y0ZNUnpqTGpJazNPNTRrdkZGcFBWUkEvaUc1YWI0WStJYUFwMDJXcVNE?=
 =?utf-8?B?SFBSczZVbmlhak1xOVZIeWd0N1p6TWtxTnQ1ZktxcHN1RGJtd1NtVXpyZ0Zm?=
 =?utf-8?B?N1FsSUM4YXNZWmFnaitBaTRGM0wxN3VlOXYwbUpuU3UyTTNhRjNNTHlEbVNi?=
 =?utf-8?B?S2JhSW11amQzOTQ1VTF2OGRBRTRwMXptekdhc1VveXhGbGxhQUhaTFZ0UkhQ?=
 =?utf-8?B?aTcwUExhbXFkOUo0dm45VEdmYVZFMnhWUm84YXBGT3lCNUhrYjBhM3ZRSW92?=
 =?utf-8?B?L1d1VFFTYUtzZmVHa2cybzRrd1JpcEw0TGFERkJ4bzE3L1BwQy80S1hmRTBR?=
 =?utf-8?B?bktMd0dWbURnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUZUbU1xLzQxcDJOc2dnWk5VZ0tFZU1iS3lGdUFzWEZUYU1DNnNINzUyTlhE?=
 =?utf-8?B?d1Yyck5XVVdvbEZSckMzMS9SNHhKeHZnKzJxQno1eXJkaStydHJiWU5LMWNX?=
 =?utf-8?B?clBUOFA3cHMwaFRldVFYZi9PYnArMlJHRXQ1N0hjditjZ1dNdUsvcWpVR3dR?=
 =?utf-8?B?Z2w5RzJ2a3NjVGFodjV4emQwT0FINzZOM01hTlBiVmxTdG12YWNYMnNZeENN?=
 =?utf-8?B?cEF3YTdoRWhxVHBCY1psTUplcDFTYVJpNENyYmtNK2F4M2VUQTdDWXpiSFds?=
 =?utf-8?B?QjFDcnhxNDc3SHZIQUtQL2ZUSDdUT3RhUXY0SHVGRFRQZzRkc29CWXY0dXJZ?=
 =?utf-8?B?VkVXbm12VWhuS0pEcUVrMUtZMW43UVE4OUtTZVFmUXJMTWxyNFh5cnltKzEr?=
 =?utf-8?B?Z1BYMGJqWXBkWmVWNUFSQy80bEZmV2dUOFQ3bjc2WHYxT3V5UHZqZGJQV3lj?=
 =?utf-8?B?dWlkOFc2aHpFZlIwL01UUko2blJaZkVpTDFCUmhRaVVaVXdWMjBhRGZ3ZEEv?=
 =?utf-8?B?VDJRVHpMcXBnWTVNeFhTQWpJT1ljMlZIZ2lCOC9ONW1tQmF1ckFpbjVMTUpF?=
 =?utf-8?B?b3VSbEFXU1VwcHFTeHpqdTh4ck51SDBQOGVUYjdkbERwZStTQzgxMFBKY0o2?=
 =?utf-8?B?RUtJT3hHUmZ4bWVsaldpcjFzM0RYYW8rRkRYWVVFc2R1T3dHNHp0U01CYXdh?=
 =?utf-8?B?a29VZ3h3OEhXODYvNUhGTzJpYzhUcE5HMFQ5VjdGK3VVeTRzWXdPcUNLa3pF?=
 =?utf-8?B?OUtqRGhaeTRvNTI5TUZicVF4SHlJRklZdUVUQTNFRzBiV1grdjRSNjQ1Vk9y?=
 =?utf-8?B?THBNdThaczV2cnA1MUZSZ0VkcGpVWEp6dUFyNEN4b0QxT0lzR2dQeml1YXBT?=
 =?utf-8?B?MnpxbmV3S05yRTgvVGc4U1FvcDQ1eDc5d2JrME1uY1hhS29uNlBlQkptRU9t?=
 =?utf-8?B?UzBaU0NjQ3dUYWNoVHM4a0RCOXc2ZFUxZlR0Z1prYksveVlUWjl4U3Z1WnFo?=
 =?utf-8?B?cUJSSS80QW9YS3pYNnU4cVRsTGh5aVRTNmdiNUF2a3BMajg5N2R5K05hd2hh?=
 =?utf-8?B?RENzUURza3pYMHcrY3oxUjJrU0hTVy8vVDZnc2crcFk5eHNQejdVcmZZVm9Q?=
 =?utf-8?B?OGY4TEo0cThMS0FzSy9iU0c1OTU4TEVuZi9KUGJwZlBJVVlWZXNnR25JdGVa?=
 =?utf-8?B?bkVVWnFvTEcwWmkyLzQ3RHlkN2dJMEJiRmNwTDc5NjdMN0ZTMmJNc1JRelFh?=
 =?utf-8?B?QXZ6UkZ6VW1TMS80a0pjUU9uSDJoNWJGajROVStWVGNTMFBNM01OZEV6Zzlo?=
 =?utf-8?B?QVhuRFU2d0JXaU1JVHFSOFl5YUV0dU1vYmNFS0FnbFltTU4yS2ZMMXpjS1NW?=
 =?utf-8?B?QWlQWVd5blQ3cEVXeEIwMnZoejU3WEFsVlc4dDFDY3ozamI5TCtsUm1Qd1Bs?=
 =?utf-8?B?eC9FNVplY1RITU5kYk1oT2NVYm9zVHBvQWFyMVp5ckh4TWE0QVRHOEx0Q1BC?=
 =?utf-8?B?Q1dxSjkwQzd4ejBadkNQbXF2K2VIZjhOSWN1bmtJbkVJY2QyWkpjM29GaTR2?=
 =?utf-8?B?MFkxcHE3UzFCdEVOc2x0bURYeXQ4WVNsZmtIdkh1UnVlNUlqNWhXcnA0R3VV?=
 =?utf-8?B?aHlwenRxWGkwWEhYWEVENlNjdDhXNW1BSWQydG54clhqK2IwWUNWSU5XalNi?=
 =?utf-8?B?TUZWa1BqSDh5U3NMSkRGdmRzSzVSUTRzaFI1RXZnaElKZGllM3c4R1BhZzZS?=
 =?utf-8?B?cHdMK0l4TGovK3pDcFp1WVdCMVc4dDg1dVNHcy9CbEpLRCtIcXQySUZvYURh?=
 =?utf-8?B?R0F4OWo2eUFRMi9aQWsxcE5hSlF1cDdZR2RQTG80N1h5MmxhTlZ5U3ZnVHN3?=
 =?utf-8?B?ZEJOUGU4UzI4b1p4a1c5MFZDRitqRVdmdFJNOExQMlgzWkNXZitnODBpNE1r?=
 =?utf-8?B?d0t5ZzRBTXFjMjJNTzdNT2pXcDRKcGxlME02K2lJbXFPR3JySGhEU1UzWGoy?=
 =?utf-8?B?TndnczBUUUVMODlieERINFRUdDR6dTBUVzlLUDNXQy9OM3c0cEJwUDh0N1dp?=
 =?utf-8?B?ODFjK3RMZXRHQVVIOUp3blZVTjV1QUd0Q1g1RTF5ckp4M2YzV1JDdW9yMTJk?=
 =?utf-8?B?UUx0cFl2WFBPZnBhSDJtaE1LSHlhWEc1SXZ5WGZjSlUyLzhMUU1yMVk2RmFG?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f0eb47-f0d1-428f-6040-08dd1e77adf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:49:12.4124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kV3duXn1/nb6aQ/ZG0X22jQaeaW2C894sfJw+MV1ngpPXmPFcRkqlySnNDqrZOhLpCmg9XUVmJejnnBpKB1FJHNX2Nd9EIIgpg902CLKFIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13842

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDE3
IERlY2VtYmVyIDIwMjQgMDc6NTENCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzddIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBBZGQgYWxwaGEtbnVtZXJpY2FsIHBvcnQgc3VwcG9y
dCBmb3IgUlovVjJIDQo+IA0KPiBPbiAxNy8xMi8yMDI0IDA4OjI5LCBCaWp1IERhcyB3cm90ZToN
Cj4gPiBIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVl
ZGJhY2suDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+PiBTZW50OiAxNyBEZWNl
bWJlciAyMDI0IDA2OjMyDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS83XSBkdC1iaW5k
aW5nczogcGluY3RybDogcmVuZXNhczogQWRkDQo+ID4+IGFscGhhLW51bWVyaWNhbCBwb3J0IHN1
cHBvcnQgZm9yIFJaL1YySA0KPiA+Pg0KPiA+PiBPbiBNb24sIERlYyAxNiwgMjAyNCBhdCAwNzo1
MzoxMVBNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+IFJaL1YySCBoYXMgcG9ydHMgUDAt
UDkgYW5kIFBBLVBCLiBBZGQgc3VwcG9ydCBmb3IgZGVmaW5pbmcNCj4gPj4+IGFscGhhLW51bWVy
aWNhbCBwb3J0cyBpbiBEVCB1c2luZyBSWlYySF8qIG1hY3Jvcy4NCj4gPj4NCj4gPj4gU28gdGhp
cyBpcyBvbmx5IGZvciBEVD8gTm90IHJlYWxseSBhIGJpbmRpbmcuIEJpbmRpbmcgYmluZHMgZHJp
dmVyDQo+ID4+IGltcGxlbWVudGF0aW9uIHdpdGggRFRTIGFuZCB5b3UgZG8gbm90IGhhdmUgaGVy
ZSBkcml2ZXIuDQo+ID4NCj4gPiBQbGVhc2Ugc2VlIHBhdGNoIFsxXSwgc2VlIGhvdyB0aGlzIGRl
ZmluaXRpb24gYmluZHMgZHJpdmVyDQo+ID4gaW1wbGVtZW50YXRpb24gd2l0aCBEVFMNCj4gPg0K
PiA+IFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTIxNjE5NTMyNS4x
NjQyMTItNC1iaWp1LmRhcy5qekBicC5yZW4NCj4gPiBlc2FzLmNvbS8NCj4gDQo+IEkgZG9uJ3Qg
a25vdyB3aGF0IGlzIHRoaXMgcGF0Y2gsIGl0IGlzIG5vdCBwYXJ0IG9mIHRoZXNlIHNlcmllcyBh
ZGRyZXNzZWQgdG8gbWUgYW5kIGNvbW1pdCBtc2cgc2F5cw0KPiAiaW4gRFQiLiBJZiB5b3Ugd2Fu
dCB0byByZWNlaXZlIG1lYW5pbmdmdWwgcmV2aWV3LCBtYWtlIGl0IGVhc2llciBmb3IgcmV2aWV3
ZXJzLg0KDQpUaGUgaGVhZGVyIGZpbGVzIGFyZSBwYXJ0IG9mIERUIGJpbmRpbmdzLiBTbyBpZiBp
dCBpcyB3cm9uZywgd2h5IHRoZSANCkNvbW1pdCAiOTk3ZGFhOGRlNjRjY2JiIiAiZHQtYmluZGlu
Z3M6IGNsb2NrOiBhZGQgRXh5bm9zQXV0byB2OTIwIFNvQyBDTVUgYmluZGluZ3MiDQppcyBwYXJ0
IG9mIGJpbmRpbmdzPw0KDQoNCg0KPiANCj4gDQo+ID4NCj4gPj4NCj4gPj4gQ2FsbGluZyBpdCBh
IGJpbmRpbmcgbWFrZXMgaXQgaW1tdXRhYmxlIGFuZCBnaXZlcyB1cywgRFQgbWFpbnRhaW5lcnMs
DQo+ID4+IG1vcmUgd29yaywgc28gcmVhbGx5IG5vIGJlbmVmaXRzIGF0IGFsbC4NCj4gPg0KPiA+
Pg0KPiA+PiBJIGd1ZXNzIG90aGVyIERUIG1haW50YWluZXJzIHdpbGwgYWNrIGl0LCBJIHByZWZl
ciB0byByZWR1Y2UgbnVtYmVyIG9mIGhlYWRlcnMuDQo+ID4NCj4gPiBEVCBkZXNjcmliZXMgaGFy
ZHdhcmUuIFRoZSBwb3J0IG5hbWVzIGFyZSBhbHBoYSBudW1lcmljIG9uIGhhcmR3YXJlIG1hbnVh
bC4NCj4gDQo+IFdlIHRhbGsgYWJvdXQgYmluZGluZywgbm90IERULg0KDQpCdSB0aGUgZGVmaW5p
dGlvbnMgYXJlIHBhcnQgb2YgYmluZGluZ3MganVzdCBsaWtlIENvbW1pdCAiOTk3ZGFhOGRlNjRj
Y2JiIi4NCg0KPiANCj4gPg0KPiA+IEZvciBleGFtcGxlLCBjb25zaWRlciB0aGUgY2FzZSBvZiAg
aGFyZHdhcmUgcGluIFBTMSBtZW50aW9uZWQgaW4gaGFyZHdhcmUgbWFudWFsLg0KPiA+DQo+ID4g
V2l0aCBjdXJyZW50IGNoYW5nZXMsDQo+ID4gcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKFMs
IDEsIDApPjsNCj4gPg0KPiA+IFdpdGggZXhpc3RpbmcgY29kZQ0KPiA+IHBpbm11eCA9IDxSWkcz
RV9QT1JUX1BJTk1VWCgyOCwgMSwgMCk+Ow0KPiANCj4gQmFzZWQgb24gdGhpcyBwdXJlIGNvZGU6
IHN0aWxsIG5vdCBhIGJpbmRpbmcuDQoNCkkgYWdyZWUuIE1hY3JvIGNvbnZlcnRlZCB0byBhIG51
bWJlciB3aGljaCBiaW5kaW5nIGNhcmUgb2YuDQoNCj4gDQo+ID4NCj4gPiBXaGF0IGRvIHlvdSBw
cmVmZXIgaGVyZT8gMjggaXMganVzdCBhIG51bWJlciBkZXJpdmVkIGZyb20gaGFyZHdhcmUNCj4g
PiBpbmRpY2VzDQo+IA0KPiBMZXQgbWUgYXNrIHJoZXRvcmljYWwgcXVlc3Rpb246IGlmIDI4IGhh
cmR3YXJlIGNvbnN0YW50IGlzIHN1aXRhYmxlIGZvciBiaW5kaW5nLCB0aGVuIHdoeSBhcmUgeW91
IG5vdA0KPiBkZWZpbmluZyBHUElPIG51bWJlcnMsIElSUSBudW1iZXJzIGFuZCBNTUlPIGFkZHJl
c3NlcyBhcyBiaW5kaW5ncyBhcyB3ZWxsPw0KDQpPbiBSWi9HMkwgYWxsIHBvcnRzIGFyZSBpbiBu
dW1iZXJzIG5vdCBhbiBpc3N1ZS4gQnV0IG9uIFJaL1YySCBhbiBSWi9HM0UNCmhhcmR3YXJlIG1h
bnVhbCBqdXN0IHRhbGtzIGFib3V0IFBvcnQgezAuLjh9IHtBLi5IfXtKLi5NfXtTfS4gSGFyZHdh
cmUgY29uc3RhbnQgMjggaXMganVzdCBkZXJpdmVkIG9uZS4NCg0KQSBkZXZpY2UgdXNlciBqdXN0
IHJlZmVyLCBoYXJkd2FyZSBtYW51YWwgYW5kIHBpbmN0cmwgbGlzdCBhbmQgcHV0IHRoZSBkZWZp
bml0aW9ucyBvbiBiaW5kaW5nLg0KSGUgZG9lcyBub3QgbmVlZCB0byB1bmRlcmdvIG1hcHBpbmcg
Zm9yIGFscGhhIG51bWVyaWMgdG8gaGFyZHdhcmUgaW5kZXggY29udmVyc2lvbi4NCg0KDQo+IA0K
PiA+IE9yIGFjdHVhbCBwb3J0IG5hbWUgUFMxIGFzIG1lbnRpb25lZCBpbiBoYXJkd2FyZSBtYW51
YWw/DQo+IA0KPiBXZWxsLCBJIGRvbid0IGtub3cuIENvbW1pdCBzYXlzIERUUywgbm8gZHJpdmVy
IHBhdGNoZXMgaGVyZSBpbiBteSBpbmJveCwgc28gd2hhdCBkbyBJIGtub3c/DQoNCk9LLCBJdCBp
cyBqdXN0IGRlZmluaXRpb25zLCBzbyB5b3UgbWVhbiBpdCBoYXMgdG8gbWVyZ2Ugd2l0aCBkcml2
ZXIgKyBkdHMgcGF0Y2guIHNvIGl0IHdvbid0DQpjcmVhdGUgYW55IGNvbmZ1c2lvbiBhbmQgd2Ug
Y2FuIGlnbm9yZSBjaGVjayBwYXRjaCB3YXJuaW5nLCAiYmluZGluZyBwYXRjaCBzaG91bGQgYmUN
ClNlcGFyYXRlIHBhdGNoIg0KDQpXaGF0IGFib3V0IHRoZW4gbWVyZ2luZyB0aGlzIHBhdGNoIHdp
dGggWzJdIGFuZCBbM10gc2ltaWxhciB0byBbNF0sIA0KDQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQxMjE2MTk1MzI1LjE2NDIxMi00LWJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tLw0KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTIxNjE5NTMyNS4xNjQy
MTItNi1iaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbS8NCg0KWzRdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0
L2luY2x1ZGUvZHQtYmluZGluZ3M/aD1uZXh0LTIwMjQxMjE3JmlkPWVjYzc5YWI5MTllYzU0YzY1
OGZiMTRmOTU1Yzc2ODcyMTE5ODI5YjgNCg0KQ2hlZXJzLA0KQmlqdQ0K

