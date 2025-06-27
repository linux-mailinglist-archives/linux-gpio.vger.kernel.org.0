Return-Path: <linux-gpio+bounces-22357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35EAEBE88
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 19:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282853BC709
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88862951CE;
	Fri, 27 Jun 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="nnMtD3gz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2126.outbound.protection.outlook.com [40.107.93.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD75312E5D;
	Fri, 27 Jun 2025 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046137; cv=fail; b=GLZJBGDHP4eUXXtfZJ9NB+/9zkSB6zteKDMYoXKLp6zG/QmbnVh8sGX3BLeMQV9OWfU5DXssXifuEngaaaYF8YH6ec8OEz9iYbNKL8iFE/vSxR6/jjl11LUMdzuT39Ucpz7Mqjil5JELicqPxMm14w7EQNh1SjTaph5ND4el5dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046137; c=relaxed/simple;
	bh=K8XkuJIMfZpOFSkYtQ/kwvz2WbPdvjJgksAqlUEk4eg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HTo5P/pxrV6YtxJrAnYAkPQuBUSoF6EFzhmIkQtIgfwWhe7w2gVbWUsob8wZzQ/y1lZPFEv+4ca1TRc7zG/Ea0XgqfbCauF7k5rUvUAFzVM4afsIoE+Xgr3REXFjPpNQoWE4tvs1gSUm4wXSvNn3vozN1nAGzi+/aBbxVN4f6uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=nnMtD3gz; arc=fail smtp.client-ip=40.107.93.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5lnCITr6sM4P4RWI12eEQ/pGWmjD4aiSDgDOhEXn3rdgjJktYNM7LSaZFHT9dL2yFh9C02XcNRpN7Jkd5/IbwnO4if5r9s4RH9DgxDxVmeFDtdzWIDcL8DqEWeK58iW/DajEYB3+eVTUc8lAgrSKtB8MHXQHxQgRfauPi6/qBxVTvGIRGj2BnWoe+FFaiuogvZuI1MwyU7XSfpe0ezZeJFnJaL5ft4CBlid0vzYmBUG8Z4zXsCPRo10GQj2WkUKYwhOiThAIelr/zG7S3KFYhz+Fac+qyMeZgNg9VZwefPnSqY3jL1LnQeypQ70wYCppTn5iz8ItTbLClsfuzVZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8XkuJIMfZpOFSkYtQ/kwvz2WbPdvjJgksAqlUEk4eg=;
 b=CdzNXU5I/eyJuC6J3AKQUswEJdp/neK41lL7UWxrhQVTfot7sUxD0blak7iMBj4Qb1fBFYGnz2+wNqvBAx85vt6gJSdZSlS3RlGZ/ZJCxR8tbw4EUwhsifEGn45VMq+Afk86gYYVCB1BwnLysl2c1zIiV0+2NFd5e+lJtUynDh7RzCGa/7kzKnCBVG9W9cndzAfT4/8hziuEzYCpC37d3BFly5/6uPkPxHTvov4ddHKsqAiIIXLalHzP1yULqSwxmDTsxgpC9rQeQwQKqXNfpH+P1YckwJEk86xvL6v/SfcOUj9HNwZVUNNsJrR2ccf6EpGEfjqHg7k+PvW+yza99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8XkuJIMfZpOFSkYtQ/kwvz2WbPdvjJgksAqlUEk4eg=;
 b=nnMtD3gzPoraQR+9UKKk2KLpBvmR06uiZSHs8/g1Ukupq7u1s7EdeXANRgh0Bom5s36hHTuK3iMSQgy22pR+vFzYkSGMxEGt+f7v/AJtybiUz2nVIhH+rADvCfmeAFd9EKS3V16p0Rtev0yIgkOkqvLy/ot2XG3LAIlwK7lnYEgofcHNJRnOgxHAqotmSFhZvrOkoEJHpjA20KF04mJSL0KDK2vOyng0FYLDUrMzy5buzfTWfy5n60xOwQOB3VDEoxPjeREcK/skx66656GgqYmpaZKOnbAjCoXBnPYS3JHFYCJ7lcjD3eldnIAL2LDpw84BTsYLnIrrDYlI5TnrtA==
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 (2603:10b6:518:1::cbe) by SJ0PR18MB4092.namprd18.prod.outlook.com
 (2603:10b6:a03:2ed::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 17:42:12 +0000
Received: from PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161]) by PH3PPFA7616390B.namprd18.prod.outlook.com
 ([fe80::a2b2:22f9:65da:3161%5]) with mapi id 15.20.8769.035; Fri, 27 Jun 2025
 17:42:12 +0000
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
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
Thread-Topic: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for
 AX3000 SoC and eval board
