Return-Path: <linux-gpio+bounces-7806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF191C39A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D781C218DC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A29A1C8FDF;
	Fri, 28 Jun 2024 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="k+2qA++t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED47A1BE876
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591402; cv=fail; b=Gpdq1OFbLGc3dYqN4pOGzesgpvdjYD5Zw/geiMJqXAevjwQRgW3kF5uoEYGhhN5Ztu6n/EXwIF221kgxmpqm6FUFh8TKP4dgWH9Vs0T0cbxRuIeWMWeTDCpKu2sxHmgdO1qF1B92tS7nrW0FRtsP55H4OJ6h7SHjIU+Qgpr/ESE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591402; c=relaxed/simple;
	bh=7I321TsMS3x1xbF5QrMqe+csIWYEFcXUPQooECln3Ag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UkQ2qzX2x4r1ZmZI0Pn2yyiyyWM9BpO7wTskj3tgnKrG5dEQYHjKpBUUsn4hQiOaRnEiTB0h3IuhFjh1oEQK6LNUmNTtyNC7LMLtUlQ6aAO5+qtdjT0C8aiBLh7xm/buTBWrePCnrAdxuEcjk+ne3W13Bo9bubAKK4PP8IK8L8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=k+2qA++t; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DryFv/T1NLhKtvETsX7ybRZ1xkdbAdZBQyrN0aHUgoaRKUXlNtRP7R0mfA7SZKjAPe5X2lxKe57b27/86TXBxzYsElrdPsrHjutdHMVlR2+7n0K+UJi5Xa1k2Xvp8+T1gnvpFqxVPkxdYkQUq3PrAdj4uTKw9V7hxMNLi4el+ENMeKh/K4wy/4Dcff6LdIr6M2sVzV9PBPByI3RrtPmfOpCk/DZ3MhhaAaO0pfj97xglPTtx4OaQgztdOz4mVOxYbs+xh2if7IS6QrqvN3KmF/ZfLef5Bnn78OjuyRz598pZIoDyoc5eJLY6sgTOfXK52DQgDBtTWa3n9hnhGI5P4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I321TsMS3x1xbF5QrMqe+csIWYEFcXUPQooECln3Ag=;
 b=VAuhc9mdUhBUoXClE3QtloCxIuJ/bczmk7WomR4Q9Dm5FdYAwUVDR2YDd33BKAUG4VIENdMfhSXj7O3i4RgzJzhSUvtayH+2z3TmjZiJVtw8gxHiu0QTKUCaStO+QR24k16FH8YNW3uFUwdeNpXDmnojcZ/cZmpvy3WH8JDDCjIppWJIaky7e3FqSCCKgD3Qq9UhlkPna2+n8E6qrU6/JKCfxz4Lw+fGoF8bkY22wxR6kMnsqhHzEXTXoqTpLSUkX43SNjW0Mxt/Qb0RRdICxN2lr14mDHVfLKRMTNoRrfRlyVdL7D4tJ9zzc+Fq39UEWHgx7gDlPn1A398lb8RL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I321TsMS3x1xbF5QrMqe+csIWYEFcXUPQooECln3Ag=;
 b=k+2qA++tJMeqE2h1R+Q5aBMvhfhoe62Jl4zhC0WSVNGGzplav5rQXy/qoxnDYa5Djc9MtX859uGbcfiKjuADbGsvWlFox1ktO+8yKT8D43QctAwoqzdmBB7Ih6WGe3c+6fIedA3EIHY9EldkcI8IrIpT7ycSG6v70qhojWDr12svS7oe8Un7qmQmzbiNJ+m9cfoK42/e8X9v5X6csLwoIzbYaQqiUMq56suTJdqYmh2TdNuP0OjF+SAZeVzX0oq4QXPszeRvBzvoN1WmatlkWL3A73yymrvxk1RJ6fqVd/zwxA5eFhJNSmVSOrgL2MbFZZP/cb2b3noWWuhPQgkDlw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAWPR10MB7747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 16:16:32 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 16:16:32 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"warthog618@gmail.com" <warthog618@gmail.com>, "erik.schilling@linaro.org"
	<erik.schilling@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"phil@gadgetoid.com" <phil@gadgetoid.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "viresh.kumar@linaro.org"
	<viresh.kumar@linaro.org>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and
 command-line client
Thread-Topic: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and
 command-line client
