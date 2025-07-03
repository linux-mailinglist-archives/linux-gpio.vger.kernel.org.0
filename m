Return-Path: <linux-gpio+bounces-22697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4941AF6E21
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139233A78A3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0855E2D46D8;
	Thu,  3 Jul 2025 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TtL2CXJn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425092D374D;
	Thu,  3 Jul 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533509; cv=fail; b=cp4G8rXh8bp2JljgFTgTWdVNIvEaN3h2p5/RLsKiuRZU7rQDWuKorVcnZJIVSIVwDFfidrm/9uOk6oBRIEEAYPNgB4EiHRNH0RaE80HFEBUdGy49RulOFfEiWdU44jX3whZJMYP1LOv2/arqbfyfCt6F3qm8jL0bLvjYVnr9/tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533509; c=relaxed/simple;
	bh=gO8FLyj+NCUktH2F1Xi4yqNU9n6oYsgKFfdDZdYlE28=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bDyg5HauCVQ+FkGMOEK8to/Y+Zr2hcxfPd0dh29IEAaB9X7QCWfUYKctxPzNftzixCFhbNBzHFJKE3dZSktHyxQebkdNrFvUhJasSZ637vFIu6crc/XZ4S8wtADzaip/7XbnMWfUfST8E5eW19eE0eCCyIbngE6WAWrui7ga25E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TtL2CXJn; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujfb1XXwvfT/G5NFead+PrrtzYNtF/YDUZwcodoxixk52CtfCCbzr8foSBDeepHnzijv9HMWRPeNJHQUeyX5MDK9We4V8aKoojN1L8ivWlpxk0sBsHZddPoeW5F7UK6ic6HDII19Pa72f7lVKoasvvSDNx4w/Oh1+Q0WZzeq/bQp4zpRYaW4/Ypypym+V7AB1B9I6/CFBkCOsaLfrNKXpOX/NhFPAgzNCbWGfovjNUwZxqy/A7l5JHZ9Zq3ASlUGd70eHuXQln/1rSyHmEGcrO28wUQPdzUlRgIyMDqP70PgFOjam8Hp8k/yEVqUs7ucnBI+lg+uk0PfqrvG3NcF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO8FLyj+NCUktH2F1Xi4yqNU9n6oYsgKFfdDZdYlE28=;
 b=Km+vgjw7p86y0FX2fjlpU1eESvaYr0lZhXWOnDZkDak43dwkkKWeQsAslXSarU+jvSrFAnf1VZ8Hd24oCAwC6s4dglWzPUDh+f6XCjPB4kQO3+H/SnfEHkhGFUzz5uYRL64EmP+VJOy7fk2jHjEnSSGAwQkHju5uAEk74ZCdwFkElk0r7ksJ494TpMPtpCf3WcwFCom01ErkCB1mG+hYh1VaZdM2il5zak+5OqOoV/K0+Lz/5OXPgPeGu54EDY5h2XL4HqXu71Aie7eZo2sLYjAV50xD2wQInLmeOhLmdaBv/BOkLtMUC4cD9q+phUnb2RTBI+K4MMG6LlziuFkD7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO8FLyj+NCUktH2F1Xi4yqNU9n6oYsgKFfdDZdYlE28=;
 b=TtL2CXJnTFB+AnkHqAmHe4cQVPy3fiHFKESWhmtlrXh/6pg62d8yaGH3iEH0Y+MpqSmDmIkeDKhawkAl3b5Hi9FcXmLWhUKXrQsD1kHeA9Pu45YUMX0Gs2ZCpf8PvR2XJf2NZWNjDiIwYo7AXSCuciCqaThDMnqBADsSmYrE1DA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11050.jpnprd01.prod.outlook.com (2603:1096:400:396::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 09:04:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 09:04:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Don't switch to GPIO during
 resume
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Don't switch to GPIO during
 resume
Thread-Index: AQHb6m8wIfREawc+ukqznA2L97vsSbQgHByAgAAAWTA=
Date: Thu, 3 Jul 2025 09:04:59 +0000
Message-ID:
 <TY3PR01MB113460CAAC0348400C7ECB6E58643A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250701100154.37536-1-biju.das.jz@bp.renesas.com>
 <79510fbd-a738-4a6d-8e5d-f1d08aa44947@tuxon.dev>
In-Reply-To: <79510fbd-a738-4a6d-8e5d-f1d08aa44947@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11050:EE_
x-ms-office365-filtering-correlation-id: 5287f1e9-2a16-493b-28f8-08ddba10b04c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aDR5NW9wVUNYTzFuU1MyZzE5RXlBaHBnZDVrd2JDYVBIR082OVlTNUlMbDVN?=
 =?utf-8?B?cWNYUWNpbVVZME1kYVV4eGk2MnpjSnBjL3FwaXNPZjNMNmZQTitmZ1FJRkJ5?=
 =?utf-8?B?QldxRFVUWVFYK2VHb1hoYWhoMEJybi9oa3ZtVDFRRGVmbGFIWVVpS2hQSDJz?=
 =?utf-8?B?SGc4MlNhVkZOY1YwQmdSL1JXazJpS1EvMFhkdk1HVmRrQlNxQ3BSTC9qRjdK?=
 =?utf-8?B?aDRldGQ4MzE2RlpHNy9aZGs2YWw5cGFaNUhtdmMvWG1TbnFDU0haU3hTM3BN?=
 =?utf-8?B?eFNIZ20yeEd0azhqdHdhMUd1a0xtVm9MS3AzZEhEaml0Z0FVTlVQSjc3SGxo?=
 =?utf-8?B?VFpOUGR5OFhBcGY5STViMDJGNnlQRDRDUmh1TmIySjZFYkYzZGpiKzR6ekJa?=
 =?utf-8?B?Uk1ZMkdkS251RHNHYm9tZFJpZTJaSldlQ015QTAwRFFTWDhJckZsT1JYenZX?=
 =?utf-8?B?NVYwcElPd0lnQmMwd1ZlQW15NzhuRk85aEdnSUdCb2Z2dUUwb0FVdy9ienpI?=
 =?utf-8?B?SUxiNU1iNVNGcy9LSytsWVlrd1R4ZXpIU0lOcEJpQjN6OFhvVDhDK1FPZzRB?=
 =?utf-8?B?VEJvQ0pmQkpxUk91aXdvWHVTQWJ1RkJRb3VDRnZJK0plbEUybXVqU2FnVWpl?=
 =?utf-8?B?eDkvZzR0bWJHTFVsa2Z0UzRDaDNVK2xHc3hiR1Y2L1FhVXdiQVkwRVYzWFhh?=
 =?utf-8?B?UUhpMWxRald2Vkh6RDN2RzJtenFXRUNRT25YRXJkODlVK2dyNGVhWFdzcHZ0?=
 =?utf-8?B?Qy93SjlXZXhoUU42MEpVTTc2bzdJU0Q5YktuaW8rVXVXTkYzZytOYnNrSVdG?=
 =?utf-8?B?TmwwSmE2V1NEOFhweGxIQTRweXlhTDV4RUZNQUNiUkxJRjArRnBhWTNPSEpU?=
 =?utf-8?B?RVdwaDBpRDNoQWZmUWY5ZDhvcUlSNytaWWdOdkZZVS8vMmVacHRQVSsrSkow?=
 =?utf-8?B?TGhTbjgrUHI3aFNUUE5yczlSSEY5K2JMeTJMaE5hTE81RWc4T3IyeXpPbDBH?=
 =?utf-8?B?dWR4bi9zQkhKOVhCeExGLzhZQkREb2toZlg3MlI1WUdMdWNNVjUzR2VxbEV1?=
 =?utf-8?B?S3dDbFh2THA2WWo1MWh5cncvb3NTVnYxU0NyYk5Hc3luYWs0UHd3U29scWZB?=
 =?utf-8?B?ZndOUjlPNVdvVFJ4YlJnNVdXMXZzSHpUVDNKWmtKb3AvVnpmY3pQSk1DdURN?=
 =?utf-8?B?eklOUFptWG8yRjd0Tm9jbGFDaFUvWTY2WFZMN0FENXFaVTU0UFJJbjEzS1Rz?=
 =?utf-8?B?ZUo3L3RVVG1rY2l1L3hsbG4vRHdXeUxTWW1iU3Rrb01UMW1tbUpzcG1XdUVj?=
 =?utf-8?B?RlhuSGJ2QTJyQldUNFphbWI5NVkvMzRlRnB3Uk9XQmdtU2tMNW8rclduRUdJ?=
 =?utf-8?B?Q2RvSlhYZTRHQjJGYUxhRFJBK2c0ZnlQc05IcjFEWTJaRkhKelpucXZ6M25D?=
 =?utf-8?B?N1hyYmV1QzMvOEdNT3VjMnlTaGRTL1hnUmJjeXNVRFhuRllIYjVwYnpaa1hj?=
 =?utf-8?B?RmJHZEJzRkRvTy9rME1xWTJNVUlaMCthVEErclM1Ym5tK29ncWhiOGpHQzdz?=
 =?utf-8?B?bEY4UE9peWhiWndncjZjYVU0dWs2NjlrMmY0dkZaL2h3OVo4dWsvQmpFTmlD?=
 =?utf-8?B?MXkraUhnOXJIMFgzL21hRUl4c1pKSVNhQ0s2aGdJTlAzeDlwK3l6NW11ZDVJ?=
 =?utf-8?B?bk1iclBmU3hiT0dEeU9MT0xNSjVRRmdyakdlQ2JXejkxQ3N5OWdNZmh5TlBs?=
 =?utf-8?B?YnFONktBa0NLMkU1elJ6dkMyZUJYMmo0VFphYWlMV1NxUzMxWVhNQVcyUExt?=
 =?utf-8?B?OEpPSW1JSFJpalVPM3NpZk1CVkg3QTR6K29hRVVZOTI3RU9DaUhHempPRnVk?=
 =?utf-8?B?elJSa2pndElBYzJjaEUrMW8rdWg2SHVpM2hVdDVjMUEySG5BZVV3bHoxQllW?=
 =?utf-8?B?YUQxWHcyYzJCcDJVdHhmS29mUXlNN244cG5NaWs3V3NlWkk5a054NW9Danow?=
 =?utf-8?Q?U5yg8fl+DHV593XIAVhS6P4WwoxuZc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2RHUi93OUVQQWpTMlZteDJWYjJRQWdLcUZQVk9vUHMrajRTR05YQTROOE1m?=
 =?utf-8?B?RUhsYWR4NnB3SUdtT1cvdkprdE5maGVPT2NndTlQVEpwM2cyNDluL2pQeDN0?=
 =?utf-8?B?cG44SWJwbFlvMVkzY2g2L1crQitlTmp0dTlFd0UzU2pMRFdLeEpPb3dpWTVs?=
 =?utf-8?B?Zzd3STBEbzNXclRxUnpSL3lKbG5ad0VCT2NDRmFhV09uNkw3YUkwUm5oNFNZ?=
 =?utf-8?B?TllUTkdxSy9qeVdzZ0ptL3dsTzNQTEdjYjBmMUpWNE9rS3ZrRzlqMTJURmVo?=
 =?utf-8?B?Nmt1cnhvd3RzU2FLN2h4enJXZnFVWEFjMmNGcU42dDNMeE9jRUs5ZXhMSWU2?=
 =?utf-8?B?QlNuUVhwSkZESnkyeHdSVU5OSSt4enNjZkRFeVA4bUNwWlZROC9tQ2tQNzVM?=
 =?utf-8?B?U3lqcTlWOW1vZE9kb0haUzVna0Z3WmR3UDNUOFNESVVvcGVVUXAzRnFXQ2FP?=
 =?utf-8?B?VVplMVJqS2N2K3U0bzEyNXVXYmk4MXo4dys2OEpmMk1NRDkvNFI4aGVTU1Bz?=
 =?utf-8?B?ZVFWb3lmRUxCR2RPMytuV3pkUlk4MjE0TjYzTXJkTUhaaUxHQllnL1EwSVM0?=
 =?utf-8?B?RUFyTVZmdWNtekJydmJoZDFhMnRReDE3cE9tdXNQOEhNZnF3dEowZk5KamVT?=
 =?utf-8?B?RXZGTkZjUFJHc2g1UnhoQlU3YWc2eXJYeXV5ZG04cUJwVmpzVllDWTE5bDdW?=
 =?utf-8?B?a3JOUEtXL3Y4ZUEvaXlOclljS1ZoRnRNYmlkbTVlc3VKcUVwYlNuWWZMSGJN?=
 =?utf-8?B?N2J5VFNFYTkxdGdRQWVRanZkZWpnTldwL29MUFlnbmtHakNiUVhDdTRlc0d1?=
 =?utf-8?B?UkRpK1JnT2hIaHlEMjh6bkorbGNUTjI2N1JNTHlDYVNtUktZY1prekREN3pC?=
 =?utf-8?B?N1pWRlkxb1p1STVTNCt4UVd5NUhFTEI4R2tjQ0dvM0JpbzJOOC9UOFFSTzc5?=
 =?utf-8?B?LzJLRGdvNjE1eXc4MHEyclpWZk1ZVFFtU3piVmNUS25uai9EdDF5S1pJWjhy?=
 =?utf-8?B?Q2F2WVAyc3QzWG5jUlBHTDRoeGx5UDJwVVdkM0JCdlJRK0grcHNXVm1PL1cr?=
 =?utf-8?B?VHpLd3VLQ2w4RkdZVjBHNTV0NWlib2VDUWdTK0dsK3BYenI3SWorYWNLT1FI?=
 =?utf-8?B?b1dTbjJvMzFnTEJQTTlTdUtQc254TGZUeTlucXNpZXBYOE9CUjZVQmN1ckpG?=
 =?utf-8?B?YytXRXFIcHBydHRKMHJwVVl2RTZUT001QmVhYlNNMVlwWEovNXB1UGM4UzV4?=
 =?utf-8?B?RHJHYksxRUd3Tnp4bzBiTU5uejdTLzBkR1FHZVhxNytHSG5VRG9ieVAxa0VP?=
 =?utf-8?B?d1E5TVdVNkd3dE9yNnhXMGd4V2dzb3VoaGhyNnhMZGpvaDZtTEpTODZPOTRj?=
 =?utf-8?B?OU5BbkRGazVES0ZaSCtKV2VkaVJTOHNJOXJqaWNmUmJ6eHRaQ2taa1pLb29K?=
 =?utf-8?B?Y2tzUUxlR0tNZVF2VGhFOUplUktiYTdrTDBsOStTaEZnak1ySjNORlVPNTZy?=
 =?utf-8?B?VFpmNWZPd1hLblVkNFM4RmVzOGZPdmNJcytjNHdwdXFlS2RwMmRuQ1N6VHE4?=
 =?utf-8?B?Nk40RzF3TGVQYS8wQktYaE94amNhNWExUGxTS3U4cGljdjBBQlNDZUE2Vmts?=
 =?utf-8?B?Y3lKWit2ekRiWm9sSWtqMy9NcmVvM3JWcGRBQ2NQdkkrT09uUytzT0Q3d0tk?=
 =?utf-8?B?eGpaKzdEcDBlRFFNQzBCRGtBUzE0UVBGTWNZWXB5M3M3NHNJeGhFSGlLdHVw?=
 =?utf-8?B?N05ldWNmSVdpR2doakFhYWw1ZXFoWjBpa3JrMzVyVVNUNFNzbWRBbU9Db2RV?=
 =?utf-8?B?cWFjMjgyaGlxOW5hZ3JCL0FQK3BFVlZLNGFjR1ZxanVDZklRcnNZYVEvUnNw?=
 =?utf-8?B?eG5DRVNpdUE0T3ROU1dZUHFRcDFZT3dmZnh1dXJrblFmU0VtalMra1o5alhp?=
 =?utf-8?B?VEZtZXBVeGo3d3EvaW5aeXJ1NzNtM1kxektEaDhCdUFjQnpncldLOVZIUGx0?=
 =?utf-8?B?RzJ0QzdianF0N2d6eHF0U2JESmZrZDU2MVNmaDdLMXJBUmx4a2l2T1E4RkJm?=
 =?utf-8?B?MWpsQVFWQmgybS91eG1kM1RyWEhlZ3RPS1BYM1I1UUdpSnVPeXFaMUFnY01w?=
 =?utf-8?B?U2pkb0pESi85bkNmTGE1bUJXZTl0dkZ0NURRcjZmMmxrbkYzdlVqbTBKbnFz?=
 =?utf-8?B?bnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287f1e9-2a16-493b-28f8-08ddba10b04c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 09:04:59.5893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGKoqA7PquKMLGJEIuyZVz4LSFkHd89CX+Zmi0aOhhiFslQqWLEz36i1s0n9rueJhJ/CcbEMMPrUv1Gz6TjuncO729ODZRtluMPf645XFL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11050

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAwMyBKdWx5IDIw
MjUgMDk6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcGluY3RybDogcmVuZXNhczogcnpnMmw6
IERvbid0IHN3aXRjaCB0byBHUElPIGR1cmluZyByZXN1bWUNCj4gDQo+IEhpLCBCaWp1LA0KPiAN
Cj4gT24gMDEuMDcuMjAyNSAxMzowMSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gRXZlbiB0aG91Z2gg
c29tZSBwaW5zIGFyZSBzZXQgY29ycmVjdGx5IGR1cmluZyByZXN1bWUoZS5nLjogUFMwKSwgZHVl
DQo+ID4gdG8gdGhlIHVuY29uZGl0aW9uYWwgc3dpdGNoIHRvIEdQSU8gZm9yIHJlc3RvcmluZyB0
aGUgUEZDIHJlZ2lzdGVyIGlzDQo+ID4gdHJpZ2dlcmluZyBzcHVyaW91cyBJUlEgb24gUlovRzNF
LiBTbyBhdm9pZCBzd2l0Y2ggdG8gR1BJTyBpZiB0aGUgcGluDQo+ID4gaXMgY29uZmlndXJlZCBj
b3JyZWN0bHkgZHVyaW5nIHJlc3VtZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9waW5j
dHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jIHwgMzUNCj4gPiArKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5j
dHJsLXJ6ZzJsLmMNCj4gPiBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Yw0KPiA+IGluZGV4IDJhMTBhZTBiZjViZC4uMDllZTc3MWIxZTM2IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYw0KPiA+IEBAIC0zMTE4LDI3ICszMTE4
LDM2IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX3BpbmN0cmxfcG1fc2V0dXBfcGZjKHN0cnVjdCByemcy
bF9waW5jdHJsICpwY3RybCkNCj4gPiAgCQlwbSA9IHJlYWR3KHBjdHJsLT5iYXNlICsgUE0ob2Zm
KSk7DQo+ID4gIAkJZm9yX2VhY2hfc2V0X2JpdChwaW4sICZwaW5tYXAsIG1heF9waW4pIHsNCj4g
PiAgCQkJc3RydWN0IHJ6ZzJsX3BpbmN0cmxfcmVnX2NhY2hlICpjYWNoZSA9IHBjdHJsLT5jYWNo
ZTsNCj4gPiArCQkJdTMyIHBmY19tYXNrOw0KPiA+ICsJCQl1MzIgcGZjX3ZhbDsNCj4gPiArCQkJ
dTggcG1jX3ZhbDsNCj4gPg0KPiA+ICAJCQkvKiBOb3RoaW5nIHRvIGRvIGlmIFBGQyB3YXMgbm90
IGNvbmZpZ3VyZWQgYmVmb3JlLiAqLw0KPiA+ICAJCQlpZiAoIShjYWNoZS0+cG1jW3BvcnRdICYg
QklUKHBpbikpKQ0KPiA+ICAJCQkJY29udGludWU7DQo+ID4NCj4gPiAtCQkJLyogU2V0IHBpbiB0
byAnTm9uLXVzZSAoSGktWiBpbnB1dCBwcm90ZWN0aW9uKScgKi8NCj4gPiAtCQkJcG0gJj0gfihQ
TV9NQVNLIDw8IChwaW4gKiAyKSk7DQo+ID4gLQkJCXdyaXRldyhwbSwgcGN0cmwtPmJhc2UgKyBQ
TShvZmYpKTsNCj4gPiArCQkJcGZjX3ZhbCA9IHJlYWRsKHBjdHJsLT5iYXNlICsgUEZDKG9mZikp
Ow0KPiA+ICsJCQlwbWNfdmFsID0gcmVhZGIocGN0cmwtPmJhc2UgKyBQTUMob2ZmKSkgJiBCSVQo
cGluKTsNCj4gPiArCQkJcGZjX21hc2sgPSBQRkNfTUFTSyA8PCAocGluICogNCk7DQo+ID4NCj4g
PiAtCQkJLyogVGVtcG9yYXJpbHkgc3dpdGNoIHRvIEdQSU8gbW9kZSB3aXRoIFBNQyByZWdpc3Rl
ciAqLw0KPiA+IC0JCQlwbWMgJj0gfkJJVChwaW4pOw0KPiA+IC0JCQl3cml0ZWIocG1jLCBwY3Ry
bC0+YmFzZSArIFBNQyhvZmYpKTsNCj4gPiArCQkJaWYgKCFwbWNfdmFsIHx8ICgoY2FjaGUtPnBm
Y1twb3J0XSAmIHBmY19tYXNrKSAhPSAocGZjX3ZhbCAmDQo+ID4gK3BmY19tYXNrKSkpIHsNCj4g
DQo+IFdlIHNob3VsZCBiZSByZXN0b3JpbmcgaGVyZSB0aGUgcHJldmlvdXMgTGludXggc3RhdGUu
IFRoaXMgZnVuY3Rpb24gc2hvdWxkIG5vdCBiZSBleGVjdXRlZCBmb3IgcGlucw0KPiB0aGF0IHdl
cmVuJ3QgcHJldmlvdXNseSAoYmVmb3JlIHN1c3BlbmRpbmcpIGNvbmZpZ3VyZWQgYnkgTGludXgu
IFRoaXMgY29uZGl0aW9uOg0KDQpZZXMsIGJ1dCBzaG91bGQgbm90IGdlbmVyYXRlIHNwdXJpb3Vz
IElSUS4NCg0KPiANCj4gaWYgKCEoY2FjaGUtPnBtY1twb3J0XSAmIEJJVChwaW4pKSkNCj4gc2hv
dWxkIGFsbG93IGF2b2lkaW5nIHRoaXMuDQo+IA0KPiBDaGVja2luZyBwbWNfdmFsIGhlcmUgdGFr
ZXMgaW50byBhY2NvdW50IGFsc28gdGhlIHNldHRpbmdzIHRoYXQgd2VyZSBkb25lICh3aGlsZSBz
dXNwZW5kL3Jlc3VtZSkgYnkNCj4gb3RoZXIgYXBwbGljYXRpb25zIChlLmcuIGJvb3Rsb2FkZXIg
aW52b2x2ZWQgaW4gdGhlIHJlc3VtZSBwcm9jZXNzKS4NCg0KQ3VycmVudGx5IFNMRUVQIGJ1dHRv
biBQUzAgaGFzIHJlc2V0IHZhbHVlIFBNQz0xLCBQRkM9MA0KT24gUmVzdW1lIGZyb20gU1RSLCB0
aGUgcGluIGlzIGluIGNvcnJlY3Qgc3RhdGUgUE1DPTEsIFBGQz0wLg0KDQpCdXQgb24gdGhlIHJl
c3VtZSBjb2RlLCB5b3UgYXJlIG1ha2luZyBQTUM9MCwgUE09MCB0byBhbiBpbnRlcm1lZGlhdGUg
c3dpdGNoDQp3aGljaCBpcyBnZW5lcmF0aW5nIHNwdXJpb3VzIElSUSBhbmQgdGhlbiBhZ2FpbiBt
YWtpbmcgaXQgYXMgUE1DPTEsIFBGQz0wLg0KDQoNCkJhc2ljYWxseSwgdGhlIHBhdGNoIEkgc2Vu
dCBpcyBhIGZpeC4NCg0KSXQgYXZvaWRzLCBpbnRlcm1lZGlhdGUgc3dpdGNoIHRvIEdQSU8gYW5k
IGF2b2lkcyBzcHVyaW91cyBJUlEsIGlmIHRoZSBQSU4NCklzIGNvcnJlY3RseSBjb25maWd1cmVk
IGR1cmluZyByZXN1bWUuDQoNCkNoZWVycywNCkJpanUNCg0KDQoNCg==

