Return-Path: <linux-gpio+bounces-6567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE68CC16A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 14:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E381F23769
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 12:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA10113E036;
	Wed, 22 May 2024 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jyT7uUkp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2058.outbound.protection.outlook.com [40.107.114.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792013C9D8;
	Wed, 22 May 2024 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381643; cv=fail; b=jZXGdKUVURLOOlywFH9Bj0lf2sQGBLByQOFYAjBdgtOh3qIFhroxAQOYJDNnWYlmi1QlzwPZDnbkscxZ7UFiOpJLrIbZPFXZNj0cUpSX51gqaD4hnMPr9aFaTWvnec9nrWDMJPV9uH/oPb4xUEwHgqunL8QZMeZrJPT55MGiXWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381643; c=relaxed/simple;
	bh=rsVUBK90x7VbAvSgMBEJ8d6/djL/PUjH47iPaxj8U7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LOx8wYsIA3Ranh/mOUZNGlgTI/h429MfE9HzBA68yFdcfacM1XWinptU9uqP4XxT2mevX2nphrWMJJqkt3ijWu/d5N3QMxD3io33HezhEXtogC7bZsaCzwC7Gdqn11y1tHaIuN3Nbo6vE4Rp10MzHxoRcS2ipcJIsfcBX63/mok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jyT7uUkp; arc=fail smtp.client-ip=40.107.114.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OywKBb1NdCkfaGnrspf4c7+7zi+1GkMLDtkMpW2Z01pxqYHuUlBpQQe9t+LAiPRodARYd81P6LmSWuIfktFR0S3FyT9FKBiCsrvZ5SEpAPRazm/g4xM9DWUMFWOzrZkssXVWwyjkH+2WJWmhj2YilNzktxTPvXdvPDTlSe7mTBPo5VBOXS/2j71q547kruUM9+c2LiVHkwxLKb+5BfWX01XPdELRFM5ptCHSIM+alAAjBbUCV7DqsxgS6t5XnKZQsx0AYIrBDwa2MyDNFd+6KijnBF7YlwwdjGhmEyVFiLMwpKLyYpGuEwf9oZjKwK9PSkHPTh5uzUuKQ8n2suD8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsVUBK90x7VbAvSgMBEJ8d6/djL/PUjH47iPaxj8U7U=;
 b=DqubDPdBU634M9qyaSJjPvYCuReDzr3jFrPUGqtcfs5Djy/czKaCpRNO3qIIM0hUsbp55rY3vts9cKVz6bKoE2YodSDz/LmJmsIau3A3zXqyGdrPQKkKCmewPn2a2QWlKhIPHGfE7h2Kj0VoKBX7lEIiwvRVuHAi57bnk1XnYb2T9TjvwUc3UCiolbRlm2olz2ROUYWj4Hcceojl6Hg7jEUI56bEKr7bJGuDObbqlI5Q+Bdfh19krk/Awl5nBDKmH/qanXx0Hqq0R07Ga1HUP5GpqUyJIepJPP7ed/JOFLR6IunV13xhNY0msnU2F7Sgowogh0lvC2+uMsg9aVvZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsVUBK90x7VbAvSgMBEJ8d6/djL/PUjH47iPaxj8U7U=;
 b=jyT7uUkpecKvJbWOKE58CBnYlKi1Ju29koD3RAxjdHtpTe/BGxd1LM1yTSKBRmdzm1NKHvwk8E+QEW859Ld/cPRd2ls4s18KEXqLExr1UjzmS8+YVxYTN9mOZ64JVJun5ua+t/NvY0nHmRW/LtFUWLP2+6NJCcAH6A2EXgNL/b0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6386.jpnprd01.prod.outlook.com (2603:1096:604:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 12:40:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 12:40:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for locking/unlocking the PFC register
Thread-Topic: [PATCH v2 06/13] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointers for locking/unlocking the PFC register
Thread-Index: AQHalaf6G0YP7y+cRUaeSOrsRROeYLF2Jw2QgC0zRoCAAANGAA==
Date: Wed, 22 May 2024 12:40:33 +0000
Message-ID:
 <TY3PR01MB11346281D111DB4C411E3333786EB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113461F28EA97F494D831267C86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUJXdEG-BQRYNbmhbGCtE+O1uWO0j-PkBaF7S_Qyp8M-Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUJXdEG-BQRYNbmhbGCtE+O1uWO0j-PkBaF7S_Qyp8M-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6386:EE_
x-ms-office365-filtering-correlation-id: aecb5e71-8a6f-4680-44d1-08dc7a5c5f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?dW9vMUFQL2JORXBXbFFyaWZLUTVsMU9iUXZBeWJXNU1paVArVWRETHRZc083?=
 =?utf-8?B?emFlNkRZakpmM0FlUUhJV2cxUlpqMjNSTS81enFBdDBBMEFnZjNTS3lsQ3J0?=
 =?utf-8?B?ZEhPM2Yvdm9sa1J6M3ZqREx6ZE1zNUpVRC91Wk03OGFLRSs3MlBpOUlYMUY5?=
 =?utf-8?B?T3ZtTmsrdlNMajdqK2R0SFo4UmxZUUFtdUR2K2ppMmpaZnpSOFovaHFLUS9E?=
 =?utf-8?B?eHJtNU11OCt4UThRa290U1pLb2pCamZKa3Y2NjhVemNNREc3aWpwbk5vc2xt?=
 =?utf-8?B?UW1nVGlaMmVXZGR2aWlBdFNYWnB3OXlKWUZMZnJOLzRBNjdZK1piVlAvcnVo?=
 =?utf-8?B?bm1uQlNuTUxmS0syeXdtZ0xUNE5YQk1RQzIvT3JMT2xJVU4wZVl2M2ttaXZD?=
 =?utf-8?B?WnVXSlN6RmpzWXBWUEFUZjA3cTBOSEVIUGQ2RVFFcjdma3VvOEpGeUh0RlVZ?=
 =?utf-8?B?UitmaHpDTDhsVTVlUTJuZ2tacmJRN1RmUk1IQjUrVERuUk9RQ2FReGJBQ2lS?=
 =?utf-8?B?MVdGVCtBWUluWWNqWHlWS216eTBIODAzVzIwc0phVDBPM0grWjgzSjBZbTZV?=
 =?utf-8?B?TFJOMnc2NG9oT0dycUZzaDdKRDlyanUxcmdjdUNMWHRBK2Z2M0FPcHQwRTlZ?=
 =?utf-8?B?NlFsbmlaMmxyN1NlMlhXU1FQanhmWEpnTlVEaTU1OGl3Z3hWc1lSMHZTV1Zv?=
 =?utf-8?B?ODVOQU1Eb3IvWlpFRTF0V2VHaU5GUnlabVRpWUpuWUtrVE5tUXFTYjRrUjBH?=
 =?utf-8?B?QkN2MXJtSTdvYXBqandXM3BHYnFHeFBZTDR5NTNqcW9NcEVrOXFuSUZHN3Er?=
 =?utf-8?B?eU8xNThjaFQxQzZaMExFTWlaRWNzamljRVlMY2huM0s3RGlQUFpMclc0bFlr?=
 =?utf-8?B?bXVzMkFJRkF1RTkrMDBZMmx0b3JTOTJ4MmF1bThXOWVCZmpzckNTblpDQko4?=
 =?utf-8?B?bHdjdmQrY0d6SnZSK3pwWEhmRGl3c1AvOTlJaStSYjUxbXdQdnNSUjhoQnUw?=
 =?utf-8?B?NmY2Z01Wa3JIUFpBL1BwelJ4Q25IanRRM3JHNnU2Z1laMkkvb1o0WCsyOGJQ?=
 =?utf-8?B?SWlxTU9UZUdmSFVZMGRKR3Z4NmR6RFVvd3F2U0xKL01sNTVST0plZG15Vjhu?=
 =?utf-8?B?cTEwZ2ZkTFZUNTZhcnRyZklnNkJEV1VzRmtIRW5TOTIxd0p5RnNIRER5NkRw?=
 =?utf-8?B?ckgwS1kvdFpiMmJwa3YrSjRNS05OblB2eUFIMUZ2SGp5SDE2K1dCSThLL2o4?=
 =?utf-8?B?ZEx6eHhvSitjc1pvM3Eycnd4WXJVSlVrQWsyRGdSLzIrM1M0Ym13aVE4b1FO?=
 =?utf-8?B?ZklmRVoxM2tDcFZKTTZZNEZGRTNYNTkzNXZnRFVXVWxPYnNwbTh0Yy8wYnFr?=
 =?utf-8?B?SksxNVo1T094Rmw3WG4xUHlVTnFnVVFTK1VHcXp6c0hoaElEajVpczJOeG03?=
 =?utf-8?B?cG82anlOMmh1emtYY2xodUQ4M2Y3RWhCU2NLWlc0S3lUVWJRckRJT2xXay8y?=
 =?utf-8?B?M2I0bS9IWCtYNGtVL0VQd0ErbEJzWDVINHd2NGZYVVZuL25zcCtjNWhTdU0r?=
 =?utf-8?B?OCs1M1RSempUbGY3a21wQk92VXE2RnI5ZFNHYnBpUkFOT3kxaDVhRERiWExH?=
 =?utf-8?B?M2d0a2s0dkJ4cW82dE0waFVvd0lMdGtteFhoeDBIakxGVWtnVzdPc2sreStZ?=
 =?utf-8?B?SktlVGJWSlpqZk80MzNUZ1phamRSQURZZW50cU84cGJNUTE0dTdBODBaYWsv?=
 =?utf-8?B?WU5FL1FqTFQvclB0ckdrazRYMXRVbTREalhMelFDN2VId1ZxaTQ1L1BJRFRl?=
 =?utf-8?B?MWxWUGVVWlY4Q3lxQnl4dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlJlcUVKWWszNUtncHl4NEJXYkhyNjdRYUhOWUo2NDhqa0t0UHFHd0lDVU94?=
 =?utf-8?B?N0xITWRCMy9pQUIxWjZRaDZNeHN4Z1QvM2gyWGZjNVRteEgzOEVHWnAvRjI5?=
 =?utf-8?B?R0Zvc2hRR3daQmJDL1AzKzZnODVOeGZmRkRBSnZ5SmlScmFXT0QydzhxUHo3?=
 =?utf-8?B?RFJHV0pkRCtSSkxBS1hDU2JRZ21OOE1OclRvck1NdnNBQnd6SzdGa1JvdlRX?=
 =?utf-8?B?VE9mdHZzQ3FMT2Z0cGJ3dU83TmR4aTgvZ0FaV2l0UWNES2tIWFNmT2tRbUI2?=
 =?utf-8?B?aVFXVHNhY2d5anpldjhxTU1mTkwwSGdZUFAyV2hHU0Y3NFBYUHowM2ZSby80?=
 =?utf-8?B?V05jQzVESERzMGM5ZEtqTTkweU8yT09SOVRhcjEzVzdIZzhoaHNNT1I2dnha?=
 =?utf-8?B?ZDFDMlpIVGhuY3dWVnFCb21XQ3pSbC9hQW14Z2VzUXNEL1ZIdWpaMUR3L2RG?=
 =?utf-8?B?ajJscVNyQ1lvaDFBalJZYzhBMFFKWFl6V2dHVGh2UVlHREtrSjFHRGNzaGlo?=
 =?utf-8?B?ZDdyNnRVSVlkdUNXbFFqMllQYy9WMlhHMTIxcTdpU0Z6TU9SY2taVzFiRm1k?=
 =?utf-8?B?aTUrdFN0UVpnSm1Ydk9nOVcrZVVGckpacnJJUVVRVGVQYUF6ZzhEc2gzaFZl?=
 =?utf-8?B?dEk1ZVZFZkgxT1RsbHpVYkFFMlZicWxybFBPQVRKYVFWSFBIMzlQdUJ2SE4y?=
 =?utf-8?B?UDQ1WVZvT2g4TksxOFJkT0U4TDZoU3pHdjU5MXYxdG1tMzVqLzlQc2NEN0hP?=
 =?utf-8?B?cTNGT1RTTjlZbmlPUW1KWm9zRU5NM3BTS0laVlZ4Vm9lQUtGUjZGVXo1blA5?=
 =?utf-8?B?Wm8yK09DR0hHQmxuMGRURGNOeVNZMXlvTWxCa2lJcTNlaGdHUTFsVDdEeGtL?=
 =?utf-8?B?dWloU3ExWVQ1Z0UxYjJsTDNNbTRuSFg1U3lQanVtVFBlSGM3TSsrWEhjOXJi?=
 =?utf-8?B?aE5FM3g5V1l4QzZUTVRUWXpNL3MzU0hvN2xuRHRMeW53bEtzbGxvKzFVdXJL?=
 =?utf-8?B?K3FOdWtJMm9vdmlWbVBUTnd2QkZHaWx3V3h1VDV5cy9iWW1BY1pnWkdyUnhv?=
 =?utf-8?B?bmtoYlQ5YUJwdjFXSDdhNlRweGUyZ2VNWkhTYVR1bjlFemtoanZzWnpLTEcy?=
 =?utf-8?B?SjNQU3g4a3ZWQU5tWmpFeUkvcENjcTU2VCtLd2FNbTJRSjZCbisxMFRyQUJo?=
 =?utf-8?B?cC9QSCt0VG9VeE5UZEdFTnFBUFZzWGx4cW9RT0ZoWUczMko2SFJEVjMvSGw1?=
 =?utf-8?B?b0xyemIzVEorT2tUdkIxUmF6NGh4Y09uT0M4aFh1WDJuS0tlUE5yTklxcXhn?=
 =?utf-8?B?bTdnaUNucE9zbUNkMFNHSkJTVFVFUlVla3RwN1hCUXlCZjNMNzJ0VU5OM2Yw?=
 =?utf-8?B?SnlqUFJNTjJWNXM5TEsxczkvakxqdjJBdUl4eVVJVSs0S2J6aDhvMkhhT29y?=
 =?utf-8?B?N0pqVVlBb25XWHI0TmdTQ2pqMVRpK2R3ZXZuMWU3MnMxcWpTR0pWek1Ia21F?=
 =?utf-8?B?R2xzeFJsb0xpK0NpcXNNRTFpUkY4UUZnMW44WnFlRHcwRG04OUdFVVZPVUpm?=
 =?utf-8?B?TnlDeWQwVXFHdEovcWtUVnpKZlRKSmJaS3pONmVWK2VNY3JnVmhsY3lJQi8y?=
 =?utf-8?B?bFg3MlZWRUdLTEhuQ1VuQzVwUUFSc0x6WENqdDJhbVloQVljUDVnM21IcDA0?=
 =?utf-8?B?VFMwUWFhMlJtaXRkTXRhZlo5THorTEZQUytIRWtqZDFsMjlnUDVJSEFqd0ll?=
 =?utf-8?B?UzE0YnJIcEQzY0I5dFNSWUM0RWMzWUVDVkpFR2FQQVI1eVIvc2ZTdjlPam11?=
 =?utf-8?B?SkJiSEhYZTRSeVowZkhzVnNGNTJna01DYU0yY0E4UXpuSDBpM2kzd0RnaU5u?=
 =?utf-8?B?eFRMWmN6RlljNkxxQkE1bDU3cjgwN2F0S2RONFk3TUJpUnoxM1lraTE4TUx0?=
 =?utf-8?B?NVVYd1BkZ3E2WnU5SThON1FHTmY4STZhYWhZWmoza0pJMnRhbHdlaVB5S1Fs?=
 =?utf-8?B?a3c2QVNWZWhRMGlvaHFYQ2pIK25iUXJLNHlNamI4MUpjQitMOXJsV01acDZI?=
 =?utf-8?B?cmo5dDFOYTI1bWFHelg1RFFhdWl3VURsNytFclk1L3Z2c2MvcENoaW10alh2?=
 =?utf-8?B?aUxjWGQxTzV1UGZ6cHJxK1RaYWdRYXdnZEFMS3c3QVNCSWFhN25yVkE0MWpt?=
 =?utf-8?B?Mnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb5e71-8a6f-4680-44d1-08dc7a5c5f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 12:40:33.1257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqImFncFVA+n7bj3frqICL2ZKzII6jGqwxbLQ8KjHCVXabVdLHRTiv2Ww3Xaj9w34v/kY43Sa045qACVdYBkaCnkwZZa4xGnn3a0SOU3u3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6386

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBN
YXkgMjIsIDIwMjQgMToyMyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA2LzEzXSBwaW5j
dHJsOiByZW5lc2FzOiBwaW5jdHJsLXJ6ZzJsOiBBZGQgZnVuY3Rpb24gcG9pbnRlcnMgZm9yDQo+
IGxvY2tpbmcvdW5sb2NraW5nIHRoZSBQRkMgcmVnaXN0ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBUdWUsIEFwciAyMywgMjAyNCBhdCA4OjEy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+
ID4gU2VudDogVHVlc2RheSwgQXByaWwgMjMsIDIwMjQgNjo1OSBQTQ0KPiA+ID4gU3ViamVjdDog
W1BBVENIIHYyIDA2LzEzXSBwaW5jdHJsOiByZW5lc2FzOiBwaW5jdHJsLXJ6ZzJsOiBBZGQNCj4g
PiA+IGZ1bmN0aW9uIHBvaW50ZXJzIGZvciBsb2NraW5nL3VubG9ja2luZyB0aGUgUEZDIHJlZ2lz
dGVyDQo+ID4gPg0KPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IE9uIHRoZSBSWi9HMkwgU29DLCB0
aGUgUEZDV0UgYml0IGNvbnRyb2xzIHdyaXRpbmcgdG8gUEZDIHJlZ2lzdGVycy4NCj4gPiA+IEhv
d2V2ZXIsIG9uIHRoZSBSWi9WMkgoUCkgU29DLCB0aGUgUEZDV0UgKFJFR1dFX0Egb24gUlovVjJI
KSBiaXQNCj4gPiA+IGNvbnRyb2xzIHdyaXRpbmcgdG8gYm90aCBQRkMgYW5kIFBNQyByZWdpc3Rl
cnMuIEFkZGl0aW9uYWxseSwgQklUKDcpDQo+ID4gPiBCMFdJIGlzIHVuZG9jdW1lbnRlZCBmb3Ig
dGhlIFBXUFIgcmVnaXN0ZXIgb24gUlovVjJIKFApIFNvQy4gVG8NCj4gPiA+IGFjY29tbW9kYXRl
IHRoZXNlIGRpZmZlcmVuY2VzIGFjcm9zcyBTb0MgdmFyaWFudHMsIGludHJvZHVjZSB0aGUNCj4g
PiA+IHNldF9wZmNfbW9kZSgpIGFuZA0KPiA+ID4gcG1fc2V0X3BmYygpIGZ1bmN0aW9uIHBvaW50
ZXJzLg0KPiA+ID4NCj4gPiA+IE5vdGUsIGluIHJ6ZzJsX3BpbmN0cmxfc2V0X3BmY19tb2RlKCkg
dGhlIHB3cHJfcGZjX3VubG9jaygpIGNhbGwgaXMNCj4gPiA+IG5vdyBjYWxsZWQgYmVmb3JlIFBN
QyByZWFkL3dyaXRlIGFuZCBwd3ByX3BmY19sb2NrKCkgY2FsbCBpcyBub3cNCj4gPiA+IGNhbGxl
ZCBhZnRlciBQTUMgcmVhZC93cml0ZSB0aGlzIGlzIHRvIGtlZXAgY2hhbmdlcyBtaW5pbWFsIGZv
ciBSWi9WMkgoUCkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthcg0K
PiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0t
LQ0KPiA+ID4gUkZDLT52Mg0KPiA+ID4gLSBJbnRyb2R1Y2VkIGZ1bmN0aW9uIHBvaW50ZXIgZm9y
ICh1bilsb2NrDQo+IA0KPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3Ry
bC1yemcybC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6
ZzJsLmMNCj4gPiA+IEBAIC0yNjg4LDYgKzI2OTksOCBAQCBzdGF0aWMgc3RydWN0IHJ6ZzJsX3Bp
bmN0cmxfZGF0YSByOWEwN2cwNDNfZGF0YSA9IHsNCj4gPiA+ICAgICAgIC52YXJpYWJsZV9waW5f
Y2ZnID0gcjlhMDdnMDQzZl92YXJpYWJsZV9waW5fY2ZnLA0KPiA+ID4gICAgICAgLm5fdmFyaWFi
bGVfcGluX2NmZyA9IEFSUkFZX1NJWkUocjlhMDdnMDQzZl92YXJpYWJsZV9waW5fY2ZnKSwNCj4g
PiA+ICAjZW5kaWYNCj4gPiA+ICsgICAgIC5wd3ByX3BmY191bmxvY2sgPSAmcnpnMmxfcHdwcl9w
ZmNfdW5sb2NrLA0KPiA+ID4gKyAgICAgLnB3cHJfcGZjX2xvY2sgPSAmcnpnMmxfcHdwcl9wZmNf
bG9jaywNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgc3RydWN0IHJ6ZzJsX3BpbmN0
cmxfZGF0YSByOWEwN2cwNDRfZGF0YSA9IHsgQEAgLTI2OTksNg0KPiA+ID4gKzI3MTIsOCBAQCBz
dGF0aWMgc3RydWN0IHJ6ZzJsX3BpbmN0cmxfZGF0YSByOWEwN2cwNDRfZGF0YSA9IHsNCj4gPiA+
ICAgICAgIC5uX2RlZGljYXRlZF9waW5zID0gQVJSQVlfU0laRShyemcybF9kZWRpY2F0ZWRfcGlu
cy5jb21tb24pICsNCj4gPiA+ICAgICAgICAgICAgICAgQVJSQVlfU0laRShyemcybF9kZWRpY2F0
ZWRfcGlucy5yemcybF9waW5zKSwNCj4gPiA+ICAgICAgIC5od2NmZyA9ICZyemcybF9od2NmZywN
Cj4gPiA+ICsgICAgIC5wd3ByX3BmY191bmxvY2sgPSAmcnpnMmxfcHdwcl9wZmNfdW5sb2NrLA0K
PiA+ID4gKyAgICAgLnB3cHJfcGZjX2xvY2sgPSAmcnpnMmxfcHdwcl9wZmNfbG9jaywNCj4gPiA+
ICB9Ow0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgc3RydWN0IHJ6ZzJsX3BpbmN0cmxfZGF0YSByOWEw
OGcwNDVfZGF0YSA9IHsgQEAgLTI3MDksNg0KPiA+ID4gKzI3MjQsOCBAQCBzdGF0aWMgc3RydWN0
IHJ6ZzJsX3BpbmN0cmxfZGF0YSByOWEwOGcwNDVfZGF0YSA9IHsNCj4gPiA+ICAgICAgIC5uX3Bv
cnRfcGlucyA9IEFSUkFZX1NJWkUocjlhMDhnMDQ1X2dwaW9fY29uZmlncykgKiBSWkcyTF9QSU5T
X1BFUl9QT1JULA0KPiA+ID4gICAgICAgLm5fZGVkaWNhdGVkX3BpbnMgPSBBUlJBWV9TSVpFKHJ6
ZzNzX2RlZGljYXRlZF9waW5zKSwNCj4gPiA+ICAgICAgIC5od2NmZyA9ICZyemczc19od2NmZywN
Cj4gPiA+ICsgICAgIC5wd3ByX3BmY191bmxvY2sgPSAmcnpnMmxfcHdwcl9wZmNfdW5sb2NrLA0K
PiA+ID4gKyAgICAgLnB3cHJfcGZjX2xvY2sgPSAmcnpnMmxfcHdwcl9wZmNfbG9jaywNCj4gPg0K
PiA+IFNvbWUgbWVtb3J5IGNhbiBiZSBzYXZlZCBieSBhdm9pZGluZyBkdXBsaWNhdGlvbiBvZiBk
YXRhIGJ5IHVzaW5nIGENCj4gPiBzaW5nbGUgcG9pbnRlciBmb3Igc3RydWN0dXJlIGNvbnRhaW5p
bmcgZnVuY3Rpb24gcG9pbnRlcnM/Pw0KPiA+DQo+ID4gc3RydWN0IHJ6ZzJsX3BpbmN0cmxfZm5z
IHsNCj4gPiAgICAgICAgIHZvaWQgKCpwd3ByX3BmY191bmxvY2spKHN0cnVjdCByemcybF9waW5j
dHJsICpwY3RybCk7DQo+ID4gICAgICAgICB2b2lkICgqcHdwcl9wZmNfbG9jaykoc3RydWN0IHJ6
ZzJsX3BpbmN0cmwgKnBjdHJsKTsgfQ0KPiANCj4gU28gdGhhdCB3b3VsZCByZXBsYWNlIDMgKDQg
YWZ0ZXIgYWRkaW5nIFJaL1YySCBzdXBwb3J0KSB4IDIgcG9pbnRlcnMgaW4gcnpnMmxfcGluY3Ry
bF9kYXRhDQo+IHN0cnVjdHVyZXMgYnkgMyAoNCkgcG9pbnRlcnMgaW4gcnpnMmxfcGluY3RybF9k
YXRhIHN0cnVjdHVyZXMgKyAxICgyKSB4IDIgcG9pbnRlcnMgaW4NCj4gcnpnMmxfcGluY3RybF9m
bnMgc3RydWN0dXJlcywgYW5kIGNvZGUgc2l6ZSB3b3VsZCBpbmNyZWFzZSBkdWUgdG8gZXh0cmEg
cG9pbnRlciBkZXJlZmVyZW5jZXMgYmVmb3JlDQo+IGVhY2ggY2FsbC4NCj4gQW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8NCg0KQ3VycmVudCBjYXNlDQozICogMiBwb2ludGVycyA9IDYgcG9pbnRlcnMN
Cg0KU3VnZ2VzdGlvbg0KMyAqIDEgcG9pbnRlciArIDEgKiAyIHBvaW50ZXIgPSA1IHBvaW50ZXJz
DQoNCkFzIHlvdSBzYWlkLCAgY29kZSBzaXplIHdvdWxkIGluY3JlYXNlIGR1ZSB0byBleHRyYSBw
b2ludGVyIGRlcmVmZXJlbmNlcyBiZWZvcmUNCmVhY2ggY2FsbC4NCg0KDQo+IA0KPiBNZXJnaW5n
IHJ6ZzJsX3B3cHJfcGZjX3ssdW59bG9jaygpIGludG8gYSBzaW5nbGUgZnVuY3Rpb24gKHRha2lu
ZyBhICJib29sIGxvY2siIGZsYWcpIG1pZ2h0IGJlIGENCj4gYmV0dGVyIHNvbHV0aW9uIHRvIHJl
ZHVjZSByemcybF9waW5jdHJsX2RhdGEgc2l6ZS4NCg0KSSBhZ3JlZS4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQoNCg==

