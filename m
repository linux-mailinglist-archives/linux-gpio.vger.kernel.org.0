Return-Path: <linux-gpio+bounces-15667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 007BAA2FAE2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 21:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3889118841B5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 20:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CE4264605;
	Mon, 10 Feb 2025 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="iSI987xT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0081.outbound.protection.office365.us [23.103.208.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF45264602
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220202; cv=fail; b=XNuvV8I1qV5wzi2E7dKglwI+26PJOshQuGxoeltpdJpg2NAKtvzkVh76cv31lbsbVKgWiSw3wJ4uLwP8v9F363iMEgomcEQn+0MrbSgHuViohTMHDWMEFY8KE3lYM5+XDF9zWkLDPXmpiQPHvvZh/bdSTwTu5yj/9NT64P1VsIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220202; c=relaxed/simple;
	bh=EHGfQYI8UwIvoxm3gDV7rocDmAq4konVt2QILm9QY9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LZlWwKrXJTW3mZZf6+ulOgpsNVCjIimHWwhC3PNA+4bTZJuZxkmhutY8gkn9CslWFBvg9MnsmB69XdS63+bjojUnbd+g4XuNyZkbXo8f2YXR+/El6K4y1qqRbroWQ/CoPx1as7uiyk+wYTaziy7AwWTSUPSbGz06i57s2x13jIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=iSI987xT; arc=fail smtp.client-ip=23.103.208.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=UnebQT6OPQKbOYk57cltBurCJ/1IDoxdvtmnVUOvln+zExfuuAtwPpoNL1+8etwxc/pE2yCoKa9FprQdFNHKr3fBDXXwdoegowBiEGRNRrK2F1lMhjFFsSakao6dI8qeRMVDJ25SWdA4oNVIFmprWxWxMhcxEXWsuc2+48FZgpoEjJYaaY/UVKc9prtOLSJ6s38wMHfF5Aubs6+3JdNN7PHOVFVByDyUqHEtUMnazYIA3D2hORiit8IeEFRcNOcubkOf0psDT48ffUMU5LhJnjWa9yspEX1oVwyKptmOr399RwbPkAhgUQ+v2fDbqgiZ7edGoiRR35Xs45fPXz0qxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHGfQYI8UwIvoxm3gDV7rocDmAq4konVt2QILm9QY9o=;
 b=OW5Gd57ckeJ9rg7qmGv1ZZNeSHzjfG2wHhdcWV60P6Gk4lr+e94DATmQv75cQIDV6xQkOEzIQ0BAxpbVsE/TVogG3SlG8tHOxdxui+apUd1UXWmdVIGai5SgIf6/QGKPEmH4xlOmdVmhMSxDUgj0Fiqpb318Y04k4nHD9qw6/NkbmAyjub3Q/mN5v5VDk8r2MFv+b5xjTOHQmZ4NK4HI++JcC+W3glQ1uer8Ks2kmbRcmCi8lBvM1oYNvsjeKf7nFKlS9BW+wSvGhsPA7lulSj3aQH2QpF6Gqa4mK/Emi3w0JvdBpM6MeeapVuZexGXGVJKurbbLZbIpA7cqu9LVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHGfQYI8UwIvoxm3gDV7rocDmAq4konVt2QILm9QY9o=;
 b=iSI987xTMqVFPVcCCpEtGSon7OrMQOy+gLZ8eUMcXk8BSiS60ylXzN845fes9aO7OCY3lrJyTJTqorBQ+x7LUfDOh/ztqun98UmUv8I5eq0yI7kzR4rahy7SEbQIWwiUPg636cu379fHUq5VMFEt4AD4vJ5zpByX3XP69M8/5m5X5EyGtzLwM+Xe1kog7shcsd9pwcYgV0B/4UC0J243bEXYYo9pnJ5NyOZXfbC1ZRRE1An4NQH1gt2TvT4nSzE+fbnHWEUjTjtvG3V5LtJwLT5ClYZNu4aiNOophi8IJX0FYpBDn/hOse0XbXD1j4VnGX3kY5yTHKYcdUJ0O+KKNw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1727.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 10 Feb
 2025 15:10:50 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 15:10:50 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Erik Schilling
	<erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [External] - [PATCH libgpiod v3 13/16] doc: add documentation for
 GLib bindings
