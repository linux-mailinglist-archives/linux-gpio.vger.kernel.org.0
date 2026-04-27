Return-Path: <linux-gpio+bounces-35544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMTHM5Mp72lE8AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 11:17:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE4346FB40
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 11:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CEDB301FAB8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 09:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A7D3AF65C;
	Mon, 27 Apr 2026 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kX7PGUQB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B983AF66E;
	Mon, 27 Apr 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281185; cv=fail; b=ak01tQfI6j96srElqGkLt+aWJOCE37wqhU6f5D9cNusvjlJcc4Ri4THJC7mLL6GUambi27dXE0n4NmhfVX7ZSk5wF6wEwBOoM+eVoy+uW3mCHgamztJEglyAQOOJthP8yqVjbJvTeL5FAnMqdf5hkLleiWSJ/hEzd2xqioKc2HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281185; c=relaxed/simple;
	bh=wKN9/A50a9y6AfzeHAfNDlU6ioLkyM1p/fUX/zkMX94=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AOhn2EEGCDlpZlgrfjxVZmPJRWjDyMIdMoCGJOHdQ3QqiaFVOzckaRe9b150So46Fy5A1JLw0IpE653iifCgjek412lsi+xQx3t+s+MdbJ3AT3hdN1r9vqfXcykcj4HxTj2fOdb0dXGefVjvw2z3uLcD9LzeaHdiogMHkvEahss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kX7PGUQB; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qq0YOjwIwglrQCL4ljcs+KZMa0UoBMIE2CoJWImySEyt4RYXtRvQQxf1F1xo5ZD79tZ9UYjMcfTcKq1xyEt2CftfgwH7gkgR6IvIJR/s11tx7qkc5UQwPm0TYBClW0VuqpsWoHykEROEVZX+uav5wuj9qoqrR9JJ6r3Qh7Q0Eeksok0m90anqg1mIUYPdKgK4iGmhftzi4EaE4yQLodPmO0LFvgwfzJaG3n6ycjvTvpQU1G9L4e9/T4pZHfeVq/BnXNsDhO3cf8Adyt2/tIWGpuTwFaBALG23PHnKw/d0oRLVycUcLNnaQogo1bYg1kLzE8C0eeIheN+4TNhJ68Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKN9/A50a9y6AfzeHAfNDlU6ioLkyM1p/fUX/zkMX94=;
 b=pGrN58ieGABUJncCldi59I9uyJBTRIL12heWeo5074y1IWD6rp81bAfB+spsCbPfCU4P7zyKb+U8xmghLLFhQbN5RZZIiowoOe7DhAU1H1JxnPlsmyd7nGNomntfEWfSMjQgpgLL9G5JxUIZchCm/A2Scp5VPYjMhij28lDR8zL1DQXVDXHJBWwt5NRgCxrohFsv/wSXzxcVI5vKV/C3Jdxa12sTaA7MNKPZyJf1O0hPYX2kBkwoHjvH7hd3L5o7v8VWRYjXFy1xYmoSz77lzKoyhlcBe2AG50B9J8uz6bSVypKVBhGnFG9nY+5TjgLNf5annTWXvRAKTuDg5tjevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKN9/A50a9y6AfzeHAfNDlU6ioLkyM1p/fUX/zkMX94=;
 b=kX7PGUQBSwV6J9BO0+zA4DFx2nJag9mNFZVXT4QKeaeeaRObqHR1c6TuNNyo8TzbTumhzcrlAneca0cF5eVI4Rfo3jFJ3GlO00ivSrsjr8NaDYCh8vLg6ga/tVg4+ShkqjUyqKhVx0/0hOqObsDQSqg67J+dG99hCapINhbAP4VEd0411pbMDn/yQbTW/1T1sQg9Wu97BKA1qwP3U83sKuJ6/OPTIZrwKqN7te8YiIn82Q6Kn3o59K0Cs4O96Jt3TTGICAnpeBRU5+wnlETpOkJCAuFXHBqR/Z/XOfAGPV7X0Ude0SxAK//G8xaEyDjjXjiM8Sll9FG01m7ktLaPaw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB11023.eurprd04.prod.outlook.com (2603:10a6:800:25c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 09:12:58 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 09:12:58 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski
	<brgl@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "G.N. Zhou"
	<guoniu.zhou@nxp.com>
