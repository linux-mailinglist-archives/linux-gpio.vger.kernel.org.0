Return-Path: <linux-gpio+bounces-35447-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mECfD9nJ6mmtDgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35447-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:39:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CB458D03
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 03:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54090301841B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35584282F14;
	Fri, 24 Apr 2026 01:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SEb6DTSD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B11266B72;
	Fri, 24 Apr 2026 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994702; cv=fail; b=QgFlcSMTxw/nIwr1SCh5NoVzSrIZVR3DI25BuLtnnaclzBYuLgHl3QmOXuEPoq45gaMKfz9fHw/rXMPK21QLx9InA623d75JDkhab68BLvi4dv7Vs3V82FE3mC88EK6uNkYgT2OGSF4PBjNU+QJ0c4V/TQFjJPbnEatqEYC+3ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994702; c=relaxed/simple;
	bh=KWdela3fq7dR8TMbDUKi9RTV3qXATAT84CU4NFkzqmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UIeh4wVnNfq63W6uByAvR7DW+AFywLosej+9XaMfQNUnwKcYNUFJt6RmIIUoK/WQNdwokLAJNH7L7Rqu2xV7hjhg889gvXCH1CJ9sfzZ9IeiLuYBKxBpUaNcllmG/rPGAeQYxIQFiGDZZE76ACorCAPAkkMQegaPXc1EHgwK1m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SEb6DTSD; arc=fail smtp.client-ip=52.101.72.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9LaX/CGiWgXprDJAQkP7UG9Wu+XVTO6X4CG8bHom6XH13kKoqWPvaKnL4pzhnqfw5gCA5RYYoQYCol3Hz0uI2MjHyCfW88VBgCPGIyqgbfYjY6NwfpSEsm4+eoND0Qy1F8HO/TkW273iFCsaBGpSogxEWwsZxyU6YJmYnjaOCYJ/8Z+bgpb617R7Ht0Ntne944giCve5CP7n45xdtwou6JG9AlClbawdo6HWSx+9Tmx7ohQtXpHx3YZyigKAt5erz4eMKbHD+WE3pfWhmW20idVo3M7h7awJ9yJtYxcurUycFzoJRd8ORj58iW+40qxnpYLJBW3XnoJHL1/FRYXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWdela3fq7dR8TMbDUKi9RTV3qXATAT84CU4NFkzqmE=;
 b=CFdoTvXc2aihGO2js75fXyhuI6lzc20byCSFH2uznftPjpaqwTWWwaFq2XrQ75ezZsg6GpUBAuknso+mRu5qmjHCvkQ98IlZYQVXNsLRoidaccWkvYuH/+RzHN3dLlQ52MONkFB3UPx2tpmeDW6RAn1agRoekEAN/04+kY40z6UZTB9IGWTp2kdaTHYEB+Obs99P62mUBM02ZqJtFT5k4LlycEFoAFqwFRevICI6I3MQdJWwTHEVMNP5yJqqquJf4Zd8eskD64N+JYItr7bKyB88iekU0uWLOJ350bl9fzrO0FxmNRDP+qqy4cGcaroZqKKMAicaW+1tHGdXDh6ymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWdela3fq7dR8TMbDUKi9RTV3qXATAT84CU4NFkzqmE=;
 b=SEb6DTSD5jTM/XK85m3/dwTrZSP9jFhDXqMULrXk+7HEhWwxW7aOrwkxrt5+MbybHnQphwo0qm8n8zuICjlZXl45QJM44dAPTyzUv4pnanYmtsF4l7hGgG3r7jVK6T6xrY9lrs6wMeCItvL4KRDKgOCfSAfBZx8ACy0r2D/MilGND9eSs6rx2RAyFKdLHiJpM+bqPqZYx3/Ts9TOmcHeGJnOI0tULIX3XGAMcH4PktqPL8kt9iqZ/M4tN4lgfsoMxUfnl+ayROnnSrilfSmwpjAh3UhTLMTFkqr7OpwSNcEYB6o1PW2DahWXi7VWlGApjwH4hkyUgxsX7s+a2n7/eA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VE1PR04MB7455.eurprd04.prod.outlook.com (2603:10a6:800:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:38:13 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 01:38:13 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH upstream review v6 1/4] dt-bindings: media: ti,ds90ub953:
 Add support for remote GPIO data source
Thread-Topic: [PATCH upstream review v6 1/4] dt-bindings: media: ti,ds90ub953:
 Add support for remote GPIO data source
