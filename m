Return-Path: <linux-gpio+bounces-7707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE6917B09
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430D4287848
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 08:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94FD154458;
	Wed, 26 Jun 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Eusermv+";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="e644/4Im"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1D153801;
	Wed, 26 Jun 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719390785; cv=fail; b=LOTvsmp9AaKPqwwErADcxNaYMayWOoCVvz/lI5NNbqiR0jhPu6G1EfJXIVIas7CxcAJTGz+NDxXApPuS6VLlSuWreDWJWMkidDqmAeuvCnAEC/8bFOsOH+aDH55zk51/Ms2nCXhRS8NLrzIgUgMsRjKlsPhlRax6IZL0XCl3Bwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719390785; c=relaxed/simple;
	bh=EwfNXHAkG2DZ2gr1G6LxQxeBg9n1q+ch89BmhciG7lo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bWIAF6QN9IMumr9HfeNsRmpC9BhUjggLwN/4C70KQRPNWvBLLZw5WDo97b01BqjwySLDHEF5KUV9a+nmlsPJC9dJkRQ7eIS2FgZRLowGXEJoAOxizOokf38VqyNwqYpoJg7iCnlATsMHRh7PVGIuBk2lnfcqBHSPi+aZxI87Wmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Eusermv+; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=e644/4Im; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719390782; x=1750926782;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EwfNXHAkG2DZ2gr1G6LxQxeBg9n1q+ch89BmhciG7lo=;
  b=Eusermv+MU7Yg51Rj/BAH0Og5ZklkxlpXbhJxA4B2uwlqKlCvunQZslo
   JF2hPpuXia45D3a8nUocbeCyr1qQ4UfZBpZpn8SZpgm7/x5HJEnCdh8QU
   tAfmOW92QJqsaXXzbqxzeFHgrqVpLEPcufRND1JbqXtdWEAYuexxCB83R
   WuzUW82cV+Bu0AZQSejaq78Je2VUG5MgKHyyhycvyI1kzFIEOa9hP6JuP
   bC5uTIyC/pZMKJtA42Ridj/qX4gciAZ2zgIcYiX2oNzCyOdlB3IsvwRTi
   ovuI8OYNCPLwixUlZCC9eLY2uHSHRxNLfo5mjDmf8qdW25rTIfLJFssDO
   Q==;
X-CSE-ConnectionGUID: hu6vuEsSQAejv1qjR0w2rg==
X-CSE-MsgGUID: 5TE8pF5IQKWdAdGjTN05SA==
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="195910608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jun 2024 01:33:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 26 Jun 2024 01:32:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 26 Jun 2024 01:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAMAmcZfKvY/kRHjtDuTfcmSjEcoGvqHC9d8HZw9/9zniSFFB5e+RgOdnAeoqscf9Rx9wo1NVv9NTMs0vkZSRrg9rk7DwBIreBqmnLeqDYH+NydvLfKFzHL5tT6OrepWJOJCxkA6dC4sX8vedcOAJn2jEMW9dh0AyhYbb57ULs/zOU8upkYqWQwPAqvMQ7uJjmPzE6cOxF2WuVqRMpdwtIv6Kdw3UEDIjeSYwsFuk5hHThJyTTNPI3ixdtvrQ3kDd70u3GTaHgTF5Yl9yHNt4+l/D6CJv6T6LUMC+yrGuLhlOyubNodPvu0FpFb6DEOBuo7iduPTJQyWCkEXAlNOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwfNXHAkG2DZ2gr1G6LxQxeBg9n1q+ch89BmhciG7lo=;
 b=CX4cArBW8K2pLk6FG01YP/UsE0YEPk5P/Bw5oOwd3cs4mjWZ8F3G2XqRzV0nlqvNMu4XMzBPj+IQfq9MOyZB80fIcLHOY4NOmxOOlip7zgC/zsbK/YD8aSS1mJa1Ema/LKWrYnVBr8EVzl8PC4K0hFVH23eZh5O1L+8tzEOZUBpLT9TTGtypr9mu/+2hclq7n+tHJlElRr9rD6dfVeXu6+z2VP4mJx1LaHM+zbBmNVtAF/4Ycs2gCR0/2303Y8NQzsrl1JLx/TRG3iHfulYPZZmEjKbfWOiP+ZHYyiaGqjDhyATCmxee8XUNBnPTGeEC7aXZW0SZQylp1+c4F1InEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwfNXHAkG2DZ2gr1G6LxQxeBg9n1q+ch89BmhciG7lo=;
 b=e644/4ImN5McisGUs+T1yJ/Oo0Amj8JaSvIa9f+sUFod/cvXBQ52DsD9M/1UnxFfDDc3cUuQU5piIICOLrsUG79Wif4YgPMCvp6imeyQu/xgD/jON3YN4pJeEid8qlu3XnafbfULZPphr8bMjgFbuwwnskoMh7jRSTa+8Mc8XXJSriOkH4KUgLlZCbZ66daCk6byk2sTy1LOlNKD+bZpyWtHYrA2d1YV82G7BdMwTGCpTnLFL92xUgw6tS/sCNJvs5PJ0AKnoHQrNsV5rWTzutaLu9blDJu8g4QWyqgA0ewb0RJrZZod+7EC6XhkRP4gvq6mL2qk7D0gghK/l8IPhA==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 08:32:42 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 08:32:41 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
