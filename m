Return-Path: <linux-gpio+bounces-34485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ExTG93Py2mILwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:45:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7136A718
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5F61303FF37
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630323E8C5A;
	Tue, 31 Mar 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HpCKXy9G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A233E6DCF;
	Tue, 31 Mar 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964613; cv=fail; b=SuHC9k2fDMLV1cDRFXt+kOfxchoMBmnWMB1qfUBRPFEiEx1YwhrRCbDn4Utu6JvcHbYdNUedfvkuY1OQm5bz0tJQGEjtxc43elAdVVa+rcDHnS0kRxK4VCEzVetvGXRnV12FRWZLjoeoT1h4CJcnQPM39lZt+nzUCjay4I7nXMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964613; c=relaxed/simple;
	bh=rAbpWfUgiGr+rcdTL2BGFD/5aFcdJ2OwjG5AFuyT73Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gb0F6rVe4uUs0E+tz+B4zrRvCCe51oyi71EO3st+Xm3Qa3LAqWeFYkKdDRCOVMJRG58VtEKE0rAQ/T1+dVIPgkbrAcjAeJ/QJegACiBObqrqr41XfMauanuLxJyklLQe+I+/rDKNnx05Ub+YyE4qe1mF42YS1QlEC1ypPKAEMkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HpCKXy9G; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLpK0zdnM7ozymWABAj5GvDs0+hbU7v0RazrHkSYz/eLFfyREO14Zdyo4qoTwnLQtTxOiWD/oy+equOpo1x9ET3SpoDtnRnJ8hIE+VgC8ARUpOigzYVu0ctWjvEDwolbIIKw3XHv4Js0xtVx1IxzoJDk9hMXVQQCZ3RePITuF46Ch5TTxHeUaGMVNP3wwBEEhgXDV+pGkN7GUqBNtfebO7nqTtJQywP3jYTWuFNlmol+WfsysVjyGvlSWK9lEHFGQfVT9teMrv1sWsAyI+yJSaoDjuMbyJdMdxMFKlZog9fUF8MW7EEyhf1Yp8KD27Xe7XCo7LBgefMT+RuOBiNTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIeCjgcoxzvgwKq13OIJQCoW/Qy2uQ6qa9GKE3BMxxQ=;
 b=p6iZySfPxKfvnuc0i1LBkjqIlfatbGySJTicbxWpK2MYa364AYlf4h+aLt8srCDowosswetUvKUlSsfSylMNAmftggYJH7UqLq0t+E5SEvLQL+yOlZxfcxEsSC0LpZ9gNbksprc0olWAymO3+Hmmh49D23fcYS7lpl7iHdR6oUWzigQzO05bFpHSvUxok7hpuEJlRg12tMRK0Pu4cYAnTBr8a1R8QJzvzpSkv25bTEu9x2O+EUoOZaVztR8ul+6hNL6fLFpbPWgufgxI27PD18gl0H++JeJv43v300nLldr+abGWBFnNXek1iC9idGdyjbSwwIrAGpfy8C104kFIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIeCjgcoxzvgwKq13OIJQCoW/Qy2uQ6qa9GKE3BMxxQ=;
 b=HpCKXy9G34Oj6IJCHATD38FzHA67UCbJwFFu8156HZGNfdaVeRigA/bCGSSRwRvJz7e6SZ1r88ntWSXfzNg11Uz5g9nh8FIiiiKCzmicmk2EGgduSfTNbo8x/UMI+1fbTm9ERgh/WMOAAcu30jK0Rqu+lCZOLl0YAaRNNi7zbdyAimGznoNbqzHilufQiKtj/T1o+Ci8sSrJc7SEq8QUaJMzQzOBqY0BmspIRE5CYYyrWvl7gYFNlImSEIMKYSkQAqzJFjpDsN5Kv03vV54CzvGXqWscghP56M9S6r0PQHSf+vNN9hyug5WmlZbzY8vSFhMUMBvG/zf7vxstz3Oedg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PR3PR04MB7276.eurprd04.prod.outlook.com (2603:10a6:102:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 13:43:25 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 13:43:25 +0000
Message-ID: <fd8c90ec-927e-4395-85ba-9e45c23fd799@oss.nxp.com>
Date: Tue, 31 Mar 2026 16:43:19 +0300
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
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
 <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
 <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
 <e1c341d6-e60d-4200-a094-48667e8ccd5c@app.fastmail.com>
Content-Language: en-US
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <e1c341d6-e60d-4200-a094-48667e8ccd5c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PR3PR04MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c9fa1c-aa5f-49f8-eb3d-08de8f2b7b15
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fvZoQnCpk9obq9AvDeLkVSe77jO+y/AG/7/odt8UWM7zfPwdowCj2AXY2LuZ9994RDx42qN3VtRaDetyFpdJAPdJQFjeK6//fNLCsQP7FUikBAVBByUHMHRqPkyNhCu3fquRC44sdtguP6auD7B9lo9n40Gy2wW1ANiwiygb9zS3o5MnEiVWweWc9nRV1yBjLAGKxUywjqJ//2dbFC4DKuE15bMe/Ij8NXWC9llWyHcdD/MLzgS2nd3Mr1RYHouae2t9Wx6JhN6TeTijOYUcSSPzzanjUr70FYHtB8+ma+sehmzdTpiPxpEVaWK/PM1I1Wm8gXNS3MXI/HPM6TX69D0tSliXjVV/Owkb5B3NzwtS5jSP16NtaD+N5F3E2IWofcRdTMSkojGmN09jS6dAWYohrqgpf+Zt1JMkCgTDvtkw8INYEVCl4GCnvUlfHOAz4obx4xwTmuf4Ax3PbiKFWtaXicJpd5lvu19X/kqETmhMC6nohTM2C5wB7Y+AE5jzJ44YRFLYcRjyx0jcLysWrsibbc/1NZ3qPjW6wRlWmO5wAZmfYRN1kufe9YShPilV08FCKJYFpUxd4cBRTGNciVaUE3iQfBZ42FiNpsV/ahBLsrjZstaSNxJCkmaAXPi/3lBSskyUWkrpTw+P/nYnCSO4UgD5AYa/yf2dn2XlHRiCrfwwCznbYItw0irvcnNYsu8unxVNTF1iisGjigjxPnqcJQJsDi66hudVo3Q0MtvnQV/pYAq+vxyZ8IPvTunf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K21DS1U5TTNTaEZrOVBqTEw0ZGNSclJDcVBzeXpCL0VNWW0zUHNhQXBMTlE5?=
 =?utf-8?B?SEZ0cHNyVlQxem1LeTgxRDlYcjg0c2RWRnE2eUpmc0I4bENyYVdVa2h3N3py?=
 =?utf-8?B?WS80MjZKQmRoZ3RzS2tOcUJ6Qlh4Um0yZWtKQ0c3d3YyUG54TllOeU5EbFFS?=
 =?utf-8?B?QkJUOStPaDQwOHhyOUxkS2MyR1puaUhxUGhyTFNWZmx6dHNFbW1CdXoxWmlW?=
 =?utf-8?B?T1B5a3pxMkt6L1JlcExEeHNKS0RMWGZZM05CdXQxL0RRZExzZU8wYXA1ekgw?=
 =?utf-8?B?Z2lsNzVheWgvVlpZWWlTNTRzSDVQM1ZCWUxJTEV1bUJMYkFsWTlQdjlkS2hZ?=
 =?utf-8?B?Tmt2NURpdGRXOHViVmJoSEZuOVJPVFdjZjRXRTdDdWo3Y1hxZ0dsOFJqcWNL?=
 =?utf-8?B?MEtnN0lldU42OUU5Zm9mNWlrS2pIUkE1WlNHeFhUUGUxV25PVHA4bFZYWDFE?=
 =?utf-8?B?ektxU0NRRUdhVjA2UldwQWlUTnhIMmVER0pBYkdDN2FnTGZDbnJNZk1Wb2pT?=
 =?utf-8?B?cDAvWmFZaW1nVW9IS3ZQMzJ2WnI1cWNLRlJNLzNmT2R2SmFEV1JtZzdqTDlR?=
 =?utf-8?B?VjdEVnFkRnVod1dRZ0FMYllGMkY2WllSOFpGdGdHSHRwMVZnV29SUzhSRzJQ?=
 =?utf-8?B?cm9ENytwQTk3dGpIUWhRajQ3VStKWHZzd0hHakU5R1pMUVNlcW9DUlh4dWs3?=
 =?utf-8?B?RnFWS2Q5c1UzcUo4dkZtdUJsdzlEc1pXY2t2VkZqdG1wdUNNaTlQUkIxQVlk?=
 =?utf-8?B?c1hSemdtRXF2WDl0OTFiVXkyQlFrU0J4Zk5vODFKZlMzL0srRmRLRTAvWnR5?=
 =?utf-8?B?eG9hdXdwRE1FS2NkSHZUUkpnTmx6UDNqaEhiNEp6T1czd1p2MlZqQU5qYjYr?=
 =?utf-8?B?d1hNYUFUVm9JMExvcUlHZkhGbHRKSVhYYURPV3dKWmdXN0NpcGh1cTVEaysx?=
 =?utf-8?B?OWxDNHVJZkVYSGc3MU5BOWduR3VzSi94TUFNV1lSQXRkZFlVcGRWSDJrZDRU?=
 =?utf-8?B?WkxJOVZyUHZsbW1zKzhFNDRzRlpxbE5hRk80VWQ0QWExNCtEN2g3YVRGcHdk?=
 =?utf-8?B?ZUZrQTlUZmZDcFo3K1VtVmo1cmcxUUFJTENVV1dWSlQwbktnOUc5bDVFdm1p?=
 =?utf-8?B?VTNyM1ZIc0pidmZDSk9BbTNvNmFBR3Y2R055R2hOZXdJTVc2MGdyTXF0dWtZ?=
 =?utf-8?B?UmQ0a05SMVUyaXdTaEVEaW95R1haclBwWTIxeE9ITmJpR0ZQZDRXcUFvakk5?=
 =?utf-8?B?TUt6ejBwQ2JXbzlLWHhVUDV4TzRPa0U2RVI5cDFtV20rSWRHZE9tWDMzbTRa?=
 =?utf-8?B?OVlRMHZ6dlhrelVzUFlzSXZTQkRpTDVsUGZheERvMTZBS1I5SjIxNmJRWFZM?=
 =?utf-8?B?YzVCNERlaGsrWmo1SnkzYVYreUJNamdvOTZCNUgzYkExWWVETnFGOFNBRlVq?=
 =?utf-8?B?d3lpSC9kYkI3c05UVjdRMXpUS1NkZGRVdkFjL2lGcFNoL0FCUGYyTUVwZGtu?=
 =?utf-8?B?cytaeGhqQVRmNCs1dzd1YkxFMU9xRFdtNHdxYi9Vb1I4Y2dVT253ek9aclNQ?=
 =?utf-8?B?eklIdEE1Y1FNOTFlZHVTL2xDRTI2RWRSdWgwY2xyQkYvczluZ1V2a3lPZFkx?=
 =?utf-8?B?bHpidlVkNVVWNGhJeHdTQ1plZXZSV3ZPTkZLU2hRb1RBK2N2Vm9pWGl0alpi?=
 =?utf-8?B?bkcra1NqTHpwK1BSaDRNcmIyVWpidVhuem0vdFN5MHBoUldPc2FEa3NBekgv?=
 =?utf-8?B?djQ1RWgxcXhtcTNXYjFKNzJETmZLRHVoR2NHbTV5WkpYM2pZTFNsZ0V6OTNH?=
 =?utf-8?B?R25KUHJQTVk2eEUxbE9tMlg0TjFiWGVRTHpheHBsUTJIcC9YUHRBZHl4aUoy?=
 =?utf-8?B?RFk4d2F5dHd5N2RndHNDQ05BZEI5elc5WkJ0QWMwa3JkOWNqN21LUzEzaFZP?=
 =?utf-8?B?QkRVd0R3cyt2V3dTaWdPeTFvMVdkUVNwcWxJSU5vdWRBYlZqRXd2Kzhua1lG?=
 =?utf-8?B?SzY3RXdjZ2YwWGlNSUI3MTNhVGpWQVRBemhnSnhjRis1M2U1RDlWZE51bWlw?=
 =?utf-8?B?QmdWRTZXaXNQMnhsRExGOUlBcUl5Lys0eStLdFMzUmwxbVdqWFF3R0FkajR6?=
 =?utf-8?B?VXM3Zjg3Sm1JQWUzQ1owMEJhYUwyamwzcFVwdC9JaWkweVl0WjhpMlRsR25a?=
 =?utf-8?B?c0Q4c3VBYTgveWpHU0haQjhSUDRKdVJObHVOTjluTUIwakpTNGdweElyMGxi?=
 =?utf-8?B?cVZQc1l4L0RzcVhORTNKbXdUUWRheDBiMFdhaXpHTFhFTTV6UXRtVVJqdjN2?=
 =?utf-8?B?LytaalJLUlpDaE9tYlN2bncvUHZteVY2V3NleDBkckRvUUc4Y3ppWFlpZGFq?=
 =?utf-8?Q?D7VDyLku2Y4AV0RiwmohNRX9JV/lvvVaes8wa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c9fa1c-aa5f-49f8-eb3d-08de8f2b7b15
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 13:43:24.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmKJyK4ww1nQI5syrkVYtF+f/OMG+I32sSRnK5ASji/g6C0ZhnEgAFpHoKmZAJKTo9w5S8NPPVLpVf5X4mZbQGN7ks/JAqwBPh8DKkqhjtXpn8MFUFA0YVoRQ5bTaHbi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7276
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34485-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16E7136A718
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/2026 1:11 PM, Arnd Bergmann wrote:
> On Tue, Mar 31, 2026, at 09:48, Khristine Andreea Barbulescu wrote:
>>
>> With the current layout, the SIUL2 node itself now contains the two
>> MMIO ranges directly, while the remaining child node is only the
>> pinctrl/GPIO function.
> 
> The thread started by saying this is an MFD "It can export information
> about the SoC, configure the pinmux&pinconf for pins and it is also
> a GPIO controller with interrupt capability." Having a combined
> pinctrl/gpio/irqchip driver is normal, but can you clarify what
> you plan to do with the "information about the SoC" part?
> 
> Was this a "soc_device" driver, or something else? Have you
> concluded now that this is not going to be needed at all?
> In that case, I guess having a monolithic driver is
> indeed simpler than an MFD.
> 

Hi Arnd,

Our initial intention had been to expose that SoC-information as
discussed in the earlier revisions of this series. However,
taking the review feedback into account, the current direction is
to stop handling those SoC information registers in the Linux driver
altogether and instead rely on a boot firmware to pass that
information forward, as you suggested.
 
With this approach, the SIUL2 driver would no longer be responsible
for any separate SoC-information functionality. In that case,
I understand your point that a monolithic pinctrl/GPIO/irqchip
driver is a better fit than keeping the MFD structure.

> What I wonder about then is whether the binding needs to be changed
> at all. With the current nxp,s32g2-siul2-pinctrl.yaml binding
> and pinctrl-s32g2.c implementation, you seem to have a monolithic
> device already, though missing the gpio functionality. Rather
> than completely replacing this, I assume the easiest way then
> would be to add the PGPD registers into this device node, right?
>

There is indeed the option of extending the current
nxp,s32g2-siul2-pinctrl.yaml binding and adding the GPIO related
register areas to that existing device node.

> It is still a bit weird to list the individual register areas
> inside of the larger device here, but that still seems better
> than an incompatible binding change.
> 
>     Arnd

However, as you mentioned, this is still weird because it means
listing individual register areas of the larger device inside.

For this reason, I was wondering whether it would still be
acceptable to move forward with the new binding introduced
in this series, but simplify it so that it describes a single
monolithic SIUL2 pinctrl/GPIO device instead of an MFD, 
following the example node I included in my previous reply [1].

[1] https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m778088251774a15bde7463350d6e75d5e9b9b57d

Best regards,
Khristine




