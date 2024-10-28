Return-Path: <linux-gpio+bounces-12236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB09B314F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D0E2B21092
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0454C2AE8C;
	Mon, 28 Oct 2024 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="A4pXRlQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E11DACB1
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120846; cv=fail; b=tHUOG35s2vNnsz8zDeMiGQWiL8cNm37y6z+U0BcPdTPJyZIsvhGk4oe0vhWGhdsfCTq6oBOp0OP7TvFLPqc6KlREJ9tYhG/+IW5gqDECIwrgmMlTaTCCbx1kzgeKgQLvznlqU69pJuWUL9pOt2uC6wBSOko/fl9rM2wh5KiBR0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120846; c=relaxed/simple;
	bh=Qr5TQwRkyT167+z99QVdGjhmP2+dR7Fgd6k3qj2xg50=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ukg+UBoLY+AhaWg2M6zVz8GNbOxlKLS4tWXZH3+c4HpgyRfvRNbIneuVjddFfni/1V72JMIz7VB0NDeHHAs5ql2E54yq7ecDHf1Z6nCNBuYgKJAb0DrtT/194Jd0stXJxPwzak1oKX0ZJClBlLF+GXH6ocVn2sNV5r/K/MIwQ2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=A4pXRlQn; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWb7orhlegYXYPA9HUCqKOYY68a/KPKM/TanRGDSdVs/PilWFKvZetxiIuBW7SBCUsxJWWOqMP1zW+/+zPz3RGSj9wZXIWaHjYKcBYAFgktA87kuImhz/VNBhGXuxXLuMpMRpdwn9O1LF35LEcRREVX+UJoo9/ZUETirq+If/pVKxUymSZ+4owF8cwXmih/hLZTicZCDfk+AL1GdJ1S2lOfKoyKTK0O3GNMbqkq0YnboXcvsScqXTcjyUMtu5eWtu3tBsxTq7LLT4vFqJScm6dBVqNlTjT2Ud1F7quQklISkylQ/sVpCZW8BuVNimo7kz6k+eE0DNBnKLtXOXC56NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr5TQwRkyT167+z99QVdGjhmP2+dR7Fgd6k3qj2xg50=;
 b=bUQ2Uki2b7SVTn2qcyrnel3oMHic0QSsRvIvt0s7PCuYfzO67xKTqhMfZMFphSAmitBvdLtI/FL4QQHjFDxNmvmS09HNL89cJANjnsuXmQ4IDQ/NpUH0Ovs60IdPWS8jdDzH6fcilkJiFrcGyqMCG7ZT5cluqGtEe0u4rYG9vmvSeEIwDPonX8YlayjjhGYGaLrFgzfjmrmA1Y5dk/ytQK1ppSjixWOKN77NxRophLwVJHofx17VgIW3pSh1nubXU3poOOD182Wn1kMpKU8MiOyH2xpFluU/RJft5nfGBnoOUZNuBQWSgJXw9Wfl1xeLOufp+m/p9279qU/EjudHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr5TQwRkyT167+z99QVdGjhmP2+dR7Fgd6k3qj2xg50=;
 b=A4pXRlQnnmBtTE0UuKE+MD3xRuSfJpQBdLUcAxe618QJzwls7q8mTsWOc7qZo9y0sxB97e1YWHyWugb5pMWDIcwc7iRSHK/VA5azMtFr+WsIdLtBaewcWCDAv/ApM7IXj4nKPsiY9LYChfk645BgBbiSqSTIS1i8WTn1Y0akhloeeslY1lFU6zyWgtx1G+6guyO/SdKD3rHsr1xW8r3MUMp/UjlIbCyYxnGK80i1mu9OSUncH0ZgXgeqE/cnZI1Gyc66TLWorLE0YBuXAPepRigvVdwSwDeNtah4aUd+YNqR4kw+XllQW+hd/P2yILz+w+jFTEcg7Vlwq1eHHiAL3Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DBAPR10MB4107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.13; Mon, 28 Oct
 2024 13:07:21 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8114.011; Mon, 28 Oct 2024
 13:07:21 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Topic: [PATCH libgpiod v5 4/4] dbus: add the D-Bus daemon, command-line
 client and tests
