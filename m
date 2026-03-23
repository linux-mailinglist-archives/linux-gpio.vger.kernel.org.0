Return-Path: <linux-gpio+bounces-33992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJSaO3/ywGkSPAQAu9opvQ
	(envelope-from <linux-gpio+bounces-33992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:57:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA962EDF40
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 08:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF28300DD7F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 07:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3A23659FD;
	Mon, 23 Mar 2026 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ybs4MhBJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6536495A;
	Mon, 23 Mar 2026 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252669; cv=fail; b=G6OPa4RA9r2nH7buftKvOfj3bIum3LVW/FpLp25vNmpY+ZVwbrpxmeAUOcbMVe9ixDPC2shs2r3LdVPh9H83reKLIzEI5sUOGc3QKd2DRU4Ikl2rgTJEQ269LBwkDhosFO/9f8I2L+w0KvyTyBh7j0b8HaGJ+PY9vSkgvhXXRMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252669; c=relaxed/simple;
	bh=nkrU6p6Qiyv8oEO0wrx4kIox9QVU6gPlFQN8ogmZ7Ac=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DutLST0HQRfUFHYt7LJ4yQB1I2UlUWd8ezjVW6L3jK++PPYMrxCFv0moMVQ5atotEdoYgv745wCRYvKdVsU2oP5i4x/ADoSpt/dvXPXvJt5dWXWfg+z4hEVfDc+OsK6uL9/IQIHB6WDYhGzPh1VLYKoUR6MNDbMJkuXp93nZB9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ybs4MhBJ; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIq9wJf/iyG9vdnvtdqhHrQNSKswR0Q0hpVEXHmOniD1vKWY+1uRd4zSrPlyWZ9iGnc3LtvqhVl05C+iUkyhbO25Fdod9c6f2rYslefJlseT9xJbcGO7XxW1bXfC2GFd32AhfpEm+Dfq+osXpoXhDfxpPz/XdKHTPA09uEo8JyAuHNAEcXkBxIla1vJoB+qG119Idbss2tpOnXBIi36g1a7Nf9nPNPMEqokX4MO2IYNV+XLBlwAaF1t3OIFDPP5+yN1vY7wWpSJhdgntybSDscfiNg+r15kpSGTEp2Wv4W/+IdJiO/YgDb4/vi9I4mYnj5Y2Iy/TWQyUtt974ZUJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOhwyX05mZgHWeVQ67LJ+dMprr7MV7sX2Japjm7LGaU=;
 b=SDOj/x6OSafouG8R11PbHgej6YeFuXenItwrLI5+8U4URT+HCu7yYDWE6zXUctrVU4A8sNhOQamqDXZSD5cyTCbzA35aDjCryHn4IzQ+C04PwQ1THoI+NSIH29bpw4ifRj+jXHgR9bp2CS3PmsnxOYVNEvNYP7PA3LIqdne042YpMWUETYYckJACrJOJB6D3PjJzTLqs6eNE1EiAe9vmFouBKwgkvOWfzUIx7kNvA8MD96P//awUIT/z0zGCjKaVoJVopsgu/XfaoGk7QQEW4AJ8IPCl+9FhodBe5nUbOtuaUUSyy5XVvA+sMgC347gXf57T5dGwz9i67WS1BiY1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOhwyX05mZgHWeVQ67LJ+dMprr7MV7sX2Japjm7LGaU=;
 b=Ybs4MhBJL4RkkfmZFMi8Uw/z+vkJLVvsy6z8I9P/+aCMRdYfPu0skkXkJD/l9wEXiHAhQ5ArsTurX4wejr/U9fLOZHaCde/L+WG+PQyarjtpCpQvpNqLpInXBBf9f56FJKd9bUg73hL0Xha9kKpGENjdrP71+K8mJSDHNIv2a8Op5XqhELaQ1YC31WxF4eRmUbKy6XdqqRE5tcLEHisg9rmjC4qxzgkpOrb1RAc+S6cJd5G7EOVvn7X2rbvgPtHF1jmcsX8X2cCtJ95g7kfegtJRQ8zTsSvW2lXgeVIJg1GhV/X05zndJG7kYw/omp+ZZll+j31hDrRV9tVelieLHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PA4PR04MB7568.eurprd04.prod.outlook.com (2603:10a6:102:f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 07:57:12 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9723.018; Mon, 23 Mar 2026
 07:57:19 +0000
Message-ID: <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
Date: Mon, 23 Mar 2026 09:57:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2
 module
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 devicetree@vger.kernel.org, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rob Herring <robh@kernel.org>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::12) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PA4PR04MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c51d033-7911-4e6c-2ae7-08de88b1cee1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WHe5lu6vThyN7IOYP7702PMbO8vFmlislpVh8Uc/QmzWdsxnpVG0zQYHQKPl7JrexiJpxKNqrgSyH6moANBrpA8K8/nFHOlGQWkai/iZDlXwwAyvxAahhZ4iBGVsCet7CWBpHb+CK71lR2mQ0wpwtikCxDcF/IKClRxJwASdcUCPbQfTbt7gYKHbF2HnICdZIrETTEOv26vDHbUJuT5bLxLA129KERdFYwSqtDS5MSUnd7s1KL/cDh/YQQhbYYcfcAUkuFzHdg1X4+HKEosq3Ws+Ko9KoVK+wVxg+u0Dor8hIVEvVuZLZiYu2aCVpr2zFyDF8xRbY6fqL+Di6r48jtLlhcBMr1P/TJL7Axy8PHqNcGw81TVV0uNNvgIKD4RC85z1sxBCsR+dBqbJViI/t6k/1RUk9mBiPWim1O8Hh7qlyRNJFOtaq0OQIueZ469in6En/l7WCX/moninlIp9hW1qMvx2f2P8qcOHG99rSeGQ1x1k4HmyuH9Dxn9tAY+Iux+st3iK6gVtu28Z9X62C2UhmE662s/592XRZZDZJhi69Ytcs2gw4ATt84H/bfsYfHs8sG3JFhoZpzfADZsMk39+4Vher6OFGsuL7tHBWeRvFggLJ1LvdxBGgboeV29ezewepddFqzYQsFNWdXNmi9awHMBF6JoedSupNLAoqkiGGuf/HK0sWzpyEPeZ6LGRcSKN7y7ZSQR7zVHB0ZCzTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxwbEtwU1RjbHhBMUdveWpvMnJrUmZ0U1NHUkNXbEpCb1JOc3Q2YTFUYkRF?=
 =?utf-8?B?d056WGM1eElGWWY0T1FRT0F2RThlMVFpZWY3RFdvbHRmUVdBb2JGczJySVlj?=
 =?utf-8?B?VHI1TnRuUVlPK1JhS1dEOUx4VnFtV2dOTFAvTENhSU8vZGlQZkRiVDY1RUhF?=
 =?utf-8?B?NHAzZElBbStZbUY5cG5qSFNhbEQza1k5ZFlYQm5ZVjBOZmtIaDI1Y3I1bWZq?=
 =?utf-8?B?T2dwMDVrb0tVK2ZUOC8yQVE4OWtrUUUzU1AySGpXZDZZTCt6R1l1eUdJOWNw?=
 =?utf-8?B?S0pGdzF6NjhqVDVEM29NUDhOL25zaUR6cXp5Z21kZkpRcnBzV0pZOGJkYXVG?=
 =?utf-8?B?OW5NUVdBWlVlbXAwWmJTVG96bWk1dCt2UitQVkJIOUVQQXh4WjBxMVZiS1ZZ?=
 =?utf-8?B?Wm5YRFJHaWR0aENHdTJpYTBDYk4yZWtaQTg3RzBjQXRncDByNVdTM28vVzhj?=
 =?utf-8?B?RlhsVXdWQjJtMGhibW5UeDNoYVl2dGNzZjlZUDFyNlZnYmFuNCtrR0FjbFVY?=
 =?utf-8?B?azE4UzNOMUNBY25QNDJhRlIwMGI2ZXNTek5tZzFkeGgxTkpUSlRCNVBYVkg2?=
 =?utf-8?B?SGNiMGtxcmZ0ZVptbTFSdVhYbitBWnBMbnZ6cTluY1pIenl5VFNRR0p5UHZG?=
 =?utf-8?B?QnJNR3JLdmZpVlJ0OWZPdzY0Um9BNHQ0TlhZaDl3NEk5Snh2T1RzcVl6K3px?=
 =?utf-8?B?UzlVZ0g3SklST0h4dHBkK0lHaFNUTzQxTUtTM01qdUtSTjFhUTB0cVQzNVQr?=
 =?utf-8?B?MTk1Zkg1MkIzMkQ4c1NqQmZWUjBtdHhRdkRIMGdLZUxMeUZvZ1Z2dVoyUFVB?=
 =?utf-8?B?U2lvSzBJQUlXTUhic2hER2dxVmdBVGprblc3amtKeUU3SDJ4SHVhellTTCt5?=
 =?utf-8?B?bTFTUnZVQk5oSlBjWWNjSzdLNytOUENQRjBUUzRqaGcxcjgvakxiZk5sTC9v?=
 =?utf-8?B?NlRzcThQVjNlYUtBVmlnRDdtaldnRGEzdVZCMHNKb3hyd2NIRXRVSHQyczVX?=
 =?utf-8?B?VGlBL1FtSy9UMFo1c2RPdzhINmhja1ZaWkdXajBFSy9QNHZmeDVwRHlpTStv?=
 =?utf-8?B?cmZxQ1M3d1N6bUNBWlJneGR0MmJiMWp6RWdKUGkreFFFbUtBbjNJM2doUStq?=
 =?utf-8?B?OHhHeElORGRsYUwxL1E0czhrN1hSYlJqeEw0ZHlzNVZWb0hBdUcyYUFSbjVV?=
 =?utf-8?B?ZHNMV0FYZmpkaG1md1pKL0JOa1RhK1c5U1hNenk4bDFTdVdKWG1jT1czUndu?=
 =?utf-8?B?cXl3aVBTV2x0WHdQQjcyRzg2RnYyZHpzb2tMYW1PbVlTSlBLbmRBRnlBVWFj?=
 =?utf-8?B?c0xTZ2JSclFDeCs4NU9BKzhxaE9zUHk1Rnp3bm96Wlo0RVFKQ2phdUFlcWlW?=
 =?utf-8?B?djVRa2hSM1c0T0hEeDJXSDFPcys0MzhIU3g2STNxNVFpRFhsTnZnZjdCbjZO?=
 =?utf-8?B?d05DSFYzN01KYWI4L3o4cGNNV2lBclF0cFdzMDIreFBURWpRNWlaWGJUa3JD?=
 =?utf-8?B?dG8xQVQwb1daM1RpRmplc1VnSVcxODRtcUZUN3lNN1d1UG5CVnFEdUdmQ1Vk?=
 =?utf-8?B?a1k0d0psVjRDZ1l4WFViRVNpSFlQUDJ2QVZ3QTFaemloeFBVMVpjTTNRYkd0?=
 =?utf-8?B?MXhkRzNsOVd3eEt6d0xPUTVnQk43bWhZZUx1S25PWTQ0a05MblM1MVBidnZR?=
 =?utf-8?B?ZzdMcjh2YWIxSERJWE1TbVhrYkpDK1pEbnFkK1pFMkNzUTIzM1YxQ3YwUXE2?=
 =?utf-8?B?MVpPTEVIS1drQzJYNTA0QjVYMDh6NUdRY1NLdmRNeDMrMDI5Z08zZEM1bzlh?=
 =?utf-8?B?UC9iTzhrSHBlZ2hyTGxFbzFDRHhiVDVaWC93VWNKaTRDMW8zZjc5U080STR3?=
 =?utf-8?B?WHROMzYzS25ldGpWamlzaG1kL2JWUUF6V3grK2luMDBaQ3JadXQ2YXJXVU9M?=
 =?utf-8?B?Y0RVWHZIT01xb0lzVEd2emVKNVVZbHJuSjR3Nm1EZC9rNi9QYUwzRFY3QjIz?=
 =?utf-8?B?YXhEK1pGZlpjMHl0NHZMbkRBamRaYzJRNnY2NXcxZ1A0TkxUaTR4RUlOZDBX?=
 =?utf-8?B?SEkyU3RURXA3MnlGUGNyZjFoZnJDZXBsTnRDNEJYeHdRR3RnN3pDUlhIUEtG?=
 =?utf-8?B?Z3hoZGNrcW9mcTBDOFZ1NUFyWEh3V2o2SlJzSnpaOFBoSVNPSTFYbXVQemJK?=
 =?utf-8?B?WXpESWJrV2JxY1ZrVkVzZkNWeVpEUEhNRzBYUEYrUDF4dEh0R0xxN3VVR2Vx?=
 =?utf-8?B?MDR5SzRXMWlvbHdJUkRsZlpTYlJsSTROMXJXRCtLSW1mSVlVdlViQVJJTVpQ?=
 =?utf-8?B?dHRBcWZqYWZHdnJHaWhzNHJ5WitNL29neDliOVVJNkpLd0JnbFJ3N1VxSEVj?=
 =?utf-8?Q?yz5D5dFOwZ3kub74IPtEGaUR3IBedbPkt0U0C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c51d033-7911-4e6c-2ae7-08de88b1cee1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:57:19.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BF9CHxTgDwZBry1MKVcdQJZ/BkuSpOHNj5r2FtnhVmhnBi1RWBfrBk5DbQSbvPwOadXJV7i9BQvfZ5r2JEiDDaBwL3VQALb8/KZwxpKTe/Xzx/ictRVGRY1opeqT3B9L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7568
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33992-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CA962EDF40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/2026 9:31 AM, Arnd Bergmann wrote:
> On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
>> On 25/02/2026 10:40, Ghennadi Procopciuc wrote:
>>> On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
>>>>> there are no resources allocated specifically for nodes like
>>>>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>>>>> driver and other drivers that read SoC‑specific information from
>>>>> those shared registers.
>>>>>  
>>>>> My alternative is to keep two separate syscon providers for the
>>>>
>>>> You got review already.
>>>>
>>> I still believe that nvmem is a suitable and accurate mechanism for
>>> describing SoC‑specific identification information, as originally
>>> proposed in [0], assuming the necessary adjustments are made.
>>>
>>> More specifically, instead of modeling software-defined cells, the nvmem
>>> layout would describe the actual hardware registers backing this
>>> information. One advantage of this approach is that consumer nodes (for
>>> example PCIe, Ethernet, or other IPs that need SoC identification data)
>>> can reference these registers using the standard nvmem-cells /
>>> nvmem-cell-names mechanism, without introducing custom, per-subsystem
>>> bindings.
>>
>> nvmem is applicable only if this is NVMEM. Information about the soc is
>> not NVMEM, unless this are blow out fuses / efuse. Does not look like,
>> because SoC information is set probably during design phase, not board
>> assembly.
> 
> Agreed, nvmem clearly makes no sense here, the patch description
> appears to accurately describe the MMIO area as hardware registers
> with a fixed meaning rather than a convention for how the
> memory is being used.
> 
> That said, there is probably room for improvement, since some of
> the register contents are read-only and could just be accessed
> by the boot firmware in order to move the information into more
> regular DT properties instead of defining bindings for drivers
> to access the information in raw form.
> 
>     Arnd

Hi Krzysztof & Arnd,

Assuming we drop the syscon approach entirely, for the SerDes
presence information we could follow Arnd’s suggestion and have
it provided by the boot firmware instead of exposing it through SIUL2.

However, SerDes presence is not the only information involved.
As mentioned in the earlier replies, we also have the PCIe device ID,
which will be needed once PCIe endpoint support is added.

Would it be acceptable to describe this information in DT, as in
other existing approaches [1], [2], [3], by adding a device-id
property to the PCIe node?
 
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml#n130
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a08g045.dtsi#n907
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi#n66

Best regards,
Khristine
 

