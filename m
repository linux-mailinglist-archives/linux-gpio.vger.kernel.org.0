Return-Path: <linux-gpio+bounces-18058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72FA73020
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0473BCB99
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E841215193;
	Thu, 27 Mar 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="N0mFlSHf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-0063e101.pphosted.com (mx07-0063e101.pphosted.com [205.220.184.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45B2139B1;
	Thu, 27 Mar 2025 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075523; cv=fail; b=VoXyO48RLTHrnWI9aegDvZLQKiFZItt3AYHdPLqmMd4/3NinGdmjaeOaEOnDSmWButVDwe/MSqdoQkPiK93V5NENHInBOoG2iKQ2geTZmnssDT5L0B8ofTon4eOcDAOC9YDRMAbODQMWLbEzvzzp2KiwVM2lU7QNKj/spM9nVBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075523; c=relaxed/simple;
	bh=5X08nBsRMYIb0Bj9JFt4qF9FtAnmWjIc5EVKmDvKT6s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gPBWTJZ0ZTGxXysit+jOI5bJzUCMNNt2GvpFbaj/8zFUxulTZNUCNqkyIeXA5Jge+i1zN0GtkTqCT8P2zN8sd4KNo+5IvpY0gVCf0PkiuGR3U04S2qxiUaUHsuWBBjfTgbWhJtFaMm5Cm3haqJuLiUcGLQ/bK1I7+FzweCImJ+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=N0mFlSHf; arc=fail smtp.client-ip=205.220.184.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RB3Ix4019756;
	Thu, 27 Mar 2025 11:27:23 GMT
Received: from pnypr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17010007.outbound.protection.outlook.com [40.93.132.7])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 45hkb2thc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 11:27:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAqg7yJJ5+P3BiH70WeFqSfDkOWdCWLD04uNXRqE7/VlDkfqHb3IItm7EzpcFd6YhB4ISCOlnfegOEtsX6E8sQ9gUs3ZuXsL9ujeswaCtXqYim1ptl79sjUOd8dwSCcK4NRfr22MbGF17H0UBblwem8rOwgWLmTxJfvvX5rJBtZOip2wJNOXgrcbol9I01uxcVYxowQ2Mz1mNcmMS5YI0n9o+wMvKVGD4jmEATn2pEbqS15V/hWwNQUKJHx2FzKkePebF0sEX1lqmY24Bdu2KLFKLmS3kuJYHqnrq8bO/QYCS6rtuTiGgtxoWxotoyTNIRSinjSI3RjwEn+EWV2qJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5X08nBsRMYIb0Bj9JFt4qF9FtAnmWjIc5EVKmDvKT6s=;
 b=TgijDDRm88mgSmoUqKZ+32pnQ9FafjHl159Mw5FAbVx5hK7Q3pskT75M6NnNRzDsqTGOGS/83G8jpVYktmoEGIq7zrxgd/5R1G0JPZERpRUJUSE/TzdDcWdJnOXLS8/RM/Onduk7b+rYI1YOj7iLB8JRljNKQ7gDs+i1yZ0vW902F24lMHNGYDPhhPgBBsJcV2vnJvdhhJqKrc4ACn50ppNlDzTo9PN5U6h0zbpCS1MChPz2YAscrqczGEqSDovMWfyx2L32bqhG35fCA54VAEMBJ989VKG7u/WtD1IjHtSR8q5vh2Dut3Oz7vDWUBzkjzwz+qGi/AzqD0wHfUiJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X08nBsRMYIb0Bj9JFt4qF9FtAnmWjIc5EVKmDvKT6s=;
 b=N0mFlSHfYiMegIQJiY7LlvL/auR9lCRRS6VKZYIgtd74cOS4JXcYJw7lROytE1tYMJGpkUHdZ9vPQbBzMjEh2HsNRXCuSBuwG8fGIZZI1g2SFcEPyF36p477idsm+OaYwNsahDVfDTOERV5y+hH35A55V2JzwH3Wm9muDvE7hVc=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by MAZPR01MB8910.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:27:04 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%4]) with mapi id 15.20.8583.026; Thu, 27 Mar 2025
 11:27:03 +0000