Thread-Index: AQHayXVq4AecSp9hRUOtDY3BO7RdKrHdWiiA
Date: Fri, 28 Jun 2024 16:16:32 +0000
Message-ID: <d0c6ebd25dfe75aae0c44ac1a0f937ae74f8f1ec.camel@siemens.com>
References: <20240412122804.109323-1-brgl@bgdev.pl>
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAWPR10MB7747:EE_
x-ms-office365-filtering-correlation-id: 4ab216ff-ef9c-47d6-97d9-08dc978dacad
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmNnMjVqWjg3WjZlbWpwWW90cDNWelNvZS9vV3A1bmVJVjJNSlhiYkxMaG9D?=
 =?utf-8?B?Uk4wS1FKNlpjZVhoaVJrbzRxRmE4d0s4WDV6cllGTHlNU1UrdnFXUisvTUJk?=
 =?utf-8?B?TmhkZ1FZVXNHZGQzSFp5Q1BlekNoL0hBTWxjd3RWSEExTUZkUDJqNlFWb1Bk?=
 =?utf-8?B?R1EzZXZIN09kbm5wMFlub05yd2twN2xRamR0SCtaNTNRb2s5dFdaY2MwVTJF?=
 =?utf-8?B?cmsrUi9xZGFLc2RvdUFQSTcxU01TeXVpSlF4L3F1VHoxcDNVR1FXTW91MFk1?=
 =?utf-8?B?TGJKVmdwQ2lZSFhVV0JRK2swcUJPWGRtNmtBVWhheWVEcW8yUDVsc3MyTmVx?=
 =?utf-8?B?MlZnTHdtNytORWUvNkQ5N3hONDJGSnZvdUdqYTlRQmQzeTBiUUVDY25nMTBk?=
 =?utf-8?B?ZEp6TStsS3dKaDNLTDNsRmxpZW1yaTdWbVFkTi8wOWUvaVhWK2ZxditxUWNU?=
 =?utf-8?B?UzZnSHk0NW9EM1cwNmpaSkloN3RWNzAram9vZUR1eWxMYS83L2JxbExmL1BB?=
 =?utf-8?B?bGZLU3psazFxTXFHcDRsYVdiV0FDV05mUmFZakE0RnkyNjIyNmZSb05tNWNw?=
 =?utf-8?B?MHFXbUcwWHZQVnk5RTlWUGJsMHVvVnROK2ZtdHVxL0ZUSTZISTcyTytUYkR5?=
 =?utf-8?B?UW13SHNLV2tyWXR3Ui9obXpOcFIvbG96R2N6TTE5aUFPakVVbUJmQ3NHSmxN?=
 =?utf-8?B?cHpCeE54ZCt4SklwRGlxc0EvYVlsNDQ2RFZiaURqRUVQbDVINjR6d0dXQ0F2?=
 =?utf-8?B?cjFFb0x3RUpOM1dMbUdhdEhHbENKa3lIeVZBM2E0NE40RUFtM0lxY3hOOTFp?=
 =?utf-8?B?bGUxSmlCay8vakdaNXRlUWNybXdyNm5UOHltN214VTNoRjdzclZ5ZU1qL3g5?=
 =?utf-8?B?TDhtZStxL0pLdWd4WXdKTk1Iby9IdEpFYkpsem1IQk02bXhGZ2owdVZqejdS?=
 =?utf-8?B?NkYyMXlRNStNU3M1UFNYdzZNOTlhTDhkTldzcGVPYkkwV0VzV01QQUU0MUR5?=
 =?utf-8?B?VTJFSGNsUG1tbk1semgzN3hiam8wLzB0b01Da1k3VkJpd1VKc3pIUmd4Rzgz?=
 =?utf-8?B?SDhycnNGOWJEbVBJRGR5VkNpVHphcnkwVWV4VVhEL2I1UXhHZHBJMGw4R0VO?=
 =?utf-8?B?cHFpZVNjNURSb3cyZ1NOSHFzdlkwdXZpZUFJUWZSZDMwUW9CYURmZCtmSlBa?=
 =?utf-8?B?WXBueGVuL0VHb3ZhZXlsbFZHSFN3Q3IvWVRVK1I0cDhONVNHb1BqL0t4MU5x?=
 =?utf-8?B?eVFWalZ5enRNRGk1MnYwN2RLWkJpZ09udko5T3pSYk00Q09sdXFjU0s5RXV3?=
 =?utf-8?B?S0lITzBSdEM0VFNkVU0zdS9qUk5PN3h4RERCRkhKSS9Vek9pbzdNTkxpN3Q3?=
 =?utf-8?B?cnlZdklDOHhST3U2L2E5d3VvSFpSU0sveDl0VDhmUml1L1YwYWVBRTVwZm9Q?=
 =?utf-8?B?QnBPeThVTkFSaXI4WWpER2tjS3lBL0RyR0UxT2lmV2hBZXczQksyMWRTOFpu?=
 =?utf-8?B?ejFqenV3UkU0OVViR3lTUUtkMlFib2J6ZStaSXRna2RSaFhYVW9hd3Q2NlZq?=
 =?utf-8?B?S1l5ZUpsWU5tTTNSK2RxbDRtL1Vtd0dOL0hIQUkvVlZqUFpsanlCRm81blVM?=
 =?utf-8?B?am04UFlWQW1CMEpQcHFEQUtBQjMwMDY2U003MC9ubW5ic0VubTVaSnlyOVV2?=
 =?utf-8?B?THJkWm5SNU1FODVRRzRIL2pNc2tqQmdnSXVsKzZXbWx5ZzdqdG1SbVJ6cnhS?=
 =?utf-8?B?MTRwL3hiemk1c0MwWWI5OEIwbEc5NW01K0lMOTZwVmZBM0pFZk92TnJUL1Uw?=
 =?utf-8?Q?1LA7lf98F3rbJ2X08cQIbdVnYkSJsUQorNqaw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0NyVU00SWVvaVg2dEYwRFZReVdwbXZERTgvT2M4TnI2YWFkdWxhTmtlMitZ?=
 =?utf-8?B?RzdzUkJ4TGtiOGlhaWJydkNzMkhFMjMvQWJaanVqL0xOVldVdE9laWhrVWRx?=
 =?utf-8?B?YTFYK2p3eFFZRFZ2RENnbHBsZU9mK3Q2aHhyYVNlTFFMNitUZDAwOWdTU01a?=
 =?utf-8?B?aEJpbVQ5K0FJeHBWNTA2VitTb3Jmei9Gc2RsM0dnbVY0bmRQaVZHQW9kTi9V?=
 =?utf-8?B?Q1JpVFI2bzJKckRhV1FpS2xNNnpMeU9hS0pYQnQ1R01GTXYyNzY4WG8wYlFL?=
 =?utf-8?B?dUZqN2NSSTlxQkdZdXdaUGdwRnN5Qis4am9PR09oeGZXVFJpa2t6NVM3Z2R5?=
 =?utf-8?B?YnRkOGRObVpaZUZJUEJucUFVVEN4SExWSWphNGlRaWRXbEloL2lJZHE1MGpj?=
 =?utf-8?B?NXlVQ2NnYm5VMmtLVzNzT3ZjMHdTd2NWalJGVzAwVTlOcnZqamV5THY3VlM4?=
 =?utf-8?B?TXI4SlFzM2JZZ3VtNlZpMm9OYWhBck1CbUZocUZTbnZ4NjVNcWV5U04rS2RU?=
 =?utf-8?B?M04rT2cyTVRCRFlwOEdTMlZaK3lzcnZNN3hnMHgyVkdCS3M0YUl3eTdKUlNJ?=
 =?utf-8?B?eWlXaEh0bTh5djB6S3Y4cktaakV5S282S3JnQUYzWi8rOWRWMlRyQUZvZnU4?=
 =?utf-8?B?cWpKaytqa3ZmVDV6WUZleHVXVXY2L0xoSVpUQ2NsL2RlYTZZQTlQZ1BST2JH?=
 =?utf-8?B?U3NjL3VKeVl2MXY1QytaN0FhK1FNUDczdC8rUFZyQnY1RXlKL0ZhNkFuZTI4?=
 =?utf-8?B?VHJGczJHZzQyc0lDamliRjluQ0FNV2x4VGRHeGk2ZHNtTEhGSFRKYXdIUkpI?=
 =?utf-8?B?ZFZ2N1pvL2pyWHdRTzluZC9CRXczbUdMQTZSOUNxendBbnE5RVhGVUlMbk8y?=
 =?utf-8?B?N040K21VRXhTQkN3R0FMMFo1MEZ3R1Q0R1JoOHZES3RYM0VxTTFyWllZUXFT?=
 =?utf-8?B?MEVqTmpEVTdLenUrYTU2QkU2UGNteWovZkFDRXNUdlBLYXp1bjhuaGYrRGIw?=
 =?utf-8?B?a0ZFVHdkOGRFdkdhZHNVc3JtS1VYREM2SUkyZGFWWjU0eHNGQlU5Zlp4eEND?=
 =?utf-8?B?ZUhkanZyUmFBUzEzN2l0cmpoTTB6RlVyRmFzaFZaaFQvQnc1Q1ZVUk1FZUpG?=
 =?utf-8?B?Vzd5Y3pxcVdMUkxROWx0YzJPMzRaWHlXWkl0S3I5Vm9VaUY1K2NJR05NVmhx?=
 =?utf-8?B?elozUmpzQkZza1c1MzBLSitxSXVvcURQbnE2SEVScU1FdGhPZzE3emxKdy9M?=
 =?utf-8?B?ZGhGWTNvUlB4YSs3QVhnUVpzcnlSYk9RME1URmFkL0ZGZTNmb2ZrdFdCMWpS?=
 =?utf-8?B?QmdlM3NvRWFlSERkb1QyK3dYdFoxdzJUV3V1d3hVRmdWaldjcStmd29VaXpU?=
 =?utf-8?B?Qit0Qk1hWWdyQU1FM05Fa3NFVmgzQTNnRjdXQ0ExRmZsYmZIZlhaL2k0Zlg5?=
 =?utf-8?B?TlRiY0FZOVVjSENoWjZUdHdnYkJQY2w0M2FhUFVOVVoyR0p6emtLenpSTElB?=
 =?utf-8?B?aXFOSXhoVXRtR2hmYXl3bGJ1NjBkTUtzWUJiMTZVZE5RVEp5ck5PYTM5OGRn?=
 =?utf-8?B?ZkYxenFMZ2pYcFpxcHNOcEdLdi9tcmRUTy8zS3FjS0w0STQwT1JmMHlHTmgz?=
 =?utf-8?B?STZhUU82SlVrelA5S0NncXYwRFdRMkgxWmRDakhUTFFRUkxFeCsxeUVld3hO?=
 =?utf-8?B?Q2cwczRvRDBzNkhRS1hyL3ArM2hSTHBIWXRlOXNQeVJtMTZNTDgvZVJ0S1d0?=
 =?utf-8?B?V1VZdFFjN3ppcStDU0xocGtVVE5OazYxck12MmhPd29pMkR4bGhTeFdnRGxN?=
 =?utf-8?B?WVVGSmFrNytOa1ExcFJXOGlBSkRIV2JGd0FWbEVneTM1V2FabE1ieTVLUlFi?=
 =?utf-8?B?NEErNFV6N2dVWjVxZWVwV01JeEhlWEQ4TlQxMnZEZUxvdXpOTG1qRXU3YlFr?=
 =?utf-8?B?dFZ4SEpIL2Z6REpqTk5RL2xCR2FBTm9IZlp5Qjd2T1lWbWswdUJnVEdlSUVB?=
 =?utf-8?B?RzYwdVVYMytwZVhxSDNoMERQUmhkMWUrQkN6SHJDNFNuQ09uQk1TempIcHFP?=
 =?utf-8?B?SUxmM1BSSUdEQVdmNU4zWjdZSGo2aFhaUnlxeTJDa1pFd1FMNWtTeG92OVMr?=
 =?utf-8?B?S2NSMU5pSHNlVmMzQm5IR2dTWEpMRFBpTTBBejNmdUpJenhXODZQdFJjRUFw?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A64C774569829747B03787DFBE5FFE36@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab216ff-ef9c-47d6-97d9-08dc978dacad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 16:16:32.2391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGTblULyWUsrRla6JZkvasxnil1LZWhX24f1q+RKmQjk7tFgKaGE+imUWZijz9x8VZl5HOe+ddYj9lYgXwhKN7JESFSoECR/DcNJgQkRhzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7747

