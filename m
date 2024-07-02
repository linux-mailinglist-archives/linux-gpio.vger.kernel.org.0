Return-Path: <linux-gpio+bounces-7866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CEB91EF59
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 08:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25ED1F23487
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 06:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEE384DE9;
	Tue,  2 Jul 2024 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="FQA8/oxA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64AC5C5F3
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jul 2024 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902930; cv=fail; b=Jub3cF+zMzWX9IyF5zl7fmoPM7AYoh1l9y04jAPC7MZ3xWkRB//s31WN0R6R5nvxXTONS+VNn23SZjlMqUw3j3j0wxDrpJvfRI7tQdx30UJYI8KXBx5WnnQ963fuOELmqSegrvX1mvXD5uVmUeuok6yR9v56V8ggR0SWj+svetg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902930; c=relaxed/simple;
	bh=QOML3JQd+EgDL1Ioaep3VzNiqJ1KFwUN/MLCXi3UeCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=siXEqzG2XZuq5qkWwxkkACUvvbXABQdgHkl8UMBc7/xIrEQNgrhxbQyHNV/DKo3o88FR+e1VdsUCbAAjmmLDPX9MuODf5vjTio1PZ7pTOsZXbHmhHjNXZi2b/ab7JmZy2L45FS7W8CGGgLjxl4OX88U1PVZOYOIq4WNR+pT4QBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=FQA8/oxA; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La+a3wIq2X2CJ2yvwDVArVflzNwCMHnh0QxP352aqIOpIuwqPv6S7+k25HRP5mxcrHusI932nnDD1E+DILZHFEvVn7HhvDl0uf8VlITiHbw8inmKtCfJwyoI+1i//FVsrRCivI90xdou1pCv/kdVq7H6fQTATQDuAg3p96l+s3dU8R9sYOX3doKai2HeXsliaX9EdCd596k0ahN5Etqiedhz/oLG/1EeLGLP4fcLKkxQ6C7YIcZRSsjxsvLaM06RuRRrTDbemOIzSLWdTfc3lm+NiYvzuDm1ajlO0eLA7EB3SVSyDLPkPiYU1CNZhK72CVizQAomQJUy8auhz8fRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOML3JQd+EgDL1Ioaep3VzNiqJ1KFwUN/MLCXi3UeCg=;
 b=b9Od8q4HXQv6vxVWyir0B4AppJlrdk12ZGqgFp3N2I/+oRKc2X4QqmASAS+iy54C8Kty9fBCNkGZQ0bg+9U1p0aEPHqglh0uvu4Tiuk/aUxmfoFRlUgR8OqpkKAgupGGuUKVxZPWBx6tU0766nSDQ5K287RnV6FrvZvTBjzfCMo87KFkFzTIQ7FGkEcUaBgo/K1zqSoIfW+Q0jjW5s5keJfJkvz4ilTasmLVJQOe13CPr9bH/YoU2s8J69INBp+z6gH5wIgqx8PajuS3D0fkrvYcDci3WccXKptZ0n2wi7BBsiis8pVCZx4SsIt2v8230D8/wFU4eRifVC6Y35hehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOML3JQd+EgDL1Ioaep3VzNiqJ1KFwUN/MLCXi3UeCg=;
 b=FQA8/oxAXCdQxC2EPR33b69lzHjAy+NbNXBc349bgt9K91cGc9qTcXmfP/+cCAaS/7Auo6SfEP9OHpUwHJYauTbEztHm9VlKNV7bkyBf87iUv1NQldlGpbN/BlWyQmUlemDVpOW5VPLum3H9HyiMsMzD5KNqz4Eikdgiu2oE4bm2NYKrXPLlmrHa7DP2diWUut+D9bBrn0Vbi0hhCOjxqqWxnOkm7WqnrglLiq/LrWlK9Ud8MERnT6EsXizcH4PvepxgMpYK1qGi6QOiAk3hTBXWIANz1LEE8ireva4ZEdCGCNDFMYFJE4Fq90ItHlpidBO7AfM8vHBofG5Pa5jtyg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB4PR10MB6069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 06:48:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 06:48:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "warthog618@gmail.com"
	<warthog618@gmail.com>, "erik.schilling@linaro.org"
	<erik.schilling@linaro.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "thiago@kde.org" <thiago@kde.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"phil@gadgetoid.com" <phil@gadgetoid.com>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Thread-Topic: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Thread-Index: AQHazEtUhMYwPPPQTU6r0xp/LAvubrHggmKAgAJ8yAA=
