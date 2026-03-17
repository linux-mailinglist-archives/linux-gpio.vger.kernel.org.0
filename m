Return-Path: <linux-gpio+bounces-33661-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMpFIYR6uWnQGQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33661-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 17:00:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A72AD6DD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 17:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C516A300BCA9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 16:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBCE2DAFAF;
	Tue, 17 Mar 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OrS8RoI0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE42DAFCB;
	Tue, 17 Mar 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763199; cv=fail; b=Q/HNkact/1qyGvIfH1Ju5QH+ess0BwidTycIfiAF5ukaINiNt4UResoqG1XJDPIC0P+fNuLJMgJZ2S/RRRHnc1vCXxPbU3tqXywNbBAue75sy6QgLYb5y2ZODPxqoavMnhhGjpyvMhSFS700v5Xtp32lQYN9FA1cOHhbTYnfmV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763199; c=relaxed/simple;
	bh=quCw7dXYQ/RYvoCplaEwouJzLwR/rsCzWBj/Nk5KARE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ImoHtzhNJ8DtR5GDYywTPVA1Mq03dczoTip5F1lI4ZbgzbH4UP8lncPX2eKutKTs+YXGhNNaQclCCoF0Tmckdi2bHg2AOUBZvezGF3qdOGI2MgbKlBFOaMRF3X8a4fRdsRs3sji+cvxyGVa1leB6eBiDKgUPafuaRazuw3opuJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OrS8RoI0; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QephiirQND5jH+Hik5hz8RrRPcGdQF8bTWGkWjJouo0zeXgX+SvB6F8coa0mASf5cpEVtaBZM9/hGs5sOwz+Np0nD4gl6FEokwEYgHTQvocLl28B9Z/J64cbzbd9gHYZqfFgGhUy0ggff6Ea+vfSV9TFE75fwMsRbyGKI2xY6qkFEBa2S5RC/ecWFeWzYp66odVOg806OJLLFKB18bZCSzKwazzR8NtwEspAMwnIBvuI7q6BYgVQdM9NmpPa1bSixsPVo/sdua8Mz4LT4ZxuxSn8Z0/am2+K14mW2sFFxEOOI+Hnr7Z7S2KFDvKFLZUk3Cq8ZmLaboxzplTJXbLokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EWI7RnyuPuquF2KVsHcMwLmJIQ4E4pGiDy+LO6tL9U=;
 b=pEmLNKxzEZD0bzLSoHAX+BLtO0qzq98y9N5fqx4ehD/M4TzKj6FkjRnTxYY75oob5UAGsO5XzYtnNxTAvtTjo8r4pk9/iCBkOri6fOea6WnF3ePGe4Ezaik3ubc/rtHFy3Ot8nzoep58wxoa0tWH/uT6FfMTbUymJPqcJNH/HUAqozYkEZFNc38lMO6lVVmwnhrWTPpEgmTuqhG5ikKCxy3Ed1PGZIpON8KLgAdjBLZlEkrliNX8lYQmnswKpUd1VJhJfO67NwpPei77qYGiDltv7gOFl5cHibMqOe/1XMv7nrMaW/DgRgiAkIe56FA8YG0BuaY8aeAlA3Ljyw1/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EWI7RnyuPuquF2KVsHcMwLmJIQ4E4pGiDy+LO6tL9U=;
 b=OrS8RoI0P83qN759tzMPmdbnL0RJJlWdqp5iyJYz5BQ0SsHiWH7atRhcCe0jMao/5xCUNkK9KSxS4E4b8pRcaW/gZ0q18PDsxyAqW3qFVsK2e6t/tsmuGtiGlkqlnf59Zg4/5OuD5kpLkJmNB/QU2dD0KhpB8sM7LOzHFRxoVYAR5iivJBnNrDpLESXlnFKYCjVEVXxypT00KMZxrMGxS+kbBix12HieM57upuwUaxkGz7fAIBLRZzzIMva3+7kXjrfpS6PAPWVEPlb++L6pZpWgNzGBmYhBAxG9M0X+9NecHJN7ifjGu9S4NGCprYT25HJNrrbh4w50kFPwaa5dgw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA1PR04MB11264.eurprd04.prod.outlook.com (2603:10a6:102:4eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 15:59:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 15:59:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcticVXzvcQ2AusUOfPokHZf/vKg==
Date: Tue, 17 Mar 2026 15:59:50 +0000
Message-ID:
 <PAXPR04MB9185CD662F8DF859E5DCD5E68941A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <0f880475-a850-4138-b79d-d3c88765b0e0@lunn.ch>
In-Reply-To: <0f880475-a850-4138-b79d-d3c88765b0e0@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA1PR04MB11264:EE_
x-ms-office365-filtering-correlation-id: 72115783-b529-45b8-1025-08de843e3888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 qWEMdMiIhP5P8Vahjx9P2aGQ/XEa5gbkxzGnpaLLZCFTX9z100+68ZF1DQTdI1aMoQhROqRzTi+CtggaPHSfUB4eny21QLCLgIT/+2qq2VBNEhfpUJ0mQfQUBeLRmjYAZE3+CTUIRAzJvVOFQiHUFYxXOAeq+e9UWsg8/QAbWlf2x2ycP/1eFA/PBTWA8MOplo57NELkDWqDa7cKaX70A/MxgLJ1sDSzcBkKRH76s4mDqSzMPGG/cWwnldOPYov3O+LOeWMmclOIlJfSlNXTGIEgoXlD6+7VBipSGU1/3Rof5QSg9gg/6hlVDWNujSeYP69X772JGp9IHrliiFqU1zoU+OIegBo4a6w1ZWdFnEvBh6BfLd2dEJC0WKABCw8gnLKGnD4mKpdpxXchDrahhUg43mms3EXY4oy0ooS/opoZ7EaZpRGM8qhhSeToK1TMbOWLlilqQvv6TNaJYxiodrRJgj45uSM0hg72M5JK8UqMpN1VMWFYrnAG4HziLKm9Ikhk21NVifEo+/n005lDZuFKKohwdajYcHJe+IchzGRw/auTmHPFhfM7obZLtQeOasuhemTHnKPLIf/MGQ72LYMLqf7MaG1RI5BtxXZ7LY9zPZ0BVk9CMGh1k49OKxJNNcfM7O0a7MlnXt7oeSJiaI1qFDpfjE182LIiUivQ3xzZQPxQhWClJL4AoT/2oYA5v8ZnewO2qchn8ASJkjGA5eUNpzneKzRtn1+AGZGrNXpyy3nOogurilkBg+nwFKhoVcUpZ1IJMTCLRxs3eMwdqf+DKvsYrPgud5JJLQheiWY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?d5JOKwBYEhVROojYK/P+dj/mfZgh46ELRyuWbzCyaHExGbwJk5u/gxHuK94w?=
 =?us-ascii?Q?lx9iYOlQZkbSCijiBHWZh55+uf+Me4qa+oXGm6Fw4SAsXsLD6Y74lmh7dXKs?=
 =?us-ascii?Q?d5BJXrpWzs5/EPdcArOFX4nypj0TV/0ijjB//kzOWdK8J1OX9br0zhKu7ZkP?=
 =?us-ascii?Q?N8EVIdhHNK39qljIqz7DXomb0/Q0YgDMojEEZ5fDb1SYfd++L6mQwWBCrd7P?=
 =?us-ascii?Q?kNs10+CGP/2Fqm2OCFk0QQpsgCzWKebdk7LT4WhnAie/C40mhU4ZjimDTavb?=
 =?us-ascii?Q?Ea68qpEqy6A0IK9j9nYiMlc/96IP+67Chi5c2nxiwQWVRxL3aHDtER8PrfU+?=
 =?us-ascii?Q?emyURs4FIGiCc9bDC/tMgYqhH9EhK3kvYwHYahJ5eSKemyWibGJ34MG0qNSK?=
 =?us-ascii?Q?DOfckNlBh16dScUixJsT6XIKqM9+dT7nSk8ToyOwzLGMhau37U36nghIrXo4?=
 =?us-ascii?Q?Q/rF0bLspJDznZvM0L3IpayfanZOAeq6CCECcjiI7pipKCDCUux4ch1W1i3R?=
 =?us-ascii?Q?Sr+dhmRXKDRbeKWBjk3waRqIYtWAW44YIsfEqnrVm3LfgvI3wQuex9X8rTQe?=
 =?us-ascii?Q?YsCrO+0DV1nMH232WJ6PrYJKNdR3nWTpbchQP1Zw37Dulck3pbqv2vCrXkNg?=
 =?us-ascii?Q?yV17mvyNpw7mJS1SJslAUoUQRSDr6MWeUHPAU8EuF+Lsbddd0C3EWza7Cexk?=
 =?us-ascii?Q?RJVSQ/IwH0N9Rx/qnRJSloqHKJDlJz/+MqwPryJlcfWOsNZYaHXu2590rToB?=
 =?us-ascii?Q?kETZ1gM2xv4DuyPYOLYSV8OcDBSmq6ChfAWOlvgUHnj834MZHT8gaqEtnAMl?=
 =?us-ascii?Q?wP8lWd8NouRtT4POX1TiTFZ8o9zH3qzIx67GSYFW0emVfr95wuc3My3DJuDk?=
 =?us-ascii?Q?GDkyuEYVlyAVTfWVS4/MBN5J68xmC3jJZw0eIT3kkEw2748gNTSm+5c7BziH?=
 =?us-ascii?Q?iCZBIAHWfnALxZ8K0bUnuKkwPidhy32wTDFQj4MSE3u1cE4atn1WfKSzgmIq?=
 =?us-ascii?Q?FAAbyMlE67YLj8XOpfhmY0x4Gm1mWO0ybO23erq0RM9ODuTNAU2pkw8K083i?=
 =?us-ascii?Q?hpDyKJtzyxw4oyPmXxFk5MUUvvy7f63l5hZJJrCiRlxAAlei9D9QEMqTid7I?=
 =?us-ascii?Q?XZB0PgA7sUWBZY+vqZmZRj4apzxLb0PK41dWAdLFRYPFh94q5yH3UgdYJWwb?=
 =?us-ascii?Q?grtnzRUSgDO9grzBzB37uN2VLCVqUzJA6g7FbvXYVpgOxphwAgOb+i1Dc0yI?=
 =?us-ascii?Q?blZQlGM1Y9Xw26dKtWTaNjILy2R79LTH90VdscthKkRMAQrbCMGzfi6v/Am1?=
 =?us-ascii?Q?E6N35pD6HQJxh8jOC3z3TnFPCUEgGKItI1EDAGgv1s074OGbt8kyf0KA4YQ1?=
 =?us-ascii?Q?MTFAFbqVUz+L+e0R2gZcmlSOPXl11BUQVJKvNlPz3UpCbDZvdk7dEqgXCqKV?=
 =?us-ascii?Q?Y8kqxEssPmHqV6Pe8dLo9glY3+HDwJcwWq5t70C31hU2XIWsuNgnX5m5FwjQ?=
 =?us-ascii?Q?Xi4Xdm2TeIwImMarRgGxmiK2darC/PJ8ez3CJvePJR8eFGUWCiAxJKI75Bzw?=
 =?us-ascii?Q?aAFoH53zh7OardYKA5ag1tCl9vR3uBn+9fD2naF5rgei555dXmDBnh7YBltN?=
 =?us-ascii?Q?PgV5sU6odD/O+QSFLqOsAC9qq+NIbZJ7bmPnaPAMzjdiLrVmuS9JcGqljhr5?=
 =?us-ascii?Q?DaXFWBqx659+BPkZHuCZOOl+4evKExg9KbXDihUI/bEgYRMZ?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72115783-b529-45b8-1025-08de843e3888
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 15:59:50.3995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1dhMsuKrdWr27XaU/ux2s1EZp0ldXaOmIP/0otGFBwUVdEy6Va1ZYaFZxd5N5nWk+jbP8teHqNgTowbTAFT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11264
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33661-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 949A72AD6DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, March 17, 2026 9:22 AM
> To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Shenwei Wang <shenwei.wang@nxp.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO dr=
iver
>=20
> > > +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> > > +                              struct rpmsg_gpio_packet *msg,
> > > +                              bool sync) {
> > > +   struct rpmsg_gpio_info *info =3D &port->info;
> > > +   struct rpdev_drvdata *drvdata;
> > > +   int ret;
> > > +
> > > +   drvdata =3D dev_get_drvdata(&info->rpdev->dev);
> > > +   reinit_completion(&info->cmd_complete);
> > > +
> > > +   if (drvdata->protocol_fixed_up)
> > > +           ret =3D drvdata->protocol_fixed_up->send_fixed_up(info,
> > > + msg);
> >
> > Seems not part of a generic implementation
>=20
> Agreed. Lets have a clean generic implementation first, and then patches =
on top
> for legacy stuff.
>=20

Adding fixed_up hooks doesn't make the implementation non-generic-this patt=
ern is=20
widely used in Linux drivers.

Shenwei

> > > +   ret =3D of_property_read_u32(np, "ngpios", &port->ngpios);
> >
> > The number of GPIOs should be obtained from the remote side, as done
> > in virtio_gpio. In virtio_gpio, this is retrieved via a get_config oper=
ation.
> > Here, you could implement a specific RPMsg to retrieve the remote topol=
ogy.
>=20
> The DT property ngpios is pretty standard, so i think it makes a lot of s=
ense to
> have. But i also agree that asking the other side makes sense. What is be=
ing
> implemented here with rpmsg is not that different to greybus, and the gre=
ybus
> GPIO driver also ask the other side how many GPIO lines it has. So yes, i=
t should
> be part of the protocol, but maybe optional?
>=20
>           Andrew

