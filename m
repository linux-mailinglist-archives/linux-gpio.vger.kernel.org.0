Return-Path: <linux-gpio+bounces-28375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88985C51094
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2796B3A94B9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 07:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893972F1FCF;
	Wed, 12 Nov 2025 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="epwXyD4F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C62F0C67;
	Wed, 12 Nov 2025 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762934331; cv=fail; b=asrlrXqoCLZIPMUXYXCI+muumH436Jbv1hxTwO2yxDT8+CP/Yy5G6W2mc/zjR+3ufdlZu22DAN2zHVNQcEbSed7FRVy/4x701MLarqjpNMkMQKOfknvdxV+3N2QDNbFKSOhUp5shIhGWcK+XFzKGyaPaFeYJL/gEOrvwi9/U6M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762934331; c=relaxed/simple;
	bh=tNrv7ya+uNbfaXlDYuT98hw8OAyfShg6h8SzaMkWDZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=azdF+ykrVH+yTqDsO6l+UlLslGhuFSe5yMt1SgamRWAPrhoRxGPUtDdAvCdc8Ak5RBLs6NKcy1b8LjJGI8K1F4grcLCRJRc+RbCQZZcx/YWgoZ2hhmCoPEqlJoT3rvdd0GvXK6o2M67rLUSJ5087bvaUmEXGOGJLmuFRj4gfj68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=epwXyD4F; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpTPc9g3HMvrxwYSQGDvIn2cm+7m9FOwbod3RsnIJtHJYPOw1lhJViYavflLnVVN6QWfQC0CiisSxVlxQWHLQyyXBK+A+Z5zvrg183hQ6CBV9//1VQGb3GG6LJ/nZpBtIjezRD/x7HaBU/1KODKt2u5Ya+PcS1sjfTOV0oULu3hjJqta+19SHxDCYMIXuTujSWn/hveHgxkKBzA4gnUdcKoww/6A4NXPuDGM2rLZ1ykjM495EacQ+6/NhKhID3CbfmvJLeYH6Lixj4uc7IYd3nM0vaR5q36pW6IAOKFtoSkjOejvVW7vKLfn3eT64GV4UUnNcOYCHi2SM5PukgobtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DUj8fjD+HZZcEMbJNtKwwaFlmtaLR2NdVje4FZMhKk=;
 b=r77LvpYWHDYsjktwwhgmdKgk6rZL7URwKwUjBosKXS7Si82MLNgnVjWq7lji5QruFGgcC5tqr5FB3NuPXDGT0kI0WNObS7SWYI/lLuBr9pN7RAG6qlv5OSBCGCn496lxjEYRacqN+NtBPu8AqPiT8zjUI+G3z8yYFjRSF03az9VSPt0KdHFGA+atCM4cJbW9STh82AQKe7kvDbhsXGbvdUoxWdA0+jUhI+wzYMcRSPpEnSsQJsllIhHAw6r612BScKsSHt8BHEVo1t7ZOaY9RgOZ3nXE7lzL6cqUxujNVyjqQRxmLZXlKP6uQfHirv/Gqn1++pDejGNHSI2ygJ8RvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DUj8fjD+HZZcEMbJNtKwwaFlmtaLR2NdVje4FZMhKk=;
 b=epwXyD4Fi/HzoGhr2Wk7CeTYwkZF1wyfvLQvUrEXA3E9Jc5tHrPmJrmVXGCOureZbaUB3GRYeMhhHGVREPE0tsC7ht8vTo8g5GbGavAoMy9rA5uoiI145KY8nWrNLkouXwldKRzUxIAVfI1XPzruM9k2EaKbI3CQNblqLSZzcFsfngNLIUoJE/16Rm6WcA4JOJrjQ9wtk3fem6DNfc7nH+E7e1ZGiPKsFI1w6na8AGW2GKJpz1r2l4TGwdjYyW1XDDsZVD9V5NJIk5D8rLMZFuwyUydZHwarlVEwzyN4z4+NxMNAnEVdviv9sxDwPlaIC/htOkj8kLLC3MB6rpGBmg==
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 07:58:35 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::67fa:3e46:acd8:78d0%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 07:58:35 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: Jared Kangas <jkangas@redhat.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky
 Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	dl-S32 <S32@nxp.com>, Chester Lin <chester62515@gmail.com>, Matthias Brugger
	<mbrugger@suse.com>, "Ghennadi Procopciuc (OSS)"
	<ghennadi.procopciuc@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH 1/2] pinctrl: s32cc: fix uninitialized memory in
 s32_pinctrl_desc
Thread-Topic: [EXT] [PATCH 1/2] pinctrl: s32cc: fix uninitialized memory in
 s32_pinctrl_desc
