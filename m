Return-Path: <linux-gpio+bounces-32694-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOAQBS4Cq2nDZQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32694-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 17:34:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B6225078
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 17:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C2BA30091F9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 16:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D575F396D26;
	Fri,  6 Mar 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oBW4/aAm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AA36CDFE;
	Fri,  6 Mar 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814886; cv=fail; b=W3barK5lO577GVmMUv4pR/sVVRmdU96bO5g9pXkL4F8Pr3iKDJTYGqMPL7g2UMs23OfgXBosaG80txcfPcr8/8M9wGrhs30TJQmA0wUh+JNtbS6n3uPL4gILhLjd/Kos2znKSPt8+gZMVNyRn3lnYclsN6solPdsFiMHBvd7vCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814886; c=relaxed/simple;
	bh=GFlGFFoOnw94WuX4liWMoKdgO6VHpBlSlgkvZsasFN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bmsaLd/n1BzYYsRvA82jVdTtaFinDKH8iJy0sE91o0GwrtzGEy7ZU5hdGhMrwcuHdcWAZDpa1F+xob+mviQUZ8bAqdiSievtk+tnptVspQ76tXV/Vn8hpkofBL0ciF5rDyVy9vGeTX8xBHq+EtRaGMgTjzS4VkRzHQIgTzqVLcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oBW4/aAm; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3qeUZOhicAqzUvPsZmdPnnOItkCpVHpcui39ekjbFpl9LiUU9nLG8t83nBqZR+3Am1ynQvFGVnhEUo86YUdl+NxDpZqua9Uv5FyQeN7fFHqxnvFoVpUvkZW/4+8gP8URAd+kFb1DVqlH55WRKN31oYc9yPY/OliAte+X0YD9D+S89sgtiOLEH0EcjhxFbvE9Bw9TBhPscp8O28Ft8MSVUCwggmLNZVZ/Wy4P/75pfgQXrz4UeBgQ2VAbcbBqXK2I7188dKyGIsh4evZCW/u8wmf5PhJxBMOMUdMBXuc/V+myg8m9SiYr55YhdAVzv30fiJq+2taXiu2t4N8uBuVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ive13fU4bsh991OKdBdKDqis1gMSDNDM9HiX6C9CNdk=;
 b=D4pYRfFpTJNXebrDg49I6NIl9A8VZDzhwZwbKm4UEK5ltor6l4ZIjo2/oOQk7HXGLKOhTA7F4AGY3IkxpbuFGcU38/G26LmiQ2aOiPtFc6l65DOiouEQjeXymXLnQJPgxLHCVNx7gGS5F/kIxBmGGW6YAvOsPs+W5roCoBzhpdoHAq+1wBTxMx8Bz7PzDAB6VMp3Ve3mQtQu/UR/FMoc/TqkePytdxL6/tp+06rlVHAxwOZWEGFavNYgTUaSeyoTAu24mIOscqTl3Yt9x7zDrBW0SDDo2eM8mAEORVcuwon810js4vsK/Jt2AsjN8lO57tbZMybI1trJgzRZtbHgHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ive13fU4bsh991OKdBdKDqis1gMSDNDM9HiX6C9CNdk=;
 b=oBW4/aAmFemRbkjQ9pIWdQTI2aGc5WcYfKnwb79xoe/Om9pWJWdaD4HFqVE4wtfEoRoJXbYPMVeM3otDeQkKrCp9OEJ/0i5ur1Gml+nF5Rs/L5lMC16J2p1CAb/XXXZOLXoSWskpuw0Q4oEokRpOnNJ41GcLFvkdagmw/YLMZnJt3jB9O02oBv/WTJFY77vkjfJSrck3bGV1xDckZwFWWtGvoxQ+fzTYWYYbjSLMzg+1/I183Sc0wTelFFDO630Z6/Y2225qT3wCl5cgx0ucVRz5H1OnoiWlqRu8AbINq6k3UIfhQ7gateo5DXwFxOK+EB/KSg+AK9k2kd3nEjUFoQ==
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:34:40 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ba87:1cd1:53d9:fcd7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 16:34:40 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, "arnaud.pouliquen@foss.st.com"
	<arnaud.pouliquen@foss.st.com>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Thread-Topic: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy firmware
 protocol
Thread-Index: AQHcrYch+02YpNJ5iUqOCF/Z++jYfQ==
Date: Fri, 6 Mar 2026 16:34:40 +0000
Message-ID:
 <AS8PR04MB91764DFDA8D3BEF64F583969897AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20260304211808.1437846-1-shenwei.wang@nxp.com>
 <20260304211808.1437846-5-shenwei.wang@nxp.com>
 <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
