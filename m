Return-Path: <linux-gpio+bounces-15642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E7FA2E7E9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8FA1161D85
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3A51B6D15;
	Mon, 10 Feb 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GMVlIxpk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2078.outbound.protection.outlook.com [40.107.247.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D51C3C0A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180140; cv=fail; b=X+4EiMKEyW+zOz/hxTfjvmNr+LWUYDHyHcc2oEiV+ToockNuHBD/+8FtBXO3oNwVA8J2CFjCXPqUBCZur6TvWJDv4abGXL5ZdPkd2t056sTJWYQ7fr8fpG3q3D2nOn05jY//H+MvZxJ/CFwdCNLIZIoQRKId5yN1VCUo5nc7F/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180140; c=relaxed/simple;
	bh=GHISYoeIkN5sLsT23i6ENxODBAVIWJbOIclZC3aM304=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LCF56tZuEb9I8n6vNslBA+jqCA0H0QIcj06wpy/gf4NLX3GVJVMcsBpgOusG7rIriEnugN9yLDhQhkZqRhf/6Ivgejn12y+ac/kHFtc4QlKfAvO8bfz+7KDpvHkaBuMG685SxFEARgQRPQUI4V3Nclaq6m4hrT04ME+36V/F2wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GMVlIxpk; arc=fail smtp.client-ip=40.107.247.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWAQfPlUfckgkBBFqveD3oRGG1MVsyAV2vegAgXDZijpMhcj9afa/WtyA4JmJzvjFpY+Hu6WeZZr9F1yYFt3nMrdcFvhCgms0YQmC5ZePsE9O/pnW7wKKi6hLNmGa5+DRZfsvJHkFZlLO7SROnuhSFWva47WjGuKJwViM3f2YxYcyGDCqhMPpNIHwQ8cgrqGcSeCVaOto/Bo7lF98aJi6NLsN7R7bq1RdNufG1JUTCe9Vih+oFTqftmN4igMf4Iq7N1kCMHjoCms+ufRcwNgtPik0cf8BSTwNmqhdqdz21x4zq7zeGGUvnYWT44GllLDqRBAFWTMyYF1upeZRzD7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHISYoeIkN5sLsT23i6ENxODBAVIWJbOIclZC3aM304=;
 b=mZrf+aYo89vsd2sQ3+Wza2Ur9t51MwezctFB7sg9HYyOb3d+LClkXj6w0zC3wtvVZcVrlvjklDQMci1u7RkWHmmelsrEi8Bcxk3ItGxIIY6dnE5+h8BguuPFM+DnZJrRFqTVAYspUdwsJfCac1rapGqH2+pkVOXTELVPiF2HhKtzhA9mJgdkFR6C9DDei9RqI/TJeiP10xooYzkAbpF0spO7RFjBGjuFdwvxkWrkoV+OFFy8E7OW3U80hveYGphT42GUtfgpobri/MK3Lk54oGitfAVCott2M4/FyTeG1UwVZYZMMecK1MDCWJmdo4utZLqI4E2HxM7j7TSKC9ogdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHISYoeIkN5sLsT23i6ENxODBAVIWJbOIclZC3aM304=;
 b=GMVlIxpkpqRjg/xdmaWAVvAsoED9ETS5/iMbtrELm1z6l0haftI7OqiOWndsamoIYJ8nqUx0D4XsIXkYoVFR/oHGaafA1bV52h8C5LJvYdaAmwv3wZdimDHtOonEpx10X4gglQtopNsaFn2ZTQ8l0LKXM+X5SeJQSO40vaiRYiaCbTXvX31fvbXDc9VQEGoUhGkAT4Loy4MbM8C72K8QLQHDkj28uV3P51WAsGADIllUS3S+fcXvwxB9C/u7sflWkzKpuvz+tMmuUib3uk7ZfMIjASYzhqdZEwbn7F/IBpKt+h2bf3Ers0SUq+uv40+t3nwIrfmNzfoGzljC7BN7cA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 09:35:35 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 09:35:34 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Johan Korsnes <johan.korsnes@remarkable.no>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Topic: [PATCH] gpio: vf610: add locking to gpio direction functions
Thread-Index: AQHbeMNtV5WxXSj9skyddrTaKpnL5rM6mI4AgADC/gCABOU9gIAABMiQ
Date: Mon, 10 Feb 2025 09:35:34 +0000
Message-ID:
 <DU0PR04MB94964AA34ADC1564E685E13590F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
In-Reply-To: <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AM9PR04MB8619:EE_
x-ms-office365-filtering-correlation-id: 02279b06-878f-432b-8e9a-08dd49b644fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXB2c0RvR1BOay9WZVpCOWNMT3lGN2l1UzlDRERwQW9ESk04eHJ1YkNRVjFJ?=
 =?utf-8?B?Y29JbmZXQ2ppRDZTSHRJV2pYU09lWWhPaUlZMHJWalR6cEtjSm5HZy9KNDBu?=
 =?utf-8?B?b1ZDaGcvSjRKSkVEUWNFdTBWMjU5eTJUZjdrcUVNN3lwNTZ0cWdzNG1kWU9Z?=
 =?utf-8?B?ZERNYkNFdW1GU05RV0pQSjJsVDRnVlFXdjNXUlBSNkI5UzJxSjI4dzBvdURz?=
 =?utf-8?B?eE5KeThMZm1JdmxFakRORTRxdHY0KzFYUDZMMHRhUm43VFFKc2o4NkpHRDJZ?=
 =?utf-8?B?cFBMUjNucExyN2IyUDZSMjNOcDNJVG1TbW85WCt3aTdyT2FsYjhtZ1VJWG91?=
 =?utf-8?B?VnFJTkpwTlBleUFDL2NMemxOZXhvNnNZWDd4ZzNET1NmTXo0UnVhdFdpcngr?=
 =?utf-8?B?RkJhcW9lMFR0azRmNWRaeDBrNlhiY1kyZ3pFL1A3aS9IWHBxckp3TlBBS2NS?=
 =?utf-8?B?c3hUQlh6YUk4Z2dxcVQ4VGcvdTNLNDMrRlFmUG5WU2R5NERDNlRQd3dNbVI4?=
 =?utf-8?B?cXk5b1Ywd1N2NC92S3lOT3RlcGVtQm9sbkwwNmhNeFIxaEJBY2FwWUZ1WTFS?=
 =?utf-8?B?bXVYYUhJNE1OOFdQMklwT1preUJJa0oycUJpNzBSQmlBeDFnMzh1Q0tWS2V6?=
 =?utf-8?B?Zk1DNTlyZGdud3dPTjc2a3lhMVNua0I1QUlmb05LZnNwTk1pOTJsK1hxUlEz?=
 =?utf-8?B?aFVCTlJ0ekFVL2xkZkVDRkRSODEweStVQzFnUTRUSVBSR21rL05ZcSt4Q3hY?=
 =?utf-8?B?UndPbnk4azdDN3U2Q3lzdjFmdzlpZU9zLzVLR2tWWkdDbElINFViOE9DZ1Js?=
 =?utf-8?B?QTh6eHBEaUpXMFlQRGFtZXl4ZjErdURNT2lvYWtTc1dJTXdzNkFNajBpcC9V?=
 =?utf-8?B?WHgvd1ZrN0V4UUZ6MVBONnErOHBCVXN5ekU2cTQwblZoUmdPWG5lSUdNcHdK?=
 =?utf-8?B?aEtxRWxwYjZqQmFzMkNZTnFWd1I2UTdNREVaZSttSEd4MnYxbTlvMzVmSmNF?=
 =?utf-8?B?ektRd2hlT1o2dTZYTWN2VGdkZzU5WXhnOExnRzhLdkZnR3orVHBhVUxDeHEy?=
 =?utf-8?B?QUc2My9kZFhWNGRUMzU5M0FMNWJzVkZwcGExQUUraThnZTl6R0k3ZE13Zyt5?=
 =?utf-8?B?VHRwOHVVUHlpU0N2SVZxc044K3VDSGlNSzM1ZzJMbGV5MVk0YzdyWXIzR0I1?=
 =?utf-8?B?YjFmL1dSbWhvSmlEbXB0dmd5Y3hYVnBvaGVnMUw2SUlQVmJJOXBTZlY5bzlP?=
 =?utf-8?B?Qi82VzV6NWJaUFFDVnRrVEphMTA0Qm5pajA3ajBZK09OTUpzNjR3elNNN1o2?=
 =?utf-8?B?aXlmL0pSV2oyekpFSGo0VmlELy9xdDRUYkt6QTRya1IxS0lBZ0xQclF3bE8r?=
 =?utf-8?B?QmJvbUNVSjBiTXVSSE5ibnNkNWtoeEVkWHM1akdWS2hLTmZWVVFJemRPd0FH?=
 =?utf-8?B?b1lTQlZaaFhhQVNTR3hsZGc3Uno3bFkweEozNGl5MVVwQUxlK1BnQjhzbysy?=
 =?utf-8?B?K3RkKzg5dXJ6aStyRnNUM2hGSlljaTdNd1ppdHdyQjVvTXdPa0QzdElOY2gx?=
 =?utf-8?B?ZFlYcjVNcEt1OU4xQ3d4bnNPUUZaWEM3TFFncSt0TjlDczRWMytvN0J5Q1Zk?=
 =?utf-8?B?ZXVUaEFpQ1BZQ3NIMVNHeWNtTnhYMWczSGZQQUJTOUh6Z3JRcjZNVFpEVnBa?=
 =?utf-8?B?MnpXNkYwRjk5RVBWdDFCMERibzhub2VVUGdmeVNRT1RodXVUUndtMmpHcnpC?=
 =?utf-8?B?eUVuMjgyYmFHS0h6QWc5ZVZSNnR0d3o5aXJ3SmE1b0xuZUxOL3RRYXJmM0V4?=
 =?utf-8?B?a2wvbi9TeUNaSGp0TDhXK0YvZUF2a1Q3cWpraHdGS1JyaVNWenp3U010NHd0?=
 =?utf-8?B?VE9pNmkrdGg3WlZ2NGlQcG5HT0pUV0RNZ1EwQllTZUpsc3pTWXhWVkt0ZTRB?=
 =?utf-8?Q?BTFoekJ02qf31obV7A7S4KiHmB5269OZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWZmb3BiTWlRYlprOWhTNFcvcTU4RHdSLzJuV2pqWXZ0cW1TWmdxa01IRUt3?=
 =?utf-8?B?akxISE9nWTd3VWtLSWduMmE4RzFWR0ZzOE01b1ZkUmx1V3pqZWMwU1l6N2Nv?=
 =?utf-8?B?RVN6MEJtT3llSFJxaDNsSGFCOFU5a1l1WFh5TEdZN05JSm1QZkhIb1RMRk10?=
 =?utf-8?B?YkJKOGZDZGhyZFFpRjVybm9sYlNrcG1lTXRZTm9wZWw0eFJIS3lWdVJ5dEFI?=
 =?utf-8?B?Q0FFWVNzM0ppZTBBMVNJRXlLNTljcHFndHd1Q202WWVxT3RjSkJEMURhaDJ2?=
 =?utf-8?B?RlFJSWpQMWE5VFQweEtRVzdQZXZOa3VZeWxxT1hwbU96RTdNNmhldkJnVDVv?=
 =?utf-8?B?aURCUG5NSWxFYXBySWxWNUlnSzU5UjZHYnVKMlNORmFiZVlnQlFQRlJaMUZY?=
 =?utf-8?B?aHdMUFlmUVBwU1NQL2ZUYXBZR1BZOVQ2NlhGcGN0M1JNYllmc1VFOVZuUmZX?=
 =?utf-8?B?VHArYThHNWNOc2d0OEVZSDAxUk1kb3ZVZnBMd0ZJcDlBcGhkYmZkaG1wa2k4?=
 =?utf-8?B?dFRvZ1YzdGsxZkQzUmt2TkVpcDZSeXlQb2lGZ2FrYy9ML1cwOUVHQVd5eEh0?=
 =?utf-8?B?SENXUVcvREJXTVRsSlJoOFV6djErWXNtejR3V0ZGMUM2Y0ptY21JSUhtWkts?=
 =?utf-8?B?eGxnSUg4Tm1NMXE1M0dHamNzakxqcHV2S250ekVCTHprdTVGV2tuZHZOZWpq?=
 =?utf-8?B?RmxlWkFYZ2ZVK2JZaVBJR2JSVmNRZDJGeC9wQUg0WWdhQk5qWUxabkZGNmx3?=
 =?utf-8?B?emQ4K09nc01nQ3dZZmpmQTdLbkZZNFFkTVEzVjRLTklMcDllZ0d0WmZVMk1F?=
 =?utf-8?B?ZXlPODFuQTlyeU5BMWRrL0F2aVhPejVRM0YyQm1tMmJPZXFzSjhaaFBhdG9y?=
 =?utf-8?B?YTRrb2JsL2tSdEZ4SCtXdmQ2Y1NsTVgwZHE2T3dqZXVXU1l3aEE3UVc5VjZE?=
 =?utf-8?B?UnhpN3NlVFRiTmQxcE5JSy9ucWkrVUxjaGdQQm4zOFhlUlVJQmZLQUVMb2tF?=
 =?utf-8?B?Q0picWtVTW1RUVJxWE5jenp6RUVLbUxHaUliOTJPa09qTWJnR0NqSTNSaHd5?=
 =?utf-8?B?TTZkNjVBNDZmZHphSlM4SGdmZ1hOeVIzYUp5dG1sNTh1R0JDYkV3ZVFpYlRn?=
 =?utf-8?B?VGNRWlVKNkdpM1NUVlA0bWZFeFZTUERiRmtZWGZrV3ZVWGluRUM2OW5MZ085?=
 =?utf-8?B?Z25HMzYvS1o0WHBLYnUzWGROUDA0ZTZQNXptS2dlNTl6WWhqNnVhY1AzdGpJ?=
 =?utf-8?B?REJOdWJmS0VjVEtRbnoyK2tCYnFFaUtuVDZNWjZJR09VM21ZR2pPR2U3V0Yw?=
 =?utf-8?B?VzMxNEVLQ3BoT3MyOUIwSHFKZW01cmxsNGFrNEF1dk1PMDU4WE9sSmNHSHVY?=
 =?utf-8?B?UHgrNk1VbUpyMzdta2xYRi9PckdmMU9BcldueXo2MDJvbGxoL1NRbXFabVVR?=
 =?utf-8?B?aHpBKzJZL1Y1Nkx3VTIxdlhVd1daNUpkM1Y1cmlQVVJZczhjU2JzbVo5WVVs?=
 =?utf-8?B?K2YrTm9mbktzSWQ1OG5Kbm1rSStNVE5CTjlBbFFjR0VsQWNDYUNoYkZlYmNF?=
 =?utf-8?B?TDdoeWZVTGdKRGFHSFgxME03TWlMV1laU250aEsvTHlhV3E3MXBXM2F4ZHk3?=
 =?utf-8?B?VTJlV2NUc3hmZG1KbmplU284UTU5bm1Cbzc3MldKV25jVVZod2wzYVN1c3pK?=
 =?utf-8?B?VEt5K1BKQWhzbS90MzU5dDg1NmFod0ZneUpRQk5QUEhZUU80d2lMN280dGda?=
 =?utf-8?B?dUpQRDBKYmRvWmsrWUxZRlJEcnRucXdGamJubnpzbnpJTGNtSW9YdDcrSmgr?=
 =?utf-8?B?N1BTNndVZk45WVNuUHdFVWlrSVkxb05jdUdaaVMxTlJaNU9ZOTNkaUJZNXVi?=
 =?utf-8?B?bUZJQ3g5VXJqQU9zcUpVQTRNcld1MjV3bVR3MGZCRmtLaWQxeXRMNWcvVldI?=
 =?utf-8?B?bW95eGFGR2VVYnRBczN6ZVM2eUFRRDNUSktnem5neVhaS2EyS3RjeDh5OEZx?=
 =?utf-8?B?UUwzMmNsZUYvTDlqam1JTHpiQU5TbjdIdGZXeTVpUkM5N1pxdEJRVjhpTEZr?=
 =?utf-8?B?M2JBK0dPcW1vVlF4YzVVWWY0aHhSQWszVWg2Yk5VeGNuRzM4UHJvdkR0OVA5?=
 =?utf-8?Q?u8Ew=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02279b06-878f-432b-8e9a-08dd49b644fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 09:35:34.6309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +BbLCUupCIrZrhpMp07Bm+vuGZDPMVrYbV4VaaDSCDy1bd5XZ2fdjDrGHNb5ADDYpyZmL8CsAm9vepZR1pv2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2hhbiBLb3JzbmVzIDxqb2hh
bi5rb3JzbmVzQHJlbWFya2FibGUubm8+DQo+IFNlbnQ6IDIwMjXlubQy5pyIMTDml6UgMTY6NTMN
Cj4gVG86IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3Jn
OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
OyBpbXhAbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGdwaW86IHZmNjEw
OiBhZGQgbG9ja2luZyB0byBncGlvIGRpcmVjdGlvbiBmdW5jdGlvbnMNCj4gDQo+IFtZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gam9oYW4ua29yc25lc0ByZW1hcmthYmxlLm5vLiBMZWFy
biB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIDIvNy8yNSA3OjIxIEFNLCBCb3VnaCBDaGVu
IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IDIwMjXlubQy
5pyIN+aXpSAyOjI5DQo+ID4+IFRvOiBKb2hhbiBLb3JzbmVzIDxqb2hhbi5rb3JzbmVzQHJlbWFy
a2FibGUubm8+DQo+ID4+IENjOiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgQmFydG9zeiBH
b2xhc3pld3NraQ0KPiA+PiA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPjsgQm91Z2gg
Q2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlv
OiB2ZjYxMDogYWRkIGxvY2tpbmcgdG8gZ3BpbyBkaXJlY3Rpb24NCj4gPj4gZnVuY3Rpb25zDQo+
ID4+DQo+ID4+IEhpIEpvaGFuLA0KPiA+Pg0KPiA+PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
ID4+DQo+ID4+IE9uIFRodSwgRmViIDYsIDIwMjUgYXQgNzoxN+KAr1BNIEpvaGFuIEtvcnNuZXMN
Cj4gPj4gPGpvaGFuLmtvcnNuZXNAcmVtYXJrYWJsZS5ubz4NCj4gPj4gd3JvdGU6DQo+ID4+DQo+
ID4+PiBBZGQgbG9ja2luZyB0byBgdmY2MTBfZ3Bpb19kaXJlY3Rpb25faW5wdXR8b3V0cHV0KClg
IGZ1bmN0aW9ucy4NCj4gPj4+IFdpdGhvdXQgdGhpcyBsb2NraW5nLCBhIHJhY2UgY29uZGl0aW9u
IGV4aXN0cyBiZXR3ZWVuIGNvbmN1cnJlbnQNCj4gPj4+IGNhbGxzIHRvIHRoZXNlIGZ1bmN0aW9u
cywgcG90ZW50aWFsbHkgbGVhZGluZyB0byBpbmNvcnJlY3QgR1BJTyBkaXJlY3Rpb24NCj4gc2V0
dGluZ3MuDQo+ID4+Pg0KPiA+Pj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4NCj4gPj4+IENjOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+DQo+ID4+PiBDYzogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29t
Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gS29yc25lcyA8am9oYW4ua29yc25lc0ByZW1h
cmthYmxlLm5vPg0KPiA+Pg0KPiA+PiBMb29rcyBjb3JyZWN0IHRvIG1lLCB2ZXJpZmllZCBieSBs
b29raW5nIGF0IHRoZSBtb3N0IHRlc3RlZCBkcml2ZXINCj4gPj4gZ3Bpby1tbWlvLmMgYW5kIHNl
ZWluZyB0aGVyZSBpcyBhIGxvY2sgdGhlcmUgaW5kZWVkLg0KPiA+PiBSZXZpZXdlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiA+Pg0KPiA+Pj4gd2hlcmUg
YWZ0ZXIgYSBjb3VwbGUgb2YgcmVib290cyB0aGUgcmFjZSB3YXMgY29uZmlybWVkLiBJLmUuLCBv
bmUNCj4gPj4+IHVzZXIgaGFkIHRvIHdhaXQgYmVmb3JlIGFjcXVpcmluZyB0aGUgbG9jay4gV2l0
aCB0aGlzIHBhdGNoIHRoZSByYWNlDQo+ID4+PiBoYXMgbm90IGJlZW4gZW5jb3VudGVyZWQuIEl0
J3Mgd29ydGggbWVudGlvbmluZyB0aGF0IGFueSB0eXBlIG9mDQo+ID4+PiBkZWJ1Z2dpbmcgKHBy
aW50aW5nLCB0cmFjaW5nLCBldGMuKSB3b3VsZCAicmVzb2x2ZSIgdGhlIGlzc3VlLg0KPiA+Pg0K
PiA+PiBUeXBpY2FsLiBJIHdvdWxkIGluY2x1ZGUgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Us
IHBlb3BsZSBjYXJlLg0KPiA+Pg0KPiANCj4gSGkgTGludXMgYW5kIEhhaWJvLA0KPiANCj4gVGhh
bmtzIGZvciB0aGUgcmV2aWV3ISBJJ2xsIGluY2x1ZGUgdGhpcyBpbiB2Mi4NCj4gDQo+ID4+IExv
b2tpbmcgYXQgdGhlIGRyaXZlciBpdCBzZWVtcw0KPiA+PiB2ZjYxMF9ncGlvX2lycV9tYXNrKCkv
dmY2MTBfZ3Bpb19pcnFfdW5tYXNrKCkNCj4gPj4gY291bGQgaGF2ZSBhIHNpbWlsYXIgaXNzdWUs
IGJvdGggd3JpdGUgdGhlIHNhbWUgcmVnaXN0ZXIuDQo+ID4NCj4gPiBJbmRlZWQsIGFuZCBhbHNv
IHRoZSB2ZjYxMF9ncGlvX3NldCgpIC8gdmY2MTBfZ3Bpb19pcnFfYWNrKCkuDQo+ID4NCj4gDQo+
IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgcmFjZSBjb25kaXRpb24gd2UgZml4IGJ5IGFk
ZGluZyBsb2NraW5nIHRvIHRoZXNlDQo+IG90aGVyIGZ1bmN0aW9ucz8gRi5leC4gdGhlIHZmNjEw
X2dwaW9fc2V0KCksIGluIHdoaWNoIHNjZW5hcmlvIHdvdWxkIHRoZSBsYWNrIG9mDQo+IGxvY2tp
bmcgY2F1c2UgYW4gaXNzdWU/IEl0J3MgYSBzaW5nbGUgd3JpdGUgdG8gZWl0aGVyIHRoZSBzZXQg
b3IgY2xlYXIgcmVnaXN0ZXIuIElzIHRoaXMNCj4gcmVsYXRlZCB0byBob3cgdGhlIHdyaXRlbF9y
ZWxheGVkKCkgd29ya3Mgb24gZGlmZmVyZW50IGFyY2hpdGVjdHVyZXM/DQo+IA0KDQpTb3JyeSwg
SSB0aGluayB0d2ljZSBvZiB0aGlzIGNvbmRpdGlvbiwgc2VlbXMgbm8gbmVlZCB0byBhZGQgbG9j
ayBmb3IgdGhlc2UgZnVuY3Rpb25zLg0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQoNCj4gS2luZCBy
ZWdhcmRzLA0KPiBKb2hhbg0KPiANCj4gPj4NCj4gPj4gQm90aCBpc3N1ZXMgY291bGQgYmUgZml4
ZWQgYnkgY29udmVydGluZyB0aGUgZHJpdmVyIHRvIHVzZQ0KPiA+PiBncGlvLW1taW8oKSB3aXRo
IGJncGlvX2luaXQoKSB3aGljaCB3b3VsZCBhbHNvIGltcGxlbWVudA0KPiA+PiBnZXQvc2V0X211
bHRpcGxlIHN1cHBvcnQgZm9yIGZyZWUuDQo+ID4+DQo+ID4+IEkgaGF2ZSBubyBpZGVhIHdoeSB0
aGlzIGRyaXZlciBpc24ndCB1c2luZyBncGlvLW1taW8uDQo+ID4+IE5vdCB5b3VyIGZhdWx0IHRo
b3VnaCwganVzdCBwb2ludGluZyBvdXQgb2J2aW91cyBpbXByb3ZlbWVudCBvcHBvcnR1bml0aWVz
Lg0KPiA+DQo+ID4gSSBjaGVjayB0aGUgY29kZSwgZm9yDQo+IHZmNjEwX2dwaW9fZGlyZWN0aW9u
X2lucHV0KCkvdmY2MTBfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KCksIHRvIGxldCB0aGUNCj4gaW5w
dXQvb3V0cHV0IHJlYWxseSB3b3JrcywgbmVlZCB0byBjYWxsIHBpbmN0cmxfZ3Bpb19kaXJlY3Rp
b25faW5wdXQoKSBmb3INCj4gdmY2MTAvaW14N3VscC9pbXg4dWxwIFNvQy4NCj4gPiBSZWZlciB0
byBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtdmY2MTAuYywgaXQgaW1wbGVtZW50
DQo+IGdwaW9fc2V0X2RpcmVjdGlvbiBjYWxsYmFjay4gQWxzbyBmb3IgaW14N3VscC9pbXg4dWxw
IHBpbmN0cmwgZHJpdmVycy4NCj4gPiBUaGlzIHNob3VsZCBiZSB0aGUgcmVhc29uIHdoeSBub3Qg
dXNpbmcgZ3Bpby1tbWlvLg0KPiA+DQo+ID4gUmVnYXJkcw0KPiA+IEhhaWJvIENoZW4NCj4gPj4N
Cj4gPj4gWW91cnMsDQo+ID4+IExpbnVzIFdhbGxlaWoNCg0K