CC: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<Durai.ManickamKR@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Manikandan.M@microchip.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Thread-Topic: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Thread-Index: AQHaxrlS+Df6OrvTPEWeX/LKfYI4pLHYrbMAgAELqgA=
Date: Wed, 26 Jun 2024 08:32:41 +0000
Message-ID: <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
 <20240625-clerical-manicure-ebc8a1d1b16b@spud>
In-Reply-To: <20240625-clerical-manicure-ebc8a1d1b16b@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|PH7PR11MB6674:EE_
x-ms-office365-filtering-correlation-id: 89eb882e-d515-49a7-335c-08dc95ba8ba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|7416012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?NHlweVQ1ZmFTZlRaQnlXWVREL1RVRTBpbnd1U252bmpCbFRhdEtMaCtjak1p?=
 =?utf-8?B?azFnL0QwdWhHUFhvQzR2V2lhYVRQWlRVRGZmU05TczZEMkhYTG9Sb0dNSzdX?=
 =?utf-8?B?V3lUTnlFMmRUemZnbWthV1ZwVGtYV09WSXk2MzNScS9lMWxkYmNqSGFWVFFo?=
 =?utf-8?B?ZkJ5RXArRDVmRTFwM3hxWVRYVkZhZlg2N0tDdVV4YUdzQ29iV20vM2tIK0g2?=
 =?utf-8?B?eGlZRjFyR2dNWWJwQjJ5RERtTXU5aTQwTWNRTDJxNGR2SXdkN0luK25uZVpm?=
 =?utf-8?B?eC84RWNjUFlnTWlDSlJSc2JDMW9GZVd0dDlsOER0SHR0cHJTZFYxZCtWMjZ3?=
 =?utf-8?B?dnRsWXJjR3E1TnIxbU1hRmpkT1FnQlNaSUxYZ1VCczVLZlN1aG1mUjFkL2Nj?=
 =?utf-8?B?b09hSXcxNlVYbFQ3MWg2ZGROMDVLOWk0dTVrYlhreEJka0FBSTNMZTczZzA4?=
 =?utf-8?B?bklMZ3UyNStaTi9pcjFJYWtlenVWdEdZbFVDdTMrN0pUNXN0NVRQT0FTYVNQ?=
 =?utf-8?B?RXpBNDNyell5RWNpYVU5MER6aEZRMGlHSkJVM1ZpRmpiVmViNGVlY2tmbzRj?=
 =?utf-8?B?Zk5EbUxPZUMyVWlKLzY3anhKaVMyUmpVaG9lUXF4L3BiMXozUTUyQk9BSWhq?=
 =?utf-8?B?MldvNzROTXpxTnI3Y1RaZjRwQkFERE5DMDZiUmJQSDN6MXVINHJwakp5bVJR?=
 =?utf-8?B?VWhwKzAzZGpLejM2YVBLb3orVnREMGlCUWdvL2xjaWlibWV4c3FIQnlSV2E0?=
 =?utf-8?B?ZEVYUmd3aklrTlA3L2tRTEhyT0ZQTjJFRGZLcnZiU1ZCZ21kUVViaFdwYUZs?=
 =?utf-8?B?U0lXY08ya3UxeW91QzlJM1Z0THZvTEF6Smd0a2VoR3NGaWlYWmpTT0liTXAx?=
 =?utf-8?B?TEp0RlNCWjFMSEo4YVZSQ2dJYTVzRG9JUnlXbjlteXNHeThhcGtVd0h0bG1Z?=
 =?utf-8?B?OGp3QU9aZDVrN2NuTCtSTE04T01PTGFWYlR4Vm1ENmVZL1VmR3dwY3lnT1NI?=
 =?utf-8?B?MTZicXNwSCs2T2VXSFZDS0pxN0xNbUtUV1ZZUEdrMHNuaCtmL0x0eVBCVDVx?=
 =?utf-8?B?cnFORk9LNmtZR2JiWXBtZjZwWWIzSDBmb1BGNDRyUTJGQWxKc0ZXcjVVNzhE?=
 =?utf-8?B?M0g3L2xEc0V4RThvRHovZCtUUTlGa1R0UUhUTTR5NmdkaWtrMFFKbmJiRG9k?=
 =?utf-8?B?ZGh6QS9YRW9uc1JmQTRuWDVSYm00ZUVRcFI2QnZMRnUrcUM2Ry9HZExQb3JB?=
 =?utf-8?B?Umpuc3FrWHBFYlYwT2lSM3RvbmI5R2ZIeHBWeEd2MUpFOUlSZkFsMk12b1pZ?=
 =?utf-8?B?bzFoeXg1QWZ3YTVZREgvVDZUOTdOVlMzNzc2OHN4WXJaWCtpUGthcVFoZmps?=
 =?utf-8?B?R3BrS0FGNHFuV3gwT3hHRlVjb2lvN00wRDNITXVQTVdtcU41RGU0N3hadTVQ?=
 =?utf-8?B?SUF2VlF5SkR6cmlJSkUxdzJ0ZVpkemlxQW1ISmVKbjRwQ3QzaFpxNldSZ2hF?=
 =?utf-8?B?MGg1THkzbUJUUnRUajNpNCtpdUc3bHBrTkpEMjJ2VGpoL3YvWU1DOHZjWWFj?=
 =?utf-8?B?Uk8wWmFGNjFjRWtOK1E2cDhScHQ3Vlkwdk5jVkczWktCZEJ6UTF1K3FuVEpt?=
 =?utf-8?B?eW44MzF6ZnVHUmpzbjNVTnl4b1AzbHpyeDNlT1dIQzl6UHVLOWVwOUxkaG5y?=
 =?utf-8?B?R24yN1NUa2hPb1k4NDhiQkErS0d4WVhjZkUzRExBcGUxQ0lnbi9ON3JzOHZh?=
 =?utf-8?Q?oih/TTgZkTfNyLGBvSIi7CNe7QK1XkLgVATQ/k0?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzdQR1J6Uy9WVHIweGU2UjRsbmV1S3NOSkl1aVNGWStCcnpqWHZkS0lwSTZ1?=
 =?utf-8?B?bzVyWGNXM3orSkphNllaeVVwbWdMOW5sZ0V1anpaTlM5a1hVaC9UdE9XUmRh?=
 =?utf-8?B?Yks5YnNTQ09LdkZZNUpzL3hMamZYRkl4RVNMd3hubmVWcm5ndjJnYVQvdFBS?=
 =?utf-8?B?N3pmcHRlRC8xTEVRWWxNcjNmOUpUeWRiMnZLQWt2MDNxZHlLTlF1TEh1Z0Zq?=
 =?utf-8?B?bXRpVEo2TXY5SzFCajBMUDNrYjBSRFhHeG1pbGtQaTNjVmR4TXN5VDNLT1pV?=
 =?utf-8?B?SFBhd3ZsbjRTOW1pcU0yaWJNSnpIVDJ6c2RVUUZNSGpmeFkzY2lOREdHTGpr?=
 =?utf-8?B?Q1NpU3JwNDh1VmQ3bHN5NUdtVlRKaCtpTkFpRnU1S3k3Qmc2RjR3Y1F1Zm1M?=
 =?utf-8?B?dEh5QTBLS1V2K1hzbFR3YXlwWUhyWVl3L1VPWHM0WXVyMUh4bVVNN281UkJK?=
 =?utf-8?B?eGs2dXp5ckpyNjkvNmw2Um9hdFhmWjVXeVhqUUxvdEFjM004VGJkUE4wczVa?=
 =?utf-8?B?Z2dtL0JHcEgvTXFGbGdJQmdLNjFSZW5uYUt4KzRyNG1sKzZtSlA0SUwxaWdV?=
 =?utf-8?B?dUYzUXhpbGJrS01Lb1NLT01IUUhIQXVrSmxxbUEwSTgzckYvUW5iVFB6aXB2?=
 =?utf-8?B?bk03UkFKZkNtdWk2VFBpY2w0akVNckMwZHlwMXRJYmlkSFhvc1g0Znd3R0Q0?=
 =?utf-8?B?SENVY0oxZ1JOcXJjb0pEcU9TajdzSTBwbm12QnpqTVF4NVVHWXJnWmgwbnVE?=
 =?utf-8?B?NG5pSWJ1dm9uRnROdElFU0FUZlp5NHh5azhXSGhKZnV6Zm1UeWJuWnJjdXNl?=
 =?utf-8?B?cnpmWUhyZmVtYmlUZjBhV1huSlI0emJRK1loUytKWnhhUWJRTHVNT1dGVmNk?=
 =?utf-8?B?L2ZTNzBpTVJJdXNxOGVDbi9IY1FnM2VhTUxUc3F6VEtLTlRjSG5NVEVqdXFI?=
 =?utf-8?B?ejFZK29IRUJRZkF0S2lldEdjZ3UyMjFDTEE0VmNpb3JFYWVYdWdwZk9wTi9k?=
 =?utf-8?B?ZVdPZXVyZVJFVWw2SlJadlFOa21Ddkd0SnhUaEQ4enZTeDBjVVBpVnd5UDJ4?=
 =?utf-8?B?MUJRa2pDVmp0UWsvYXVGTFh3SkdzR0RGNzQyQjV0YS9jQU92RWZ3NXF6dG9y?=
 =?utf-8?B?THFOL1k0b0tua1NYN2JUeDR6SnpjWWc2NmgrZktrVGJ4SkUxVk5MMjhwckEv?=
 =?utf-8?B?a0pWQWxadWI1eXFyckdURHRKeDJXejdQakgrbEJ2Z3hCT2lhdmNGYzE3OGpN?=
 =?utf-8?B?UmVnSVdRdjFueENUaUNsL2gwWXNTcE5manZYZmM2ZnJDb3JodmxkWUxHTVlM?=
 =?utf-8?B?SlV0ditWNVQ3Nzh1RnQvVjRyLzlaMmgwNC9kTmZZaFlvZmdnUEwvdUhZMVpV?=
 =?utf-8?B?NDY4eXZlSFJGTU5BbVlkMmhFS2ZINFNYeGlwSFM0WWNJQ3JDYm5RMUdWbThh?=
 =?utf-8?B?WDVjczV6SDdvajVaWXlZamVYU0VQMDIxM3RudHo3U0VxSkl0bnZLRFk1TFpL?=
 =?utf-8?B?c2pzYmRPYm00eVdHOSs5bzErSVcyU3Q0MUhlMUZ2TzlPSU9VbS9aTTN2d1ZB?=
 =?utf-8?B?c08wTHZFNnhlYkZTZWJwZTJlWlRZcjdGTklobllxNjExNXJTLzRObnVmTG5Z?=
 =?utf-8?B?d08wQWc2NWZvOWVBMmkxb2QxVU9EMFR4cUo5dUdyS0NLanAyUWk4MGExOGVV?=
 =?utf-8?B?d3ZDYUtBZ1c3TlBNZlZCVFliVjJHZ0lzTWxubmU4ZTZBU3MrQnpINDBMNGdX?=
 =?utf-8?B?Y0duYUhWTDExTlppL3NuSEhDci91V0dJY0xGZ0NGUVBrU0F6UHdSMG5UaEpt?=
 =?utf-8?B?YndmaExvWU9KTklsTVpod1doYk9QTk1GSEFMaWJkc2ozQ1Rncmh0S0JJUU9N?=
 =?utf-8?B?V0xwUG0vS1dtbWI4U1FFRXllRG9ZUUREdXM3Z2ovaVZPUUNSZU5TWHZOSnBI?=
 =?utf-8?B?MnJjOHV4YVJTNjJVdE9xcGwweXl5d09ValAxQ1Z3NkZYdEEzK2RaUzRnUlVi?=
 =?utf-8?B?SXdlbnN1RFFPbXpqeEQyYVd1ZThYZ3A2a3pkZ3lLYjQ2bnUwSlkxajFxeGJy?=
 =?utf-8?B?bGlFdEJibkIwMmhlRW42KzRXVUtMRkx5R1ArNndGdkpUdkxTUTRXdW9Ybnhv?=
 =?utf-8?Q?mC3QKSd8RbdxlGSToGIER2L3L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD16280492312C43955F0BBE09103E83@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89eb882e-d515-49a7-335c-08dc95ba8ba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 08:32:41.8345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyjkqFkjn41oJzPIClKikP8yIZ7g0TR8eiWeA+Mv4DE4pUwE+Mn3bNy8bSD4rx6diYULuY400RGtrHeBsGvlPMz6Lb4O3H+MzCvVEyo5vn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674