In-Reply-To: <676cee35-b5ba-4a3c-a6d4-b9e06e0886dc@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9176:EE_|AM7PR04MB7046:EE_
x-ms-office365-filtering-correlation-id: 6aeec7ba-facf-4584-cdd0-08de7b9e43cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 oi7Mp/fWHwK1EF1q1XAvlJSCP694FdJCoj8ARGWm8gjzIid78A9j2aZdryRR0G2pvJXnMOo9xh6eZocm+W4c7+C1H6n6iG6JB54px3wXE0p6Dj+t2SUex7WgSU2K7f9gV6FJbiVCEsILYgedgBeVNeAm3AJwZy1oNzILnWWok3PCUri9v2oMd6Q/0nHYqP7QQU1fp49GIm6AQQxiEHCUQ4yiuEX89vUfMs0KcN2b5Q7kAcibidz5TzRL3UafJy0I2/eBWYwcXpY/9qP4sRn58iyzSJLxZTYEnp1tyBwiJ1B7Rb6frk68e0pE/ORA4aOmFe9WX+ElJRaH3lKRYCMX5vX+NdmgMquT887wDD1S1n36EmGsjVHOwMjseiB7JlSSYtqHnNYicNRfuKqjLQK4w68ga2oXnTvSPbV86y5+OO9vcb/GKKsR+02igoDGZX0nxV4wAAQfvICuC8yXi9i+G1qLoaML8gqzLaBZxJfL4KzFwT6ToBNhl1U4dIhSXkyQFqNXwrDtCoODSIUm4yeGS0dXQ2K7GODCCQYV9J/eu8GnKBkQC/yFm35fbQkxqZyW398P4ixjTEzyn4db9WiBJaprWHx1Hjvo/XLmZyNOULKMxnBjNRHJmMZ9lnBhrlGtjC8HrMimvqNicf/4IKFmCj3kK0ZNJ5GDer6p1FkhTYposEH6HuvOxib2y3vg8LYgE8Ahi3h/JRgLwm/9K5x/wWc+v8jcx5w7hbVm+WqffHbl1l32oZq24eVR6evejVjWygpVPlrwWu3tP1yqZsldp4ZlMp/MQ5w/ef22xS+JP2s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xsGgMq3Bho6TzS0MXX51VLWL6qqWnOPfsqwu7pfznyYN31T3fMq7I86+Ug+H?=
 =?us-ascii?Q?dQrhDZ3vJnDQQnXV9HcBu2za6f8L3Z2DF1q3MxH+WI0I2hPZ4gNFnZnglI1j?=
 =?us-ascii?Q?y6Xyp744uxZBfQyZwBHNS+2TphKvdmJUXzHj8et0b5qwoanjvi36WUcuYzPc?=
 =?us-ascii?Q?8QVC6cpc6k/dDXyg5415QNhf9B1OdBoHYydKgCq00cKQjJ1AvpsE43JA1WZ/?=
 =?us-ascii?Q?o9Y2Ne2BWE6NVD3eZFpVBQKwOCc0HsmwmNZIS9EkqCPm8IuOX2vhmJEvI/KQ?=
 =?us-ascii?Q?S/9N/ELAPBHsmn92rvNJTKY+GsPE1fpYq2Dim9ent58vdFK9XLrwLemnsQZT?=
 =?us-ascii?Q?uHlUC1r4fB41QPo57EoZBcL0WI2Vtzozi1InhwACYNS4rnehrgn8UFcxWI2F?=
 =?us-ascii?Q?vu75zht2iTbwM+a7wGWDXs5MVVBCY5a7uSwlD1Av7ReicW9Ao4JgyRfX+bWU?=
 =?us-ascii?Q?2DDMDRyfaarVHTPd//WA45Az6lJciLu5Ryxw1sayInYhV9VN20GsTx6T6t0h?=
 =?us-ascii?Q?qF1cB+aC3+XyYjbdG6wCFEMdApuS24Asy0dz8sINVrq5Bnc7bpfWTmn8hnOd?=
 =?us-ascii?Q?1DYH31v1177yOSrhOCDqxyjihB9AThnInyCzl8SvHLimxbXl0DBCMyrksamZ?=
 =?us-ascii?Q?xUMJSP68SAX8aaT8s6mitembxcr8UAca7g7PkbI6BnvTDrZ263N3KLI9+JOF?=
 =?us-ascii?Q?YtSRokuIVbRWZxzfYW5tOh3gdN8nvCeZIKhYkCM6moTVR/yKoHjcEb4o4zI7?=
 =?us-ascii?Q?OeKPD7aFsRYSWiwYqKmAWA3E3wXvxTB2+U+htPoQQVbE8ljpbltDxvpabo/m?=
 =?us-ascii?Q?MXZCYgbQulbbtC3fAeUQMYDANqkiSRPZU/JKeHXGADsgJ46RjNdX3/2P6MF5?=
 =?us-ascii?Q?8vEMkqh8xkbndCVTLyYxH2hYLkRGoLguhTHstY9qPRrNxiSPTESRvYAwCelk?=
 =?us-ascii?Q?ckjEiCMuCOyNyEI82ACpGnZKtOyXTkBBoVsXFPqkzt4iy2dV/fngkt0mnUJb?=
 =?us-ascii?Q?2xWfh7WUikY2xTbOEVMUf9Jfh3Z4r05akWWmqYp+SIUlUSohjccmkFP2hIkH?=
 =?us-ascii?Q?YzFqUwEkB+UqMIy34eFFOsmHlL+9rGBVV3w1w8vfq1Dn6ghdMTlZGtKzXr2h?=
 =?us-ascii?Q?KEtWddFhviJ04ZZ5WoSGaB0l878FSajb9B4r4rEuNJpIs0sm0U3Cxk9/Qe69?=
 =?us-ascii?Q?NLhhz6bILkHFAD/hVM2YHJxs1SU4Uz4ENvBYdDCkZagcvTcG1+i2IBWDqHUn?=
 =?us-ascii?Q?uKvU5OpKTKD7cftPJ5jQzVxaC3P3YTXjcP26VK2QirQ2qvNTfwTP5o6BaSWM?=
 =?us-ascii?Q?tcuM3VOyzbsO1Ds3/hbDh9qlY2VATfjdckfJVN1bJov9n5EqtbCknDcTWQoV?=
 =?us-ascii?Q?kGf31CEM6aInvgZdChKdHJjhXNIJxRYPDIyFR3/Zy5fsoXkTybrfB3etaMHf?=
 =?us-ascii?Q?VS+IUb0/AdmnNQ/QbgYB3Vjz7SU3MU3dn+qPefweCFOoSzQUVv+VE6bHGHL1?=
 =?us-ascii?Q?JTJiwag5BpDKRJDUZ5W+lp19CC3fMYgWvRbC/PYXv87T4PBoIjJAeNOp8DUc?=
 =?us-ascii?Q?9mWABG3p3tanH2an1WpQoTducmwmxd7LhEU0SStwUQ6GUTRfaVjr60GADa2q?=
 =?us-ascii?Q?PAtqCg/lNodfP3dGmo7kpXE3MJyYI3oSKp0h4yUdsYpEnYqv3wc0vCYiqJut?=
 =?us-ascii?Q?A3gn7d/55e5LlHtc+K8K/y0AqVvnmueIJ8741JQXEi8rG+qB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aeec7ba-facf-4584-cdd0-08de7b9e43cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 16:34:40.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnPFxSXuTWA4/hIxBU853mrSHybyxcWQG8hDlFNcaCrX+Jn2OStamHqa9KY7aNBuQhuoWOM5wsW9sycfxMdMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
