Return-Path: <linux-gpio+bounces-2163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83982C0AB
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 14:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79DED1F2489C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317466BB51;
	Fri, 12 Jan 2024 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cognex.com header.i=@cognex.com header.b="PqTrev5L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2122.outbound.protection.outlook.com [40.107.223.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676C6BB37
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cognex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cognex.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuZTD9T9Q6pmr9yZjcnupstg/geYnR3qLOleYsWcXijITWxMJZRMrG648s5QCsYgckWv1zoG7u6NyKEiF1lf39a1hXqqMQv6wSbytbuD01Dfv8Ppb7oDBEMKEJ5nfld6Bl8JPLRo15Efupy1BRZ5hrE8rwGjQOlDPVhYr3GkuJ73jtCqOdTDB0L9V/aFBc6hyxWa1AvfL9DdItv0th0FrTcsgKLgPL7uhH0HfoS2jAbDDCGWDwlEECZUZjqPEXf/BlU6tjaB8kmQlj1MvVKKYHnKZYLNQPHEgW1LadwswZVI7radxSzpCPNpiK9rmi+WQqpVoEuMfQyuFxo6cUPTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6F9n7YwZew+sNU7Dgmv2P7rLYC5wlxXY1mCjz3uLjI=;
 b=Ssl7QPpdmFI+j3qUypm6byOEhFjHKUzBSDYY6isvA5vFRODYjJ0E0ydoDAeP0zP+k0QccLH6Cdq6S1deHKbTzdrahDdLvlGUloIE4SqTpy02skEfJnKRmrYteCOvcBWj0tpwzRrkpAeylMXPjttdHDcROn72U1vV4cpVxqTfBwhCNkaopGdsJanksYRtd+CY+nAx6EEtxOpPx+vX+P40hbXe5KOqeMDePV0LvuttSJ61xt54UrN6nQzzwLPTpd8OhQ891qbqOyR9HnXHAy9bfeqDLHSiR6SJ+MWCdvbqSetCuaJFIfDvbP3b7BNm/STfnm+WkYEFzsHCGq6HsktltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cognex.com; dmarc=pass action=none header.from=cognex.com;
 dkim=pass header.d=cognex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cognex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6F9n7YwZew+sNU7Dgmv2P7rLYC5wlxXY1mCjz3uLjI=;
 b=PqTrev5LdOEWwCCraeKFIVWcjk/mQPYXof2ERmLvcjoknUbw5f6TezIYqZyQNyeu/VyarTEt+mETXmRFs6lX7WN79D8OZZluRx/6auhc9ykk06Up6XMNvuTZM9MDYqE5n9yyfN9blsbmA2ZbQqrSbiLo3ZqBQcvZ79VzR2diWbIwlgUOsP65RoCK+ygKCVhFhI0oR1UsxIAjitI5UNZXo49YuqlY91mOXZERKJHpgY5sBmxVhRx8/nixLclkzwGwYq+ZF/T92KYA2KDQar7pwwC4AQJDaBv/dNe6AEii3NoaIBwV5G7e3kUcxo31rUqosEln+0IH0I3332EtenzNGw==
Received: from PH0PR06MB8334.namprd06.prod.outlook.com (2603:10b6:510:bd::7)
 by SA3PR06MB9091.namprd06.prod.outlook.com (2603:10b6:806:2f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 13:16:29 +0000
Received: from PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d]) by PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d%7]) with mapi id 15.20.7181.015; Fri, 12 Jan 2024
 13:16:29 +0000
From: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
To: Kent Gibson <warthog618@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"ada@thorsis.com" <ada@thorsis.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Re: Assign line names at runtime
Thread-Topic: Re: Assign line names at runtime
Thread-Index: AQHaRVmNXsEVn1jMdEOl1he6No2yiQ==
Date: Fri, 12 Jan 2024 13:16:29 +0000
Message-ID:
 <PH0PR06MB8334079C458EF28FE056CD75866F2@PH0PR06MB8334.namprd06.prod.outlook.com>
References:
 <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
 <20240112003558.GA3310@rigel>
 <CAMRc=MfeZTynTrdQdMqqvsMYsNo5yHgo+LzuRdqYpg-oZC+f6A@mail.gmail.com>
 <20240112123105.GA66782@rigel>
