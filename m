Return-Path: <linux-gpio+bounces-36888-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCA8KOO4BmpAnQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36888-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:10:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B8549DC0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 08:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D07D30208F1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 06:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0A73793AD;
	Fri, 15 May 2026 06:10:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9B1A2C04;
	Fri, 15 May 2026 06:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778825438; cv=fail; b=jcs2IZsXAI82OQ54tYhRUJ5xi94TUOBxoXX8ACtxo7eXysZJYWwfCleQbJtP/cVipeY5aLGNif8JUFDJP8t/JNAc61xQUbjzgo21USk3vYm1uo8RTx1cZB2xA8a3jnYEtZ2tC7pxbqjjarUOE/pEEWlL9MnsfcWYXp8Rn4pSOCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778825438; c=relaxed/simple;
	bh=Q/vMOI4YN/F6cpIMS1lrGUghAC9TNFD+GuNqmP+eHbc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EXHw0VDGiy3p5hRdqQWb/RA4CBbi6PSFbNlM5hQodOs1h9JIuI6hCPFLUef6x6USo+NOID5WFphN9YUvUo88vyjJ/Piiz7PScRZdx7amVxw5SxJnpCz3PJBPV2AnSiP1KLLbIpsxKBjaJ7yZRG6sN1wsZ2DaVcis7/dyGZjm6YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERb8Hp7rAITLGsMj5150WgYvYFb4tSUevCDf6nEXiRJeU4lv5x1MM3bGZgiiaQxRRHHledoe1ldhdlT8SBkE0QLSrWNUXFohrokrJdN0YKfwm1fjJnMYbwrzKniDQmzwfSDyOZzvP7Dw8hh/A3Ca2sUoYFuhBX8SjuQG1hQ1/if00+VgpadUE0yy92RU3w61dJyDyAVNoX+HXajyXmFtJ3iaJf8zEgn2e39ryZoI1nj8b41YrR7z43VPJHg9wNA3xZ+pPpEeEn+/AH4EkV1KeoL6q3ETD1YeEoH0WX2ut6JqVJ5qu4J0Bsh4f7dNYiobu/jndqwi1SOXHzaA4gqNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bReFYGjwjd4cfQUytpFACDOEIzVFCD7K9kft+soRppw=;
 b=m9vOMhxrYbh5QgAb13R4xuOLDC7bDbIfwzf1Lof8/VdoCT3wUv6pajotpMRMgivpJNHleVTl0lYSfiGvCXzD5ldOz0BxCY5CTMNFOte/iahQJNB9DCPLKIm6lbTdj90YnuMFrnGjoYTWyBVk/OcyczVCasp9l7lmb8EDzsbaazr+NuQMIn+2Tl57hGh3dPAgOl+GqofjSGXOGQcTPJ+etFmt8+dZxWjDD2bAMaYboD1Y4PcuHguXD7HJQYkivNHtfhzX9gxY16sRLu4zS13to10TEF3+EmrNIHrO9ZS9/sy53peRGn1ubDIicuB9ZHGI/9o5CT1lGonvy907PKwAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 06:10:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 06:10:28 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHc45KRvsqG0r7N2ECAW67mfXLNbrYN3n4AgAC9aVA=
Date: Fri, 15 May 2026 06:10:28 +0000
Message-ID:
 <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
 <20260514-undermost-gray-6c9967b363a3@spud>
