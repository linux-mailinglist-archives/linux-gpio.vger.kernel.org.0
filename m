Return-Path: <linux-gpio+bounces-25000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBEB37619
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D92A167D5E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 00:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C59315B135;
	Wed, 27 Aug 2025 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="GeD200Fd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0053.outbound.protection.office365.us [23.103.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D8F4F1
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 00:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756254420; cv=fail; b=miblRQACJRM6eBGE5RU/5IcyJB77O4kQdSYSK3RTHLgDMtl+sMtLSa6mb8sfSN0DdV3dQkA9An7/+gY3S268SB7BbNm+FZkCVY3ZRUID0VSRc5aTU0OWsvbxsuFHdH4bX61qGxUV854nE2G9C6iUwOeA2HyECjt975nTe5eLXaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756254420; c=relaxed/simple;
	bh=UHvRHpPqkYuJR+HHWJ+SGPrS40IpmSlGrPvthnnsIW8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RhIyT3i888BsgziCYClbfxXKlZHrPsBI1p0gHQUIt8qQZM0PCwzPxTh0hM/NQxwMiwiE1/EMo6R0o48+DsILX59bGhhDi6RthiXoTtDC36qY3fD7xAGmdU9AT/MpKdImslEy9EZ7ZeyUl7Ji0lA0drfKhrTTCK8L4VfeobFMo8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=GeD200Fd; arc=fail smtp.client-ip=23.103.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ZTqjaOedPhhmZtsqwrlvBU56xP/iYHCuFJYWUigO6yyGUlU9z3TxI1zBmSVi5nBo/q8gWwm1IYR1a7qZtcbU22bM3NVF+kgpTQDAldXGiv6D4o17n4sy6SRn1ddbASsmDoYogIsx4qkkLZ6W1FGPNMiJE4faUvtuk8xYpBOejXlQLIy2E5TRs0RP22grq6mLTZrWgJGUk08bjDMtWXa4Ns8w/NeP71QLruiiXlHdXn1yd0SIpTMFZ7P3QV9nRNEYJnCwaL/2ziFtfoDNIhj39kQiZprX3MXtUtD3JKlBWcykpQUPD7SpWK3VgT7KqXkvVcEnwUkQJwJpr2sPwLrwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHvRHpPqkYuJR+HHWJ+SGPrS40IpmSlGrPvthnnsIW8=;
 b=pBQBbwTX86cfStMMj6yjC2Sq0cChBcHlvFQGwGN+rW766PWJjJFHc/Yt8GrE1cYr3T8AlicaPHALt1badRrT5vfydKqi4JZZN/JoKNNI55SD5/zPwFm4XIByxTzcnMt+ZFQkXZ4ysQS4ioQwayfF2Zj12TqvpTg+2HXDFolbDeEN1NjMwzQz0OLVf6iyKBx4Ro0M7YQzdXByTJPQPwZemD0VAVEQwTZ35y50Fh9DwKaGLuraZaYe2tq3EB6eOHbkvCUFYd3FKNqyjwUV6vkEX2R/5llVO6DhFYXx/RuRlFcJFRpQTERT8bl/1ryOJ+c6aLix2MBgg5V1wc5mgqR7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHvRHpPqkYuJR+HHWJ+SGPrS40IpmSlGrPvthnnsIW8=;
 b=GeD200FdwMChkXrja91wr5xJkONNYJLezfCzcCVc4H1AMPwwIFdJhQEuxTEL6t1zYMUFi4OaLsktNsjxui3TCCGy2ibb843eZpYJGrDFHHuUSSEXJLiYuc4TnWh/m8W4vLvy4TG85VVcFYIytPKQ2g4ozvzEm5vol6JZnQ1km5XGmahenhvoJQ/CaP9uoii2YZYnlqtgMXyR2V6u7Bbt9wBUNUSRuByBZUHs1GhgUVzgo7eSN/529Kx8ao8l1JPo3+RQXNb46TXv58K+OmxfpACrBqP0FUoPNs4EPDDMcA9FNVDfgixSXSIAov0oVwTUJOaUloOiKdFUU3vYie+D1A==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BNAP110MB1869.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.32; Tue, 26 Aug
 2025 17:54:29 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9031.026; Tue, 26 Aug 2025
 17:54:29 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] build: bump required GLib version for tests to
 2.74
