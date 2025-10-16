Return-Path: <linux-gpio+bounces-27188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AEBE186F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 07:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9801534E5CF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 05:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839A723A564;
	Thu, 16 Oct 2025 05:41:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022097.outbound.protection.outlook.com [40.107.75.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A4239E67;
	Thu, 16 Oct 2025 05:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593295; cv=fail; b=tk3/TJYrZ551WgeSZrM74skavYw8U1SNQKHeoSnKb7NBgzTV3OhTFIZSD4KhGi1T7VHD27v4RX7noPlTwQ61p1TbZJtJhc0GcNeT9749CvTgt9ZFGhLFOs52wT5Kge62Wf7DUzRO8LfdtDpoHFRnr9E6uiQA9N5LjZNaR4Wy0UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593295; c=relaxed/simple;
	bh=JMCZjuWIv1Fz9vRpu8IK3XOWp7XSUAT6jp5WldW7zKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NTxLRLIErsxggd4EAdFDfJL7FiP/TP6/evZ6NYsAJS2d3s7pE0wZnOkBjpw4dw80pRC1JdCjh49hWFAdaRnuHH89igHj/vgolreIRvMcJFmVUL0cDLvpq2dW3PX3SCPj/UMa3SHgNL1fmGhhk666xYJCvpR3z9OtKqdfxP4kCkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCke+OqG/VKfbO+cXdrQYp4QydFolmCA2p8GC9ViwC8iSIaNCvC8rsZtdUWd+ft/UECwW5ypk7yiZUcXmoEzO7TVRG+y7xKKLZvUdQqBreUV3soFelhSqiFBX72DX503BgYKYqIrOSXr8EAv0isFJLFhux/NhR3d8jcv3mN0XlTkAbuQggU18oJKy7DTWJaG8bf7+QeabUE2DVWdaQM+kcghkyo5+PGdI6GDgfSZTEATuPmE5nBKMgZLehNGB6YHALx7gWY2/beb72CBBKHGIISYGlOjEmtXk/bsesdfijUnlUG9H4DN1GWdyJXyMdLpISWQZnRZ1d1Zou9kO2a6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMCZjuWIv1Fz9vRpu8IK3XOWp7XSUAT6jp5WldW7zKY=;
 b=l5opTo+hbHEdTz+EIlPrBaxBX4a1HTfyIoYHkfcpBEsWy/KK+d/B1rQqBjI0FSUTGch8qC7XAcpu1J5NOqVZ2Cp3YXwRknxDwKKISa8Ledkid29opBKU2Rgd96J8aWmAY1n1Xxguz9Dj7LGwibHjEycfhOSOCPBesAjhb7vFUDPyZzTRbzwxKBq3CdY3DgDFAtQG+cxTeFE7XDC4husDZkajog4Kj2J3zsiq1ZJnCZJGGIsndmX7rrMWX/woewNA46jNNCUxz9KXhJ/T9sNxnYcrkdyHa/p/NtvZ3UbdVH0KpXxrdlltdeCGE43oq/xc3QjlAAqGbjX0InImQNkQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TY0PR06MB6856.apcprd06.prod.outlook.com (2603:1096:405:17::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 05:41:28 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 05:41:28 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgMi8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4t?=
 =?utf-8?Q?controller_support_for_sky1?=
Thread-Topic: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index: AQHcPK3dFRM/kdKvKUasRasDs/CyH7TBeTmAgAK6wTA=
Date: Thu, 16 Oct 2025 05:41:28 +0000
Message-ID:
 <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-3-gary.yang@cixtech.com>
 <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TY0PR06MB6856:EE_
x-ms-office365-filtering-correlation-id: 500705fb-7f3b-4400-479b-08de0c76a70d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZERHYUFHK3AxV1ppSFQ1VVgzY2lRd0xMZHZla3cwdE9QTWdvVW1WQUdGVmF2?=
 =?utf-8?B?WTl5djFObGl1ZDZWMDRvZVdNNFFWc2toSnFkTStMdEhtSitoVmNCS2Fjc2ly?=
 =?utf-8?B?VDZKNlY2bm9mNEFjbXZHRjlKWHN6RE9ZOVRQcEdicmhvN3U2ZFNlREZUY3E4?=
 =?utf-8?B?WFBtblBVaTBaUEM4eFd6c1Q0WElqZktOWVVrV3RRb3hwOVNucDFxN2xGZ2pU?=
 =?utf-8?B?dTQyam1YWnFsQkVMN0ExblJUTFNaL1poaVVWaWp6U1BvVTBTejR0MFkvSkI2?=
 =?utf-8?B?c2ZSVDVGc3JtNHU1K3psaGhxZVpETStPbXZhNmpKTTZWbTlnb0l0akxVM3Iv?=
 =?utf-8?B?SzFOOHd2Qm9hZVdCeTVBaERQamV3b2FYa3JJWEJBanlWRGtYQUltN3duOHph?=
 =?utf-8?B?NFFKVEp4OExZN2hhcUtjUVBtVCszTXpJVm9uWU83NzFYOFNiN3JXTEF0SXEv?=
 =?utf-8?B?bGdYd1FSNlZYSzJiY0hISkRYbUNSeUhPT2RqMDZMYmxZdHE5cEp3SWZDdTFP?=
 =?utf-8?B?UFFseWdPOTg3eWVuS2ZUQTRXVDRuQlhVbjdzUDFnSGNQaDZ1MkN4QTI5NG1D?=
 =?utf-8?B?eDhQZzVjK3dCMnFRczJEb2tpRHNhRDhMV2pSa0h2V3U3WXRvNlFidFcwS2F1?=
 =?utf-8?B?STZCZzJ6aVBvWVp6TlhLSFc0TmNrWlBIWmVPNDdHYjRxSFhIY25pT29YdlF6?=
 =?utf-8?B?NEV5cEErWVl1Q2lqS0F6dytTK1g3cWVXQnVnSlBwOFVvR0J3MFQ1dHJ1eDRJ?=
 =?utf-8?B?eE1HTlljb3B2TjlsZVZGMlNVdUZUdzgvTjFwVDZTYWtUNnRWSnFRbFp3U0pR?=
 =?utf-8?B?cjV4ZzRvcFErc3FSTlJqMTZydTc4V3ViQ0p3UW9kRFU4eHcwRzN3ZW9tOEJQ?=
 =?utf-8?B?c0IvenBFY3hXcGNIMEQ4eEhiY0UydE5BaFN1TkhmOGFOdCtqMnZtMXBTNDlk?=
 =?utf-8?B?M0xCV2NNdTVRS3R5UEs0VnpYMnh3SEdpcVd4RjFZTGNOeDZqTFJYYVkwWkl5?=
 =?utf-8?B?S3hUeFBFYThiTW91OEpCZjNsMkxUQzN0V05zNmRpVTdmV1VYRlpZc1lNQzhK?=
 =?utf-8?B?RzRZVlZCNGkwelpaSnVZNnZjNXhKQWg5ZzBjMXVhVXd5Q3VmVDhkTTVHb0hE?=
 =?utf-8?B?RTl2Qkp3R2lJUlBhRlI0ZlJhem53OFV6c05FWXNXbmpYeGlnSVNrZWpUTHRE?=
 =?utf-8?B?OTAxd1F4LzRpYzJCQ1dVeEZ3azdWQ1FBdTF3N0cvdDFnVGgyYURoRS9rUk9n?=
 =?utf-8?B?YkpVamtZTEV6SGdoL2l0QWVKUnpsUTc1Rm1yUlRUeVJQRGxwYnU4V0pmSVpa?=
 =?utf-8?B?U3gzait2b0lvRlZNNkRTOUdZT0RJNlllVXl3aTZjQlNMV1l0eXFsY2hPeXRs?=
 =?utf-8?B?N2FEb0dOdElUNVBOWVhzVXlsSGxKOUhMdlRNRlpxYXZTUmRBSTVZbFVyRXll?=
 =?utf-8?B?aml1d2loRDVtZ01ZTTR2S1ZKcUQxZ1BsUDBGdm5sRm5Nb21oYWVJUTdTWGpw?=
 =?utf-8?B?azBnbGRCRXNnMXlFYjRnUU9JdjRQWnNNZk11ZzVkTjRqaW5vT2l0MStEK2lK?=
 =?utf-8?B?ZGpucDNyd3ZQdVIwQ1JJU3VWbG1RZS9IRXBsTW1JVnF1TzZpTEhyY1BIRFhj?=
 =?utf-8?B?dHNTU3BlTDM0SWszWFIrZ2Z5TzdVZUFVZzRnbVdaV0VaU0NkeGlBSSs4ZjVo?=
 =?utf-8?B?ckhsRHlVMDhYQ0FYZmhsUGQ2UnFLenVYaURmYXBQOHoya3VBL29tMXdEeVBN?=
 =?utf-8?B?cWxPUWZLOEpyR2ZTcGNaV1ord09NN0xrT3RKTG1kOExrRlNaUmF4SVFOK2Z5?=
 =?utf-8?B?UmZxRE1iNVVxK0Zyek5Rai8wVFNtbGtXVkpudUtFRmhMa2k1NlZLZHd2S1JI?=
 =?utf-8?B?dDlPUjFPM1hhb044eWhUaTBUQThnOTI5ZXFCUEtzRnRybUFzelYrdkVoZkVS?=
 =?utf-8?B?b1V6djNVQzExMjVaK3ZuTmptbFhiczR5Unp4OWdIYkJPeGdxdVVtRDFGVzhv?=
 =?utf-8?B?U2R0QXBBYTdPY21uTlFzdU9HUy9wMWV4TzNDN0pSNGtuQXhwM1p3N2UzQU5m?=
 =?utf-8?Q?YMqKvE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXVTZGxDUGx0Y0ROVGJLb1ZNK0hrYkgrdm5Bdmh4cm00T2lsSWw2ekhac0l4?=
 =?utf-8?B?WElKc3lpcTd6dFVZajBJTlltL3RQTzFaSnVzQ3RYS2JaMnI3UXpYa0N0WVZ1?=
 =?utf-8?B?RGgyc0dKTlp5bnhmVUdzbjkvemZjOEZRMDlBWUFjYk1OUDdPaU5vaEZyaEZv?=
 =?utf-8?B?eXdJcVZoN2kxTnFTT0c2cEY4TVcrcm9kRHg5WGpKaDJ1bkFGS0NNeVp1RHJV?=
 =?utf-8?B?dmRwN28zQ0JjUjVNeXdiZE1vS3BTdFpSM0hHUEhGT1R1Z0tWUFJ0YlhJVVNZ?=
 =?utf-8?B?S05kbVBzOHF5U1J0cEEzUVRQTkhlbGVQS0pUc28xbFhYQW5nS3lLN2MwK2Ix?=
 =?utf-8?B?SndsVXo0dTk4UlRpL3l1dzdGTVdYaFRYWXhGcElvbmYrb3d5b3kzNE01Q1d5?=
 =?utf-8?B?UkJ0L0FsVlZNY3RObmxDeTBLYkhTQ0ZBVm81OXRnL0JsQ3lBMzNHMkoxVXV2?=
 =?utf-8?B?NWJVZmNKZnF1S2NKTE9oeTBoMjBwNjdpMmFJUC81NFJvK1llTG1ZMEorSCtY?=
 =?utf-8?B?VEs4dXZKSm9TdTNrQkhjTGFSK1psN29pZUdDb0F0NFFUVmpDamdVL3hLak84?=
 =?utf-8?B?NkxXeForNmdjUXN6aTNBTkZDR3BPOFVoWGRBRGdLalhHVjZOTTVlOHhOUUdJ?=
 =?utf-8?B?MWNmWWd4N3F6VzBhcU9VYzN6VjlnaXNUVVZyOVdEQUdJVG1PWFJpbzY0TDB6?=
 =?utf-8?B?TVhSMHZaNEZXd2VHREhzVEhodCtsWDRhRGFEVmppbitIdG1kZWMrN3ZTZ0px?=
 =?utf-8?B?KzhuOXFWOG95WE5kdUVNQjBaTjRvQ3VnUXFJbWtUUy9OaHczUUlvMlpNZVhE?=
 =?utf-8?B?WFJmd3padWlQUEErT2ZIa1pjRTR3d3NjL1liSXNWZitIeWdrY0tvTjNNR05r?=
 =?utf-8?B?QWNVaEhGZmRzRElnZHVjTDJ6SnVKK3R3Z0MzV1JkUjAyczltNDVtY0ZQSzE5?=
 =?utf-8?B?UU9zVEt3NHBhSzhjTlh2SURkTGgvZ0tlNUJVYU00YVVwSzc3SjE5R1pTc2pF?=
 =?utf-8?B?NG9zL3B2R2JPYTJhZ1lOSmhjMEFrQ0VOdXdXOTVMNUVRaFB3enpxWEpkVFd1?=
 =?utf-8?B?UkJCT21NeGJvNVZ4UlVseHI2OTJxTHF3UmFSdzhBSHJhR0ZvUHc0dWVnTUZE?=
 =?utf-8?B?MGsxTVE2NTRRZVJMcDRxc25XYXBIbTg2UTJwR05EanhqWkZOVlVrclBkeFcr?=
 =?utf-8?B?Nk51eFZUMHhhSktsb01iZElKb0tzL1lIWG1LcjNUQnQ5b0ZoVlBFNlNtTXcz?=
 =?utf-8?B?SzlXWUpMcFdoSVAvZ3FHa2ZOcG84RU1DU0dISXg0VlBWc0xadk9GTnVvN05B?=
 =?utf-8?B?ZWR2cGFMM1AwNTFNU0JzSitQY2Nsa3JiL1J6OHZ3V2tNRS9PNGN1dzRvdlRF?=
 =?utf-8?B?RmlMamkxRlN3cXJyTXp6UEJpUkh1QUV3VUhhaW8wM2pKY0Iwb3F3Z0prVHZ4?=
 =?utf-8?B?TEVlZ0R3b2FFZmpnK0VQcFI4YVZGWmk3blBSZmo2SzVxUzNmSnRqVmVjVUxK?=
 =?utf-8?B?MDBBaEF2cDAra1IwTktIWEtwU3NadTJKN2c2RVFFc3ZwK0pYYVdkTExaakNE?=
 =?utf-8?B?VWlIOTFzakwyVnJncEJEV0NNdk9QVmZpNHprZk9Wc2E4alpQSE5yT1Y2U0N3?=
 =?utf-8?B?QldqQnZGV0M0YWpSUmczZzRFNGFmcjYwb2ZUTWF1WHBoWFpxaisrcXAwcDZB?=
 =?utf-8?B?ZlFINlF1YnBBa0pVVVo1UUN0dklFUXlBbW5QTjBOMWVKYzc2RUg5TGx6dklm?=
 =?utf-8?B?ckdwQzVJb01CZ216Vm5VdEp1TkFFRHFrNkpsdzMyWWpxK0pEaVNzZHFCS1ky?=
 =?utf-8?B?RytFUm4vMWVwdTZ2VjFvRVJVL3V4QjFGd09JK2YrVkZVelI1YXlQT05RbzMx?=
 =?utf-8?B?ZWlQVEQ0Z0RVS0JRNzMzS3l1L2NkZTFFaXhxM1Z1Y2pzUmVxam13SlFaTVox?=
 =?utf-8?B?RkZZc1YvUXJHZkE2L3pidnkvU1RoK3Z0Y0Z6OTdNdzJBWFZvN1ZZbHJOV0pT?=
 =?utf-8?B?cm55OUFmZS9MRS94RmhydXB2cU4rSnJ1U1RHNXpCVmhtamNSR0ROcGl6d1Ra?=
 =?utf-8?B?dDI5ajVPdmRoUWhqajZaeGRHblI5RmlaVWRIQ3ZuTWxXYXVSMDc4UUwzREtm?=
 =?utf-8?Q?WjvojySu0hScNOMOOYNV+h0Q/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500705fb-7f3b-4400-479b-08de0c76a70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 05:41:28.1502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYd+3hwKk/JNutCEGfQRCx3JfR5GoRbjIG5a78rrXxAHzszUPQozfCKqi+4gaJLOWn0QRhd85xRDZwY6nUagWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6856

SGkgTGludXM6DQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KDQo+IA0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gSGkgR2FyeSwNCj4gDQo+IHRoaXMgbG9va3MgdmVyeSBuaWNlLCBhcyBsb25n
IGFzIHdlIGZpbmlzaCB0aGUgYmluZGluZ3Mgd2UgY2FuIHNvb24gbWVyZ2UgdGhpcyBJDQo+IGhv
cGUuDQo+IA0KPiBTb21lIHNtYWxsIGNvbW1lbnRzIQ0KPiANCj4gT24gVHVlLCBPY3QgMTQsIDIw
MjUgYXQgMzo1N+KAr0FNIEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPiB3cm90ZToN
Cj4gDQo+IA0KPiA+IFRoZXJlIGFyZSB0d28gcGluLWNvbnRyb2xsZXJzIG9uIENpeCBTa3kxIHBs
YXRmb3JtLg0KPiA+IG9uZSBpcyB1c2VkIHVuZGVyIFMwIHN0YXRlLCB0aGUgb3RoZXIgaXMgdXNl
ZCB1bmRlciBTMCBhbmQgUzUgc3RhdGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFlh
bmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4NCj4gKC4uLikNCj4gDQo+ID4gK2NvbmZpZyBQSU5D
VFJMX1NLWTENCj4gPiArICAgICAgIHRyaXN0YXRlICJDaXggU2t5MSBwaW5jdHJsIGRyaXZlciIN
Cj4gPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9DSVgNCj4gDQo+IE1heWJlIGRlcGVuZHMgb24g
QVJDSF9DSVggfHwgQ09NUElMRV9URVNUIHNvIHdlIGdldCBzb21lIGNvbXBpbGUNCj4gdGVzdGlu
ZyBpbiB0aGUgdGVzdCBmYXJtcyBhbmQgYWxzbyBhIHRlc3Qgb24gdGhlIHJlc3Qgb2YgdGhlIGRl
cGVuZGVuY2llcy4NCj4gDQo+IChNYWtlcyB0aGUgYm90cyBjb21wbGFpbiBzbyB3ZSBjYW4gZml4
IGFsbCBzdWNoIHRoaW5ncyEpDQo+IA0KDQpPSywgd2Ugd2lsbCBhZGQgQ09NUElMRV9URVNUIGlu
IG5leHQgdmVyc2lvbi4NCg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gKyNp
bmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2Uu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BpbmN0cmwvbWFjaGluZS5oPg0KPiANCj4gRG8geW91IHJlYWxseSBuZWVkIDxsaW51eC9w
aW5jdHJsL21hY2hpbmUuaD4/DQo+IA0KDQpZZXMsIFlvdeKAmHJlIHJpZ2h0LCBpdCBpcyBhIGxl
Z2FjeSBpc3N1ZS4gV2Ugd2lsbCByZW1vdmUgaXQgbmV4dCB2ZXJzaW9uDQoNCj4gQW5vdGhlciB0
aGluZyB5b3UgbWlnaHQgd2FudCB0byBjb25zaWRlciBpcyB3aGV0aGVyIHRoZSBkZXNpZ253YXJl
IEdQSU8gd2lsbA0KPiB1c2UgdGhpcyBwaW4gY29udHJvbGxlciBhcyAiYmFjay1lbmQiIGZvciB0
aGUgR1BJT3MgdXNpbmcgZ3Bpby1yYW5nZXMgaW4gdGhlDQo+IEdQSU8gY29udHJvbGxlciBub2Rl
cywgZm9yIGV4YW1wbGUgKEkganVzdCBtYWRlIHRoaXMgdXApOg0KPiANCj4gZ3Bpby1yYW5nZXMg
PSA8JnBpbmN0cmwxIDAgMjAgMTA+LCA8JnBpbmN0cmwyIDEwIDUwIDIwPjsNCj4gDQo+IFRoZW4g
eW91IG1pZ2h0IHdhbnQgdG8gaW1wbGVtZW50IHRoZSBHUElPIGFjY2VsZXJhdG9yIG9wZXJhdGlv
bnMgaW4gc3RydWN0DQo+IHBpbm11eF9vcHMsIGkuZS4gdGhlc2U6DQo+IA0KPiAgKiBAZ3Bpb19y
ZXF1ZXN0X2VuYWJsZTogcmVxdWVzdHMgYW5kIGVuYWJsZXMgR1BJTyBvbiBhIGNlcnRhaW4gcGlu
Lg0KPiAgKiAgICAgIEltcGxlbWVudCB0aGlzIG9ubHkgaWYgeW91IGNhbiBtdXggZXZlcnkgcGlu
IGluZGl2aWR1YWxseSBhcyBHUElPLg0KPiBUaGUNCj4gICogICAgICBhZmZlY3RlZCBHUElPIHJh
bmdlIGlzIHBhc3NlZCBhbG9uZyB3aXRoIGFuIG9mZnNldChwaW4gbnVtYmVyKSBpbnRvDQo+IHRo
YXQNCj4gICogICAgICBzcGVjaWZpYyBHUElPIHJhbmdlIC0gZnVuY3Rpb24gc2VsZWN0b3JzIGFu
ZCBwaW4gZ3JvdXBzIGFyZQ0KPiBvcnRob2dvbmFsDQo+ICAqICAgICAgdG8gdGhpcywgdGhlIGNv
cmUgd2lsbCBob3dldmVyIG1ha2Ugc3VyZSB0aGUgcGlucyBkbyBub3QgY29sbGlkZS4NCj4gICog
QGdwaW9fZGlzYWJsZV9mcmVlOiBmcmVlIHVwIEdQSU8gbXV4aW5nIG9uIGEgY2VydGFpbiBwaW4s
IHRoZSByZXZlcnNlIG9mDQo+ICAqICAgICAgQGdwaW9fcmVxdWVzdF9lbmFibGUNCj4gICogQGdw
aW9fc2V0X2RpcmVjdGlvbjogU2luY2UgY29udHJvbGxlcnMgbWF5IG5lZWQgZGlmZmVyZW50IGNv
bmZpZ3VyYXRpb25zDQo+ICAqICAgICAgZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIEdQSU8gaXMg
Y29uZmlndXJlZCBhcyBpbnB1dCBvciBvdXRwdXQsDQo+ICAqICAgICAgYSBkaXJlY3Rpb24gc2Vs
ZWN0b3IgZnVuY3Rpb24gbWF5IGJlIGltcGxlbWVudGVkIGFzIGEgYmFja2luZw0KPiAgKiAgICAg
IHRvIHRoZSBHUElPIGNvbnRyb2xsZXJzIHRoYXQgbmVlZCBwaW4gbXV4aW5nLg0KPiAgKiBAc3Ry
aWN0OiBkbyBub3QgYWxsb3cgc2ltdWx0YW5lb3VzIHVzZSBvZiB0aGUgc2FtZSBwaW4gZm9yIEdQ
SU8gYW5kDQo+IGFub3RoZXINCj4gICogICAgICBmdW5jdGlvbi4gQ2hlY2sgYm90aCBncGlvX293
bmVyIGFuZCBtdXhfb3duZXIgc3RyaWN0bHkgYmVmb3JlDQo+IGFwcHJvdmluZw0KPiAgKiAgICAg
IHRoZSBwaW4gcmVxdWVzdC4NCj4gDQo+IEFuZCBub3dhZGF5cyBpdCBpcyBhbHNvIHdvcnRoIGNv
bnNpZGVyaW5nIHVzaW5nOg0KPiANCj4gICAgICAgICBib29sICgqZnVuY3Rpb25faXNfZ3Bpbykg
KHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBzZWxlY3Rvcik7DQo+IA0KPiBUbyBtYWtlIHRoZSBwaW5j
dHJsIGNvcmUgYXdhcmEgb2YgYSBjZXJ0YWluIGZ1bmN0aW9uIHNlbGVjdG9yIGJlaW5nIHRoZSBH
UElPDQo+IGZ1bmN0aW9uICh3aGljaCBtYWtlcyB0aGUgYWNjZWxlcmF0ZWQgZnVuY3Rpb25zIHdv
cmsgbXVjaCBiZXR0ZXIgd2l0aCB0aGUNCj4gc3RyaWN0IG1vZGUpLg0KPiANCj4gVGhpcyBjYW4g
YWxsIGJlIGFkZGVkIGxhdGVyIGluIHNlcGFyYXRlIHBhdGNoZXMsIGJ1dCB0aGlzIGlzIGEgZ29v
ZCB0aW1lIHRvIG1ha2UNCj4gc3VyZSBub3RoaW5nIHN0YW5kcyBpbiB0aGUgd2F5IG9mIGRvaW5n
IHRoaXMuDQo+IA0KDQpHUElPIElQIG9uIFNreTEgaXMgQ2FkZW5jZSwgbm90IFN5bm9wc3lzIGRl
c2lnbndhcmUuIFdlIHdhbnRzIHRvIGRvIGl0IHdoZW4gdXBzdHJlYW0gR1BJTyBkcml2ZXIgaW4g
dGhlIGZ1dHVyZS4gDQpBcmUgeW91IGFncmVlPw0KDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlq
DQoNCkJlc3Qgd2lzaGVzDQpHYXJ5DQoNCg==