Thread-Index: AQHc04ozq/C8xojH3Ei3RLCnGsffzrXtbvFw
Date: Fri, 24 Apr 2026 01:38:13 +0000
Message-ID:
 <AS8PR04MB90808B8FEBDABC41CAEAA7CCFA2B2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260424-ds90ub953-v6-0-a63cf480f8b0@oss.nxp.com>
 <20260424-ds90ub953-v6-1-a63cf480f8b0@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-1-a63cf480f8b0@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VE1PR04MB7455:EE_
x-ms-office365-filtering-correlation-id: 1c74d6c0-b24e-4035-2706-08dea1a22675
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|56012099003|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 fTPNa+U/7X4Oajo7uzNpUOSMuR17yoCcQvbs5Dgw/SpsVK/VywChM9YtcCFybWndWVlW/RrOQaKOo+ma2PyXvIcpTbpcShe8E4DxzA3z6EUaT05DVMEcL2r9zU5LJWTofS5DsfZG4DhbcCIYTjOUGYBEqhML4iTTTiazMxPgpVTyVONpiUo8sLuSLRIu41zPSj3kRmuxneKVzljlUHkwzTZLeLa7v9ORY3g/KtG3Bt7XPjG1BEypzxdPg/jI+yTYPXpPzWxod0PqJzpebheArKXdCTOz3GpRuohb43xwR5v3ZIpk5paDVAhfZHaFbdT9cVQJr4VB05ZSNtABpAgyvyze0KqIZkgDmcDDE5lx+Uay/0AmR1PHXn4ycxxoNxUGi+qS9dngNxt/KCiWG8KwE918vCR6Wc6k0GCKnc+hhYNLWLMl5w0Ze4SL/AIxgqVXsJ5jgMEAgfO1+69XSVUFvY0nl3bdjZrQCaAAS2MoZqEZv0m180AYqnX7ZgbbvYbA5TGtSc4bmDjg/yKO3Wgpb9R5cS65hRgy4+TAm056Jdj4pmp6WLoKmJT2zHHNqS7X4wUHIZtuSsTGG9iqEbj8grO0Foyos8E9C5/xJn5KXnRKOg44EjFzUjCuN0XtzJYFBrfolT9FtkDelmAkM6qzOxgtQX6j6dPDW6Qmq5ZtKilbuy/ca+mQ5lfr+J7veuxLFm6l5dr3WV4qVKcyl3eW2OCGeTO/o5oxbUVQV2ZAdfUCpPvLL83ASMjUE6BIBiu2I3R0od+un6yFj816+jB6MK7N798I1sp6vlhv/ZQhV1by4UDCiTjKnlcAKnHhqgiq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3hSU3pzbjFjMm5ZMEgyaDZoblhxN0Z4UjZMT24vZHkyQmR4bVFhMVZLZ0ZG?=
 =?utf-8?B?TzJ1cmRRRXNTNlhEbWlFb09YbHVoeWVQRi9OYVo1MzBjVi9ZcytHcFp3NG9K?=
 =?utf-8?B?a3dZNitJbjFZQ0xPV2RCM0JpcEJaL25aV3dwL2JKZXp6THdyaS9JdzdZQ1VG?=
 =?utf-8?B?bHVCb3l2dW5nTTMzOGpxRUttQ2JtTGVBdXM3ZG1nRzRNYnF0OVZyOW56NndN?=
 =?utf-8?B?a0ZvaFdVTVNMN3JNdmd1ZUJSczNRVitpbzhNUksxZ0xqOGt6emIrS3FGaTVM?=
 =?utf-8?B?Y0huYm1HMjhoQmZpWjJXSjdadHFtNXROZGF5VXcxLzZoL3BSVExwY3VYcCtl?=
 =?utf-8?B?STJKMlg4eG1Td2Mvd3BIazM0TmMvL0ptdk5lMVFMS1pkeUVTUGNLQnBROS93?=
 =?utf-8?B?TzF3UDJQTDh5WjVhdGxNMElTd1ViSXpFd0hFa2EzTk5kRFJKTVhRTkYwMm4r?=
 =?utf-8?B?M0tpS0V6MENmalU1ZEtYNW5EcWk0ck5XbkYyTFVkajNYbmJJRkNJcityNWI2?=
 =?utf-8?B?S0RGK3BNc2FVM3ZKcmR4RWhUL3FIRDVrNHNTQWdaTzBxWUpqWWk3VGRJYXlT?=
 =?utf-8?B?amFKMHphYVpzQXJJUTRzVDczOFpkeHQ1UFZMczBPUCszY0kxeUExSmlMejBT?=
 =?utf-8?B?eFVsKzF0QWZncnJSQ1pma1dvc2VWSW45dE91VVV4VGFBSytrSFYzazQ4ZkhP?=
 =?utf-8?B?eFFNVVRhenpRWThZSlA2dEpwMllDdW9lbnNBREtBYzNzSlFQMnI4UnFOR0Fz?=
 =?utf-8?B?dnZUT1dOd2xOcmZ2UFh2NHNaUVJOTnhKYktORHU4TXVCTHVid2d2R0NYaEFY?=
 =?utf-8?B?Q1NuODYzMDBhQW02ZERrbjJQb1hsRjJ2K3B6Y2g3bmFFeGhxTVBRaFc3NEty?=
 =?utf-8?B?SjlhaDRjZHBheEN4TWV1NTRnTVdBMys5WVVOZW5jWG10eW5vTk1jTjRjRS9i?=
 =?utf-8?B?QUFxYk96cHEzRHZkUzVad2I3b0xIblptZ05Ec1dEWDJ0dk9rWTh6WlhHYXky?=
 =?utf-8?B?MHozRmZvYVJyTjg1dU1GNkQ5VWI2bFlPeGhBamlqVHNLZ2dBSFBZVFp1UStu?=
 =?utf-8?B?TW84bVNtdFp0clRqc00wNVoyZ2R4RmUvWEUzWlJGOE95Si9QdTlwWHUrNVR4?=
 =?utf-8?B?M2l3YUt3ZFFhMGFDVG1CNTBRSTh0YU1QYXBKU1ZuSHRudC9McCtHU2dBdWRk?=
 =?utf-8?B?aGlEZDh3eWVnVmQzMXdSYlRHR0pzWG9MbncwSDMwcm5nT2NlckViRHViV3Bu?=
 =?utf-8?B?L0RjRG9ETm40QXh0WlVSN2FVdkJRdWZLaW02WkcwRFU5K251bjc0WFZoQ0Rs?=
 =?utf-8?B?VEpJVDg2dHRQZnR5MGlRVTN1YUkrQnliV2k3Ly9iSHZEV1lURjVjY0pITTVn?=
 =?utf-8?B?eUk4dm5kRkoyelVKVGlqUWxJck1GMDdsSkVBSmJDRFBZZU5kNjBVUlozZ2Ra?=
 =?utf-8?B?blhWZ3RWSURxbXN6VDhNUTRQL0p4TTFXRUpFakU0di92VUhpZXI2eHR3c2Vp?=
 =?utf-8?B?K1gvRThkTXU0SnRSYndKOGpRSHZncmxtVitKNlJlWmxRWmtOc3o5NkFkZnZO?=
 =?utf-8?B?dG9MaVg5cGxzZVJhTW0vZjcvaE5wVmpGaVJMbXhnZktIR0Q3RHNMaXBCQ1Ez?=
 =?utf-8?B?UERpV2pVM2FEbSt1Sll3R1FHL3IxZVpZZlUvbUUybUZraW1RRkNzRDdxVU53?=
 =?utf-8?B?UTJBY1hpM0lpa3gyU1dtcW5udm0xRXBJbnhkS0JiMzdSOW5qQmdDZWU1WWky?=
 =?utf-8?B?cFREclUwVUdadnZLbk95bXZ0eWtKbTNoS2NPbVhIeWhqWW5VNU54M2ZYdnZq?=
 =?utf-8?B?SXpHRUxMSitjTzk4c3VVeU9pS24wdmtyQlptRHAwTzNkMk1VcVBaUnRMZGJL?=
 =?utf-8?B?QTladHNJc0RVL0xqaVZZTjJuYXRzMmk3S2grbFd2WnoxZVZlcWJxcU0wcllG?=
 =?utf-8?B?di9XZTlzKzRDNXlEZU5nU3RQV0dSYTlSR1hiTWo4UVFYN0FwMG9iZ0NZbWpw?=
 =?utf-8?B?SUNsZ21EUFVibHROSmRuODVIL2xJeHRjVFg2eDR0aThMUkowWFdkMU9jQVFo?=
 =?utf-8?B?VW1GSDRwYTByeDlQejRhRzQvZ0pUNDRNQkFUWjkxM0xrQTlrY0gyTm85NkNl?=
 =?utf-8?B?VFFqRVlxcG5FZExyZk43U1FXN2ZmeWNMcWZYQVEvdFZGT2ljSmovcjhPcThz?=
 =?utf-8?B?cmJwTmc2WVlkVlhXK3V1RkJ4NmFjL1pVeGg3cUFIdHBmQXlwTzd3UFYwNUVt?=
 =?utf-8?B?dGhQL0J5c25VNjZoOWRmdmVxci9tWGNmTU5rcU5aZmNQNXFyZnl1em1QVWFa?=
 =?utf-8?Q?R3DSPM/tNypvVp3cjz?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c74d6c0-b24e-4035-2706-08dea1a22675
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 01:38:13.4729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lRW5Z+cav5v4C3N5sCfAGu3XUdZyqi8SQIodmt26mKKASoG4ZK+EA5Ia3NCn1b6aq/sWvYZmEaujn9BTw/qtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7455
X-Rspamd-Queue-Id: E75CB458D03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35447-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

