Return-Path: <linux-gpio+bounces-6664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE068D013B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 231701F210FA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A7B15ECEE;
	Mon, 27 May 2024 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ejCjVRhS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18AD43AC1;
	Mon, 27 May 2024 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816085; cv=fail; b=f1tWFNH5E06QigMN1U2OWDeNn1tblNcG9/R0rtAruUYVc2oj+oRMbZgOEmJdlWal8mYejSmRucsgxmscKcfZNBOCaIvLMYgIEmHYJjxf2yH/rJRSwfOdFXySj/XbAlXHE09gBT0HNO5p5CWKNniiTJW6tTqGp8A1HXoZ8N0j3cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816085; c=relaxed/simple;
	bh=AlkR+tFwWXTFwTTwA3HjXOOESEft+WfMDIvdi0c3AT4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X8U7O2qzrfKMaN/gSwvYU6DKzhfFpQiYjegSBopk4Zx/Wpq9LduQMEKGvJRQD6e5VMMrix0oGcOys4P1ED3hgVCeX4V4wKWzyL2IbrS7LsXPj62mjUyHQbqBb5we/4mgNQk/cfG2O0HJrIIJsgbXVSNfreaumkiLEdXP3fqLptg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=ejCjVRhS; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHJwjtEv49xbJCH/AVV6VNj0CvbFLvIg+0RkNI7VgfH+D7e0xaBqoTiSjZU6BJsjLDmT/1j0py0F5NxvYsAqHDwfrfLUYg43usT/jp6y/a4eib3BMYwRWCbjBZQqOhLINZRjBp2kLW2SpKgH0a7DMhNlQXQrma4okEh2fpgv0ei1SHWWsms1H7Msib6TQqfrB9otl+qA3dcno7wUD82ODkwKbu29ZDCjdncG8tq9q7jVIOLDv204s87He0tGJPmMNPx4jqJAwnB3geMBGXg4IoIVuTe/1WayvVGRdocjHl4dgxRx6FnkWFk4Nq5Nct3VZQXon13eZi2TTTAbJYafwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlkR+tFwWXTFwTTwA3HjXOOESEft+WfMDIvdi0c3AT4=;
 b=L2jeijvxvdADVQ6/C1dOxk25WOWQ14PaTA0Ixv5nIRBDPFWS021TA25kXCZ4wBcx12GplF5OPIcyBA8Ti4alcJPZhCcUxsoSMcKPudsFkNq7j6oEwp04bBKqMCh/bAEicovWvDXUaw4mhGTapo3bUIkgr3gos7wQFTAVadynC5kT2nHp0gtxFBcgqHe0Fp5K87MMX4JU56mKfFpMlCvgEbi5PkYpz4JG3hzifgXAhIakptYLUJ1IqbjjRjCXuPzd2Z6BPP0P32nMg0Fibugg3r8aAfoCw2AMvA4EM77ytAbO60ST+FvBX7BHAc3Dj+T4JI/AbgQiUuYx53umPKY2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlkR+tFwWXTFwTTwA3HjXOOESEft+WfMDIvdi0c3AT4=;
 b=ejCjVRhSIGGw4mlk+lHPj4iZ56Iff6aPhUxyn1TEameLiw4zHt25BIaCQk/cl0k/jLh1vmNLkYg/iK6jj5Tb5T5vps8A3EYQhL2R/+jWAAJdUOCuLh9UqpLBFC5DxtdtEGQ80oLOs/MnX1p3gXA46TMMSh6ME9JfnAEc5DDlbbE=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PA4PR04MB9270.eurprd04.prod.outlook.com (2603:10a6:102:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 27 May
 2024 13:21:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::557f:6fcf:a5a7:981c%7]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 13:21:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z+AFfJc9w7tEOWjM+RsEK2hrGqyxrQgABHMICAAAfJ4A==