Thread-Index: AQHa7JDPFNYqQ01NbE201CZYmrX5dbKcm4GA
Date: Mon, 28 Oct 2024 13:07:21 +0000
Message-ID: <93c9d617df7cc3f6814a56d07d90aa3f98e352f6.camel@siemens.com>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
	 <20240812-dbus-v5-4-ead288509217@linaro.org>
In-Reply-To: <20240812-dbus-v5-4-ead288509217@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DBAPR10MB4107:EE_
x-ms-office365-filtering-correlation-id: 8694d5c9-be8e-4772-1edc-08dcf751753f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0dzN2xsd2hhWGkyNmhQMnFTN283REl0RUkxUk5MSUR6c3c4WVB2bVRlZkpt?=
 =?utf-8?B?WHh4aHBwUDNCdWx0b1lDcjlzUlFnUnJVUFFOb3ZlOTMrQjZIVUt2cFBmOEhH?=
 =?utf-8?B?eEI0dnJLeHlHVVk3UlRzelo3WUVDYndyVjBkWmk2UkVpQlJrZ1BEMm1PRzJu?=
 =?utf-8?B?aytqTnNRQ3hOQVJ1YmFwNzhvZEsyalZ4aVdyZDE3SEptSTdlaEVPSldRMGFn?=
 =?utf-8?B?cVdzbEVtTERKTFY5ZU4xZUxValhqQVV2RElGR1pUYXJ6Y0pRY1NENDJ4VUtI?=
 =?utf-8?B?VkJBY1NsQTVtalBmdzlQUy9VcHFaRFZ0MUhTeVhIWW9KMTNDN0lMeUk3WG15?=
 =?utf-8?B?RjRBVFlCUXdXbnJ3dWZqOFlVbk5Zc2VhZ1ZiWk5wTEdYR1pLNDNrSXJuQnh5?=
 =?utf-8?B?Zk5qaSs0ODRCcjRUcUlUd1luU3cwaGFsUkdPQkFzLzRPTmtwQW02R3hMQXV3?=
 =?utf-8?B?aGxwOTUzaVhsVlJ5WVZEUGJsM3lDNjBNWHV0TDhFdDhpVUlWd2pBbFdGMm5z?=
 =?utf-8?B?U05MUnBVOEVsZzZ4aGQ5OVptWWdXRWpyVHBUeTlnQWZaYlFJeEw4dVcrQXMx?=
 =?utf-8?B?ZHB0eHdWaDNmQUlhMjVUSGxhVlpxeWxLeXZzOWxJWnZkQi9mWmpQamg3V2da?=
 =?utf-8?B?bWxmZUpOdkc1Q3RKVlVhbkFFZWpQc013Y0svRVB6L2ZiWjRvQldOU3BkV1o3?=
 =?utf-8?B?ekMvYTR1T2FEdTZaQTRSdW42TDYwSk42Q2Z6TERBSWVnL3A2UXljSXRWL1kw?=
 =?utf-8?B?S1RDSnVRYyt0K0ZTcVVIL0g1NXlSaC9DSlRuOGhHdVE5b3FZdldvT0lnVjBr?=
 =?utf-8?B?RVBKZkxXenlheHo5ZGpPQVh1NXRKR09XVXFKYU5YNGs3WkozekxzaVhkMFBr?=
 =?utf-8?B?Q0FnRmpmWVY5akVoRldVODhJMXFqK2o5NGxLOU15ZkFnVEhZTDIwdTFmR2dI?=
 =?utf-8?B?M1dOOXNXeDJ2alE1ZzdwYVpjMjRxTmhFenhSVTZ0U0ZnVnJaTlZDTmp1anJ5?=
 =?utf-8?B?a0FaNTFiK2ZneUVTZ2ZNUTlPNkNqeC9JZUcxUERkblVWRWZWYkQ0S0RjTzZI?=
 =?utf-8?B?RUhwWHRIVXBXTGt4cWNFaTFocGtOMUgwVkRpeVFoYVF3SFRmdHV1RnJwNEtK?=
 =?utf-8?B?VG9EK085UHR5bzNaRzd3M1lpK0czVHk3dWF0SldSeDJobjFGWHBrSGNNMG45?=
 =?utf-8?B?VzlvNE10VGJRVUZjZjJGS0sxUnloS3BOdkxMTkN3OVdzT0R1Z0hiY3M3TUo0?=
 =?utf-8?B?L2VvZzVwUlg1NDBpR09ENUxNYk5yckZsZDc2UTV2eTRwM3VpS3luMWlTYjJV?=
 =?utf-8?B?N2lYKytlTzdPUlBmRGZhWGVyZ2VGaVI2ZE1YWTJ0bG95ZWRJc3RWN0tkUmpr?=
 =?utf-8?B?WU9nQXZiSmVlQWRPNmthNFdHYlROMnQzbDdIY3BSYVUwUjE0V0pEdnkwaDRZ?=
 =?utf-8?B?VEtacitkY1VDNkVPcklPQkh3WDIvS3gxNmJQcEpNazhoOTB0ZGJlamlNZ0di?=
 =?utf-8?B?Y2dhVy83Zjhlejdra29mVVdKYjlTcit1bGxMYVhwSjVTeVN1OERBNkVlcDY3?=
 =?utf-8?B?dmFQa1RkTVVlR01icXhwVy9rLzlaVHVoWXlPUjgzbi9UdStoVjZ5cTRReFpi?=
 =?utf-8?B?T0JOejA4ZjE4UEM2VE5vRHlMY2pxY3JJUXhydFZ2NnFGb1FWcWlhZlpwcUJT?=
 =?utf-8?B?ZGl0c08vUkJKYmFCMnpkNFF4NHpTanYzWVM1MUJqYlY1R2hMRnZPRnh2aDJu?=
 =?utf-8?Q?+YE6eLYpLDU2VCI9SBotLEEt/itkf4LvpNNNDJ3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWlPNks4a0xrbFZSZHAxVHUxbTlKRUFJVDMvQlNqc3JLeTlMZXZSSE12a1I0?=
 =?utf-8?B?d2ZFNG9oak43QzN1UER1Vm43TERZQ01mYnJETU9JZmRnbGZaMVU1UTl4bEtL?=
 =?utf-8?B?UWJ0ano4b3JIcy9uMGVUNnYzVlVGKzMzaWtUN2hZS0FPQUx1WDE3ZEUrdDMz?=
 =?utf-8?B?NzNNOXQ5Q1J6MktKNm9GNStVcDVQallnYytSSW9IWGx1MlRJVjBBZGVsS3VJ?=
 =?utf-8?B?dFgvTHRLWEdScW12VW1OZ2k2V2ppbjB4NkhDYTFCVjhLeVJrL2pHbnRaajI1?=
 =?utf-8?B?bmhoRUFpSmFEVzVRbytFV2tLcmxmOFR1c3NSUjhsVHhsMHBvNlFvVDJHNkFl?=
 =?utf-8?B?SWRJYTdwWlB5bFhpVnJWRWpWbXkwK3A0Mzg4SjZISHBsaHhJOTBCNmpGbVhw?=
 =?utf-8?B?MmNRVmxHbEErdldhOUdtdXVHejc1czNRbGlVZDNTaDdwRGs4cCtQNi9CVWhH?=
 =?utf-8?B?NjRETC9nTTI2RzMrWmdPUm9TcTdTUG5SRVFZMHB5ek8zQzB1V1R0Zk9EZi9Z?=
 =?utf-8?B?cmQ0ZFd4NkFnVEdXYlNha2lqTHpYb3JURm5xa1J2Nys4Y212MUE2eEJFRzdY?=
 =?utf-8?B?T2NhL1h5Y2hFOVNLQU1oVHc3MEZnd04yYXJwOU9Fd0hRZW9Ibi9aUzBxMFRQ?=
 =?utf-8?B?Nk1IN2laK3BPWU51OGt1ZlQ0SHZBQWhkWEhKSVlYbFpZSFBvLzZuMlhXRHNW?=
 =?utf-8?B?a2VWeFU1UDg2YmNteUpoY3czcVdDUUQyWTlaWjJmUi8zbGl5dHlEcEx4b0hG?=
 =?utf-8?B?TVUrVWh5S1d2VzAzcU9pRURQaiswL2YvRGpFT2taNDY1WjZYYWw2Mk4xNi8v?=
 =?utf-8?B?UDJjTU1KeUlRUFE2R296RjloWWU1b01Cc2UyVlFybTArVUxkbVZhNlMzMGNY?=
 =?utf-8?B?OFZxTGdLU2FjVndBcWRZMm82L1hDVFNmc09IcUlESWdyUlhLVk5YMEdyUFBN?=
 =?utf-8?B?b0JRdGgyUlBmaWczT3dHc2pNYS90THhSbHp1azdQeTFrVGhORzlFcTZYNXdC?=
 =?utf-8?B?WHNEbnpXeS9CZVBjNGttSVZ0b25DbUlyaXNiTFppVUNOVDQ4VnJZV3ZCS1c3?=
 =?utf-8?B?WVdXZDhyeTZkazhOYXEvckZUY1c4RjVqcWpQcHdZeE9paVFlVi9xTUhidHVm?=
 =?utf-8?B?UnlBTHlOQ25aSEJZM2ZvZ2dQczl5TEtBWWU3Q09wdDhrUlFpWmp3ZjhhaVJu?=
 =?utf-8?B?S2x2L2lPeEVZMURMZkxKNzRPUE9INlhtNFN1L29WNmc5ZjZpaXh5MEcyZDhZ?=
 =?utf-8?B?Q0FJVzJ5N3Bta2dFa0IySHR0aTV0dFJYSURJTmNyVS9jWmxrMWNoMlRqVnE4?=
 =?utf-8?B?Y3o2cHMrK0l1aHAyOE9LM2RhckxaZXg3cWRmeUNzUGN3eHpMQ0N0dGtYa1Zi?=
 =?utf-8?B?cXRyYXZwL2ROMDdWK1NZUy83TktHSXo4SHZ4NHdkRFJlWGtHUGFrL1dTOEFo?=
 =?utf-8?B?Z2w2Rnk5V09SQVJ5QW84bEFXcjA0RWRrcjViYmNrTFZhT2t0OWltYXdyaWRR?=
 =?utf-8?B?MVd1ZHFPSDIvUmt0ZTQ2QlRXUi8wV0Y1RDVldlpkRVJwb2w2OVEzdFRsemJl?=
 =?utf-8?B?OVUrME5wMWR2TzdNZEppRmJiNnJ5NHhMaDg1L0xTUmR0cGFEZDIwSzJ5NnNx?=
 =?utf-8?B?dVdjdmNaemYyZmliNzBhekVXRkowUWdxS1FQb0pGU2RpYmxSRHl0TmIvSzR2?=
 =?utf-8?B?Rlh3T2RWWW5kbHgzWnBwcGx1TWZHa0dxcC9IV1Z3VHo2NzNqaFkrVnN0Znc3?=
 =?utf-8?B?VUZCYXhHdkhDRkQxRWhXYWR0SFVYSkFOZ1lVdEg1TnNQUndpcm9oN0REODlJ?=
 =?utf-8?B?SERMa3JoYVVpMTBudGp3cDJTMUxpZGg4QmdGTUM2aDlUTGU2Nnhhd3EyWjVz?=
 =?utf-8?B?UGpINUZXNDhadlhxWFVmZGxBbXZzdDJpbTJTTWYzK1huNVFSNFJPenpYaXlu?=
 =?utf-8?B?ampkOGdpRUMwUWJ4RlVFTVI2aVluVDdIMnNkWjE3dmgvaFZUZExMakZ5a0Rm?=
 =?utf-8?B?d3NSOWxRdEdKWklXeTFyNnJNaGNsRWxYd1RIeEpaMCtSaGFubzZObTRzSUJx?=
 =?utf-8?B?OXRESmZQSnl4Nnp4cU1LZDBiS3BCR1c0K01WZDFla1VVUkJmRmIzMW9FQ2Jv?=
 =?utf-8?B?U3YrMm8ralVWMVZYZDRSeXZiZUI3WS9ZWU12Sng3dzBnNS9LeS9FMnNXaHlK?=
 =?utf-8?Q?CoY7R9cZre+NB3WlWUX/qD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAAB7523EE9577448C38470ADD111187@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8694d5c9-be8e-4772-1edc-08dcf751753f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 13:07:21.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMhYAzgHxOlw1BzH9dVQ2XTfwfkP6N5qW2TONvcyIYPrqllHzXaWvqI2HdN6v+GF7jR4TNZaqFTtEHucfg9g+U09xtGn7xoqSGD8k6z+a1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4107

