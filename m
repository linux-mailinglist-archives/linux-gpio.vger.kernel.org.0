Return-Path: <linux-gpio+bounces-25044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C16B3970D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF7D1C2573D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 08:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820FD2EAD14;
	Thu, 28 Aug 2025 08:32:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023086.outbound.protection.outlook.com [40.107.44.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5224E2E7BDC;
	Thu, 28 Aug 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756369963; cv=fail; b=qfU44aq62MMA1Rs28T2zG+6pp2mn0Yq/oAkKAayDYum0QeTAPVsKCCTorYceZgV5I1kaCpQv6qV8AjUxlZtgRvuQgqowM3f5sYIJ1FANLxHD9+qE+jhKfsGqyUdeGHmLMLQavDpPfO8oYgA7L3vtNXCEoFsP5i8QJMB3GYausI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756369963; c=relaxed/simple;
	bh=ewLD3N40+8NRkYyK4AnO8gToAW0sNeITth5OxxMxYOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d6NY0/UC3kP/J3ToVgzuf2UDv/GRTtKfglMFV8V3tOhjZC9DLzVELJcbUiXxv0RyLYqnRXdiXOuBMXyFnIy5kJAl4Iu6o2CSdEHZcLaOepV3R4smfH8O544OwoICDTPMJv9y/w/0duD1rpQKuQYix9t4gMJSqoAkgLqI3Qe8wPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTGYdn1/Y1zMlFHOA0BFdA/n9u7dP928W+ry6OlDx6DpwtUCzY+Ln1fw7WEePsIaTeyD98E87sROcPTst6LUBcNl7hqVjbSJACWQd/3OXBpnBGuBQl1O+vbw9IQDxBGCXdbP+ImK29BF5cLST8V4Kw03RWc+CFZuU83trHt6N1SaFZWZZ4iscw7rYbj5nCT4MIWB/OLLyCliibjMWvcb2nzJQQ6OfNEpnSCD4oV5oCRuvG1kkF5iE99RNbkpovXTBUlxMAmwyGIMFJJbujl9nDrZG3u3t3Q0LYpiXlizEMaHY+ywetjpoPmj8nnQUXFsqPF/O2Sk6l6lvHpde5Z/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewLD3N40+8NRkYyK4AnO8gToAW0sNeITth5OxxMxYOU=;
 b=h1H1Uq9p31+GoY2IKe3gw7jXhGTj6PybxmC4YM2xPkIllLSkAOJvnKkyzFT9xSwIaTTj4AO9j/KhTIJnOBYBzxkF39Y4QlU1XvPY7K6oGW1MudDSWJ9yJzTYvS+wECSU8Ng6RZ3Az8HzdR4bFff+OHFtVG9zhEkH4WB2rVAoGzS71XWzSSbGikvwz4EdXqpor0Pdng3JbYqpXdp//1cGcvcNLUNpphmunt7JZps67eRqIbfrRboteyNv8iiGE7eOdb4BMvvkmXWeF4NCK4pEnYgw8b6pwL56uES0Q/PoW9rtj9cSKQopQ7+0OYxmiSMZohCJcI83KWroElW3deck4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by SI2PR06MB5241.apcprd06.prod.outlook.com (2603:1096:4:1e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 08:32:36 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%4]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 08:32:36 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCAxLzNdIHBpbmN0cmw6IGNpeDogQWRk?=
 =?utf-8?Q?_pin-controller_support_for_sky1?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMS8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4tY29u?=
 =?utf-8?Q?troller_support_for_sky1?=
Thread-Index: AQHcFvw6qghsaPXOZ0esSR04j9LnwLR2NgmAgAFjVFCAAAhkgIAAG+4A
Date: Thu, 28 Aug 2025 08:32:35 +0000
Message-ID:
 <PUZPR06MB5887436E03C17498E80E43C7EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <PUZPR06MB5887BFF27AAD64ACA625126BEF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <5d8aa064-6dcf-40ce-9e73-feaebca06965@kernel.org>
In-Reply-To: <5d8aa064-6dcf-40ce-9e73-feaebca06965@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|SI2PR06MB5241:EE_
x-ms-office365-filtering-correlation-id: b27302a6-5141-4dca-f629-08dde60d70df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVlGZm5ueVJVaitleElpbHcwRDNLQzkxRHU5aUFXak43cnZ6MGZEQ0Y4MDNl?=
 =?utf-8?B?blBxNm1iRFhkbWlsTXFVUjZ3dEZjLzh4MmFXNGFrZlpIOXUxMU1sd2x0SEcw?=
 =?utf-8?B?VDNrVlFhQnRobnArZ3dIQ0lPTUtpR1JCU0NMK0hZNGdEYUZNMnlUQUQ0c1RB?=
 =?utf-8?B?dVNrNVdJbEtaS1lzNGh0SGtWZWdNTFdGcnF2enZielAxdVZuSUtiUzdGdkpm?=
 =?utf-8?B?RkNsTU54M2RvLzl3NE96ZzRxODVaSmhMVGRvckVvRjZnazgzcWlGR0xiSFhE?=
 =?utf-8?B?cFF6RHI3RHhGZlQ1Wm1UNGlzaXR4akxWTnQ0K3BiSzZ6d1FTaTBWaVVFTkto?=
 =?utf-8?B?SUVudHJLRzFEVFQvbUdPM1pLeEEvNTRKWG9qNThZS0J2dnA5djBqNWlGVGYr?=
 =?utf-8?B?SnI1dzg5VmdSNGk2bDkxWGR5UW14MHdTdkUvTnhFWWN3UUdUYUllck1GVHVu?=
 =?utf-8?B?TmRNMC9GU3ZGb1dqdURhVkVKRmtvdEZ6ZEhVcmlyY0d0QTZYSC9IOXM1cmdP?=
 =?utf-8?B?MnhsY0xrNld5TmZWWlRjbWhFdkVRbGVMR0ZVb2JJcVpZK3MreTN6MjlSSnlD?=
 =?utf-8?B?TFhKaUQ3QjJ3VlVUZ1o0NjNKZzYwK2NoaGZpUUM4ejRNTTBOR1JJOW9KdWNW?=
 =?utf-8?B?YTkraFpOM3FyajlvSFdiZ01jRHlQNG1iaE9tRDQwZW1KZlpWSTZVdTFoWGV1?=
 =?utf-8?B?Uy96S3hMNDU3MXI0Qlg1S2xWZ3NaOVFTZllkb3N3bGxKUnpJdXdKS3Fodm0x?=
 =?utf-8?B?TUV2bS9ZdDB0ZDV6MXBNUlZWK3NiR1oxeVh5aGVRQnRpSkw4WW5FWVpqcnFi?=
 =?utf-8?B?aHZaVG1ZWnJZbUMzclkzaEFiUlF3Ni8rK3M4TElETlIvcjhER0ROWmdvbUhJ?=
 =?utf-8?B?bTE1b1ZMMm03VlEvOGtRMEpkbzNuZEJXVVJ6VFRVUkM3bFVndTFCa1VvNk92?=
 =?utf-8?B?c3NVMXpjVXhoWEN2K0E1RmVkbENQTUt2UGNuZTdpOEZTTE5IVVg5K1hPZHk2?=
 =?utf-8?B?eVlpOThrNTFIN29XU0ZYdXFvaW9EQVdkbW5wVjBOKzk2RnVYRHVPTk9hRCtl?=
 =?utf-8?B?amQxS2tRMWUrL1BPQkR5Uis3S3BLQm40UGNvbWlCTTFlUTZaSFRES00yMWQ2?=
 =?utf-8?B?UElqS0tsblozOXpJUGc1cXlsWko1RUF2SURSajBqSmxhZUJvbDR2TEdqNmx1?=
 =?utf-8?B?ejJDQXJQYkl5d0ZEdDVPVThWR0NjdkhHUXkvMzVWdi9jWGJnY3c2OTBQbHBK?=
 =?utf-8?B?bVNuNVVRS1h1MzFTeXhNdUx6ZWdVRGhiTnlGL1BWQXdkS2dZOTFoOG54WVVw?=
 =?utf-8?B?M05qdFVEWi9jUUQ5Mnp1ckRydVlLM1V6TjJrV0I5LzA0VnZndVAvbklvWlBs?=
 =?utf-8?B?OStJYXgyUzl1dytJZlFxUVJqdlVCS1hKRHVnVVhTYzFISVYvVDRleFU2K25T?=
 =?utf-8?B?ampxbEl0RHFyTkxod3FjUGJwNzAwUmF4M2JWa2U3LzdMamVlS0gxU2FjemQy?=
 =?utf-8?B?RkcyY2hIR01VdG93R1Yya05sNGVySU0ya1JhSmJqeUVTUTY1dFdEWW5XOUZI?=
 =?utf-8?B?MXM4a3FSSzlwbkpDdEliUDVhaFJlSmdZbk9QL013bFI3eDk3b2c3RUNSTUxX?=
 =?utf-8?B?TEtPNXNnOGlkSFI4d1A5Z05Qc0R1Z0pMa3lhNkZ5UGcxdEN2MlF3b1dSamdZ?=
 =?utf-8?B?VkZtVDdPY0cremlOWjJXTndiTWFtN2ZSZ2FKRnIwdXNxWmp6K2VaajZhQXVZ?=
 =?utf-8?B?WllmTmtlaGxUdjVtV3RxTDJmUWZXQmlzaXFjeURNSTkvY2JGZTVYbnVLeTdo?=
 =?utf-8?B?cjUvWnFwWW1STVphQUtOVEdtbzNxKzNHZ3BQVTVOU1I0SWRWNEtzendTanpL?=
 =?utf-8?B?clBsM1BOeEN6M3RaMTVKWGsvLzUxK3lSVzBGcy9aVzN4ZEVGTUhBSGJZSlpS?=
 =?utf-8?B?cnJ3a0dTaUdidFFBUnN0ZlhiK3R1cmlDNGtnU29PUXFidHpWd2RONDJ4RXpH?=
 =?utf-8?B?LzQxUnR6SUhBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWlFYzd1c1RYR3hyNlUrd0gxc1NkS3pDL2JCSFc2NkVBc3hCNjZTc2dnLzBS?=
 =?utf-8?B?MTUzUjZYQWVWckovRGJ4dHV5cXdFQzZUK0RnaHFsZWxaWlEzMi9nY1JpZ2Fk?=
 =?utf-8?B?blBqSkNROVRwMk1ta0JxZ05PRDBOa28vV0ZlOXQySm5valdvTmMwU1g0WHBr?=
 =?utf-8?B?Tm93c1dvaElMNkxLWHUyRmdzS3FhSnhQbDd3UUMwc2RqTnhNZUFVc0hYcXRJ?=
 =?utf-8?B?eHRzT2pnaVdaTHV6a25mM0lLZzVCWEY1TWV0cW9XRXdwcUR5OERnbDE1YkNn?=
 =?utf-8?B?WlRYVlYwSVFtcWVRMnN1QmxGaTRQa0FnSjFzRkJxdVNzWVI0MW1nNklUTnI3?=
 =?utf-8?B?U0daQW1WVEx1cXBld0dkRk44RFZyWk1IdFJmM3JaSHY3VWs5M2lnQXNxbTZu?=
 =?utf-8?B?a3BubHRNVTErWjNzR1lwOTh3bmI5Q3dPYVRORXAwVGdKa3dESDdzY0VCYWRN?=
 =?utf-8?B?c1BuYjBJOUlwQUFIbTNqdXcyeGFranZHUXI2SlJjMnZXeFRoOGw0VmVFQnNR?=
 =?utf-8?B?TnpmelBXMWtBdGJBRXIvZGdrZzNrcEMyZEU4WHV3cWhIN09heFlNa3pvVnNl?=
 =?utf-8?B?VVk1djJwcENiWlA2VFdxODBVK01ySDgxK0lTaUI0RVdZWnJDQk1QNmYrcjAw?=
 =?utf-8?B?dzJXdlZjRnpsbk0yL29xVm5OUDJvR3hOazcwOWV6NEt5UjVGRFdXd1k5UzVt?=
 =?utf-8?B?NnNhMnJlSTlOSjgrR1FyQy9yZ2p5bjFpbVZ0enZhMXVzKzhmS2x1aWI2SWhJ?=
 =?utf-8?B?dUZGS2JWenFwbnVaSG9oci9UclNDL1JEUGFaUXIvTnFCQ0l2SkpzY2JUd1Fx?=
 =?utf-8?B?OXUrOGV5cDZXWVFxazRYR01LV1l4Y3dXYmhkMFNaT1prcEpaQ2c0RzhmRUtW?=
 =?utf-8?B?OThDN0c5Qm5aRUU1aVREZzVvdUptVGdkMUp6LzRqeGxxRm9RTnJoYzN5SE50?=
 =?utf-8?B?ZCsyVmlQUm9Ec1Mxd0xZSDFua2JuTHNYa1VVdENGZVBBTThKNU9Cc3hSTElo?=
 =?utf-8?B?eG9uMzVUSElNRzJUMTFmdjVTeXlmNVRuVDN1OFlaN1JlL2lTT0tydHVZWFZ1?=
 =?utf-8?B?NGxtdGZ4a2NrcXVwa3BmVW0zRXZFbDJSeUc0Z2NMNEJiYTFOaFkxbVk2WCtX?=
 =?utf-8?B?V3cxWGpHN0tuQy81THFsYWdjM3J1ajFwd1lXemRtYkdKcm1xOCs0QVdIeWRU?=
 =?utf-8?B?elFwSFVBdjlSblIvdVAxenpNanQxVlRQRUN5cnFwYXVnOHNGL1pQTzhha3Bt?=
 =?utf-8?B?Qy93ak5LdnVUNmp3VkxNVjh3WmQvVW53U3VDZzFORkVvVGExR3lVNTNIQjQ3?=
 =?utf-8?B?WDZpQ0N1UzAwaytqNGFNaCtXc1p2UjVHMER4Sm01dlRvUndCN0hzdDF6bUYr?=
 =?utf-8?B?NWt1eWtFMi9nb0xYa3FBVmFuRGYyOWp2bjZGclZ1N3BlcDVEQjRzV2J6aS9v?=
 =?utf-8?B?RjNFTi9xZlNFb2pJUFF2Tk9wY0JqNEUzNVI1bkhTcUNWZmcyZ0NHd0trRjl4?=
 =?utf-8?B?OHRVMGU2OFRxTlhLMlhsYXBqNFdNa1BEMkx2ZytuSmJGSVZ1Z2xEV2hnVXFa?=
 =?utf-8?B?WWxsaTNHcHIzalREaE02MmdCVXkzZWRUS25KOE14R0pCYXFuZDcxSDBNd1hu?=
 =?utf-8?B?VjZSci8rbHU0bUtHTU42OTlpZnRBODRIQVpFemtKZjZMajZyam9qV0wrbzdI?=
 =?utf-8?B?SXBCSk5xTm4zTldOMmVWT0VMalRpQmZiNnIvZXBJejV0ZFZqT2tUdFFnUjhl?=
 =?utf-8?B?U1NSQjlnRnUwQ1ZSV0M0eWpRdlRpc1NyWWsvSlpab3FUbkZqamhtcjhOWjVD?=
 =?utf-8?B?NkJwcDZ2TDgvcVRGWitMdmsrS1laUGNjUkZUbEJtNCtjZG9GeGM5VTlCVWtF?=
 =?utf-8?B?cVBnVzBCemQyVXNncU4wU2U4bVVuV1czVC92V2ttTlJrUVk0YW5lMFdWQnky?=
 =?utf-8?B?WWs3b2JaMUlTR3VuU1ZxSHVrWUNkeE1rbVZMSTZsaHdvdW0xYUtJeGg1Uk5L?=
 =?utf-8?B?M2FwU2RRTU5HaEttQlp2NFhIWnBpYjJCTy9DN2VYcnVCOHhXL2ZLL1plOUZL?=
 =?utf-8?B?VEhMY2Z5RHFmdmFyanJHS0ZsTnJzc29tOVdFd1J4YjJ2aVBXN0xaYURtVFVr?=
 =?utf-8?Q?vX8DsLIy0WAqHLeuWTK2CWSfT?=
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
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27302a6-5141-4dca-f629-08dde60d70df
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 08:32:35.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOxLbDKxOP+N7Q3RAIUQyy118XsXJM1E9KGTEn6dP6XB34recDN/Ui66RQ/eFFakI8d/3Ws5UxogfAkvBTN9Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5241

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAyOC8wOC8yMDI1IDA4OjQ0LCBHYXJ5IFlhbmcgd3Jv
dGU6DQo+ID4+DQo+ID4+PiArICAgICBpZiAocmV0KSB7DQo+ID4+PiArICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgImZhaWwgdG8gcHJvYmUgZHQgcHJvcGVydGllc1xuIik7DQo+ID4+
DQo+ID4+IFlvdSBhcmUgcHJpbnRpbmcgc2FtZSBlcnJvciB0d2ljZS4gRHJvcCB0aGlzIGFuZCBq
dXN0IGhhbmRsZSBlcnJvcg0KPiA+PiBwcmludGluZyBpbiBza3kxX3BpbmN0cmxfcHJvYmVfZHQo
KS4NCj4gPj4gRXNwZWNpYWxseSB0aGF0IHlvdSBub3cgcHJpbnQgZXJyb3JzIG9uIEVOT01FTS4N
Cj4gPj4NCj4gPg0KPiA+IFNvcnJ5LCB0aGlzIHByaW50IG1lc3NhZ2UgaXMgb25seSBvbmNlLCBu
b3QgdHdpY2UsIHBsZWFzZSBnaXZlIG1vcmUNCj4gPiBpbmZvcm1hdGlvbg0KPiANCj4gVHJpZ2dl
ciB0aGUgZXJyb3IgYW5kIGNoZWNrIGhvdyBtYW55IGVycm9yIG1lc3NhZ2VzIHlvdSBzZWUuIEkg
c2VlIHR3by4NCj4gWW91IHNob3VsZCBrbm93IHlvdXIgY29kZSBiZXR0ZXIgdGhhbiBtZS4uLg0K
PiANCg0KVGhlcmUgYXJlIHR3byBwaW4tY29udHJvbGxlciBvbiBza3kxLiBUaGV5IHNoYXJlIHRo
ZSBzYW1lIGRyaXZlci4gVGhlIHByb2JlIGlzIGNhbGxlZCB0d2ljZS4gDQoNClNvIHdlIHNlZSB0
aGUgcHJpbnQgbWVzc2FnZSB0d2ljZS4NCg0KPiA+DQo+ID4+PiArICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+ID4+PiArICAgICB9DQo+ID4+PiArDQo+ID4+PiArICAgICBwaW5jdHJsX3Byb3Zp
ZGVfZHVtbWllcygpOw0KPiA+Pj4gKyAgICAgZGV2X2luZm8oJnBkZXYtPmRldiwgImluaXRpYWxp
emVkIFNLWTEgcGluY3RybCBkcml2ZXJcbiIpOw0KPiA+Pg0KPiA+Pg0KPiA+PiBObywgcGxlYXNl
IGRyb3AuIERyaXZlcnMgc2hvdWxkIGJlIHNpbGVudCBvbiBzdWNjZXNzLg0KPiA+Pg0KPiA+DQo+
ID4gT2ssIHJlcGxhY2UgZGV2X2luZm8gd2l0aCBkZXZfZGJnIG5leHQgdmVyc2lvbg0KPiANCj4g
DQo+IE5vLCBpdCBpcyBjb21wbGV0ZWx5IHJlZHVuZGFudC4gWW91IGFyZSBkdXBsaWNhdGluZyBl
eGlzdGluZyBtZWNoYW5pc20gZm9yIG5vDQo+IGdhaW4gYXQgYWxsLg0KPiANCg0KT0ssIHdlIGRl
bGV0ZSBpdCBvbiBuZXh0IHZlcnNpb24NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K
DQpCZXN0IHdpc2hlcw0KR2FyeQ0KDQo=

