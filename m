Return-Path: <linux-gpio+bounces-16359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD2A3F292
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 11:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850611898F6F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 10:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FD1207A2E;
	Fri, 21 Feb 2025 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="INIsUlvQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BC206F2C
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135256; cv=fail; b=mI/rGYJ+Ar22RLlN4gLQSImESBjakncfJqoQDctgZjV99XutRCEeE1GqeKxoKEEoTHePbUE8CusUUY2qDuMHepiR1O6wbRpvP+UwxD53xX1b7sueJIeFODCAWfUVF4JRUiAaRyg7VBTyGL7ihZT0aAhEGgAZkW+gX2/IjV+FjdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135256; c=relaxed/simple;
	bh=7biW59TPq5ez093lTeqijiZBIxa+V+MmfeWu4WIzufE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cqbWJBVOB+3qUq0GiJX8vKZFz7uI/oeo0Bwmjnvoi+TMPAWVL4fuz8r9Q7jM8G4sapCy/MAim/5z/Ry/PKsLQ6E40e9lNkHjc6F5FZV4fn9PlXo7FsLzsYDFRZa86pDQpaSfgG5qAoZeF7iCBzL2OjsXhi69ycM7W1q6w4ozduw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=INIsUlvQ; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMdjNyKAag22tCy8IXDsuU/3ZNV2nmAGpN3hF8imzhzNlibAq1zQybWj6vev/evvy1CvhaH9BP1QB+e10kRQAsJi+yAX9SJFf7sc1YJRnl3nYKdtg68Ujp/11NR35h8yMrZUXI7G+HKVobCfybGi+RzJnaqpcBOX1DjPTGaAmSTQh3bLBs9crLNVyiUhk0vSBHnVGDo1eraWFsthh4yVEmjpDzRaTy1UWPfA7NoMrDYS8WITeQylzwhsCODLLliSqSvPr4Hld8qebGiOVMWi5fawiuciagoHtiC+9kyEmwLzYgeRRyv0IJS55gjVjFP+faBXQ6ghZ1QamdUHlIMeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7biW59TPq5ez093lTeqijiZBIxa+V+MmfeWu4WIzufE=;
 b=B7uQM8bwSvpcZlLtGdJisaYqw8rB6OUP7HJ8K6245WbDUBS7SifoZATAKLJz47KEByvkjCZ4F2pPY7F6ymmXuLAtBDP5dPdHJR/pEMV32nRengMAguZzJV3hq5kqdIdeTd9Wn3mUdQNWbv4c01J+zBVZY9bPZnYK7OfVwCWBacVbcZZyk/4iZU2GjJaDzq/CiRPRODSxAb6OZqeRCLqzhtU+RSH2xLmHIIBMv2DU8Ffsqfa8TRkPtXnL2oHLsGCY8ri1zfP1ikpKFIlDyHLq5G1l5NjuwhB5aaSaq8XMhHsrJLlFL6zXYWjGGTyODQIZPHvCKiCSzP2R0W2IrUTAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7biW59TPq5ez093lTeqijiZBIxa+V+MmfeWu4WIzufE=;
 b=INIsUlvQpZeDaziMaUf7j3aJfx/kr+2hpfwd2TU4o6RWXHQQUP2N054ZTJ3DgDwK6q6lArCMG2k0Iws3QhCo+PwNZ5Ly8ooe/8fSUp86BbTDaK2AIIwz2rM6mp89zy8DYIepF3unTDzoRPY9v/f7bUORRUmIWOOR0yLAbYDv/lPPVkFgnafSZTSEcWd1lbEDictaUDFKl1hy/ONqgMTNqKT2LrI3gFq7Kxd/Nk3bCTCxDC2a7JtZpicQPI4cliy1n045AvLWALgj1TpKsHDkGcke5uw5KPwGqOY6CGFRYT8Vpknb49mY9sgg1MXehzoEDo02f6UcAgS/a/7YhQ5fbw==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 10:54:11 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 10:54:11 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>, Johan Korsnes
	<johan.korsnes@remarkable.no>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Thread-Topic: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
Thread-Index: AQHbgxHlamlDOGy+hkS3+3B5R316U7NRIYCggABrvYCAAAnNcA==
Date: Fri, 21 Feb 2025 10:54:11 +0000
Message-ID:
 <DU0PR04MB949643A017CE1E1C9EFA9B6490C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
 <DU0PR04MB949620686274212D9E6F074190C72@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CAMRc=MeGUGssqNhUCeprEXUf57pmeyw_zc8wtZG3iLqXrxQ_7g@mail.gmail.com>