SGkgQ29ub3IsDQoNCk9uIDI1LzA2LzI0IDEwOjA0IHBtLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gDQo+IEZvcndhcmRlZE1l
c3NhZ2UuZW1sDQo+IA0KPiBTdWJqZWN0Og0KPiBSZTogW1BBVENIIHYyIDQvNV0gZHQtYmluZGlu
Z3M6IGdwaW86IGNvbnZlcnQgQXRtZWwgR1BJTyB0byBqc29uLXNjaGVtYQ0KPiBGcm9tOg0KPiBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+DQo+IERhdGU6DQo+IDI1LzA2LzI0LCAxMDow
NCBwbQ0KPiANCj4gVG86DQo+IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1A
bWljcm9jaGlwLmNvbT4NCj4gQ0M6DQo+IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZywgYnJnbEBi
Z2Rldi5wbCwgcm9iaEBrZXJuZWwub3JnLCANCj4ga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitk
dEBrZXJuZWwub3JnLCBuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20sIA0KPiBhbGV4YW5kcmUu
YmVsbG9uaUBib290bGluLmNvbSwgY2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2LCBhcm5kQGFybmRi
LmRlLCANCj4gZHVyYWkubWFuaWNrYW1rckBtaWNyb2NoaXAuY29tLCBsaW51eC1ncGlvQHZnZXIu
a2VybmVsLm9yZywgDQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIA0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
DQo+IA0KPiANCj4gT24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMTA6MDU6MjRBTSArMDUzMCwgTWFu
aWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+PiBDb252ZXJ0IHRoZSBBdG1lbCBHUElPIGNv
bnRyb2xsZXIgYmluZGluZyBkb2N1bWVudCB0byBEVCBzY2hlbWEgZm9ybWF0DQo+PiB1c2luZyBq
c29uLXNjaGVtYS4NCj4+IFRoZSBjb21wYXRpYmxlIHN0cmluZyAibWljcm9jaGlwLHNhbTl4Ny1n
cGlvIiBpcyBhZGRlZCBhcyB3ZWxsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4g
TXVyYWxpZGhhcmFuPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiBjaGFu
Z2VzIGluIHYyOg0KPj4gLSBGaXggYm90IGVycm9ycyB3aXRoICdtYWtlIGR0X2JpbmRpbmdfY2hl
Y2snLCBtaXNzZWQgdG8gYWRkDQo+PiAiYXRtZWwsYXQ5MXJtOTIwMC1ncGlvIiBhcyBzZXBhcmF0
ZSBjb21wYXRpYmxlIGZvciBkZXZpY2VzIHRoYXQgdXNlcyBpdA0KPj4gLSBSZW1vdmUgbGFiZWwg
ZnJvbSBleGFtcGxlDQo+PiAtIEFkZCBkZWZhdWx0IGVudHJ5IGZvciAjZ3Bpby1saW5lcyBwcm9w
ZXJ0eQ0KPj4gLSBBZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGRldGFpbHMgaW4gY29tbWl0IG1l
c3NhZ2UNCj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3MvZ3Bpby9hdG1lbCxhdDkxcm05MjAwLWdw
aW8ueWFtbCAgfCA4MSArKysrKysrKysrKysrKysrKysrDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwaW8vZ3Bpb19hdG1lbC50eHQgICB8IDMxIC0tLS0tLS0NCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2F0bWVsLGF0
OTFybTkyMDAtZ3Bpby55YW1sDQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvX2F0bWVsLnR4dA0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9hdG1lbCxhdDkxcm05
MjAwLWdwaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2F0
bWVsLGF0OTFybTkyMDAtZ3Bpby55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4zZGQ3MDkzM2VkOGUNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2F0bWVsLGF0OTFybTkyMDAt
Z3Bpby55YW1sDQo+PiBAQCAtMCwwICsxLDgxIEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiAr
LS0tDQo+PiArJGlkOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2dwaW8vYXRtZWwsYXQ5
MXJtOTIwMC1ncGlvLnlhbWwjDQo+PiArJHNjaGVtYTpodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogTWljcm9jaGlwIEdQSU8gY29u
dHJvbGxlciAoUElPKQ0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBNYW5pa2FuZGFu
IE11cmFsaWRoYXJhbjxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+ICsNCj4+ICtwcm9w
ZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgb25lT2Y6DQo+PiArICAgICAgLSBp
dGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAgLSBhdG1lbCxh
dDkxc2FtOXg1LWdwaW8NCj4+ICsgICAgICAgICAgICAgIC0gbWljcm9jaGlwLHNhbTl4NjAtZ3Bp
bw0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBhdG1lbCxhdDkxcm05MjAwLWdwaW8NCj4+ICsgICAg
ICAtIGl0ZW1zOg0KPj4gKyAgICAgICAgICAtIGVudW06DQo+PiArICAgICAgICAgICAgICAtIG1p
Y3JvY2hpcCxzYW05eDctZ3Bpbw0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBtaWNyb2NoaXAsc2Ft
OXg2MC1ncGlvDQo+PiArICAgICAgICAgIC0gY29uc3Q6IGF0bWVsLGF0OTFybTkyMDAtZ3Bpbw0K
PiBJdCdzIHdvcnRoIHBvaW50aW5nIG91dCB0aGF0IHRoaXMgaXMgcmVxdWlyZWQsIGJlY2F1c2Ug
dGhlIGRyaXZlcg0KPiBpbXBsZW1lbnRzIGEgZGlmZmVyZW50IHNldCBvZiBvcHMgZm9yIHRoZSBz
YW05eDYwLiBUaGVyZSdzIG5vdCBqdXN0IG1vcmUNCj4gb2YgdGhlbSwgdGhleSdyZSBkaWZmZXJl
bnQgdG9vLg0KPiBBcmUgdGhlIHNhbTl4NjAgYW5kIGF0OTFybTkyMDAgYXJlIGFjdHVhbGx5IGNv
bXBhdGlibGUsIG9yIGlzIHRoZQ0KPiBmYWxsYmFjayBoZXJlIHNvbWUgbWlzdGFrZSB0aGF0IG9y
aWdpbmF0ZWQgaW4gdGhlIGR0cz8NCj4gDQpUaGUgUElPMyBwaW5jdHJsIGRyaXZlciB1c2VzIHRo
ZSBjb21wYXRpYmxlICJhdG1lbCxhdDkxcm05MjAwLWdwaW8iIHRvIA0KZmluZCB0aGUgbnVtYmVy
IG9mIGFjdGl2ZSBHUElPIGJhbmtzIGFuZCBhbHNvIHRvIGRpZmZlcmVudGlhdGUgdGhlbSBmcm9t
IA0KdGhlIHBpbm11eCBjaGlsZCBub2Rlcy5UaGUgZHJpdmVyIHByb2JlIGZhaWxzIGlmIHRoZSBh
dDkxcm05MjAwIGlzIG5vdCANCnByZXNlbnQgaW4gdGhlIEdQSU8gYmFuayBjb21wYXRpYmxlIHBy
b3BlcnR5IGxpc3QuDQpGb3Igc2FtOXg3LCAibWljcm9jaGlwLHNhbTl4NjAtZ3BpbyIgaXMgdXNl
ZCBhcyB0aGUgZmFsbGJhY2sgY29tcGF0aWJsZSANCmFuZCAiYXRtZWwsYXQ5MXJtOTIwMC1ncGlv
IiBpcyBhZGRlZCBieSBkZWZhdWx0IHRvIGF2b2lkIHByb2JlIGlzc3VlcyANCmFuZCBoZWxwIGZp
bmQgdGhlIG51bWJlciBvZiBHUElPIGJhbmtzIGJ5IHRoZSBkcml2ZXIuDQotLSANClRoYW5rcyBh
bmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K

