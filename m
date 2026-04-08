Return-Path: <linux-gpio+bounces-34900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDuDB/qj1mlUGwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 20:52:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926C3C1CFC
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 20:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 264E8314FE77
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 18:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674C33D890F;
	Wed,  8 Apr 2026 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="MGwnvsNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0089.outbound.protection.office365.us [23.103.209.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF035C1B2
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673295; cv=fail; b=XWYUd3pDmCzbjTh2EJRAX60wrmI5+ZbqxT/cYlyJBmcXBFObAT+V5LUffmV8w6v39H2JJRzTe96i/9VhNWpx61eKkqAbXAj92RWmYzjjG1PHHMitwH9MJhSavd4TYa48UQSzvhtcNzT2n62SZzmGHgMmH75eY7lVjeKMFb424KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673295; c=relaxed/simple;
	bh=WC46cDjfrkHchCJ0MmEG0c4wWxksafFYbjHciJMRWII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oMDU8z5ZzuwVW9KWjfhym02lUDWcdKiXGtV2ArxWRj3eJ7Isp37BfwpkL4j8+kZ6VAA5+NIZiaN4Dx+/SQWNvhlCJQQG+Rj7lVlp0J76IIH9d5txDnhhqeSRcJKjpL0UVDjCTPoNAeQ7y335JDeIzYFeR4TaERuAYTTDngMS31g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=MGwnvsNV; arc=fail smtp.client-ip=23.103.209.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=sUs3EnbeXDkBvuKETgCMGj9fvOMxoCQnIs+uWepT/4Xz5lnbLZbLNAkGRM/9JaHdnn+kmP+7RymGmefUrS2ngI9YLNPZJzqvWKn7P4XISH7f1UII9mg5T6G4Ub+3KIS74XOoVsetw3BIKxeWx/IAMWVtxcSgiFKCZLrFA2YcmaAFXYpGJEY7jYfYjf1GX90yJ3IKSeGZaw+8mxTmdV9f3HQagVo+kcg7nPFpg/2JRRUwaO3qgmpeg4CGWQ7WNrFC5NaSslZGcvNNEGYPj+9CCFUDs8MFnlVli0UgTFjtZ/nv1wckwG9zBRZ1zh4t82TG1jxxJNDH2fLqClsneLS7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC46cDjfrkHchCJ0MmEG0c4wWxksafFYbjHciJMRWII=;
 b=GeLRVSrSE3HTDEdodXaN/CBU7Me1RhabqqvZyrQR8pQQ8J1DJ0mYFlqz9SUx8b1YfeVCZKBCMk3n/hcyV88ZK+3SH+uN19OVZz+xHpEnQT6IDjtJEOcsKr6z9QWMhgObwmlfAHa0GJUKFTQYBrW0sTeZr9bfxVi4fImW5uC7neS6HBbtVxGcmjx6IycXb+bdwC0ikmbO0UXtkVU4QGFb9HNihW+D3LTGMotGmqexNLQ9g0LsWeozRkkLn7+Um4dOj0+9RFrYUBnmH3u/fEaAVdheop05sHwFB9qFBQU2PJEfo41g9VyxIU6fQ8XXeUQIMcvF3dMxCZivClSZidiRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC46cDjfrkHchCJ0MmEG0c4wWxksafFYbjHciJMRWII=;
 b=MGwnvsNVChs+CIgwRJKZdk27aLCYd/wPzaupDZz9nt0DoOHjfB4g8TYAo7RBzoBgDFq6un1x5iQ/O9WTbcQncXED1SmvJqms84gied9FwANHEXuqsogFrZo2HqRov3kEsal9yJU8nMqU/IuRLAM+7xoc6yWf0oPQQC6V7sr1B9unwnnLd4J8EcIIyySd6ybiKNojZUmGu6XPUXUXiYs/lhQTobQsqXP4tdXkOwAsySaIozP7lhX/afCCNuz6whJT/hE4HumtUSSRwS37cJnat9LiHXg5awCrrgoGKBYz6lqQvpWNl+qG56rlugxvOtnzWPvwgxHO+pKVw59Ty1Wt+A==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB1421.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:192::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 16:03:08 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 16:03:08 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
	<warthog618@gmail.com>, 4fqr <4fqr@proton.me>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: Vincent Fazio <vfazio@gmail.com>