Thread-Topic: [External] - [PATCH libgpiod v3 13/16] doc: add documentation
 for GLib bindings
Thread-Index: AQHbeJHMAnrsOtuEoEavwXT702IyErNAoZxA
Date: Mon, 10 Feb 2025 15:10:49 +0000
Message-ID:
 <PH1P110MB16032914796D8FE520943F359FF2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
 <20250206-improve-docs-v3-13-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-13-2065191fff6f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1727:EE_
x-ms-office365-filtering-correlation-id: fd821495-bc26-47d7-44ca-08dd49e51aa7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elVqalFGZGgxR1V3c1FCR214R3A3ZnE2VC9TT3RVSkNQUkhzdDFpOEg1a1BJ?=
 =?utf-8?B?VUp0QTlGNVY4cDdUQldOY1ZKQ0RkWC9hRUxKbGJBT0dwVTc0Q0JwLzY0S3dk?=
 =?utf-8?B?eTF3bmo0WFRXcUc1Wk9PVjA5aUlURko2Q244NXJOa3hweStHMzVZNkJqUE1k?=
 =?utf-8?B?bnRiN2hRbG0yNi9rby9TQXZwcUJ4TUEwaTdWMUhxOU5XRkR4dGc2MXVBekgy?=
 =?utf-8?B?NTF6ZGRZWThQVmRTVlNmQWlLeko4NzNtZnBuRUlveWRZZ1Z5QUw2VkU4b2N0?=
 =?utf-8?B?dlQ1dldyVHBPdHRLcmVpWjhFLzZYWkI2SldkdDJvWGJtVk83TytKQ3hOS012?=
 =?utf-8?B?Rk1wMFhsZjZVSlR2STQ0SVhPbmY3L0QwUGJNV2lZcWRsWkZ4aE8rbStvWG83?=
 =?utf-8?B?SjB5Lzhrd3VEbThJVlV1bXFTUGlUSlh6ME94Y0hFME0xZXlTM1U2OXA2bHc4?=
 =?utf-8?B?Q2t3YytqK3pVY1RZTjFNMDU1WXh1ekhHUkFGYnlobU9DZnovNk9MZFJkQ2Jq?=
 =?utf-8?B?K0hzZzRLaXVrRSt0cEEzWk9DL2FxUTVtTkZtcDIvMDZPbDZjemFrc29wZWRG?=
 =?utf-8?B?bktRTlNYKyt5aHAwd1NldE55c2NkcUd1ZmxrUnBxdlEwcjRlaXFtWGlSMG9W?=
 =?utf-8?B?UGVIV1lOcEpSV21LZFhxK0wzN2I2OE1mN0ZLRy9SVzAvMDhIZ3BMdm44b1Ra?=
 =?utf-8?B?N0Z3QzQ4NUxkMnRuQ2VUczBzT2l3ZS81TG5HMzVhVzRCWWc0Mlg1YUl1bDQy?=
 =?utf-8?B?MGJNNDF6Y200R1BlbXJDOE0yR2M2SlFNcTVORFduOU5JSnBQVnJSVjlVWjN6?=
 =?utf-8?B?OS9aT290VFloT0lOS1V2VmtKNVNWZC9oWnlmY3hORWNHUnZ4QUtEVk5mZ0g5?=
 =?utf-8?B?Ly9uS1lJb3hQMXVjUHoxUldPWEltN3hpNHp4TmYrTTI0dFRYOFY2M3lVMXNY?=
 =?utf-8?B?Z0ZZQkNaQ1dPMjRDb0F6bCtlMmV4cC9NNkpUSDM4MitoQU1RZkNQWVc3YWdr?=
 =?utf-8?B?RXduVGR0SlFzNFpXeGFmaUpLM25VRDNIbkw3MXN6MTFUYnhIUXlXY1V3ZXFO?=
 =?utf-8?B?WjVxTmJpRWFqaTV6bWpoWUwzVmJ2V0hMTUlUY0dpNnhtd3E2UXUrQXZSbUdq?=
 =?utf-8?B?NmR3d3dibzR5WUFJYUR0aThmRzhVNUNrbXZ4c3NaaW1vNTFBcGMvZ0NHTmFC?=
 =?utf-8?B?Q2ZTR1gvemRoYlptMFVTa3ZlaitYZ21WMjc0eDYzODlBYm5QNDN6Nm5XQXZn?=
 =?utf-8?B?MFJwaTN2bjFBQnYvSHBqYTFqVnpDZ0RHSmlGa0U1eFIrcVRTSXVwL1lEbFNG?=
 =?utf-8?B?UWF1TU1DcWVXWlRGVFMrQ1Zpd2tyQm1hdmtUNUI1aElkN000d3V2aEQ4cUUr?=
 =?utf-8?B?alpoSzBUK3ZwVEtjcnZsUDB3Mm5ySldBeUUxZnJhSEx0MXdpTDdJQU1Relpy?=
 =?utf-8?B?THVsenJ5NFkzbG5ubnliMDJ5ZVN1YkFTQTNiODdGekYwdjBJeU02ckYrY3dw?=
 =?utf-8?B?alEySWhVOU00aXFqNG05S0FVZmFycjJGMWJGRDBtR29kR1hhd2VycHhVcmJT?=
 =?utf-8?B?NGExdlRLTEp6R2JXZlV1ZVhPWWhTR0xCRm0zRTNvMUV3Q0VnVi9lRWlZUXpB?=
 =?utf-8?B?VklWa0VmaGJVaWV6bHFNM1lRYUxOckk5dlJYRUtobDhUdXdKT0ZpU09sYkly?=
 =?utf-8?B?VVlCT0JFMnUwSmNmeGdSMkxSVnpwcUJKVFJCLzNLL3FBV3pIdm11dXA5TGJi?=
 =?utf-8?B?VTlpbTBNL2NERklHWUkvVW9XSkxTZUNoM1c1ZTIxSGROUkVZMGh4SGYzNGM4?=
 =?utf-8?B?ZUhLQUtQd3BRak8vUldDRGw2bVhxNDJpdS9uaUxVZVZYOFJudHhsalc2SFpV?=
 =?utf-8?B?NUgwQUxuRnRtOVp0K0JQVDNGQ3ZOOFptdmhodWd1ZW5uVkNpbVdtQkkzcjZs?=
 =?utf-8?Q?vDLJY/AOJjaGxsWxGNokWwZ8t3VNL0mF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHBRNWhLTGsvUzBNTE9obFQ4Z2JGUkZKbTY4ZEtFSTU0RktPRWpFdDJ5cEQw?=
 =?utf-8?B?QkpLREUrUE0wdEpoS1IwczdSczZDN2psY3dtYmFwTGp6T2dnVzZieEVhYUU1?=
 =?utf-8?B?MlkrbThqS0Q3a3JvVUdNYmt1eXZ4ZzkvaGY0ZXBlQStOc2Jha2phRkttNW4y?=
 =?utf-8?B?R0dwNFZtNGdhclYvQ2ppdWFSQ2JvYmNrYStneDdsVXVXMWhSVlFTK0ZKRWVh?=
 =?utf-8?B?bitSUU9OQ0U5aFJEOGdDbEZScDVySzJIdEdoQmpNYVFYVVlxS2dhTlBwbDM2?=
 =?utf-8?B?cW14eXkzem9IdHk1Tk8wNWR0ZVhFS08yM21yeWQxQ0FZelQ0Ylo3OGhYNG9y?=
 =?utf-8?B?N0FCM0JpbEM3UTZSMHN3c01Iak1iMkNnajBwdmNhRGhTbzNYNFBvbFM4NW5H?=
 =?utf-8?B?R2ZxN1RBZVFVZGdQc3ZRR0Fub09WZ0k2QXNMM0l6d1lPWWp4bVV1VWZSUWI2?=
 =?utf-8?B?YUk0S09TOWJNZEtzT3ZkVFBGUFVHSzJJdStDcEw4V3A2YnpmbWhtUG8zSkpk?=
 =?utf-8?B?TWFrcldBaFZ0NW1rT3RRZXRmQkxid093UDgvc1pHZ21MTkVRWlh5K3Z4RHVy?=
 =?utf-8?B?VHN0RTBlZndrMEM0UG9BUnJ6MXlOUkJ0bFp1Mm51SDE3RUVMVG5MczVTM1N0?=
 =?utf-8?B?L3JJZ1Z1S0xPSWZqRFNSb2piUTFncHpxTjRNSTllVG9VdllySkJsNzNjTFl2?=
 =?utf-8?B?cERIS3ZkaWxHTXRUSHhiVGpMRXM1NzBNVVZEeG40UzkzWU1UNUIraTlwK2Fz?=
 =?utf-8?B?K3NGMnQxN2pUZk52R0ZQK0lzeThLNmhVdHM3a1NJR0FTd1VjVW1lMVhBdXlU?=
 =?utf-8?B?NmtUU2tZVXJmcFlrNGdBM043dkFMMEMwZ3dDOWZCZTZaQ04vZjRQQ3Q4ZVdq?=
 =?utf-8?B?K3dKMFJxcFNTM0I1ODJqZTRVVHNaK04rNUVaZ3d0Y2NUVmt6OWt4UWZ2aThZ?=
 =?utf-8?B?QjluRlVyY1poVmtMVUh3Z1ZSTkdKek00QXJ4Q3R0RlVxdnJUV1cweEhYSW53?=
 =?utf-8?B?NDFlTUoxY3luMmRLcFZwT1V6NW5WbzIzbVdCRVltYXRlWFRNQXN2T01hWCs2?=
 =?utf-8?B?SVFhM3VOWGdURjZtSXU0TmVrUUp4Q2E0TVpXVFEyL2ZuU1VwU0VMeE9BWU5L?=
 =?utf-8?B?UEt6Yk0yMUxqelozc1Z0S1lzQ0txa0RkSEt4SmdOZlkza2NtSkdWektnWTZF?=
 =?utf-8?B?RUhWQTYwVEJqMkpZdmFpdDVIVzJDMDljd3RsdkIvamdITUMraU9qd1ZOWGdZ?=
 =?utf-8?B?eldJemlyWSsrRWlzSEpaSThGaldPU1dmempHb1A3clBJMHBHYmQ1L0Vqd1hL?=
 =?utf-8?B?R1lNalpUbHdjT0JUVmtlVlM4dzV3TUVmTlBuL1hkUnBoajcrVitJeGJSam9O?=
 =?utf-8?B?ejdPR0VhdUZYV1VJMW1hN0JudGxFbUNjRmxDQ1NwZWNhNERKRU01Lzkxd2hB?=
 =?utf-8?B?RWJ4ZDJWMDNhYnROOTJpcVNyM0dxSlF3ZFcyWXRIVXRtNkZJTjBEMmZCYkFH?=
 =?utf-8?B?aWk2em5hYVNDTzMva3RsbGUvb2pMYVcwMDRTRlF1eFVTL2Z1NjF6c2NtNTYw?=
 =?utf-8?B?MHRveC90TVlaT2VCbjl1RnNudmlQVkliNVE2QnRRNkt3M3lDMUxpSDNJZXNR?=
 =?utf-8?B?R3NVYlc1M2VTdUdnRlU0dHdFSVJEZ0kvRnBpVmRUWlZWdXI5aWsvdEpVS0c1?=
 =?utf-8?B?UkJOVWZQQjJXOTgxeTBJZnFqdHpkM0tYVitxMmI4cVFodUdVK2l5NjcvOXdB?=
 =?utf-8?B?OHhkQjJOYUpkN0d1b083elE5VzVZeHVBRFF5YVFML3JNVzdrbnlJTkFrMWk1?=
 =?utf-8?B?cHRlWDhtNWpIdDNKQ0w4Sm5EdUZIWW53MGQxd2dNMFRNUVNWVG9yMTZWWVpX?=
 =?utf-8?B?a1BSZkU1WngwUTRuT1UwVVpIRGhJbGcydFhhTDR3M3d1dlBFYmc3MFpjRzND?=
 =?utf-8?B?NFAxL0RjaWk3U3JmdHR1QVpZaldaRUZvVnI4ZGtUdmI4Q213c0lrWmREOXp1?=
 =?utf-8?Q?ccS7B/RfwGJdo7+nar4UQ/SrNcKCCk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd821495-bc26-47d7-44ca-08dd49e51aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 15:10:49.9527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1727

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYsIDIwMjUg
NjoyMiBBTQ0KPiBUbzogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgS2VudCBH
aWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPjsgRXJpaw0KPiBTY2hpbGxpbmcgPGVyaWsuc2NoaWxsaW5nQGxpbmFy
by5vcmc+OyBQaGlsIEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsNCj4gVmlyZXNoIEt1bWFy
IDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gQ2M6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIC0gW1BBVENIIGxpYmdwaW9kIHYzIDEzLzE2XSBk
b2M6IGFkZCBkb2N1bWVudGF0aW9uIGZvcg0KPiBHTGliIGJpbmRpbmdzDQo+IA0KPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+DQo+IA0K
PiBUaGUgR09iamVjdCBkb2NzIGFyZSBnZW5lcmF0ZWQgd2l0aCBnaS1kb2NnZW4gYW5kIHRoZXJl
IGRvZXNuJ3Qgc2VlbSB0byBiZQ0KPiBhbiBlYXN5IHdheSBvZiBjb252ZXJ0aW5nIHRoZW0gdG8g
c3BoaW54LiBMZXQncyBwdXQgdGhlIEdMaWIgZG9jcyBzdGF0aWNhbGx5DQo+IGludG8gdGhlIHNw
aGlueCBvdXRwdXQgYW5kIHJlZmVyZW5jZSB0aGVtIGZyb20gdGhlIGJpbmRpbmdzIGNoYXB0ZXIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFz
emV3c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgLnJlYWR0aGVkb2NzLnlhbWwgfCAgOSArKysr
KysrKy0NCj4gIGRvY3MvTWFrZWZpbGUuYW0gIHwgIDEgKw0KPiAgZG9jcy9iaW5kaW5ncy5yc3Qg
fCAgMSArDQo+ICBkb2NzL2NvbmYucHkgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICBkb2NzL2dsaWJfYXBpLnJzdCB8IDIzICsrKysrKysrKysrKysr
KysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL2NvbmYucHkgYi9kb2NzL2NvbmYucHkgaW5k
ZXggM2QwMjA5YS4uMzNmYzg5ZiAxMDA2NDQNCj4gLS0tIGEvZG9jcy9jb25mLnB5DQo+ICsrKyBi
L2RvY3MvY29uZi5weQ0KPiBAQCAtNjIsOCArNjIsNDYgQEAgZGVmIGF1dG9kb2Nfc2tpcF9pbml0
KGFwcCwgd2hhdCwgbmFtZSwgb2JqLA0KPiB3b3VsZF9za2lwLCBvcHRpb25zKToNCj4gICAgICBy
ZXR1cm4gd291bGRfc2tpcA0KPiANCj4gDQo+ICsjIFdlIG5lZWQgdG8ga25vdyB3aGVyZSB0byBw
dXQgZG9jcyBnZW5lcmF0ZWQgYnkgZ2ktZG9jZ2VuIGJ1dA0KPiArYXBwLm91dGRpciBpcyAjIG9u
bHkgc2V0IG9uY2UgdGhlIGJ1aWxkZXIgaXMgaW5pdGlhbGl6ZWQuIExldCdzIGRlbGF5DQo+ICty
dW5uaW5nIGdpLWRvY2dlbiAjIHVudGlsIHdlJ3JlIG5vdGlmaWVkLg0KPiArZGVmIG1ha2VfZ2xp
Yl9kb2NzKGFwcCk6DQo+ICsgICAgIyBGb3Igc29tZSByZWFzb24gb24gUlREIHdlJ3JlIGluIHRo
ZSBkb2NzLyBkaXJlY3Rvcnkgd2hpbGUgZHVyaW5nIGEgbG9jYWwNCj4gKyAgICAjIGJ1aWxkLCB3
ZSdyZSBzdGlsbCBpbiB0aGUgdG9wIHNvdXJjZSBkaXJlY3RvcnkuDQo+ICsgICAgcHJlZml4ID0g
Ii4uLyIgaWYgb3MuZ2V0ZW52KCJSRUFEVEhFRE9DUyIpID09ICJUcnVlIiBlbHNlICIiDQoNCkJ1
aWxkaW5nIHZpYSBgc3BoaW54LWJ1aWxkIC4vZG9jcy8gZG9jcy9zcGhpbngtb3V0cHV0YCBzZWVt
cyB0byB3b3JrIG9rIGJ1dCBidWlsZGluZyB2aWEgYG1ha2UgZG9jc2AgZG9lcyBub3QsIG1heWJl
IGR1ZSB0byBgbWFrZSAtQyBkb2NzIGRvY3MgYCBjaGFuZ2luZyBkaXJlY3RvcnkgYW5kIHJlcXVp
cmluZyB0aGUgcHJlZml4IGJlIHByZXNlbnQ/DQoNCk1heWJlIHdlIHNob3VsZCBhbHdheXMgdXNl
IHRoZSAiLi4vIiBwcmVmaXggYW5kIGV4cGVjdCBjYWxsZXJzIGZyb20gdGhlIHRvcCBkaXJlY3Rv
cnkgdG86IGBwdXNoZCBkb2NzOyBzcGhpbngtYnVpbGQgLiAuL3NwaGlueC1vdXRwdXQ7IHBvcGRg
DQoNCih2ZW52KSByb290QDk5MzVjY2UyNWFlMTovd29yayMgbWFrZSBkb2NzID4gL2Rldi9udWxs
DQphdXRvcmVjb25mOiBleHBvcnQgV0FSTklOR1M9DQphdXRvcmVjb25mOiBFbnRlcmluZyBkaXJl
Y3RvcnkgJy4nDQphdXRvcmVjb25mOiBjb25maWd1cmUuYWM6IG5vdCB1c2luZyBHZXR0ZXh0DQph
dXRvcmVjb25mOiBydW5uaW5nOiBhY2xvY2FsIC0tZm9yY2UgLUkgbTQNCmF1dG9yZWNvbmY6IGNv
bmZpZ3VyZS5hYzogdHJhY2luZw0KYXV0b3JlY29uZjogcnVubmluZzogbGlidG9vbGl6ZSAtLWNv
cHkgLS1mb3JjZQ0KYXV0b3JlY29uZjogY29uZmlndXJlLmFjOiBub3QgdXNpbmcgSW50bHRvb2wN
CmF1dG9yZWNvbmY6IGNvbmZpZ3VyZS5hYzogbm90IHVzaW5nIEd0a2RvYw0KYXV0b3JlY29uZjog
cnVubmluZzogYWNsb2NhbCAtLWZvcmNlIC1JIG00DQphdXRvcmVjb25mOiBydW5uaW5nOiAvdXNy
L2Jpbi9hdXRvY29uZiAtLWZvcmNlDQphdXRvcmVjb25mOiBydW5uaW5nOiAvdXNyL2Jpbi9hdXRv
aGVhZGVyIC0tZm9yY2UNCmF1dG9yZWNvbmY6IHJ1bm5pbmc6IGF1dG9tYWtlIC0tYWRkLW1pc3Np
bmcgLS1jb3B5IC0tZm9yY2UtbWlzc2luZw0KY29uZmlndXJlLmFjOjU0OiBpbnN0YWxsaW5nICdh
dXRvc3R1ZmYvY29tcGlsZScNCmNvbmZpZ3VyZS5hYzo0MDogaW5zdGFsbGluZyAnYXV0b3N0dWZm
L21pc3NpbmcnDQpiaW5kaW5ncy9jeHgvTWFrZWZpbGUuYW06IGluc3RhbGxpbmcgJ2F1dG9zdHVm
Zi9kZXBjb21wJw0KYXV0b3JlY29uZjogTGVhdmluZyBkaXJlY3RvcnkgJy4nDQovd29yay92ZW52
L2xpYi9weXRob24zLjEyL3NpdGUtcGFja2FnZXMvYnJlYXRoZS9wcm9qZWN0LnB5OjExNjogUmVt
b3ZlZEluU3BoaW54OTBXYXJuaW5nOiBTcGhpbnggOSB3aWxsIGRyb3Agc3VwcG9ydCBmb3IgcmVw
cmVzZW50aW5nIHBhdGhzIGFzIHN0cmluZ3MuIFVzZSAicGF0aGxpYi5QYXRoIiBvciAib3MuZnNw
YXRoIiBpbnN0ZWFkLg0KICBzZWxmLl9kZWZhdWx0X2J1aWxkX2RpciA9IG9zLnBhdGguZGlybmFt
ZShhcHAuZG9jdHJlZWRpci5yc3RyaXAob3Muc2VwKSkNCnVzYWdlOiBnaS1kb2NnZW4gZ2VuZXJh
dGUgWy1oXSBbLXFdIFstLWZhdGFsLXdhcm5pbmdzXQ0KICAgICAgICAgICAgICAgICAgICAgICAg
ICBbLS1hZGQtaW5jbHVkZS1wYXRoIElOQ0xVREVfUEFUSFNdIFstQyBGSUxFXQ0KICAgICAgICAg
ICAgICAgICAgICAgICAgICBbLS1kcnktcnVuXSBbLS10ZW1wbGF0ZXMtZGlyIFRFTVBMQVRFU19E
SVJdDQogICAgICAgICAgICAgICAgICAgICAgICAgIFstLWNvbnRlbnQtZGlyIENPTlRFTlRfRElS
U10gWy0tdGhlbWUtbmFtZSBUSEVNRV9OQU1FXQ0KICAgICAgICAgICAgICAgICAgICAgICAgICBb
LS1vdXRwdXQtZGlyIE9VVFBVVF9ESVJdIFstLW5vLW5hbWVzcGFjZS1kaXJdDQogICAgICAgICAg
ICAgICAgICAgICAgICAgIFstLXNlY3Rpb24gU0VDVElPTlNdDQogICAgICAgICAgICAgICAgICAg
ICAgICAgIEdJUkZJTEUNCmdpLWRvY2dlbiBnZW5lcmF0ZTogZXJyb3I6IGFyZ3VtZW50IEdJUkZJ
TEU6IGNhbid0IG9wZW4gJ2JpbmRpbmdzL2dsaWIvR3Bpb2RnbGliLTEuMC5naXInOiBbRXJybm8g
Ml0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJ2JpbmRpbmdzL2dsaWIvR3Bpb2RnbGliLTEu
MC5naXInDQoNCg0K

