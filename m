Return-Path: <linux-gpio+bounces-18910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046BBA8B05A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838BF3A6FA3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 06:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B24205513;
	Wed, 16 Apr 2025 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gQk0RyDa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2072.outbound.protection.outlook.com [40.107.241.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39572557C;
	Wed, 16 Apr 2025 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785108; cv=fail; b=Eqrt2VutNbeVy9QmehlnWcB+lpcDPEaGatm74x5awVFZhu7vu/Noia/y/HcuWGXGE69AyiS+kCReKsqaFMnk/vy1bEHjzp1hqa6CPbPGgFfNpBTZFzcE/cRF805nQ6ElUyaNwzQE8SwzKzDXdoIOuthulVeQveKy8LALhn7OJ0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785108; c=relaxed/simple;
	bh=89njukr+iFwua4i39seo5ptEUGVfDX3iKaSmiYaMkMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sIWN9AJMYKhCeLmuUyN8AEj3zSn415hBLVV4ZsBD39UhiE6Yp09jFvfax/qAipKkJ5dmowLtRDAGPsqEtNL4leE/LquvOucBzjcQgOYj0CCMu4wiVrVouFXBp5/cS112JU0GQUOwaET9ao4BkxW0dnF5BbLcTSkyDiR3VvZdRNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gQk0RyDa; arc=fail smtp.client-ip=40.107.241.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alocGh+Y5bLB6PCUXSym8y+yeRQlHA0YYHz67ksQpnJwiydo5VjKDDxkcRv6JjpHGvmnNuZAXc29MVe4OpPiGg6rPoE6cxM1O2QuxTn3Qeej0/+HdklpcW8738FrSjiHOpj77ODXAy3q8ZsP7yn1n+EkqMJLguPGrqzWggU/Ri/mEYpJqQpy3eBqGH2EIBFzZhbXayBDHNmv0GAk3lqsxf2YrQyMyU8hiMDOwHauwZSYtXSdpoLSbWUVUjxZkd5Rs4YPeR6BgfSOKvRCTRdYrLaOREI8ZRa1yjeV6kAX/qsYiUMtv9babHAtvHTcldsBSFjFbaGYnRhkb51rW+pXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89njukr+iFwua4i39seo5ptEUGVfDX3iKaSmiYaMkMs=;
 b=aWshYG6mf+HiwwKmcGza7mzaQVq1oBq5aOi/LOGq5OMuGER5FOM35IH4fq5cJn7hgreBM1QFjvkEuW/gvp+jUm2+JVOPiZqeuDK23eHWfW4deMF1LBLn7mwJxRYSQ6AX5Ym1FYWbh9EubBtOfKymcT1JVERk5r/hZpyYKZ5vBVsiKbssI031IiezrWMUjnkzVaelgTbJhGVE4Pxf1YO/eE+XNNfQqaZjXcaplJLwXQBmA8V1qtIsmcYnEyP4YlkAgRdqby6oSBz2TJNM9L0Z84leYQZqF3LpP8vKWwZfuuqwhjjxf+/bIVchWisajhBigiB6aINGvXAIJkfXZDL1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89njukr+iFwua4i39seo5ptEUGVfDX3iKaSmiYaMkMs=;
 b=gQk0RyDat+vJDufXB2hFm61aHIvpgvI4dlIavpcjVJktS+AJUUprG4x0+nvwexWJUyeLNAIayOONSFXQiPt8Z1iLw+DnHN3leow3uCALb7vQ+0yHeLTjA0ADu7LeLqJ3Z5VMignQcNCChH6avcmbDG5eoiJfOTQ0TxcYRTpbntz67Oezx/e44eZPQd19TK21s+SC25nnh9tMZ8zwf5HSM5Gl28/advWEgOWE42dhzHI+W/8sHjtJ0BE8tIM58DdxalWCl5gmd9I9KhpTCoj0ViVaDxyL95FYALrUIiM6FD5iGbs94qZgPZfefOFVdcRuzNx7yRCwnbH1c9VO8HMVeQ==
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 06:31:43 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:31:43 +0000
From: Jindong Yue <jindong.yue@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "brgl@bgdev.pl" <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH] gpio: vf610: Allow building as a module
Thread-Topic: [EXT] Re: [RESEND PATCH] gpio: vf610: Allow building as a module
Thread-Index: AQHbqJkXg/B870/v3U6DVp4TupGNk7OlTlsAgACRZCA=
Date: Wed, 16 Apr 2025 06:31:43 +0000
Message-ID:
 <GV1PR04MB9183B5A58F5C2B51A2B9C82AFBBD2@GV1PR04MB9183.eurprd04.prod.outlook.com>