Subject: RE: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Topic: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Thread-Index: AQHc1iYJ2AsNv2QWQUmJhGhruFJJLA==
Date: Mon, 27 Apr 2026 09:12:57 +0000
Message-ID:
 <AS8PR04MB9080113A71D87E952561FC53FA362@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
 <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
In-Reply-To:
 <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB11023:EE_
x-ms-office365-filtering-correlation-id: fd0df4e9-8add-4f72-ee39-08dea43d2c82
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|19092799006|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 FseMhNLJ7lugysu0Kvg+Am6iZhF/+ZETccs2KTq+xbOtuplleO9arEpipNCi3qNjQ11PK9RmsFo/v10dlgQXxLqvgxM3aU6u3tiGei/C5ODdJPn1HdoY58cONhyYv0FTK+yf6AtJVigo+3nwR7LFFbR7JmzWtwpK88Xs5r8FIWEHrM28w4FzPFPCxnVivlyKtmyVcFBlsBXT0ss4bVIsll/3svtJ0cBdE/dRYtqpvdTsqZZOeDJmdryKLcfpBUAQFGv0bawUNssFkhVjlKRXTM0/gomprafDnjxfzxIoeV7bLfmuyiZA4BIbrKdW97wYywNzOzT457HKuaLagQgwXUYvo530lpb8kESraDgL72X1uUQOkuS2DOm9S2VqmKcdX2/AyKo6EYRIIzSV0HPUG9eZU4mh+nkTKcQeedYrPiXE7PCx6X4q2y4CB2gfXeIe7ltalDO7TAzfDFdGfUorQChhy1mrunnVIQSai7azIN6x+syV+MP86WvrZrjF9dgBLYTdZe0xJUppoEGoclI7IYuAS9Zm1BNzc2lTueK66ku9bKMjZfFwz0kJGzZLrGFOKichQ9J9xA1sLXvYiM4I321DWnnrQ7EBH7KFj/y41oMOlTUIVTyRCy6g6PPdVTJkWhFB4JFLyTRMDQ1HvuGCWRIeB9wbNz+ve6gFIpvsdzCsBKa/zarcrO2gBf9jwvr8o9fjq36OzRMCtjVjcs3vZhkuUoGzOf8yUqZGJAzQRFc+mNtdH9w75FBNJPBksM/p
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2lmTXo4TWQ2QStoaW9qclBuVlhxeTVOaFNCWTJFNTVReUxSbmJrSTV2Y1lw?=
 =?utf-8?B?ZFNWTkIyWVJvTkxSeUc1WkVHbFFYMjhZNXA0eVNYUk94VHMxWFVmVUtHRlZB?=
 =?utf-8?B?QUtJeVIrdklaN2Y2cHZUUlVVNkxJYndEYk51d2w1Q0IxYk82SlY1U3Jlb0s2?=
 =?utf-8?B?SUZwaGRiUm44UFNrTHRGT2I4VGM5cUZaVXE3OGpLcmZITjFtNUxBa0IvMkhQ?=
 =?utf-8?B?aG5Fb3cxUS9JanNqeXg5RjQzeWJRUEdEYmwwWTRrc21XczJ3QnJmU09TcVRa?=
 =?utf-8?B?UFMwODVaNmFSQlVXR2pEVTVqQ2JUTkZ5WVQzWk1uUUtzcFJENFU0a1RRaUlV?=
 =?utf-8?B?SHhCL241TXJOMUxOa08yMGdtUlVJQ1FKeXE3Sm90Mzl3TUhSbStqTHk2Y1ZG?=
 =?utf-8?B?aUFuOXNHRjlOMUFpSU10Snc2SGVURG93NjNBSDZJNnBLSFQ1bHpCdjRLMVl2?=
 =?utf-8?B?MzMrdVpoRkpNU3k0WXByUFZrWllBRDdXT3ltYkIvZURhakZ2QTlIOERqd2px?=
 =?utf-8?B?b20yZVBHaXNWUGtTeFZtU1hQeU01OTA2dE1OaW40S1l4MFdaTnk4Nlg2WGFm?=
 =?utf-8?B?TWtQQjdxdCsxaUVtTWpVdXBCVXdKZzk3T2pwbkh5d0xMM0tuQVZjR2g5aDQy?=
 =?utf-8?B?TXFlY3laazE4YXFBWXRZYUlZVzNTdzdlSXNhS05QTFJxWnRDREtFVUF1S0t5?=
 =?utf-8?B?b2FwbFEvWkhxM0lPNnhLVWxKNVZybmRMZk95Y1plVTZpZFNWRldwOXYyVmox?=
 =?utf-8?B?c1VyZmlyaEROeldtSk5DZUZEZVNEREl5UFZUbXZpa01EMmo2ZkZpREVuWmxU?=
 =?utf-8?B?VEk5V3pPYVJXSEJuWTVFWnQvRTh0emNKeXVhbjhkdFcvZ0pwbGFEdlJETTRF?=
 =?utf-8?B?aGVWenZqQUVRNUpnMzk2TE1ZTGNpdlBvUTBoRlkzOVYzUTBELzcwcnEwWVlt?=
 =?utf-8?B?d0JCMXJpWUhWVElGZzFBY0V3Uk1ZbjFUWmlxYnVENlRmbm5SMXFpL0JiZ0d3?=
 =?utf-8?B?UUtVY2RNNWVWNXJvZDRFMzZYZ09WaGp0SkVReUNNOWZ1cksvV1VPKzFsUktL?=
 =?utf-8?B?SHN5U1VXRi94cUptdFlJeGJlRFIwRVBhalBscWVSdmpOV0JpN2l0Wnc0S1BR?=
 =?utf-8?B?VjQ0ekl6RUVFU1RZcmlBUGdHR3lQcWlWejFIMEVwbE00SEQvcFNQbXlEQWdG?=
 =?utf-8?B?REg0NzhvemQxOGt3VXQ1V09WbXdzYW5jVGFtWVI4V2lkMkNLWkdiZ0xxUXVY?=
 =?utf-8?B?bEIrNzgxdUNFTllDdVBDQXA0NkhraFhSWXREUnpEdkt2RW8zdGFoTjBvb0ZK?=
 =?utf-8?B?UEprS2ZRbmRyQlc3ejd1S3Z0S3VyNU5MblF1dVV1eDlBMEhabi92aUo1QWdG?=
 =?utf-8?B?bVlsYmJDOXg3RWJzUUNsd1Q1QVlFcXVqZkUxaHpZSDExU01TTW1XZXhKc0Fq?=
 =?utf-8?B?SVRLczBjcC9EUittQ3NmK2t4eHZCbEpTTXlEK3hoU21RTEJBT2xKLzlFSVNs?=
 =?utf-8?B?aXErQTNVbGd3ZWd6eEVTZlZSWEE2bjhzNFRiai9mcDNvUFdxWStIKzhqWjZo?=
 =?utf-8?B?bE5SMzR1dTZqSjBKTkF0N2pJaWRWZTNJQk5BYjhWQlIrM0ZxSlZhMGJWay90?=
 =?utf-8?B?eTNtMkNpYUpKbldHRUkzeFd2dFYvMTRqbTBwZ2cvS3d5QjNoV2ovOXdHS0ZI?=
 =?utf-8?B?QTNGdkJ1eS8wTHQya1ZTNHFEMnpVTm95ZGI5MUdvRGpNTGFTWWVtMHkwbmFB?=
 =?utf-8?B?N3hWN04yVjE3VmZySGpBczZQSURTMkZTa0MzdytWYUtBNFN2amxtZEFRTlhC?=
 =?utf-8?B?cDUzclQyZm1EOTRuY011UUUyZkduejdpeGQwRHB3b1I1YUlOdldKU2hVRzQv?=
 =?utf-8?B?OCtxeFZXem5TYXJyNUVqOFRVT1RFUHBxNEFHVzhQV3dKRGd6VVJaYmsyTDRa?=
 =?utf-8?B?Szd1WWpiNFErNDIwbWpoa3FqWklSMGZhdDVlT1dqTFNsaW53MXFzV25QVnNa?=
 =?utf-8?B?Nm5hakNKQnhDOVUwaG51dUk1YjhwMjJOTy9ieTY2QW1SNHRNRnV6Zm1QVGRX?=
 =?utf-8?B?MUZ6UTBkWUxSSDNrYklUcXlTREJlWTliRkxIVUYwZUNkV3dnellzZFQ1OEFr?=
 =?utf-8?B?QXhVWkoyOEloZnNyeDZJYUJwUE5oNm54YTVsSzNFbm14cnk3VExTZUhqaUxJ?=
 =?utf-8?B?QUFvbjZHZmlXaDhxTy8zMHc0c2o0ckNyVXN0U1ZwTnhOQ2F3a0dvSFJkQjNV?=
 =?utf-8?B?OGU3dkM0NC9KdE9SeExvRk90MCs0T3R4VGJqd3NhZTdOWW95dHZxUkY0UjBs?=
 =?utf-8?B?RkVnZFpmdHNvdzZOVEdENEpmR1FvVjNlZWdUVmhlVThQR0tlYlNRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0df4e9-8add-4f72-ee39-08dea43d2c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 09:12:57.9363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftX0KzWwGjvBoBjEMalDnOQqdbkBgL/cFmnmcyiSHSmihOQJpJ4AzGikyd3/PTlSZLUfekdObUS8Q1hWVEi65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11023