SGVsbG8gQmFydG9zeiENCg0KT24gRnJpLCAyMDI0LTA0LTEyIGF0IDE0OjI3ICswMjAwLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBUaGlzIGhhcyBiZWVuIGluIHRoZSB3b3JrcyBmb3Ig
YSBsb25nIHRpbWUgYnV0IEknbSBmaW5hbGx5IHJlYWR5IHRvIHNoYXJlIGl0DQo+IHdpdGggdGhl
IHdvcmxkLiBUaGlzIGludHJvZHVjZXMgdGhlIERCdXMgQVBJIGRlZmluaXRpb24gYW5kIGl0cyBp
bXBsZW1lbnRhdGlvbg0KPiBpbiB0aGUgZm9ybSBvZiBhIEdQSU8gbWFuYWdlciBkYWVtb24gYW5k
IGEgY29tcGFuaW9uIGNvbW1hbmQtbGluZSBjbGllbnQgYXMNCj4gd2VsbCBhcyBHTGliIGJpbmRp
bmdzIHRvIGxpYmdwaW9kIHdoaWNoIGZvcm0gdGhlIGJhc2Ugb24gd2hpY2ggdGhlIGZvcm1lciBh
cmUNCj4gYnVpbHQuDQoNClRoYW5rcyBhIGxvdCBmb3IgeW91ciBlZmZvcnRzIQ0KDQo+IEZpbmFs
bHkgd2UgYWRkIHRoZSBEQnVzIGNvZGUgdGhhdCdzIHNwbGl0IGludG8gdGhlIGRhZW1vbiBhbmQg
Y29tbWFuZC1saW5lDQo+IGNsaWVudC4gSSBhZGRlZCBzb21lIGV4YW1wbGVzIHRvIHRoZSBSRUFE
TUUgYW5kIGRvY3VtZW50ZWQgdGhlIGJlaGF2aW9yIGluDQo+IHRoZSBoZWxwIHRleHQgb2YgdGhl
IHByb2dyYW1zIGFzIHdlbGwgYXMgZG9jdW1lbnRlZCB0aGUgaW50ZXJmYWNlIGZpbGUgd2l0aA0K
PiBYTUwgY29tbWVudHMgdGhhdCBnZGJ1cy1jb2RlZ2VuIGNhbiBwYXJzZSBhbmQgdXNlIHRvIGdl
bmVyYXRlIGRvY2Jvb2sgb3V0cHV0Lg0KDQpUbyBtZSBpdCBsb29rcyBsaWtlIHRoZSBsb25nIHRp
bWUgYW50aWNpcGF0ZWQgcmVwbGFjZW1lbnQgb2YgW3BlcnNpc3RlbnRdDQpTWVNGUyB1c2Vyc3Bh
Y2UgQVBJIGZpbmFsbHkgbGFuZGVkIGFuZCBvbmUgY2FuIHN0YXJ0IHRoaW5raW5nIGFib3V0IHBo
YXNpbmcNCm91dCB0aGUgQVBJIGRlY2xhcmVkIG9ic29sZXRlIGluIExpbnV4IHY0LjggOy0pDQoN
CkkndmUgY29tcGlsZWQgZ3Bpby1tYW5hZ2VyIGFuZCBncGlvY2xpIGZvciBUSSBhbTYyNSAoYXJt
NjQpIGFuZCB0ZXN0ZWQgb24NCnNvbWUgSFcgb25lIG1heSBjb21wYXJlIHRvIEJlYWdsZSBQbGF5
Lg0KDQpUbyBtZSBpdCBsb29rcyBzb2xpZCwgbm8gcHJvYmxlbXMgd2hhdHNvZXZlciBub3RpY2Vk
IHVwIHRvIG5vdywgZXZlbiB0aG91Z2gNCnNvbWUgbm9uLW9idmlvdXMgbGltaXRhdGlvbnMgZG8g
ZXhpc3QNCigiZ3Bpb2NsaSByZXF1ZXN0OiBhbGwgcmVxdWVzdGVkIGxpbmVzIG11c3QgYmVsb25n
IHRvIHRoZSBzYW1lIGNoaXAiKSwgYnV0DQp0aGlzIHByb2JhYmx5IGNhbiBlaXRoZXIgYmUganVz
dGlmaWVkIGluIGRvY3VtZW50YXRpb24gb3IgaW1wcm92ZWQgZXZlbg0KYWZ0ZXIgbWVyZ2luZy4N
Cg0KV2lsbCBiZSBoYXBweSB0byBwcm92aWRlIFRlc3RlZC1ieTogYXMgc29vbiBhcyB5b3Ugc2Vu
ZCB0aGUgc2VyaWVzIGZvcg0KbWVyZ2luZyENCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNp
ZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