X-Rspamd-Queue-Id: 190B6225078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32694-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.991];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, March 6, 2026 8:24 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> <s.hauer@pengutronix.de>; arnaud.pouliquen@foss.st.com; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v9 4/5] gpio: rpmsg: add support for NXP legacy
> firmware protocol
> > +static struct rpmsg_gpio_fixed_up imx_fixed_up_data =3D {
> > +     .recv_fixed_up =3D rpmsg_gpio_imx_recv_fixed_up,
> > +     .send_fixed_up =3D rpmsg_gpio_imx_send_fixed_up, };
> > +
> >  static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> >                                  struct rpmsg_gpio_packet *msg,
> >                                  bool sync) @@ -572,6 +711,10 @@
> > static const struct of_device_id rpmsg_gpio_dt_ids[] =3D {
> >
> >  static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] =3D {
> >       { .name =3D "rpmsg-io" },
> > +     {
> > +             .name   =3D "rpmsg-io-channel",
> > +             .driver_data =3D (kernel_ulong_t)(uintptr_t)&imx_fixed_up=
_data
> > +     },
>=20
> Its not clear to me how this gets applied. Don't you need a different com=
patible?
> fsl,rpmsg-gpio-legacy or something?
>=20

This is not a compatible. It is the RPMSG channel name advertised by the re=
mote processor.=20
The generic implementation uses "rpmsg-io" as the channel name, and "rpmsg-=
io-channel" is=20
used by NXP's existing firmware.

> I would also put it behind a CONFIG_ option, and in a different module. N=
obody
> needs this code other than your legacy products. You don't need the bloat=
 for
> your new devices and other vendors don't need it.
>=20

Other vendors may add fixed up handlers in the same way to support their ex=
isting products.

Thanks,
Shenwei

>     Andrew

