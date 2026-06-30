Return-Path: <linux-gpio+bounces-39212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4aAGBsO9Q2r3gAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B513C6E48A8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:59:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Bz7Anphz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39212-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39212-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA9F4303CC4F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4950413D82;
	Tue, 30 Jun 2026 12:54:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41423F23D9;
	Tue, 30 Jun 2026 12:54:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824060; cv=fail; b=TeeRGN794tQ7zqIyuDIsKjm53jgHCF8kRmZouieetzGRk7o4mqnqn39rv3N/6Z3c/2MP4AdNAiHrNWile4/954HFzz7XW9ODjHJaiLbkCwZO1XushutnvT95u+pY1EKc9ir25gE/ElANKCadstJhIXdeGPAcT0710I6zW2YRwo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824060; c=relaxed/simple;
	bh=9Ueu8AYmTQHDvHsBmoghARh2Mk2fQgqz5ZmwNGpD6Es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cx/6L/HHNAmOUxEdvBK8QiAhWfgBfR9LEX0z/7/IY4M5t5yx2macpbeTMd21cy2a9miGivcxsmf16GEIwjhoh+YcGwwZsw6K7D2uIt8y1XkPAee5FbyBuBMiAI3e0CLS31eYcwMINHovZWEHimkfwUP6t41aEv65+lekqPFjSH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bz7Anphz; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSeAmj+Lq6m2YNBQ02vwmiuQGJ62Cxx/+FQBc4bpTkHv+U/FcUkoFHsTAR4lKP9nkcNNu8h6dCUnn28u1ucldh0osvF4L4Oea8HDPP9NQ+u+imRea8I8LBHf52qCCngcjQxSGuPinecaEvquk/4HH6aPAxPcTWQZGr8r7/Xi0O9GMY53kH1U3ix6UqM3j7TYm82SRnNSMP10HlazCsuTnx/JnFmRO8Zdq+1Ox1fkYIvJtA551O5FzQUN+vP/crnU0XYxdmQvvtdHLTImx0qumDuGuQZixL9zbV5qXefY0f12gRo6xCuVprfGYEffL+WPxEtQUKspqobzY3Eatqh85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cM9C4YQz45uTQZdl0F51LKzZ7pAcmdKTKQ6JY0bs+50=;
 b=QN48LCbe5v+xRJoMCXE1D7ad87ePxEIqCrKkRXfzspXHVwWlBlvDXz4yMdYmRkZnXNQCMOSrXfVrKRUQOM7ZoDskQUS0k9XLJoEvzwcwxpxQHURAr5hlj+2zvO5mu67Pt4kRHgfoEPAOszxDGWbis4thRQ4f6s3KVNV83TLt21EW3FvC+Vr2Jv8qCJ3gY3JyTqd6n9xezysXDYBP2URx+yJCyLfRp5d6M5JYCUh6b+cKGBT2mdaYYSJHKsxFk75EaCnP1GDwPoMMJ8eNp9VmHcsciMuGDfACQFMhm9/TFrlA2+gj0Z/ntNPpkFvcye8MoEOB2IlGevAc1EIiaArzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cM9C4YQz45uTQZdl0F51LKzZ7pAcmdKTKQ6JY0bs+50=;
 b=Bz7AnphzINxt2+8AO/RZUZsUXduzgclggzcXjgT8Q7PTGj8m+QMbX+77Pf1XBrxpZytMmGRK88HlTEFKexdLZdhsnJw9QZMlXhfJRXB4AYqG1JQC8atKDcEECBpor8xHcb4Sq4P7lPCLqK0g6frIY+npHciZfInJxwALoxSc5NUTFXbWXz/vNmUvnjsPLsuQKW38qFXpXVj5fe6pkJzZmalw/XmSFf0SOBwznwN+73xNGfEz+vWXCt/Mz62o6Z+YdCXiI13jZQir2vVTWDFRfk9JYJrrSNfCDCiyw+t+Fli/+8kT+JKD3+dMzkhml26Q/kMSpJzo4PqMWe+noRwB1g==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI2PR04MB10883.eurprd04.prod.outlook.com (2603:10a6:800:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 12:54:10 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 12:54:09 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
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
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 3/6] pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
Date: Tue, 30 Jun 2026 14:54:00 +0200
Message-Id: <20260630125403.546375-4-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI2PR04MB10883:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c265102-b997-4bd5-1af7-08ded6a6ad8c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 Zy3QbQiX6vdzOF/ctPgY4qs9v7AdtUXpVl3s8cKedprWOmn5YmUvS+96/wB2gRAE+VihdZzNYaHA89yvP1uGnbCEGZodr+vNafUK6FpO32xDfGT6w+iMejttCh7rOtVdWLCfjw+g4sguGbCfiwdyBx/2Zg01Z3bHW/ifHQGFrE3TSx0gnbFrMay8pwOdw0nO1LTlASaHatGYthPyXGu6BBdum6TAr3Gs2KP4RpQ7Ce6X0Lg7iJvl2NlBkI+Jbyf6sXcddITvAaP3FkgilA1Nbp5Ssy8eajLg/lrog1OMdBDSVSq1pjN6Bj8Dq9TI2TPppJPzquWqntoA5tQuvhMr5eU08oWtqo0qfwLgziLGaIFa1JFhhZVGaoymC67ry0uj8fNYXoUUMNB4J7cC2mPVb0b54YXGFyeMdwanJWrEp9SYdYa18o1LyHly6uSnZCCEml2uS2H0Y+kLg+YUzAtZ1D8l0CYiWn0DV8vrMu3RyAcCxiTSWTsIJnh73y89iCKivd3dRtErT+FVI6m87ZkeSE5RpYZ4WJuSO9xgpDIhFAALTHniemvJT3/teTkk8WZurumXAIA7hOFDDTM+c8R1zkB9tRB1dmJWKj00GbfqUMi0i5gG3XHnSiVH0qF4TFjDzvhOa/2OqXI2zrb0VOyU5O3BjvjwTujDl4JVe8Tkjrk8n6SrauoANs4kbjyEcrxyNof93BKwZE+b98M9ZUZnVA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Sk9Dc0hFT0E3WHBEVVVzWi82TEY2amNXVkljWTVoOWNvRXM4RUNXejFJTjFt?=
 =?utf-8?B?S1pwOWZxN0ZZSVU0SktCZjV4RzcwMkJEK0FIcUtweVBMSzFFdDNnU3ZjeVhK?=
 =?utf-8?B?dytZQ1FIOGRYcWx4Skw4Rnh0dHBLbzhhbGZLNVRuRDg0dlZQcjBqK24va093?=
 =?utf-8?B?YkJSNEhmTnd1Qzc0Tk5KVjdxT2VyL1lHSjNWdGxNTlY5bUNBSDlNTUJ0aTNo?=
 =?utf-8?B?WmxiMVBGVUhFNlVjQXJSaVRHMU43YytDMzFpcDVtcUd3VUZsd3hYdGFXeUVB?=
 =?utf-8?B?ZU9Fa3doUHNrRHY2SzM4dHNFUjFlWXIranB1SCtNQWpHZGRYb3lsWllEQ1pQ?=
 =?utf-8?B?QTFIRkpHYksxcDVSMVl0aXpsOW1vdTcxeXFnRUoyK3BMNzlHeDdoZzlLdzVj?=
 =?utf-8?B?cVdkOGNGR0VCcnNYMmVXYjAvUlAvVVZOT1pyWmV3V1FvZ2pFY0lRakdYOGxM?=
 =?utf-8?B?a1pSR3R2bmc5OUtNNlNad2E4MTRoT3l1MXFVQlloOUE3OSs5aVJUcUNDSzdi?=
 =?utf-8?B?SEJhaDFnWm5qcFluM1k4WlozN1NlZklubTBOdWRUSHVTTWhxNVFKcDRXaUt4?=
 =?utf-8?B?a3BrUnZOM2VEVEJKQmw1eFZLY1RSQlBOWmpKa3ZJQlc4emhucFd3M2FJRWcw?=
 =?utf-8?B?OFZRQTk0RlFBb1U2NGk0QXpkMTVtejArbmFiZXQ3Q25hOXB1NTZxeGlJZXNG?=
 =?utf-8?B?V05qY1p2NVEvTDNQaWhDUmtUdnRJWWFCK3NxazlDZmFQNW9RRE5XeG1BSkg4?=
 =?utf-8?B?aXZ5OElyQlJSUzN4bmNWZktldVlBaWhiRTlFaDhMMngwVTV2Q29RcUl6cmxm?=
 =?utf-8?B?NXBNcVNhdE9mNUpDdktHUUZRRkJXWjRVVEdjM0JwaTMwVEd1YVVvOExMelIv?=
 =?utf-8?B?S3Q0c1lxQXdmalJhZExXQ1pNeGJXU0NUQTBPMEl5b1VVVVJiWFNYZEpzWWxB?=
 =?utf-8?B?NldGV3JWY2lVNGVNVU95SWcxbUtmVnYyd3Rka09BSFNtRVV2cGhYaER4Yzlu?=
 =?utf-8?B?UldQa05TaDZSMHlaQ2UxSldYcG5pbWxIZVJpeU80WWI1cGRxcUMrNDBRVzJv?=
 =?utf-8?B?aTA3YUlSL3J6VnpHRXcwZG1YOHZCVXJpRlovR1B3OHdhVXJBR3NHaGZOaTZ4?=
 =?utf-8?B?My9iWW5KSVhkMkFvdmFDZFB1cm5keUVjZnN0NEdJYzU2emdPbm9OcnBpaUdH?=
 =?utf-8?B?bXlXWnoyN2VWLzdxR3FCeS9uMWFUWGRFbkFlS1dNZ01rMXNvOTQwc0Q0T0di?=
 =?utf-8?B?ZDE3amhrTVByN3BHL0k0dnNBa2FrUmdZVC9FQjNMMC8vODByeDZXb05tRW5a?=
 =?utf-8?B?eGdia3FqbXB4eDlNN0F6dUZBQlUwZnJmNUZwZG1Gdk42T3JsR0E5MGJERGhC?=
 =?utf-8?B?NmVqd3dLRG1YNmt0bVV1S2h1NTIwQkdiOEJ5WFFOekpSRndrS09EWnBTTlBl?=
 =?utf-8?B?VERHWG9PajkzRVRwRkl0Rklidk12UGh6M0J0bFUwMXowTUJlVVlkSWVQZ3dK?=
 =?utf-8?B?NStFRGJhcnZ5VjNPSURtUnR2U0RHN1hCMUJMK1hYcFpzZUMrNFllbWxrTjVy?=
 =?utf-8?B?dVZIVHMzWG8vZzIvZmU0dVl5WUEvbjFuTTN1M2xYRVlsTXRoWDFDb2tCbmxK?=
 =?utf-8?B?Z2h5NlZmQ0tObEpMUDZKYU1VdG1BWFRHdlFRTU50TVJ5Umd0VnpHaTUwMzdu?=
 =?utf-8?B?VTI4WEcxYlpkWVdpUCttZ2VFQkNCTE1pbkNIdndtVlNJUGZsQ3ExaTkwMW9I?=
 =?utf-8?B?VkVWY3BsTW1lbTM1T1J2UVVTbm5GUTQ2UnBhemNWa1d6andFSVdIdW9aUjZM?=
 =?utf-8?B?Mk5Nczg1SkxUSzRyRTZxT2NneTlLODdScFVYOE4vTlNFS3h2ZDBvaDFncTV3?=
 =?utf-8?B?Qi94UXJJaFEra05WWXNXUyszVWtNckczd3h0bDM1d3NXa0x5Mk5ZRzVsQklM?=
 =?utf-8?B?WVhJZDlhN2VkQ3FySlk1LzcyeUREdDBoM293YjFVQVp4M0RhbXdoWVJtbi82?=
 =?utf-8?B?elUrRjJzNVVZelZNblhMc2RxU21OMmNKZGNkcXg0aHpUV2JkK3U0bURZdE9L?=
 =?utf-8?B?SHNKSTFTek5Ja0NGeGJXT29FUGlyOS9wbjFUWUpPZk0yaE4wU1VjUHJjMnN1?=
 =?utf-8?B?QVJmQUFCRUdNdjk2MW43cFNGeEY0SDQ4YjlzT0lFMUppZzdrTC9QMHVKZ2ll?=
 =?utf-8?B?dU5PSVJoYWhIemZWVlBGcUo1aUJXc3lPSXlEcXoxMDBkbll5NkNzZTBmazJj?=
 =?utf-8?B?WDRGR25wS21FVktGMlUvU1d6dzNCelF0Z2VweWk0cDgyMFZoQWtqK1FSV1pP?=
 =?utf-8?B?a3pmbTNnZUZQT3FEbW9BWjZzdnZRekpxMEdHQUlTVEtXVmkxSkFWUXhleFNC?=
 =?utf-8?Q?WnmNrl4ZW8piIsQByrWCvjG5EG+r2Z22KoCkr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c265102-b997-4bd5-1af7-08ded6a6ad8c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 12:54:09.8984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaNToh4e6wEtQoaqIXyFyg3Wcz4EY0NU70IC+5ExNE4LKPypyZGQNLh+kxNoe6JMLYHhBkVr9Is54g4vADbg5g41U1h4TN7R+zsoQpQO7+S3804vdBc6sARBUaF3wuHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10883
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39212-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,qualcomm.com:email,oss.nxp.com:mid,oss.nxp.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B513C6E48A8

From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
and "pinctrl_enable" since this is the recommended way.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 8c5ec6a76a1f..b9b757e28bff 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -974,10 +974,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, ret,
 				     "Fail to probe dt properties\n");
 
-	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
-					    ipctl);
-	if (IS_ERR(ipctl->pctl))
-		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
+	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
+					     ipctl, &ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
 				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
@@ -990,7 +990,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 #endif
 
-	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
+	ret = pinctrl_enable(ipctl->pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to enable pinctrl\n");
+
+	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
 
 	return 0;
 }
-- 
2.34.1