From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Nikolaos Pasaloukos
	<nikolaos.pasaloukos@blaize.com>
Subject: [PATCH v2 0/3] Add support for Blaize BLZP1600 GPIO driver
Thread-Topic: [PATCH v2 0/3] Add support for Blaize BLZP1600 GPIO driver
Thread-Index: AQHbnwsqtVjDC9q7okOSvaMO525NaQ==
Date: Thu, 27 Mar 2025 11:27:03 +0000
Message-ID:
 <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|MAZPR01MB8910:EE_
x-ms-office365-filtering-correlation-id: 222d5605-d61c-48fc-0c43-08dd6d224c8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1ZqZzNCdGQ4Q0U0Wi9tai9VcHdNTC9USlNtalRUdjBPSUJ1OWNGVkxGVytF?=
 =?utf-8?B?VE1XK3o3ZVVZQU5tQVVUNS8veUcrSnZ3UWsyUkRhNVlxV0hyWGVKNFl1NGho?=
 =?utf-8?B?U3d1S0pOVW8xNU1mYXVERjVVSVVTQ3EzK0hkNzlxMFpab1NJS2JyZjdMUTEw?=
 =?utf-8?B?MnJaUXpsRXMvRC94aUkyQmptTk1DV1NOLzFMR2ZGdC84d0pEelQ1QytnY1V4?=
 =?utf-8?B?UmRCQU01bVZ0L1F5RXk2UGp4dHZ2U3ZHbWlpM1dkek5JZ3RpanpDbUJtK0FN?=
 =?utf-8?B?cWlIbnlmdkR4SFlvaUw4QU11dVVWYXZweWIzZHNUcmlMNStBYlk3TUxJOXFO?=
 =?utf-8?B?bFg0dlBYSjA5NHlRdXIvZFZ2cllKaE9VUmxGdERqS25OdDVHeXppS1BIYUs0?=
 =?utf-8?B?RHZZSGovV1laRGxKY1R2Q1RBVDAzZTMzaXZDOFAwM1Bwby9BditXaFJ4UFB6?=
 =?utf-8?B?Y3dRWGNoWU9kQzZNVGdVSTZEdlVaUU43YUFGeXgyNlNpc2xyQ3pUVjdUd1ZH?=
 =?utf-8?B?YStta1U0UjIzT3ZWbTJhYW02S0NGZDlTVlZPQ0ZZdVoyTjRrRmpmYnZRV3Jo?=
 =?utf-8?B?QkRKc1VlSTBUeE15a2toMGZjZzRPRmVCSmZvNVFudy8yZmZxTHVocTdDMGNt?=
 =?utf-8?B?VUZwRkxweXFVYUh6bno0OWlMRlJIcVM0QUVSa1d3Z05tS3ArKzE3ZTMwYWpz?=
 =?utf-8?B?eEpoc0tPTVRLNFM0cXBWeXozS0VnbjQ0MWpLbVlGbEhkYkNOcStPRXFZcUoy?=
 =?utf-8?B?RXZvSjlQdWd6L21aZXlzYlNIVmFsWjZUSkJKOVI4T2JCZHFBdkZRb0FUTWZm?=
 =?utf-8?B?MGhHK255UUpoWTZGVUNLbmE5QXdvV29kanpFMk10aVljbVJRM2ZqeFB5TGJt?=
 =?utf-8?B?djAvRjkwMG1oc1NySGQrQWJVWHNydTJLbTJEUW55MElZQ3JaMm1tTk9JYkRo?=
 =?utf-8?B?UmVJSS9lcU9BMUdvUHRBN0lwc25pT2p2c2VsN0NYcnRpWFBKaHRWWEliZm5H?=
 =?utf-8?B?VlozeldHenJGTnVIK0F2SHA1NFFZS0FiKzRrcEFpZlI3UmJxeWtha3pORDlZ?=
 =?utf-8?B?bTk5WGUxRHhVeCtrS3gyckhWMmo3KzB6RUpmalFCb0dLaGVFbXVRZHNsS2xN?=
 =?utf-8?B?UnpEZmxoSW9HWnM0ZzVBWFlacFErOTZYdWF1MnEyYlZxeXoxdmQ2MGY5VUlM?=
 =?utf-8?B?N1NPMkRtbTkxMlhHbEhxWFVHOUJQYkgvNmpYanRHemIybHlmR281RGN1aEJl?=
 =?utf-8?B?SVVtYnJsRDJBNE4yc3ZMaFdRYUZNdGw4dDBkMm9SNmtTbHl2UFZuaThOTVRC?=
 =?utf-8?B?OWNPeGl3VGx4elI3NnBJam05ejJDcmpqOTFsUmxtSXNWRkZaRVB1Q0hZVFp5?=
 =?utf-8?B?QkJHSlBOVWRyOTkxaXREb3l3RnlXd01CdDlKMW1YSUdWWmlBb2VzK0ZMRmhx?=
 =?utf-8?B?K1hzME9PQnc0NEVGZlNKNER0blhaYTM1dm96N09QcmZpamxXemdYa2xmblp2?=
 =?utf-8?B?R0J0NnNicHFiLzg3ZlpKTVhXMVI1OVRqSjFUZlNvOHFsdjNGR3ByL281VVlE?=
 =?utf-8?B?Y2NBTlg4ZVFnYlRFVTJacENPQ1orNnYxQldXNDZMd3hva000djZqR1NWV1kz?=
 =?utf-8?B?d1RqLysyRWhkd3cwaHAwS0Rpa0xCc0pKb2pURDNBT2VabnhSV1pLMlJrbFRH?=
 =?utf-8?B?MzJ5UEpOanBMdmxJMUhUQ2ZsV0loSXVjL3dHMVFPZDFMZW5BRFJTL2VqNERh?=
 =?utf-8?B?eWZQbjFYVk8yMEsxM0FodkJsQmxCMVYxWXYrNlpVNkdzcGVuSGJ6S2hBMWdH?=
 =?utf-8?B?a1dnWkhlWlo4akg1WmlnZUl2eGZraExmdGVqd3djQlpTU1FvZlBtRlIyNjRD?=
 =?utf-8?B?RHRhY3UzMDF3dFlvWTJHeDJtRHpxOVd2NFJ1dGEzYWN0QlVDYUU5bmhILy9L?=
 =?utf-8?B?QTJrUGhmZW8xRXg1N0FxU0laS3kxUmxtNCtxTGZ5a2xVUjRtQkZ3WXpRSEIy?=
 =?utf-8?B?RHhtMVJkd2J3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGFhaXd1ZU1YZDJ1c1dsRXFXUlFrVHZyRjdsSFdpcEpqRW1vNVhUQ0gyTFBC?=
 =?utf-8?B?S1ZzWHE2QVpWa0kzVWFiVWJncWZ6cG9ZWGRFdU50ZmExSlRXT0FHaG9QYkx1?=
 =?utf-8?B?UFI3STNCaVZaYmV6RjBMWGhqODNvSVNpN1MzNFZvL25DdlZLSkVuQk1GY1g3?=
 =?utf-8?B?c2JoQ1BXL3ZnNWVLZjVOWWRtOHBOU0t3V1BxYTlkRUpOWVIzcWdjaDZmKzh3?=
 =?utf-8?B?R0ZxRGxTMHVkdFNDTWpXMG5VNFVjeDRmbm53ck1aVENRQWZSMXF0Nm9nVW1Y?=
 =?utf-8?B?bXZLWk0rUk45VGNYZWc4Y2gwMG1Zc2RvS2NIdFNyYmFYcjRTOEJyOUsvanlP?=
 =?utf-8?B?R3ZSUEVMaEVxZUxPMUFZeksrd1VMVUhwb1pDUHB4R1FiZlQrR0greTRwTVR1?=
 =?utf-8?B?UkROWTBicVkzd2kzazBPZ21hRG5MVDFJRHhuZm02NDdzZXQ0aGxUTXZMMjNj?=
 =?utf-8?B?bnBGWHFVVURFNkJOWWhhTlB4ZHU2a1o4ZzA0c3g2TVpRNzRtYzVzWWVuRGh1?=
 =?utf-8?B?Vmo4WXhjMDJJUXdONkgyNGo4c01ZcTI5cHAvbmpKRis1UHBwdjc4eHN0VWZ6?=
 =?utf-8?B?RzhFbnViUGpYUGVzanJQN2Y5RVd3TExpV1hGeVNpbEZMSWRiQVJ5ckRRdXht?=
 =?utf-8?B?Z1VlYjI3MDdpYVZQTGRLcnVueEFONitRaXV2N21WZG9rS2ZNOEdKcmpVQUpr?=
 =?utf-8?B?U2R6ZnBqb2dDblNuUHdsRGFHc1pHc0R6bEFCYmE0d0cwNi82UTF1VXRLcDJD?=
 =?utf-8?B?T2ozdVBYaUdmZ2VoUzhKL1IvV1p0L1cxYTdNK2d1UVNqMVhNRmVzcHRiRHI5?=
 =?utf-8?B?OEdYclNVNzRRNFFqZXU2dkRjbFZsditrVzk0MUVHRGRyNW9WMUZ5a2FLRzYw?=
 =?utf-8?B?U3c5UjJkeU02M1MvN3ZwZ3BRMGJzMlNiSk5Bc2NKdmJORkdrYUQvLy9FU0pi?=
 =?utf-8?B?WmNNeW1MbkpuSFdoN0hvTk5IYW56WmMyeTF5ZC9TNTB1WUd5RWlSM2RNcmpp?=
 =?utf-8?B?ZUZjdXpTOXNZWVNuNElubXVKckQva3YwSUIvTW42dGRhdkNUMlZjVFVqRU9s?=
 =?utf-8?B?Y0RVY0U5TDgwdUlDWk9IeUt4dE5ia2ZiaHppQTgyb2lXKzBEYXFrUWJzSXYz?=
 =?utf-8?B?SjRtZHVMUEhPVUZDNkZxVjNTVW95WlhyY2RSaHUzM1dIaHRsRG1YQWs3Ylpj?=
 =?utf-8?B?N092YVpGUUNTbk1uT0FSd2FodmczVjdnYUR2UE5SSXF2T1VNZ3MxMG5yd3BS?=
 =?utf-8?B?NU84a3Vac0dhTGJDcWEybjhkTnNWTGx6ZEpCRjRZZHJCdDI0MWVTcC8reFpn?=
 =?utf-8?B?TEUyamgvcVBTNWRQQnVUQTc3ZjNlNUlLd1ZLN2hUVXltNTNra2NqT0E5bUlP?=
 =?utf-8?B?a3R5UCtmNysrQnhYZ1BpSm1XdjgwMjhuWXc1L1BIWi9kUkhrQ0xBTUk5S2NF?=
 =?utf-8?B?d2NpbVNTNGVlZ2p3dXFaN01mRTQvaGVtdzVHVHZZejhobjFtM3hENGNWcFVx?=
 =?utf-8?B?ZUNURU1sZTd6MnAydmJZTHl3MUc4ek1ac3VmVUVjT0NMR1h0V2JQQWlVSmY1?=
 =?utf-8?B?ZWNCVnAvSmJ1MWJrYjhWK3FpV1BOcFFBOHhaQSt0UDFDZVlvS09HOU1RMXcz?=
 =?utf-8?B?dVRiSGVqSGJtbkNEcDRudkwvdnFaNG9kOEh5VnVUeFpMVXppd0l0d3dzQTNU?=
 =?utf-8?B?bWtiakhoRmdFZ2dXYWs2WDNCZklBS0g3R0g3QzFRc0hJUVRCQmduZE5ic2FQ?=
 =?utf-8?B?VmU5dnRRbnZVc1ZPMFBhM0RHOURDaWhzSzhWRkhlQnNkcDN1MnJyNFgyOXdH?=
 =?utf-8?B?MDV3aXM1VnlMTEx0ejFRcHYyWCszWis0WXBaK0FGcnNITFp4Z0p6WVQyak9m?=
 =?utf-8?B?U0llNFZXM0VvYUR4M0hsOElDdHUxY1NFNmFGa1psZUlzK3FMOGlSNSt2VG1H?=
 =?utf-8?B?d0dmeW5lemxick9nUDA0RkdyMkZHd01qSUpQQjMwUEltU3VBSWpzdVBmVEVn?=
 =?utf-8?B?QlJQdmZXMWl6eCtGWUdEcTFVZkh0dzlwREQwRXc0N1U3OHk3UTFyZTA3dHJk?=
 =?utf-8?B?c21hbXBxdVdOT3VqMmhUUHhUd0dFelcwSG52b3VudGdoTS9mS1hJbUdzYVox?=
 =?utf-8?B?TEF2L3FqaHRDRGVwSDcxWVBscDBrcjZWNE1uSm0zcjVBdS82N205WjJteS9i?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A30A95FC05193041891336B915AE2307@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 222d5605-d61c-48fc-0c43-08dd6d224c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 11:27:03.6747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xycFSBWPzqLczZI5Nncm0g0rHkOwhX4/78qUGOG2x6dcXYF8JX4LOFwb/lPJhPJR9670vg9xpNTQ6g2EPpbCAHxsOzjOQU/1c0rLLvuXlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8910
