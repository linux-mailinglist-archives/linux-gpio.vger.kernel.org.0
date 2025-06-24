Return-Path: <linux-gpio+bounces-22109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C440CAE7381
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 01:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C804A0188
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 23:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE4D26B2AE;
	Tue, 24 Jun 2025 23:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="siOd8uxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2110.outbound.protection.outlook.com [40.107.243.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D8219E0;
	Tue, 24 Jun 2025 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809275; cv=fail; b=KZGS6ekorbMBzScytHbcU+BcER7vKXKpqka8jOBI4HAqDJo9Uq0NIXSWM6MX7ATbviqQAiXGoFOXkeBxPXLjNDfKFpBMCW4qh+ntavOHWGerob9j4xE8CPWJ3yo6IJtTQjrd9up205flE83wkY1CeNlcrx21EFJPs/tiw6CwpXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809275; c=relaxed/simple;
	bh=0i7TcTj5yMzVete0jw8lZacbMEZAiBqnmQtTE6NV41I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BUGobJv5WSA7UMyubf/Tz9SbKNlA/snVXq+G4WhMBpe+aOL5J0NBhuuXpKcDHT0g6S5w8xEwSwCFhhPdiO4rVjKUOiLXJ+wgUD0zVwQ0ak4z5qC0jka0bPFaAjcLnHF+GygSAoqHOnJomxsf59uFOR7MfSBT6WoVsqkeCwzIB6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=siOd8uxd; arc=fail smtp.client-ip=40.107.243.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imi5+1E3fcFpY2lupTsvPmJApwv21/B7C3eMlm2NFD1aeY9sMUGaVUDNsHGNH5YRafnFVjD85HbXxvIqvGA29hKP9azSj367u/JzGaROsF2aOP+iTJKDzLogZ3vlAJhAOmA1equvLkUvFweBFOMgf5fQEwufKas2f3sZZAZREhMVLQilVHBLgwjj+s2kmdfvL6O0NKxMHhkaNGYYH/87a3UGCaXtd337oNlPocWOpECN05E7yy+mIKxQ2OlDqIWynAVxIw9g28+VGEWL+df9W/JEnN29/pQ1s8+WljCeLQSp485rKyTfIH/bdBB9d4Sdv/2xb7E6DS5MfQdZZ7IMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i7TcTj5yMzVete0jw8lZacbMEZAiBqnmQtTE6NV41I=;
 b=woegkYaxpZG9tcwHOOFBZoO0YgCk4cV43d6n/NGaojb06pOTKq080jREd1uMI2NsQyxuWWalNyO1GjL9sMGexk3CzC+jaVajIWEfFLKZcVW67mg3NnQ2n9qKUKcKAwv39Dw01AbE0JXPXiTAc6KIwBJ8XwtScpoGa1PH8svMJptCrcuUrLjBqp63Gnc+TEWjXjcxeJuBXeSnm/kQPy95VhE0Ki5qsIZu39klIIU+hJV+F+HQfi9Gdfr1gUQyfbqO6P4uKE5DvQkAo/o9wblhlw8ofhka4Pfn4nsoeh6455HE5ntPkeRRnM4a6oyERCZyex+dc/W9GllzZhwsG9Y86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i7TcTj5yMzVete0jw8lZacbMEZAiBqnmQtTE6NV41I=;
 b=siOd8uxdYN/uEAoLGWLvVR3663x/1J9NgXS2YMAHLOQ2grRApW47/tu7sv/66don/pgOQwB3DcbLeWjYfLriKKvjNnTNrrQWnS0eSBhrekrZmJdI/5Flxu5WhU/vmsK4v6prDnJ0iFY1o5ne8Gs23vVwRbNJP/45dT55Dx3w+xtSL6tMfCybSan18h0io4MflwkMiuPlxRxe6ytYrYTNHdDJtnAXsUwbr6Bf0wl8dzjoYXZR/SOU4qx9yPehTAaW3chDe7LLIPX9NtLouy679IWP05YBWeIDuzNaGG9fzoiAc0mV/9N7aPvcdcpTpM8U7YbR9pTHr2GIgWqdMyKoLA==
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::c3d) by SN7PR18MB5387.namprd18.prod.outlook.com
 (2603:10b6:806:2ea::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 23:54:30 +0000
Received: from IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d]) by IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
 ([fe80::ca34:e235:13d9:3f5d%5]) with mapi id 15.20.8769.031; Tue, 24 Jun 2025
 23:54:30 +0000