Date: Tue, 2 Jul 2024 06:48:43 +0000
Message-ID: <93346bfc3647d24f1512e79088b26f804fbc228b.camel@siemens.com>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
	 <20240628-dbus-v2-10-c1331ac17cb8@linaro.org>
	 <1917470.LkxdtWsSYb@tjmaciei-mobl5>
In-Reply-To: <1917470.LkxdtWsSYb@tjmaciei-mobl5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB4PR10MB6069:EE_
x-ms-office365-filtering-correlation-id: 39cc5623-44e6-4f60-ff5e-08dc9a6303df
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z29rZmljck8zbFE2T0FoT29Ja3dBL09GWmxIN0UvTHlDSXZ2a0gwWk1qQUxi?=
 =?utf-8?B?dHZYamlLVVA3a2diekg1MlluOFpESGU0QThPS2hnSkF1OU9IODZsSTNFVU12?=
 =?utf-8?B?VEdiSUVTV1F2NmtXTmtiampCbFA4Y0VSNmNLQVdhTmwyTkt6a1NJVmVWRGFZ?=
 =?utf-8?B?MEZGRXRhRTRYTkU4RFYxaWpyNGt4K3AxVlhJTjZrRVFhR2wxc0lHUE5nRmFN?=
 =?utf-8?B?U0I3UVFwYmMyZzU5MlBaeVMxZGN6cUF1TkRWRk5Sa0NFcmZpV3Rock4yTUVU?=
 =?utf-8?B?c3BWYVRsT1JOdUFHWG9TTFBrcGJWdFpITXhQblI0RlVSaDUzTi9KakFTOGhx?=
 =?utf-8?B?UVlBOEd3TVlIQUtDbmhTVnhwOHk5bmJFdHVWYUtIZWtWb3M2RVJlWktjU3cw?=
 =?utf-8?B?blRURTZTTWIwWk9ONEVXSStXbzhkUXBGSGZlTE5LOG1WVTd6cVZXN2c0ZkhZ?=
 =?utf-8?B?QUFvSnIvUWk3ajFkRkczWWNReG9vTThDL0NQZTF5TzN4VVJUQVZXeWk4YzNq?=
 =?utf-8?B?bmpHS2tvb1JtQmFOc1RNclRYZTFVSjNub2c2QzdGNGNYdlpKWStpSm1QTlVk?=
 =?utf-8?B?bDVvOVY4dGpOUjNPaU15cWJsNWs4NVdyNW1kbkVmMGZTazQrMjFjc1BSODhl?=
 =?utf-8?B?SHUrVnMrR0lOLzF6WlA0TzQ1RUJSdU5ta3BBdDBmbnoybGFnVklkQmV4VDFO?=
 =?utf-8?B?dWUrQWx6aVg3Ymo0dndRelNUODFHQytRclBWemxFdDRQcjdadFlqL1o0RHBp?=
 =?utf-8?B?aVdPRzhQVCttbFJIb2preGJRdUpXVDMzdmFGZUtsQVQ4K1UxUmdFTE00VWtQ?=
 =?utf-8?B?VkpQZjlzZzNwVkZkUy9JeDliTnJNUDhuYUJGb2pvc0NtdFg4NDdpdGhPY2tq?=
 =?utf-8?B?eE5jWkR1OWNrUklHdFZEaWMrTyttMjNVMmF3djRSc2RBQXZYVmVpcWkzcFBI?=
 =?utf-8?B?ZXFzTS9EZzR2eFZobG1nSnp3Qm95Y3JYOGZLVlFWOGthbDlGZTRjMGVROW1H?=
 =?utf-8?B?Vjk2aVJidVYrQTA3bmJKNkRHSDhOL0ZaNzB0dm8xUEVNdzVDOXozT2NFRGl3?=
 =?utf-8?B?cytnVmRCY2FsQllIRUNCUmUrVHVoazR4WVpITUJvT1NYcmJOSkxBVTg0WWFS?=
 =?utf-8?B?M0Z3emJ0VkM4ZE9PWEt5dkwyR1lzWTg1ZWNCYXFJMVVrR25vVFJOa1Zjbldi?=
 =?utf-8?B?WVVkREhCUEJudXZZMEEvalRHWm5CVmlxc3hXcDdFSUlVUko0RzNaZ0hwRm5J?=
 =?utf-8?B?UFd5Z3VENnIvWVVKRzhuNUgxMlA5ZHJMWVp1aVBCeVN4aDlXOXNPd293RmVN?=
 =?utf-8?B?T2xDRFJLRjdQbG5LdSt2cjUzdGU3dGM0MWNQenhYRW1sNDU1VGd1ZXpXaEk2?=
 =?utf-8?B?aGplcFJMWTRXbGpQTndhNk5acC9wUGxvbW84U2txSzQ5UnFpcjU1U3RwUEJm?=
 =?utf-8?B?bmNSenJveVUrdTZDZEtadkVhTnFWakNybmZIK09EcHRibU85L0lZQVNBRXFm?=
 =?utf-8?B?YlRRVVJtTHdnYzNkZ3hQdGl6c2VYVFEwNjljYVg0WkpVTkV3T3NWdGJzZExq?=
 =?utf-8?B?b1V2S29ENTNvanZmUjZzeE84UVFYUnRiUzVNK0l0bnFmclhvNHRrMnd4SXp3?=
 =?utf-8?B?TDVwT1Zwd1JzbWZXMm81Q0dHdFE3Ri82UzVYR2ZTWTJRdWpWc0E0K2hXb3dL?=
 =?utf-8?B?TWN4L2tkdkZ0emtoenJUNTJncFBzNnJ3ZnI4SlRTTkxjRDd4ay9PMjIzUXlz?=
 =?utf-8?B?bE9pTDhsQ2hsd3llTXVuNERpSk1FRk14NDI1aHF0Vlc4aG1FYTlxS0tLanR3?=
 =?utf-8?B?bGFiblhPT1V2N3h5bjVvaHlBblVUMzlvYkdRNFpuek5Fd2hYUkJPa2VNZVZW?=
 =?utf-8?Q?rJzWeDnCYMbzK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUZGSjhFVWJacGE5UHI1OGx0T2FwSFV6d2I5Y2ljcW9tNHhrKzVzenVPY3Zy?=
 =?utf-8?B?SmRpNDNjMFJubkFhUG90L1U5NEhINGxCWWRQUFNVS0hVSXFiYy9qS2VrSlpB?=
 =?utf-8?B?b1hvU0xZWXZvNXBzTFdqVUREeFpqMGt3RHBJNnJ1Vno5ckNpZFk2VkI5SGY2?=
 =?utf-8?B?VnRENllsSGxJMlRZVGhrL0l5bi9MTno1NnJycTEzN2FtdDVXSVNDaFRqRzN6?=
 =?utf-8?B?TUxMQm1BZ3BUYSszdC81dk1nWTg1eTVyV3FqeXpXc01XbVlqVjl6V0hXM3B1?=
 =?utf-8?B?bnFuL3VzanJ6SC8zWHFLdTlkb216LzRJVzl0dG9SeDlBNUNyYko3UUFFSGVy?=
 =?utf-8?B?LzBOa0UwSGwxUktnREMyTlIzb0dCZ1lZcm1GcXlqSmtVdDI4ZGdNQ0ZFVTRB?=
 =?utf-8?B?SjBGVlkvMDJwRG5ESTdJMFN5NmsyOXNmYUhReWhnNFBEd0RQVnlONmZGOFNO?=
 =?utf-8?B?SUtWODJhMkk4bDRPMmRXamgrbGlta2U0UzRkNld5a3RJOUdKSnFEZEU5RDhQ?=
 =?utf-8?B?WldTbnZOcFI5MUdqaEI4RWxDQnhQelBGbmZ0ZzlnWUEwNEtraHgxeUdUTlR6?=
 =?utf-8?B?bW1sWThEanRCc09tdVU3dW9qYXFVeTZ0emE3c21ySEFaV2N3Q2s5YW5QckJB?=
 =?utf-8?B?L3FIMUlWNmU0aXVIbWRMU3dTeVRBcHNCNzdFbUpUNDFvRGVwRlN3M0wwMHoz?=
 =?utf-8?B?d2VXekkwaG5WaWt2dU5XZWUxdWJWaXpjZ0FPZFZVbHR6bWlsd1pkOFpRRXZi?=
 =?utf-8?B?YmVUQ0ZqeGV6aVpDeGtrL21yTHlQeGtxUXl1WXpVbUo2QmltUzl0Z1BCMVdR?=
 =?utf-8?B?OGdadjl2RTBtTERaRjNsRU5sWnZVVGc3RDdFeS9Tc1kwVXhac0xwTkVJUGFM?=
 =?utf-8?B?UWhkY1JIR1VQMjFTQm1yVktJOXY1VTJTMnN3OHhROStsYnp2cFQ4WVd5aTVI?=
 =?utf-8?B?UWJvS3gzZUNkM0tIekRJaW9jOUpYWkFPbmxiOTRnc0VqMmttN1BTaEU1YU81?=
 =?utf-8?B?M0FCUWpnbC9adWdRZjNraExmaXphVWdqL1VmUE84eHRuejB4WWU2cUZCWXFR?=
 =?utf-8?B?RWVrU0JYUkVxZGhqaDgycjhCSGUwZ1NPNm9ZcVJ4R3BhcXpueUthV0xzb2NL?=
 =?utf-8?B?RGVXSEg5ZXhKbkViWFFBNklJbTYzTmxEUFRyR2tGTk1sbWVYeXBsa1p1NEgr?=
 =?utf-8?B?MzBEMFFkd2hvMjV1Z3pCbytWMVEySHI2YTdWaGNkdnBrZUJJeE9xdE9QNXJj?=
 =?utf-8?B?cVNQRFA1cXYxK1hnWmFSQ2dOT0JtYVhJMFEvbVZHY3htb1Z5bGlYNXhSNVF4?=
 =?utf-8?B?RmZYWkdydWxVZXlWMzJsVUhTaVNzNkltYWVhSE81S2xMZk9qS1F5SXk4ZlJi?=
 =?utf-8?B?T2pjRGpsb21tTFJTOHRKSGF6a3dUdGNhcnJienVwaVo4KzZCbW05SThNTng5?=
 =?utf-8?B?RjQzbVZ2L0Fzay9Sb1NNWGZaRDVaY250SFFnWFFVVDJ5d290RFp1bC9wRTFp?=
 =?utf-8?B?K0tmUHBoanU4UHBaN1RFRzZGN0JuWnNla1ViemhmL2tGWGUzaWtxWXhLTXdG?=
 =?utf-8?B?dlpQWHpualQ2bzdUTkNRbTZnVTlqMGJma0hGbURTRUl0Z296M0pnUFE2c0lB?=
 =?utf-8?B?R0diOGdxWVB1QmxFcEhPOENUSTJRNkE3bjBLVGVPRys4dm8weTBGbTVCcTMy?=
 =?utf-8?B?ZDIyZllXWWxCVVlDK0M5RjhSMVZuTSs4V0UrZkZMMmxSYXRvSUswcFljeE5U?=
 =?utf-8?B?dmdCZGswWDFGTElDc1pCQlArUCtQVWJIbTBtYjgrcFlDU1UzOUJrS1ZMR2x4?=
 =?utf-8?B?dWN2WDFyam1uTlJUazdiaUFneEE1d0hoWllnQTNNUlV4MXl4NzJCLzNiNHNE?=
 =?utf-8?B?NVRNcUV0clFPMFVIYU0weUxZMGJxRkFwTXE0VzJQTDdzNnJOcHBNSU5pMDhx?=
 =?utf-8?B?bXVBYnhLRDRKVURVS3JUUHZLYmFQSGJ1OVM0UEJ4M2d0VHhQRDhxRXRxb0VQ?=
 =?utf-8?B?eDFLazNYYU5NeGNyWTNsaFg1MFlSOThrbWFqQnFRWjVTN253Z2tJSkJ2MHFT?=
 =?utf-8?B?alJrbDQxZkcrZkRKMHBuYjBCWVM0Vk1lSzFOUVl4LzdMVWgwT2hpOTgyeFl0?=
 =?utf-8?B?UmM1MHpqSDg0M01oc0plRHhRWlNscU5KL3lVd01tdE5BdkdUdXF5RXBYOXRu?=
 =?utf-8?Q?329SmVSJt7yS9/tSv87F4Js=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B3B07983B04CC4E8D6BC9C9D01024B0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cc5623-44e6-4f60-ff5e-08dc9a6303df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 06:48:43.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtXhS3d/45MqOy5KEdtMPqPrunrEIli82BCtPeKt4AGQhXmmM6gUZs7G6d76fU/C6SQPzipFnwjvTWMQ0V2XJvF4u9TcmUuZ4dpUTxp2rkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6069