In-Reply-To: <20260514-undermost-gray-6c9967b363a3@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
x-ms-office365-filtering-correlation-id: 109906b0-f38d-4ce8-10a1-08deb248a9b9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|38070700021|4143699003|3023799003;
x-microsoft-antispam-message-info:
 o1vLr7gbEIehU256XgNErasBVXfsNdWDzFDdEYhNNh+Q7oTAT6l5zTwdL61ZKEgokCSKRexLlD2jJn7JAxHUeH2l5WHKE84bmBxC2etHlJMI+9Fz3iXuk+FxgjFhfgC9q54IdX5QtU0WjxLKCokCVOLXLo5tSD3MMsjwBKJ+eQWRO7wKjBcj7ty6i//WzUcKo11sYMVlUUd5Zdj0Ur+WEHUxYc1aAb0bgdwAGzvu2CCMDxAwg7VUMCEMQQbeO9LRWjiBTelB0m8/XUGirkbdJRXMvPnYlWJs6HbQL1um1optAvTeh+H9RdG2UYxprWi8sfLGNUMfQWmfRIISmI3xDR3s3l4Mk0l2+e21tXUeQN87GnhhZ4Ux5cLItPdr19T1yg2dh8+Z5uJQxcQTCtWgC/X0ymFoj3JRjnxGOkSsXkqGHCyX1rk2HxspNO8IeMjV/HKkcXXQxRdst1JHsn7cv/5QGXp8Phv/3dQP1+1+FVz06a2kyak05ZGCF06mpzZTHVFiwCCm7fXOmNhLGJvbUE4d5tG47uUlgQPauF+GsJF7D7s+282O91+FXu7o083M
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(38070700021)(4143699003)(3023799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DUunMpI4yOtsh3QtlYpWjWnYtHKp97Z7e4dDG31siFpQcFH1srXlLz/Q975o?=
 =?us-ascii?Q?Hs3AnxLpCXc9YmewZD1JYXBsHcAZB8jk7kqc0uKtf5nnpOneJoE84Ln/o+lL?=
 =?us-ascii?Q?OryMIroMos9tyHiPd35FeibcO+Hrjr7QcBcwlLv8zfngIRQV417sMfmsTilA?=
 =?us-ascii?Q?YPM9mqJi6TJbvg4IYsI2C3uF2PURvYfahtdnugTrZa+bb5bbiYDUq+ZbtAE4?=
 =?us-ascii?Q?6K6kdH0E5WzDtCRf2FEbhgJqtCVi2T19dgrJiyApcNtC6IcJxicCYjc8iviE?=
 =?us-ascii?Q?3MuZ7vwY1sXQb+kOcibU7tS4KOYzAJOYvijkwkBBZAmZrblnSPidHdh7rijT?=
 =?us-ascii?Q?niUpRVH4XVLpzOoM1t1e2h2Mncm5stxGOwYta1Z0qZDp3j/24ctkEGmVb+nF?=
 =?us-ascii?Q?deeB0UYP+0iTKSBmexJNhNRNAJBKAZW/834UfquxtGzxZGk+8tJ+nmRVajQr?=
 =?us-ascii?Q?bbrdz+Na3ErDBBPBPsbG/h4uPkFAXk5HUawuiXMqrO72nIpTtNJPycONktL5?=
 =?us-ascii?Q?MbpliIWs1Q0K6r9POiDXrhA9hgLBGXQu07FDPBZBQ0K9yxtf0B+F0+Ldb68d?=
 =?us-ascii?Q?2E7OWdroAfvs7HthRjzp/wBRrfG/4CnfHus5cHCrzjotlpiebeR90AnYMuVR?=
 =?us-ascii?Q?HtW9WKyJCm7uUAPFT7jTfkBuLcF1I1PnU1nsGkq5bXW755hP5wF8Gu/kEBhf?=
 =?us-ascii?Q?yODjyCr4Zcfdam8ylwNJ31ze5Qf4bLslDKoIVBHqvji/hseAjJ/YrWonYz2k?=
 =?us-ascii?Q?LvOLYEpjuXEHJtWupOq3ta4l8RUYMa3ZU7hNFJ4qBHql4XJBFguv8VDIJd1M?=
 =?us-ascii?Q?cUdH2Xcsfy6+GkEYGP6l+SNs7D/Bc1w3fHUv+nllj4MjGiVqqc2f0DEl80jc?=
 =?us-ascii?Q?aNuvXv5pw1nT2hBvyR7pRnGHFMWRJPFmi/AMhq5rRd2rUPtFYnfidv1NW9DT?=
 =?us-ascii?Q?jgG9GNUyChCK9cs1OmuRKQJjUBrU8uiBP+B44lN5AVBT8cAhy/EDy1Hat6Jt?=
 =?us-ascii?Q?qsEbc+9uBZygaaOD6QeyqJLJcq7oETkF+IGsn2Lz6BtNUoYzx3zSWFITNJFO?=
 =?us-ascii?Q?rQJU5WXYgbq/GMtUrPScFkoW5cy6FAfEB0vr86c14gegdjMDuiw50Y3nps0F?=
 =?us-ascii?Q?xCSmfx6FdB/kOuRIb+t51hu/l22k3GmqW4PGKMdTjzqirg0B/gcbASBf/hcf?=
 =?us-ascii?Q?s4TVgdmuAYjm15daa41sTqNyVnsFJ0zMITGODFLOOiavHpoZ0gs8oGnxQODl?=
 =?us-ascii?Q?8wWQhZyLuRA1y/55mur3BDaFE/l6g+k0TEwi7+BFyyHmkaqxZSauEopst28n?=
 =?us-ascii?Q?u29Vy0aO9zdOLBkegCp8jhn80jRTv8ZEr9uFTQxci4hQ4ozEL+ALXN/NhumJ?=
 =?us-ascii?Q?kVbeV/75Yuuq/fPZkOPBaH76VZ6KWA4rhIEjoaBMqm0Dvac9KqB+tEZeE4UT?=
 =?us-ascii?Q?AWdKlIwZBWSBInAjRAtAg2FPoWtQeZfojoRaUrff1ViOJEi6WvEFzCOspFKH?=
 =?us-ascii?Q?IkAzVnh2Kpy+T+Qj7hb3I4SfhnuDcYgMNRW0UvKOkfdSg648u9pts/rgMXE2?=
 =?us-ascii?Q?Vh7XFRJ7GGO45tZu5MOWmV9ftRd1Xf10AerdBXTLd3CSOxE6BnX/7w4G+L/Q?=
 =?us-ascii?Q?sSdDcqWBsL7IyuNHgpdhXk/eZaaLnk3LJrziEGIZczgapuYMdWS14FfwOd5L?=
 =?us-ascii?Q?aTWd8F23iKbzcgBSMG5hEt/JDOtyjhNBC9oU8mtlb+HmwR0tyFgHLjQJ1Ubk?=
 =?us-ascii?Q?bzzeahw/Y/BHLSZmHJOcl37x6uR1OVY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 109906b0-f38d-4ce8-10a1-08deb248a9b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 06:10:28.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paxNrQCBW+yx9vmQB5nqIylruhJcDEEcz7k1uhqPFVs1TOaqbY90bIwNqQWvfyIkaUjOLzd6yIslCLBAhyxOkWqKU8/g1UNpKt19tIEgAV44d5ivS0AWFP8rYai7KCc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155
X-Rspamd-Queue-Id: 2F8B8549DC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36888-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn:mid,starfivetech.com:email,devicetree.org:url,0.199.149.192:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, Conor

Thanks for the review.

> On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> > controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++++
> >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> >  2 files changed, 192 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl
> > .yaml  create mode 100644
> > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > rl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > rl.yaml
> > new file mode 100644
> > index 000000000000..21d3693587fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > +++ inctrl.yaml
> > @@ -0,0 +1,175 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.ya
> > +ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JHB100 System-0 Pin Controller
> > +
> > +description: |
> > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> > +
> > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2,
> > + per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> > +  This document provides an overview of the "sys0" pinctrl domain.
> > +
> > +  The "sys0" domain has a pin controller which provides
> > +  - function selection for GPIO pads.
> > +  - GPIO pad configuration.
> > +  - GPIO interrupt handling.
> > +
> > +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs.
> > + Each of  them can be multiplexed to different hardware blocks
> > + through function  selection and each iopad has a maximum of up to 2
> functions - 0 and 1.
> > +  Function 0 is the default function which is generally the GPIO
> > + function  (or occasionally, it can be a peripheral signal).
> > +  Function 1 is the alternate function or peripheral signal that can
> > + be  routed to the iopad. The function selection is carried out by
> > + writing  the function number to the iopad function select register.
> > +
> > +  Each iopad is configurable with parameters such as input-enable,
> > + internal  pull-up/pull-down bias, drive strength, schmitt trigger,
> > + slew rate,  input  debounce nanoseconds, power source and drive type
> (open-drain or push-pull).
> > +
> > +maintainers:
> > +  - Alex Soo <yuklin.soo@starfivetech.com>
>=20
> Why is Alex the maintainer when you are the sole author?
>=20
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,jhb100-sys0-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 3
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 3
> > +
> > +  gpio-ranges: true
> > +
> > +  gpio-line-names: true
> > +
> > +patternProperties:
> > +  '-grp$':
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          A pinctrl node should contain at least one subnode
> representing the
> > +          pinctrl groups available in the domain. Each subnode will li=
st
> the
> > +          pins it needs, and how they should be configured, with regar=
d
> to
> > +          function selection, bias, input enable/disable, input schmit=
t
> > +          trigger enable/disable, slew-rate, input debounce
> nanoseconds,
> > +          drive-open-drain, drive-push-pull, power-source and
> drive-strength.
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> > +        unevaluatedProperties: false
>=20
> I think this should be additionalProperties, since you're citing all the
> properties you do support below.
>=20
> > +
> > +        properties:
> > +          pins:
> > +            description:
> > +              The list of IOs that properties in the pincfg node apply=
 to.
> > +
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux for
> these
> > +              pins.
> > +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          bias-pull-up:
> > +            oneOf:
> > +              - type: boolean
> > +              - enum: [ 600, 900, 1200, 2000 ]
> > +                description: Pull up RSEL type resistance values (in
> ohms)
> > +            description:
> > +              For normal pull up type there is no need to specify a
> resistance
> > +              value, hence this can be specified as a boolean property=
.
> > +              For RSEL pull up type a resistance value (in ohms) can b=
e
> added.
> > +
> > +          drive-open-drain: true
> > +
> > +          drive-push-pull: true
> > +
> > +          drive-strength:
> > +            enum: [ 2, 4, 8, 12 ]
> > +
> > +          drive-strength-microamp:
> > +            enum: [ 2000, 4000, 8000, 12000 ]
> > +
> > +          input-debounce-nanoseconds:
> > +            minimum: 0
> > +            maximum: 4294967295
> > +
> > +          input-disable: true
> > +
> > +          input-enable: true
> > +
> > +          input-schmitt-enable: true
> > +
> > +          input-schmitt-disable: true
> > +
> > +          power-source:
> > +             enum: [ 0, 1, 2 ]
> > +
> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> > +            default: 0
> > +            description: |
> > +                0: slow (half frequency)
> > +                1: fast
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - resets
> > +  - interrupts
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        pinctrl_sys0: pinctrl@13080000 {
> > +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> > +            reg =3D <0x0 0x13080000 0x0 0x800>;
> > +            resets =3D <&sys0crg 2>;
> > +            interrupts =3D <56>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <3>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <3>;
> > +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> > +        };
> > +    };
> > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > new file mode 100644
> > index 000000000000..6d8f5516a178
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +/*
> > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > +
> > +/* sys0 pad numbers */
> > +#define PADNUM_SYS0_GPIO_A0				0
> > +#define PADNUM_SYS0_GPIO_A1				1
> > +#define PADNUM_SYS0_GPIO_A2				2
> > +#define PADNUM_SYS0_GPIO_A3				3
>=20
> Does this provide any actual value? Across the whole series, most numbers
> you put in this binding headers do not appear in any drivers at all. Seem=
s like
> these defines should appear in the dts directly?

However, the current series of drivers will use some of these definitions.

Copied from patch 12:
+static const struct pinvref_desc pinvref_desc_sys2[] =3D {
+	{
+		.name =3D "gpiow0",
+		.pin_grp =3D {
+			PADNUM_SYS2_GPIO_A36,
+			PADNUM_SYS2_GPIO_A37,
+			PADNUM_SYS2_GPIO_A38,
+			PADNUM_SYS2_GPIO_A39
+		},
+		.num_pins =3D 4,
+		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name =3D "gpiow-inner",
+		.pin_grp =3D {
+			PADNUM_SYS2_GPIO_A40,
+			PADNUM_SYS2_GPIO_A41,
+			PADNUM_SYS2_GPIO_A42,
+			PADNUM_SYS2_GPIO_A43
+		},
+		.num_pins =3D 4,
+		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};

Therefore, I have uniformly created include/dt-bindings/pinctrl/starfive,jh=
b100-pinctrl.h

Best Regards,
Changhuang


