Return-Path: <linux-gpio+bounces-35201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDbTJYyZ4WlYvQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 04:23:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39876416370
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 04:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89FC5312BBFD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 02:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8E52580E1;
	Fri, 17 Apr 2026 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="qE1j2f0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023111.outbound.protection.outlook.com [40.107.44.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A4148850;
	Fri, 17 Apr 2026 02:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776392433; cv=fail; b=gmOyme//45b6WDwNuGlhiwvLtb0Zk2LRFqO6HnEY5IVT35sqps8NwRjesWFL94CwUD3ujum5YRzOgIiK1DkYHH4hEeKh4IknJsDiYM1IjbijX1tKAb/BODuP/9vJ8JOQmDyRayAaQuKX8nY+8kJQDsKQ54rdBGHleZ/aOH9olHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776392433; c=relaxed/simple;
	bh=d3WLg8vvFb6Qhbc+8v5AgFx7ktdzzVGafzCtIr17Jbg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WZHqclq37Mb8L/CSwc8RSWcANTqJPmuU2uiCPDTBrDVMhw9OpAiyDiVHP+El0AgWFUKhn+F/lMhSejPlYe/pfz/IkhYrzCFtaxszQS6oZj9JPzzALjJ5CnTM4NI28T8s9vtYgdIFCc9BbGQDtm49/KonfmDL0M1gCDJes5vT5GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=qE1j2f0i; arc=fail smtp.client-ip=40.107.44.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVpfh+KAX1Sv8+V4NpxJ4YC3LaLgl1Dr3V3qEHXplYtU0sUfFtjAwPHpo4BTuBNAH9Etw7NtXgQjKFDQkgkk6TahPtQ6WhIz0I1ovFFF95MNUMcQ1Rb0LEJgCqC4sNVEolICHlTzeYYIkPKW3SfwMMLYxherrpxpw25qQabatA0mvtp3bDdMpOYsQMVa8VdEiO2pHifnC1wkf6Y9xASRBJPdJgkLpy4L9KmIAyvUiPh98Pto9vqttctYW/NsVVIv8YS5LhqNMiYo2UN6N7vSb5u5LYRTOcY5FqmE6qym8cdonuUY0tmFOsEwhti5d3gZD4QPn1aRZ/BF+7EgDm3EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPlIlpRji94s9ZmuRboL8s0FcNpnXN1rLHkInhPBPsQ=;
 b=FgiJIMjrIPo9mXw99GpMAvHP5+yisEl9FDi0m7dQXOvwyzCpczDTNH0MZqWqxVA7jSzbod1MsiWFN4c4iow5RE7gd0KXYF3DA7QYFV9SnlrDRVvy38c4PZcZkmQ8/zvCKdQrKN+JLdasZeK48Fz0R8Bsa/BBrXRbKLYWA53cOjzCB5SJ8tKqJZ56tqJmr43K4e1k6KMsBY6mZ6qvbRMwG4Qt9EpEN2CAbakleIFtaWp0AenR77bQuKI8s9OgXXFtwfwW+fUQbFVLBPggYSfCFp4lUsppGuKC9JgJgQ9YQUEkBbA+w+Nag2CTjkecl3tHyDaRRiiy2Tmi4/qbDq1bTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPlIlpRji94s9ZmuRboL8s0FcNpnXN1rLHkInhPBPsQ=;
 b=qE1j2f0iRAa7CiwY0eh9JFX7MmSER+Az73lZt7JXBn2jeIhkBbmqkUBtMYsKEeWfl3WQxeOrfbicjrlIEUcin12qV7R9f1xDhTvBh6f3fySUPbllV1i29jJBu28OE+PsVAdVW78dDzhmo3Vti69qYwduoC78Mm803d6q6um/P8fROtcDS0Pp64LqQizYD3sBjyiNV1B0Ufqq7KOGvfQWGsskTP73Mw8A+kyjVWtzEHLdwHyq9uKZ13pZ2LsshJJVne67j6ReUTzLl4CfHkCMsvrZWyXeF74Ba6BJhWwYn4qudwstqd2TQJlRqhzJUIF3ukAbTES+E3DhuD6rRBjIIA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYPPR06MB8280.apcprd06.prod.outlook.com (2603:1096:405:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 02:20:26 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 02:20:25 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Topic: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Thread-Index: AQHczXLoc0DWafBAUU23YFhFi4LfGrXh15uAgACsm2Q=
Date: Fri, 17 Apr 2026 02:20:25 +0000
Message-ID:
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
In-Reply-To: <20260416-brutishly-saga-ba7168a4cd14@spud>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYPPR06MB8280:EE_
x-ms-office365-filtering-correlation-id: c4799b52-57c8-48d1-94f9-08de9c27e2fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ImKxIORntg+GSzMgXzxPo8ov+7H5xkDQ0MwZlP+weRjhqOHnNULsOSgXJu5Wttr/L+XdWlIDXdUnxzV7Zl91rOPAjZbHF8ITKOGtd+wBVhg3Ap9qH5Jx1dMgb7K7XNZfyGiKBx5RjY8pod5Veur/0D5yUJCFbbfRbJScHIT2CKAFTyrJxrIRi49a/kZFKafgASxZ6Zqq59rhJvTgYF9v4LCRz7j7XtBYY0pB1FskVMgtw4I90rqVTb+MKEpJb5+v+mbeQdRFPAc4lBZzeDaXjFvlpL2b7DrJrFM6SM2VX5DKCY1vGdZp9bdh8/zkyXGbKA0fWg4eeT9mYTCtecB5Z6HNAa1f5xv+uC50SfglZDgojmjBEqtJ+lChpRrkbeKS52YulVCf4qX692TpdGCpC339I+Rs437Z2lTACO49Kzb5/3fC2V9E7pJiCrc9mmgiaEhdhiG/zp2pGgDex0g/J+3uxlm7xDBrsUY+NFitDqNGuj5UouCfB1rwiZ831+yI55F94FRliU8pk9UJCc/XPD4VlvcUTzkIkq5hIdr52EYbX8rniWVYrHqQrRePXs+ZomdzuWGwXB0aiR2TQ5C9Ylswep14WiclXZdxR4KczHsYl4odhg8QdfT+3KnCbFgeDWuJmbqbV87mdBNa/VO2xOckdtDkQiOsQ7+Yxhbs2aeue2E5BrAu8iV+eFTRpBNMARE1rMTVsyJeSI0UajuquHgTvizi/ASIKUdjTP0v32q44n446ZAEci2p1xmuA7PyB58z+CYbGqA/S8HKES/1CdV5iI4oIjEy+DNkdGY3BM4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mbgvt/3xM1/7onQJ1Ckdpqnrb7Fqw2Wi5nxMO+8200o9Me8lPUVI+MiDRP?=
 =?iso-8859-1?Q?Uu8vAJKyZXvrDKtXvmsKQJU2CcHkggsdp4QW77N1cSnhhcG3dvuFCd6NyC?=
 =?iso-8859-1?Q?9AjlT2Vc+fEUm7UAwVyQGkY+sjoDLIrrAuucK5KGUmlM/lDiF0t05YIXnC?=
 =?iso-8859-1?Q?bOKYRt91rXLt1mSYuGSSqU/Aog3cSa0ppZrIHRAxXBgn7jhR7/FFoH8BIb?=
 =?iso-8859-1?Q?seAvR0NjVqSD8BrmrnZgr6KpeTYzpPXxeZYtH+fzzTdnauaEyrrGGop62/?=
 =?iso-8859-1?Q?2F74q8tiHt2wQR1Z+J10SHqsjYMsJnknnmyF1vPFCK6s+0D19XZqF8xBIT?=
 =?iso-8859-1?Q?zcAbHRWy4ZVLzddxrlPjmzcAVrfVmzZpjisz5NylAIzIMKj7O/pSo/fQLa?=
 =?iso-8859-1?Q?FE1En8BNI3XDofmmRMHf/m5EYoyFslmkomBa7zdYg+FzLrZ7LBLdoMBGjH?=
 =?iso-8859-1?Q?RZX0yc7A3DnugQQ09Y3YPFwXMIcFdagdfGrlFf7/y7P82kcB+BZzrcReIg?=
 =?iso-8859-1?Q?OsTwHD7B067HlC7MCiI2TUmFH0VlKK4RIcaw0/T//8O6ZD9UlDVs2v7arv?=
 =?iso-8859-1?Q?pI3V2ZPFiPyYjIqXfYs6Xd++KiUNSgnDkwBjBJOemBcbxNKeABsITbnm6w?=
 =?iso-8859-1?Q?HmeVNabcv2f1/ThEO/OGx70vkac9z1cBca3ue1API9wmhnXgWkfLH0A3lE?=
 =?iso-8859-1?Q?rfesJf0WUkeB4RVg74ay5ukNhg1ZspISNmXKB7deAgBxDHj4+Z8Bg71YmN?=
 =?iso-8859-1?Q?zOASuHcZuldHIKuPTnTl1fBSrq+84IMDoaTFWNKkDqggikrfkFHgxjG8hJ?=
 =?iso-8859-1?Q?ZJdoTpqcRSUkjuyLh1WYGZcqauD84gDkg2Jzds8QSC7ZtIRK6jdLhpv27h?=
 =?iso-8859-1?Q?y8iAM7C4qBT/ycmT7krewNmRcYK4YyGGsbN9AR8cWKMiBwmgAZrXkwkhAK?=
 =?iso-8859-1?Q?44A1izVk1L1R9GIF1k4B1cFOUyqEWTgCzbROVsZpdkEWSdWING2Gkj5Fr8?=
 =?iso-8859-1?Q?0HCFzKNM4dN8+M51H5HcZndRHP8gsZ71kum3DNLeY8owae4VTpIrqkWZ3k?=
 =?iso-8859-1?Q?tkbUzTwWxg2nzHmDucIyDjbzUv6lsKU3mQO7RwKb/029VE/YfRYkp0x1x0?=
 =?iso-8859-1?Q?YD7prBFpmtIxNkZaqd9EnJoGY0GHCT8uKs4cI2+w7fMzvd9d/scw7nKJVY?=
 =?iso-8859-1?Q?L3LRXKufZJgp1uxyphorFKzCFdkJgkkIS1NY1dwN5ynO0O6Z+HvR3RniyD?=
 =?iso-8859-1?Q?iRhdr1RhR+De9epHSuppcHLESjyIUuyQHFhdzTKgsPDX8/KgrWXpabVDTu?=
 =?iso-8859-1?Q?5AWmODHuM0X8cU/DdW0CEFTeOPm9ausCpHr3xhbFXcDRatzovXWGmK5ITr?=
 =?iso-8859-1?Q?g9OM3p+9KzOog6xBAIzahPZ57wArZ60NOoDq3kNES0OGpd4vIztPFRQE21?=
 =?iso-8859-1?Q?BdR09sqpn+fwgY2qDX+wtK2kOtzIpxXC+zsqCARiMs5z8NWMvjxiFGHjUp?=
 =?iso-8859-1?Q?lrMppqHiBG//5iPr5go2taOIHF9RR+mBqtfeHcjJFh109+EWhHz0ZScwfk?=
 =?iso-8859-1?Q?D0OiNLO7iEATpNWD9Be1jVhg8ry8xCP3vbzhxtsHxOindglJaWzdAPeGd/?=
 =?iso-8859-1?Q?CAUDgaovVxwHhV35AAb9QO9Lt2ooLHCK8AEZQJTQfrKAbBjjIzMw3UW8q2?=
 =?iso-8859-1?Q?OjhnmGIgVM/AMouZXTF7/QqnmzsFcA8+jedK1xJKQMFAF9VW3nPLECYadM?=
 =?iso-8859-1?Q?hUiz2y/0kN/8bdQ5B+aLI6IaOiiZ+m3Hjz5iJ81xEDvRkr1A7/0IjF011B?=
 =?iso-8859-1?Q?vC7AwpsJTg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4799b52-57c8-48d1-94f9-08de9c27e2fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 02:20:25.8809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFDOS0itSkEXdRHCADi//tcuSgDGHhNM8iecIpFpOTCCKuSGlEs2Fx8aVuPPO3UmwWDCyb34t+EmhTPDN9xtrleFYiLL3BG1qVvAutyEezA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8280
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35201-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 39876416370
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > +=A0=A0=A0 properties:=0A=
> > +=A0=A0=A0=A0=A0 function:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMC=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGDDR=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGM0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEA=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEB=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPSP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGSSP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGTSP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHPD0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH2B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP2B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHPD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHPD0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH2A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP2A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHPD1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH2B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHD=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP2B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHPD=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH2A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHD=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP2A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHPD=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC=0A=
> > +=0A=
> > +=A0=A0=A0=A0=A0 groups:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCCDN=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG4=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG8=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCWPN=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAG0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ABP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ADAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BBP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BDBP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHBP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3A=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3ABP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3B=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BAP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BBP=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB0=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC=0A=
> > +=A0=A0=A0=A0=A0 pins:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 enum:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB13=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB14=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC13=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC14=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD13=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD14=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE13=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE14=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE15=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF13=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF14=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF15=0A=
=0A=
> Why do you have groups and pins?=0A=
=0A=
> Is it valid in your device to have groups and pins in the same node?=0A=
=0A=
The intent is to support both group-based mux selection and=0A=
configuration, as well as per-pin configuration.=0A=
=0A=
In our hardware:=0A=
=0A=
- `function` + `groups` are used for pinmux selection.=0A=
- `pins` is used for per-pin configuration (e.g. drive strength,=0A=
  bias settings).=0A=
- `groups` may also be used for group-level configuration.=0A=
=0A=
As a result, both `groups` and `pins` may appear in the same node,=0A=
but they serve different purposes and do not conflict:=0A=
=0A=
- `groups` selects the mux function and may apply configuration to=0A=
  the entire group.=0A=
- `pins` allows overriding or specifying configuration for individual=0A=
  pins.=0A=
=0A=
In most cases, only one of them is needed, but both are allowed when=0A=
both group-level and per-pin configuration are required.=0A=
=0A=
Thanks=0A=
Billy Tsai=0A=