Subject: RE: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Thread-Topic: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
Thread-Index: AQHcx3EwFsoLpJsWy0WZ0r++h9Jk2A==
Date: Wed, 8 Apr 2026 16:03:07 +0000
Message-ID:
 <PH1P110MB1603099998E166048F432FE29F5BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
In-Reply-To: <20260407-treewide-fixes-v1-0-66c9744a56a3@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB1421:EE_
x-ms-office365-filtering-correlation-id: 978b7edf-b137-4177-bff7-08de95885366
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|55112099003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 aew0oDcBBOIB6fw0yk8P752j3w3MIN3adE2GMCZy+O9Gj+koqBLpU6bXJlNJPrKdmrEe9cz3/gDj3ao7baYQUyhULra1gJcuidt9JeqcSpwZCaRRBTgDojbTqAQ70rrsLWxJdu4Er0cs4b1alnuCeOeW+uqnHjaBoY25CyJMupWv3d3D/XiFL3110AQ/BC3O4lRz9S4GCkTmqYS4L/uIhywFxN8A4i6EKtLXcKSd4LH28KgJfqs5mdh59vuGYhP+Be0+OzCgMf+yAgDBuqhSerydhTLXHTr9a/YryJtgX+GYUArWvcqofsXRUEHeNLOQYZhAGG48/EIgaNNnsCgO9CrhLOlT4XTLBGnZAqMFVGROB8VqrxE4cFVXprtn2UKeHgHP1OS0Qv6kSb9BVUlk8AVdXdc1lcLNikvG7mHG5qzCQba6HuKYMmwVnYl2CXaEU2TkZVJG0kumgX1RUvSOxFwaVnh3HVmFsHZuY34zSfzsvVQEGIG7T/4CJM6kxYN9ILZBIv3Rf6yZ/jgEiIMS7DiQRk1d2i3cHr8gPEJBXsx6MnkIKicoAnQ/lWsB2qkTmYyVZRab5jYQ0hp+Szg/ZHfLVIMpPF9kvGMTMrdE/1cw0Lpx622AJ1MosacAlNPBFP6oKqKYv1INVoV78WWQCPYvm8pYgWScbWdX0tQL5kp8kS3Dg+dEKsNXONcX4yvD1KW2/kO3qP28h06zSTpPKXHHgmukOH6yXndJrj2GRC+Fbn1cpBAWC1KE9Y0caouIWujxkx3RITWsUEDebbAUB0fpu5oRstjKzjc49jUiTI0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(55112099003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qv2euLisb4i+pOqm27BRK13Uhrb/ParA7ikUzn2514v5PoPxMvr3+Uj9SIN5?=
 =?us-ascii?Q?/9rn4NVWNTrx2/4gRuD0RjwCCNU/+vZlwNngSFAg4h7D1c30y/2WfqJ1eLuX?=
 =?us-ascii?Q?eeYjlLOrTUxD5xhre2AdQxWIxq+3Jd4SDi4eAjbogyjLYB3qwQ7bxC6oAmJ6?=
 =?us-ascii?Q?WPk/enos5IRyBTSJfeTlLr1PgJV3ZMn2Yfv+C1Ludy/uCpu1yI4ypSU8NTOU?=
 =?us-ascii?Q?1umWpJs27okgDfGhaSaK45SkWNCXLuDPwVV/gRJ5yswyUdL9TewCL5mg8msz?=
 =?us-ascii?Q?1GP3yJWlJPcsp5ML/kjh2WKW7NTvj2mQCn5Qb2FbdF2AhGzwIJcMDtqAh96s?=
 =?us-ascii?Q?A8dtOsdu7HPCDdylqPmI4lMKwnu4xaW0YmBvhM+5lfAMqkg3JoH7r+EhTibI?=
 =?us-ascii?Q?8XAGx+e3M68BpFLGiFqoW63oDqkoGi6Ge4xgMxOEdt1GiZwqmWOqf1hGQ2wo?=
 =?us-ascii?Q?dM2GmtB22ivu1xewHwxhwkl+6wl16cy81JgxS6OyjkoguiYNqZLLEsa/0pmQ?=
 =?us-ascii?Q?nTzVjpooFwcUK3xcKnUTwUrXD6zV5M8nNxGEo7Y6VO6ehKIzxepinKhxL4P3?=
 =?us-ascii?Q?yegeIO/myQzhpD2uFh/F2fcvkPmi68SJCBB9XaOLlQVc8e4on2sJTlQT3du5?=
 =?us-ascii?Q?K8ufJnNyz1+Nzljww1LCkaY9AL3QFyFafVEyDP8MPflY9aNJo75SgiCkAI9n?=
 =?us-ascii?Q?jjDp+5UfstWbjLoJ9H9/PLeRlP2sGfmRP+ciYaV1ySPxRuoh7bs9c9s4zGb9?=
 =?us-ascii?Q?HvOpurHS2Xx2C1M9NwoB/nZhv4gx8fHYqrsoBSKVKLBKBXj7UOxy9sIEeUp4?=
 =?us-ascii?Q?Iq1MHhzItu+3PEvedj9eRGj5V6tRJur2oiHF414Rp2f1RwlTeVjeyNs8Ky5N?=
 =?us-ascii?Q?rHYp11Lk61RqlaLvz6yiNS8SoK1rTKUnEkX6CyqKLJUOWFFpJukbq2I24aIM?=
 =?us-ascii?Q?zx6Ftp5hDas06gPzNHNN6XJPVWR7w8XH7zYodQ97WK1t3imLzpdXfmPcen9x?=
 =?us-ascii?Q?xROa6v9fLBQwCFjBFxQuKjZNIZz/V02/CFCsI7Ud9F6X8EDoNvgouyLSdS11?=
 =?us-ascii?Q?U8xuqexgF9hVodHXzO0kcm11untaUQYmxo7kdnigwhr1QeDRg+fSDCEql4HO?=
 =?us-ascii?Q?zk4C+xn1dxFqs8e0LyZEfqIPDoQyHcN5gY51o2v5mxwYwt9xFGsVyOfnBq62?=
 =?us-ascii?Q?ivVlYHeg3I6hL+PRrrxVmrb/Trx742jBFHUSaqfja2t7tas4f+PmJvo7YlRM?=
 =?us-ascii?Q?z2/k3pLPRO/zqol+css75Gkrritr/iVrOr432wg/yRs2JNFAsSosXmA4F6aG?=
 =?us-ascii?Q?poqfuEbvXxM41AFlgln3/QQA5ZQTk47K0pT24KwMh5iSlfGfbRrCMRKbcQPa?=
 =?us-ascii?Q?TzxF6FJu6kJ2v14jq2ec2bkG9hGV8d6EQK2IBNilXetxzAzRSIE4/QeLvdZ+?=
 =?us-ascii?Q?6kZ9pa7psN63oXldl/FfqNGfi3//etQPpXQH7gNW+duYUv5nM2SN2YK/tVYE?=
 =?us-ascii?Q?6bpQfrP9E/4kB7wAYUHg8+toJAM71VemfmpcxVfjARr1Xv/ZnnE/uEDZv1j8?=
 =?us-ascii?Q?kGXtxqL/ixUJeAaUy2orgTHRJL5N0+jvEAk4lveeiO4cYLz1se2ZVqjOlb2D?=
 =?us-ascii?Q?OFO+bRaLv0/jgaE5Eqxy6fADRSbo4sMmPkVutGm4Ley+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 978b7edf-b137-4177-bff7-08de95885366
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 16:03:08.0186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1421
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34900-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,proton.me,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 3926C3C1CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> -----Original Message-----
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Sent: Tuesday, April 7, 2026 7:50 AM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Kent Gibson <warthog618@gmail.com>; 4fqr <4fqr@proton.me>; Vincent
> Fazio <vfazio@xes-inc.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>
> Subject: [PATCH libgpiod 00/14] libgpiod: assortment of fixes
>=20
> This includes some urgent security fixes in python bindings and a slew of
> changes addressing less severe bugs.

Resending since it seems like my last reply didn't land for all (or any?) r=
ecipients.

Python changes look good. I ran the tests for all supported Python versions=
 and they passed [0].

[0]: https://github.com/vfazio/libgpiod/actions/runs/24133122726

Tested-by: Vincent Fazio <vfazio@xes-inc.com>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>