In-Reply-To:
 <CAMRc=MeGUGssqNhUCeprEXUf57pmeyw_zc8wtZG3iLqXrxQ_7g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AM8PR04MB7249:EE_
x-ms-office365-filtering-correlation-id: b950bc03-b1ea-4af3-20d6-08dd526612f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkhwcEdDZTY1eEhTZVVMWU9jQzJxMFJHVGNkT21GbjlJNDczdmErMjFIYWl0?=
 =?utf-8?B?UmZ3Q1M1RUFoaXU3TnpvMXZVUHMzeWphK0FCQm5LdFZmOHh6V2NGQzVQei9o?=
 =?utf-8?B?Y3RKM29Ea3NPRFNPSjRNaGVjR1EybVA2YUxPamkzblNkYittaDhaM3Q3MTlS?=
 =?utf-8?B?VnlOSkk0L0JEZ0p4aW9DSTVBTjh1V3BFclVMZE12WGVuK2pVNFF1NDFFNXFI?=
 =?utf-8?B?R3N5L2NuL1k0RkkvZ0YxcmRmY0JtNEN1aTZ5MmZFK0h1bklJaEtqczI3YjY4?=
 =?utf-8?B?REpJcXNGSFRJbWZ6WmRuTGxFbXI3TmlxZHl4cEpqT0hWTndRWDUrUTJvbGZS?=
 =?utf-8?B?aGhxUG9COEt0cWZ0a1AzRm8vd0VNQ3NpbDhyY0tkQzQ5eS9pU2tFRkVLR2dC?=
 =?utf-8?B?eDQ0WGZPRHdSeXVtWnZtemIyT0tyOGEyWTQ5TlEvVjNOajhKeE9wMDl2RmlN?=
 =?utf-8?B?dC9nRXpyM0tGWmROcFd5RUxxejNXb05RTUNUSG1kWU1oN0s3MVNwT1VXVUQ5?=
 =?utf-8?B?OXJjR1huK3k3cFlqc0F5R2ZUSE9yenpWQ0k0Q3Z6ci9CRTc1YXUySEtmcmdY?=
 =?utf-8?B?eVJOZkxURHZHZ0VrNTZ3dGsyVkxYVk1ESXhPL0lka1ZKZk9LRmRmQ1VxNDdQ?=
 =?utf-8?B?S29YNUtmVjVuWEpvMFlMbUZvdktXeWZkK3lMd1FSU21BUzFuVGd0aitTa3BY?=
 =?utf-8?B?cnlMazdoays3Z09mdm1PZXdqMHJhY0xDNnFGdVJ6cVBkTFM2U2ZUWFJJYnlD?=
 =?utf-8?B?QTlSTkRpQmxMTk15cDlkS3JIM0JIYTR0QVZwdHJSR0ZRQ0UrRFpIaDB6RnFN?=
 =?utf-8?B?bXZnTnNlMjR2aktRblVXeWRXdFNPQ24rbGZmemRPblJhaksrS1g2SG12RkVR?=
 =?utf-8?B?M1dFUXlFdzg3WElSaTV2VFRGYStNTm1wSXZEWUdSYkhaR05BN3VWNjI4aUVK?=
 =?utf-8?B?bW5mRFpOL2dRaGpjZ2pMNHpmbzlQRFB3aGl3N2Y2NmlxcmVIOUl3VDB5NHBI?=
 =?utf-8?B?MzhWZUh6ZTR6N2ZhendacEs3aHdqSWRFcks2VTdMdFRUU0NWUUkvOFBaaXlO?=
 =?utf-8?B?bUlzcmhrYUFiWEsrQmMrWjdkdmw3eXdZS0U1cklRR3pwT1BscHJWWTltRnVO?=
 =?utf-8?B?NE1RZHA2cHU2WXFpNnVRVm9rZTIzN2tMaTNJdGJZODBLZ3lxMXE2cUM3QjJt?=
 =?utf-8?B?SC94SUFwMGEyK3ZDOWRHZ1Y2Tm1EeFpsTFZiSlY4OCt1OUJjdzk5Q2tseS9o?=
 =?utf-8?B?NEdtczBJVkN3QnV2bThVakNoSEpLdlpBREt4bVhGaE5zcWt4MkozVXBhZWJB?=
 =?utf-8?B?NTNJTzdxbmxOUjhXdm93NFpiVExwN3FRK204NXBhNFdMTDgzVnR2dktBOXda?=
 =?utf-8?B?d05NOWdORS9UelFHalF3UVMySUN4WGZaQmdUUmVoTXlveGw2enFVYzZrMVZa?=
 =?utf-8?B?WW9wcUdPcUVRbVZLdFZmZWhaRFcrUjdtaDFFVHMxUnIxYUdzczdCeWYzVFls?=
 =?utf-8?B?R241QmcwZUs5VXNGMDUrdStlMlVjcHNPYWVxYktMalBMYkt0KzJCRlVhMTVq?=
 =?utf-8?B?TEdRQ0VqL1lGSDc4ZVhNSS9sdlpDZm14cUo3azZHYVN5VzllTUxEazdGZ25V?=
 =?utf-8?B?NUNLbFkwbEltN3MxMzdNZDhXaVUwMHppNXZWTlA0MWFza25BenJHck0wT0JI?=
 =?utf-8?B?b3AvT3NncHQ5SFRxVDlzTDcrQ2gzWGhGOFp1MHMrUkM0clpBeEhWYzZEUEw3?=
 =?utf-8?B?ektFNWxFV0cwM2Nwd3RKZDlFVW1RUFRtVkg4VzJDclNETFJTTnVlbGxpUUlk?=
 =?utf-8?B?ZE1RTEM1WXYvV2V2MlBMSDJiVTdieWdreHJ6NWRHZVF2dXJNNXdaRzB6cm5o?=
 =?utf-8?B?eTdlR2hGRCtMTjJFdGhCMUpuUU5wT2drUkdERjh1emFGTk9DUTh6Q3gxa2Qz?=
 =?utf-8?Q?q7Thy26SZWTPnUTRGTNmhWEIm2/KiRRq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RG1MM3FRNGhZamExS0Vpc0kyTlg0V0NEYUZaYWdoQmJseU43ejI3cjFYQXo3?=
 =?utf-8?B?Z1NkVXJzTkluVkFVRDQ5RzVaWXhOOVFYZGxWUDJzQkRDTnJmMDBDN0dYeFli?=
 =?utf-8?B?WUp3VUlXWXFxV1BwTHZ4eUhVVnI3U25sZWxRR1Mvd2ZTUmw5R1R5RHg4RUZG?=
 =?utf-8?B?MkxFbFJoay85eDJBdkp0aFFaaDdqeXNOMW42Sm9mOVZDUkk2RzBaNzhNVmZL?=
 =?utf-8?B?dHl2a3pYNFVlVlorSzNTUW0wWkdaa25WWm13QVE0MkpVM3JocTgvZWFiVHhD?=
 =?utf-8?B?ak52QkYyTVgyRk4zeHhsZS9mK3prK0s0ZnVaMzhxUmZPbkd1ZDFnUGZjaFhY?=
 =?utf-8?B?K0JnWTZTeC9NblJBdG5HSzRpZU5PQXRlMEZEWWJMai9YOUpKUmNPUUFMQTlk?=
 =?utf-8?B?bmhkNnJPeHdJaXNJVU9TYW5QUGtCeEczLzRRN3FVNTFpWWlObHE1TjE0TmQr?=
 =?utf-8?B?OTdZM2lqUlMrSXcrOE5uVkx4QVpnSlBxdjB3YmczSHJ0NThxQXdoenVIdTZB?=
 =?utf-8?B?cG4vOHBneHJveC9BaDh3NXVGeEowR0JrSGFHOGZHQ3QwaFhNM0Y4dG52bklQ?=
 =?utf-8?B?NlBGY05jSEl4Y1lJb1BOM2R6YVZ4czV1YmREU0hUT1dwVERid0VXMzBmM0Z1?=
 =?utf-8?B?RmV4SG5kWG1JYmZCOE1kWGh2SVYwV29KNDdHNnhXODFDRC8yaTRmWWxiYmJh?=
 =?utf-8?B?V0FzT0JGQ0M2QXZmQklxdDhZc2FRMVZwMCtXdnhaQytrdTRuSkV2c3B6VkZm?=
 =?utf-8?B?SGgyc2FXeXlMN0xsSFdObHV5WHk2aTFvc21MMVRtODVYa2dQUHZTMGZCdzRQ?=
 =?utf-8?B?SnRPN2FOS1FEekdncXB1ekpJSUNaQmNZMk9Qd2NmNG10N0pIWFFLL3RwNHlZ?=
 =?utf-8?B?Tk1xZk81ZWh5NHFEdHhzZjNvUjgvVnE1Wm5jTURMSGEvOTh2YjFKZ3NWclU2?=
 =?utf-8?B?YzhzWUxMRHg3OFQ5cE5JR1NqVS85dWQ1N1F6SnR1SkhoQTdPeE1SLzM4TnVY?=
 =?utf-8?B?UGtUWTN1ZlBYMWd3VkpiQXNONS8yU1pJeHVwNmkvSlZnNFFOa3B2ZVk4L0ZH?=
 =?utf-8?B?eEdhOGJhKzBlREgvc1JXd0pBVmxubVdaK2g2UHpZT29TMHdzeVpSREZpcFVY?=
 =?utf-8?B?Z3l0eFl4czhEYWRyeTZ6aEhqNEpVN0pXZ29ySG4yMG1KaW9CUUVRSkZLVnpS?=
 =?utf-8?B?RzNiSmdNdGQ1L0QvbzFXUS9FZjk4c3BoUTBKREdTYTJVMGRXdms2cnVVS1JL?=
 =?utf-8?B?ZXRRNnN2elUxazVpOGxqbkNyWmFaY1ppQXkycFk1RGZJcWF1Vk13SU5VMVlT?=
 =?utf-8?B?bVRBdXFxL20ycGlHYlZHOXhJbE5CN3lzaTczVnljRFM4NktjNzE1NnI1czJE?=
 =?utf-8?B?cTNVTlhXaVJhYlMybGZqNFFSTUFMQzF6aFZyanJidHlBU3hLR2ZBNHFQbUZR?=
 =?utf-8?B?UTlvZ1FWbk5vYUVyRlBkdUdROW83d1hrRSswUVhJb0ZUbEI2a3V0NVJaYmdw?=
 =?utf-8?B?Vmd6UVhFZk41dEMwTFdQcVRyS3pnU2hCdzc0RTdEUEh2ODkxWlFZb1RVZ2NN?=
 =?utf-8?B?Rm5CTkVpbjh3TXN6MkoxcWROTGR5a1QxRDlKaFdCcGJnOGgxdk5hTWQwY2VL?=
 =?utf-8?B?QjlRaW1mUTJWWTJqVjdGS09Eb0xwMkY2cWlxQW4yYTRRQmRXR3JzTUVlUFoz?=
 =?utf-8?B?S0NKajQzZ2x6MkJOSmlWWFVJandsZlFBbXFQaHZZWWppU3FYbHhsWWhkR0Fo?=
 =?utf-8?B?LzJRMTk1Q3VUOHcwRzZkL3dBRjU3TGhqZkpuMm94MUxOQ0JTYjBZVElsVnR5?=
 =?utf-8?B?ZHJtQWFIalBoQzBTVHFFdUhLTTgxdHJDTmhJTzFjVnFQL3hySXIzU3FSMjc4?=
 =?utf-8?B?TnRpbm4xazhpSitrRGxwUmd3OWk0MmpIbVdyWFg1UTE2MTJPQmxQTlZtT3ly?=
 =?utf-8?B?L01TMnJBMmlqeDhOU1RuVTNYMXFyQm5XQ3ppekRpOThUUTUxaGlSdlhNamVP?=
 =?utf-8?B?cTBFQ0s5c1FhcW5uam9yKzlyRi9kRS9qTEZBOGUzQmhraHJSaDlXQ2pDY2t6?=
 =?utf-8?B?dE1pT29HeDJzam4rUkhaS1hMa3pUSVRveHh0TjgwRWIxS3lETk1BYmd1bkpR?=
 =?utf-8?Q?fwZA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b950bc03-b1ea-4af3-20d6-08dd526612f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 10:54:11.3884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRrSBik0lovbu3/HeQrB0VfUt3XALjwS/657un7QNnfipVInssuE1mTtRtj6fev+H6+WTCknm+Y6JXkGaJ2ZzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiAyMDI15bm0MuaciDIx5pelIDE4OjE3DQo+IFRvOiBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+OyBKb2hhbiBLb3JzbmVzDQo+IDxqb2hhbi5rb3JzbmVzQHJl
