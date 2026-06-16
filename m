Return-Path: <linux-gpio+bounces-38520-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hr+GCAe7MGrjWgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38520-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:55:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A479F68B8E7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 04:55:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b="di/p2muK";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38520-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38520-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0567C3011A63
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 02:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BD93B2FC7;
	Tue, 16 Jun 2026 02:54:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022117.outbound.protection.outlook.com [40.107.75.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE10233945;
	Tue, 16 Jun 2026 02:54:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781578497; cv=fail; b=e+IrvgB75nIaQu3n87+ijtYGxr0E7UbgdTFSiPlHNg8FGrxPKxHcZI+7hB0YasuSFn4BoEZlDXBTRlaT7FBI2IEq2VQdWChSLEKpfLXHoVz91/uXx/TFJxRw64TbHp/3+LWZcLVVcxl4yACfmlGlsLDylWQdZjtWbJcPMism3tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781578497; c=relaxed/simple;
	bh=o4TJfIIyzJqTdnkgQBsbEonH4HD0MLx8rg8/82logb0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oLpYoChj+ZnrbdzUZo0acyNXSCYxbLRMGW6u8XUwFPM6e2kGDA0u2iUX70/eWC5swP/B1fVrvYjtfVB66Mq0QdFP73+LEEokux/CQLnFO3rtaB3CF5/Gz9sVYeYParQgOQCh8Ra52VkXmZMUowmU9xHYlRARWD0G4oMVdI4rLww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=di/p2muK; arc=fail smtp.client-ip=40.107.75.117
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzNRXV5zAU5NWk4rmGzpoi23AqlFRO3xw3tD2CbrGN/HBsV8uT+914DuCMo/exbXVi9vq82xzpUcfH1Ug4zzrsrmPlBqW9ISTzizlTFr2oHVC5bR2DnGQcCSFgNQwRR++fOjPPoNxXnfkLzgUG1idxQrgRkdwgzPv9PdfANX2RUHpaUSLeeCUHIoOHymmumS35wHQzDyMqdrUWQORMrhmMaIKY3RH7WrnT6rHBiioWSsfmcaRppHVa19F7fIgiRqtZcpMrDdjmNnuVbZL+Vo8SGvHsfhQQOYGMx9eqTejAl1gJap5yAvxTecNbRipUloAJPLghoPuyOEVRvZT0jKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9V+MxCJ9Aft6i6ZzUuBiG22xRDCPEi8bJuXRhyofKc=;
 b=H7wJ0xOEUkLEubbVoq1rqgUTwbOPEvaJuJjL6K3Qu2Kx+3NlsViH3cDjybL2KM7LqGjU9Vxh1lMHAM8WRWR1OIT6A5Ksl19mObT0Gr6vrMmIBm0oYYOvNgO6Fl3kATPAqUew0LwrnbVFfSNCinE1xVMj0X1ezZrJSaL69eZXhA/E6iA1BoRdjzgtdCzOkelN3h5f6gnoHFbcd5J7yEusWAjZ/5eW73zF8Wn1NEf7rkYoNni6PYI1LglVF4+kBI9ICwPLgf9xm0YKK9jY+s462eQe706URAXp/7dPQjjxwWSh008J08cObyNF3ScnALOROv9L/WqqualiRvaZ9RBMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9V+MxCJ9Aft6i6ZzUuBiG22xRDCPEi8bJuXRhyofKc=;
 b=di/p2muKpkWujphurqpGRMjHrnkOUzrOXhl1muas1rh7cyhGdOjRQGFeoWBOaYXzTpguNUiUrsNLafADdM5MUbxH+bh2OPGfEqRjbJKuUjejqPIhZf0TLtzMAkGdHW0lGuEPAbfju21ykvW88YgSmwjCHOt6cdZTeUM6OxNPz2RgSVzhBgeauKDu0a0w2UIThQVlJjhUcTBimpreBgnF4mg+lHVfRIrROzXYKwAckDDT+QCzfQoq0PyC6vCV5rkohiTBC7Q/tWtEIZiD1xEcmuK+8YwXh8TV/eMdh/OODiGMQ4BU9o1uuR9lMwbnd3lcbXhcDa0fNwcqwe4gxKUFeg==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE3PR03MB10535.apcprd03.prod.outlook.com (2603:1096:101:324::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 02:54:52 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 02:54:51 +0000
Message-ID: <d2dfaa5c-67d2-40d2-a1f8-bb01cfa8586c@amlogic.com>
Date: Tue, 16 Jun 2026 10:54:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
 <20260611-ungloved-snowplow-522e7c0b7a51@spud>
 <a79e58b5-3a11-4593-847d-ba92527549bf@amlogic.com>
 <542ec217-1187-4fb2-8fd3-b90a6143b84d@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <542ec217-1187-4fb2-8fd3-b90a6143b84d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0191.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE3PR03MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6df0ad-30ac-4dee-c1af-08decb52a305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|4143699003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	F/iEmcg+t3NUuF0nzpqZd/kGum20hmu1ojQ5jXI3UkEzNavg7lQV3emkOjy3jVjkrYGvcOaKODd+UpQSBT34hmjX3npOeCqljFMAQozCTqp6I2i+2OnM4w5V8KlBof30yNWhrTRTK/CF29Okv3XRN+BRBqF7fG4Vp5BHo5fQzaLc7SgQa8T8LEUPQ8e4sVMau+GI8Y0qvu8QA0/W0fHFAmS52XuZbxNS1CfMYgp6UiVIz7UnFo4rN8bbRzu7yusO2P8LhyeWqCJIHFLjBJoEKP3g7I5DpwK6jEs2JEsAi/NsAyKFlEHeY4O8mVpV4lsmRjBQ+/4qfggneaCVLphxd34bSdatT3dss6N9RwCaI8VM8z9ZV9TYwWa0U+hZVUWMXAanudEB9q7mhxuCC/Yk5Si0FOmHnhSXxw/e+lfnbfgr2pn2OyQAaqP+y58v/OHGl2lByiiNwYN2+mL9jXneHaO/tQ5F7UhOXdNbZKVahnW6kulKJFPhc9y3BW9So3unXg4EUVJKxt6Sx3GaQKOPnQ5MktMt4IsYGT5LPk1fghB1fcBiV7/wjzmUFGAZEzThI1uyaN5iw0UN6f6d1HJu1bnlkULcNw2pzVdxfTykHq3+u4nLECpSOJyc0Wmco0mk+VmADlU+cTNfPHvVGjBNV+hxPLKjrqgqMOtKphPCtPjLDnNrjH77DkXxiOFYOpiWXAH3hH8Oeu1+bjUNHoAsRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHdld3FremZscjg3VHJqVy9TQnVMR2VSM3A1RXlUWEIxd0YxekpaVTdoa2hR?=
 =?utf-8?B?RndvU2dBa3hnTE1PczJoR1dKdkVtRFFPL2RmVVVtczJYYUlQb0d5MkdTd1pz?=
 =?utf-8?B?WW9YUlMxdkVtTzRkcENKV0J5NUdwOWptbzJQNmNham1xcjZ3QU1oVEhLeGcy?=
 =?utf-8?B?bE5KMmtHTDdKcXlUai9mMEhRcnQ2K1BwYVd0UkFjbWM5aU9COEpmcHkxRzVG?=
 =?utf-8?B?ZktIMXRvNnVhK1hobHdTbC9sODRWeC8rTE1PY1l5SXFWOG9uNE8vWlVYcVhC?=
 =?utf-8?B?VU1QQzBEekZrbXRuOUh6VktId2MrdE1Ic0dUSUJQM0VxZ0gzdmZ1eUFMaDZn?=
 =?utf-8?B?SkFhNDVhWVVIYmNIUGo2MUpNanBOQW1md1JuVVJMa2lLeGpYUEhYQ1dMbGxh?=
 =?utf-8?B?ZjQ1Y1lCdHl5QUx5L0VtRjlFcDl4Um40NGQ2TDIyV2ViQS9lamZEdWplNi9C?=
 =?utf-8?B?RTE0dkxLc0xTcUdlQk85d0V3WGRMeThTN3J6VXdJdnlQSHFzUXdScmlPTUp5?=
 =?utf-8?B?d0ZNa3p1UTRsNUtaZ2pVRGFEbTlsMFJhQzZ5SUJ2Tm5oWUhUYnl1MzdUcWNE?=
 =?utf-8?B?anQ3ZEhSdlk2eUxyeFVDdTVXdkdFR2xoTjEzeXVaYUc0QVRnRHdIN0NTYlg5?=
 =?utf-8?B?REQxTGZyMVNKeWJGWExYeUNjUlVMNGh0MTU0THZEenNLdTcyWFlKRVBxZXZu?=
 =?utf-8?B?bWVVaENXeTd3Uy9rejYvKzhGZnhXL0o4NFhDRTFaVkZJeEFCWjcra245S1dT?=
 =?utf-8?B?bUZ5UmNBM0dic3lLdWJTcUFhaFBVS0RGWVJLMFhaL1REZlJabTlaU245SDZW?=
 =?utf-8?B?SVhnOVRMMitaS0l4RjRVeEtsQmhKeFFYSGZJem9vKzJiQkYzOU1ZVlVkZmtk?=
 =?utf-8?B?VGdpRDdGTnJtUzFuSEMxY0U5WUwyV2NCVGxZYVlCUnp5aGZKQ2hOdjBvZ1Zi?=
 =?utf-8?B?SzlIUWs4RXBVOXIyWTZLeDFCSjkvQVl4R0FFMzh3VEJZN3hlSTlRUlRrSUxT?=
 =?utf-8?B?NXVlZVkzdjlJeGhSbi92a3dvQUZhY0IrSWpiT3pyNTZTMFdNbGc0V2w2TDhY?=
 =?utf-8?B?b1dZVi9wRU0vVGMwK002OGdBRFROY29qakVWM1A0anNmalR4L1lSMUErdDZU?=
 =?utf-8?B?SzdGWFJ0U1JkL1dXMldnZ2RKK2NZcnZ1TVVDbUU1MHF5ekZ3TlRzMWhwMU0r?=
 =?utf-8?B?blY2NGoxeGdyNjZDUEMwcmRGc2lYd0hvTC8yQ1B2dUhWVUxLU2hIVHh4Vkt0?=
 =?utf-8?B?UVBDV20zRmZrL3FaWVhMdEtkSXJnM3IzQUxkRFJxb0dyWGdsK0ltSktseXVM?=
 =?utf-8?B?RTRUaG8vcDJEcnBibC9QZW9CU3pNQ0Z5QzRDUExyM1lpQXUyL3JuOXZSTXdJ?=
 =?utf-8?B?TVYza0dWMUVpL0txZURNVWpEMUVNZVJ3a2RsTWg2T2JoSElwa0gvSkJrNW5q?=
 =?utf-8?B?aHBWdFU0bmNObXIwc2didFIzTXRWc1JPck5FTG9ZRjRWeFpaWXhoTnQ4aHdh?=
 =?utf-8?B?SWJQTHMyQ2M4WmxCR0VNcTVvQTV5YlcvSFFzQllHcUVGR1dtVkxiTDFxOUl1?=
 =?utf-8?B?ZnRCZHFsYlp4cjR4eHpkamFNNUVyM29VRER0cCtCd1JGaE1JS2NJQ3RCcE9P?=
 =?utf-8?B?YU1NWkZUR293VEthSzduQ055VloxTGlUbkxKYm9PR2wwM3hENllMdkR5bVpJ?=
 =?utf-8?B?Vlc3bDdTeU5hRjYycXFqTFhjYkI2VmRnZTRMb2hGVm5JVHhlaXlwMWhpUklQ?=
 =?utf-8?B?WDhsbksxNGFtcUNIbTZCTmJ5TmpJN09seE4wU2lhNGUvb3FyMVdlWUlONHVS?=
 =?utf-8?B?NndhTHlxWVhTODBHc0dqcXBlaVM4QUdDbWFIenRvc2pWczRSelJwM1dRK1Bi?=
 =?utf-8?B?Z1ZPUXNrcHFrRTNDekU4SXFsUGxZNEliTjBaTFZnOXlxcWRZblZ6S0srL21Q?=
 =?utf-8?B?enkyNXhVclpZY1RGam1zckkwOEt4UlRIbjFjWkRtOU16Ris1clhSb2d0Szlj?=
 =?utf-8?B?T2xpckJUaHc2emxjM1NvOXlEQ3c4cGc0bGJIN3JRRmRLVm9jNkZxQW5oS2pO?=
 =?utf-8?B?ektnSlEyYkFIRjNaS3dsc3BuNGpIM0ZJb3VkbW4vRzh2QU1UMHVmWkVRRUV3?=
 =?utf-8?B?VnJidnM4SytQUWgvTVhYQkdOSkl0M3cvY1R6TDR0L0NWQkdjOWpUbjhWM1pC?=
 =?utf-8?B?T1Z2bDdTZ3U1dy9LVDVsNHUzN3RGZzBRTFplaGxNa2VUK3VUSkYyb1cwd0p2?=
 =?utf-8?B?VTgvMFprRlNtdFFJNmpFejhRUXNjbWpHSTdRa1RMNnR3Tnh2MXR5R0hNVEJj?=
 =?utf-8?B?WndoRHJSWUNRUEF4U3FBZXFheVBsWUR5UWVaMEcxV3grSkxSdisrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6df0ad-30ac-4dee-c1af-08decb52a305
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:54:51.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woU9IWi5qPZ+5+gFZ2jtvUwhnxxdBU9WJPszRz3WDzXJNpJAkVxiPOuLliCZQDlFekD2XVd/EdBPpSfmtAtqBVJKkjQu5GWq5l9JO55VAxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10535
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38520-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:conor@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:dkim,amlogic.com:email,amlogic.com:mid,amlogic.com:from_mime,linaro.org:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:email,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A479F68B8E7

Hi Krzysztof,
    Thanks for your detailed review. After considering the feedback, I 
think this approach is not suitable, so I will drop this patch.

On 2026/6/15 13:32, Krzysztof Kozlowski wrote:
> On 15/06/2026 04:47, Xianwei Zhao wrote:
>> Hi Conor,
>>      Thanks for your review.
>>
>> On 2026/6/12 01:39, Conor Dooley wrote:
>>> Subject:
>>> Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
>>> irq property
>>> From:
>>> Conor Dooley<conor@kernel.org>
>>> Date:
>>> 2026/6/12 01:39
>>>
>>> To:
>>> xianwei.zhao@amlogic.com
>>> CC:
>>> Linus Walleij<linusw@kernel.org>, Rob Herring<robh@kernel.org>,
>>> Krzysztof Kozlowski<krzk+dt@kernel.org>, Conor Dooley
>>> <conor+dt@kernel.org>, Neil Armstrong<neil.armstrong@linaro.org>, Kevin
>>> Hilman<khilman@baylibre.com>, Jerome Brunet<jbrunet@baylibre.com>,
>>> Martin Blumenstingl<martin.blumenstingl@googlemail.com>,
>>> linux-amlogic@lists.infradead.org,linux-gpio@vger.kernel.org,
>>> devicetree@vger.kernel.org,linux-kernel@vger.kernel.org,
>>> linux-arm-kernel@lists.infradead.org
>>>
>>>
>>>
>>> On Thu, Jun 11, 2026 at 07:54:33AM +0000, Xianwei Zhao via B4 Relay wrote:
>>>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>>>
>>>> Add the hw-irq property for each GPIO bank and enable interrupt-parent
>>>> for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.
>>> Uhhhhh, what? Why can't you just use the normal interrupts property?
>>>
>> The interrupt cannot be used directly because the GPIO bank only
>> provides an IRQ base, which does not have a one-to-one mapping with the
>> actual hardware interrupts.
>>
>> On Amlogic SoCs, GPIO interrupts are handled through a mux. Multiple
>> GPIO pins are mapped to a limited number of real interrupt sources. The
>> implementation can be found here:
>>
>> https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-meson-gpio.c
>>
>> To use a GPIO interrupt, an unused hardware interrupt must first be
>> allocated, and then the corresponding mux register must be configured.
>> This allocation and mapping are already implemented in the existing driver.
>>
>> In that driver, the mapping is performed dynamically rather than simply
>> calculating:
>>
>> irq = irq_start + gpio_offset
>>
>> If the interrupt is used directly, only the GPIO index can be obtained.
> 
> If it is performed dynamically, then it is not suitable for DT.
> 
> You still did not explain what hardware aspect exactly is described by
> "hw-irq".
> 
> 
> 
>> The real interrupt number cannot be derived by simply adding an offset,
>> because the hardware interrupt must be allocated first. Pre-allocating
>> all interrupts during initialization would prevent later GPIOs from
>> obtaining available interrupt sources.
>>
>> Perhaps other names would be more appropriate here, such as "irq_start".
>>
>>>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>>> ---
> Best regards,
> Krzysztof

