Return-Path: <linux-gpio+bounces-31476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBfwENSphGk14QMAu9opvQ
	(envelope-from <linux-gpio+bounces-31476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 15:31:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DBF4010
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 15:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A945301C15E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC185221F24;
	Thu,  5 Feb 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LaP5NXWm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D05218845;
	Thu,  5 Feb 2026 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301844; cv=fail; b=s3RLQq6NmcrAWYpbLn/QA5UPIGJQYioLbXuJYNxLcIgL2TvFux2y6xh4bd/2RXVQemYHGUKTZCRD1psk4GWBN8OpTa9ne3qt7+L79UxrgmqSm6NCHT1s8delV8GeFO2kcaLxSGoupuliX6I4FG11bC6bu7qS7Itk2KRwOl7qDrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301844; c=relaxed/simple;
	bh=TzkLbUMx6HjX+zkm1Dzd6ID88pGALxsETNE7rZzEaJA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mJCd5+uVs2yNy2am29WenD4ZrUDp/Vhi5Y/UkUFhDkb7T0EeICpLIBJstfMFczceVKnptvejNS9YmlnXZO8uuZxpynjRL0VNEfeookres7roB9GJwi9RSh0tGyc55B8XqkUyNXgrB9UsRZ+Zz3laVkpcRvYLn666qMX8tsw8ArA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LaP5NXWm; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp3g+AzM5sZ8NddxXnbDAXEpib9lhAE+x2xiTb2EoRVWngyHDgj4rrKaF0/5nyeXwof5lGzYAqDXN6o5SoaX4gpVpsY4NFZ+evJThHDWpIBfwCRD6fQQpOfPZqDcf7DCfmotV7DI7iCN5ogcIONZwZT6hJC9yPLRgUb5lP1qqyRjc1P6aR6lgA622K1Rq/lOzf/s33jKRuwDe+Gt9Gwk15Q7WmrSdb02hsziv/L8L/SW3Z1YB1LcbZjZSJkfEUL88qzzDIVEHO83/UmaqM4fMgjudAM3AyKwtXSkaS+A0YbLMun5xQ45c0FsKLw7kl9syN9/RC1yCe2e9tyGx05Fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzkLbUMx6HjX+zkm1Dzd6ID88pGALxsETNE7rZzEaJA=;
 b=y1EhbN1SnQ7bzZxrViiwxWFmLpEB+TdaZcveIQGBjxNOCGb6zBO2JOm6EdYl7/M5iXZAtJYaXC1ca1/+dsBaUFTAP0Cua+gM9dX+70SxCDuT3pH6PVZ0qhDKKS+5ggadznZJjA4yZbo8yELr52ilQew4KG3fP54KMDDV21keK1RXZVlzJn9pOx9dFzIw8PpAeLUPHQgDcAaXNFGgVC+Nl1GJZIq3CsZnEwxWpj6AAMR31byWY3Lu+p24SnEfsgHrMsDZBjbC/yy2hLNuqSTQ0zYh4DHpwwz7oqDmy4XBrTlo0YOcer2ti+L+WQYwqZgLU7/3Cb624KZsLR1m8/DGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzkLbUMx6HjX+zkm1Dzd6ID88pGALxsETNE7rZzEaJA=;
 b=LaP5NXWmxaSpLnXI57yfi3sWgOO8vy8BqNi9v2d6sKJqdtOi8S33LAFuUeEg+a+Q37BNVJmZxHgZz/x5JFzOLAxGX5r+ILDdWsYg5mhNs+tLoEg/hQ+hMCBYkPFie/DqKJsKgVQ2na/iWhyG5Dh2Yc6g4ZeKoWcCE4KQzllao+8=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TY3PR01MB12091.jpnprd01.prod.outlook.com
 (2603:1096:400:3cc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 14:30:40 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:30:37 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linusw@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>
Subject: RE: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
Thread-Topic: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
Thread-Index: AQHclovX67Ng6jf6IkClqFCQAxAm9rV0AhaAgAAI7cA=
Date: Thu, 5 Feb 2026 14:30:36 +0000
Message-ID:
 <TYRPR01MB1561934DB60CE0C07D39264D78599A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260205120433.iKQIknOA@linutronix.de>
In-Reply-To: <20260205120433.iKQIknOA@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TY3PR01MB12091:EE_
x-ms-office365-filtering-correlation-id: 76c0cc84-ad6e-45ca-c31a-08de64c32112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Uz31mcg+BlxD1LAfnJx0eor50LWJqTVVsL5B6P5RATylJWDkB0PqYsV+grRa?=
 =?us-ascii?Q?GAZ50Qdxx+oQ2w9Biz5L7dJm/bNOsjVgSW+crkb65+PWueTsBET/pz0EHpyo?=
 =?us-ascii?Q?EbD/vjSnHYOD1WP0aqsZF/L5F86THiBXsLjCdUPVe8JVonjNWPBzKlgPoo0q?=
 =?us-ascii?Q?RiP8qKXOgRTkSKNhEGXyWD0g6d/l7R+lknjr9zdHPv3mbRN1YTxYQE1NJlSI?=
 =?us-ascii?Q?y+atJdh8wkUicXK813uPSd/7MgOmgdh4bwbMun95jdjJ88tfnewTvg5F7Q1R?=
 =?us-ascii?Q?TaOOYQjQ0DfGQgfAKEccLbRe8Ypf6p/1tnfDntnGWyCNINDeno4D0izHtB4O?=
 =?us-ascii?Q?eN6M8Cc3p6W1iRF4giE54mxrhhQncWnP3vjrdSt61M6klA1B1e2INKbPMFpV?=
 =?us-ascii?Q?3DhK1Pq2kvL9Ltx1atMR1GmLdCJVmPKuoC0jBoLKxiMIJy8zN+OGcy1m+gnu?=
 =?us-ascii?Q?+8sUeM7E24mhpVuuXII7yr1cUxWwsujAgy/+98WitSgtjQRcApsExMxFXAqR?=
 =?us-ascii?Q?i/6C6A1d/UHoOmbSjftdr9FuOJsmxMrC68CoEm79ryI0qH7Yki2lpiW0Pqeo?=
 =?us-ascii?Q?nr5T1AjLg3NUrrAzIFy5UGWr6FngHrZixm4aCU6tFsm1n2MTe0UoXQtMi88z?=
 =?us-ascii?Q?0jMWt7akPqz4zZOJ3aDIhTjmTTAVIipbrzgH8t6wn1i4COh9xW5UXXWrQmGM?=
 =?us-ascii?Q?jNWh/CpKXoMCRScUuxsTMamFRYGweYOXTvEBg/bWZZFYwgpIW0C1ZWfyKHnn?=
 =?us-ascii?Q?YJMhMN2g/SR5VVmG9C0Du9sbDck/H4X/xgZj23cDiW3ahE8hNB+6n9O1SrRJ?=
 =?us-ascii?Q?mP7LAEThRo8mi8/jkCOwdRhvpRNGE5MxBkeujiC5NKdtjNtU/0X4dPCEsgTq?=
 =?us-ascii?Q?d3Zp1LzWVO+pMxUNslHj6y3KIoQjUAFax6djozBMgb2/XrD5MuPMHE4kjhj8?=
 =?us-ascii?Q?XqCJLFIO116n6FMZjfIfVn2/ri8jqM5H3MiEPgImoJk0ILYgqYZPTnIm5N6R?=
 =?us-ascii?Q?xonGb/ASjmYKS6maKOTAJ44kInqhmUMOWGUzPJg2CoAynRNgNLCuN8Q/qZPO?=
 =?us-ascii?Q?51PabwpXjpk44ssTi4sgMQ5W4rKj31NmzSYDpCUNMhkCC5+5rEtx7pp60svV?=
 =?us-ascii?Q?K3kywMsejjXclnjQgJAx3JuWOzPiNvYAlPY2JDpjiZuiz744BeXdyFmsT9t2?=
 =?us-ascii?Q?JdPi8bV2KdAvGupDMz4f+hdQLwzXd8lj2FaXyBG87wJfKbSTcV3IoP040Egu?=
 =?us-ascii?Q?rU5+cnJ4FuSysBqCECqB/1YpWYjsdhHsKMeKluw5KSQnWXiuCxH2V0FaJ8Ww?=
 =?us-ascii?Q?1KdmpSwA7CdwBwza3uR06hC5X6QQL7brY4AjiIPSHjK6Kfc5WFfaVvS+1CCf?=
 =?us-ascii?Q?Nv3f1CrFONErkmzEq2b95pOaO6F5r8qxREVIPpN9tYISdRjdSNsA5vZ+mys8?=
 =?us-ascii?Q?2M6eBOoKQHwO1PLLt2zESgEhua7WP5PPwzxcEowsj2K0gHm2knZ7Ru6lNKRa?=
 =?us-ascii?Q?kq4vuTfCPw6VvDjxpZ43nrM1Cx2CSpWl8V3UtC6pTnTqVvvRs4smSbD4BX6A?=
 =?us-ascii?Q?HJdhy3qUqrNSywFwa7IjJpJPXMhL/vX5bEAH7uozftlfVJgGwj0jiJKeDc6W?=
 =?us-ascii?Q?gyjs7gV0mdIK+GkhQOcNi3M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FlBfBA76QgDO324cto7hpuKNPvxdwNjYbcN1CVsvh9bDqmSSAGd825Xn3OjY?=
 =?us-ascii?Q?USIxO4mdIBZrHiYdoGSB0FXTrj53jFTqV+s0SpRu6AdrUJ19ET5WKRsB7Fwf?=
 =?us-ascii?Q?XndqGfE50qs4gf6+5LuGPG01bfWSA2q6ZqDRS8Cia1eWk+lDp0cMOzodckA+?=
 =?us-ascii?Q?VivtSwTSzEjNgp1+6KoC40hk2o27TMHH3AvyOwsIskQjC3iwuSak5Ls/qmJb?=
 =?us-ascii?Q?XA3+RCZROoSo2Rh83MrrYKJGJWUfx/Mi+4PSDEh1nFLlSw7+LhDIEfzV7VjM?=
 =?us-ascii?Q?9yhvGmr3gHwD38ZubiU2r07ptjgY+InHlYorPs2deRZfL4Ak9SqHd+wr1OeV?=
 =?us-ascii?Q?sznpjfozK3jscGUMVNcnXAz1QL1hBO0cuGIgwYAc2XcKE8smtEaWSnhrF8ys?=
 =?us-ascii?Q?2i39vXQX13iE29QWue+YoAi8iMuUkgBUGCaErJu2neSNjKa+jv4mVgilbZo5?=
 =?us-ascii?Q?s0L85cSYQk2ELWLrp3LctlfpyGXHTNPmWJZQW4x/wR9Ks3PYzbjpTNDNmFWi?=
 =?us-ascii?Q?pqza6qJnbwS76TdUxNjdMbFnKin8YOulkh1mWrkJ33hWT7tlYOVPsuyxRLen?=
 =?us-ascii?Q?HEHugZ1HTFryg+JeCXyQ8FzLg3K/ZEKua4vfnKb5Ftsg97v6b06WxpfmpRhM?=
 =?us-ascii?Q?3YXrv77GLAyIbrvhFS/KCmjfZeuUL23UVEzTGgkKGVAyQpsz60e/1LEhPLzN?=
 =?us-ascii?Q?J+NwmqLCRVhe2+CnLROtz9NlGSf7gi5a4VjdJRriJ5t6C0yOlHQDiwyme4RW?=
 =?us-ascii?Q?V+De8VQWoIThvcaznInBpovqksL8YocdAtATuBse1MPfj5Yfg2Ex9qAynRP2?=
 =?us-ascii?Q?fxYvPxIHU6KhEpbGJSDnEmeL8cyJAtGwngbPOIAxC3IFZpCcIfVgvWkuUJCV?=
 =?us-ascii?Q?TXqyIfrhvaHfbWrnSmkiwNBwdKweewWN66A1v/iLZAvDXIkNxWglWe/+uIgT?=
 =?us-ascii?Q?anw5t4B42G1+qlt6r9DaBhNEfgmj2IObmcT9YlJf+9vGpg3oJcuP2JFT5AWX?=
 =?us-ascii?Q?DAmghD6tZqG7nb8nGYolkIWVoqEkCKVOnvvL1uT+FALozuIfd/xtMVQsXWM4?=
 =?us-ascii?Q?jpJNaUluWBuAmbsgQoijHDEnU7Hpiv/suEI9r20UfaczuujnG4lJL70RylAn?=
 =?us-ascii?Q?eulhogfAltiSyCL2g5OZIvK5j0vHlT1EzjrAD35etCq1/eHxVwkuoC4D8aHF?=
 =?us-ascii?Q?An5Mqpgqm/lHZRcRHgYKTpiLjbd1AiRnDVFXIw75l2Y6orkcAGpepCwjW4ne?=
 =?us-ascii?Q?UsasyLA8CDBjf7YoHq3t6gXdU+mfh61Ln3MfBwHe5+z/4IFmzIR+EPyNfHa/?=
 =?us-ascii?Q?mFXOHbmezps1Dp0M9czonvWtkydHcD54wI+Rs7Gt/ZDWaKrRCojGDbgaaHEm?=
 =?us-ascii?Q?wtPpuluunbRQ1L4OaMGK4AoE7J+ZkPRRNK2H9vQaX1F55Pb3N0jPeMATP8Ox?=
 =?us-ascii?Q?HGDoD0OZMvGCmYLj6QudkGPTjbX+8MGldhBOY30REogTtBwOaV5LGRktJ7QP?=
 =?us-ascii?Q?6aqfhlD1jWyDRT5QZHQcFNApu4k0XJvy0Ud7FbkDtpOiECVO8xGFoP0dMHcV?=
 =?us-ascii?Q?UL9lkNOyvpE6zEq758KXWHYSQJbz4hIKe3hSsX7N7/HCTE/fuN0oHU+yaaiF?=
 =?us-ascii?Q?cne8R/Qz9PIknoc+zoTjTcBsWvfFrIdlECir6eNUMvz9hfucne55aSFREIgU?=
 =?us-ascii?Q?CMdua0EiGENOeYBRU+PZyxO1B+VTmUFNzb/yWsGZp58cGyd8czBiRI4LQ9Ci?=
 =?us-ascii?Q?k8MXWRV3gG5VWNewSoakX+sNViVjvBrfA1lqStVK/LBB0/9CFTZJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c0cc84-ad6e-45ca-c31a-08de64c32112
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 14:30:36.8823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB6Ra+s6uPo5ey06T+eAOykWs/g75KEPo80plROkS9/9P8KRDiFc2lHEj/Dr9EXOfgD1D/pJRRl1dOJgeWmS/ovDhKhnXpA/bjhWNC6/R5XVAENAp055LSOs6CQdtNzz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31476-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email,renesas.com:email,renesas.com:dkim]
X-Rspamd-Queue-Id: 8B4DBF4010
X-Rspamd-Action: no action

> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Sent: Thursday, February 5, 2026 2:05 PM
>=20
> On 2026-02-05 12:39:30 [+0200], Cosmin Tanislav wrote:
> > The rzt2h_gpio_get_direction() function is called from
> > gpiod_get_direction(), which ends up being used within the __setup_irq(=
)
> > call stack when requesting an interrupt.
> >
> > __setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
> > an atomic context. spinlock_t cannot be used within atomic context
> > when PREEMPT_RT is enabled, since it may become a sleeping lock.
> >
> > An "[ BUG: Invalid wait context ]" splat is observed when running with
> > CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned cal=
l
> > stack.
> >
> > __setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
> > serialize access against a concurrent hard interrupt.
> >
> > Switch to raw_spinlock_t to fix this.
>=20
> I don't like the reasoning here because it looks like "lockdep
> complained lets switch the locks and everything is fine now".
>=20
> It is required to make the suggested change because the lock is used
> in hardirq context and only while accessing the HW's register.
>=20
> I just don't want that a lockdep splat becomes a green card for these
> kind of changes without understanding the consequences.
>=20

Hi Sebastian, thank you for your feedback.

I agree that a lockdep splat should not warrant a spinlock_t to
raw_spinlock_t conversion since that's not always the correct solution
for it.

This driver delegates masking/unmasking to the parent IRQ chip, and none
of the local irq_chip callbacks take the pctrl->lock.

The pctrl->lock is taken in the gpio_chip->request, ->get_direction,
->direction_input, ->direction_output, pinmux_ops->set_mux and
gpio_irq_chip->child_to_parent_hwirq implementations.

My understanding is that the only issue is that ->get_direction takes a
spinlock_t while being called from __setup_irq() which holds a
raw_spinlock_t with IRQs disabled, rather than spinlock_t being taken
inside a hardirq context, which is what I tried to describe in the
commit message.

Am I missing something?

> > Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to han=
dle interrupts")
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>=20
> Sebastian