Date: Mon, 27 May 2024 13:21:20 +0000
Message-ID:
 <DU0PR04MB9417329E3140BBE0EF734BCE88F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <DU0PR04MB941718F15619A907C15AA18588F02@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <CACRpkdbpLcxZ0YNdvYCS3bpyd3e6Qx7Wf1Ju9Buy-TvkBQoYDQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdbpLcxZ0YNdvYCS3bpyd3e6Qx7Wf1Ju9Buy-TvkBQoYDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PA4PR04MB9270:EE_
x-ms-office365-filtering-correlation-id: 6031f610-df16-46ee-9d03-08dc7e4fe61f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?eEFlQVJLQ0dsRmNZWEIwNlZ5WXkrNG42T1NVc2diQ0pzUW8wMDUweStLTm80?=
 =?utf-8?B?UXJDUWJXVFU2WnBjMUg5N3lIcS9vaHdtdTM0TjFweThCMHovSHVxZFh4bFdQ?=
 =?utf-8?B?dzlFZkJGTnR1ejhJQjJDbVllem1qN3FIdUZIUnJTbVg3c0I1ekdUUUhWYlNE?=
 =?utf-8?B?YnZIQk5US3hPQjM3U1lKem9LdXdEcUlrcWN5V3JLQ2Q0Rmw4cmxhVE02QWkx?=
 =?utf-8?B?SDMxdkJ0RUR6YnlsdjlrRzRzaDZUT1pLWi9OSkRyZkZmaXEyN1ZoR3l6UG84?=
 =?utf-8?B?eHZmMW1wN1ZlUnZ2eWRmUWRQZkU5dDRGZ3FXcEd2SVhUaEVkTHFSajhKY1hB?=
 =?utf-8?B?d2VTaURqTXorano0bkI2c3FiMzdrRVdtMEJiVzFUOFJHbXVILzVoeklpT0lB?=
 =?utf-8?B?YzlWakdseTBXbFpkV1VHQnRIWXl2RUlnZnAzMmZ0NGhOS1Qvb0NnbFpkc3NJ?=
 =?utf-8?B?a215SFFBcmpLdk53RGsvcXB1d1pPckFtS1NtekVxNlF3SkVEcG9YVXBNWlRN?=
 =?utf-8?B?THRLM1ZiOHJuRzZOUCt5MmplVWtHL212cXlJR01OR09WSFZZQ1g0c2N4NWU0?=
 =?utf-8?B?L2d3Y3J6WjBXemo2SlFBNmVPaXFnWlZGRzdidE1LYnNTNXcrUVgzQWVyZzFT?=
 =?utf-8?B?TUd6Tk1OT09GTGlueUllNHVOZ1hjTnpqWmNSR3NqT094Wk9sajdZUVh1Sm1H?=
 =?utf-8?B?NkttSzZxaGs0ZVc2UStvejVZemt2NGNUS3JyZC9TTHRKVHJyQmQ2NkROTmtV?=
 =?utf-8?B?dVh1Y2FZc05SRTJSMSt0YklQbzFLK3BtK3dhdWNVQWxwRWNiTUhoV2YrOVpP?=
 =?utf-8?B?QW1sbFhhWGJlZkdLOXpDYk1VN3FMd2NMZm0wMnJmMXZyVnQvSWR2U043QXZH?=
 =?utf-8?B?OFRWUGEybEZ2NjJNeVdJcnNONXdqakxUc01xUDBOeG5USDFmeVBxYkpacWRk?=
 =?utf-8?B?L2RSd1kvTDFPVkVaQ3VHQnRaY2h5OGNNZ3dBT0hTQkZQeS9ZTFliWnoxb25a?=
 =?utf-8?B?NSsrM2NuK3pmOUFJY1hCY0RNczJKUi8wUHZYcHpkd1hiWEMwUDAzZHJSSG1n?=
 =?utf-8?B?VTZqc0M5OXhrbmlJUVBSdTFVRGtFU1E5VHBOcFVTZkx6bnJ3Mmh6bjU5YjRn?=
 =?utf-8?B?MG9Wdmx6MGhiTVh1RGd6cUIvRk54ZFBjK3pKa0FmUmJVcno0WVIvRUNiWTh3?=
 =?utf-8?B?UEw0SVVqZnFVZVpIRW1Xa3NwbnBnc3NGVktHd3pObERaTlo4eUY0NEpjSnMx?=
 =?utf-8?B?Q28vclhQSW11Y3JFQmtyUVViS2JTYTd1WmJuUEhYMDJVdExIMVhqeGpoNzFZ?=
 =?utf-8?B?NnJOUExLZHhVNUlrNUZSaTg2K2VOYnRDSFd6MXVmQzY4ZTdjRStkbzhWUG1F?=
 =?utf-8?B?UmJ1N0hhTmdId01XbXl4N1JodXZxTGZJY2VoWGFXQWF3dWgyMzNaQmFCMjcw?=
 =?utf-8?B?NDlNMEVCK2tIaTF3Z1Z2aUlVZUthaVFrU29RVDlWSk9NTk92anhEb0xaZk1U?=
 =?utf-8?B?SmtkT2FIMFdKbXZsR0gxUXRVc3hnMDdUN28rL3dML01EK1VTRTFBdWFLOEUv?=
 =?utf-8?B?aUtlUVFtZk9tWDk5Y2hKd0VBR0Vta0ptZjB3K3ZnRy9ZdXdDN2V1U2V0eGFG?=
 =?utf-8?B?V0J6T05Oc3AzRmY3WTBTYU91Ym9oUjRFVGRyOWV0SXdUaDlReGpTaHdhRk5E?=
 =?utf-8?B?a1Jmd3ZYbnptYzBNOHh0Mzg5L3VwaXdDOFc5YVp1a2tBRE9yWk16a21GdDhJ?=
 =?utf-8?B?eUJEejF0SVVxZGhrd1BTWGVuWnByTmxyeHB3aFNGU1lQU0haZzgwNDd5VFFW?=
 =?utf-8?B?aFRTeGN1MW1HZlo5eEEvZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDA4Ni9WMUZNK3JuaEU5WVJQSFNsV1ZJOGxEb3UvYXBZeTUvY0p5Y3pwd3F2?=
 =?utf-8?B?bnVGakl2bXlMaEV0TUVmQXJ5K0N4NzFzNUt3VndEK2Y2SnQ5UXNYbG9BellC?=
 =?utf-8?B?ZndHWDM5c25BV3BidXhVTkZqc251Z21YUFI0aFNJOVJ4Vm5oM3M3RVFIbjRp?=
 =?utf-8?B?Z0VMQ1NNNnpwQ0UvbytHc1pneTJGRTR4NXlKSE9vck8wS0FKT0N0RjZjK0ow?=
 =?utf-8?B?a1ZBdjYvSm04ZzExL3Z1RlJVRis4STZUVWlPaHU3bTZaVXgxV2M3VHZSeTJ2?=
 =?utf-8?B?bmZUL0VNQWFzODlubHB1YjQ4ZFlSRmFCd1JCd3ZUK1RlUUlnYmp6NysvdU5Y?=
 =?utf-8?B?MytBbTRRQTRDZ1Bid1dRdVVHVmNSZUtxdWlWdUh5aTRJajM5SUFCU1l4Zmh1?=
 =?utf-8?B?WnFWUUlBVmZ6OFpPQWJEMW1nMjNvTXVrbnZlSXRIY2M2T2Y0V2MwTk5WT20r?=
 =?utf-8?B?WUFsNWtOclEzcjFpK284anUwUUpqdmdGU3diT1ZRa0tDc2VmTS9Dci9ONnlw?=
 =?utf-8?B?TWdzVkgwVjNDN08wSXRXQnBUOCs2elVFMU5Fa21uUFRqUFNEeDVMTCtZTVFw?=
 =?utf-8?B?dVljc1JIa3BCVnltclRRZVJNekllaGhESGY4SElZdU9ic0xYa21iN0hDTHND?=
 =?utf-8?B?MUdGWk53OE9vU3h6dnpyTDdpWFZoZ2dkcmtZWk9KNE5TTlBoWFpjT1JBUlk1?=
 =?utf-8?B?MnZKd2xJZExIOWpBRU1qeXIrY2ZKWFVrbEVkUUp2bDZtUWU0Sklyd2VBTVBL?=
 =?utf-8?B?NnJUVkdsLzlYU2wxUFpaMXQyMEN4OUJOTUhWMUlOTDNlVUo1SVVFNXJZSzVo?=
 =?utf-8?B?S0t3SWZuNE5jM2hQRGh4WkRDKzNHK09Wd0JPMWh6Ny9vc3NlamZBbXJId1dU?=
 =?utf-8?B?RkcvZDlGdHNMZG45bXYwUzE0ZXhBV0ZNb3RKZk9JbmZiclM4STJtQldNRXdx?=
 =?utf-8?B?YVZNaHl1bHJqc2VHK3Z0Wm9EeUQva1NSN2VlN0xZWmptblF1WjQzTk1ITWsy?=
 =?utf-8?B?UTVsWUhhSUlweEpEcTJxY1ZqeWlPb21wS0dOSS9pK2k2bjljUENTd29na2cw?=
 =?utf-8?B?djd0OHVKaDhieTY2ZkVIZGZnbmhJZkViZ2o3UjJjR0R2Nzd1Q09iVXFBN0hq?=
 =?utf-8?B?VDZtaGpCODRKMXlNOS9nVUdZcVhQM2hyL3hnbU1DeHR3dFdpU2grUnJhaGxM?=
 =?utf-8?B?REFrdXl1S3hlWFlqNnk2dnU4Tkg5RnhzMklvZ1kvRVo1M3V0RlM5eWpVU1NT?=
 =?utf-8?B?TmZBMWltd2FWYkVSaUNZRm14ZVJLazFtaFNVNGVNVmNUK3pLMU1BR1VOVFNx?=
 =?utf-8?B?cDhkV0V2MGVRVWhzM3VhTlgvRDdEc0NraitxdVRhYU51eWZ2NWZFTHpFY3Bx?=
 =?utf-8?B?Z2EvWVVlN2hsUlNLUWdIeUorQWljY0c2TWYxYWhia2pqcXpBdlNScVlWQWpu?=
 =?utf-8?B?MGljaVpZWTQ4V2hMT1ErRWFKSVkrME1uKzNqR0IzbWZMbkNFYktmQkpWSmJw?=
 =?utf-8?B?TVNncld6eExFdHNFS1I2ckdhQWM1SFlOMGZ6SmwwRWhjK1NZeS94WHVLTWMy?=
 =?utf-8?B?ZElkN1FIdVA4NXhUU0tubk1USXE4cWhoUENJMHRMYkhXYk55Nlg2RU9hZk9W?=
 =?utf-8?B?UUhLc1UrK3hKQVdNOExGeDdGMnUyNEh2VkhyTWxwa1ZVTzROWkxzVTR3SndD?=
 =?utf-8?B?eTRsb240alN1Rk1RNlhRc0FtblRRVEpMdjM0aDJCNmZwNk1ZWFZhVVNTTHB0?=
 =?utf-8?B?NzR3bVZTbnN1cUlubUlmUjVPeTBJTnYvZW1sZFpCYXdjaXBIbGI2aUJMQys3?=
 =?utf-8?B?YStYTGJsVWEwWG9kdWUwaE5nbkJrY1ZPa3FLWFA0MWU2eUhJcy9QWHNzN2Ni?=
 =?utf-8?B?RFlUSjZLTDQ1SVZEK2svZGZDVyt3TXFPVmpEU1RZd0VOSlQreG5iSnVjcElj?=
 =?utf-8?B?OG9VNFVubnNMNWpCRGJsSXNkSU1OM1htdjBxcXgvbjRST3IxTlZUSCtPOVNW?=
 =?utf-8?B?Sm5FazN1OGtsQ3NZY2lGRHpPNVEwekVJRkc3L1IxY09QeDRKaGZ2RkJzcjZT?=
 =?utf-8?B?K0pPcTVtbTJOSENyWGdzUlR6dndLelJ4bTJKdmt6K0JWQWlQTHNwWUMzWll6?=
 =?utf-8?Q?Btlw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6031f610-df16-46ee-9d03-08dc7e4fe61f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 13:21:20.7505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmqlAMAPdaZ/DkbvNXts3BQvO4j3CIQbPvxjtAQtsngwIAasSssnnAdKVlUsHTwE3zmbJQW9W3NsMVOEC+ElbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9270

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgeW91ciBxdWljayByZXNwb25zZS4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDAvM10gcGluY3RybDogc2NtaTogc3VwcG9ydCBpLk1YOTUgT0VNIGV4dGVu
c2lvbnMgd2l0aA0KPiBmc2wscGlucyBwcm9wZXJ0eQ0KPiANCj4gT24gTW9uLCBNYXkgMjcsIDIw
MjQgYXQgMTA6MzbigK9BTSBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4gd3JvdGU6DQo+IA0K
PiA+IEhpIExpbnVzLCBTdWRlZXAsIENyaXN0aWFuLA0KPiA+DQo+ID4gPiBTdWJqZWN0OiBbUEFU
Q0ggMC8zXSBwaW5jdHJsOiBzY21pOiBzdXBwb3J0IGkuTVg5NSBPRU0gZXh0ZW5zaW9ucw0KPiA+
ID4gd2l0aCBmc2wscGlucyBwcm9wZXJ0eQ0KPiA+DQo+ID4gU29ycnkgaWYgdGhpcyBpcyBhbiBl
YXJseSBwaW5nIHRvIHlvdS4gSnVzdCB3YW5uYSB0aGlzIG5vdCBibG9ja2luZw0KPiA+IGkuTVg5
NSB1cHN0cmVhbSBzdXBwb3J0Lg0KPiA+DQo+ID4gQXJlIHlvdSBvayB3aXRoIHRoaXMgcGF0Y2hz
ZXQ/DQo+IA0KPiBQYXRjaCAxIGlzIGZpbmUgYXMgaXQncyBBQ0tlZCBieSB0aGUgRFQgbWFpbnRh
aW5lcnMuDQo+IA0KPiBQYXRjaCAyIHBhdGNoZXMgdGhlIFNDTUkgcGluY3RybCBkcml2ZXIgYW5k
IHBhdGNoIDMgdXNlcw0KPiBtb2R1bGVfc2NtaV9kcml2ZXIoKSwgc28gSSBjYW5ub3QgbWVyZ2Ug
YW55IG9mIHRoZXNlIHBhdGNoZXMgd2l0aG91dCBBQ0sNCj4gZnJvbSB0aGUgU0NNSSBtYWludGFp
bmVycy4NCg0KU3VkZWVwLCBDcmlzdGlhbiwgTWF5IEkgZ2V0IHlvdXIgQUNLIGZvciB0aGUgcGF0
Y2hlcz8NCg0KPiANCj4gVGhlIGNvZGUgaW4gcGF0Y2ggMyBsb29rcyBPSyBidXQgSSB3aWxsIGNv
bW1lbnQgb24gaXQsIG5vIGJpZyBkZWFsIHRob3VnaC4NCg0KVGhhbmtzLCBJIGp1c3QgcmVwbGll
ZCB0aGVyZS4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gWW91cnMsDQo+IExpbnVzIFdhbGxl
aWoNCg==