X-Proofpoint-GUID: 1DjZlkO5FIGVGRES6xneFKFrFVhxsxw0
X-Proofpoint-ORIG-GUID: 1DjZlkO5FIGVGRES6xneFKFrFVhxsxw0
X-Authority-Analysis: v=2.4 cv=JvjxrN4C c=1 sm=1 tr=0 ts=67e5361a cx=c_pps a=5CkbgoO2JNAQOP1ij0Zt3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=-5LYVjoNHPMA:10 a=VwQbUJbxAAAA:8 a=SrsycIMJAAAA:8 a=4BuQaiKR39yFMr42yb8A:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Reason: orgsafe

VGhpcyBwYXRjaHNldCBhZGRzIGEgR1BJTyBkcml2ZXIgZm9yIHRoZSBWZXJpU2lsaWNvbiBBUEIg
djAuMg0KaGFyZHdhcmUuIFRoaXMgY29udHJvbGxlciBpcyB1c2VkIGluIHRoZSBCbGFpemUgQkxa
UDE2MDANClNvQyBmb3IgaXRzIEdQSU8gaW50ZXJmYWNlLiBJdCBpcyBlc3NlbnRpYWwgZm9yIHVw
c3RyZWFtDQpzdXBwb3J0IHNpbmNlIGl0IGlzIHVzZWQgdG8gcHJvdmlkZSBzaWduYWxzIGZvciB0
aGUNCkV0aGVybmV0LCBVU0IsIFNEIGFuZCBtYW55IG90aGVyIGludGVyZmFjZXMuDQoNCkFkZHMg
dGhlIEdQSU8gaW50ZXJmYWNlIHRvIHRoZSBCbGFpemUgQkxaUDE2MDAgU29DIGRldmljZXRyZWUu
DQoNClRoZSBoYXJkd2FyZSBpdHNlbGYgY29uc2lzdHMgb2YgMzIgSS9PIHBpbnMuIEl0IGhhcw0K
cHJvZ3JhbW1hYmxlIGludGVycnVwdCBnZW5lcmF0aW9uIGNhcGFiaWxpdHkgb24gdGhlIHBpbnMu
DQpUaGUgaW50ZXJydXB0cyBjYW4gYmUgZWRnZSBvciBsZXZlbCB0cmlnZ2VyZWQgYW5kIGl0DQpp
bmNsdWRlcyBhIGRlLWJvdW5jZSBjaXJjdWl0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBOaWtvbGFvcyBQ
YXNhbG91a29zIDxuaWtvbGFvcy5wYXNhbG91a29zQGJsYWl6ZS5jb20+DQotLS0NCkNoYW5nZXMg
aW4gdjI6DQotIE5vIGxvbmdlciBhZGRzIFZlcmlTaWxpY29uIGFzIGEgdmVuZG9yLg0KLSBSZW5h
bWVkIHRoZSBkcml2ZXIgZnJvbSB2c2ksYXBiLWdwaW8gdG8gYmxhaXplLGJsenAxNjAwLWdwaW8N
CiAgQ2hhbmdlZCB0aGUgZHJpdmVyIGZ1bmN0aW9uIHByZWZpeCB0byBhZGRyZXNzIHRoZSBuZXcg
bmFtZQ0KICBSZW1vdmVkIElSUV9ET01BSU5fSElFUkFSQ0hZIGZyb20gS2NvbmZpZw0KLSBCdWls
ZHMgdGhlIGRyaXZlciBhcyBhIG1vZHVsZSBieSBkZWZhdWx0DQotIExpbmsgdG8gdjE6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAyMTIta2VybmVsLXVwc3RyZWFtaW5nLWFkZF9ncGlv
X3N1cHBvcnQtdjEtMC0wODBlNzI0YTIxZjNAYmxhaXplLmNvbQ0KDQotLS0NCk5pa29sYW9zIFBh
c2Fsb3Vrb3MgKDMpOg0KICAgICAgZHQtYmluZGluZ3M6IERvY3VtZW50IEJsYWl6ZSBCTFpQMTYw
MCBHUElPIGRyaXZlcg0KICAgICAgZ3BpbzogRW5hYmxlIEJsYWl6ZSBCTFpQMTYwMCBHUElPIHN1
cHBvcnQNCiAgICAgIGFybTY0OiBkdHM6IGJsYWl6ZS1ibHpwMTYwMDogRW5hYmxlIEdQSU8gc3Vw
cG9ydA0KDQogLi4uL2JpbmRpbmdzL2dwaW8vYmxhaXplLGJsenAxNjAwLWdwaW8ueWFtbCAgICAg
ICAgfCAgNzcgKysrKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2JsYWl6ZS1i
bHpwMTYwMC1jYjIuZHRzIHwgIDM2ICsrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYmxhaXplL2Js
YWl6ZS1ibHpwMTYwMC5kdHNpICAgIHwgIDEyICsNCiBkcml2ZXJzL2dwaW8vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArDQogZHJpdmVycy9ncGlvL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvZ3Bpby9ncGlv
LWJsenAxNjAwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMjgzICsrKysrKysrKysrKysrKysr
KysrKw0KIDcgZmlsZXMgY2hhbmdlZCwgNDMwIGluc2VydGlvbnMoKykNCi0tLQ0KYmFzZS1jb21t
aXQ6IGZlMjI4MGQwOTRmOTUxMDVhMzYxZGM4OGUwN2IxMDA5ZDRjZmVjYTYNCmNoYW5nZS1pZDog
MjAyNTAxMTcta2VybmVsLXVwc3RyZWFtaW5nLWFkZF9ncGlvX3N1cHBvcnQtYjRjZTA1ZWZmN2E1
DQoNCkJlc3QgcmVnYXJkcywNCi0tIA0KTmlrb2xhb3MgUGFzYWxvdWtvcyA8bmlrb2xhb3MucGFz
YWxvdWtvc0BibGFpemUuY29tPg0KDQo=

