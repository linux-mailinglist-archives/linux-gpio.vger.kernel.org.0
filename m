Return-Path: <linux-gpio+bounces-30785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AjFIW9BcGnXXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:01:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E65025C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 04:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EDB0849C62
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364474218B7;
	Tue, 20 Jan 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VhLpbRsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789D426ECD;
	Tue, 20 Jan 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910383; cv=fail; b=L05fK07VJFprpKEoACN115aeDozyKyvwExvYcnH8GNOuXmRxCfr+7Ls6JN6oeCtTzRo9gAL2pGPC5raAL2DxWDP/Z6/UfY4DOxeYP8ED0tZ5kUmEg0IeUeItWEWLRJaPKKM9PbhcAHTUCBmOrGEYZE5ZvM5T+sxQt9aLT1ex/Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910383; c=relaxed/simple;
	bh=Am3z0A5O4QrDjVQE0o9RIdzTOrGfpDs57SdmumP210g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ajcr3e4Cogor8BgXwMIEUzA+zDCaW+m2QX/KiF18PW890bVVL5Td7Fdp+xna5jkDr4tYgR/yKm/OQ9auTgA1hzZhoxo9zmTFAIIwJxkVjj4QCuoQfrAa7160ljJh7XchxCNhGU1wzn7ZMrL25kr4tH7uIFmP69suI5SjipUDEVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VhLpbRsV; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjnUruOSEt6uzy9xt9hSCdTFQVVpWT7nl3sr5hKgRiy0r3KWGuMX5GKs0/TOwVtmYQuVLrhpotLEDYFVr6wHVVLb3tT8JgFJ1MIXY5o8iWpdbkYMPmLw8XWPIuQPqTUrj/2usNGpSiucNu3izF395FV7SK+mL2gj4HeaSOcwgRCnsu5zQipoj3oJ+21jxYdfCwvMz0wPX77ZYUsUrFs4tj2JtLIAUzLejVW5glG36W6yjBRaNAnZlY5Io74h3kfS1/KOI3J59iBYt8rc1lAj9sVfnPlQ2EtKCWcbhIzVx7A9j9iY5B6PK4jr3dD3iF+3zTys0JNQhT6j2VQKhzyEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32JKxnkmu8U3JofM4qDsUtaUOzTUwghL1cNhXDsJAxc=;
 b=UH85/4/lJxwYtpaMZTKaaCQh7x5nrclLJ0udzB5c83HxvfZxVJ22QQSSKNgWNDZMdaMz7Uxm9LxKIwEbuZXbg4twpiQG5lwPwJo++8nP0JGDyUjDoxm5IVLb21beIjqQWbg9xoh7EQyw1vv31xlaLJFkWPLBlYTHVbKpUyhm7INXw+/qV8UWgd15NO60Q9YI/JUew2HuRicNXuW5YjyQJr5PYc/GT67q5/bLqtcR0JDZaldf11MWtZ7+jf5Qrn9K52ZIomLguDz3YDzjyumLaa/lE29wafhD3qxanqgnIEUq8MRfyvYivSMy6mspPxY534lYO9WI6io1PEdJEjCthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32JKxnkmu8U3JofM4qDsUtaUOzTUwghL1cNhXDsJAxc=;
 b=VhLpbRsVU5X5DGOCMPSJN0Ysn5KXwzzr0DdjdwZdXhx3fT9aEZosuZpcvZXCwFjdvcIcTcWE7c3FvyttEPO49xlQmV8CERJb5cnuoZKMOC5kbeUHjpomTplZAxOhW/tAXZyTz+9G6l4e1L8+hNRPeHCtgnC/1E5afbbi6cMjwcgJ1p8vGwWKjRdlSkl1f73WQ5j+j4F+r/EkLNvyBuQ8yzMAvL3HsHABKd2ZwqT3+O3bZtDwTikUlX0JhwGQbDpKlcxTzAtYQGy7ltGKgW1ojRccziEGMj7QsGmvxkbod46WAApwSCyt0a2f2UuAGjZIyiHhg1IjYAPSMTi2FNaAfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PA1PR04MB10769.eurprd04.prod.outlook.com (2603:10a6:102:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:59:36 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::6720:8c00:7732:fc42%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 11:59:35 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Subject: [PATCH v8 04/10] pinctrl: s32cc: use dev_err_probe() and improve error messages
Date: Tue, 20 Jan 2026 13:59:16 +0200
Message-ID: <20260120115923.3463866-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0448.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::15) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PA1PR04MB10769:EE_
X-MS-Office365-Filtering-Correlation-Id: 0514d346-9348-4f6c-06fa-08de581b6157
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XKjWZG3zPTCX01cQe+Zol5egrreG5UX/krg6PL+/Z4Xil1+0RiOZYGsmF3Lg?=
 =?us-ascii?Q?hAPXf3ociiNliP0+L5rcHAdVn8Z49hXIuYvz1LxY0uJSFzuYG5vemgCl82SK?=
 =?us-ascii?Q?sz6WWf4kicoGflq6O0UkekIb/1nMtepB0ss8+KuV+iJgOYiTpUxKk9WsPuXH?=
 =?us-ascii?Q?bgMOlaYtxrMgnqY/OFQmz5HF/45lnV+USbx62679Bpd2uVjkJyd+o26GwFKQ?=
 =?us-ascii?Q?wGvzuN6ScG0TV4z+qfNvTWb8SFHST/j15Tx/0J5TVxM00WaXcw5zyQnrIuSJ?=
 =?us-ascii?Q?crxDUi9ilQgV9hKk7bEN5JJSPWugw1IQxJ9/+pz+l1zeWcDojE3/PgV/OwtN?=
 =?us-ascii?Q?5d0MAse50DF5CGqBhLw3EoMpVt4lERFwKMNqszDwrxvpH1WDBbPrx9Wv348z?=
 =?us-ascii?Q?8b/OGMvYD+wLEhQVzKlWh0eRfd/Q56TIwR0O65lPZJ06xkmrcBrt9BGRZR2p?=
 =?us-ascii?Q?K9ryugp/EZzYadKWQL8DqNWGkY4a45xsJRM87RrnqGpaeqR3fSiSAAOtdHgQ?=
 =?us-ascii?Q?Odlz7rDgW9eHNJ4HPMdd5WKo+poaTaC/6mKWxfC8fpiwNmZkvrB/WazF3veG?=
 =?us-ascii?Q?AFFpTH7QeDoRSdjM8twZjfjbscFRjpNyIE37P21ZA/aouvsJVF8u3EtwdmUJ?=
 =?us-ascii?Q?VcidhsxqHaDr3j2J6giCLvR4y4qUEyaU6ja86/jL6fW+/0OtmQEzd2tuBZT1?=
 =?us-ascii?Q?OWsZefTbDG7AYFmwRciNps3zap1oS6sN1gZ9H5gv8dQk1Uf5OiJYe8+flC6O?=
 =?us-ascii?Q?5v1OTRDM+ltqLDXqg2aDFOJfs7k3N8CFP9/+KTPyxYEn770mEoaNC3fKqd8e?=
 =?us-ascii?Q?/wlLOU2xjBZLxgo9VVcAimrY+8ChIHHrEzHEL2oUe8vx0CdW3QIFUtDEtaQ0?=
 =?us-ascii?Q?WWXETvDgWkfeHmgFmV4YxPzeOOgg/hXFszEDJOkLyLcrNenR/u8YJIoQ1gXl?=
 =?us-ascii?Q?3cI3C+uJKif4MZrlWbqoMoz+4REXuOffTbsDnZFhP9EtPXVtkZ7wsfnPfyQp?=
 =?us-ascii?Q?fZ9KDsjoyyN/zUm0CZj9uf+qL8S3y7RTgqxmMGc0lIw4z1j8KNCjNRCPgZPS?=
 =?us-ascii?Q?2C+BNTXKrEYSN0u5P7qByKKHKrBF+XWNtxou8K5ufuSD3MiETs17mQIGHzXn?=
 =?us-ascii?Q?t7ZnFRcSoK2KxTyevD3/uEiMtadEn8X2wwCPxAYSxM5/soJJQBvACHbrmGTO?=
 =?us-ascii?Q?C/7Fp8qTdz/Gy+ZjdUBng2LO+i62ZR4tC9QFDaxtAkHKej4PRdCUJyf0fCUI?=
 =?us-ascii?Q?VQ8IYl+tKTsvJlhteGnVpP0BgIADTzk3e/SxK0Nh/uH/AgcOkVb6DhbIPwn1?=
 =?us-ascii?Q?hqovfAp/VLe/fpB4rgShQbLS1fN0L3SkVPz5Vnt6xJmzdO2dK4f8BkDpBStU?=
 =?us-ascii?Q?Rl0PrVPSTf4IOPnuCMNT+7t1qRgD7Gouaz3OBCwQ1mTjwmae+SrJFit0gWOy?=
 =?us-ascii?Q?JX9xPfMKxdgywZCPvO+1fbWJUytrqogtYfidcS9SexbYhP1pLdSvIkMuGAf9?=
 =?us-ascii?Q?Z4e+Uq+J5bI0JQFHtQ19TVq1JlruuvXMF29EpxPDFsq0pwLZSefgF8zk/Wu9?=
 =?us-ascii?Q?M+dyJmWE4oRQzc/Muul7GbkaeGHZGuteRZ20bXowyAFoxyS4KRrHAzqNt7SX?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+IuReh+5huRLiSmET8fp2d+NISPlRlHjvc3Q15geqYMK6JvWuEf1NbJUB/m?=
 =?us-ascii?Q?t5tVP+4m7u+PWn6AAd2naDVl2qZFz4Xg22tWg9wZzQAI1CPLoYwOmy5SGX5L?=
 =?us-ascii?Q?ky5iNWF8eUTp4Vo52j2PlsymXBVWHmceDBFQStgvfuWa5XgGSQCwr66Q5nMi?=
 =?us-ascii?Q?T042NR/o5nrv5m/T3yZ5YWvigD1m2Fh2ZBE2XgPwBNxs+PQeD/bpiCFrxKMi?=
 =?us-ascii?Q?E3c0G/ZLTWVJeNjFFDEcg3dJlM8tO4l6TF2WsHi9Th1R2LO4x5UrnQ7klJpU?=
 =?us-ascii?Q?hkT3bh+wQmfGmL9j1QRpj353ecBFE8TSyzM8rwRVrrdetillKwaybEvn2tmH?=
 =?us-ascii?Q?zwIKCgrCcFXDtI12EAMS6AMQ8D3lZ0AYGTiraxvnN+omMr8iz02ZXwQ0+h8y?=
 =?us-ascii?Q?8OjDQc4JY53fkEV4AKwKV0gflgZ4uA42VV7mFo5bc//1c717qz+Z1Jbtsg3x?=
 =?us-ascii?Q?QEKCk8HkoZLBLgCeT/hZr1kxEdE/0l3uodfYXGsR6IOt1wvhhjA6uEZKz9Iz?=
 =?us-ascii?Q?Cu/7979vUvXhXVQan4Eq7Bvy9nKlguwTKiGeCNn2dnivuI5i7EzCwjChFFwN?=
 =?us-ascii?Q?OmHQffyo16ds6q6bTnYw3Ck14N9P9CISNvJ96sbK/PCdIQUWhTXv6PdO2Hl+?=
 =?us-ascii?Q?ucKo1nLgeSJdfmm6lYCf/It0i3uEjCPfofNH03suvUcFOKQXU7sd2LPmPfjC?=
 =?us-ascii?Q?P+QrBsYyhUX5kp20US11+2Pm0/VlRC771gzDeONw/oIxz4a7ehIAIcT+Bvzz?=
 =?us-ascii?Q?4D2dSlAqs6TfMuj7YK/RumM4f15sku2eDqDtDxvHAWkpXc0BYWjEudYBV9go?=
 =?us-ascii?Q?QPEiD7OQeI/8qXqdbBPpbO5mkWWYfPbK6bRQ/s3yRDDwhJoj0LbjPpmdvcA+?=
 =?us-ascii?Q?YTsUNPsrvqOw1QzB1xTnS6nN4b+IfZ51Vo9jhNvSBttTCOfX9ifWFlOX2geJ?=
 =?us-ascii?Q?f8YRY13kHhXjs6Ax5nLDSQLIU/DEBbX8UZqGWGxQEdomrmDmdnphJMj7xhEU?=
 =?us-ascii?Q?trwDzdUYMgG78X8R7M0YbfHzWfLr3G22DMKFF3TUrYggzNlKGsV+tPHUml0U?=
 =?us-ascii?Q?nFbjK2htUobozrXSngw4/0HZLRAH6ENlhEspu0v1Qhpv7UsZRWWaBa7dhsz8?=
 =?us-ascii?Q?voDFCOWfb8eg7O8eOY9KodF0UiT6O9kPuiPtGfYPXo9H/yGHS1sOCqnDXc0W?=
 =?us-ascii?Q?jIuxVRvp6pGvo+F2RIA/QVn7q55O/qfyLHZsG9Pal4+ME5+oNifU9SMKOL6Q?=
 =?us-ascii?Q?UWwNAU7PGBiEJxZgRP/aas0jGNhfFY34tHt4sY7EUXgO8Fe93lLa/b0EjyCS?=
 =?us-ascii?Q?AEo+uFDBMqjGNgaxDBKGPKZs2phEnnHAHevAED4X+Uja4BahV3fWA5bX2+wU?=
 =?us-ascii?Q?tpBTDNBjzh1pG4Sg+3z6EVrLgZjU45Nf4sFw0VezB8bsv3qlTPTDNrAC2dvJ?=
 =?us-ascii?Q?LageQRVt68x3QiJbIPl4KBmZ97X8EoX5wmIsuac2HeCQFMp8bThYKmdGOXSf?=
 =?us-ascii?Q?mjsrdQDWEEpPTlUrnVhcKSwyY+mnvsOcjzwX84Fj+hMQrbbO2FLX5ofGUijx?=
 =?us-ascii?Q?PuHme3iuRSZsS8yIqnpFLBCzRMIJ5WyKitFDZ2MlH66ddK6Zx14T3QYWjBM/?=
 =?us-ascii?Q?95EAYoScBFMRRBra5IW5/xBYHxIPUNKQIaIh/J5MmGOBOE0B9WeX7P7hnI/f?=
 =?us-ascii?Q?Hy0yBW1pxJ44ZpVO43G88hl0cT8CFxpudbHAb1sfDkarXi9IF2lnLl667oer?=
 =?us-ascii?Q?Vmh/XjzPmYFmKg0hvhHnRqED2UwsIqvEzFpFyxyGKuLEEUMIFH3V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0514d346-9348-4f6c-06fa-08de581b6157
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:59:35.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWuQSfTjvLlWwRq/o/RnB/lczAKUJxwIIMhtnXcrliQ98ju3WPdXJemps5RgTk/qAILZ37EnnGA+gW1dClE2mLkOGmvrgQnjCAX5HbUxJQqHYV0ZXlitij78Abtf0siI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10769
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-30785-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A15E65025C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Change dev_err&return statements into dev_err_probe throughout the driver
on the probing path. Moreover, add/fix some comments and print
statements.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 106 +++++++++++++++-------------
 1 file changed, 55 insertions(+), 51 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 35511f83d056..a98f8e7c2768 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -2,7 +2,7 @@
 /*
  * Core driver for the S32 CC (Common Chassis) pin controller
  *
- * Copyright 2017-2022,2024 NXP
+ * Copyright 2017-2022,2024-2025 NXP
  * Copyright (C) 2022 SUSE LLC
  * Copyright 2015-2016 Freescale Semiconductor, Inc.
  */