X-Rspamd-Queue-Id: 8FE4346FB40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35544-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+DQo+
IFNlbnQ6IFN1bmRheSwgQXByaWwgMjYsIDIwMjYgNDozNiBQTQ0KPiBUbzogRy5OLiBaaG91IChP
U1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPjsgTWF1cm8gQ2FydmFsaG8NCj4gQ2hlaGFiIDxt
Y2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6
dG9mDQo+IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25v
citkdEBrZXJuZWwub3JnPjsgRnJhbmsNCj4gTGkgPGZyYW5rLmxpQG54cC5jb20+OyBWbGFkaW1p
ciBaYXBvbHNraXkgPHZ6QG1sZWlhLmNvbT47IEJhcnRvc3oNCj4gR29sYXN6ZXdza2kgPGJyZ2xA
a2VybmVsLm9yZz47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5s
aW51eC5kZXY7DQo+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBHLk4uIFpob3UgPGd1b25p
dS56aG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS80XSBkdC1iaW5kaW5n
czogbWVkaWE6IHRpLGRzOTB1Yjk1MzogQWRkIHN1cHBvcnQgZm9yDQo+IHJlbW90ZSBHUElPIGRh
dGEgc291cmNlDQo+IA0KPiBIaSBHdW9uaXUsDQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+IA0KPiBuIEZyaSwgQXByIDI0LCAyMDI2IGF0IDM6NDDigK9BTSBHdW9uaXUgWmhvdSA8Z3Vv
bml1Lnpob3VAb3NzLm54cC5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBUaGUgRFM5MFVCOTUzIHN1
cHBvcnRzIGZvdXIgcGlucywgR1BJTzAgdGhyb3VnaCBHUElPMy4gV2hlbiBlbmFibGVkIGFzDQo+
ID4gYW4gb3V0cHV0LCBpdCBjYW4gYmUgcHJvZ3JhbWVkIHRvIG91dHB1dCBsb2NhbCBkYXRhIG9y
IHJlbW90ZSBkYXRhDQo+ID4gY29taW5nIGZyb20gdGhlIHJlbW90ZSBjb21wYXRpYmxlIGRlc2Vy
aWFsaXplci4NCj4gPg0KPiA+IEFkZCBHUElPIGZsYWcgaW4gc2Vjb25kIGNlbGwgdG8gc2VsZWN0
IHJlbW90ZSBHUElPIGRhdGEgc291cmNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1
IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ICguLi4pDQo+ID4gLS0tDQo+ID4gQ2hhbmdl
cyBpbiB2NjoNCj4gPiAtIEFkZGVkIEdQSU9fREFUQV9TT1VSQ0VfUkVNT1RFIGZsYWcgdG8gZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmgNCj4gDQo+ICguLi4pDQo+ID4gKy8qDQo+ID4gKyAqIEJpdCAy
NCBpbmRpY2F0ZXMgdGhlIEdQSU8gZGF0YSBzb3VyY2UgaXMgZnJvbSBhIHJlbW90ZSBkZXZpY2Uu
DQo+ID4gKyAqIFRoaXMgaXMgdXNlZCBpbiBzZXJpYWxpemVyL2Rlc2VyaWFsaXplciBzZXR1cHMg
d2hlcmUgdGhlIEdQSU8gcGluDQo+ID4gKyAqIG9uIHRoZSBsb2NhbCBkZXZpY2UgKGUuZy4sIFRJ
IERTOTBVQjk1MyBzZXJpYWxpemVyKSByZWZsZWN0cyB0aGUNCj4gPiArICogc3RhdGUgb2YgYSBH
UElPIG9uIHRoZSByZW1vdGUgZGV2aWNlIChlLmcuLCBUSSBEUzkwVUI5NjAgZGVzZXJpYWxpemVy
KS4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgR1BJT19EQVRBX1NPVVJDRV9SRU1PVEUgICAgICAg
ICAgICAgICAgMHgwMTAwMDAwMA0KPiANCj4gU28gdGhpcyBpcyBhZGRlZCB0byBhbGwgR1BJTyBj
b250cm9sbGVycyBldmVyIGluIGV4aXN0YW5jZSBhcyBzb21ldGhpbmcNCj4gZnVuZGFtZW50YWwg
YWJvdXQgR1BJTyB0aGF0IG1heSBuZWVkIGl0cyBvd24gZmxhZy4NCg0KWW91J3JlIGFic29sdXRl
bHkgcmlnaHQgdGhhdCBhZGRpbmcgdGhpcyB0byB0aGUgZ2xvYmFsIEdQSU8gZmxhZ3MgaXMgdG9v
DQpicm9hZCBmb3Igd2hhdCBpcyBlc3NlbnRpYWxseSBhIGRldmljZS1zcGVjaWZpYyByZXF1aXJl
bWVudC4NCg0KPiANCj4gSSBkb3VidCB0aGlzLg0KPiANCj4gSSB1bmRlcnN0YW5kIHRoYXQgdGhl
IGRyaXZlciBuZWVkcyB0byBkZWFsIHdpdGggdGhpcyBpbiBhIHBlci1ncGlvLWxpbmUgYmFzaXMN
Cj4gdGhvdWdoLCBoYXZlIHlvdSBjb25zaWRlcmVkOg0KPiANCj4gMS4gSnVzdCBoYXJkLWNvZGlu
ZyB0aGlzIGludG8gdGhlIGRyaXZlciBiYXNlZCBvbiB0aGUgLmNvbXBhdGlibGUNCj4gICBzdHJp
bmcsIGlmIHRoZSByZW1vdGUgR1BJT3MgYXJlIGFsd2F5cyB0aGUgc2FtZSBmb3IgdGhpcyBUSSB0
aGluZz8NCj4gDQo+IDIuIElmIGl0IGlzIGp1c3QgZm9yIG9uZSBwYXJ0aWN1bGFyIHN5c3RlbSwg
eW91ICpjb3VsZCogYWN0dWFsbHkgaGF2ZQ0KPiAgIGEgdGFibGUvbWFzayBpbnNpZGUgdGhlIGRy
aXZlciBmb3IgdGhpczoNCj4gICBpZiAob2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJteS1mdW5r
eS1zeXN0ZW0iKSkgd2hpY2ggd2lsbA0KPiAgIGtpY2sgaW4gb25seSBvbiB0aGF0IHZlcnkgbWFj
aGluZSwNCj4gDQo+IDMuIElmIHlvdSByZWFsbHkgd2FudCB0byBzdG9yZSB0aGUgaW5mb3JtYXRp
b24gaW4gdGhlIG1lZGlhIGkyYw0KPiAgIGRldmljZSBub2RlLCBhZGQgc29tZSBjdXN0b20gcHJv
cGVydHkgbGlrZSB0aGlzOg0KPiAgIHRpLHJlbW90ZS1zb3VyY2VzID0gPDB4MDAwMDAwMWY+Ow0K
PiAgIHdoZXJlIGEgYml0IGlzIHNldCB0byAxIGZvciBlYWNoIEdQSU8gd2hpY2ggaXMgcmVtb3Rl
Lg0KPiANCj4gUHV0dGluZyBmbGFncyBvbiB0aGUgR1BJTyBsaW5lcyB0aGVtc2VsdmVzIHNlZW1z
IHRvbyBjb21wbGV4IGFuZCBzeXN0ZW0tDQo+IHNwZWNpZmljLg0KDQpUaGFuayB5b3UgZm9yIHRo
ZSBkZXRhaWxlZCBmZWVkYmFjay4NCg0KQWZ0ZXIgY29uc2lkZXJpbmcgeW91ciBzdWdnZXN0aW9u
cywgSSB0aGluayBvcHRpb24gMyAoY3VzdG9tIGRldmljZSBwcm9wZXJ0eSkNCmlzIHRoZSBtb3N0
IGFwcHJvcHJpYXRlIGFwcHJvYWNoIGZvciB0aGlzIGNhc2UuDQoNCkhvd2V2ZXIsIEkgaW5pdGlh
bGx5IGltcGxlbWVudGVkIHRoaXMgdXNpbmcgYSBjdXN0b20gZGV2aWNlIHByb3BlcnR5DQoodGks
Z3Bpby1kYXRhKSBpbiB2MSBbMV0sIGFuZCBWbGFkaW1pciByZWplY3RlZCB0aGF0IGFwcHJvYWNo
Lg0KDQpJbiB2MiwgSSBleHRlbmRlZCB0aGUgR1BJTyBjZWxsIHRvIHVzZSBhIHRoaXJkIGNlbGwg
dG8gbWFyayByZW1vdGUgZGF0YSwNCmJ1dCB1bmZvcnR1bmF0ZWx5LCB0aGlzIGJyb2tlIHRoZSBB
QkkuIFJvYiBzdWdnZXN0ZWQgdXNpbmcgYSBmbGFnIGluIHRoZQ0Kc2Vjb25kIGNlbGwgb3IgZXh0
ZW5kaW5nIHRoZSBHUElPIHJhbmdlIHRvIHJlcHJlc2VudCByZW1vdGUgZGF0YSBbMl0uDQoNCkkg
YWRvcHRlZCB0aGUgZXh0ZW5kZWQgR1BJTyByYW5nZSBhcHByb2FjaCBpbiB2MywgYnV0IGluIHY1
LCBUb21pDQpzdWdnZXN0ZWQgdXNpbmcgYSBjdXN0b20gR1BJTyBmbGFnIGluc3RlYWQgWzNdLg0K
DQpJIGF0dGVtcHRlZCB0byBpbXBsZW1lbnQgdGhpcywgYnV0IGNvdWxkbid0IGZpbmQgZ3VpZGFu
Y2Ugb24gaG93IHRvIGFkZA0KY3VzdG9tIEdQSU8gZmxhZ3MsIHNvIEkgYWRkZWQgaXQgdG8gaW5j
bHVkZS9kdC1iaW5kaW5ncy9ncGlvL2dwaW8uaCBhbmQNCmNob29zZSBiaXQgMjQsIHNlZSB0aGUg
cmVhc29ucyBpbiBbNF0uDQoNCkdpdmVuIHRoaXMgaGlzdG9yeSwgd2hhdCB3b3VsZCBiZSB0aGUg
YWNjZXB0YWJsZSBzb2x1dGlvbj8gQ291bGQgdGhlDQptYWludGFpbmVycyBhbGlnbiBvbiB0aGUg
cHJlZmVycmVkIGFwcHJvYWNoLiBJJ20gaGFwcHkgdG8gaW1wbGVtZW50DQp3aGljaGV2ZXIgc29s
dXRpb24gaXMgYWNjZXB0YWJsZSwgYnV0IEkgbmVlZCBjbGVhciBkaXJlY3Rpb24gdG8gYXZvaWQg
Z29pbmcNCmluIGNpcmNsZXMuDQoNClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2U1
MjZlOTNlLTEzNzMtNGYxZS04MmFiLTZiMjJkNjgyMTFjZEBtbGVpYS5jb20vDQpbMl06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDkxNTAxNTMwOS5HQTIzMjk1MDctcm9iaEBrZXJu
ZWwub3JnLw0KWzNdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZDYzYmZmNWEtMWEzNy00
MTYyLThiNzUtYmY2Mjc4N2EwNzgyQGlkZWFzb25ib2FyZC5jb20vDQpbNF06IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9BUzhQUjA0TUI5MDgwQ0VCMDAwRjRGMUM5MDQzRThDMjFGQTM2MkBB
UzhQUjA0TUI5MDgwLmV1cnByZDA0LnByb2Qub3V0bG9vay5jb20vI3QNCj4gDQo+IFlvdXJzLA0K
PiBMaW51cyBXYWxsZWlqDQo=

