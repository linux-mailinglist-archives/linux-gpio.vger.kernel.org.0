Return-Path: <linux-gpio+bounces-38162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tphmBiPbJ2rf3QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 11:21:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BED65E457
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 11:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38162-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38162-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B3F7301C647
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 09:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6F23F1AB7;
	Tue,  9 Jun 2026 09:13:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2139.outbound.protection.partner.outlook.cn [139.219.146.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3638332A;
	Tue,  9 Jun 2026 09:13:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996433; cv=fail; b=ahtnC3J/PPONxdsMcO4Ic8HENL4KtmmeXH1j6+EuJzLEElOrJvNjEHSTZFbRrVxOnuCvUQpq7vIcHyVI7sV24HMpJE9WMBdrTygCR92+Bd6RQivEN2z5r9AKNNBcWTTz4sp2nlX68XhdaozViIc/QGocDy0KVrf8AGWJaNrTg18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996433; c=relaxed/simple;
	bh=82+AfVPcJ1ejgkuxD8IkmJXCk7yzXy+q4XlrX2WU518=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IxsqSsUCC7a1N29H1Vo3a37I3CWJW0Jz+Kh2fCa0GnDp7wVApXVzEzGomb3a5sUidTIfzWhgvUge9YvxKuyLuN82x5ce4hSlCwM6wbh6h/xXZQkcFJBMS3+74sgO1s5k/RQMXhU1JNra9yhZ7UcDxevoki9ymwxKej0PiB8EIM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJwG9jCfeL6yxAJY5EpCAO+XA3R8SnAgG1f8zT82tk6xz+pTQlqdTjwCCJfhTpEqykNAHl9uTzYc1Z7uMpj+ls8ljzaCmtr0CXrZ8LWlcEph3+KvsLilBwNXNPJmHO1JtJ8wY+/Urm7VXDRz6PJ66RDpVQs32s1K6wltCRI7jaCezIvlZeosu2dyWG3CiTDjm6kD91ObK9okbIbHlK9zr7dG8gdxjyBoepRvZAsFMIrUH+wYLuDRILJRo4QnTO7lsUtwdfiePOT4IXprAn0RzgsbiTiFxoS61LP3mx0VnIizoFzGTrkuHhjDnDplJ2XFpvJ26k/+2t4zIDmcZbj/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82+AfVPcJ1ejgkuxD8IkmJXCk7yzXy+q4XlrX2WU518=;
 b=Uw2D/69XAotJADTZupTUPyVNWPCo5oDRtEiT+nkJIiovW9E2DMcrnrM2PVQ6rKxrQ0dtbhw6KokMkfLW7BQbOz/66T2tq/nH7ZxOfKuNU1rDDw1NFe5WGr/0xuj0K0MaWBj+nKkABHJ/SZZBfVMjeHn37J/7KmB7P14hiakMBxoioDyTFvAcBHsxHEM7t9lvq/n2Z+M91WJnqSzLQ4PD8PO/BxtMQacUPb3tWNrQK9mSFY3jeq/bdZB4cc1+hHeTUrQWWTCyALne167Mgkbtw1zZoAtV3xdtZpDo9vPXrOp+4iTdEp8glZwyi8jGlFBx+gUr0HOGrzP0szzyueLTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 09:13:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.011; Tue, 9 Jun 2026 09:13:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
Thread-Topic: [PATCH v3 18/21] pinctrl: starfive: Add StarFive JHB100 per2pok
 controller driver
Thread-Index: AQHc8x1tp2Au4C5gdUyj+dl+vOcD87Y0xL0AgAE1iUA=
Date: Tue, 9 Jun 2026 09:13:37 +0000
Message-ID:
 <ZQ4PR01MB1202592BD39A138751CE14F1F21D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-19-changhuang.liang@starfivetech.com>
 <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
In-Reply-To:
 <CAMRc=Md1z52A_JzMG=3Ce5nN-HMvwH0TO=t2jEqC3kdCQK8EwA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
x-ms-office365-filtering-correlation-id: 24535645-a37f-410d-94f6-08dec60763ed
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|18002099003|3023799007|56012099006|5023799004|4143699003;
x-microsoft-antispam-message-info:
 NfK16NmSn3k6wQLzyUxOG+4eiCTUlc4uqv5JIYEBBjT/Cc/WCUrr1DWdtUkGCQSbOoXDUyqZyR/C3yKYln5k8QvmdP4r3i7q6WaQrQ+ZS3N6hldXY6fjHPqppuWbUzvwhKx2zMPL5AQzCSu/6Pp2wV88zustfnpHzyneqEnkdxpElnoCYnEVVA6HRInsiqLYkOdtd5Km5bK7cruezLZ1O77w2uS/dpt5euxa8AzfM3c8R23jKric3KLsEYA/oc0W7/wGlWvo2DkMBpPt3NhxDh2gm/7Dwhe/Ir3kqskE+HiVwDMzq5AVCfcaPhP6V687B7X7AB12grBzAfjGMDgEekkC2jFPCS/sXWAM7c48urKShtMroNFXN6CgHaBDUqfDk+DNW/dkENfrNMASwKZCF8y1d8whE7bkVSJcvowK9gbnOReM4jbmb0FA9ZJnCW7eFgRRNIs31lXuxeeCJMusEbXD4Vqxldv1G9VyldotfcHRbiypYIGDNEWx/RWzFddI9LjmDG1iuz1nPHNbbSVQyNT6jJ2B92SJi4sVY5pgn3m09HElxoNodQCZrVr1/3hI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEgrSTAvdlMvajhmVVcvYlZiUDJjZDIxQjFNdFl0eTRRWVFBSStXM3grRkNO?=
 =?utf-8?B?aFBERU0wSkx6NXN6UEdseU5lMU5BekJUdk40YTcwQkJPVTVGOUlvVkR0VjQr?=
 =?utf-8?B?ZGJpRFl4ZTZqUkI5R1JXQTFNbW1PR1NNRGxSZGxOZWRkMXRNNXVOampnWmx2?=
 =?utf-8?B?S1U2b2tkWWt5ME53QTBNOTJhajJYMENVcWRGMjdPKzM0aE0vSnhYNmxmWnA2?=
 =?utf-8?B?WXRwS0EyK1ZlR2pjYnpETlBVWjA2ZkF5Wkp1TEU2elZIK0ZPYzl2bDcycW56?=
 =?utf-8?B?Rit5SVNxUVVwc2hwWmNyNjlBQnd5K2FaRU1hRThrZGlFeTFzckFwRTB6ejFv?=
 =?utf-8?B?cXhVRFNaWkJscWU1Uzdham9neGtwaDBsSEZJNnJwZnZuU2hmVDY2TmFObDN0?=
 =?utf-8?B?eis5NTVtT0YzV0lOREJOVUlDYURVeW9RWFFOUU5pdCsrQU9EdSsrckZhWkt1?=
 =?utf-8?B?NWg3K3VxV1g4M25ieExmaThrUCtNM21JQ1ZlZHlEYm14T0hjWS9JL2k3b2J1?=
 =?utf-8?B?SEtqZGordlBQSU1DODZERjZ3clo4L0RNSDdJYjNEcEV5NkkrWkpyVmRsNUhQ?=
 =?utf-8?B?a25GTUFkdEpHaVdpWk1vejM5V2hUd01aREk3MzA3VnR3SFhMeUthVkdaQnYr?=
 =?utf-8?B?VHZ5dVNMaUJXU2pZVlV3alAxTjVicnZOU2NkdlhTZWNQbEpQc2R1RFpRd3cy?=
 =?utf-8?B?VWg2WGtzMFdaYjF3dS90QWFLWDgvRkg5am5lUEtZYlN1S0VnbWxmSk9haC9Z?=
 =?utf-8?B?cWRYYkxyclhCME04VUhRUi80d25oQzBFNDhzMGp4czNjOFl4bXQ0M0cxVXhW?=
 =?utf-8?B?WVoyWEJDM2Z0bHdvNGNnck5EdTJiNUM0cHRNSkU1dDBsaGFJWGVBbGhhQitw?=
 =?utf-8?B?QTQ1eFVWYWsrSndtZjhBR1hmMC84N0VTOEV6Z0lIcitkSWMxcG5aRWJqODdu?=
 =?utf-8?B?VVRVZE1yR3JUamRvbFVMMi9KQUljT05qN1pFaU8zYXZKMTFvOXJSMUJzSXNS?=
 =?utf-8?B?WGtxbHNvSkJubzNFLysrdHVLVThPUnRGRDZ2U2xhQU9qME1GellKVHA5WUFS?=
 =?utf-8?B?cEp2L2lYNlZaZVpJbzRKNlZrcW1xRWY4eFR3eFJVTjR2eEFCOGUrYVVGLzRS?=
 =?utf-8?B?bEZsZnV5WDhENHBMdnU0VmVpZVRRVmRBd2d3MEFUVHRzdjFrYlIyNXYyMklv?=
 =?utf-8?B?OTRRei9TNUswZ014eCsyRWZCYXgrbm13ZkFtMkZsenhyZ3F4ZStNc0pCSHgy?=
 =?utf-8?B?bU00dExCVGwxRGtwRjFQejhteER4dWRvWEZlVzVGeTdxZmR1dURqenFRRmZq?=
 =?utf-8?B?dThCQnk5QURtMVZYLzNaQWVybG01Vm0rZXFyeTZ2a09OcStWUndEK3gwZHRt?=
 =?utf-8?B?OER4VkpUb2FqTDFuWUlERlBIakc2Z3hYN1VSelpKeURxMEdNSnpXOEwxNmpN?=
 =?utf-8?B?cGh5cDlPOEZWNFRIN0Q1VWd5aUl4QnJ2RlpuOEVWdmF3SGhWY1cxdm5aOXFE?=
 =?utf-8?B?QTFFNjhYVkFQeGlLTjBOY3lQam5xQjJRajAraEdmbTNhVTNEdXlXMXhkTEt6?=
 =?utf-8?B?UEloRzIrWXdBM2FiZXVEdTRVUzIvZjhwUVhDd0VsdWE4MjZGVk5oNXVzUExT?=
 =?utf-8?B?R1p0a2UvSjVlNDgzeHBtRk1OMVJXYjJUdkx3V0xsNEhlQXQvNXgzNk9rVmJo?=
 =?utf-8?B?UXNYeEhPdUMydzZnRkl6c1dSSmY2SXppNktSckdEdnM0Z1JQUmJ3U0k2azYr?=
 =?utf-8?B?dzlpdVY4c21FVGJEVnpjT2haczFrM0JvaFBWb1lDL1FxUExxM1llQVlRbGV2?=
 =?utf-8?B?ZjRKTXluYTBNLzFvbG5vdjBzazFtSzFMdGpKOGZJTC8rQ3psZStDb1JmNWZH?=
 =?utf-8?B?M3B3ZHNzM2hxc0pkSjBJRC95UjI5UDkvVDdYWWt6TlQ2aFhpWDlOcFZLY3lG?=
 =?utf-8?B?c2lLeTRPaFJhYkVSODdDMXdXeGZDZVN5Q1dTZ0hqRGJoVjhPcEt6aG1RMkxn?=
 =?utf-8?B?M2ttbVZtVDhUZTVVUXZJbkxvSjNvY2M5bWQxVDVoUWlKOXhiOVA2OG1qYXFY?=
 =?utf-8?B?REszdzhURDhPVUJCcW5TSlN4aEJzUm1aNTJxZGI1V3htZndPTzNuQSsvVzJ0?=
 =?utf-8?B?R3NBYTVxaHlXSkxGalZheDIwaVdON1AvUG9ja2lFMlZBUkhRR1VZM2pZRFZD?=
 =?utf-8?B?UlV1b015bVBZbDUvZE14RGdhc1ZYUDhlbjR1QVpHYithY2tidUxuNE1ONzJz?=
 =?utf-8?B?SEczckxuQkRZQngwUGlIMmlPOUZUMm41NlNqN2lmdlRsYWRtaW5LN0pSSFJ3?=
 =?utf-8?B?bHhZbHBwNzRCQm5LQW0vSGJVdS9ta1Myc2ZqUU5mVWZEdGNDNHB1Wjd6ampO?=
 =?utf-8?Q?7ztXOaLNRuCsx+1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 24535645-a37f-410d-94f6-08dec60763ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 09:13:37.6523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cttVYhBY+VuevdqtMAyeuojwg2ZB9xkKjNeuPCKMeyPKJsMSZ+inlug6/hQUaZNJ7qGn2XqkuAFXP7lVFgDdnQNadFsTgx0WML7Y1S36bVV7aEB6yec1myap89J9w7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38162-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,starfivetech.com:from_mime,starfivetech.com:email,ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93BED65E457

SGksIEJhcnRvc3oNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIFdlZCwgMyBKdW4g
MjAyNiAwNzo1Mzo0NCArMDIwMCwgQ2hhbmdodWFuZyBMaWFuZw0KPiA8Y2hhbmdodWFuZy5saWFu
Z0BzdGFyZml2ZXRlY2guY29tPiBzYWlkOg0KPiA+IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgU3Rh
ckZpdmUgSkhCMTAwIFNvQyBQZXJpcGhlcmFsLTIgUG93ZXIgT0sNCj4gPiAocGVyMnBvaykgcGlu
Y3RybCBjb250cm9sbGVyLg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBMaWFuZmVuZyBPdXlh
bmcgPGxpYW5mZW5nLm91eWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IExpYW5mZW5nIE91eWFuZyA8bGlhbmZlbmcub3V5YW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2
ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvS2NvbmZp
ZyAgICAgICAgICAgICAgfCAxMiArKysNCj4gPiAgZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL01h
a2VmaWxlICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICAuLi4vcGluY3RybC1zdGFyZml2ZS1qaGIx
MDAtcGVyMnBvay5jICAgICAgICAgfCA5Nw0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamhiMTAwLXBl
cjJwb2suYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9zdGFyZml2ZS9L
Y29uZmlnDQo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvc3RhcmZpdmUvS2NvbmZpZw0KPiA+IGluZGV4
IGVkYzNiNmQ5YzhkNy4uYmY1OTE1ZTBhNWYyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGlu
Y3RybC9zdGFyZml2ZS9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3N0YXJmaXZl
L0tjb25maWcNCj4gPiBAQCAtOTEsNiArOTEsMTggQEAgY29uZmlnIFBJTkNUUkxfU1RBUkZJVkVf
SkhCMTAwX1BFUjINCj4gPiAgCSAgcGVyaXBoZXJhbHMgc3VwcG9ydGluZyBpbnB1dHMsIG91dHB1
dHMsIGNvbmZpZ3VyaW5nIHB1bGwtdXAvcHVsbC1kb3duDQo+ID4gIAkgIGFuZCBpbnRlcnJ1cHRz
IG9uIGlucHV0IGNoYW5nZXMuDQo+ID4NCj4gPiArY29uZmlnIFBJTkNUUkxfU1RBUkZJVkVfSkhC
MTAwX1BFUjJQT0sNCj4gPiArCXRyaXN0YXRlICJTdGFyRml2ZSBKSEIxMDAgU29DIFBlcmlwaGVy
YWwtMiBQb3dlciBPSyBwaW5jdHJsIGFuZCBHUElPDQo+IGRyaXZlciINCj4gPiArCWRlcGVuZHMg
b24gQVJDSF9TVEFSRklWRSB8fCBDT01QSUxFX1RFU1QNCj4gPiArCWRlcGVuZHMgb24gT0YNCj4g
DQo+IEkgZG9uJ3Qgc2VlIGFueSByZWFsIGRlcGVuZGVuY3kgb24gQ09ORklHX09GIGhlcmUsIGFt
IEkgbWlzc2luZyBzb21ldGhpbmc/DQo+IFRoZSBPRiBJRCBtYXRjaGluZyBpcyBhdmFpbGFibGUg
ZXZlbiB3aXRoICFDT05GSUdfT0YuDQoNCkkgd2lsbCBtb3ZlIGl0IHVuZGVyIGNvbmZpZyBQSU5D
VFJMX1NUQVJGSVZFX0pIQjEwMC4NCg0KPiANCj4gU2FtZSBlbHNld2hlcmUuDQo+IA0KPiBCYXJ0
DQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