Thread-Index: AQHcU1Xe5NynO3K0fkG/uJzE7FWB3rTurICA
Date: Wed, 12 Nov 2025 07:58:35 +0000
Message-ID:
 <AM9PR04MB88259A7792EA2022133F310FE2CCA@AM9PR04MB8825.eurprd04.prod.outlook.com>
References: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
 <20251111-pinctrl-s32cc-alloc-init-v1-1-071b3485b776@redhat.com>
In-Reply-To: <20251111-pinctrl-s32cc-alloc-init-v1-1-071b3485b776@redhat.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8825:EE_|MRWPR04MB11287:EE_
x-ms-office365-filtering-correlation-id: a3b595b9-1e32-47ee-2f5c-08de21c14830
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bprKMGM3qH5iSZpy5ty4rZc0Tl1LVnET4Tx+C/KLCkQbYJ8JEvCHq6Qprnn8?=
 =?us-ascii?Q?ASTAL4+qTYymbVwz1VTvRC2BTl9ooECkfPqcyO1VVnjfeQ79t55garIpZM14?=
 =?us-ascii?Q?EIcLlhQK0TMIPlLr9g2oBaO+lP1lQiRsGL5fzR6brX6pq0ahxCnFE9B3kpyj?=
 =?us-ascii?Q?VF18OxunDn1Hjs48BV1B4t76SMq1SIiyRhpJp0Lsz17BSO8oB6Yr5swhYghQ?=
 =?us-ascii?Q?eoFsptaL+uUC51jQSPSaXnrFsJ1J6jDnTondBoecDNfq4a01BYjFOh7p92ch?=
 =?us-ascii?Q?jKAaxr0zTo7Hwp0MOciHku4EscWX8JkXUHY3w9RCUhJijvaRbYx/2OU2Tr7R?=
 =?us-ascii?Q?pRltcVQWG0cLVs7wu9UhN0gT0oNUUmmhCAAZyRcgzANl1HyjkAMNIdkcPHHG?=
 =?us-ascii?Q?UdW9V98sqEsr2+ysK/LwX/iIhEyzkR5lKtnsCCw9VLKwspQ6TCq5zvDJK001?=
 =?us-ascii?Q?5spQt2DboUbiEbT/9KQ/SsvjgBVa+Bn9yYzXm5OlNW2iElR5cmrRqZhpQoj5?=
 =?us-ascii?Q?xe13x8LdCKvD0GGEgjxHxNkYsanH51TEPjMFtcb39Yn89LWi6RB2YNmFdzDh?=
 =?us-ascii?Q?yk7YHkKBUtfB9CZ1Dh+Yemcr4YzmAZCXTS/PxLhdghSdjPW75Vmh2iRMF1sT?=
 =?us-ascii?Q?ulVc/Nj9u5NCQyVNu8Oe/o9eTTAb1PJlaJm3zKkIyO14QSvqqHX/PMA4TYcM?=
 =?us-ascii?Q?3fPwVg8+1VLYToSDF4Fjr9nlkxPiVDgayd0aBhIKKmMC9SMz+S1RLEMR+cH9?=
 =?us-ascii?Q?5C2Hafnj35LkZo3mztz4PZvOCoHYpGNVoRbLGTiqyB3tZib0XkyxKlcjauq4?=
 =?us-ascii?Q?j9CoGZ83bscJaLYo/8d6S8RmOcdExmWQQZfpJA8vB/zWNL4ZJPB4cQWHI3Ao?=
 =?us-ascii?Q?ZUNP7XYzEh1xkHBnmztrKUXaqSagiDcASQJc/Pu+6ntMSVLaAzTmDra4Avao?=
 =?us-ascii?Q?qN0wfTpSujKztzgTp+6iBPHtxn/G/nr2IC32BDCL0Zx+p3pvR/Cuzsf7r9QA?=
 =?us-ascii?Q?UkiQhQfQSEzM2CI0VWA/epaKtC2OTk6jmtcGz77yJnfemOH1xjIzuLDknJzX?=
 =?us-ascii?Q?L6r7SW8RHzD2RjsmkSnwzzzpUtaI+6LY9jI9c+U57MhQ1TFxvShcDlCv9s6P?=
 =?us-ascii?Q?w6Ka2nU5glCdXYkIirUVGgj5qNqXULwEuk73yJFUyvkds0fTRFMhXVrnzWBR?=
 =?us-ascii?Q?YNZirll/nqPYxlgPFkiZgU7qxYKVLRN94lgQpBc5AFSZCqlb37EP1Nhz+aXV?=
 =?us-ascii?Q?GlhacbIBQEEBw19a2tzn1aiE+fk0STla+ExCgmH/lbsxK29eG7vIjHWtKcBe?=
 =?us-ascii?Q?3fE2tU5JR0hzd8SdyxGwv0OKDD+aC47ToYaD41WE6cVyaA0mF5ZKBzEO9UOd?=
 =?us-ascii?Q?Qu1Anmhc9Hq6o63ybQegQDGEuZLiVnMG/IZ2f1B+mwHlDgoqZxw3NwaY4Vr8?=
 =?us-ascii?Q?hQ9IWOqKpEe3JuB/MtC6nMvPCoMJ3F2xMvzCzEzmu1G+IwGntWjvy8gJLG8m?=
 =?us-ascii?Q?B+mjJQIlSR8k2QBnCgJKdM2XHJC4i2QuFO45OH02x7WVL4ufOxbwk8C+mg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jQ/Yt+pvcQggxh7d9nUZd+9XZWmfEM+y0dwS1EDvdcXPVfTw3wD/ZO6H3cdR?=
 =?us-ascii?Q?yHm0OQZ/pCcENBBBe89MWugzUMsRoCbpoKborS6F0PUIUHe3h7CsYYnkUD+Q?=
 =?us-ascii?Q?GOGTBlKhvgt1jwt5oi6Tv68uFM4rJCWl5hsms5TQKPNQsS/oYbpX3hzbQvBb?=
 =?us-ascii?Q?j8q4QPKxXmh10nrJg5halDkV2L3IdFaOuNJ7J2Xrr5/47uAy1hSTslJ+NvFP?=
 =?us-ascii?Q?UBVHf8778OwmKcsbfb4Z8FqWxgEnONSbRs1NIhZLfE81T4HEr1D3l4/f47kH?=
 =?us-ascii?Q?q6+QAM9aE9EoLnk8dWeQRNgdagakVgU5Gp4Ih7ZmJxr89UXvXv0RlmkaYQ8c?=
 =?us-ascii?Q?Nf+D/9xZYjVYcVjrigXshwyK1Hn1dUZe1Gc7caJw7h9VV3zn1T5OGQTcQU82?=
 =?us-ascii?Q?4bvRzhvv3iAfHJwpaKOZ/ezdU3v6RETGax56LXs+YHWJvLPN8aNTPhv13qM6?=
 =?us-ascii?Q?eiFZRy2gkIRxHubQH3wc/qIAisCIKbHCK3u+sP+yRs1/y9aN0gHIgB6FN6Vz?=
 =?us-ascii?Q?/7TyEhuxp8Rg5+SCM2Q6HaQusfiNIvrX70Bo4D56X8NxDP1ByBBDxncCBit1?=
 =?us-ascii?Q?F7ttrzM6vAgwblmoxDBgNLpxQ9NhfbkvSQb2j4iC3CBH8OnawHvJQ4yMpI/m?=
 =?us-ascii?Q?kQm6BeiVfDLEBc4go+ERmxs8NFHpTmQAFtrZrqQlht9SAC3C8zXvWYtapxgz?=
 =?us-ascii?Q?sZKBSJSEHDQu5gN9ESuVb9bZmZpDGK9WM5FxZblDdNvaxiIPHPKykoYzlDD1?=
 =?us-ascii?Q?pPoiEfZZ/73SUi296HZjTa5v4neLueo0gAJaFdG8SIBENNqRsT0lzWZloTTE?=
 =?us-ascii?Q?OHozwKQlnp5GGCdk1vAJU+Vfc7qHGOyoVJBlj4+s3G+W+dm6N7WSvOvtX7eF?=
 =?us-ascii?Q?bY5VCpJgmkrbecoJj1d4MZs4PjRNvBSSIYt2zNFSBnrCr80tTxemsGC0yON2?=
 =?us-ascii?Q?2DmUhRG4Dkj0Ta4VI4aCjiXW6iMF4s+RU2h/pSpiuyux1g+lumXfRawHZCDK?=
 =?us-ascii?Q?jEG7oWs11vHRaU9C43j64SN6v37jAcx8C7lano7/UNUEIQaMDgp66Jg94pnW?=
 =?us-ascii?Q?IrFS/wlTH5OzuX5hiV3FzEEA1Oi/BJ5dWIYbzoeMuwaXx7gZyhkbczEgn/RC?=
 =?us-ascii?Q?DTTrDzYg+16zxHInIrD7VI9gyU2nbw0vrwAYCcAVWvbTPDuGtBVCiQbZ+HZF?=
 =?us-ascii?Q?u3uFq3xJU7EIQ4LycgQwge6e6iWzLX2H1u6r7jdguzCdObuajUt37GbzMvtz?=
 =?us-ascii?Q?d/ws6lQxouNCI0b6Z4ZNnglgxUisMpPcQMn+ppdv1CkzrS4hYaTRr+3IZ/6j?=
 =?us-ascii?Q?DBr4MCBCkBe3z//lwKvPS0kHw0LTOpW4ZqTDo8RtBdHmrnPNs3zWqVUsUbGt?=
 =?us-ascii?Q?NGe+gGgZW/7lERMkk62578t+Lfol0VzQAByjoXdJHl121aKPC3Axlbz3Y15u?=
 =?us-ascii?Q?Ui6pCRhQ7K/tpAtjroC9cbxzN5UcZbNKKW128Rehy+7VaNPW2kRxN4mHTgmB?=
 =?us-ascii?Q?99LDk8kcozU1W2VUWgyHLQ/QldmUQ6tLJ8VPW+OkTxyKC9sUN+KrEqXNpCOH?=
 =?us-ascii?Q?KFiPMI8fpFAare2c6Ok=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b595b9-1e32-47ee-2f5c-08de21c14830
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 07:58:35.6131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keIrTo85ivMuq0lAMxk221i8CY+B6hrZUM7HV+3+9zsJbVacD4yJYA9bQFihJFyDDhvVGWCoGbjBIVixxGBs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287