UGxlYXNlIGRpc3JlZ2FyZCB0aGlzIGluY29tcGxldGUgcGF0Y2ggc2VyaWVzLiBJIGRpc2NvdmVy
ZWQgYW4gaXNzdWUgZHVyaW5nIHN1Ym1pc3Npb24NCmFuZCBvbmx5IHBhdGNoZXMgMC0xIHdlcmUg
c2VudC4NCg0KSSB3aWxsIHNlbmQgYSBjb3JyZWN0ZWQgdjYgc2VyaWVzIHNob3J0bHkuDQoNClNv
cnJ5IGZvciB0aGUgbm9pc2UuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBBcHJpbCAyNCwgMjAyNiA5OjM1IEFNDQo+IFRvOiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47IE1hdXJvIENhcnZhbGhvDQo+IENoZWhhYiA8bWNo
ZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRv
Zg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47IEZyYW5rDQo+IExpIDxmcmFuay5saUBueHAuY29tPjsgVmxhZGltaXIg
WmFwb2xza2l5IDx2ekBtbGVpYS5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxsaW51c3dAa2VybmVs
Lm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1n
cGlvQHZnZXIua2VybmVsLm9yZzsgRy5OLg0KPiBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggdXBzdHJlYW0gcmV2aWV3IHY2IDEvNF0gZHQtYmluZGluZ3M6IG1l
ZGlhOiB0aSxkczkwdWI5NTM6DQo+IEFkZCBzdXBwb3J0IGZvciByZW1vdGUgR1BJTyBkYXRhIHNv
dXJjZQ0KPiANCj4gRnJvbTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+IA0K
PiBUaGUgRFM5MFVCOTUzIHN1cHBvcnRzIGZvdXIgcGlucywgR1BJTzAgdGhyb3VnaCBHUElPMy4g
V2hlbiBlbmFibGVkIGFzIGFuDQo+IG91dHB1dCwgaXQgY2FuIGJlIHByb2dyYW1lZCB0byBvdXRw
dXQgbG9jYWwgZGF0YSBvciByZW1vdGUgZGF0YSBjb21pbmcgZnJvbQ0KPiB0aGUgcmVtb3RlIGNv
bXBhdGlibGUgZGVzZXJpYWxpemVyLg0KPiANCj4gQWRkIEdQSU8gZmxhZyBpbiBzZWNvbmQgY2Vs
bCB0byBzZWxlY3QgcmVtb3RlIEdQSU8gZGF0YSBzb3VyY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4g
djY6DQo+IC0gQWRkZWQgR1BJT19EQVRBX1NPVVJDRV9SRU1PVEUgZmxhZyB0byBkdC1iaW5kaW5n
cy9ncGlvL2dwaW8uaA0KPiAtIFVwZGF0ZWQgZHQtYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBhY2Nv
cmRpbmdseQ0KPiAtIERyb3BwZWQgUmV2aWV3ZWQtYnkgdGFnIGZyb20gUm9iIEhlcnJpbmcgZHVl
IHRvIHNpZ25pZmljYW50IGJpbmRpbmcgY2hhbmdlDQo+IA0KPiBDaGFuZ2VzIGluIHY1Og0KPiAt
IEltcHJvdmUgdGhlIGRlc2NyaXB0aW9uIGZvciAiI2dwaW8tY2VsbHMiIGFzIGNvbW1lbnRlZCBi
eSBDb25vci4NCj4gDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gVXNlIGZvbGRlciBibG9jayBpbnN0
ZWFkIG9mIGxpdGVyYWwgYmxvY2sgZm9yICNncGlvLWNlbGwgcHJvcGVydHkgZGVzY3JpcHRpb24u
DQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIE1ha2UgR1BJTyByYW5nZSBmcm9tIDAtMyB0byAw
LTcgdG8gc3VwcG9ydCBHUElPIGRhdGEgZnJvbSByZW1vdGUNCj4gICBjb21wYXRpYmxlIGRlc2Vy
aWFsaXplciBzdWdnZXN0ZWQgYnkgUm9iIGluc3RlYWQgb2YgYWRkaW5nIHRoaXJkDQo+ICAgY2Vs
bCBmb3IgR1BJTyBjb250cm9sbGVyLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBSZW1vdmUg
bmV3IHByb3BlcnR5IHRpLGdwaW8tZGF0YQ0KPiAtIEFkZCB0aGlyZCBjZWxsIGZvciBHUElPIGNv
bnRyb2xsZXIgdG8gc2VsZWN0IEdQSU8gb3V0cHV0IHNvdXJjZS4NCj4gLS0tDQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL3RpLGRzOTB1Yjk1My55YW1sIHwg
NiArKysrLS0NCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA4ICsrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy90aSxkczkwdWI5NTMueWFtbA0KPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvdGksZHM5MHViOTUz
LnlhbWwNCj4gaW5kZXggMmUxMjliZjU3M2I3Li5kYTYzNzcxYmMyMzYgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvdGksZHM5MHViOTUz
LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2ky
Yy90aSxkczkwdWI5NTMueWFtbA0KPiBAQCAtMjEsOCArMjEsMTAgQEAgcHJvcGVydGllczoNCj4g
ICAgJyNncGlvLWNlbGxzJzoNCj4gICAgICBjb25zdDogMg0KPiAgICAgIGRlc2NyaXB0aW9uOg0K
PiAtICAgICAgRmlyc3QgY2VsbCBpcyB0aGUgR1BJTyBwaW4gbnVtYmVyLCBzZWNvbmQgY2VsbCBp
cyB0aGUgZmxhZ3MuIFRoZSBHUElPIHBpbg0KPiAtICAgICAgbnVtYmVyIG11c3QgYmUgaW4gcmFu
Z2Ugb2YgWzAsIDNdLg0KPiArICAgICAgRmlyc3QgY2VsbCBpcyB0aGUgR1BJTyBwaW4gbnVtYmVy
ICgwLTMpIGFuZCB0aGUgc2Vjb25kIGNlbGwgaXMgdXNlZA0KPiArICAgICAgdG8gc3BlY2lmeSBm
bGFncy4gU2VlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4gZm9yIGF2YWlsYWJsZSBmbGFncw0K
PiArICAgICAgaW5jbHVkaW5nIEdQSU9fREFUQV9TT1VSQ0VfUkVNT1RFIGZvciByZW1vdGUgR1BJ
TyBkYXRhIHNvdXJjZS4NCj4gKyAgICAgIEZsYWdzIGNhbiBiZSBPUidkIHRvZ2V0aGVyLg0KPiAN
Cj4gICAgZ3Bpby1jb250cm9sbGVyOiB0cnVlDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
dC1iaW5kaW5ncy9ncGlvL2dwaW8uaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmgN
Cj4gaW5kZXggYjVkNTMxMjM3NDQ4Li5kMDRhNDk0ZDk2YWQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmgNCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9n
cGlvL2dwaW8uaA0KPiBAQCAtNDIsNCArNDIsMTIgQEANCj4gIC8qIEJpdCA2IGV4cHJlc3MgcHVs
bCBkaXNhYmxlICovDQo+ICAjZGVmaW5lIEdQSU9fUFVMTF9ESVNBQkxFIDY0DQo+IA0KPiArLyoN
Cj4gKyAqIEJpdCAyNCBpbmRpY2F0ZXMgdGhlIEdQSU8gZGF0YSBzb3VyY2UgaXMgZnJvbSBhIHJl
bW90ZSBkZXZpY2UuDQo+ICsgKiBUaGlzIGlzIHVzZWQgaW4gc2VyaWFsaXplci9kZXNlcmlhbGl6
ZXIgc2V0dXBzIHdoZXJlIHRoZSBHUElPIHBpbg0KPiArICogb24gdGhlIGxvY2FsIGRldmljZSAo
ZS5nLiwgVEkgRFM5MFVCOTUzIHNlcmlhbGl6ZXIpIHJlZmxlY3RzIHRoZQ0KPiArICogc3RhdGUg
b2YgYSBHUElPIG9uIHRoZSByZW1vdGUgZGV2aWNlIChlLmcuLCBUSSBEUzkwVUI5NjAgZGVzZXJp
YWxpemVyKS4NCj4gKyAqLw0KPiArI2RlZmluZSBHUElPX0RBVEFfU09VUkNFX1JFTU9URQkJMHgw
MTAwMDAwMA0KPiArDQo+ICAjZW5kaWYNCj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=