Thread-Topic: [PATCH libgpiod] build: bump required GLib version for tests to
 2.74
Thread-Index: AdwWsSqYiIfNlQUiT++1Qaqyu/rbHQ==
Date: Tue, 26 Aug 2025 17:54:29 +0000
Message-ID:
 <PH1P110MB160390AB37F4D9216E5A7FA09F39A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BNAP110MB1869:EE_
x-ms-office365-filtering-correlation-id: fb8aac36-efac-4a75-c095-08dde4c99ad3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SE9vR3dZeWNDd0sremVpWFVtRzdGQ2t2MGIvdVdPazFWVmpXU1Y0T2lEczVL?=
 =?utf-8?B?MG1TWjdWT2FzZSsrUVNBNk9rREJVMU1WSUZYQXlsQkxmNFJvL0crQU9jOVJH?=
 =?utf-8?B?RHFJbUpoT2kyM0ZSZCs2bFF3VlIrT09lT2lVMkxxalg1elNwN3NzeEJBVGtm?=
 =?utf-8?B?R0ViN1Bhb2RyeFhxWWYzWEp3Yjl5ZGdOZEtLdDFQdExkeUQweDJ6d1pSeWJ5?=
 =?utf-8?B?dDNhbkVHZkFTYjlIYTZKMWk5cThrcTVURitZQ3lMMXI1VnNnRE9hVXJ6WVpx?=
 =?utf-8?B?L0cvWE9BUG10eEY2Sk5mbDZsL2tIc3d5KzZLY1lyc3AyUnZEaGdqa2hGWVVy?=
 =?utf-8?B?L3Zrdm4wMUZuNDk0emlXdWdFMFk0TE9IYlMvZ1REMVM1V2FiNHdYRkt0U2xx?=
 =?utf-8?B?RDRUU0FKWHdOdTdFUWQzNWE4TWVMMCtqazZIdHQzUzJJVzRlMHV4T0E2RTBx?=
 =?utf-8?B?dWFZWmJFNG45UlVvbkplNytsM0RDdEJCRVRhTnE0R2ZKQm01a0ovcnV5TnFm?=
 =?utf-8?B?aFZmT1VwdW1MQkpHRFRRbGt4Y2htVHdWeG56T0hSVmFEMlZwZUJEOEpjc3ZP?=
 =?utf-8?B?VXBVVHU2V2QxZitnQ1hKVVRQaUNIbDNXZXo4NzFRbVg3T2NiREVqSGtDV2Q4?=
 =?utf-8?B?Ung2OVlrZXZIeG9XNEtXc1ZDeGtyTVFhUW9pUnNVcDMwVTUxbXo5ZUJid3Bt?=
 =?utf-8?B?TGdDWWNvYVFtSHNzUEJaQnYwSWx6cFg5dnJVY3JTK3NERkwraGFETHdrSDFa?=
 =?utf-8?B?Sm8zZ29hYmRnM3FEc2ZaUjhYL1EzMFh1YWt2LzJDWmhITGIrM0NjMDV6NG4z?=
 =?utf-8?B?S2lGT0ZGbnVUQ2FjMEtMS2orek1EWklRWlhoKzh0bHB6OTFma3hlVFBkSHFE?=
 =?utf-8?B?YlJMVU05ZU92em5qTXFpQjUzZ0Q0cW5UVVpXdUIzWmZaNnRBNnMzRzVSSzhQ?=
 =?utf-8?B?dEw5TzBVS0hwTUEyU2F6MFBHWklFU2QzeGx3ZnpTK3daOTd6Ky9wejY2bFk5?=
 =?utf-8?B?aGxKeDVmUXNYa1hGb09yb1hRUW9JVHFqZTVPTG9HNUZmM0R1b3NsOVRScFQ1?=
 =?utf-8?B?TmNDdXNRYytZR2tlRGNnNCtXTEs5TVBMbTJEaDRHb2ZXMzFyRkY3Q0RqdnFm?=
 =?utf-8?B?aUFuS3JCamhpVVhGVmp1ZEJ0TzNOTGd4czlCc012UTV4RmExWWpacFNRYmtU?=
 =?utf-8?B?cGlhVjMxTStZN0hpbjZaSnd2SmFlSEI2ZFlQc3lBM0x0RjNrK3BMTEh5UUxt?=
 =?utf-8?B?d1JUQk5pdkJSTFhPb0RZUWhmZjU1STRXLzlmb3Nqc2dsQmp2VVo2N09FSDV2?=
 =?utf-8?B?a1ZHR2doWnpxc2luY3hlRmcxUkJYWXZkdEFiOWVCQmZEbTZSdVhtd1FrZWxB?=
 =?utf-8?B?ZjZSWG1FalluRTZ3VEhRcHJDMk5OaGZyYlRIUzBvM3BWb1phUDI1ZVRlT0JL?=
 =?utf-8?B?T0pxdEJrL1p5NkhXd0tudDg3aGphV0NkQ1VYUWllaUVMZTd3SFloVENlTU4r?=
 =?utf-8?B?ZjRFNHhjWEppaUNOVWthTXJBNFVyWXlmd2lLejhmNGRaTWxLWWx6V1JJcnln?=
 =?utf-8?B?MTZUUGxrZlRsRmxaTHAzMXdBTFdxSktBWm9NR09EckxrZndlcUFBc25nSkpN?=
 =?utf-8?B?ZkxEUDdmdnZkaTEwKzVEcEhJdjV3QitZakZmRnF0Wkllcm1MMm5jWkdLeFJt?=
 =?utf-8?B?MVpkcDNHdXdoQkZvV09RdDV3WTFSN05yTmFxOC9MaUJaZEV3akg3cjkzR1hV?=
 =?utf-8?B?d2thZXVhOVluWTNtQW5tZ0xjWE9DRGg0dnpGeStpTzhINU1tQWdBcFlWT3RW?=
 =?utf-8?B?ckMzZGVybXErSGNYSWNkVzN0aGt4dlZXdHZvQ29wT3o5T3VWTm0zcmNmU24v?=
 =?utf-8?B?NXBLcUcwWDVKZXR0M0xQWnMwV0dhUlNUaCtVOHpRMEFiUDZQMHl6SkVMYzdh?=
 =?utf-8?B?T00vR2psVFlDUFZqNjNTUVJFRGNlL0xrTE15dnAzUXpSc1BNLzNtcnBPYklu?=
 =?utf-8?B?Yi9LUlI4dHZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDlHSFdSeUJGN2lkT1habTlIQlYwWmtvTVh2NThacE8rOVAralVQeGlhTDZI?=
 =?utf-8?B?bEJ0b25neFBTa2gwcHhPcmR3WHRYQkRCbE9TbGFzeVlvUWVnZzRxd3FKRkFo?=
 =?utf-8?B?aXpQTktLOWVPVGg4OHRYS2ZqaHE5WDc1R2k4cVBIeURKa01rTEV3OUQ5WkRo?=
 =?utf-8?B?YkdQVHgvL2JXdERiYVdkM0JEVlBVNndVVHc1dElGNnBZb3gyeW9yRnR1QlI5?=
 =?utf-8?B?OWg2eUNmbzhiTzNBTlpUS1I3cWYxcWFLM2FBcmlGTjFORVBoUkNFTm5hUDVZ?=
 =?utf-8?B?RmVzYjdnVzFLd1BRa3NnL2JQWWJXcUpSdytaRi91MEEzdnlNZlR3UEFlU0RX?=
 =?utf-8?B?YVdqRGxjbXNmRGRuZ0FCc0Z4b3NwQU93SXJjNEQvSng3c1dsZ3BpTmxCVXNJ?=
 =?utf-8?B?eU1JNkJDVXZ4UFl4c3NPRlVPcjY3dVBlWDl2MFdMTGtOdnlrK09SMnpsby9z?=
 =?utf-8?B?c3FCS241cGtmSGYwOEhLeEh0Q2JrMHlQZHV0aXZHUzNrSytLVTA5ZHZXZ3N5?=
 =?utf-8?B?dDZqSUM5MVVJRUhCNHdOK3hpTVJPamZObHAwbkJDMk5OeDhheURhZ3RGMU55?=
 =?utf-8?B?SDZwMTRIMUR4bDFSQjFwcFhlVXU0a1h6UXJLTHJLVDYxOGU0dTJkQkNmd2lP?=
 =?utf-8?B?VmVVRUtmVEdNVG85OHN4NVNua1dCa1QzR0xaSVdlT3phZW5zZzE3UDZIN012?=
 =?utf-8?B?T1gvV1I5Zm5wcHJhQ1lna2ZzV09pNXcrRGFPRGN5M3h3VCttVGU0eXBDYnA0?=
 =?utf-8?B?dXhzbCs2Yk96QXJKNXdVbWJlZkxFYlR4SE41eTdnWVcyY2x0bHhXdlc0bVp0?=
 =?utf-8?B?a242dGJOTThjUVM1SU1yZklHendCbVUvUldxSmhwcnI4aXJNcVNpaEVVMVJH?=
 =?utf-8?B?VUVuV2JnYzZjc0F0TE5QS01IcUtWQVV1MVVyaTdoYTdabkVlYjltYzVFUUlT?=
 =?utf-8?B?ZzArdXR4akV5Z2xhV2ZaZVZkQVJNR2VQOW5mMFVxQUxWZE9lZWp3RWlPcUNC?=
 =?utf-8?B?MGVzM1V5dXQ3bnFoQkYwaFZ1a3o5TlRGNUlicFJLYWdqYkdnYjdacTJVaTJw?=
 =?utf-8?B?V2k4dGhlcHAyaldYbHVzbE1WL2I4Uklha3NhNVNDUkY1K24yVlpMZmtJMmFD?=
 =?utf-8?B?Q2U1NGhIcW5Sa29JYWhlcmlwaE5Rekg2Rmd2QjRDMytEakJHbGI5L1Jqajlq?=
 =?utf-8?B?RnZJZ1NsU0RudmRQVFIxWmVZaWdwZXdJdlYzcWtFTXFSb0syeGZ3WXJmUDlq?=
 =?utf-8?B?dDJFVk5SOGlad1lpQ281SVhXTlJ4UjBXWVpoU1puY2Y0MThSMWt2bk9lMVd1?=
 =?utf-8?B?SVlZVm5WdU1JWGN1R0Vmb3hNUTVrYjJWY3cxTDVyemNEU1pVbVZpbHlndXJD?=
 =?utf-8?B?elF3MUZnRFIxbllsL0h6SGlkeFh2TElyWlczYkM0eFd5RzNDSjNBQU1GUml2?=
 =?utf-8?B?N3ZPZ0pFMVpzVFFFTjNCVS9tM3FiNzZ1ejF6QjdZbmpsTElQV2w0V3lISTZt?=
 =?utf-8?B?MXRmcGdmVFg5VVJBSHJhOUFkZmNtVW13d0NTajVjeFdUK0NhVWwyUENUZDJn?=
 =?utf-8?B?cytOcE9oYmFZNnlabXJVRjJjNFVkNEs5cGVqMkNRZ2xUckt1M1FjMkltZGdw?=
 =?utf-8?B?NVovV1ExR3ZQNmRCdlFyS0hDb1NxYjJGVFZWaWRLWUU2VjdUUlAva2FrZi9U?=
 =?utf-8?B?b2FmSnJQTERTZDNOVnc4YzhTZDd4RGlNVGN5TXRITTBDL1ZrRWhVRVRnaWlT?=
 =?utf-8?B?eTRRWXNXSEJqRzliZGZPbCtVVVhlL0I0L2twV0djM0UvZUNMekUvWnNpQlNI?=
 =?utf-8?B?QzFJSkVUakxLMDVmZnVZeWxmYkt0SFhTb1NOanBsVFZTamVBMnBrUC9aY0kx?=
 =?utf-8?B?N2ZZRWFUaFpkOUtXMStPR3ZmNnBMYkJIQ1VEWUdFMklJN0NEYXlmZXJBMWJl?=
 =?utf-8?B?T2Q0Ym1aMlkzN0V3cTEvZGN5eXBKVGpmVEJjbUhLRkVqZENtcFRhWHdmb0NS?=
 =?utf-8?Q?5yj3nmt7A1A0mVRXC0A3MINHTDfIDI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8aac36-efac-4a75-c095-08dde4c99ad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 17:54:29.3117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB1869

