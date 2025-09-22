Return-Path: <linux-gpio+bounces-26455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F7B9174F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCFC18A3B32
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C63130FC20;
	Mon, 22 Sep 2025 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IrRUTG1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BB30EF82;
	Mon, 22 Sep 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548483; cv=fail; b=qhM5vHTwMQUVQ8lVUB4pxCGFPl5ObRNuL7UMawcY5d+B7JFqatupzOqHTmIERTrmj8IOAOPyp3fL0VF8aH6RWRA5a7mSdMYIo5SOAhOzjTPLIa6/SnKyzd/XxPSQmYCLpjFSI8Md9oLJER4wAN+2aCo/oVW1Wujof2EbXzpKWfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548483; c=relaxed/simple;
	bh=GArzJVPjibL0VN3VBaUGnAAG1SUMjNTsGxbf3etc7nA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UfPA6NZkZBJWqTnVcXqRS48K1iu009iqWH0btqTjWZv1bYnIJ0peVRP/niQvS0qJkBBWXtthJAqW+FXUaLH9+8JL73J64bJWMSD/3sruDgbfaQu4K/SMrCkph1FZ/alAxxI15hihcbIsdDs5owv5oJoRzDVEKlJfpnso7MdEYdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IrRUTG1P; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2cf7kAQpW9WO3lbQtOf7rp83ePtLQ9n0K08g/Z4qkMOmvrYpzseWL5a6HhVnY/rknVt0DMGByaIlDdLmlCuBWooWJOO2jhIscU7KsuG1+dKiKAD88n+puwsiQyk2j8ocoPoyERRVVE32wSp7F3cfVhoNeFEKHrH1AD3tCBV5ndBiLiC533ofgsCbaocBg46NfJAuCP2JmI7RnoO9kUkcpw5VGDtO7dIWpys45ClHAsNOkA6KX4gFYu4a23rtNcSDZ8luNodQ+2/DaHEumPA4n/Y5GHWs9qBTzaN7z3C0dgXBNTvY/fOGNEC3nmGriepjEmm2AAls3EanhL2eC+LTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GArzJVPjibL0VN3VBaUGnAAG1SUMjNTsGxbf3etc7nA=;
 b=kHPtNNHZkcHSwnQn1H/oSo5EbLwYiooLvjxVgS6zBFSYq6GgBc2evZpwTVSlzZ8omkTETly93MKVrniFAMk80Qfes0OpkBFJFRyuN9btNldaF4hFNJPyVYG+6icKwYCqLrk1zAITzfrf7ppXodvvX4Ew0NcWk4tK/MrUyv/sLqeMdqytwq7uoAXfOV06vI4Zes/2f1Tat3HsDr2l50r7FWBcj5NCGLQEn8iOGvVav0gEPc3VL1QWzAFUHRlCB95O53i7k8J7dGbfw4drwCCVLDOutdph+LEecU/N+baiDae09hb6F6QcnlCJkrZJFm4Cxz6Mu3hZA4oWpUcR/bserQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GArzJVPjibL0VN3VBaUGnAAG1SUMjNTsGxbf3etc7nA=;
 b=IrRUTG1Pa9PBjQOwFvne2o+EmTeAzFp7OMd4Ya0vNbhm51qfjb5U91wi4Yd5mx7EVWhv0nkmzff27Xy75EaNLsTjBaDqaTig3SR7PQCwHXvf4phbvXKiZA6YdVFXiYOxQKAymEdKqiO3gIwukVDbgcNWLFHjuN0HX9ry5RSOGjg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9969.jpnprd01.prod.outlook.com (2603:1096:400:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:41:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:41:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 1/2] pinctrl: renesas: rzg2l: Fix PMC restore