SGkgQmFydG9zeiENCg0KT24gTW9uLCAyMDI0LTA4LTEyIGF0IDEwOjIyICswMjAwLCBCYXJ0b3N6
IEdvbGFzemV3c2tpIHdyb3RlOg0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0KPiBBZGQgdGhlIEQtQnVzIEFQSSBkZWZpbml0
aW9uIGFuZCBpdHMgaW1wbGVtZW50YXRpb24gaW4gdGhlIGZvcm0gb2YgYSBHUElPDQo+IG1hbmFn
ZXIgZGFlbW9uIGFuZCBhIGNvbXBhbmlvbiBjb21tYW5kLWxpbmUgY2xpZW50IGFzIHdlbGwgYXMg
c29tZQ0KPiBhZGRpdGlvbmFsIGNvbmZpZ3VyYXRpb24gYW5kIGRhdGEgZmlsZXMgKHN5c3RlbWQg
c2VydmljZSwgZXhhbXBsZSB1ZGV2DQo+IGNvbmZpZ3VyYXRpb24sIGV0Yy4pIGFuZCB0ZXN0IHN1
aXRlcy4NCj4gDQo+IFRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3Zl
cmRsaW5Ac2llbWVucy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4NCg0KW10NCg0KPiBkaWZmIC0tZ2l0IGEv
ZGJ1cy9jbGllbnQvd2FpdC5jIGIvZGJ1cy9jbGllbnQvd2FpdC5jDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLmQ2NWM0ZTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9kYnVzL2NsaWVudC93YWl0LmMNCj4gQEAgLTAsMCArMSwxODggQEANCj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQo+ICsvLyBTUERYLUZpbGVDb3B5cmln
aHRUZXh0OiAyMDIzIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGlu
YXJvLm9yZz4NCj4gKw0KPiArI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPiArDQo+ICsjaW5jbHVkZSAi
Y29tbW9uLmgiDQo+ICsNCj4gK3R5cGVkZWYgc3RydWN0IHsNCj4gKwlnYm9vbGVhbiBuYW1lX2Rv
bmU7DQo+ICsJZ2Jvb2xlYW4gY2hpcF9kb25lOw0KPiArCWNvbnN0IGdjaGFyICpsYWJlbDsNCj4g
K30gV2FpdERhdGE7DQo+ICsNCj4gK3N0YXRpYyB2b2lkIG9ial9tYXRjaF9sYWJlbChHcGlvZGJ1
c09iamVjdCAqY2hpcF9vYmosIFdhaXREYXRhICpkYXRhKQ0KPiArew0KPiArCUdwaW9kYnVzQ2hp
cCAqY2hpcCA9IGdwaW9kYnVzX29iamVjdF9wZWVrX2NoaXAoY2hpcF9vYmopOw0KPiArDQo+ICsJ
aWYgKGdfc3RyY21wMChncGlvZGJ1c19jaGlwX2dldF9sYWJlbChjaGlwKSwgZGF0YS0+bGFiZWwp
ID09IDApDQo+ICsJCWRhdGEtPmNoaXBfZG9uZSA9IFRSVUU7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIGNoZWNrX2xhYmVsKGdwb2ludGVyIGVsZW0sIGdwb2ludGVyIHVzZXJfZGF0YSkNCj4g
K3sNCj4gKwlXYWl0RGF0YSAqZGF0YSA9IHVzZXJfZGF0YTsNCj4gKwlHcGlvZGJ1c09iamVjdCAq
b2JqID0gZWxlbTsNCj4gKw0KPiArCW9ial9tYXRjaF9sYWJlbChvYmosIGRhdGEpOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgdm9pZCBvbl9vYmplY3RfYWRkZWQoR0RCdXNPYmplY3RNYW5hZ2VyICpt
YW5hZ2VyIEdfR05VQ19VTlVTRUQsDQo+ICsJCQnCoMKgwqAgR3Bpb2RidXNPYmplY3QgKm9iaiwg
Z3BvaW50ZXIgdXNlcl9kYXRhKQ0KPiArew0KPiArCVdhaXREYXRhICpkYXRhID0gdXNlcl9kYXRh
Ow0KPiArDQo+ICsJb2JqX21hdGNoX2xhYmVsKEdQSU9EQlVTX09CSkVDVChvYmopLCBkYXRhKTsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgd2FpdF9mb3JfY2hpcChXYWl0RGF0YSAqZGF0YSkN
Cj4gK3sNCj4gKwlnX2F1dG9wdHIoR0RCdXNPYmplY3RNYW5hZ2VyKSBtYW5hZ2VyID0gTlVMTDsN
Cj4gKwlnX2F1dG9saXN0KEdwaW9kYnVzT2JqZWN0KSBvYmpzID0gTlVMTDsNCj4gKw0KPiArCW1h
bmFnZXIgPSBnZXRfb2JqZWN0X21hbmFnZXJfY2xpZW50KCIvaW8vZ3Bpb2QxL2NoaXBzIik7DQo+
ICsNCj4gKwlnX3NpZ25hbF9jb25uZWN0KG1hbmFnZXIsICJvYmplY3QtYWRkZWQiLA0KPiArCQkJ
IEdfQ0FMTEJBQ0sob25fb2JqZWN0X2FkZGVkKSwgZGF0YSk7DQo+ICsNCj4gKwlvYmpzID0gZ19k
YnVzX29iamVjdF9tYW5hZ2VyX2dldF9vYmplY3RzKG1hbmFnZXIpOw0KPiArCWdfbGlzdF9mb3Jl
YWNoKG9ianMsIGNoZWNrX2xhYmVsLCBkYXRhKTsNCg0KU3RyYW5nZSwgSSdkIGV4cGVjdCBmcm9t
IHRoaXMgY29kZSB0byBkZXRlY3QgcHJlLWV4aXN0aW5nIGNoaXBzIGltbWVkaWF0ZWx5LA0KYnV0
IHRoaXMgaXMgbm90IHdoYXQgSSBvYnNlcnZlIGluIHByYWN0aWNlOg0KDQokIGdwaW9jbGkgaW5m
byAtLWNoaXA9Z3Bpb2NoaXAwIHwgaGVhZCAtbiAxDQpncGlvY2hpcDAgLSAyNCBsaW5lczoNCiQg
Z3Bpb2NsaSB3YWl0IC0tY2hpcD1ncGlvY2hpcDAgLS10aW1lb3V0PTENCmdwaW9jbGkgd2FpdDog
d2FpdCB0aW1lZCBvdXQhDQoNCih3aXRob3V0IHRpbWVvdXQgaXQgd291bGQgd2FpdCBlbmRsZXNz
bHkpDQoNClRoaXMgaXMgbm90IGV4cGVjdGVkLCByaWdodCwgb3RoZXJ3aXNlIGl0IHdvdWxkIGJl
IGNvdW50ZXItaW50dWl0aXZlIGFuZCByYWN5Pw0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0K
U2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