>=20
> s32_pinctrl_desc is allocated with devm_kmalloc(), but not all of its
> fields are initialized. Notably, num_custom_params is used in
> pinconf_generic_parse_dt_config(), resulting in intermittent allocation
> errors, such as the following splat when probing i2c-imx:
>=20
>         WARNING: CPU: 0 PID: 176 at mm/page_alloc.c:4795
> __alloc_pages_noprof+0x290/0x300
>         [...]
>         Hardware name: NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
> (DT)
>         [...]
>         Call trace:
>          __alloc_pages_noprof+0x290/0x300 (P)
>          ___kmalloc_large_node+0x84/0x168
>          __kmalloc_large_node_noprof+0x34/0x120
>          __kmalloc_noprof+0x2ac/0x378
>          pinconf_generic_parse_dt_config+0x68/0x1a0
>          s32_dt_node_to_map+0x104/0x248
>          dt_to_map_one_config+0x154/0x1d8
>          pinctrl_dt_to_map+0x12c/0x280
>          create_pinctrl+0x6c/0x270
>          pinctrl_get+0xc0/0x170
>          devm_pinctrl_get+0x50/0xa0
>          pinctrl_bind_pins+0x60/0x2a0
>          really_probe+0x60/0x3a0
>         [...]
>          __platform_driver_register+0x2c/0x40
>          i2c_adap_imx_init+0x28/0xff8 [i2c_imx]
>         [...]
>=20
> This results in later parse failures that can cause issues in dependent
> drivers:
>=20
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0=
-
> pins/i2c0-grp0: could not parse node property
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c0=
-
> pins/i2c0-grp0: could not parse node property
>         [...]
>         pca953x 0-0022: failed writing register: -6
>         i2c i2c-0: IMX I2C adapter registered
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2=
-
> pins/i2c2-grp0: could not parse node property
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c2=
-
> pins/i2c2-grp0: could not parse node property
>         i2c i2c-1: IMX I2C adapter registered
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4=
-
> pins/i2c4-grp0: could not parse node property
>         s32g-siul2-pinctrl 4009c240.pinctrl: /soc@0/pinctrl@4009c240/i2c4=
-
> pins/i2c4-grp0: could not parse node property
>         i2c i2c-2: IMX I2C adapter registered
>=20
> Fix this by initializing s32_pinctrl_desc with devm_kzalloc() instead of
> devm_kmalloc() in s32_pinctrl_probe(), which sets the previously
> uninitialized fields to zero.
>=20
> Fixes: fd84aaa8173d ("pinctrl: add NXP S32 SoC family support")
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-
> s32cc.c
> index
> 501eb296c76050aa05386c51ef6ae0f97d4c76c3..51ecb8d0fb7e8a203e10cbe9
> 65dfec308eaa5f30 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -951,7 +951,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         spin_lock_init(&ipctl->gpio_configs_lock);
>=20
>         s32_pinctrl_desc =3D
> -               devm_kmalloc(&pdev->dev, sizeof(*s32_pinctrl_desc),
> GFP_KERNEL);
> +               devm_kzalloc(&pdev->dev, sizeof(*s32_pinctrl_desc), GFP_K=
ERNEL);
>         if (!s32_pinctrl_desc)
>                 return -ENOMEM;
>=20
>=20
> --
> 2.51.1

Thanks for the fix (I had it on my list too).

Tested-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