@@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/**
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
 	char name[8];
 };
 
-/*
- * Holds pin configuration for GPIO's.
+/**
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -78,21 +84,23 @@ struct gpio_pin_config {
 	struct list_head list;
 };
 
-/*
- * Pad config save/restore for power suspend/resume.
+/**
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
-/*
+/**
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -123,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
 	return NULL;
 }
 
-static inline int s32_check_pin(struct pinctrl_dev *pctldev,
-				unsigned int pin)
+static int s32_check_pin(struct pinctrl_dev *pctldev,
+			 unsigned int pin)
 {
 	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
 }
 
-static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
+static int s32_regmap_read(struct pinctrl_dev *pctldev,
 			   unsigned int pin, unsigned int *val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -145,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
 	return regmap_read(region->map, offset, val);
 }
 
-static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
+static int s32_regmap_write(struct pinctrl_dev *pctldev,
 			    unsigned int pin,
 			    unsigned int val)
 {
@@ -163,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
 
 }
 
-static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
+static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
 			     unsigned int mask, unsigned int val)
 {
 	struct s32_pinctrl_mem_region *region;
@@ -236,10 +244,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
-	if (ret) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "%pOF: could not parse node property\n",
+				     np);
 
 	if (n_cfgs)
 		reserve++;
@@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
 	/* Check beforehand so we don't have a partial config. */
 	for (i = 0; i < grp->data.npins; i++) {
 		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
-			dev_err(info->dev, "invalid pin: %u in group: %u\n",
+			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
 				grp->data.pins[i], group);
 			return -EINVAL;
 		}