bWFya2FibGUubm8+OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1ncGlvQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gZ3BpbzogdmY2MTA6IFN3aXRj
aCB0byBncGlvLW1taW8NCj4gDQo+IE9uIEZyaSwgRmViIDIxLCAyMDI1IGF0IDQ6NTjigK9BTSBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPg0KPiA+ID4gU2VudDogMjAyNeW5tDLmnIgyMOaXpSA1OjA1DQo+ID4g
PiBUbzogSm9oYW4gS29yc25lcyA8am9oYW4ua29yc25lc0ByZW1hcmthYmxlLm5vPjsgQm91Z2gg
Q2hlbg0KPiA+ID4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+Ow0KPiA+ID4gaW14QGxpc3RzLmxpbnV4LmRldg0KPiA+ID4gQ2M6IGxpbnV4
LWdwaW9Admdlci5rZXJuZWwub3JnOyBMaW51cyBXYWxsZWlqDQo+ID4gPiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHYzIDIvMl0gZ3BpbzogdmY2MTA6
IFN3aXRjaCB0byBncGlvLW1taW8NCj4gPiA+DQo+ID4gPiBBZnRlciBhZGRpbmcgYSBwaW5jdHJs
IGZsYWcgdG8gZ3Bpby1tbWlvIHdlIGNhbiB1c2UgaXQgZm9yIGRyaXZpbmcgZ3Bpby12ZjYxMC4N
Cj4gPiA+DQo+ID4gPiBUaGUgZXhpc3RpbmcgY29kZSBoYXMgdGhlIHNhbWUgc2VtYW50aWNzIGFu
ZCB0aGUgZ2VuZXJpYyBncGlvLW1taW8sDQo+ID4gPiBpbmNsdWRpbmcgcmVhZGluZyBmcm9tIHRo
ZSBkYXRhIG91dCByZWdpc3RlciB3aGVuIHRoZSBkaXJlY3Rpb24gaXMNCj4gPiA+IHNldCB0byBp
bnB1dCwgYW5kIGl0IGNhbiBhbHNvIGhhbmRsZSB0aGUgYWJzZW5jZSBvZiB0aGUgZGlyZWN0aW9u
IHJlZ2lzdGVyDQo+IGJldHRlciB0aGFuIHRoZSBjdXJyZW50IGRyaXZlcjoNCj4gPiA+IHdlIGdl
dCB0aGUgZGlyZWN0aW9uIGZyb20gdGhlIHNoYWRvdyBkaXJlY3Rpb24gcmVnaXN0ZXJzIGluIGdw
aW8tbW1pbw0KPiBpbnN0ZWFkLg0KPiA+ID4NCj4gPiA+IFNpbmNlIGdwaW8tbW1pbyBoYXMgYW4g
aW50ZXJuYWwgc3BpbmxvY2sgd2UgY2FuIGRyb3AgdGhlDQo+ID4gPiBkaXJlY3Rpb24tcHJvdGVj
dGluZyBzcGlubG9jayBmcm9tIHRoZSBkcml2ZXIuDQo+ID4gPg0KPiA+DQo+ID4gSSB0ZXN0IG9u
IGlteDh1bHAtZXZrIGFuZCBpbXg5NDMtZXZrIGJvYXJkLCBncGlvIHdvcmtzIGZpbmUuIEdQSU8g
aW50ZXJydXB0DQo+IGFsc28gd29ya3Mgd2VsbC4NCj4gPg0KPiA+IFJldmlld2VkLWFuZC10ZXN0
ZWQtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiANCj4gUGxlYXNl
IGRvbid0IGRvIHRoaXMsIGI0IGRvZXNuJ3QgcGljayB1cCB0aGluZ3MgbGlrZSB0aGF0LiBMZWF2
ZSBzZXBhcmF0ZSB0YWdzIGZvcg0KPiByZXZpZXdzIGFuZCB0ZXN0cy4NCg0KT2theSwgZ2V0IGl0
LiBQbGVhc2UgdXNlIHRoZXNlIHRhZ3MsIEkgd2lsbCBmb2xsb3cgdGhpcyBydWxlIG5leHQgdGlt
ZS4NCg0KRm9yIHRoaXMgcGF0Y2ggc2V0Og0KDQpSZXZpZXdlZC1ieTogSGFpYm8gQ2hlbiA8aGFp
Ym8uY2hlbkBueHAuY29tPg0KVGVzdGVkLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5j
b20+DQoNCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0KPiANCj4gQmFydA0K