Thread-Topic: [PATCH v4 1/2] pinctrl: renesas: rzg2l: Fix PMC restore
Thread-Index: AQHcKukg1iOKEuR0PUKm6RfaC2gWyrSfL3iAgAAFweA=
Date: Mon, 22 Sep 2025 13:41:16 +0000
Message-ID:
 <TY3PR01MB113469F56AF81CBF593740EEE8612A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
 <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVCMPkh+D9G1rNJmhnyqOV3Ya5jb_VKjZEdVjysEqFVUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9969:EE_
x-ms-office365-filtering-correlation-id: d4d66f4e-065a-4b9a-eba8-08ddf9ddb44c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YyswZ0l2ZXllRyt2UkkwWW9IRWxTQVFWdmRqZEY2Mjl2YkxkTFRTUlFRZEMv?=
 =?utf-8?B?TWxyS295U1pybGxMYldzaW9xV0dyU1BMa1UzS2NyMDUrekR5OURDSDJ1aXAv?=
 =?utf-8?B?TU43MEVkZTNGSzNXVmpoS2pBRExuUGgxdURLTWszSGdxYXJmUHVMVlBSRGh0?=
 =?utf-8?B?MnhCNk1Gcm5xV0QwcVNhUm1iOWZleG5mWHpCVkhuSDVYMnpSQjZqOHJrOVBj?=
 =?utf-8?B?WHJBM3VFbWJKVjlTZGRyTUx5RVJyWHh6NTBSU1FlVGdwK2xtV2UxL0ZDb3lF?=
 =?utf-8?B?T0VBWS9uVnkvbTA3NVVnNGFhd2FlN3RkZjAyZlZVNkdMbzFVdmJZV2RHOTA2?=
 =?utf-8?B?dXNjTnJtcEpmYkw4UW1VTWZoNDVsUUVIb296Q2NCNXd0azdNa1JPMHNuZGhy?=
 =?utf-8?B?SHF2dTRGMGlvaER4NCtOa0czMGJlT202dnBPTTJtUTd6NStsbDE0Zmc2NWhM?=
 =?utf-8?B?ang3TjVPbDJ3eDJmVjZUZlFYSXBGbTBmV0dkMFF2SnRFTnhoZW5kTzJpeVRU?=
 =?utf-8?B?MGwrZXpxNkJPeGJzRkRwWmxEZEpqOUsvM0FXL2dxQlRRKzVIOFZBSHdqU2lo?=
 =?utf-8?B?ems4OENoRjNKOVh5SVNQRWltckdOallUdzR1V09yTkJmckd2My9UM3BzSDlp?=
 =?utf-8?B?eDFTZlpWSzJmVWs2M0N3c1JyZHdHVDYybGNMWDVIVmNNckNxUlNuL2tiSEhY?=
 =?utf-8?B?dCtRNyt0VXZnSU9uZ3RaMEV4ais3YW9hRTV5SkgyRlZtb1duNFZMcWRFVmFi?=
 =?utf-8?B?MFVzVUtjemRWdlRFNjBxRzFZNU85Zjd1ZFZKbnZrRG9NdXZOcXNma1ZtaXVp?=
 =?utf-8?B?TWtBR24rSk9qS1k3NGI5aVdxSDh5NW5oR3NiNEh4T3o4cXdJUk1tMG5RUG1W?=
 =?utf-8?B?Y2djMnBDZTM5VjdjYUlLV240VG1jZUFFcjFlRkJHaHZNY2ZVQ2ZNRHVKSWhj?=
 =?utf-8?B?SytEY2tKaE5qY09qOVpHRVRJOWtaSE5PQUNjbjlybHF3Q1JIV0IwYzYvU1Fs?=
 =?utf-8?B?NnFLRURZWERUOVVvNXVCNHp4cTgxN0ZlanFFVGtsbEIreFJpK05odDQ2Ymxk?=
 =?utf-8?B?VzBIelp3U0VuQ2puaHo1RFcxWFVsVTd2YTYvMi9LeWk0cUh6RTdxdVQxeTBT?=
 =?utf-8?B?R3JlRy9tWDlWUENHb1BhTVF0RUR1RmFWYWE1ZzFMUkhTWS83bjhlVktHVEFy?=
 =?utf-8?B?ZXVaUklQZ2JxSGRQZGhDTG9uRXdJc1kyN2dvMVNoQnN5dFBPUDAzMWlucm0y?=
 =?utf-8?B?bnB2ejVqTmxNYUZMV01SYlE3cHh0aktWLzltalhEaHpDM2pXVTg1RVBvdElL?=
 =?utf-8?B?SEZObEphNmxXOHdsanpycFVuMlRLRTN5d0s4Q1dMTnBrU05mbU9CYU9WUzln?=
 =?utf-8?B?TTNkbUpINGhhVjRrZzhrYWZhN1FCK3JZR2ZVMWhnd1BkQVF0QzUyamtyYzJE?=
 =?utf-8?B?Tm0wNkYxSDBibU1wOEl1NFZnTVZYUWR2Z3FYaUoxVnhJdDM2Z0hMZ0JGQlhI?=
 =?utf-8?B?TVVDYWU5NldUUWo5Y1YwbW54b2dZNldTSnRFRnNTR2VUNFRuOE1mL29WY1pp?=
 =?utf-8?B?cXVkcnBpRGNYMVAwRU5ocVg2S2lFUVVyTEFjVFZVUjh0dFV1azlLUzNvWE4r?=
 =?utf-8?B?MVpxam1heVNZTEJRK0dVZW1vUlJFOFZ3alZmODZkeDFmWDBITWFWTjhBTURu?=
 =?utf-8?B?TjJYTC9VV3BGaEpiblk3WmZOT0xNajE5bnBUaitlUjhjeHlKQ0lZbTVsSG5l?=
 =?utf-8?B?RG5ETzQ1M1hRM1AyRFF1QU1jZ3k3M1psVDhwMUtwT1pnUG9NM2JiQnkzcXhZ?=
 =?utf-8?B?UmEza1ZlRFVhR1oxcjZIVFZYU2RqSmlvQ1cwaEszcVZ0TFB1TThnbm1La21D?=
 =?utf-8?B?RXZYMVhZK2F3NnhOZ2hCT3VmcSt2ekMxUGhnb1EwSmlQMDdXdW40WTdsdzRR?=
 =?utf-8?B?cEVZd1lhd0IrcFJ3OTJudy9Rc3NHTktEalBtMHpZTTB3UWhKUUZ6UkxEb0xU?=
 =?utf-8?Q?jRObeUJxG68irwrTG7Z4UNsOu4xF2s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1BYZTBLaEFjS2xlNmtzZXE3S1IxOURKeWwxOXUzREdYRmpkNlpGWHVYTmZm?=
 =?utf-8?B?blUxWHB0cGlGaE5HUGRkUjIrN1A0ZFg5VUZOYzIzcFd3MlIybk1uTHNEU0hZ?=
 =?utf-8?B?MHZneHBnS2M3YW5iai9JMWR4N05FSExmVzNCd2RjYjFsQlZzOGt0bDVBZUY2?=
 =?utf-8?B?T0pjckI1bDdFS2RrcXhEbVpvdW1tR3h5K2dqdXk5MjBFSU9HWkxZNE5PZm9G?=
 =?utf-8?B?Zm9ENzEzZ1orc21SMUR2TTIvRVlXcjBzbGNQZ3ljUGlkaGlFL3F0OGFtb0Fq?=
 =?utf-8?B?Z3RLWjd3N3EweXVTTUJSdnkveFIwYTlDZmhLQ2RXWldaTVZKbVpPMmVwVkpP?=
 =?utf-8?B?eFRVeWtpWDZ2M2FBVG9aZVdvYXBrZXdiZU91Y3ZxNU1hVnJtb1h2ODFMQTlJ?=
 =?utf-8?B?ZS92Ri84bEg4MmpWdGNLR0NPdnBiaDdFdzU4emRteS9aNU1HT2hGYkJmQjY4?=
 =?utf-8?B?L3Z0cEhObnNYaXBUUG1iOWcwUHJlN0dWYmpNZnUzTTVwUWg5UE5Lc2ZMMTZM?=
 =?utf-8?B?SWU4U3hTdWt4bHJ3d1FoNkNickNSQlo1Y2FRUGFaOStOdjJaenp4ZERqZFh2?=
 =?utf-8?B?Z3dlMG83SUpQV3U2QWlBblNZbHo5Q3NOL2s0aEVtVUdIOXQxS0NRNjlsV29v?=
 =?utf-8?B?L2VKbklBcG15bWtaK1Ard1N2VkFQQU8yS3N2M3RHTEVhZnFEWXN3VlRmSDhq?=
 =?utf-8?B?VE1IN2hBUU0rYzJuZndpckxxbFg5dHhQUUIwTG1tRkgrVCtSK3QzY1RFaFZD?=
 =?utf-8?B?RnFjWDFRZDdZVlRCS25DSHJGMU5FRjNJRHgxN09RbExjaUQ5QmM3b29id0c0?=
 =?utf-8?B?N29ySmZKamtiTG1xUCtRTm5RWDUrOUkxMm9XM1R1d05SZGF0amFNeGpULzV6?=
 =?utf-8?B?am5uQTgvVzRHOTliaWVCeDlMT1FEKzY0cGg0WTZHTjduZzV4eC9ZZzMzcnJi?=
 =?utf-8?B?YWxYaW5hWDVVMlI5bko2dE1QeUNqZlJoSzJnT2hOQkpHQlhmVXp0a2x1L1M3?=
 =?utf-8?B?Y1FINm5OYUlQdkdBN0lCeUFuUnoyNEI0YmVvQ0RFYlNsS3BrRUpaNlpCRVlj?=
 =?utf-8?B?ditMdFVTc0hIcExnL0dDUzVaMjFRdWoxQWNMYlE0SGJrVnIyWjlPZGhJQmxs?=
 =?utf-8?B?N0JEZ1dhL1R5U216RG5CcGZzQXNQNXZselVvSWNlRFIxOUdNTHpEK0F3bnJR?=
 =?utf-8?B?dzdUV2k3SEJFYnJzVG1LY3N1alo3STl2RFNtaFpUemI3cXpTeU5mUVl3cDR0?=
 =?utf-8?B?TTVJYytOaHhncEh4R1VjTGFwNHZRd0pmbEJSY2YxeUd5WXpmWHF3Q0l3Q3Mw?=
 =?utf-8?B?NW8ySDJQT0YxbFBsK1l1U0c5d3k5VTZULzBZTnA4aDI2YVhLQitLN1crMHdl?=
 =?utf-8?B?OVk5UEtZTUE0Z0JqbExnTjRIQlFINXZscTVCUUlZL3lodmRIcDNhcXR0ZFM4?=
 =?utf-8?B?Sk1Gai9TQzJqUDRwRXBsS0ZURGNOL0VpbVVjSWo3TFdCdDM4d0FSbk92Rytp?=
 =?utf-8?B?NEFzWnc3Zzc4THo5dG1ZalpxaVorT1pwZ1owcXVTRWhBT2xRbXczbWQ4ZThL?=
 =?utf-8?B?MC92SHNzVElBZFpTS0VzcTNadjE1L3dlNktYZ2ltUE5Mb0NVd3QxRnJiVnRP?=
 =?utf-8?B?ZDNqeStMTzJnYkpwNDZ1MW0wcmdSdkMxYjVzVzBWMVptd2d0WDluV2t3NkdJ?=
 =?utf-8?B?OUJqRm0wckIyRjA1elZUOS9abmVxM1pyNUxyeDVobXR4WjR5VEdkU0NENkVi?=
 =?utf-8?B?TEFWSVE4R2QzWENPRHA2TWx3MldseDNkVENscGYxV2l2eVRUeEs5R1JOVVp0?=
 =?utf-8?B?UXVTaWlYc2lGUmhKRmNyTUkvVlFQVkwxemx0SlBaWG5wc3dPN1NxcHVQQXV5?=
 =?utf-8?B?dEgvS3FxeEdBM05LNzBRWmtITGl5SjRodU9EYXFaWDRLa3pzY0pBTHdQOUxs?=
 =?utf-8?B?T1dERmRKb1JDWlhzUHJXcEFKd0VhTEg0S0JCWWxEU3JxYkR4UUUzTHhSc0pk?=
 =?utf-8?B?WXFvR0ZxZHA2eXVzSVZLZ3NsWmFFbEV3SFBlZUdrbk91N0taV2txbU5RaGJX?=
 =?utf-8?B?ZkVvVHVCMUVXc3RvYVZ3amhHR2x2N2NBK005c2VieWs3TTRpWmdFRG5waWVl?=
 =?utf-8?B?Ym9wL05pd2d5V0RNS1ppalYycU9NVTl2V0NsZFZ4M3BiUC9ld2VGRTh0cmRl?=
 =?utf-8?B?aGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d66f4e-065a-4b9a-eba8-08ddf9ddb44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 13:41:16.4341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7o/1tuPL9B30eccy1Zh9XSgStgNQpWa7Nlpvcvy8BUiDLkh3/eC46ILy6BttUELN1fqCFvYrE3zL2pDfoXcy0Xh/gDPiBiiPLOK8cAebdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9969

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIyIFNlcHRlbWJlciAyMDI1IDE0OjEzDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMS8yXSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogRml4IFBNQyByZXN0b3JlDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gU3Vu
LCAyMSBTZXB0IDIwMjUgYXQgMTM6MTYsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gVGhlIFBNQyByZXN0b3JlIG5lZWRzIHVubG9ja2luZyB0aGUgcmVn
aXN0ZXIgdXNpbmcgUFdQUiByZWdpc3Rlci4NCj4gPg0KPiA+IEZpeGVzOiAxNGMzMmRjMWY2M2Qg
KCJwaW5jdHJsOiByZW5lc2FzOiByemcybDogQWRkIGZ1bmN0aW9uIHBvaW50ZXINCj4gPiBmb3Ig
UEZDIHJlZ2lzdGVyIGxvY2tpbmciKQ0KPiANCj4gSSB3b3VsZCByYXRoZXIgc2F5Og0KPiANCj4g
ICAgIEZpeGVzOiBlZGUwMTRjZDFlYTY0MjJkICgicGluY3RybDogcmVuZXNhczogcnpnMmw6IEFk
ZCBmdW5jdGlvbiBwb2ludGVyIGZvciBQTUMgcmVnaXN0ZXIgd3JpdGUiKQ0KPiANCj4gYXMgdGhh
dCBpcyB0aGUgKGxhdGVyKSBjb21taXQgdGhhdCBzaG91bGQgaGF2ZSBjb252ZXJ0ZWQgdGhlIGRp
cmVjdCB3cml0ZSB0byBhbiBpbmRpcmVjdCBjYWxsLg0KPiBIb3dldmVyLCBib3RoIGNvbW1pdHMg
cHJlcGFyZSBmb3IgdGhlIGFkdmVudCBvZiBSWi9WMkggc3VwcG9ydCwgYW5kIHRoZSBhY3R1YWwg
aXNzdWUgY2Fubm90IGJlDQo+IGV4cGVyaWVuY2VkIGJlZm9yZSBjb21taXQgOWJkOTVhYzg2ZTcw
MGFiOCAoInBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgUlovVjJIIFNv
QyIpLg0KDQpBZ3JlZWQuIEFzIGZvciBSWi9HMkwgdGhpcyByZWdpc3RlciBpcyBub3Qgd3JpdGUg
cHJvdGVjdGVkLiANCg0KDQpDaGVlcnMsDQpCaWp1DQo=