@@ -476,8 +484,8 @@ static int s32_get_slew_regval(int arg)
 	return -EINVAL;
 }
 
-static inline void s32_pin_set_pull(enum pin_config_param param,
-				   unsigned int *mask, unsigned int *config)
+static void s32_pin_set_pull(enum pin_config_param param,
+			     unsigned int *mask, unsigned int *config)
 {
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -763,15 +771,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
 	grp->data.name = np->name;
 
 	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
-	if (npins < 0) {
-		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
-			grp->data.name);
-		return -EINVAL;
-	}
-	if (!npins) {
-		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
-		return -EINVAL;
-	}
+	if (npins < 0)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to read 'pinmux' in node %s\n",
+				     grp->data.name);
+
+	if (!npins)
+		return dev_err_probe(dev, -EINVAL,
+				     "The group %s has no pins\n",
+				     grp->data.name);
 
 	grp->data.npins = npins;
 
@@ -812,10 +820,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0) {
-		dev_err(info->dev, "no groups defined in %pOF\n", np);
-		return -EINVAL;
-	}
+	if (func->ngroups == 0)
+		return dev_err_probe(info->dev, -EINVAL,
+				     "No groups defined in %pOF\n", np);
 
 	groups = devm_kcalloc(info->dev, func->ngroups,
 				    sizeof(*func->groups), GFP_KERNEL);
