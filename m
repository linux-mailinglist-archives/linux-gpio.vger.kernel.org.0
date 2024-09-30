Return-Path: <linux-gpio+bounces-10572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7462098A4CD
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98A1F1C21706
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306FD1922C4;
	Mon, 30 Sep 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qYjnpimo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E071917E3;
	Mon, 30 Sep 2024 13:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702681; cv=fail; b=FZCL0IuOKHS2oFJRw55y12Whg4goeZD52xGLIoo2ezTrfxyGeOrIPmXQsS5V9aMWRpO+azTyb/O8XuUg1sDsjjjBruFl95fcnmMYx0iqosFCUWkAVOSjN18btRyytB60whSTDGdRwij4vMX6o1PmOrgWAVLpODrCSXzTkfnpJmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702681; c=relaxed/simple;
	bh=iibtSYreoq6AlAuWOon6puPad20/ak7tWwC6qEzaVeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l9ryKED7c+54ia9bgmKS1SZoztiXP0n26nwlutBxJo1wWrGoDe3ZpfMqBfDSenSgO3aue6vyotI/3PHdEDEl8ILpyH1FlsqUHSLcyQaF39tRY0tL2ENjq5amPa/fKy+SfxheZ2SWmEDmIFffjgd6fEBKOsqzVaISjw9hZKIPI0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qYjnpimo; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpv85paHHoG648ra0t0MUMlW0Vb4odfsjmZQSzphqNQSQZDazcuNLbG4qdV5ReMcZCpAT50WEH0VyrcZP9yhHzjggYlhm1ByB3LzH/YW58P6rDvg1YfdFG+Ef0SPlW6yuAz60XOb1GGoy7MIMdqz2Yhh45lX7xDhFi+1lNh1HZTln1aKMQxUQLLSeddfbeSkKYfK10euaiWiWo/J4m2GyWYF3zHsboxeZBVEX8h5z2ylFeixn4xpwVYSi9GLhrMdZ5GuUphNXapzDB5dcF/Y0Vw2rg5QXeRnKq0EpcjCFt92q4bh6zeukusxN4GJQpumC2VBjodo/oyKMu2uTYsRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xadV2WbkdAT4FLZnCPnlSYmdLH2PaaNo+3Vlk4h01T4=;
 b=rTz5QDhbVC2ybK9mYqSHq8570iAUOAYzd0YCAzW7j9hziWp9AiBNDmejw0okmiwwlnc+R8KbvsBo9TLNgnm7l6wS3DcpG8WnHvEL0wSA6TZEHOBz9O+88v5ulDiWtdDviVSaY1WcZvs/HXuqxyw9lnKKC7H9YcxyqC9QwGKsbWLLmCwicu7e3B068Y5sqa8aYdk4BZ+zbb4sdzJuDRSrojHSwseg01eEcX2ZJ+/ugfnN945boT6zGLJeH6Az/aIcV4atxeh0H2S/P1XexjtWqKFda2uV7z6DP3JBdLVDKezsb+LwGn8KOoWirXbR4YUhAa3Rg1QGXbM1843N1vAXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xadV2WbkdAT4FLZnCPnlSYmdLH2PaaNo+3Vlk4h01T4=;
 b=qYjnpimoWHQ31PogTdDGE/dyr6Hnu2y6I0/1dkIac14JOWKFNI1eVSVN5GGHvd5xD7CMUcR1LFOz/y2pqoKN2+2qKgO2mMew0W0S1zncyPg/YXXA4ELzVt3gnCYjKuea5sMx3AXG18nHg2Y7LDMOuCkjnMGUkgZpOPCLh7P22yCXuA+CRa9z6Hko6HF/gEjXm2t/1iDOqt1tzqS6azomxBV2XrFDWhOkh3taofu0K3dd+Tt34SEDjnwElxcsDXmX5BE09ZWgpIMuR8GAsI9o2kIsFF0d3He0KVfHz+gDi0OZX5YfZO5UjcCPjBcyyMhS/8enDskKyt7J1JYNFQXZGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by VI0PR04MB10879.eurprd04.prod.outlook.com (2603:10a6:800:25c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 13:24:35 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.022; Mon, 30 Sep 2024
 13:24:35 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH 2/3] dt-bindings: pinctrl: add S32G3 compatible for the SIUL2 driver