PiANCj4gT2ggYW5kIEkgZm9yZ290Og0KPiANCj4gUmVwb3J0ZWQtYnk6IFZpbmNlbnQgRmF6aW8g
PHZmYXppb0B4ZXMtaW5jLmNvbT4NCg0KVGhhbmtzIQ0KDQo+IA0KPiA+IC0tLQ0KPiA+ICBjb25m
aWd1cmUuYWMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25m
aWd1cmUuYWMNCj4gPiBpbmRleCA5YjZjODYyLi5mZTk2NzM5IDEwMDY0NA0KPiA+IC0tLSBhL2Nv
bmZpZ3VyZS5hYw0KPiA+ICsrKyBiL2NvbmZpZ3VyZS5hYw0KPiA+IEBAIC0xNTcsOCArMTU3LDgg
QEAgdGhlbg0KPiA+ICAgICAgICAgUEtHX0NIRUNLX01PRFVMRVMoW01PVU5UXSwgW21vdW50ID49
IDIuMzMuMV0pDQo+ID4NCj4gPiAgICAgICAgICMgRm9yIGNvcmUgbGlicmFyeSB0ZXN0cw0KPiA+
IC0gICAgICAgUEtHX0NIRUNLX01PRFVMRVMoW0dMSUJdLCBbZ2xpYi0yLjAgPj0gMi41MF0pDQo+
ID4gLSAgICAgICBQS0dfQ0hFQ0tfTU9EVUxFUyhbR0lPXSwgW2dpby0yLjAgPj0gMi41MF0pDQo+
ID4gKyAgICAgICBQS0dfQ0hFQ0tfTU9EVUxFUyhbR0xJQl0sIFtnbGliLTIuMCA+PSAyLjc0XSkN
Cj4gPiArICAgICAgIFBLR19DSEVDS19NT0RVTEVTKFtHSU9dLCBbZ2lvLTIuMCA+PSAyLjc0XSkN
Cg0KSSBrbm93IHRoZXJlIHdhcyBhIGxvdCBvZiBub2lzZSBpbiB0aGUgR2l0aHViIGlzc3VlICht
eSBmYXVsdCksIGJ1dCBkaWQgeW91IGRlY2lkZSB0aGF0IGl0J3Mgbm90IHdvcnRod2hpbGUgdG8g
aW1wbGVtZW50IFBoaWxpcCdzIHN1Z2dlc3Rpb24gb2YgR0xJQl9WRVJTSU9OX3tNQVhfQUxMT1dF
RCwgTUlOX1JFUVVJUkVEfSB0byAiZW5mb3JjZSIgdGhlIGNhcD8NCg0KSSBkaWRuJ3QgaGF2ZSB0
aW1lIHRvIHRyeSB0aGF0IG91dCB2aWEgTWFrZWZpbGUuYW0gaW4gdGhlIHJlc3BlY3RpdmUgc3Vi
Zm9sZGVycy4NCg0KPiA+DQo+ID4gICAgICAgICBBQ19DSEVDS19GVU5DKFthdGV4aXRdLCBbXSwg
W0ZVTkNfTk9UX0ZPVU5EX0xJQihbYXRleGl0XSldKQ0KPiA+ICAgICAgICAgQUNfQ0hFQ0tfRlVO
QyhbYXNwcmludGZdLCBbXSwgW0ZVTkNfTk9UX0ZPVU5EX0xJQihbYXNwcmludGZdKV0pDQo+ID4g
LS0NCj4gPiAyLjQ4LjENCj4gPg0KDQo=