In-Reply-To: <20240112123105.GA66782@rigel>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF8yMjBiMDVjOC0yNTM3LTQxZTgtYWZmNC1mYjZjNTIyZjk2?=
 =?utf-8?B?MjRfRW5hYmxlZD1UcnVlO01TSVBfTGFiZWxfMjIwYjA1YzgtMjUzNy00MWU4?=
 =?utf-8?B?LWFmZjQtZmI2YzUyMmY5NjI0X1NpdGVJZD1jMTIwMDdhNC04ODJiLTQzODEt?=
 =?utf-8?B?YjA1YS1iNzgzNDMxNTcwYzc7TVNJUF9MYWJlbF8yMjBiMDVjOC0yNTM3LTQx?=
 =?utf-8?B?ZTgtYWZmNC1mYjZjNTIyZjk2MjRfU2V0RGF0ZT0yMDI0LTAxLTEyVDEzOjE2?=
 =?utf-8?B?OjI4Ljg1OVo7TVNJUF9MYWJlbF8yMjBiMDVjOC0yNTM3LTQxZTgtYWZmNC1m?=
 =?utf-8?B?YjZjNTIyZjk2MjRfTmFtZT1Db2duZXgg4oCTIEdlbmVyYWw7TVNJUF9MYWJl?=
 =?utf-8?B?bF8yMjBiMDVjOC0yNTM3LTQxZTgtYWZmNC1mYjZjNTIyZjk2MjRfQ29udGVu?=
 =?utf-8?B?dEJpdHM9MDtNU0lQX0xhYmVsXzIyMGIwNWM4LTI1MzctNDFlOC1hZmY0LWZi?=
 =?utf-8?B?NmM1MjJmOTYyNF9NZXRob2Q9U3RhbmRhcmQ7?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cognex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB8334:EE_|SA3PR06MB9091:EE_