Date: Mon, 30 Sep 2024 16:23:43 +0300
Message-ID: <20240930132344.3001876-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
References: <20240930132344.3001876-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0116.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::13) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|VI0PR04MB10879:EE_
X-MS-Office365-Filtering-Correlation-Id: d723d202-2b7a-48a7-f307-08dce1533a28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGhvZVRZUWMxWmtsL2tqVndjODhSVmo1YThIMU1IVmw0aWt4aVA2RzYxckZs?=
 =?utf-8?B?cTVHUzVQc25Xc3hOcFYwcEVaL1Vna01WSzJWWFYwUmdWempXb0wzK1RYQ0I0?=
 =?utf-8?B?RUtqK0ZybWozb0dhV2huY3B2VUNjZk4vcUxyeE5QMjFSOG0zTEJEcitJQ29O?=
 =?utf-8?B?K2JPS0VmN2srQ1dYQzFQM2dlT3dVWGQxYmxuRWVFRXJxeXUybDM5RG1JU3VO?=
 =?utf-8?B?SkwyT3pNYUl3TlVxU2ZKTW05dFBqT2xjdGJ2cnVRTWI1dnc5RFBmeFpsVkRZ?=
 =?utf-8?B?dXpJVzgzYnpqVEtpanF3UkZjeDJLSXN2dEV3K2Q4TlRoM3FCdTRqZ282Z2FV?=
 =?utf-8?B?MFZ2bG9aM0d0cXoycFZrVEU1NzJWSWIxUXcvM0xObDlDRmdJRXRKRFlLMlA4?=
 =?utf-8?B?WitqclV1a0FJeVZFNWpPMEZYREdjellJTUxDSEJjek9sVnhqQUF6anBNeW5x?=
 =?utf-8?B?SzFzZFJ4d05MVXUxL3lUZGU4TTJwODlDVHY3Y0hQMjhRM2NhWldXaHluTXB5?=
 =?utf-8?B?OU9MSDJ6VlkrR2N0c0pWRU8xUWFyVXh0WDFnTGkvZk41ZlozM2RleU04V0I0?=
 =?utf-8?B?SUE0M0NZTmdqbk5GMkQ1NldXeHhSS1BoS251U3E0STFmT2Urc01NMlA0Wk1p?=
 =?utf-8?B?aGtRdWVoK0c2MGxKVDkyT0M1aTMyTnRqeXZOdklMdVNjcEhMNmZId3dGNjdv?=
 =?utf-8?B?K3c1RDFVL2ttYTZISUVBeFMyY0VOWkpYUzk3bGFocGQzSFg5SXNMbk92Mlcy?=
 =?utf-8?B?Y2h4NmpEcDRGL2tTUEMvRHJnMDBKZ3pyQ3c4Vm5lTXJYWjJZNkVXb2hyTUlZ?=
 =?utf-8?B?TlRKc0s5Ly9QOEhVdkpsazBVN0FScGZxZEpIS3VoQWM2YW01YkI1cU9IbUhI?=
 =?utf-8?B?a1FsQ0Z5ajVSUWRxWEgrRXZhT0NhWVczdjV6dW83akxNVk9pQVczaVZhYjhH?=
 =?utf-8?B?NGdvcGVPQkZ2akl4a0ZhTjd5YXFvNkJBSitJUzRFdjdranF3dk43ei9zOWMx?=
 =?utf-8?B?Y29aanZyeXJZQ0ZXZ0x5aUtmVDlZb1FjM0syNXFod0k4WjI3a1M3ZWhTblpo?=
 =?utf-8?B?OTRwdHdCaVUxLzMzdGtFaU9CUkZwRTQ1NDBHYVJ5dE9ndmNHVVZIZVJDOWhH?=
 =?utf-8?B?OEQwRjFocFZyd1Z5cXRNVkJ0aTF0Zkh2M1hDMXBjSFFONmVsWFA1cE5iYW1Q?=
 =?utf-8?B?Uk5NRlJQbEd1OHZHeGdXcU1qYk85YnEvSTQ4T2t2VFRZMExUdEpQenh6b2tQ?=
 =?utf-8?B?Ulh4ZTF3Z28rMkhtNEkrNjZjUGZsK3hhWHZGU1c1dzg2ZnliajQwb05PVmk0?=
 =?utf-8?B?ZzZJY3hBbkZXWkxhRU8vcm1wTGJGamVXbGorSldDQjdYSUduSXB2Q3d5eFNj?=
 =?utf-8?B?QzB1aUkyMHIwMjdrUHdRU3NGRTVKM2pVK0xGZjMzYlkyaDQ4dmJsMWVseEdD?=
 =?utf-8?B?Z1JIOUVPV1JWbVNkeVQ5Zm50NXAxdktxWWZpVGkxMXgzQ0k0WjZIY2JwWnZB?=
 =?utf-8?B?bENCcjdDdGJQdDBraHBEWktOQ1FPYU5ldTdiUHRQaHFlM1ZSTUVVWHc1a0tO?=
 =?utf-8?B?SE1ES1ZRVDgveHhlSm5KWFZRbFFOZExsNk9BdjVYbTZwYkVjUHNkME95eW1h?=
 =?utf-8?B?UHZwTGticEpOeDJLRVUzZDJoSUlveGFzbU5zNVlieHNYYUdxNE5BK0YrUXhJ?=
 =?utf-8?B?TnNtd1B0aCtENDFZazdzNjlpR0NJYmp6TGxQSmIxQmJzZEF1dHRNbFBSdmtl?=
 =?utf-8?B?eGR3NFZIVzVDejdLQTlrK0dxaFNSRzA1WWR1ZVc5SG0xMkI4V3c5UkZIUVZJ?=
 =?utf-8?B?L2VTU2hlYU9pZHd5YjEvM0ovS1ZqM3p6eVpDaE9FajBYYTBnaXZvQTlRdVAv?=
 =?utf-8?B?eDVIcm1LVFJseGNPWEtOYkhuMFpzMkxTeEpRV2FUMTQzQU1HVkxlL1ZCMUlX?=
 =?utf-8?Q?C/aPWUu6iKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZZWFprZmh3N3pNLzR6cGhyY29UR0ZJRVpMVWNuYW5zejR6MzFiL0V3S094?=
 =?utf-8?B?Zkk1TlM5V3BLNUZKa0kyd2xTSHdyM0gwa3NvamNJSjNoVjFKMWJOSzk5czZs?=
 =?utf-8?B?TE1Fb0h3NDNhV2NOT0NRNGY0TFZFV2dXaEs2ZFlkazNpbjBjRVpaZTB3TWFL?=
 =?utf-8?B?b3N4bDVRTUlMbGwvNmluTU9KOS8xTmFmYWpOeFgxRyt1SmNSOUdzeFgyTnhZ?=
 =?utf-8?B?UHliQit2OU9kcDVHcHZmZ1gvbEt4N0lSYmE4SlZ3REt5a3VXZllDbU5JTGhJ?=
 =?utf-8?B?TDdoa1plQUdFaW83aWd4RzRxT0o0UlRNdUhGdDE1N2dYMTNTZUk5RWJmb01I?=
 =?utf-8?B?VWZJMlhhUlRPbjlVelgrdlp0SzBibDZKaytHN3drNXYyWS9RMENuZW54TkZB?=
 =?utf-8?B?ZmN3SVdxcENOa0toZ0lXTHNnK2xoS0VDWnppZ3RDM0p6QVlGbXYvTEhpQ1dq?=
 =?utf-8?B?b0ZCMUFoNXNISkVGaTN4U20vODJSTXA2QzdBZXZ1UEZPVnR2V0pyNU5UdFJs?=
 =?utf-8?B?dHcxa21DVVk3WDVqVmtYQnVacVFtUDIxMjRUTUI4Q3RjVDRMSk5ETklDMTFt?=
 =?utf-8?B?Q3Z4aE8rMGZxTTIrMlJUZGU4b2VmK2hERDF1VjYrdDM4MzdmOEZuQnBIaEIw?=
 =?utf-8?B?RlFLdUVvYzdvNWhYNEllNUN4NVZCM2VtLzNQQWxRaXVyWVpXYWVLei9ucHRo?=
 =?utf-8?B?c21ucGQxYXBaSXlrdmZ2TDA3Kzd0NFJ0ZDlFclllcElaQ0dXTTRNd1B0ZjJ2?=
 =?utf-8?B?dkFQazAxNVB2UUUvdDNXS3BORytKbjFFUjRiam9MbFdZKzhrVVo3cTZMdEFM?=
 =?utf-8?B?enA2Um9kdFp2RWpORThSN1l4TG9oT1RSL1h0bXFUQTJuczBnSC9jc2pzNUJj?=
 =?utf-8?B?enBoL1lqRFZMekhCZWFxbFFxd2ZZSjZTVkk5cVd0ZDR6OGx5Vm5TektNK0l2?=
 =?utf-8?B?aVdRWjRPYm9KYytKeFZtWnZFS1JyQmZDekZ2VGRHYUpZSDliSXNsYTBSMmMz?=
 =?utf-8?B?N2ZQQW9sMkZEQ0RqMkNxMitSSkZycldzVkV4bDA3d1IwaWVYT3RnVCt4Ti91?=
 =?utf-8?B?Q0k1cURtUDQzLzJoazBsWDBBVmVNMDdwcG8xYkVJTkV0VW8yKzZEWXFlaGZI?=
 =?utf-8?B?Mm92T3dVZm4xV2tERWwvWDJXdG1iUmgwbDJxdW1HRGhYWS9EYXJ5Zmc4eFRL?=
 =?utf-8?B?ZWVCMmN2WnBIMDFzNVlENTB0TTdrU2N5QXlCS2JtNURnUkI3c3lBSDBpaTQ3?=
 =?utf-8?B?dzJUZnpONTd1MjY1Q3NTaURvUXJ5WVJ3a2ltb3lUWHcxc0N4c2pyOElKQWFY?=
 =?utf-8?B?UEtkbEwwUHprUFVaWWNRYU9hVGF6MUd1MUI2RlF1RzNjTklGdnJYejlKZ2wx?=
 =?utf-8?B?c1UyeXFDdVhKZS9tUGxvM0lFaGVDRWkvNEpkM05aNXFNRGFjU2JhaDRGR1R6?=
 =?utf-8?B?UVVyL1E2KzVsOVlvcTZmdXZybmN6WE8rc3JETUM2TDZ2Y2cvTTl4YjBwL21t?=
 =?utf-8?B?T0VGNGp4d096a1NCNzR2SmQ3SmxNdy9Gdk5CUDJkank0OW5EeTNmWUhKcUNC?=
 =?utf-8?B?M0lGT3BrZjY3SHptbFdLVnh6WGFQL21GdE91bGM0Ty9wWG0zaUpHZ1BFK1Ru?=
 =?utf-8?B?Z2VNZjhSb0xDdjJHNHhiV0FQLyt0K0J5UG5va29Bc284RzJOR3kzTkhIcWVU?=
 =?utf-8?B?enhiMTIwcEN6NDlHekMwdVhocjk2bTY3TW84blkwQXFwU085dUdrcC9Eb2RV?=
 =?utf-8?B?ZlV1WTk3YXcxM3JQTTNYU0dGVlZOd2J3cmxTeStkeWVnc2JSVVk0S0Fid1Vn?=
 =?utf-8?B?aVFFZ1pVRng5WDRqNDVUNFZBcFFjTTRRSjFJbFBQeTlZWXRxMWtDVDZweDE3?=
 =?utf-8?B?bUJacFBBYzZueHlsa1ZNWHh2Y0VpL0ZXVzJjOVl3dnFkaTBVOW5BQURVQzZR?=
 =?utf-8?B?S0Fab3hVbzFPOTdjbGFOMzFXeEk2aU5WdmFLZlk1K1dGRkkxL0xDVVBoQjhG?=
 =?utf-8?B?cU9GekVGbWIzNEZUcTN6RUd3cUkxRWFwbkVrTFdoOWVxV1VtUTFpVEpESDBm?=
 =?utf-8?B?c3VtZitmYWFLTVJLRmNpb3ZaN3hNTjM0Mlh6SjljL1NIanR6YnZvMVMxbGRZ?=
 =?utf-8?B?UjVIV09kWWUyOXdITFhqQmkwUU8xdXY1bERSaVA5UVdQbCtUU0dXZkw3a0Q4?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d723d202-2b7a-48a7-f307-08dce1533a28
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 13:24:35.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dzt4nJZY0D/0FL/942BrcU7MaHkkWvfIhNS/+/zcq8XT7TCoe3RBxJnXOlN/QWVA/fUZ40mwQGsveMpfJoxhbZ7D6YVKue4PqKnx2gxCWAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10879

The SIUL2 hardware module is also integrated into the S32G3 SoC. Add
another compatible for it.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..454773e7aa07 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -25,8 +25,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - nxp,s32g2-siul2-pinctrl
+    oneOf:
+      - description: for S32G2 SoCs
+        items:
+          - const: nxp,s32g2-siul2-pinctrl
+      - description: for S32G3 SoCs
+        items:
+          - const: nxp,s32g3-siul2-pinctrl
+          - const: nxp,s32g2-siul2-pinctrl
 
   reg:
     description: |
-- 
2.45.2