From: Harshit Shah <hshah@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jan Kotas
	<jank@cadence.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Topic: [PATCH v3 3/7] dt-bindings: gpio: gpio-cdns: convert to YAML
Thread-Index: AQHb5GRCF7mi56aH70WXybGj/7AtLLQR22mAgAEidQA=
Date: Tue, 24 Jun 2025 23:54:30 +0000
Message-ID: <058aeecd-d9cb-43c4-8cd8-b1e8012b6448@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-3-b3e66a7491f5@axiado.com>
 <1f1eb736-5b04-4e59-afb5-9e5925900100@kernel.org>
In-Reply-To: <1f1eb736-5b04-4e59-afb5-9e5925900100@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PPFBEC4B1F8E:EE_|SN7PR18MB5387:EE_
x-ms-office365-filtering-correlation-id: 7461074d-1a63-493a-cf96-08ddb37a7612
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1k5NHFEbGprVG9pTEJReDZwVHZpLzJwTVluSHFSeDdjVmpkaC92KzZ5bENI?=
 =?utf-8?B?WVRRc3pNcG5oVDRQRTFVWWo4NXZqL0RtbzVuSDRSM3hCazFTVlBjWXhPbEE3?=
 =?utf-8?B?bVJiSUQwYzR5Ris4RVU5MEhwWDdwZXExbVJicFZUU0R1SWJGdGpqUHU0QVlG?=
 =?utf-8?B?WkhFV0haUE9hR2VoMXVLNHpQekViNTY5d001Q0dSNSs2WmZCZXZDcStmakJl?=
 =?utf-8?B?MHFXTnNhaUJENEVKaFF2clFYMHlIWnhvV3NOU1FhQTZVSTFHcGlCcmtkRCto?=
 =?utf-8?B?bW5BS3QxWklBdXVzSW5ZR3l3VVh5N1VkSEEwOXRIdGY3TmFrOThoZFlyejd3?=
 =?utf-8?B?THZCc0ZzTk1YREszTG5YQVYrdVcvRW0rc2lhcG1CZjlqN2RUR3BpTHdoNzU1?=
 =?utf-8?B?Nk1zM0lqYkdXbHhPcWZZV0dyT3ArdmhLdjlDU3dkMnlaYU9mZUZYc1FNRWZw?=
 =?utf-8?B?YkpkSVBUV21xdGxvbHphaVp1d2JPZFAyUWFNSFg0VGlmRDBCbFNQZlMwaTJW?=
 =?utf-8?B?Z1QrUFJZZmVlUHE2WW5VOVRySjROM1pWS21ydGdFYTJ0OGhkTy91SjNTdHpq?=
 =?utf-8?B?NTBYbjMzZ1J1cGdnQUJnWmF6ZFdUK1dPL3JBWk5EZThNUWFYS2hLL2MwNUNX?=
 =?utf-8?B?Y0FzVUd2YVQ2VkN6RVpTbnFETm5aOE83Q1BiMzFxSmhGUXpXS0ZZZjFIMzM3?=
 =?utf-8?B?Mkg3ME9VckpzMXZQendzcXRrYWl4ZCtaS2psc0NIREdjNHlLbzN3dHUxRTJO?=
 =?utf-8?B?aEhHTlZLWXhHK05PSzZDUE9FYS9rMUloeVU3RFRZSWF6RUVNL3ZPb0ZYWS90?=
 =?utf-8?B?MGQzNS9OSUhac1N2V2F1ZEZ4c1lHMVlLVUh3b2dMdjF0VmdJdFg5QTZwNDJR?=
 =?utf-8?B?cVNwRUswZHJGaUhoa01XVkxpRFU0a0dFdHlDS0wrY1padHBmb24vOXpCUXhX?=
 =?utf-8?B?Rnh5Y2RDN21mYU1oRkIzMTFzZ3JNNFJ0ZVJTSTI3Z095SGc5WHpTSzdkMkRS?=
 =?utf-8?B?SDVpQ2d1QnlicEFRT0lSdDkvS1YyYUNiNFAwYXZkTmwvcGM0L0lyR1c4dEdT?=
 =?utf-8?B?eXVqZXY1S3FnT0U0RjFwNTVKMXgrVTkrK1QwTzVUdzE3dGVLbHFKdCswUUdN?=
 =?utf-8?B?U2lEQWlNN2ZCVmt1ckxuMzBvdDJYUUl0ei9NMkh3YXNSTE54c2tGRlBIUXRm?=
 =?utf-8?B?amt1UzN0TE9CQ2ZTRnczelU0b2ROamJvejRWb1h0TXVYcnZrWDBMdjRDcFdI?=
 =?utf-8?B?VWxobWNMN0MvTGh4UzFFa2h2MHI1c3pRbzBGcGx0RXQ4YlJ2dGRZeDQxc2tp?=
 =?utf-8?B?Vnh4RDFPSWs4R0RacCtrNEdlcUtWZmZjdHNYWjlhdmZYWURES01ieGpGWEd4?=
 =?utf-8?B?aVVYOFp5NmNEdFNlOXdDalZHT09Ga2ZHeWlWV29sd1NMblFYTXd0ckFTUzdW?=
 =?utf-8?B?RHQ0WjJyVHIyb2JlQk1KMGJucmRXeCtDUXlITmg4ZDRMbFlBY3BqcUh0Sml4?=
 =?utf-8?B?RXpTb01ueUpWeVJISGpycmpaZWlENUdLYnFhMzJYNVVGSVV3R000TnJzY0Q1?=
 =?utf-8?B?RStKYUkvQTZVNVl0cnVYa3RnVk5GaFNSNFpTVDZKTDBWMG5GTFoyMVlJaW5j?=
 =?utf-8?B?L1ZQemxCazFiNHkwNWtGQmUzS3lRR0psMG9yTWtEWXVSRjRjYWFDSTBCZTRz?=
 =?utf-8?B?UzBQQmdmZis1cGMxbVBTMHVtcGhyWU5saHRKaktka0N0dXpqajFzNmVpTFNp?=
 =?utf-8?B?ckJyekJQSm5HYW0yTE5LZlBkWUhoaTdMSUV4eHg3YVVpbzBXK2NHRy9ZR1hW?=
 =?utf-8?B?b1g1Z293Y3pvNFVXZ3pqRzJBUHBYU2swOGRYb1ZQY3g5ZmJrOTQrQnkxem5v?=
 =?utf-8?B?NHE1T3lnNDhwanF3b1RmVVJGMTFJcmFuVHFsU0V6cDlOWWJkYjcydm8yU3Zv?=
 =?utf-8?Q?MfyjAv+vsqgeb2RR62SHzIZLqA2f7ocL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFBEC4B1F8E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?am13TnhtRGc2NUx6aTUrd3YxaGtSNzgxUENZYWw3TWF4aWJJamwwMGp0VkJO?=
 =?utf-8?B?VXBTRE9pZGJxSUZRbWkzdlJCNlNCbUlySC8rUGVhTlQvMEJxZTZWb0hoKzRO?=
 =?utf-8?B?bnk2NXJFMGJzRGcveHAweU03c1JHYVgwUHZFWDdJUWlMQTZjVUhpT2J3Mk1y?=
 =?utf-8?B?bkNKMFUraEJBdFQyZ2c4d0diYUx2UkR2SHQwMG1teUFpODlZSHNIVzhINEFY?=
 =?utf-8?B?ZmNBbnRyRnJWejJQQ2prd2VBUWFZZVJHU2J5MWFoaWRIQnVtR002L0JMdHpU?=
 =?utf-8?B?aGlTYWswZVNFSWNHYVZ2WkFydHJvV1A5Q3FMZWVkVGNIUmRmamhTRndoZFYy?=
 =?utf-8?B?UFFUSnBsNTBVVDFUNXV3ZGRHWmN6WUI1dVBkaGpkQUY2OWs4OURNa3kzNXY1?=
 =?utf-8?B?QXY3bTAvam5WWEwzc0dvT0swWjdveGEvekJSWjZ5bnNNdm5lU21aUTVFS295?=
 =?utf-8?B?azR5SGYvZUI4WEJGMHVEcUJpd2lPeSs1bzBTRnV6Ujk0ZStBR0tJV085WjBz?=
 =?utf-8?B?eitaeFUycFlvU0pvRGc4VTNyZmtza2JDMm94ZmE0VFFzc3QzZEFVVTloVit4?=
 =?utf-8?B?U3VoTzF6TTJRYnNmeHJPV1NpNnQ3YWZubjlDK3gxcjM0MFgvai9hMDNoOE9k?=
 =?utf-8?B?cmJhd2wvdHRsSkpaY1BjRTJxbnlMYUcvTHlFa1RURlQwNVY4QW9XTWpGdTFD?=
 =?utf-8?B?dCtKSEdUVzJPaC9rYk9SL2RIbXFXRU5qUlF1c0NJQXlzWElHdlpvSFEzTTZI?=
 =?utf-8?B?QUxFOXk2eXpsTEpwUXRaK1hiazdBVHRtT3p3YTN0bWppdG1FUGFrc1ZsMEhl?=
 =?utf-8?B?eG5aaW12akpEODFMYmVXUUNxVTk1VHBMb1RqelVCZGxYOG9TVHNWWCtpN1Rq?=
 =?utf-8?B?SWh0dG54NXNsbGJyNkdFRitseUVoczhUY0dvdmJlbkI2Sm1IVmhxSXZYMU1m?=
 =?utf-8?B?ZS91Vjk5eElILzRTTGx4LzN3VVJSZnF2eTh4MEFvZ1ZHVVF5VVA3UXJreHhz?=
 =?utf-8?B?eVJxM0lLMjZKbHlMamRmNnZoK1ZraUVOVjBueW9aNElvZy9EMlJocXdEVWRz?=
 =?utf-8?B?K1FjMFBOdHl3YkJKY2ZKZzNZaUFXV1ZZU1RRdTJpN05Md3JteGsybHcwSnJI?=
 =?utf-8?B?TndwRDNmV1JGdFJkMkhGbXYwaXhTUVFHbHVqak1DZnlhWDJGbFo0WERmckpM?=
 =?utf-8?B?L0dFanUydDhWeGN6WTQwd0NjZ2lkOE5QVmo4ZnR6Wm5SbCs0NUkrWnlPUFlM?=
 =?utf-8?B?NXhxVWlrMXRNdHhaZ2xvbXl2dzRBblJxNGNiaTlmbHZwL0dRN1BpQysra00y?=
 =?utf-8?B?RG9zVVUwT0dRVWV3eU0vSlVYK0FxKzJ3bnVlWUpBdC9PMVA0anVid3VKc3g5?=
 =?utf-8?B?YlMwKzlGMDRkRjdvVFlXWWN0UFh1cXc4MW1nMWpNNnRWd2haeVRPa2Fad0d5?=
 =?utf-8?B?dHk2SEluaTVSSmVQQ3ZUQVd6dERMem5NcjVyajlHVlM3WSt0bkVQM3NjcWZh?=
 =?utf-8?B?SVo2YncwakozMGRwY292eE56RDJPTGVVNHNXdGM1Ris5V3d6ZllsdlBTaHQ1?=
 =?utf-8?B?Q1gxSU9idWtJUWtyVzl1L25FZWlTcHNxKytjdDZEdmVIN2h1MlpwVnUyaFl6?=
 =?utf-8?B?VFR3SUMvUVJMTUJ0Q0lSZ3VKejJMQmY4UmNOWnhvekV2akNzQWkyRlFiK3l0?=
 =?utf-8?B?cTgzbG1FeXBia2R2ZFNPZGRoNjFONE10akw1L1ppM1JQcEkzdXR1dCs3NHYv?=
 =?utf-8?B?MkxraC9kb2tKOEJaUzVsYmxhcHRwSGx0L3dZNzRsOS9XbFZZTWdNa2pFVjZy?=
 =?utf-8?B?bFN3ZUpqOHhnS0FhbEd5MHNLYjVtZ1NXR0xja0ZaaThrQzEySXBNZS9pTVBv?=
 =?utf-8?B?d0R5V0pudTR0aUg1OHdwbkFXU1M1VytkQmkvcUpSSDk4NDZDRWE5aDk3bHp2?=
 =?utf-8?B?bk95MEU0dXFoS2NFU2owZTRmMU5GZ1lNalBNUHVLM25JOVdLMTZORHpGOU5v?=
 =?utf-8?B?ekJCNE9jWXgycWRkYlVycHhxMlRiVTFZWGlKWHJUL2I3NlhsWGJDU0FHbkZS?=
 =?utf-8?B?aFFxMGdYNm1hR2FzLzJGOWozL2h4Q3VzdDZRL1RFaFFoMSsraE82T25tbVl0?=
 =?utf-8?Q?9I2w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53AA816B4A575345B06137AF1FDC4B9D@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFBEC4B1F8E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7461074d-1a63-493a-cf96-08ddb37a7612
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 23:54:30.4115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWMO1wVafn0xqtHkdsaCqv5EWFtQMl1J/d4DmeugmL74WMdiY2meHl8rEdV+uN9C7nzEBtZpS98A7byJ43+2+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB5387

