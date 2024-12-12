Return-Path: <linux-gpio+bounces-13834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1E9EF555
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 18:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E8D28ECB7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E23C2165F0;
	Thu, 12 Dec 2024 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q98MrWxp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D99223C41;
	Thu, 12 Dec 2024 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023702; cv=fail; b=lOM9aBW+cbmNPC4xC+0/Tdlag4Y0MkgQudOCFfFeFgxw893UVxNHbgMPsb/WXjA4vUWBiH50cq/AAMhxvCx6JnVJG/XuwLKX4GFxY65cG9Y+hjKjdjOfim9b/2qZ9rre6CXCPC//8FiR5S0ReCDxT2ZTdOemg8GtihJ/tZcU5Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023702; c=relaxed/simple;
	bh=mZyshGadpZb6NP+Dd1BspaEuj2hToHkE7pQfva3/imQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsqV6M2tGRYva0mAxOHxCHJmZc4XEIsoi9Yi77TFnMuqi+lN80JA2CIFuVnmEGAu34wE7CgTO5A+GURJzB10Tn0oxbL26hJ8UivtoPSX9Uj3nzf6dej+w/fApuCnaNbXBOO438YEjkZVW1+TnItO3G9jv68VF6I2TUHCppb2VEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q98MrWxp; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ZF1tYxOGqfpECxsPferbh1g2LWQa3XXuGQ69EOzgFMO2JVUiucA9DPM/R/AYWW/01KZxF0rRZybQ4TrqbD/Iz4Cmq+ldcCcnOIfJ5Ar863DvR18ZZvo0bDgZtJ3CYhjYoqj2vWxk/N3M3idrInNn8htP+Ox+Vv8jZhjR78E0w9/k8b8N8SCEZMkf0VO60sL1bUwHRIEYjRo44Pn53sHS/zQgsoBVzW7QF7H1OATuSaEgZysz287UZL8qQVKxWOW/3SNQ0uW1yZtTMw2XJAFsiQvlrxmhqAvowXj6lztaMQrcGhe0Fz/rxDwaqR8r0EA/UKvC4uifsqni4pahasPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZyshGadpZb6NP+Dd1BspaEuj2hToHkE7pQfva3/imQ=;
 b=DHrPdGcPG7bnH/8lfUCA0mAyGTXw2jiC72nqMtRTTUFBkLhneUuV9002mCwt5KFEOpag7BwLZQUAsY3FtyPNKjvY2qfXvdCOrtgp1UveJOQ1lRJ3QTdjdjTTx5qeE1OOaxaXGt/wnvN5uXg4iD8AolTdWk1eAy7QHKOj6fP6UXW8QV5+Up9PA3d1DjntAHiCYN1dggKItvlbNhPLVkwLTM3Y8iEk/o0euZh8TpBoI0VxANvB34jOdYwVV4ILf80mCZSjXChdSYI4NUXQ4jdiuy8Q3TkBrtY0qkinUypnKizI4mTuznw9vYyEwvHaLabntMHucOhSuWlceg/gGoO/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZyshGadpZb6NP+Dd1BspaEuj2hToHkE7pQfva3/imQ=;
 b=q98MrWxpXvLPq1UgcGKyXh1d6fxMF8ePC57JqMcseZkymd/kjkwu28UzkgjmLewJQs3rJHTfgGVIBRwTtrC0uhuC0HtBNTroviJkLFczZSOJx3O2kFkQ1OyIS1NZdDuRzZJCA8M8rUvKANg/0EHEeG2XReEMaZC8QEs9uQ+EyVo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10832.jpnprd01.prod.outlook.com (2603:1096:400:324::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 17:14:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 17:14:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Topic: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E
 SoC
Thread-Index: AQHbR8jxyHiCFtkWikypg4nDPYeAkLLi1aUAgAAKVwA=
Date: Thu, 12 Dec 2024 17:14:55 +0000
Message-ID:
 <TY3PR01MB11346DBB1BEBA02B8AE3B4A43863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10832:EE_
x-ms-office365-filtering-correlation-id: 627f1584-4ed6-4530-c790-08dd1ad08007
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d0VpeUFMTmdOMVpmNGxweWJ0bU5Jcmg4MWJRRWtHeHhQcngzTXN1WTJMMk9n?=
 =?utf-8?B?VkExZWFjdTk1Z0RDb2YwcEZOcG13Ny9iZkxrRitaMlNmZCtxWE1HK0RaWExx?=
 =?utf-8?B?NUpVdmJUQ0l1UStpeWd1ZlFMVEZYREY2WjRTd2J1UzJJRVZuQ1dFS1BOTXl5?=
 =?utf-8?B?UGFsNmM2S0Q3QjlpNUxnUlJvT3BBd09oOFZYMC9UVGVFSXY5WlhkS2hpdXBu?=
 =?utf-8?B?RG1tVnhsZ00weDhPa2hXbDYxV2tZUkdUOG5yZVhYZ2lnZThHdTAzZlFXK0I1?=
 =?utf-8?B?NVdaS01JNTlVL2poQ2kvUFE4NzJTcG5vRnJBOWo1QnhtOHovZ2xGSG9Ja0FO?=
 =?utf-8?B?cFpHMGZrRWZvRHVENTRCaFJWZnkxbU1MTkpwdTJ6WVBTVS9nZmVFK1g4WlFq?=
 =?utf-8?B?M2NiZW5JYW1kcFpKK3ROcTZDZlRjNXhSY2ZlemJPclRNZzJ4ZkYvQTloQzdk?=
 =?utf-8?B?LzBuT1BNVmhrSm15RDBTYUF6bTZ6S3JNQVlCc3BhOTFMQWxKMkpwdTFhUi9t?=
 =?utf-8?B?UXd0YnQzVVlyWjQzMCs2aCtueStrWVNNVjNyS3ZXV2tIbWJFQnpJWHh6Ulht?=
 =?utf-8?B?OXZMVEJSd2ZKcFFkQkhlRWUrQ2hPUWNjeUJZdjhYZzBVaGR4eTkwM3Q0aGVX?=
 =?utf-8?B?RmVpcnRLcldKOWFtMG5iL282Y2ZhSDBBSC91TWRLZU5yMWhiZ3E5c2ljVURB?=
 =?utf-8?B?RmwvTDlGZ29wMXJpYm4rRktqTlgzSjNPTElLS1VsSmxPTFh5eXhsYm1FNlkr?=
 =?utf-8?B?ZGRvL1NaeHFtN3FRaUdhQmNTbHJBS2FDZTVKU3dPVFBhVjVEQ1VNTWlrZmJQ?=
 =?utf-8?B?dG1yK2ZENTJEOEV0YmVNa0FVbWNUY1pHWCt2M1RYOExGYmFFMitWQmhHVDBy?=
 =?utf-8?B?bE5NNWh0S2R4NjFHb2dTMGFKVFkzYXM0bmlGU1pWM3NkVkI3YjNrKzRMdXpy?=
 =?utf-8?B?eHp3Umg3anV1dFArQTZ5UUxQQTRoMTZ5by9mRzI1NVAzWXFOaVhiOS9Sc0Zu?=
 =?utf-8?B?QXFGL0xaaldOam9RQTBsdVNvaXR5dkNuNVpYRkJTS0FNaHlmZlpESTJQZmdL?=
 =?utf-8?B?WEovaWFWZU5QeElDbFJPRDZPRUl3bE0vWjZXbC9SYzRtVml4Z1pmcEFqRWZi?=
 =?utf-8?B?TzZLdlRWQmdwRkM2QnNxNXZoQXBIanNVUktlQ2M2NHNtRG5XQ3V0VVZnTFdw?=
 =?utf-8?B?amtuRzNmR2hjN09nSWxEOFR1ZC9hR0M3K2dZQ0Voa2hoL2xxM1NrMGlXTnY4?=
 =?utf-8?B?YUFVK29WWEgzT281VWMyTTIxQ0VGc0pkcEduenh5MjRhRlpsSXZuRWt0N1NH?=
 =?utf-8?B?TkRDTktsaTQ4YVZzZk4rL0hFc2U0Nk53VnZYT21JVlkzNkMydytzcUZzQXdv?=
 =?utf-8?B?NFVFa3RHbm52bFJtZHdVOFpPV0c4V3Y4b20zdk41VmZDOVpiSFVxUFVWbE9D?=
 =?utf-8?B?emRRWk81SUNyRmRoSDJXT0YzN3Y5Qnl1Kzk3clZrWXE1cHR0ZTRVc2RJQmdD?=
 =?utf-8?B?WjdsSkxNbml2aHJXU1J4RDM5TlYyUDlxWDh6V1VEVm9JNFh0Wnl4REgzSWdX?=
 =?utf-8?B?NnJZQXhQOVZzRFN2bDBYL3RVaFVPaW84R0g1WXAxZUIrajVPYmFTVkdEa3lU?=
 =?utf-8?B?VURmTDE1WHZxRlF2ZVpWdXFOa1lwT3RGQnEyZnRIU21YZ3JyU3VXSmRjYWhr?=
 =?utf-8?B?VFRkbzQ2c0ZkazZOM3JFemswemZxU2NUZkJSNjQwbVF4U1Vqc3c3MmlmWmV0?=
 =?utf-8?B?TlhQYmV4N2dZNHp6RjQ2aDZ3UDVMVFFiYW1qQU9LeFRCMWc1d1FubzJPdHN6?=
 =?utf-8?B?OThWMTFzR1NWeGlmR0tUZjJNSG9DQmVoQVhzVHZkdnJxcjh4cWtIMXorZFJ6?=
 =?utf-8?B?a2p6VlVaSTNJUE93QktuODU2UGhPLytXbUlqa1NPNUowR2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anlPN01zTVNYV2l1VitGWDhvVXJZc3BOZVhScHdmTHg3TTJDUmJBSXFidUMr?=
 =?utf-8?B?ZkVQanRiK29EM3paZjcreXNsVS9BSmFzbFlxRno4djFVMU9TQU1FZUtPakxJ?=
 =?utf-8?B?UUVsQ25reENMSC9yOFpod3RMam44aFljdXl2UEo1cjE4UlVVVTNVV2JLWUN6?=
 =?utf-8?B?NG14VXA3UWNvS3dvWWloV01lUDZGbTN5OUt1YUtEaTBNM1E0OG1HN2YzVFpX?=
 =?utf-8?B?RDhSZkVCeWg2QW0xQldHdFFvTTZyTEZjMXN0c1lQRk14RXlQTXFOYzlobjlI?=
 =?utf-8?B?WGFIQTV4ZXZtNFNnS1dSbklIMzZBd1psQmJQUGVKMWpJSzFyY2FTb2tmakty?=
 =?utf-8?B?blFwZHpjVzh1d0RMOVRuY1BFS2hnSWV1NXoyVG9mM0s3ZW9TcUcwa1FQb3R2?=
 =?utf-8?B?cEZMZHJKdnd2dlhFU0RTY1ZNMkVYVjlRaHNxejZ2cnk5SEtSckZSUVFCQXht?=
 =?utf-8?B?bW9mOWM0elRraUxzQjYwT09XWE1xZzNXRTJ3THM1eWJ5RHR3bytRT1Ayd2xD?=
 =?utf-8?B?TE5McWpOU0VsanpYRWFMRTBha2lHNnl6dDYxdGgwVXhRR21QcitxZDNDck94?=
 =?utf-8?B?VWczSjZBbFV1eUdxSVYrL1VJOVFvR0VjaEFhQ2hZdmhrQVBXWXJLYXVtbmJJ?=
 =?utf-8?B?aERtcGRxNEMvSXNKeVRsSUVHei9pZU9NamhPOWpvWHdURjNRNkZrV2ZSRngr?=
 =?utf-8?B?Z0FOOUNEU3FiZkhQeGVJZ1BiaXhyWkJsSExUdVVEODBlY3hWaExVVW5mTWtq?=
 =?utf-8?B?T0hHTjVlV3BmZEt5NnVzNjduR3ZFeXZjMGpZU3k4aU9VOVNGTFQwcCtkLy93?=
 =?utf-8?B?Ym9wbEljTWkvZExKWUJEaWVxcEJ5WWkzUUJvOFFIcFNVSTJWZUVIQjU3bjN3?=
 =?utf-8?B?c3Z6aWZvcEd1REtFOWJMLzJsNWpFVVgxS2NmYmVSMFBLK0ZlbXhGZUpVS0VP?=
 =?utf-8?B?ZlR1VXlYaHUyejFTa0R2MTUxbHBEMTVnazVzOWFXOFhhUldDR3NRcVNGM1Ur?=
 =?utf-8?B?MElwSENpelYvR0twdnlMaDBzV3lGYXE3L3k4b0huY0ZYNVcybVJvMFJFNWNN?=
 =?utf-8?B?MnNHWURFbVN2dGdJM01jZzl2cm15MXc3dUJQMk9pSkNsMDN3TWdDeGFIb1gw?=
 =?utf-8?B?ZHlnaU51RWlrWEV3a2gvQ3U2MU5JREFJQVFpbXN2UkZCaFZIMDBNRTVCbzl1?=
 =?utf-8?B?c0ZnemlQUWdtR29BSUtjdHZNRFBKL2F0UnYydDRtUFFPZFFmU3cybGVkSlI4?=
 =?utf-8?B?SFFiQjVuZFhBQ252L2o0NU5ieFhGcStpUnFCZ2NCQlJLV1UzZDNvRmxnaGNZ?=
 =?utf-8?B?Zlp0TGxnUHU0dmFVejRQKzU4U0VNSFFsZ0JZY1hhUU95djZMUlNLcHRNdXBq?=
 =?utf-8?B?MXdjUkFxTGFKWDFvVzNFR04rZjFUd2NtZFJ1c29WN2t5K3prL0Q3VTd2VTZZ?=
 =?utf-8?B?dFI5SEtPS3c5Y0hMSnJYZHRSWjVtUFc0YlJjS1pNRkZZVjYvY3VpNVkvRGRq?=
 =?utf-8?B?SjJJSGdSM1lUZ3AxbFlQcUdSb3dWYnNORDhRVFhWZmZ5MURhUTR6MlR4OEZp?=
 =?utf-8?B?VkdDaDI3U2YyVlVYTEpHVENmdERBam5lZisxSTFZNnRpY0pDWmNkSFErUGdQ?=
 =?utf-8?B?emc5WDNORFByTzZwTTNtdUhHTTVGdEtQMDlqNjRQY3F1dUVBK09CZCtBNDdk?=
 =?utf-8?B?YXcrTHQ4aC9pZWlYZnZVSVJ2L3VPS0VjTVlJa1UvNDJNNzV6c2gzNWZnMzRI?=
 =?utf-8?B?RGVFWGhVaE9zWlFieFo2VnI3b3ExNENLemVXVEdaa2w5d2V3V0ErcGVKTTUw?=
 =?utf-8?B?cWRVVWhhTUNxMm5oemJDTGxwRlozWVA2YWRzdjNDV0NaRFlWTXRtdU9renpk?=
 =?utf-8?B?dVAxajFFa0RmcEx2ZDRVZDQvbzFOWXVGK01WQm1oMmJ0WEVvc3Q0Y1oyVDcr?=
 =?utf-8?B?NWR6TndlYUlhb3hqYWlkVWVsc1hlalRyd2RMMmJxWVQzOVdQb3Ard2lvcWxH?=
 =?utf-8?B?aFlsOU45aEs2bFBIQ01MaWZPY21mSm9Ib1BFT1BXcjlMaGUvcXpLMWphQTVv?=
 =?utf-8?B?WmdMQXZ4T3dWUnM3eDJPK1VXY00va2EyNGd6Sy9pUWdOajFjenJzZWtubWJZ?=
 =?utf-8?B?YnZjTVMyRlhOZVc3Rk5Kb3JLcDRSOWlXNzJ4SHZUTlNNZmlMZWppSDd0Vm81?=
 =?utf-8?B?SFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 627f1584-4ed6-4530-c790-08dd1ad08007
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 17:14:55.9965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3j1l+MnKoFJYad/W/5nQwyxReK7/IronKjnPOKPr4G8II1PbCfeMK2y3jQ7S0xo6DaRjTmZEV5hLET5A/vVJ2nre9n6ebrP8dPgtGvyg4AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10832

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEyIERlY2VtYmVyIDIwMjQgMTY6MjcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzRdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBEb2N1bWVudCBSWi9H
M0UgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBEZWMgNiwgMjAyNCBhdCAxMToy
M+KAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
QWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBwaW4gY29udHJvbGxlciBmb3VuZCBvbiB0aGUgUmVu
ZXNhcyBSWi9HM0UNCj4gPiAoUjlBMDlHMDQ3KSBTb0MuIFRoZSBSWi9HM0UgUEZDIGlzIHNpbWls
YXIgdG8gdGhlIFJaL1YySCBTb0MgYnV0IGhhcw0KPiA+IG1vcmUgcGlucyhQMDAtUFMzKS4gVGhl
IHBvcnQgbnVtYmVyIGlzIGFscGhhLW51bWVyaWMgY29tcGFyZWQgdG8gdGhlDQo+ID4gbnVtYmVy
IG9uIHRoZSBvdGhlciBTb0NzLiBTbyBhZGQgbWFjcm9zIGZvciBhbHBoYS1udW1lcmljIHRvIG51
bWJlciBjb252ZXJzaW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBGaXhl
ZCB0aGUgd2FybmluZ3MgcmVwb3J0ZWQgYnkgYm90Lg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBk
YXRlIQ0KPiANCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3JlbmVzYXMscnpnMmwtcGluY3RybC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyemcybC1waW5jdHJsLg0K
PiA+ICsrKyB5YW1sDQo+IA0KPiBUaGUgY2hhbmdlcyB0byB0aGUgYmluZGluZ3MgTEdUTS4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5j
dHJsLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJsLmgN
Cj4gPiBpbmRleCBjNzhlZDVlNWVmYjcuLjFiMWIxMTE0YTg0YyAxMDA2NDQNCj4gPiAtLS0gYS9p
bmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvcnpnMmwtcGluY3RybC5oDQo+ID4gKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaA0KPiA+IEBAIC0xMSwxMyAr
MTEsMzggQEANCj4gPg0KPiA+ICAjZGVmaW5lIFJaRzJMX1BJTlNfUEVSX1BPUlQgICAgOA0KPiA+
DQo+ID4gKyNkZWZpbmUgUlpHM0VfUDAgICAgICAgICAgICAgICAwDQo+ID4gKyNkZWZpbmUgUlpH
M0VfUDEgICAgICAgICAgICAgICAxDQo+ID4gKyNkZWZpbmUgUlpHM0VfUDIgICAgICAgICAgICAg
ICAyDQo+ID4gKyNkZWZpbmUgUlpHM0VfUDMgICAgICAgICAgICAgICAzDQo+ID4gKyNkZWZpbmUg
UlpHM0VfUDQgICAgICAgICAgICAgICA0DQo+ID4gKyNkZWZpbmUgUlpHM0VfUDUgICAgICAgICAg
ICAgICA1DQo+ID4gKyNkZWZpbmUgUlpHM0VfUDYgICAgICAgICAgICAgICA2DQo+ID4gKyNkZWZp
bmUgUlpHM0VfUDcgICAgICAgICAgICAgICA3DQo+ID4gKyNkZWZpbmUgUlpHM0VfUDggICAgICAg
ICAgICAgICA4DQo+ID4gKyNkZWZpbmUgUlpHM0VfUEEgICAgICAgICAgICAgICA5DQo+ID4gKyNk
ZWZpbmUgUlpHM0VfUEIgICAgICAgICAgICAgICAxMA0KPiA+ICsjZGVmaW5lIFJaRzNFX1BDICAg
ICAgICAgICAgICAgMTENCj4gPiArI2RlZmluZSBSWkczRV9QRCAgICAgICAgICAgICAgIDEyDQo+
ID4gKyNkZWZpbmUgUlpHM0VfUEUgICAgICAgICAgICAgICAxMw0KPiA+ICsjZGVmaW5lIFJaRzNF
X1BGICAgICAgICAgICAgICAgMTQNCj4gPiArI2RlZmluZSBSWkczRV9QRyAgICAgICAgICAgICAg
IDE1DQo+ID4gKyNkZWZpbmUgUlpHM0VfUEggICAgICAgICAgICAgICAxNg0KPiA+ICsjZGVmaW5l
IFJaRzNFX1BKICAgICAgICAgICAgICAgMTcNCj4gPiArI2RlZmluZSBSWkczRV9QSyAgICAgICAg
ICAgICAgIDE4DQo+ID4gKyNkZWZpbmUgUlpHM0VfUEwgICAgICAgICAgICAgICAxOQ0KPiA+ICsj
ZGVmaW5lIFJaRzNFX1BNICAgICAgICAgICAgICAgMjANCj4gPiArI2RlZmluZSBSWkczRV9QUyAg
ICAgICAgICAgICAgIDIxDQo+IA0KPiBUaGlzIG1hcHMgdGhlIGRpc2NvbnRpZ3VvdXMgYWxwaGEt
bnVtZXJpY2FsIHBvcnQgbmFtZSByYW5nZSB0byBhIGNvbnRpZ3VvdXMgbnVtZXJpY2FsIHJhbmdl
Lg0KPiBBcyB0aGVyZSBhcmUgY29ycmVzcG9uZGluZyBob2xlcyBpbiB0aGUgcmVnaXN0ZXIgbGF5
b3V0LCBJIGFtIG5vdCBzdXJlIHN1Y2ggYSBtYXBwaW5nIGlzIGEgZ29vZCBpZGVhLg0KDQpJZiBJ
IG1ha2UgY29udGlndW91cyBhbHBoYS1udW1lcmljYWwgcG9ydCBuYW1lIHJhbmdlIHRvIGEgY29u
dGlndW91cyBudW1lcmljYWwgcmFuZ2UuDQpHUElPIHJhbmdlcyBpbmNyZWFzZXMgZnJvbSAxNzIt
PjIzMi4gdGhhdCBpcyB0aGUgcmVhc29uIGZvciBtYWtpbmcgZXhhY3RseSBwb3J0cyBkZWZpbmVk
DQppbiBoYXJkd2FyZSBtYW51YWwgdG8gY29udGlndW91cyBudW1lcmljYWwgcmFuZ2UuDQoNCj4g
V2hhdCBpZiBhIGZ1dHVyZSB2YXJpYW50IChvciBhIGZ1dHVyZSBkb2N1bWVudGF0aW9uIHVwZGF0
ZSkgZXhwb3NlcyB0aGUgcG9ydHMgaW4gYmV0d2Vlbj8NCg0KSWYgYSBmdXR1cmUgdmFyaWFudCBv
ciB0byBhY2NvbW1vZGF0ZSBSWi9WMkgsIGNvbnRpZ3VvdXMgYWxwaGEtbnVtZXJpY2FsIHBvcnQg
bmFtZSByYW5nZQ0KdG8gYSBjb250aWd1b3VzIG51bWVyaWNhbCByYW5nZSB3aWxsIGJlIGJldHRl
ciwgaWYgd2UgcGxhbiB0byBzdXBwb3J0IHBvcnRzIGFzIGFscGhhDQpudW1lcmljIGFzIG1lbnRp
b25lZCBpbiB0aGUgaGFyZHdhcmUgbWFudWFsLg0KDQpPdGhlciBvcHRpb24gaXMganVzdCB1c2lu
ZyBudW1iZXJzLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciBwcmVmZXJlbmNlDQoNCjEpIGRp
c2NvbnRpbnVvdXMgYWxwaGEtbnVtZXJpY2FsIHBvcnQgbmFtZSByYW5nZSB0byBhIGNvbnRpZ3Vv
dXMgbnVtZXJpY2FsIHJhbmdlLg0KMikgY29udGlndW91cyBhbHBoYS1udW1lcmljYWwgcG9ydCBu
YW1lIHJhbmdlIHRvIGEgY29udGlndW91cyBudW1lcmljYWwgcmFuZ2UuDQozKSBKdXN0IHVzZSBu
dW1iZXJzIGxpa2UgdGhlIG9uZSB1c2VkIGluIFJaL1YySA0KT3INCjQpQW55IG90aGVyIHNtYXJ0
IHdheSBvZiBoYW5kbGluZyB0aGlzLg0KDQoNCj4gDQo+ID4gKw0KPiA+ICAvKg0KPiA+ICAgKiBD
cmVhdGUgdGhlIHBpbiBpbmRleCBmcm9tIGl0cyBiYW5rIGFuZCBwb3NpdGlvbiBudW1iZXJzIGFu
ZCBzdG9yZSBpbg0KPiA+ICAgKiB0aGUgdXBwZXIgMTYgYml0cyB0aGUgYWx0ZXJuYXRlIGZ1bmN0
aW9uIGlkZW50aWZpZXINCj4gPiAgICovDQo+ID4gICNkZWZpbmUgUlpHMkxfUE9SVF9QSU5NVVgo
YiwgcCwgZikgICAgICgoYikgKiBSWkcyTF9QSU5TX1BFUl9QT1JUICsgKHApIHwgKChmKSA8PCAx
NikpDQo+ID4gKyNkZWZpbmUgUlpHM0VfUE9SVF9QSU5NVVgoYiwgcCwgZikgICAgIFJaRzJMX1BP
UlRfUElOTVVYKFJaRzNFX1AjI2IsIHAsIGYpDQo+ID4NCj4gPiAgLyogQ29udmVydCBhIHBvcnQg
YW5kIHBpbiBsYWJlbCB0byBpdHMgZ2xvYmFsIHBpbiBpbmRleCAqLyAgI2RlZmluZQ0KPiA+IFJa
RzJMX0dQSU8ocG9ydCwgcGluKSAgKChwb3J0KSAqIFJaRzJMX1BJTlNfUEVSX1BPUlQgKyAocGlu
KSkNCj4gPiArI2RlZmluZSBSWkczRV9HUElPKHBvcnQsIHBpbikgIFJaRzJMX0dQSU8oUlpHM0Vf
UCMjcG9ydCwgcGluKQ0KPiA+DQo+ID4gICNlbmRpZiAvKiBfX0RUX0JJTkRJTkdTX1JaRzJMX1BJ
TkNUUkxfSCAqLw0KPiANCj4gTm90ZSB0aGF0IEkgZG8gbGlrZSB0aGUgY2xldmVyIHNjaGVtZSB0
byBoYW5kbGUgYWxwaGEtbnVtZXJpY2FsIHBvcnQgbmFtZXMuIFBlcmhhcHMgdGhpcyBzaG91bGQg
YmUNCj4gaW1wbGVtZW50ZWQgZm9yIFJaL1YySCwgdG9vPw0KPiBSWkcyTF9HUElPKDEwLCAyKSBh
bmQgUlpHMkxfR1BJTygxMCwgMykgaW4gcjlhMDlnMDU3aDQ0LXJ6djJoLWV2ay5kdHMgZG8gcmVm
ZXIgdG8gUEEyIGFuZCBQQTMuDQoNCkkgYWdyZWUsIGlmIHdlIGFyZSB0YWtpbmcgYWxwaGEtbnVt
ZXJpYyBwb3J0cyByb3V0ZSwgdGhlbiB3ZSBuZWVkIHRvIGZpeCBSWi9WMkggYXMgd2VsbC4NCg0K
Q2hlZXJzLA0KQmlqdQ0K