x-ms-office365-filtering-correlation-id: 793f1fff-de19-4096-bf27-08dc1370b02c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zPH4MtK3Ds6KeIKS5e6WpX8x/k7jmgEKhdJPsMgjETaTaeWbMVjeunZpFbeTl/ulQDI+g7vTcUM8IUeNKuqwdVC5G/S1NYe8DJG0sHBGYOwhRpm7/RZ7oUugkSoH6m1mfYlh/0mNrwsszro1mZOIIkWO6d/4wORg3KZ3L1q69Hog1mMWToGi3oL/W50odu+x/mp+TsIXW7pf8MZXhEoABUBlYuygezD40jlboTbYsYP6MLz/KYZeUyOJB63mT08Kw6ctUw0KlbtBOhvpKJvhbrM6ucaZicinfdVh43Jgy/Rh7tKM+6X23J7flZaULHXtoecaSYAQ3DkUyL2F6QFTB6j7GSNFWBCmKkgkj4qhoTM45Az/LLFZBM8xyuJXRJ1I0tyqE/PuJRoUr0N7dkS6PGG2KE9pUwmkAPEW9g7CqLZ3sE8TO8OiJmindCRT2rXXHqyM8Dbo9v2IQDCwq/KrSuD/r0vvvYdTL5XWdYEtvtflNH/XNePujC/VTCyx/nG0VbJ58Bfio9QGESEIgdiEDsuijZnGOVkAaS9C7iTvrtjiJYtKUdfAFviJ1zC5A2QmXcyLwC2cTotcRnNdQUNew2k1JN1oMkvp05loaDe4zj0WMRWgC5b7/vRZlfW5QngH
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR06MB8334.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(55016003)(71200400001)(38070700009)(6506007)(66946007)(7696005)(53546011)(66476007)(478600001)(26005)(9686003)(66446008)(83380400001)(86362001)(316002)(76116006)(91956017)(66556008)(110136005)(64756008)(5660300002)(33656002)(8676002)(66899024)(41300700001)(122000001)(2906002)(52536014)(8936002)(4326008)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cytsWXlnQlF0S29yMmpnOFd6UzlLM0JmeFhTVVBRNTVIcEFnTktYZURaNURO?=
 =?utf-8?B?SHJSWUpKSTNtR1J3MVFZTG5qNng0eUgrWW5xTWdwLzZrczN5czRSaGZmaUxx?=
 =?utf-8?B?Rzc0U0hFZkVOUmwvQzl1dkFKSUNEWlVLUzlST1AzdUdIb0pTQ0RraGJ3c0ZV?=
 =?utf-8?B?bkxTVngrTVdKVkRobVdYd1VmNVg3QzBpaUxaNHhIVVFXK21DbFVpWHJ0QmFZ?=
 =?utf-8?B?ajl0ZFRiNG9tUUUwbWNsbmp6anM5NFlOQ21EVTdWQ0xweW5hU2FaSFpOMncr?=
 =?utf-8?B?ejhXYXBZankzY3RPbG5vY3F5SkJFck83aXdYSko3eWg0eEl5b2FnSVNQWnlZ?=
 =?utf-8?B?QTRKQVNKZGgwUUdEdjlnanJRS3ZJbnY5eVFYNGVGb0NaOXJCQzRJVHBsUTA3?=
 =?utf-8?B?NXh3Qms1ZkZTNVBpRHpKRTc0N1oyM2xPNUczQ1VKMVJ6MFpNVUhhR0FsaTJj?=
 =?utf-8?B?ckdjT2xYYjk0azZYazhESC9naXIzOCtuU01ab3BBU0ZyWU9td1hHYkpyWExU?=
 =?utf-8?B?bGwyT1daVUR1UGh4N2M3bGNtelpzYUlacEtwdWpudnlzU3Y1RG9ING4wTnRw?=
 =?utf-8?B?eTB3aEVBMEc0aXFHM1drWjkxYWwwNlVOMWhvTXpwWk9IZlQ5QmU5RmFhMldm?=
 =?utf-8?B?bGt5ZE1QNVBWMEI4SFVEQUFGaWZ4MUhSOWNTa3ZxeXdpQWNvbXBXQTlrdmVx?=
 =?utf-8?B?SjlvN291ZnZSRjRTbXR1Tmx4eksxK0pKMkdtdlVqcnFHOTZwaG0wOUxIUVM0?=
 =?utf-8?B?dllUT010cTlvcEN4WHRxK0F1bGFYbnM4TGh2aFp0VzVHeUF4bTFRVTV4SUZH?=
 =?utf-8?B?SytyYUx3Q3U4eXNhUGpmNEVRWW13d1FFVk1ZSExTS1RJTGdEQ0ZRRFB3bUVS?=
 =?utf-8?B?MjlpVUVNa2x2RG1BZ0twdzR5M3FWTzlob0pOVjQwbWZYenpuU2FBenZ1NWxC?=
 =?utf-8?B?K0hta2Y2Vm52SE51Vm05c05ud3kxUy95U01TYjQxajRjNFN5QXRGYTlaQjNn?=
 =?utf-8?B?b0hTQ1hUM2tJckg1bVlrUDZNQW5UVjhubUdtRFBrZWZPczZsdmMrdERlMVE1?=
 =?utf-8?B?ZzdzSHpVTGR3dE5HZ2ZzS05IUU1VVzJKa0UzdGxwclFBclAzSmkrNmJhVitp?=
 =?utf-8?B?NEdFaDZrWm85VGlWZ05NVTRsTkwwRGRxRE9zMWRmcUlpMWMzTFZJQkRZT3RJ?=
 =?utf-8?B?bjAvWmtHZXBFZnJxdUdvTklxRFdNZU1uRUdXR2QrMHdZS3Vjdkw1Y2ZkZS90?=
 =?utf-8?B?OGhrdTVzdEV0UUVQaHRkNmFGVzE0T0UreURnTXh2VlZydUhEc1Z6NTNBSEp5?=
 =?utf-8?B?Q0JFZ2E2d1p3c2ZZT1c1NzZia2dwVDRQcE4zb1JkTUVQbmtsUzZEVTUwdnQ4?=
 =?utf-8?B?M2tFNm5DL1hRSVFuNHpWRjBpaTJ0aVhnTlRWSWtJNjVycnNOYVI1QVdyZzV6?=
 =?utf-8?B?R3UyZFU0Z21EM1VPZkY5V0p0dzhrcm12UGN3UkNwK2Qyc1NwWFNTVnFTQ3BM?=
 =?utf-8?B?ODgzcVdIOHUxNzJFTzN6VlFaaXFSMzBNL1ZjWHk5YWp4QUZTNTdGRnA2bk9x?=
 =?utf-8?B?RjFXeXZ4eHJOT3BWNVdkWmV1am05Q042T045ZG5rcWhOcFlCU0hGYUtSNTlr?=
 =?utf-8?B?dm1OVzRocG9NQTBoY3Jqd0c2NXVuanZwSzRlNThlQlZsVUhqWEVLblU1S2lP?=
 =?utf-8?B?c0l0aWtydS9DSHJHOG1ubmNZcFV4L3JGV293MDdwamhORitTVitsZng0OEtC?=
 =?utf-8?B?VE0yanZZUVc1Z3gzNEE0aEJYaDZvSFB5ajkwT2RKemdqR3QzWmhEOHpwUnpq?=
 =?utf-8?B?L3o1MFRmYUhHZnFyNW1sTXlyZTRmQmszdDdROEJXam8xeWhWZHZIRzNLV0Yx?=
 =?utf-8?B?RnlEWG5GM1FhK2pNMm8rbFdnSnNoUTh5YWRoVGxMU1JuUHdLU0EzeWJ0aWp6?=
 =?utf-8?B?dHlneEhuMUFUK2NhV0FjdVk1Y1d3NjFrZUhacUtMN1FwaXpOTXhUTUhyY253?=
 =?utf-8?B?MTA1V09udmpMWHhlTWYrY01xdlV5U1orWDJQYUxJTlNVU25aamFlRi93aHUy?=
 =?utf-8?B?N2laMnRyMUI4WGNpQVJ5TVJlenVaL2dJY2xyTWlGbDRFSlZ3akVvd1VrK21U?=
 =?utf-8?B?M1dOeWFZblE2Mkc5MDdVZXBwSVovU3JCR29WUExDRzBCQnRxNU1qeXJWdm9F?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cognex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR06MB8334.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793f1fff-de19-4096-bf27-08dc1370b02c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 13:16:29.2561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c12007a4-882b-4381-b05a-b783431570c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOGFxCkm3Pu1Un8Jqa8bCykCghbguW7LjjULbtPCo287fUiPc/Vdjf0ko7ChoGjQqmBymX1IHp74ey61zVF6VBmOzJSLBTsmJsSDGnzknwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR06MB9091