T24gNi8yMy8yMDI1IDExOjM0IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4g
T24gMjMvMDYvMjAyNSAxOToyOCwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPj4gKw0KPj4gKyAgbmdw
aW9zOg0KPj4gKyAgICBtaW5pbXVtOiAxDQo+PiArICAgIG1heGltdW06IDMyDQo+PiArICAgIGRl
c2NyaXB0aW9uOiBOdW1iZXIgb2YgR1BJTyBsaW5lcyBzdXBwb3J0ZWQsIG1heGltdW0gMzIuDQo+
IERvbid0IHJlcGVhdCBjb25zdHJhaW50cyBpbiBmcmVlIGZvcm0gdGV4dC4NCj4NCj4gTm8gbmVl
ZCB0byByZXNlbmQganVzdCBmb3IgdGhhdC4NCg0KR290IGl0LiBJIHdpbGwgcmVtb3ZlIHRoZSAi
ZGVzY3JpcHRpb24iLg0KDQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IDxmb3JtIGxldHRlcj4NCj4gVGhpcyBpcyBh
biBhdXRvbWF0ZWQgaW5zdHJ1Y3Rpb24sIGp1c3QgaW4gY2FzZSwgYmVjYXVzZSBtYW55IHJldmll
dyB0YWdzDQo+IGFyZSBiZWluZyBpZ25vcmVkLiBJZiB5b3Uga25vdyB0aGUgcHJvY2VzcywganVz
dCBza2lwIGl0IGVudGlyZWx5DQo+IChwbGVhc2UgZG8gbm90IGZlZWwgb2ZmZW5kZWQgYnkgbWUg
cG9zdGluZyBpdCBoZXJlIC0gbm8gYmFkIGludGVudGlvbnMNCj4gaW50ZW5kZWQsIG5vIHBhdHJv
bml6aW5nLCBJIGp1c3Qgd2FudCB0byBhdm9pZCB3YXN0ZWQgZWZmb3J0cykuIElmIHlvdQ0KPiBk
byBub3Qga25vdyB0aGUgcHJvY2VzcywgaGVyZSBpcyBhIHNob3J0IGV4cGxhbmF0aW9uOg0KPg0K
PiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9z
dGluZyBuZXcgdmVyc2lvbnMNCj4gb2YgcGF0Y2hzZXQsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2ln
bmVkLW9mZi1ieSB0YWcsIHVubGVzcyBwYXRjaCBjaGFuZ2VkDQo+IHNpZ25pZmljYW50bHkgKGUu
Zy4gbmV3IHByb3BlcnRpZXMgYWRkZWQgdG8gdGhlIERUIGJpbmRpbmdzKS4gVGFnIGlzDQo+ICJy
ZWNlaXZlZCIsIHdoZW4gcHJvdmlkZWQgaW4gYSBtZXNzYWdlIHJlcGxpZWQgdG8geW91IG9uIHRo
ZSBtYWlsaW5nDQo+IGxpc3QuIFRvb2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZSAoJ2I0IHRyYWls
ZXJzIC11IC4uLicpLiBIb3dldmVyLA0KPiB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNo
ZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4gVGhlIHVwc3RyZWFtDQo+IG1haW50YWluZXIgd2ls
bCBkbyB0aGF0IGZvciB0YWdzIHJlY2VpdmVkIG9uIHRoZSB2ZXJzaW9uIHRoZXkgYXBwbHkuDQo+
DQo+IEZ1bGwgY29udGV4dCBhbmQgZXhwbGFuYXRpb246DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjE1L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLnJzdCNMNTkxDQo+IDwvZm9ybSBsZXR0ZXI+DQoNCkkgd2FzIG5vdCBhd2FyZSBv
ZiB0aGlzIGJlZm9yZSwgYXBvbG9naWVzIGZvciB0aGUgc2FtZS4gSSB3aWxsIGFkZCB0aGlzIA0K
bGluZSBvZiB0aGlzIGZyb20gbmV4dCBwYXRjaHNldCBhcyBwZXIgeW91ciBzdWdnZXN0aW9uLg0K
DQpJIHdpbGwgdGFrZSBjYXJlIGZvciBhbGwgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuIFRo
YW5rIHlvdSBLcnp5c3p0b2YuDQoNClJlZ2FyZHMsDQoNCkhhcnNoaXQuDQoNCg0K