References: <20250408151521.552749-1-jindong.yue@nxp.com>
 <CACRpkda23XbwhWTXzEF54D6yupc8+xAQpSPPb2vAy9aQsXxe+A@mail.gmail.com>
In-Reply-To:
 <CACRpkda23XbwhWTXzEF54D6yupc8+xAQpSPPb2vAy9aQsXxe+A@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR04MB9183:EE_|PAXPR04MB8926:EE_
x-ms-office365-filtering-correlation-id: 052b6a8b-3344-418f-f700-08dd7cb05a86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTU5RmI0MG1iTUpuNjFCYnlFS3dkRzJicWlXWkVkUk9qZmNuR2ZlRUtLTWtv?=
 =?utf-8?B?bUpiell5enpMTU5sb050M09pcENQek5QUTVpUXpNM0FmSzhoWmdMb0RZbERz?=
 =?utf-8?B?THU5UEJOM0hLMHhaSnZkWlVXUnF2eTVIMUtyVE9VOElNc3JhMW85U05HUlVE?=
 =?utf-8?B?cXBDY2pvSXNQZ2gxeFFTRGxYeVpHQzQ1VmdsTkV0OVN3ZlJETC9JeWpzY1Jw?=
 =?utf-8?B?YVlmMnNsV2lucWdHSGUxcGpQRURtQkxVUGxiWXBHV2IvVG5qQS9qNTdSZkxK?=
 =?utf-8?B?ZVc4ck16eVFNNVVhVDR2RW5lcjRYeEJ0WXB0MVZmWE91ZDhIb2NHZ3NBQkFy?=
 =?utf-8?B?WEdjOWx4VVlYWUJaNHAvNUgxelFSeVdXbFgrU2RTZXVBRXBtMmREMlhqMGxo?=
 =?utf-8?B?MEkxSnI4WEVPRE9xTHdDL0d1cVlXTVp3M01jTnFvNGhEYWdtT1g5UnFkRHcz?=
 =?utf-8?B?R0I4VXdYVDRpd1hYTVZXemJFdlBUa2RJcnRldEpPZk8vK3VSZ0Z0eldxQ2xn?=
 =?utf-8?B?V0V4TnRsNlpHS2gwSE9zVTUreGZyYjZtYitEYjN4ZStRQVFaQmczcEhEWDZX?=
 =?utf-8?B?Rll0cWxJLzVWU1h4OUkvTkZHMW4zWXlUQ0FXc0t1bmVxaVBZUUQ4cGo4aHpt?=
 =?utf-8?B?VzVRQ3FwRnB6S2VTMDlEN0djOVhnOU9ONEZlMVV2OVZPSGJnY2J0eWVJY3NP?=
 =?utf-8?B?REYzVWNweUJXNUlma1dBRGZpQ0czN3VzYllHRGpMdkw4cjJ3M1EzOFg5Q2xR?=
 =?utf-8?B?RVpqOHU5b2NkVjN2SmMydGVlZUdWalNnbzZHUzh4ci9meXZYakkvRXZDWjhU?=
 =?utf-8?B?Mm5nNjkwNHJjNWZ0WjBWU1I2UHYxeHUrSndJSGZMTVRGdmhoNEZZNlZVMnZj?=
 =?utf-8?B?RlR2T0pmMXgvamw5dDJHbXNROUtwMzNWQU9kdlR5aFdCci9SMDcvV3VNY1Br?=
 =?utf-8?B?c1E4NmxqOHZwVlNRNGNMM09WTGIxT1ZwMWJlUm5BL2s1OG4yN2pNWWQ2SGJP?=
 =?utf-8?B?YVduRVVFZWtSS21NSVdvbXdjcjh1Wjk1NWtLVi9FeDBDMzVRRHBXdDdGVytJ?=
 =?utf-8?B?Q2pkWXltMzNXOWdOQnBTdlZybFZGU0VZdHpZU1hFTDhCVTNmSlJHT0J4ZWhu?=
 =?utf-8?B?RVZJRk5lVW5pcEhXa0tDTi8ydWZzMTk2ZVVCUWRaNCtrUUJCYjRGVVhDd3l6?=
 =?utf-8?B?T3J2R3UrVGN3QkljcCtidG5lbVR0QnFtdC83OU03TGR0N3ZMaHNOVlpGampY?=
 =?utf-8?B?ektQRG9aTlpnY1RmUmp5MVRGQXMyL2VVRmRvV3J5YW03aEQxZzdvK1FNUFRi?=
 =?utf-8?B?UkFRVUtpcmxpcHZHR044K09kT0txdXlqb08rbFE1Y2t1Vll6ZlVNZko2R2lJ?=
 =?utf-8?B?dld4eG01dXQ4Q21nb2NsMXIvWkh2TkpnRzBtTlZjOWN3MkpzUGhXWWY2ZE8y?=
 =?utf-8?B?WEdkV3BnMmN0V2FzRjZCeE5iLzgvbHpuOHRNcVozUGpBcjNLcjdHN0xacnFI?=
 =?utf-8?B?N2d6UGhBc2VVMFg5bHhNRDNTU3IzK3dXTzR1OWI5LzRoSUJNODhjamVkRFk1?=
 =?utf-8?B?RDB6NWRrYjFvUlRIL2RIcDdjOUNSTVZEMVJraW1jZ2tjS2ZhaTJiZXlKa01a?=
 =?utf-8?B?Y1RGa0xYZXVPRXpBZDBVeUFkU0Z0ejQ0SjAvMkVXdFN0emFrc1NsS29iMVNU?=
 =?utf-8?B?aXVuWVZzNE5WTVRSRm5ESXRDdDBvNlpMakM4RzNQWkk5a3MySkNVRXcxNFVM?=
 =?utf-8?B?YnpUT3FWeklnUUFZRXl5MDc5OTR4Z2NldGR1MERUU0tGVHF2TkE3cWtlWll4?=
 =?utf-8?B?SXc5TnZwamV2aHNQSGYxaVVQekw3Vjd1b21NU29XeGdwMGpOOUY3QWJJY2dh?=
 =?utf-8?B?TEFjQkVNUUhKT1IxYWNocmZxNGsvMTFFdkY3Vm1oVEFjNmpUa1FyUWhOU0pm?=
 =?utf-8?B?OEtaaWtLMnlxWnlSMTBQcVRlSTRvdFNrekpFRGFDNDVxdVZHUGxGN2pNY0lo?=
 =?utf-8?B?bXZ2MFZkbURBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3l0NFJtRE9QTCtQQUJHODNRb3diaTBENDJFb2M1aGhwYnIzeEN4V29yZVlK?=
 =?utf-8?B?WDMveUdTbGV4RjA0T2NGaVpWUURoUkJxdXhpd09scHBLYVNEZmlRMTNJTldC?=
 =?utf-8?B?b3RTQ0RtWTlxblZoaTFrQWRzSzh4VE1ZR2tRRHVMMVVsS1pyRGQyMUZKMzYz?=
 =?utf-8?B?NGhySnJRZUtmTi9OeVJPVWlud3BFZkJjSjQyK2p6T1hlZDdURS9hc1gyckVP?=
 =?utf-8?B?bG5UclhOam5zSE4rVCtmMDJQaU1GZnpqUHEvOU1mNzl3V3dmbU5jaVo1VUhY?=
 =?utf-8?B?Ty9uelNZNlB2aFhsYy9BZlNmdlEvU2VsNzhoaVdtLzNwOFFBcnl1RE5zQStD?=
 =?utf-8?B?ZFlSYlRjZ2xkL2lQRTJpaTBLeW90VGsza0lpdjJaYVFqUzZ4MVBwMnpzbHQ1?=
 =?utf-8?B?dElsVkJNUzM1R3hzc0hHTFRoNURXTUtNVUs2eGJzUm9vclAxaGs4U1QzcjBO?=
 =?utf-8?B?RC9GSVlBYVBPajBBMmFteUw0eVFHekxEdG5zNTM2UWhmMkdxbjZJNlVLdTl2?=
 =?utf-8?B?aW5TTEFjRzQ3ZDdoQWRsK0c5c2ZBQjBWWDdyVldkZ2pXdEluMjRIMm4ra3Rp?=
 =?utf-8?B?Wmp2SGVmZ2dzeFNadnBjSkZ1cjI4eFNPVDFwM01tRXJhU3ovOTBwamtqNTdk?=
 =?utf-8?B?OE9pL2pRMTlzOWpXSHByL1VMeUcrZXZ2dmtlR3grcmpFQlg2ZGFLTjVaMU1t?=
 =?utf-8?B?QjZCbHJuUjdrandKWkVLa0hJaWZIak55VGUyMytwKzRNUnhOS1ZINW0zYXp3?=
 =?utf-8?B?TXgxL2xzOUNqV3hDTmpZdjhKZjFQVkJuTUxid0ozMmhiT245N0R6bGhZTGJ0?=
 =?utf-8?B?aUFuaUMybXVFU2ZKeVlvZXpTREw4dWx4WCtQTnVSdlIrMFV0RGVSMEM1UGVa?=
 =?utf-8?B?T1JkMVIvL29ZTlFNa1J5T2JrcDRGbnVXZ2p4Yy9lQm9sUDZzVlBsbFF6SDRa?=
 =?utf-8?B?MFZrSnJXbzFYY25zZFBCQXdsTmFIMXRiOTFVMUFVUzBTb2tmSzJWdXVRdWpO?=
 =?utf-8?B?MHQ1VU5xUW56cUxHdW0va2F3SEJ2a3ZHUjh2RUdFQm1YNTVMQzFnYlZkUnhI?=
 =?utf-8?B?dUxzUFlFZzF1ZW9NYjJvR2U1VStqYkJ6REVqbHpLa0hTSEdiV3UybWMvb3Zt?=
 =?utf-8?B?TlhDSFNldWs4VE9vdkwvZElYd2dUVk9TTFozVmRFM2h0SzVoY1BwRTFucTJ0?=
 =?utf-8?B?cjl2ZUgwZnlGeGs1ZUE4QVUySnRRd1JzUGQ4Sk01c2Q0MHJaY2lTalRWNEM4?=
 =?utf-8?B?MHltL084cHZjSHI5SVFvSWxGRFgzbEdaRndiWUEyUi9qOEx6cjdadGdHQmZM?=
 =?utf-8?B?alFKNVNrd21hV0RUTmhNWUtSZHNldldsNlJVQkw0dEwzVWdiZlpObVFHUTBo?=
 =?utf-8?B?MlcxaWJ3SCtvRjVXUERYalRDZ1pwRUFaeUNpeWZCODhZVUVJaW1aZWQ5Y0pm?=
 =?utf-8?B?U1VQb1hURERHRkVNamVFazJPK3p6QXN6WjA5NlJ4SHhoclVlVFNpYlk4azhT?=
 =?utf-8?B?UTNzSng4a2xXNDJ2Q1ZLV21JOEVJL3psT1VMbzhxeWltcTJFdEErdEtxR1F6?=
 =?utf-8?B?WXRkVExqbzlnRWFLUFpodm1wZGxyS3dibnBLbXplZ0RwalkyZHZTdlJDTWh1?=
 =?utf-8?B?dHROc01iWlFlNFRtYVZkdnFVclp3akhFbFN6Y0dEQXFmRWVnSTJ4WXpiaXJI?=
 =?utf-8?B?QnIvRFRrM1JGaXRYbWZaQ2crNEVjVmNFYlc0U21jRC9vdmptdFVsTXV4a1hq?=
 =?utf-8?B?WVpubi92dTYvV0FZWFYzZEVEa0F1STlraDlWanc4eTgzeXNWeUx4aXRsNllY?=
 =?utf-8?B?Y1BqbnFPWExaK2Q1V3p4b3VSMXVLNlM3VzRqZUk5UGFrUGMrMXJUaHdzOERw?=
 =?utf-8?B?NGVXQUYxa1Q5UGlYazRHb0lGaTJWMXFQMU1yOUQ0ZHU1Zm9xZzlwTVQyTXNP?=
 =?utf-8?B?dVZZdmlFSCtUSEZrZmJJQmh3N0lsbHFFamxRRlFIVS80QXJyNDYwN3RwRkNk?=
 =?utf-8?B?dmlyQjIzQnNVYnFtYnNVSkk0WTdsUVVXK2krZW9wVmlreE9FTXJBaDlreTZF?=
 =?utf-8?B?SXVDWG1MY0hYTVhtVmRzMUNIUm5SMFRvMUhLQko5QXdUdmtBUFNxWWFnaVlj?=
 =?utf-8?Q?mcWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052b6a8b-3344-418f-f700-08dd7cb05a86
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:31:43.0818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUC0EmF/quUX9aFaZJEw9ZUUJj0rV0HW20bcxfc38nxAnh7a9qBEBu3T9u/dvfAhu/AqWw336ll2wNitjO7IMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTYsIDIwMjUg
NTo0NiBBTQ0KPiBUbzogSmluZG9uZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+IENjOiBi
cmdsQGJnZGV2LnBsOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1JFU0VORCBQQVRDSF0gZ3Bpbzog
dmY2MTA6IEFsbG93IGJ1aWxkaW5nIGFzIGEgbW9kdWxlDQo+IA0KPiANCj4gDQo+IE9uIFR1ZSwg
QXByIDgsIDIwMjUgYXQgNToxNeKAr1BNIEppbmRvbmcgWXVlIDxqaW5kb25nLnl1ZUBueHAuY29t
PiB3cm90ZToNCj4gDQo+ID4gU3VwcG9ydCBmb3IgYnVpbGRpbmcgaXQgYXMgYSBtb2R1bGUgZm9y
IHVzZSBvbiB0aGUgQW5kcm9pZCBwbGF0Zm9ybSwNCj4gPiBiZWNhdXNlIHRoZSBBbmRyb2lkIGtl
cm5lbChHS0kpIGRvZXNuJ3QgY29udGFpbiBib2FyZC1zcGVjaWZpYw0KPiA+IGRyaXZlcnMsIGl0
IHJlcXVpcmVzIHRoYXQgdGhlc2UgZHJpdmVycyBiZSBidWlsdCBhcyBhIG1vZHVsZSBhbmQNCj4g
PiBsb2FkZWQgaW50byB0aGUgc3lzdGVtLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmluZG9u
ZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+ICguLi4pDQo+IA0KPiA+ICBidWlsdGluX3Bs
YXRmb3JtX2RyaXZlcih2ZjYxMF9ncGlvX2RyaXZlcik7DQo+ID4gK01PRFVMRV9ERVNDUklQVElP
TigiVkY2MTAgR1BJTyBkcml2ZXIiKTsgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiANCj4gWW91
IGNvbXBpbGUgYSBidWlsdGluX3BsYXRmb3JtX2RyaXZlcigpIGFuZCB0aGVuIGNsYWltIHRoaXMg
aXMgYSBtb2R1bGU/DQo+IA0KPiBTd2l0Y2ggdGhlIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKCkg
dG8gbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpLg0KPiANCj4gKEFsc28gbWFrZSBzdXJlIHRoYXQg
cmVtb3ZpbmcgdGhlIG1vZHVsZSBhY3R1YWxseSB3b3JrcywgcGxlYXNlLikNCj4gDQpUaGFua3Mg
Zm9yIHlvdXIgcmV2aWV3LiBJIGp1c3Qgc2VudCBwYXRjaCB2MiB0byB1c2UgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcigpLg0KSSBhbHNvIHZlcmlmaWVkIHRoYXQgd2l0aCB0aGlzIGNoYW5nZSwgdGhl
IG1vZHVsZSBjYW4gYmUgcmVtb3ZlZCBhbmQgcmVpbnN0YWxsZWQgb24gdGhlIHJ1bm5pbmcgc3lz
dGVtLg0KDQpCUnMsDQpKaW5kb25nDQo=