CllvdSBtZWFuIHlvdSBzcGVjaWZ5IHRob3NlIGluIC5kdHM/CgpPbiBGcmksIEphbiAxMiwgMjAy
NCBhdCA5OjMzIEFsZXhhbmRlciBEYWhsIHdyb3RlOgo+IEFtIFRodSwgSmFuIDExLCAyMDI0IGF0
IDEwOjQyOjUxQU0gKzAwMDAgc2NocmllYiBXZXN0ZXJtYW5uLCBPbGl2ZXI6Cj4gPiBXZSdyZSB0
cmFuc2l0aW9uaW5nIGZyb20gdXNpbmcgdGhlIG9sZCBzeXNmcyBpbnRlcmZhY2UgdG8gdXNpbmcK
PiA+IGdwaW9kIGFuZCBuYW1lZCBsaW5lcy4gRm9yIG1vc3QgZGV2aWNlcywgd2Ugc3BlY2lmeSBs
aW5lIG5hbWVzIGF0Cj4gPiBib290IHRpbWUgdXNpbmcgZ3Bpby1saW5lLW5hbWVzLgo+IAo+IFlv
dSBtZWFuIHlvdSBzcGVjaWZ5IHRob3NlIGluIC5kdHM/CgpZZXMsIGN1cnJlbnRseSB3ZSBkZWZp
bmUgdGhlIGZ1bGwgR1BJTyBleHBhbmRlcnMgaW4gLmR0cywgYnVzLCBhZGRyZXNzLCBncGlvLWxp
bmUtbmFtZXMuCgo+ID4gT24gc29tZSBkZXZpY2VzIHdlIGhhdmUgc21hbGwgZGlmZmVyZW5jZXMg
YmV0d2VlbiByZXZpc2lvbnMgb3IKPiA+IGhhcmR3YXJlIHZhcmlhbnRzLCB3aGljaCBjYXVzZXMg
bGluZXMgdG8gYmUgc3dhcHBlZCBvbiBHUElPCj4gPiBleHBhbmRlcnMgb3IganVzdCBiZWluZyB1
c2VkIGRpZmZlcmVudGx5IGZvciBiZXR3ZWVuIHJldmlzaW9ucy4gV2UKPiA+IHN0YXJ0ZWQgdG8g
aGFuZGxlIHRoaXMgYnkgb3ZlcmxheXMsIGJ1dCB0aGF0IHJlcXVpcmVzIHRvIGRpc3Rpbmd1aXNo
Cj4gPiBkdXJpbmcgdGhlIGJvb3Rsb2FkZXIgcGhhc2UsIHdoaWNoIGlzIGhhcmQgdG8gc2Vydmlj
ZSBhbmQgb2Z0ZW4KPiA+IHVubmVlZGVkLiBFc3BlY2lhbGx5IHdoZW4gd2Ugd2FudCB0byByZW5h
bWUgYSBzaW5nbGUgbGluZSwgdGhlCj4gPiBvdmVybGF5IG5lZWRzIHRvIG92ZXJyaWRlIGFsbCBl
bnRyaWVzLCB3aGljaCBsZWFkcyB0byBkdXBsaWNhdGlvbiBvZgo+ID4gdGhvc2UgbGluZSBuYW1l
IGxpc3RzLgo+IAo+IFNvIGVzc2VudGlhbGx5IHlvdSBoYXZlIGhhcmR3YXJlIHZhcmlhbnRzLiAg
SW4gbXkgb3BpbmlvbiB0aGlzIHNob3VsZAo+IGJlIGhhbmRsZWQgaW4gdGhlIGJvb3Rsb2FkZXIu
ICBXaGF0IGFib3V0IGhhdmluZyBhIC5kdHNpIGZvciB0aGUKPiBjb21tb24gcGFydCBvZiB0aGUg
Ym9hcmQsIG9uZSAuZHRzIGZpbGUgZm9yIGVhY2ggdmFyaWFudCwgYW5kIHRoZQo+IGJvb3Rsb2Fk
ZXIgcGlja2luZyB0aGUgY29ycmVjdCBvbmU/ICBUaGlzIGlzIHByb2JhYmx5IGxlc3MgY29tcGxp
Y2F0ZWQKPiB0aGFuIGhhbmRsaW5nIHdpdGggb3ZlcmxheXMuICBPdmVybGF5cyBhcmUgZGVzaWdu
YXRlZCBmb3IgYSBkaWZmZXJlbnQKPiB1c2UgY2FzZSBsaWtlIGFkZC1vbiBib2FyZHMsIGFyZW4n
dCB0aGV5PwoKSW4gZ2VuZXJhbCwgSSdtIGZvY3VzaW5nIG9uIHRoZSBhZGQtb24gYm9hcmRzLiBG
b3IgdGhlIGJhc2Vib2FyZHMsIHdlIGNhbiB3b3JrCndpdGggLmR0YihpL28pLCBhcyB0aGUgbXV0
YXRpb25zIGFyZSBsaW1pdGVkIGFuZCBjaGFuZ2VzIGFyZSByYXJlLCBzbyB0aG9zZSBjYW4KYmUg
aGFuZGxlZCB1c2luZyBpbiB0aGUgYm9vdGxvYWRlci4gQnV0IG91ciBhZGQtb24gYm9hcmRzIGFy
ZSBwbGVudHlmdWwgYW5kCmhhdmUgdmFyaWFudHMgd2l0aCByZXZpc2lvbnMgZWFjaC4gU3VwcG9y
dGluZyB0aGVtIGFsbCBpbiBib290bG9hZGVyL2R0YiBtZWFucwpyZWd1bGFyIHVwZGF0ZXMgdG8g
bG93LWxldmVsIGNvZGUsIHdoaWNoIGZlZWxzIGxpa2Ugd2UgY2FuIHNpbXBsaWZ5IGFuZCBkZXJp
c2sKaXQuCgpPbiBGcmksIEphbiAxMiwgMjAyNCBhdCAxOjMx4oCvQU0gS2VudCBHaWJzb24gd3Jv
dGU6Cj4gU28gSSdtIGF0IHRoZSBwb2ludCB0aGF0IEkgdGhpbmsgd2UgY291bGQgZG8gaXQsIG9u
ZSB3YXkgb3IgYW5vdGhlciwgYnV0Cj4gbXVjaCBsZXNzIGNlcnRhaW4gaWYgd2Ugc2hvdWxkLgo+
IEkgd291bGQgbm90IGNvbnNpZGVyIGl0IGlmIHRoZXJlIHdhcyBhbiBhbHRlcm5hdGl2ZS4KCkkg
cGxheWVkIGFyb3VuZCBhIGJpdCB0aGlzIG1vcm5pbmcgYW5kIEkgaGF2ZSBhIChwcm9iYWJseSBo
YWNreSBidXQpIHdvcmtpbmcKcHJvdG90eXBlIHdoaWNoIGFkZHMgYSBHUElPX1YyX1NFVF9MSU5F
SU5GT19JT0NUTCBhbmQgY3VycmVudGx5IG9ubHkgYWxsb3dzIHRvCm92ZXJyaWRlIGEgbGluZSBu
YW1lLiBJIHBsYXllZCBhcm91bmQgYSBiaXQgYW5kIHRyaWVkIHRvIGJyZWFrIHNvbWV0aGluZywg
YnV0CmN1cnJlbnRseSwgaXQgc2VlbXMgdG8gd29yay4gQnV0IEknbSBhbHNvIG9wZW4gZm9yIGFu
eSBhbHRlcm5hdGl2ZSwgc28gbWF5YmUKd2l0aCBzb21lIGV4dHJhIGluZm8sIHNvbWVib2R5IGhh
cyBiZXR0ZXIgaWRlYXM6CgpUaGUgaGFyZHdhcmUgdmFyaWFudHMgSSdtIGRlYWxpbmcgd2l0aCBj
b3VsZCBiZSBjb25zaWRlcmVkIGFjY2Vzc29yaWVzOgpFeHRlbnNpb24gb2YgYSBiYXNlIGluIGRp
ZmZlcmVudCBraW5kIGFuZCByZXZpc2lvbnMuIEFzIHRob3NlLCB0aGV5IGFyZSBtb3N0bHkKbm90
IGJvb3QgY3JpdGljYWwgLSBJIGNhbiBkZWZlciBwcm9iaW5nLiBUaGF0IHdvdWxkIGFsc28gYWxs
b3cgbWUgdG8gZGVmZXIKcHJvYmluZyB1cCB1bnRpbCBtYW51YWwgcHJvYmluZyBmcm9tIHVzZXJz
cGFjZSwgZWcgYnkgYSB1ZGV2IHJ1bGUgY29sbGVjdGluZwptb3JlIGRhdGEgYW5kIHByb3ZpZGlu
ZyB0aGF0IHRvIHRoZSBkcml2ZXIgb25jZSBhbGwgZGF0YSBpcyBwcmVzZW50LgoKQ291bGQgZS5n
LiBhbiBleHRlbnNpb24gb2YgdGhlIG1vZHByb2JlIHBhcmFtcyBmb3IgaTJjIGdwaW9jaGlwIGRy
aXZlcnMgYWxsb3cgdG8KcHJvdmlkZSBub3Qgb25seSBidXMgYW5kIGFkZHJlc3MsIGJ1dCBhbHNv
IGEgbGlzdCBvZiBwaW4gbmFtZXM/IElkZWFsbHkKaW1wbGVtZW50ZWQgb24gdGhlIGdwaW9jaGlw
IC8gaTJjIGdwaW8gbGV2ZWwgc28gdGhpcyBhcHBsaWVzIHRvIGFsbCBncGlvIGRyaXZlcnM/Cgoo
bmV3IGF0dGVtcHQgYXQgbWFudWFsIGZvcm1hdHRpbmcsIHNvcnJ5KQoKQmVzdCByZWdhcmRzLCBP
bGxpCg==