SGkgVGhpYWdvLA0KDQpPbiBTdW4sIDIwMjQtMDYtMzAgYXQgMDk6NDkgLTA3MDAsIFRoaWFnbyBN
YWNpZWlyYSB3cm90ZToNCj4gPiArwqDCoMKgwqDCoCBUcnVlIGlmIGxpbmUgaXMgYnVzeS4NCj4g
PiArDQo+ID4gK8KgwqDCoMKgwqAgTGluZSBjYW4gYmUgdXNlZCBieSBncGlvLW1hbmFnZXIsIGFu
b3RoZXIgdXNlci1zcGFjZSBwcm9jZXNzLCBhDQo+ID4ga2VybmVsICvCoMKgwqDCoMKgIGRyaXZl
ciBvciBpcyBob2dnZWQuIFRoZSBleGFjdCByZWFzb24gYSBsaW5lIGlzIGJ1c3kgY2Fubm90DQo+
ID4gYmUgZGV0ZXJtaW5lZCArwqDCoMKgwqDCoCBmcm9tIHVzZXItc3BhY2UgdW5sZXNzIGl0J3Mg
a25vd24gdG8gYmUgbWFuYWdlZCBieQ0KPiA+IGdwaW8tbWFuYWdlciAoc2VlOiArwqDCoMKgwqDC
oCB0aGUgTWFuYWdlZCBwcm9wZXJ0eSBvZiB0aGlzIGludGVyZmFjZSkuDQo+ID4gK8KgwqDCoCAt
LT4NCj4gPiArwqDCoMKgIDxwcm9wZXJ0eSBuYW1lPSdVc2VkJyB0eXBlPSdiJyBhY2Nlc3M9J3Jl
YWQnLz4NCj4gDQo+IFdoYXQncyB0aGUgcG9pbnQgb2YgdGhpcyBwcm9wZXJ0eT8gSXQgbG9va3Mg
cmFjeSwgYXMgdGhlIHVzZXIgKHdoaWNoZXZlciBpdCANCj4gaXMpIGNhbiBzdG9wIHVzaW5nIGl0
IHNvb24gYWZ0ZXIgYSB0cnVlIHJlYWQsIG9yIHRoZSBsaW5lIGNhbiBiZWNvbWUgdXNlZCANCj4g
cmlnaHQgYWZ0ZXIgYSBmYWxzZSByZWFkPyBUaGUgbGF0dGVyIGNvdWxkIGxlYWQgdG8gVE9DVE9V
IHByb2JsZW1zLg0KPiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGZvcmNlIHVzZXJzIHRv
IFJlcXVlc3RMaW5lIGFuZCBnZXQgYW4gZXJyb3IgaWYgdGhlIA0KPiBsaW5lIGlzIGJ1c3k/IEJl
Y2F1c2UgaWYgaXQgd2Fzbid0IGJ1c3ksIG5vdyB0aGUgY2FsbGluZyBhcHBsaWNhdGlvbiBrbm93
cyANCj4gbm90aGluZyBlbHNlIGNhbiBncmFiIGl0Lg0KDQp0aGlzIGFwcHJvYWNoIHdvdWxkIG1h
a2UgdGhlIGluc3BlY3Rpb24gaXRzZWxmIHJhY3ksIGlzbid0IGl0Pw0KSSdtIHRoaW5raW5nIGFi
b3V0IHR3byBpbnN0YW5jZXMgb2YgImdwaW9jbGkgaW5mbyIgcnVubmluZyBpbiBwYXJhbGxlbCwg
dGhleQ0Kd291bGQgZGlzcGxheSBHUElPIGxpbmVzIHJhbmRvbWx5ICJidXN5IiBldmVuIGluIGNh
c2Ugbm9uZSBvZiB0aGVtIGFjdHVhbGx5IGlzPw0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0K
U2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