Thread-Index: AQHb5GREkMWleVUwnEujC+sUqBlKs7QR3j8AgAFHOACAAEApAIAD5zaA
Date: Fri, 27 Jun 2025 17:42:11 +0000
Message-ID: <a6192621-be40-471e-b1ed-bded46fd9eba@axiado.com>
References:
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
 <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
 <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
In-Reply-To: <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFA7616390B:EE_|SJ0PR18MB4092:EE_
x-ms-office365-filtering-correlation-id: 0f1d8541-9883-4dd3-e40a-08ddb5a1f287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVk2RHlXQTNETjZVRW5ScVVsSlJ6S3JmUFQvaFVIM3FKVGQzWlZOWXIva2Zs?=
 =?utf-8?B?eHRGMktwWWZ5MzJ5SXA4bHd5Nit5bE5MMmczZUI3QjdjNzhKdlVaekFpZUpD?=
 =?utf-8?B?WEwvbGMvTjA4MEd6WklxdDRqM2c2bEJUL1NXNEVkM0NaUzRKa1JsWDYvS1pw?=
 =?utf-8?B?ekppdGNvZDNuTHN2a21sUmFSSm13Wm8yN2dUOEtzeDlBbTlEQzMrbStaTElV?=
 =?utf-8?B?TkczM3RGQzlSUjZadG1TeGVUYUQ3TUxOYk5JSHNhcFYzWFhhZjloYUJiWFN5?=
 =?utf-8?B?UGdzbnp2ai9NQWM0cTJka3RUVWp0cjZ2RW1VTUZ0ZTVzVHdTZXlIbzZMcXl0?=
 =?utf-8?B?Vy9pdWVJMHNHRHdOWDdYME8vdEN5L2JTUDVjdzYvdENJU1VLOWVidlZrcThr?=
 =?utf-8?B?SmtKYUI0cW9NTWZmOCtMWVcrRDVJd285dEhkUmw5a293aXdtSDMrblEwYTli?=
 =?utf-8?B?bDlaNnBVS3FES1d6aHIweDZxVlFOaHdFMHVUYmVaTWxWOTJ1aWhHRG1NVlJJ?=
 =?utf-8?B?bzdpYXNlb1B5V1hCaldNbHgwQzQ5VVpmbEVVNjFETkpDcE9aM2ZpeHVUWWc3?=
 =?utf-8?B?WjdkZEtKZC9tbFhhRmxZRW9FOU5DdjBaTlVFOVNrRTRXT2VSS0pvZXBqUG1U?=
 =?utf-8?B?OVB4V05pc1R5Y1hpdTN4T1NqSjhpdWIzK2pnVWpaTVdGNy84d1dmVFZmTHhl?=
 =?utf-8?B?YWJVajFPYm53V3AvTCtLUGxwc0l3T1hrSlRYcHZEOURuTWp5K1ZGcTFwYkRj?=
 =?utf-8?B?dk1OVlltZnQvMnpvSTg1NmszNWpKeG83Z2dIVzgyRDFzcC95em9xUVBYTnZr?=
 =?utf-8?B?T00wSEVoWVhycXRIRmozbWhiajZzbjBDcXExUEZPTWF4dEU1aXJzTWRqZnFQ?=
 =?utf-8?B?YmZuT1Z3SUpaM0F6RTQ5V0tYNmVWemhMbnpyNFloOGZraGt4UTlMTkh3S3N3?=
 =?utf-8?B?MHZnRm00b29BS0FwMWx6V0xPb04weENnRmlpenRGbVhUYVlBd2ZleVNzd3ZY?=
 =?utf-8?B?OFRCbU85OUc0bnk1cVpZRUUvS2F4NkI3b09zZE1qM0NhOGljelB2aDZ6YXNS?=
 =?utf-8?B?NU1ndEVpSVlpVmlQQnZMUW43bmxVeFNGTmdmbEhYdkNmZ0lLRnB4aGcwR25v?=
 =?utf-8?B?TzdrZFV0Z1hRVldmL2s4VU1TZlNzT1dncWtpdEk5MjB4UGZpR005ai94ZDhz?=
 =?utf-8?B?cFBMZ25tNVNaelQrVDU0MW9DeEkyUUNwQ1dVS2pZYjVFL3dHaXh5VWlHak9J?=
 =?utf-8?B?UjFxelFXTjdRZ1dQRjV5Z3N0NGdGOXF0N0lRVlVJZFJtdlVlcFo0Q2tGTVRt?=
 =?utf-8?B?VGIvNnd4S3B2NTN2Y29RUllrd3RDSXI2M1BCVXFkVE9wMGdDaG5uYkxtQ0ow?=
 =?utf-8?B?blVIcVFZbC82S1Juek51VUkyTTd2YUUvKy9qMGh4OXE2cm9Nb1JvRG1mZVgw?=
 =?utf-8?B?VHlpZE9RaWFHM2NQN1hFWGRNdUVsaGVadU5qUnNXUWtBWjFBRnh6UkszSFJj?=
 =?utf-8?B?VkxqUmRielhHWEdRd2ZwWnRQUDh4UnYzUk15RUZkaXJ3QVdpN2ZrY2FHWVVY?=
 =?utf-8?B?TDIxWG80d1M1UEdQdGk0dXhZd09zeXlncFlPRGhHcTdiVE45TWc1WG9qV2RV?=
 =?utf-8?B?czdUa0tTVFlmQzB6c2RrMndrOURVVVVsNFBBUEhycG5zOFhBNFJkYnI0NlZk?=
 =?utf-8?B?OC9teTlsVnMzY25LZ0hGWlhsZ213VzdlMXlFQ2dpNkpuS3ZDYTArNURnbzRr?=
 =?utf-8?B?MWtab0x0UzB6VGpwbTVGekhEZEZ1U2taMnFQcXdHT1JKNy8yRUpQOGI4NnpO?=
 =?utf-8?B?R3ZVSG9QSFNUeHhFTnBERUQxZ3hUSE5nUTNmekZFR0JGSW1YNSsvSFpmVTho?=
 =?utf-8?B?dlgreDZsRlNLaDBQcHhlOTZKL3dYOGpIdDQvUDB6UjczRzV4R0V2alpKTmRX?=
 =?utf-8?Q?7HBDQG+Q9mJQX/65IHiaPeC4lBhQhkL/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA7616390B.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHFlbXFFTUlHR2lnbngvSTh6eHBhTmc3b0xNcGF0aTNwZVZoamZqeGhnTTZv?=
 =?utf-8?B?VVdjSjhBaW5EbVFiMnRyWnY1TmdRb3J6YXlKdXlHSEFEQm0zeDZTbFJWbFg4?=
 =?utf-8?B?UW8zUzBsTW1TUEJ0UXBnTzY2SWRweis0cVd5VGRMRG9uYnNUMSswcGRkaFZk?=
 =?utf-8?B?MnlXanVLQ3Q1dmRPQmhCdjE2MTR2MmptSzFqUWN6WFlSdkZ6MVQwV0FUWG55?=
 =?utf-8?B?cnlmWjNOaXZhMmdpeVJHRkNPU056MDBMK3I0aC83L3VsZmErTC9sK0l3UjdG?=
 =?utf-8?B?bjZ4RGFsc3hDa2RnNjBHQVpqZmxZa2s5K3B3V2hzTXJUbVk5aG9TME5UVjQ2?=
 =?utf-8?B?YlZwSC9GWXFPVmFzNk80T2c3cDVOY1c2T2s3VGZqbFNPZE0vVS8wd3IyWXhQ?=
 =?utf-8?B?bHc2RFlRRmdUQVhYbzFtMVpqTS9OSHJuZXJHeDlwWnR6NWNjY09NbHE3ZWlL?=
 =?utf-8?B?VGhhVHdSRmkvSEx2RDY0eUxxZTUwcnR0T2FzYlV4dEhXUkVYU3pzazVrVEVG?=
 =?utf-8?B?N3BFeWFrd1hRTlhWWFhPMHBPV3J6OE5oZC9tSTczdDlHbTZhTTNOdU44Rkkr?=
 =?utf-8?B?Yy8zZk1yRDJ6dmRHNTJEeU5yclFFNzVScXpYcWZ5NEowVS9EZUVreUdXbC9F?=
 =?utf-8?B?Z29RN3NPdXdOMDJCNy9GelB6ODEvSHRiZW9qRWE3ZW9xQmppT1dvTk54VUwx?=
 =?utf-8?B?Slc2YVBVUFlleXhQZllwdm03aStjMmVURGJ0UUpsY3lwalJoMndPSXRaOTVK?=
 =?utf-8?B?RlhHWmpITzB3TEtPMUFKbEdoaVh1YmwzVzE1SksrQUtHZUwzL1ZVb1VaalBy?=
 =?utf-8?B?NnR2ZnFFaWYxMWJCdlJuQW1UMTVnRWlQRDY1KytaYXhmM0xxMVRscnBPdUx6?=
 =?utf-8?B?YVF0RzYwRkRTZzNkd2VleHhpMzdzaDVwYS9aOFBUaERiRmJRM3NBb1ZyekFH?=
 =?utf-8?B?U2NmNkRZTVNFd3pFb1g2Y0hucFRidGc0K0tLZFFXQ0NVNWpneXFYekI5V1JV?=
 =?utf-8?B?Nm5KSXhrNVNITlBlKzhlSGo5MWV5QWlVL1lOUHBYWHltZFNMZHRJYkdMalNs?=
 =?utf-8?B?K0plWFpxTEw0R1ljTlBXa3BnbmtNTUxSdjZYQlBCeXZyZnFSSElJalZKVG5i?=
 =?utf-8?B?WGtDbktIQmlTOS9XWnhHODlCNk1HbDNHb1VKQnM4WVdMcWMzWEFRZERTZHU4?=
 =?utf-8?B?TGdPK2J1eWNpNU51QzFlMjI3a0J4Tm1YUGs2NjB5VjliNWdNNW1GMHBkeEYz?=
 =?utf-8?B?a0hHWnd6b1c5endBNlVqc1ZETTdVWkN2ckU4c21EWFMrQTBNOHIxSGgrSC9y?=
 =?utf-8?B?akZOQUo2cTdvbHVDRXJ0SWl0Nlp1R3ZoQTZDaDJiczEva1Z6ZW1HaWFNek1h?=
 =?utf-8?B?QU1kTGVYTGVlbWZVemM0V0w0WDBEY3FGazlpeUpzUTJDcEg4aHFGWXVmUktO?=
 =?utf-8?B?TjBBcER5RUhoa1hrVFBrYVNiaVpkaDByMktUcFNjeTlKV3E1aVNsR1RZZWJh?=
 =?utf-8?B?YlY2T0VUQ0dMVmZnQTlzVFZWZnRZbEl1UFBUVjhlY0Z5UGIvYzZiY256MWdm?=
 =?utf-8?B?bytFNFkxUXdXOXNSR0pwbFRqNHJMTjQ3WjhDakRpNXlOWnU0OW01TGVhcmVH?=
 =?utf-8?B?MDVkWVZzSnMrR0pDdVN2ZjNxT0JiMDVpNFRsRTF5K1JZeFloZmlaMFJyV0FD?=
 =?utf-8?B?RXZZRlZJZHNMR0xVNGxLUWhpNi81ZkFxL1MyMSs0OWVnWVd0c3FaRUk1cG1z?=
 =?utf-8?B?dUQxbW5JdnRjdWdndEhjMnZ5Z0tQazYxMk9aSmNGWXFyVmFlS2tsNjk2ZTl0?=
 =?utf-8?B?TFJDVlZrS1BzbDBRNGQxS0VjVlo2UVRFMlRsOG5zeWlFRk80WTN3Q3NtMS9O?=
 =?utf-8?B?eXhJWmhUTjhPZVFEam50eVc3NWRLanJXbEw4bENndklDc0VxeGRxZkJlVFBt?=
 =?utf-8?B?cmpUaTlCTXUrenVPSFhnQ1J5bUNWdWcxRTlPYnhkVExDSjZsM0ZaTElCSm1y?=
 =?utf-8?B?RFhKSmx5ek5ocHJHQTVRQlZZdElvL0RiVDN0NkpiRUVramRiOVI2a2ZFWGY2?=
 =?utf-8?B?cHZncVFtdTlLdzFmdnh1U0U4SVFXYytpNWxzS2xwRlJjT3FhNWdaWVMyemxp?=
 =?utf-8?Q?gVZk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BB047FE7DEE5D4082A9723D633609B7@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA7616390B.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1d8541-9883-4dd3-e40a-08ddb5a1f287
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 17:42:11.9678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9qVa5VCOUwGzSxGqsbIPyki/to6dXWTMz6WCe4gmKAZ6coYmBuxG+hZHHVlFkIC/ffF1Jait9HamoMqAxsNhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4092

