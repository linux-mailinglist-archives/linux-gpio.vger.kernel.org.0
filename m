Return-Path: <linux-gpio+bounces-33368-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIvDH7MZtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33368-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:05:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E32847E6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E064F310A6DE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DF939657E;
	Fri, 13 Mar 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pe/v+ToB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD44349AE1;
	Fri, 13 Mar 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409969; cv=fail; b=ksUX8m4zKzJt8WrQWCifldWwtT3s6aj8EMiYTHBWtNzmqk1J/7QRZw/6hPCmSJxc/hVjJqOTfpHb5HSYVUDcG83yFSJY8/2RyFSR3L8uZKQpxH9ncN6lhpaXOVltUPcKGgodLA0Rxp1w/Ppc+Rnl2UAgzF5L2tpO589q5QqFBhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409969; c=relaxed/simple;
	bh=qz3g6q0tKXOqzCyC9ax69bBa1Dfo1SFcshnBPxAWjmQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m+lDaynMfq6i17zhnazO54dDug3vLrdZ+FJmBqLnmQLMBvNB1WKZWDYmxHiusybMDFX/b2LTeWNQSy5ogHNhJ0DbsFdMneYy06+a9ZenIdq5S0C7subEfkDqRnPMko3z8z+xnu6Ds2pQfhgbvVNl7Pmaau5b4g1iDzwbfdg7Qk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pe/v+ToB; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuWpmTANglf0WuRiRpw6eSq25VHMWnagr7PXv3lx6BM8j1v/Pnpv44bsAKdrr8Ztiwc+vhdmYym6oZE+ERAq/PbkL50YjicUvb6qqkcMj+32VMJm4QdiKlmH+53KcUObiILQesGxT9FFwwP+liTNpSSFp/PYURo7THm88ALg9kQaaC60sMmtqmDd38224W/JMcwAiiJJ/kyifC85ZK1A24JI9H5QoLgErt0iMHpvteFLbsTl7dpNWuDGij+iWmedxywEDC+mXAkw9izP/MIrXJmwiTm8L/nsvPyDeSKNi+qkwztB6ILu26Aj490gGP8AXR5DuZDyiFi2RP/t9K/o7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2u2lbpEQnqtRuaKrTAqtngpUwR1Ua+lq+zZsfwlKpc=;
 b=J0hJGVimGAbiE+Z0GrbLx5tn4EBygsOqzVqzDxWX9rxyOUMRlZJfgWCO0J34rr31GN8faADkxM6bfDGoiJl8llQ/qwdBhHT3u07uez7YVvOC3v0SY/yzr6+EIJ12S2WopJQ+Ho3l6hj154ELhnTO/HNKyiGTN4KRpQHRkr8HaLNAABQniksUlVj4GGl9Rj8AZ8nULopapNbnUnWKCcSxoRilEGY7rr49UDUMEvwDwHcpTsB0XJvmsN7ogMIGPeOV9OJP1HYWatNJTt/Wzl/OdCY5G4ZqXbWj9G5BjOaYLtXLlWfV+KZ2HD6zBtn3P5DkZJRCvzXRiXT5N7ajNSHFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2u2lbpEQnqtRuaKrTAqtngpUwR1Ua+lq+zZsfwlKpc=;
 b=pe/v+ToB/QkqXXRa/oWqKjbsxFjhvEt/mSKSjOo1NYE/t3C8rBiyWq908p0i98aCSMNAzuftAkcFMDoAioygx+GP8Sw2GvE5keGLBNxmx2rgDhhMO3HCC6GP+4exjO/o5RJWb8642EuYP7ZFf2yUpC2ooM1yonxyAy14btSQ5ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8125.jpnprd01.prod.outlook.com (2603:1096:400:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 13:52:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 13:52:29 +0000
Message-ID: <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
Date: Fri, 13 Mar 2026 14:52:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
 biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de>
 <abPqGvy5FqJ0a0ug@tom-desktop> <abQMQAbbvV60bV2j@pengutronix.de>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <abQMQAbbvV60bV2j@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b79d7fd-fb15-4ef1-9796-08de8107c45c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N0shkcavno60xnkbCFyXuIbybL+PvjmkgDEurhS9swzLA0LUWyshzYlhUZEqnbJJK0uHrhPzks24f8MKnewigsZKaWMFWktkq6iy/zvOsJLp8NczC+L2dp12Jl5qC4zaq1VjvzUEuHqrH+HfDQeT9ni6tkwtbVNbogRKlreKEQEXzjxOgarTUzqJA/oFvSVq/Z/ClAYprga36NOT8CVlGXal9VBs9vlFjkaRhXXvEIjO6yUXyhfG3DYI6K9NJfAiFkuOE3BivneECp2sM2TjjJ7N3r51mQ6EyK3Nshf2bIprkRNH6FhIHEBIzbReV6wmbz9zi8vbL5XfuvgG/1y2yRad9IPs5jMAVgnUeEJrcNmatwMNwwy0LHeKJwEWZlNe5gT1ne6vnm67FRhaYQ5LhLkG4H/NYe0JTMXVuAXiqdCEvwTgOdB3Zk3eAU0hjt8iG/QhIs6OhNZpskWpuAmd2z7MMysirt6u8mtvAE7mk8px/H/1wWt0L8IvT2kkqW35kjKLKPMNwHc01GEQuNVF/GGpLOMqHFl82aLYisq/+xbVTFg4zM4KN2Tps1ASFw65iNErlVaMouXidPTTL8VAfkzOFstK8DDHwPaWVuTRa2x/97mjLBZ9QUS1jBtHdhpFJjucOB+6iYypxxBex0kiDqj88vveUZuOGyRFfZ+jRivsg/mPSeOL99kQa7MTIxQke+pC/Sp0DB6a2M0cgNH/2OEhpWZidnE5e9sBZvG1tjk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1htc1ordFIxYWljNnJ1eDg0VG9FODZMM1htUWhnSWRoMWVBQ05Xc2cybXJ4?=
 =?utf-8?B?b0NtS0t3clJLSDcyVGRiQTJpSVZDR1lqbFI3TGRJYTYxME8vZnFrdGZLazFN?=
 =?utf-8?B?Q3VCYjNqSUM3YzZtaGdCdDdDRWxnUlRpdzcvS2taQmU5VUdPckxyZ3E0VU1h?=
 =?utf-8?B?UHBUUUp4NGVqRkFhTmViNjVrNUd6dWZtSmRVeUlVTjYyQXdCakQ1NlltcXd1?=
 =?utf-8?B?N3BzUEdxZDk1bHcxRmZKOEo2SkVYRi91MlZqRmhPZUY0c1J4Q01uMG1WQVhX?=
 =?utf-8?B?d2RLYVVYME9RVUNJOHRqZTNyVkJzN1lzWDFxUitaek9yczN1YmhBNyt1NGFL?=
 =?utf-8?B?d2Q2eXlZeGJPU1N4V0dWcmxDSEpadmxINS9MZ2JzTTMxNHRmdHE3TW9Qa0FN?=
 =?utf-8?B?c3UyYUJJMlA1SG44ekVML21oSEVhSXVXN1NSSDJGVmZQR1JwL0ZESG83cVI3?=
 =?utf-8?B?ZVJ0a0xoUFJESWZKNFU5bUZqNVVQeU13UDBzMS9GVVhPQTAwSER2clNyQUlM?=
 =?utf-8?B?SWZTc1Y2b3R4SStXQ3FvVVBPM0NiOWF2RzhlWGZqVm1xZzAvN2pOeGJxUXVR?=
 =?utf-8?B?QXZnaktWbTNXSEhMcktkVGcreVFHNUNPemIwR1lrMU1JRnF6UzZwVWJSbitE?=
 =?utf-8?B?dm1nLzlLSGNGQ0xTdHlUREVBdlJCdkhTMUprM0Jzc2NNUTJOWXpzSlN0VEo3?=
 =?utf-8?B?YnJqWnZybzdTeXdlZE5hU256bW1DSU5aVlRjLzJpcjJMcnpFYUd6WFNySE11?=
 =?utf-8?B?eVNRQlVmdFBZMmdHQ2JncEhndi91ZW9Zd1M1NnI1WGRuRVIvMUxwdzVMSG5T?=
 =?utf-8?B?RkU4U1dyTVpObyt6bmtLMG1rWDJMSGJoWEJJbDRIWG9CYWFsNStLWVpOQmMr?=
 =?utf-8?B?aXZhc3dpQmJOc2ZEakpTbDVnU0lOc0EzMGV5MkNJRXVHT0E2bkpHYTFxT3Jz?=
 =?utf-8?B?a0FqdDY1TDNQKzVxMXZ5aDZrbldPbktmeEg2cEJlMWpsNEZKMTRXOW9lSFdF?=
 =?utf-8?B?eEoxYkI1dkNlSjFCc3NWOXk3dnE1ampkc1Z4RWQ3Y01wOUtRZWg0eXlPa09w?=
 =?utf-8?B?dVVybk1JZ29HUW9BelZZZVlqYmNraXliUmJobnMrSWVDNnVGZkVUa01RTUxG?=
 =?utf-8?B?VDhBeDBGTWpIc1dTK1hac0RCb21PWFo4c0ZPdFcxVzRRMTczOWxCK2ZqR25Y?=
 =?utf-8?B?WkhIZGEyTy9lcXpvZmZ5czFtdmxUdHFhN2I5cXdMRDBtZEkzOU9zMFgvemtl?=
 =?utf-8?B?SUk2RDRZaUhadTQ4L0hMcTcydGg2cE13ZFBhNGFHcVQ2S3lDWDg5TTZ3MkU3?=
 =?utf-8?B?bUNhc215eGk3TVRzb3hobW42ZlNta1dDN1d2a1ZVTkpIUXQ1NG5obGUxR09F?=
 =?utf-8?B?UHBOSzJ3Q1FMb2hZTWVMNlZVNHZMdjk1WldhUDYxNXo4Y1MxMXB2c2VVTVRL?=
 =?utf-8?B?VjBEQmNqYmxJV3lQMStXd0pock1HWWdIOTAvRCtWd3laaVVZUnpZVXZITEFF?=
 =?utf-8?B?Y2I2VzZwSm8zZVdiMGlpbGpYZmRNVVhwOVo1SnNpeUlvbEgrSDgwUjFrOTk2?=
 =?utf-8?B?N1QvZFVCSWFyRU9HaWRMVkZJN2hGQ080Sm9ZalVYT2ZMNXUrYUxNR0p4blJx?=
 =?utf-8?B?cWpadHNOeVNKQnpyMWFFRzg1OHBzTWloeFlKUzBuTzFiWWxhdTIzQzVuWlpO?=
 =?utf-8?B?cmFaV2NrOGt5Q2JxcngrbzZyc1FOT0VLQ0sxZWJRQzRmUlYzUGk4dU5uUkdI?=
 =?utf-8?B?eTdMOEZDZ3JRb256eGcwN1NqaEZaNXMzUmhTMkY0dFBQY202UmdZYTdVZi96?=
 =?utf-8?B?dHdlVzAzYTZaaVpIc3hzUnJvbVFzOUxTMG43cy9UTjUxcjIrY1FWdjZlaTFE?=
 =?utf-8?B?N0JkV005cVdldndrM0lrN21SeUlSTHV5WjlpVWQ0dDEvT1hpVTU2ZEgwa0Uv?=
 =?utf-8?B?enZOcGw3ZUhrSGc1dFc4UC9xQkR3RURseXljL0lYZ2RucTJ5QUpUVlRDeHZD?=
 =?utf-8?B?Uk5hNVYvRWdEdHNka2hZVW94aWUwa0VqQnVHa1orYXArK0VSR3NQem1XS3cy?=
 =?utf-8?B?eXpFekkvd3MzM09qbVQzbmNnTk5HeExBSEZOYXkrWWtpSFZiMHNSelU5VkVt?=
 =?utf-8?B?MHQ5ODFRUTN2VWIvVVdlOHVYYWRRRnJFb0x1d2U2RFVyWGVNVGlOZWx2bGc2?=
 =?utf-8?B?citMa1d1d05JQzU5RERHdWd2R29YTWVmUWJvdzFVM1NFZXB3d3NPQi92MWV5?=
 =?utf-8?B?ZTdtblpxRG04aGd1aENRS0JMWTR4SDR6eDdrWjBCUTNXUUsrTHhXbFN4bnpM?=
 =?utf-8?B?aWJkVElnMmFSUlQ5ZXpTdUNtSWMvU1RQT0JPdlJwaGQ1WHNkUkhVNExESDNP?=
 =?utf-8?Q?pHRgIs9OgTiprAoCQchG5XYRmps2hiBJcR8/U?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b79d7fd-fb15-4ef1-9796-08de8107c45c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:52:29.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdrNhVwpkRRUxhpyJPwAboxQbqikfNbAPDtetNxqMVnr7dMUpZSFdMfmEwbVACC97j1sou7aqqlCryDd6n1uNNEMbWR+wxUCnou1tYlYuEPfhk72iNAnBcEjpuige/Gg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8125
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33368-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,axentia.se,pengutronix.de,vger.kernel.org,protonic.nl,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d:email,bp.renesas.com:dkim,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF3E32847E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksij,

On 3/13/26 14:08, Oleksij Rempel wrote:
> Hi Tommaso,
> 
> On Fri, Mar 13, 2026 at 11:42:34AM +0100, Tommaso Merciai wrote:
>> Hi Oleksij,
>> Thanks for your patch.
>>
>> I'm working on DSI support for RZ/G3E
>>
>> from this morning rebasing on top of next-20260312 I'm seeing
>> the following:
>> I found out the the issue is related to the interrupt of the adv7535
>> bridge:
>>
>>          adv7535: hdmi1@3d {
>>                  compatible = "adi,adv7535";
>>                  ...
>>                  ...
>>                  interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
>>
>> RZ/G3E is using:
>>   - drivers/pinctrl/renesas/pinctrl-rzg2l.c
>>
>> Reverting this patch fix the issue.
>> (git revert a23463beb3d5)
> 
> Thank you for the feedback! If I understand the problem correctly, the
> adv7535 is asserting its IRQ line early during probe, which creates an
> irq storm due to a missing handler.
> 
> My patch moved irq_domain_set_info() after the parent allocation. When
> the parent allocates the IRQ, the pending hardware interrupt fires
> immediately. Because the child descriptor isn't fully configured yet, it
> routes to handle_bad_irq. This fails to acknowledge the hardware
> interrupt, locking up the CPU and causing the RCU stall.
> 
> I hope splitting the irq_domain_set_info() should fix the regression.
> Can you please test if this change resolve the RCU stalls on your setup:

Thanks for sharing.

> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 13dd97344b26..376daeddbbbb 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1628,6 +1628,9 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
>   	}
>   	gpiochip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
>   
> +	irq_set_handler(irq, girq->handler);
> +	irq_set_handler_data(irq, gc);
> +
>   	/* This parent only handles asserted level IRQs */
>   	ret = girq->populate_parent_alloc_arg(gc, &gpio_parent_fwspec,
>   					      parent_hwirq, parent_type);
> @@ -1655,13 +1658,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
>   	 * We set handle_bad_irq because the .set_type() should
>   	 * always be invoked and set the right type of handler.
>   	 */
> -	irq_domain_set_info(d,
> -			    irq,
> -			    hwirq,
> -			    gc->irq.chip,
> -			    gc,
> -			    girq->handler,
> -			    NULL, NULL);
> +	irq_domain_set_hwirq_and_chip(d, irq, hwirq, gc->irq.chip, gc);
>   	irq_set_probe(irq);
>   
>   	return 0;

Tested on RZ/G3E + adv7535.

With this fix all is working fine on my side.
I'm not more seeing the seeing the RCU stall.

Thanks.

Kind Regards,
Tommaso


