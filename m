Return-Path: <linux-gpio+bounces-13921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126E9F34F1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 16:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52511162B78
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6E8148FF0;
	Mon, 16 Dec 2024 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nTDaET/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1153E23;
	Mon, 16 Dec 2024 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734364250; cv=fail; b=kEadX4TzGk0txKbgsZ69W3VE/AZzQ2MUHpxym3EF3Deuoi9cRvXj6w2YOu69Ht1g2dNjjQWni4kAYbu1pDfH5yXonsnqk+oHehjAqGGnrHq0W4Fw2808l2ZjpCPhLEhnQj9swKOpeGw9Yb3PglhrohdzVzM1wdhaFU+o3Kchz88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734364250; c=relaxed/simple;
	bh=zCUouXD6eBYQhhNDthVCN3d7iXSQUdG+Cmm9bdUoCps=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QXQFd+CPaTmchYAhLKkXVbai6t/y53wZon8oedOpphAQreMkbq/s8pdkF6CKLM5eFRz5djTjofPFQ85bTNPKjeOlA9xGf1QNqWs9CSQnZMgxHmGfkaZJzpjQ7t/hwHEaV4q3M7OPk4IX2Zm3hcRqBLg2RYlXD3uvuFJsvRgLRxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nTDaET/f; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNVRR+/z/l1DKzwK2ckA4lj+pUdh2EYjG+BXNtdJgVdd7/9eVstgKM/m92t5VEqxr+VR1nfrqdadNjIEDiE2wXn6+espuIUXP0K6NVhaufP/BJQ23J9XPzZFvhRbcxQSVuFDR2X8RK75oDSErJfU7IMRcnv/jcw8Q+bMQxxKgOUmB1AIKOWGXuGaD3j1pqWzVCMsskxy0XTiFlrZ01/7asW1RMGHKcxrGrSiwVzKwhxXG+unpAVGSp+Qb+hmyluLGNY2buFvBDzD8nLXA3fDiHrI1l4U2GUtmnqc74/N5tg4H+bOVRq8inbDMS/F+rH+wY4Hp23aVLkKnvyGkoRx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCUouXD6eBYQhhNDthVCN3d7iXSQUdG+Cmm9bdUoCps=;
 b=Aw6HH6J4MP0jnY+u5tp86rhAXr+XzFaSYC8cO6AatlKXAGuleolw1YH1a+fveogdcdFk7lPKkKeDZbC1fLITpcrgkCEi4pat/kervOLTOr6yuNgW6zUxy1eCoEm6mbXLNLrHuOYdZ8Wclspo2UUWXr/b1StVoso3/wzbZEBhY26kKyVpuofaGXdPFHGdtjWBUzs3ER3UZS2TQJ2FFhfs/0IfYFjQH3v5/vJtXLnYXGxaY0Wcp6l62RJ1jqcbk52bQ+VycFlT1MBqb0k8e4SKLVFUz7X+drYXp/ppa+Ug0lCB4Bga+ZxS3R9A2eCRDTF6p1jtZMem/fZLZTdljEr91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCUouXD6eBYQhhNDthVCN3d7iXSQUdG+Cmm9bdUoCps=;
 b=nTDaET/fumaecPHVpeoovEzUnt3gCcfPV4uNBr3+AKPZK5SqJ3BgA11ka/yxxWePFRWn/1JIEBbrkZE97zugTOFgSdCOYmmGg+4qKrC8f8+p7ZdQXvy0e2hXRrF7Mp/cVvtgLYkgIHeUU4uFL/I0oMgOhSmoYqDfSiH6j7h/scE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB13893.jpnprd01.prod.outlook.com (2603:1096:405:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Mon, 16 Dec
 2024 15:50:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:50:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Add support for RZ/G3E
 SoC
Thread-Topic: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Add support for RZ/G3E
 SoC
Thread-Index: AQHbTYX54eLJZZYA8ES72OobYQD497LpAmoAgAAF9MA=
Date: Mon, 16 Dec 2024 15:50:44 +0000
Message-ID:
 <TY3PR01MB113466D66D2349AE7F10CA1FB863B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
 <20241213173901.599226-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdW5WH2qnS_CQopN8J097oy_v=o86iNdSwmn8ny9Nfb2Kw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW5WH2qnS_CQopN8J097oy_v=o86iNdSwmn8ny9Nfb2Kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB13893:EE_
x-ms-office365-filtering-correlation-id: e4861733-cd96-4c48-f12a-08dd1de966d5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YUc0ckZkdXozbHVyeUkxbmw1Y1JCMlo5cFUyTExDL1dkdFdLNHdOWm5tenpH?=
 =?utf-8?B?VDNyOVNkNkNPcWhiYi9odElha2lNVnVqNU5rM3UvUjhrUnlMd2RpU0k3ZGRU?=
 =?utf-8?B?YkJxTTAvenI3R0wwZHJUTHk2ditodDZyN1NPQUtGZTdWNVB2OWJTeEZmRTMw?=
 =?utf-8?B?VFp6TzZmbTRweDBOdWRFcHByM0kwQ3VqSDVVTGhSQUVGV0hFaGxBNWlZU3Ra?=
 =?utf-8?B?WmxqK2ZzVERkSXh0bXUvRnBpanZ0VWg3ZnRMVXlKTFdXWHJQTHpwV0Z0Nm1h?=
 =?utf-8?B?V25PQk82S0dBLzQzeVk5eEFGTklNNmk0QndqeC9SSUJxSWo2dkRSYlRybjNS?=
 =?utf-8?B?Rlg3aDUrSG9RUktjd2NsSDM0dnAwRlZmOW43NUVBaXdWeVh6SjJhd21qMDZS?=
 =?utf-8?B?U0t1OXNFTTBxVmdLRkljQ2tJK2lNOGx2NjBIUGgxdkJKZ1J4QTR2UDRiVUxW?=
 =?utf-8?B?azNwTVdaWCtQRHp4RGJpLytiYmN4ajVRZXJSclVqZVY0ZTY4dXdWV3RJZkVE?=
 =?utf-8?B?TkQzTFU0eDAva3ZJejdNSHZMTW1XSTRQUGZGK2FlKzBZUVZubDFXUnUzdHk0?=
 =?utf-8?B?TmtJOStaZ3g5SGhOL25xckE2U0c2OStmODFNNGZVdS9rYnpzLzlNamRscjNu?=
 =?utf-8?B?NlpzTFNtK0RHYm9rQi9jbFRVaHBHR1VudWFpOE91djhWZnpuOW8yL2N4K0pT?=
 =?utf-8?B?N2hHOTJUdDE5SVNnbE01REcvMm56RC9HYWl5U09Zd3NXT0JCc3UvWk9JejRC?=
 =?utf-8?B?d1RlL0pIR1dmQTFPU0tvOVN5Q20wYWZaclJoZWRZNG9RcmVIZitjT2VvWmJ5?=
 =?utf-8?B?OVJNb013U2xBOCsxMDcxT0RPVXJzem1wbXljSG5MdzhoYW1hMW9OZ0YyM01L?=
 =?utf-8?B?OTRXVTQ2Y2oyZkhXcUdFWVdTMlR6UFhnVEViQXVveFJFWitUYzh0dWlXdjRR?=
 =?utf-8?B?dHBwTmV0ZHUvSUFEdXNqN1h3MFkySCtNVzYxczdTZUZBODhjT0RjeUtQcSti?=
 =?utf-8?B?YUk5RUJCWThkZHFoSHZQVTVZQzdtTDVINzVOZFJnK3Q4cDBWNHY1ZXpLYXpl?=
 =?utf-8?B?VVMzdTRreVRIUnpsNWtQMVoyeGpuNmpIQkUyU0llaEdKc1lQSVZNV1Z1ZEtZ?=
 =?utf-8?B?RTVWMk42VFFHN3dPUWZ5dFZSeHRSSG95UU5xQXYxTXFWL21YUks4RjlJMUgx?=
 =?utf-8?B?cC83RzFVMmxWVG0raElKNGVaVkdMd28veGd1Vmw5ZUtFT1lXeGdJWmpJNkVP?=
 =?utf-8?B?cFY1VnN5NmNNcUpIUGZGMjE3cnFvZWpidDJUd3RIczJyZWpDR0U5NjBua25t?=
 =?utf-8?B?MWJDNFNvODZyV0xjWnhQcGw5ZVRtclNNYU1qR0VHUFd3b0xJaXA2QXZPQjNS?=
 =?utf-8?B?ZkdmcEp6VmFTQk12ak8rUThKem1Nb1dabm1kQUNpR2dyaG9FVHpwZEkzdzJE?=
 =?utf-8?B?UlNCclJHY25lYzNoNkZyd0hNM0hjRFQyNFlnVFV0M3UrUWdLL0tXQ0R3K2dB?=
 =?utf-8?B?U1lxcXJWM3Z6eEVYK0RERG1lZGlwMHhzTUhnQWRSZ2lXN1hkRnVScmRXcDFz?=
 =?utf-8?B?WUllSDVwRlhQMGk1OHpaanc4U0Y1c1poQUxFUVBpaFBIQ05CYSt1eHdlUXRQ?=
 =?utf-8?B?WG9pQUJVOWZINlV5NlFvdHM5Wmdibm1yYkRaL0Exa0ZjQ2QvdnQrVi94YW9X?=
 =?utf-8?B?U3NDaWFWNUMwb3FtbHY1QzA4SU8zRHdSZGZFR0pPOVpSTG44UGUvMHpjcVBR?=
 =?utf-8?B?M2EvVHg1NnFyc2wySGdEVFBZQ3lSYTNjKzlLMHI2NUhpK3p3RXhpRFo3UGN6?=
 =?utf-8?B?UzkvL0JvOVhLZlFNVDd3N21XZWY3VjNXVEhOMnBRaHYzN1lublZEZFpHKzRp?=
 =?utf-8?B?eVdTbXNxcGtqNHFSK2VTcGFiTjhPeGpuUFRyTlA3V2pwYjdzOWRTTzhaMGg0?=
 =?utf-8?Q?L95vAVDM52I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE5OUmsvT0pveWZqaXhnR29wUlZYRUJ5VzNKd2tKMkZHTkdMaTZUOGIrYkJC?=
 =?utf-8?B?WmxwUXZQSERpd1FpTkJWVG10M3ZoM2lBRW1IWFVQbzZCQ2ZSQ1dsR2hKZk42?=
 =?utf-8?B?bGE4MEYwclQ4OXZxbktqc0kyVElRRDcwdG4rS3dPQ2pXaStsTTFWcmpxeHZl?=
 =?utf-8?B?NHhIZFFuVUkrUDBuV3pDZFNxMDZzY2hpY3UrLzg5WmVjalNsNDJhYU14cFho?=
 =?utf-8?B?bEdPQkdvUDBEMmNobjkvbFNOVXBLOE8yT3VUUUdVam9QbE9DeXowYzFFVzV4?=
 =?utf-8?B?aVFKaWRuNVpxaEVkdnB2YTRTWGorREVlcW9MLzFBMUxESi9sMmZHQXZscWxu?=
 =?utf-8?B?dWYyNytRMnMwS1dXNkJ1SWU1NzVOWXNNUW1IWEd0U1ozMmI4dXZ3ZEF1SUZu?=
 =?utf-8?B?NUVPWnVoMnI0N1MvZ25zaUZWbFhZZFhPL05ybGVIbUorQ2Z6bk5sbWp5WHF6?=
 =?utf-8?B?eWsxQ3A0SWxqWXhCYk9ydWxrQmZ2WFk3d2JSVTV2S3IvdlpBQzFONlB6Qkkr?=
 =?utf-8?B?WHVYeDI5a3ZUclk5aEtGc2NhU1ZyTkhPc3MzV3R1OHRDUWpvNGNqSDZaMnJG?=
 =?utf-8?B?dGprTy9vbUF6OUo1R2hncFZuWUlqZS9PMXpwOEV3b1BMb3FWUUFGcm1EcVVS?=
 =?utf-8?B?ZkRsbWJyZEwxeHQ1ZFB2aVg4Y25ERHpUWTF0MWpwcGJLTVRoQkNCNzIzRk9n?=
 =?utf-8?B?ME0vSU1HKzllOTd0cVpqRE1rcEtvU3crN0txMDFPTkpPYzBWR2gvZWxPZ2Fp?=
 =?utf-8?B?RjV5TXA1NzZoQ3k3N0dhcmpXU0E1cnBVTGw2ODFDeWlCb0dhK1BVeHdYclpa?=
 =?utf-8?B?OC9hbHBxaVJ0VzFyQUcycm5mdU84QW81R1g4Y0U4QTVNSmxlQitVaWx3Qi9Z?=
 =?utf-8?B?V2t1N3FEY3dpMXZjTmZRMnEyQTNpbldlc1NscVFJa1BuYUlacks1U0VRak1a?=
 =?utf-8?B?SS9vR0RqeWNCaGwvdk1wdEVDNmwyWUQrZzBJa2krOHRIYW5SU1FsV3pMQVd6?=
 =?utf-8?B?QmN5UW9iZm5iZEtOMW1DMnljdVpiemZ4WDlmSytaZzBwL0p1RGpTV0FqSzVN?=
 =?utf-8?B?a0N2RHJJSGd4anROVlNxUDdOWS9sSFYvSzUva3RyOGpIcG5SbGxXQ2ZTYkxp?=
 =?utf-8?B?emt2bDlhQWxBMlFqdUtMSzdhUGZ4Zi9peVAvaEhXdXFFTzFjZ0h6cldEWUs0?=
 =?utf-8?B?WHZtV2Vsb0NSN0VlSWNRdGRoMVhRUnFySnQwRmNTZjUrMTVueUVqTGFuNXhS?=
 =?utf-8?B?bFNnMFJLQlFnMjFVZEhrQjFDdjhpSzFseHVFKzhZYk1XcXl4YkxvVE1MOXRQ?=
 =?utf-8?B?dWY2ejBZSnVwamJpUVlMMjl6U3A3ckJTNkdoTWZxQzJRR2tuMGdEY1IydnQr?=
 =?utf-8?B?UEZxMHR1UTRrZ0VkVXBVdkR2NmgxbjJSdCtOZ3F5SklaMTFaWFZkVmc3S29w?=
 =?utf-8?B?Vjd4dXc0aDVOSE5Qc0dLZnhOZDdaSnFmdCtHNFZ4WTZDSDA1YkwyQ0JNSXpE?=
 =?utf-8?B?QzJJWkl0U0czQzErKytUQkRwMStvVUdETGhvanpUZzA5bDEySVNsdDN4UDFM?=
 =?utf-8?B?YkQ5cHZRNXE0WkowdmZzZCtJQnBpNU1WOWJxU25GMUpBSEJKZFh5OHhtWExB?=
 =?utf-8?B?UGNOdVZjV0dDM2NmY2hUUTl0akpDaUZObGRCSmVIZjFuQkVyMllTRW1LZG9U?=
 =?utf-8?B?VHZ3YmZyeWZXSlhxaUI4aTVIcXl5MzgwV3pROWpOQUQrTlJVNmlkamEyd3Mr?=
 =?utf-8?B?T2t0Q1ZYWis3Nk9YZVlkMmtoaFh4aDZSQjNGU0pZS2c2UElwZUZTMW1MQkZ1?=
 =?utf-8?B?clc5KzJPTTBOWUJZVlRLZ1ZDWVRoaDJIdUowNnFJaktHZlUwdGphM1o4ME41?=
 =?utf-8?B?RE1vb2IrMUM4eHhXNm5xZlhQQ2ZnV1J3YklPdWt1cVF0MGlVN0ZzckZmS1J6?=
 =?utf-8?B?c1VrZ014blA4ZHlFdlNxa3htTk9IblV2VlpvbzUwUzQ2ZlBKeCtxVUkzVWlM?=
 =?utf-8?B?YmFVUWVtbncveEtJdVZhM2VENVdDRU1iVkM0UmFJMDZNdFhlZEs1NHNYb1VP?=
 =?utf-8?B?WlpjbGcxRDlVcC9vdzFod2g5WVpPZG1mellxT0t3NHUvQmFoZlN6N2tJckxk?=
 =?utf-8?B?OWFKRmxxS0I5WmlPNWp3SEtaNE1IT09tRU5PTUVkU1JyMzFvTitoZGhPZ1hD?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4861733-cd96-4c48-f12a-08dd1de966d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 15:50:44.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ke/efeDvXDMzrbZ2K9e3B8Fgr3Nu5EzuLmyL0tVLH9QP/sX8uENesKY/Sp7+PDk6Q5kWk5O9HT8ztfUm0Am/MZh2N5ilvlGauxrtHBv4sbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13893

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNiBEZWNlbWJlciAyMDI0IDE1OjI1DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC83XSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIHN1
cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIERlYyAx
MywgMjAyNCBhdCA2OjM54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
PiB3cm90ZToNCj4gPiBBZGQgcGluY3RybCBkcml2ZXIgc3VwcG9ydCBmb3IgUlovRzNFIFNvQy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogUmVwbGFjZWQgUlpHM0VfKiBtYWNy
byB3aXRoIGdlbmVyaWMgUE9SVF8qIG1hY3JvLg0KPiA+ICAqIEFkZGVkIHBvcnRzIGJhc2VkIG9u
IGhhcmR3YXJlIGluZGljZXMuDQo+ID4gICogUmVwbGFjZWQgbWFjcm9zIFdEVFVERl9DQS0+V0RU
VURGQ0EgYW5kIFdEVFVERl9DTS0+V0RUVURGQ00uDQo+ID4gICogUmVwbGFjZWQgbWFjcm8gUVNE
MF8qLT5TRDAqLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9k
cml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiBAQCAtMTk2Miw2ICsyMDAwLDcz
IEBAIHN0YXRpYyBjb25zdCB1NjQgcjlhMDhnMDQ1X2dwaW9fY29uZmlnc1tdID0gew0KPiA+ICAg
ICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soNiwgMHgyYSwgUlpHM1NfTVBYRURfUElOX0ZVTkNT
KEEpKSwgICAgICAgICAgICAgICAgICAgICAgICAvKiBQMTggKi8NCj4gPiAgfTsNCj4gPg0KPiA+
ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHJ6ZzNlX2dwaW9fbmFtZXNbXSA9IHsNCj4gPiAr
ICAgICAgICJQMDAiLCAiUDAxIiwgIlAwMiIsICJQMDMiLCAiUDA0IiwgIlAwNSIsICJQMDYiLCAi
UDA3IiwNCj4gPiArICAgICAgICJQMTAiLCAiUDExIiwgIlAxMiIsICJQMTMiLCAiUDE0IiwgIlAx
NSIsICJQMTYiLCAiUDE3IiwNCj4gPiArICAgICAgICJQMjAiLCAiUDIxIiwgIlAyMiIsICJQMjMi
LCAiUDI0IiwgIlAyNSIsICJQMjYiLCAiUDI3IiwNCj4gPiArICAgICAgICJQMzAiLCAiUDMxIiwg
IlAzMiIsICJQMzMiLCAiUDM0IiwgIlAzNSIsICJQMzYiLCAiUDM3IiwNCj4gPiArICAgICAgICJQ
NDAiLCAiUDQxIiwgIlA0MiIsICJQNDMiLCAiUDQ0IiwgIlA0NSIsICJQNDYiLCAiUDQ3IiwNCj4g
PiArICAgICAgICJQNTAiLCAiUDUxIiwgIlA1MiIsICJQNTMiLCAiUDU0IiwgIlA1NSIsICJQNTYi
LCAiUDU3IiwNCj4gPiArICAgICAgICJQNjAiLCAiUDYxIiwgIlA2MiIsICJQNjMiLCAiUDY0Iiwg
IlA2NSIsICJQNjYiLCAiUDY3IiwNCj4gPiArICAgICAgICJQNzAiLCAiUDcxIiwgIlA3MiIsICJQ
NzMiLCAiUDc0IiwgIlA3NSIsICJQNzYiLCAiUDc3IiwNCj4gPiArICAgICAgICJQODAiLCAiUDgx
IiwgIlA4MiIsICJQODMiLCAiUDg0IiwgIlA4NSIsICJQODYiLCAiUDg3IiwNCj4gPiArICAgICAg
ICJQOTAiLCAiUDkxIiwgIlA5MiIsICJQOTMiLCAiUDk0IiwgIlA5NSIsICJQOTYiLCAiUDk3IiwN
Cj4gPiArICAgICAgICJQQTAiLCAiUEExIiwgIlBBMiIsICJQQTMiLCAiUEE0IiwgIlBBNSIsICJQ
QTYiLCAiUEE3IiwNCj4gPiArICAgICAgICJQQjAiLCAiUEIxIiwgIlBCMiIsICJQQjMiLCAiUEI0
IiwgIlBCNSIsICJQQjYiLCAiUEI3IiwNCj4gPiArICAgICAgICJQQzAiLCAiUEMxIiwgIlBDMiIs
ICJQQzMiLCAiUEM0IiwgIlBDNSIsICJQQzYiLCAiUEM3IiwNCj4gPiArICAgICAgICJQRDAiLCAi
UEQxIiwgIlBEMiIsICJQRDMiLCAiUEQ0IiwgIlBENSIsICJQRDYiLCAiUEQ3IiwNCj4gPiArICAg
ICAgICJQRTAiLCAiUEUxIiwgIlBFMiIsICJQRTMiLCAiUEU0IiwgIlBFNSIsICJQRTYiLCAiUEU3
IiwNCj4gPiArICAgICAgICJQRjAiLCAiUEYxIiwgIlBGMiIsICJQRjMiLCAiUEY0IiwgIlBGNSIs
ICJQRjYiLCAiUEY3IiwNCj4gPiArICAgICAgICJQRzAiLCAiUEcxIiwgIlBHMiIsICJQRzMiLCAi
UEc0IiwgIlBHNSIsICJQRzYiLCAiUEc3IiwNCj4gPiArICAgICAgICJQSDAiLCAiUEgxIiwgIlBI
MiIsICJQSDMiLCAiUEg0IiwgIlBINSIsICJQSDYiLCAiUEg3IiwNCj4gPiArICAgICAgICJQSTAi
LCAiUEkxIiwgIlBJMiIsICJQSTMiLCAiUEk0IiwgIlBJNSIsICJQSTYiLCAiUEk3IiwNCj4gPiAr
ICAgICAgICJQSjAiLCAiUEoxIiwgIlBKMiIsICJQSjMiLCAiUEo0IiwgIlBKNSIsICJQSjYiLCAi
UEo3IiwNCj4gPiArICAgICAgICJQSzAiLCAiUEsxIiwgIlBLMiIsICJQSzMiLCAiUEs0IiwgIlBL
NSIsICJQSzYiLCAiUEs3IiwNCj4gPiArICAgICAgICJQTDAiLCAiUEwxIiwgIlBMMiIsICJQTDMi
LCAiUEw0IiwgIlBMNSIsICJQTDYiLCAiUEw3IiwNCj4gPiArICAgICAgICJQTTAiLCAiUE0xIiwg
IlBNMiIsICJQTTMiLCAiUE00IiwgIlBNNSIsICJQTTYiLCAiUE03IiwNCj4gPiArICAgICAgICJQ
TjAiLCAiUE4xIiwgIlBOMiIsICJQTjMiLCAiUE40IiwgIlBONSIsICJQTjYiLCAiUE43IiwNCj4g
PiArICAgICAgICJQTzAiLCAiUE8xIiwgIlBPMiIsICJQTzMiLCAiUE80IiwgIlBPNSIsICJQTzYi
LCAiUE83IiwNCj4gPiArICAgICAgICJQUDAiLCAiUFAxIiwgIlBQMiIsICJQUDMiLCAiUFA0Iiwg
IlBQNSIsICJQUDYiLCAiUFA3IiwNCj4gPiArICAgICAgICJQUTAiLCAiUFExIiwgIlBRMiIsICJQ
UTMiLCAiUFE0IiwgIlBRNSIsICJQUTYiLCAiUFE3IiwNCj4gPiArICAgICAgICJQUjAiLCAiUFIx
IiwgIlBSMiIsICJQUjMiLCAiUFI0IiwgIlBSNSIsICJQUjYiLCAiUFI3IiwNCj4gPiArICAgICAg
ICJQUzAiLCAiUFMxIiwgIlBTMiIsICJQUzMiLCAiUFM0IiwgIlBTNSIsICJQUzYiLCAiUFM3IiwN
Cj4gDQo+IENhbiB0aGUgbm9uLWV4aXN0aW5nIFA5eCwgUEl4LCBhbmQgUE54LVBSeCBiZSBsZWZ0
IE5VTEw/DQoNCk9LLg0KDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHU2
NCByOWEwOWcwNDdfZ3Bpb19jb25maWdzW10gPSB7DQo+ID4gKyAgICAgICBSWkcyTF9HUElPX1BP
UlRfUEFDSyg4LCAweDIwLCBSWlYySF9NUFhFRF9QSU5fRlVOQ1MpLCAgIC8qIFAwICovDQo+ID4g
KyAgICAgICBSWkcyTF9HUElPX1BPUlRfUEFDSyg4LCAweDIxLCBSWlYySF9NUFhFRF9QSU5fRlVO
Q1MgfA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUElOX0NGR19F
TEMpLCAgICAgICAgICAgICAvKiBQMSAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BB
Q0soMiwgMHgyMiwgUlpHMkxfTVBYRURfQ09NTU9OX1BJTl9GVU5DUyhSWlYySCkgfA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUElOX0NGR19OT0QpLCAgICAgICAg
ICAgICAvKiBQMiAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soOCwgMHgyMywg
UlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQMyAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJ
T19QT1JUX1BBQ0soNiwgMHgyNCwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQNCAqLw0K
PiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soNywgMHgyNSwgUlpWMkhfTVBYRURfUElO
X0ZVTkNTKSwgICAvKiBQNSAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soNywg
MHgyNiwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQNiAqLw0KPiA+ICsgICAgICAgUlpH
MkxfR1BJT19QT1JUX1BBQ0soOCwgMHgyNywgUlpWMkhfTVBYRURfUElOX0ZVTkNTIHwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBJTl9DRkdfRUxDKSwgICAgICAg
ICAgICAgLyogUDcgKi8NCj4gPiArICAgICAgIFJaRzJMX0dQSU9fUE9SVF9QQUNLKDYsIDB4Mjgs
IFJaVjJIX01QWEVEX1BJTl9GVU5DUyksICAgLyogUDggKi8NCj4gPiArICAgICAgIFJaRzJMX0dQ
SU9fUE9SVF9QQUNLKDAsIDB4MjksIFJaVjJIX01QWEVEX1BJTl9GVU5DUyksICAgLyogUDkgKi8N
Cj4gDQo+IFA5IGRvZXMgbm90IGV4aXN0LCBzbyBJIHRoaW5rIGl0IHNob3VsZCBiZSBsZWZ0IGVt
cHR5IChOVUxMPykuDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BB
Q0tfVkFSSUFCTEUoOCwgMHgyYSksICAgICAgICAgICAgICAgICAvKiBQQSAqLw0KPiA+ICsgICAg
ICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soOCwgMHgyYiwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwg
ICAvKiBQQiAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMywgMHgyYywgUlpW
MkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQQyAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19Q
T1JUX1BBQ0tfVkFSSUFCTEUoOCwgMHgyZCksICAgICAgICAgICAgICAgICAvKiBQRCAqLw0KPiA+
ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soOCwgMHgyZSwgUlpWMkhfTVBYRURfUElOX0ZV
TkNTKSwgICAvKiBQRSAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMywgMHgy
ZiwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQRiAqLw0KPiA+ICsgICAgICAgUlpHMkxf
R1BJT19QT1JUX1BBQ0tfVkFSSUFCTEUoOCwgMHgzMCksICAgICAgICAgICAgICAgICAvKiBQRyAq
Lw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0tfVkFSSUFCTEUoNiwgMHgzMSksICAg
ICAgICAgICAgICAgICAvKiBQSCAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0so
MCwgMHgzMiwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQSSAqLw0KPiANCj4gTGlrZXdp
c2UgZm9yIFBJLi4uDQo+IA0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0tfVkFSSUFC
TEUoNSwgMHgzMyksICAgICAgICAgICAgICAgICAvKiBQSiAqLw0KPiA+ICsgICAgICAgUlpHMkxf
R1BJT19QT1JUX1BBQ0soNCwgMHgzNCwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQSyAq
Lw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soOCwgMHgzNSwgUlpWMkhfTVBYRURf
UElOX0ZVTkNTKSwgICAvKiBQTCAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0so
OCwgMHgzNiwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQTSAqLw0KPiA+ICsgICAgICAg
UlpHMkxfR1BJT19QT1JUX1BBQ0soMCwgMHgzNywgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAv
KiBQTiAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMCwgMHgzOCwgUlpWMkhf
TVBYRURfUElOX0ZVTkNTKSwgICAvKiBQTyAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JU
X1BBQ0soMCwgMHgzOSwgUlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQUCAqLw0KPiA+ICsg
ICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMCwgMHgzYSwgUlpWMkhfTVBYRURfUElOX0ZVTkNT
KSwgICAvKiBQUSAqLw0KPiA+ICsgICAgICAgUlpHMkxfR1BJT19QT1JUX1BBQ0soMCwgMHgzYiwg
UlpWMkhfTVBYRURfUElOX0ZVTkNTKSwgICAvKiBQUiAqLw0KPiANCj4gLi4uIGFuZCBQTi1QUi4N
Cg0KQWdyZWVkLg0KDQpDaGVlcnMsDQpCaWp1DQo=