T24gNi8yNC8yMDI1IDExOjA1IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4NCj4NCj4g
T24gMjUvMDYvMjAyNSAwNDoxNiwgSGFyc2hpdCBTaGFoIHdyb3RlOg0KPj4gZ3BpbzA6IGdwaW8t
Y29udHJvbGxlckA4MDUwMDAwMCB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiY2RucyxncGlvLXIxcDAyIjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MDAgMHg4MDUwMDAwMCAweDAwIDB4NDAwPjsNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY2xvY2tzID0gPCZyZWZjbGs+Ow0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM1MDA+Ow0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTgzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+Ow0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RhdHVzID0gImRpc2FibGVkIjsNCj4+ICAgICAgICAgICAgICAgICAgIH07DQo+Pg0KPj4gSSBj
aGVja2VkIHRoZSBkb2N1bWVudDoNCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjE1L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHRzLWNvZGlu
Zy1zdHlsZS5yc3QjTDExMi4NCj4+DQo+Pj4+ICsgICAgICAgICAgICAgZ3BpbzE6IGdwaW8tY29u
dHJvbGxlckA4MDU4MDAwMCB7DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImNkbnMsZ3Bpby1yMXAwMiI7DQo+Pj4gVGhpcyBzaG91bGQgbm90IGJlIGFjY2VwdGVkIHdp
dGhvdXQgc3BlY2lmaWMgY29tcGF0aWJsZSwgYnV0IHRoYXQncyBzb21lDQo+Pj4gb2xkIGJpbmRp
bmcgc28gbWF5YmUgbWF0dGVycyBsZXNzLiBBbnl3YXksIGlmIHlvdSBldmVyIG5lZWQgcXVpcmsg
b3INCj4+PiBjdXN0b20gcHJvcGVydGllcyB0aGV5IEkgd2lsbCByZWplY3QgdGhlbSBiYXNlZCBv
biB3aGF0IHlvdSBjbGFpbSBoZXJlLg0KPj4gWWVzLCB3ZSBhcmUgbm90IGNoYW5naW5nIGFueXRo
aW5nIG9uIHRoaXMgZHJpdmVyLiBJcyBpdCBva2F5Pw0KPiBJIG1lYW50IGZvciBmdXR1cmUuIEkg
d291bGQgZXhwZWN0IHRvIGZvbGxvdyB3cml0aW5nIGJpbmRpbmdzIG5vdywgc28NCj4gaGF2ZSBm
cm9udCBzcGVjaWZpYyBjb21wYXRpYmxlLCBidXQgaWYgeW91IGRvIG5vdCB0aGVuIHdoYXRldmVy
IGlzc3Vlcw0KPiB5b3UgaGF2ZSBpbiB0aGUgZnV0dXJlIHdpdGggdGhpcyBkcml2ZXIsIHRoZXkg
c2hvdWxkIGJlIHJlamVjdGVkLCByaWdodD8NCg0KQmFzZWQgb24gdGhlIGFub3RoZXIgZGlzY3Vz
c2lvbiBmb3IgdGhlIFVBUlQgbm9kZSwgd2UgdW5kZXJzdG9vZCB0aGlzIA0KYmV0dGVyLg0KDQpJ
dCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2UgY2hhbmdlIHRoaXMgR1BJTyBub2RlcyB0byB3aXRoIHRo
ZSBiZWxvdyANCmNvbXBhdGlibGUuDQoNCmNvbXBhdGlibGUgPSAiYXhpYWRvLGF4MzAwMC1ncGlv
IiwgImNkbnMsZ3Bpby1yMXAwMiIuDQoNCj4NCj4+DQo+Pj4NCj4+Pj4gKyAgICAgICAgICAgICBp
M2MxNjogaTNjQDgwNjIwNDAwIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiY2RucyxpM2MtbWFzdGVyIjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAwIDB4ODA2MjA0MDAgMHgwMCAweDQwMD47DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICBjbG9ja3MgPSA8JnJlZmNsayAmY2xrX3hpbj47DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICBjbG9jay1uYW1lcyA9ICJwY2xrIiwgInN5c2NsayI7DQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM1MDA+Ow0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkyIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPj4+
PiArICAgICAgICAgICAgICAgICAgICAgaTJjLXNjbC1oeiA9IDwxMDAwMDA+Ow0KPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgaTNjLXNjbC1oeiA9IDw0MDAwMDA+Ow0KPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7DQo+Pj4+ICsgICAgICAgICAgICAgfTsNCj4+Pj4gKyAgICAgICAgICAg
ICB1YXJ0MDogc2VyaWFsQDgwNTIwMDAwIHsNCj4+PiBMb29rcyBsaWtlIG5vdCBvcmRlcmVkIGJ5
IHVuaXQgYWRkcmVzcy4gV2hhdCBpcyB0aGUgb3JkZXJpbmcgcnVsZSB5b3UNCj4+PiBhcmUgZ29p
bmcgdG8gYWRvcHQgZm9yIGVudGlyZSBhcmNoPw0KPj4gQXBvbG9naWVzIGZvciB0aGUgY29uZnVz
aW9uLiBJIHNob3VsZCBoYXZlIHVwZGF0ZWQgaW4gbGFzdCBwYXRjaC1zZXQNCj4+IGNvbW1lbnRz
Lg0KPj4NCj4+IFdlIGFyZSBmb2xsb3dpbmcgYWxwaGFiZXRpY2FsIG9yZGVyaW5nIHJ1bGUuIElu
IHRob3NlIHdlIGFyZSBncm91cGluZw0KPj4gc29tZSBub2RlcyB0b2dldGhlciBiYXNlZCBvbiB0
aGUgbnVtYmVycy4NCj4+DQo+PiBjcHVzDQo+Pg0KPj4gY2xvY2tzDQo+Pg0KPj4gc29jIHsNCj4+
DQo+PiAgICAgIGdpYzUwMCB7IH0NCj4+DQo+PiAgICAgIGdwaW8wLTcgeyB9DQo+Pg0KPj4gICAg
ICBpM2MwLTE2IHsgfQ0KPj4NCj4+ICAgICAgdWFydDAtMyB7IH0NCj4+DQo+PiB9DQo+Pg0KPj4g
dGltZXINCj4+DQo+Pg0KPj4gSXMgdGhpcyBva2F5Pw0KPiBhbHBoYWJldGljYWwgb3JkZXJpbmcg
aXMgbm90IG1lbnRpb25lZCBpbiBkdHMgY29kaW5nIHN0eWxlLiBNYXliZSBpdA0KPiBzaG91bGQs
IGJ1dCBJIHRoaW5rIHRoZSBvbmx5IHVzZXIgb2Ygc2Vjb25kIHN0eWxlIHdpdGggZ3JvdXBpbmcg
bm9kZXMgLQ0KPiBSZW5lc2FzIC0gc3RpbGwgdXNlcyBvcmRlcmluZyBieSB1bml0IGFkZHJlc3Mg
aW4gZ2VuZXJhbC4NCj4NCj4gVGhlIHRyb3VibGUgd2l0aCB5b3VyIGFwcHJvYWNoIGlzIHRoYXQg
aWYgeW91IGV2ZXIgbmVlZCB0byBjaGFuZ2UgdGhlDQo+IG5hbWUsIHlvdSB3aWxsIG5lZWQgdG8g
cmUtb3JkZXIgYW5kIG1vdmUgZW50aXJlIG5vZGUuDQo+DQo+IEFueXdheSwgbm90IGEgcHJvYmxl
bSBmb3IgbWUuDQoNCk9rYXksIFRoYW5rIHlvdS4NCg0KDQpSZWdhcmRzLA0KDQpIYXJzaGl0Lg0K
DQo=