@@ -886,10 +893,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 	}
 
 	nfuncs = of_get_child_count(np);
-	if (nfuncs <= 0) {
-		dev_err(&pdev->dev, "no functions defined\n");
-		return -EINVAL;
-	}
+	if (nfuncs <= 0)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "No functions defined\n");
 
 	info->nfunctions = nfuncs;
 	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
@@ -919,18 +925,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
 int s32_pinctrl_probe(struct platform_device *pdev,
 		      const struct s32_pinctrl_soc_data *soc_data)
 {
-	struct s32_pinctrl *ipctl;
-	int ret;
-	struct pinctrl_desc *s32_pinctrl_desc;
-	struct s32_pinctrl_soc_info *info;
 #ifdef CONFIG_PM_SLEEP
 	struct s32_pinctrl_context *saved_context;
 #endif
+	struct pinctrl_desc *s32_pinctrl_desc;
+	struct s32_pinctrl_soc_info *info;
+	struct s32_pinctrl *ipctl;
+	int ret;
 
-	if (!soc_data || !soc_data->pins || !soc_data->npins) {
-		dev_err(&pdev->dev, "wrong pinctrl info\n");
-		return -EINVAL;
-	}
+	if (!soc_data || !soc_data->pins || !soc_data->npins)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Wrong pinctrl info\n");
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -965,16 +970,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 	s32_pinctrl_desc->owner = THIS_MODULE;
 
 	ret = s32_pinctrl_probe_dt(pdev, ipctl);
-	if (ret) {
-		dev_err(&pdev->dev, "fail to probe dt properties\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Fail to probe dt properties\n");
 
 	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.50.1


