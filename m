Return-Path: <linux-gpio+bounces-36793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB4gAPvyBGrMQgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 23:54:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB253B2E3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 23:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E35306297E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 21:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9753D3C9891;
	Wed, 13 May 2026 21:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UrsVZzCf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011035.outbound.protection.outlook.com [52.101.57.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D863B38AF;
	Wed, 13 May 2026 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709179; cv=fail; b=G7wt9blfCkK7CtQdN03G3u4Ke1xy4DscCytcu6QwNdaR8iItFOT2EqN+rQtqNnyjZ3z7wsR0YimDClm+sMXzT6wenplZFrwA5ijsLLy635oXy0AzxDg1/yyHoEzX360mclqMl+XPVfTRLsHyCthyYrONOnceDEyiGOR8Pce4008=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709179; c=relaxed/simple;
	bh=qOElxvNF5pIrGYgRbbkxTXhLhC5wxE/yTRJwrsXRmdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UhEGOt4tG0baa8dImqrOLkzP9zF36ev3zzU5gKWea2GNJwN8/+kb811U3Cj7sXh2j23HOjZ10AGyA7ezA41ZNsdOWxhpvqCTItRzGgly6pljoxNOWu5tYitCTgGByrGdZlZwGAI9x02y8lNzxqBJ/GShco17w394dAWCaFP0jS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UrsVZzCf; arc=fail smtp.client-ip=52.101.57.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bklwysbA+wQAbIPeTUjKThcx8oNRTnw1ptwqUFrD2N4r0lRegEcmQKjG8eZpeForb4Wdh6Hu4iKcgFOFJHU+laHWsMOfIqT3/mX1h5MGjGsroNWncQdwGXuvq3z9Reh8YrG4oyhvIxlU/VK4nT3UuhK4Of8la1KVTUO4EFNBquCCPMMoqH//3UUnAkaCOXQNqSQ80NwffCnaEzzqd6Rd6Q0imP5WFXVMl9p3ztVS4MVSRcJLl+cD4zD6Y1ZjE3NRNbBjmserz15IaLYJnsjjmcX78ArGgSR8AL6P08D8bQvwN2JY52/XaQnz6FVRBYgO5WG24gn93oZTYusCiBW2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhWkpSy3cunhstYlWwXBcUEVbEXyJLAIGkAs7jtQW9A=;
 b=F8Sh6ISKiatN37mf7C3SsBhxIRZjnz5iy3VGm4iSPGuCWStGEWktB1s70nEstVNTl3t6eQ2BYhN3sDcxAb162o3wMAoa6PjvDtDrnNX+9HNXmNj4gYZxtYsDI/IR08DeNv9KDQpavWm9a85aRxHDU82J9zf7b7XlRBOCOfNOso1JNUrI5yps3k9ieDZJgjWRzCx824i+D/UQ/OEY+CaybPiTo81cZx8cPe3jMw+Da8bq59bVXt+NPgOk4OP4l0/L7o6ksRCdYZH4A7Bg7w29rHOyXDvMzA49zKYTvRzbtQot1pR71S4tcv6wwtMnfdnpdEPMb8V7ud7UOzUPH6gGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhWkpSy3cunhstYlWwXBcUEVbEXyJLAIGkAs7jtQW9A=;
 b=UrsVZzCf4mUZFW/Et4r+pyI7t/M1tdCN7JXwzxCj0Zlff4Z+Rez5QLlwJnkT1NGTmGgjzS1sCYf4injz00riPPmjH29FsLpl+tAMvIpmpwyIJRIS98t6Al0rQBMi7gvg42kUq5q+6evqg8tI/M4QdXJthoiCmEZ3HNpMiJENWA0=
Received: from BL1PR13CA0235.namprd13.prod.outlook.com (2603:10b6:208:2bf::30)
 by DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 21:52:52 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::5c) by BL1PR13CA0235.outlook.office365.com
 (2603:10b6:208:2bf::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 21:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 21:52:49 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 16:52:44 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 16:52:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 16:52:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DLqipI356417;
	Wed, 13 May 2026 16:52:44 -0500
Message-ID: <55825588-7e92-4d2d-b4f9-869f5fa80d31@ti.com>
Date: Wed, 13 May 2026 16:52:44 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr
 before regmap init
To: Linus Walleij <linusw@kernel.org>
CC: Maksim Kiselev <bigunclemax@gmail.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508214324.1040460-1-jm@ti.com>
 <CAD++jLmS2ObzMQ+h2A825dcv5nwfrTi9ozcFbBUNiw_qq=W+eA@mail.gmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <CAD++jLmS2ObzMQ+h2A825dcv5nwfrTi9ozcFbBUNiw_qq=W+eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DS0PR10MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 02474a74-8416-47c4-51b4-08deb139fa17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kM/6XP6XNRJCuTu2RTy4vF2yzT6DOxUqDezp8YSskHQuzXfIUEpSmssv9HMue/DJ3TwsjBVrKbfgQEhTVez24a/DHnhQOXkpyrq/8SJ01ToBV0NFKgFGGKq3uXEOrympAoL35VcdcE1qxp8dn14+brG64hsvltLBJhMgCpBok2m1Pvqdk8DuMekkIgSoYKbdH2vciYAhTTl/L//VqezElKyvWU9SGQR3z20T1TMGkHlcIMGTTzNt2cGag3zoE1+IPAbmWebd8Pymvl7XDoYgE8RucWX6gTR0VFuxAT5XWkUmJfb5Uq/gnWRECknsFXqNh/mnJS3Y7Xssv+9ocjdEN94KTh8xLZQbBWcLQcP56lIkmUgSDZ0IwhkzJtHcNp+RPPmBCYA8g0xNVqBeVxtAmLDl70qboI9LhOoU8vGMqDxOmkGl7/slRahNOFO29PHeHVrLP3d33z0PNYwMvuYlpGVK03tEyD7m6zNwjm+bAAF+sNjyZd1Da6EFBixyiOYbP7b9ZWmdjPRbM1WSsVyoowPlglVI9N6Kzq66WagyEtbz4CuFLY2Ztdr6r5A5kqV50oxxgtvSoVh9K7xdt/iYxhwKauh4AxsRjK/U1iv0YjIDycJXtOKadv7zkHhZ0hZZxWiZucz2VZtFhQ9MyD/Rsvpr8JTZB2262jNf8q4nJh0iHDiRV2lbRNVujuXsHsN/M2p+ed5Rycf2wpk0CVELJ9I2y7p8dUi/NCU2H+scfx0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1IXvyF4hQCNjbxV9ZRVohswAjoPyE/5NFrbxADouIR67GQy6EHCaYDCs75NiaS+9S0qRAHnUY36E6iDBpysTdirSpemW+htiEDbfApmzrO3iDXXOGkb4i4TOLmU17HYCtZhnprnjbdikervHMpHrlfVdSrGKGs4z+SAyvv0tOZGxrwHzKOYNXs7xGYsZfHb+lD0G+W7c9Ajd0Y1WBpvhslLdaIqadsgRREC/bVLH2fkL6F0RJmjo3UZUwT1DLYWx4hd7/9WNA5quf1yb15QAspYZ+k08gKsS7K0dZRbraJtpO/kA6tXoPiOMJl55jdDaDmPej/ZqJIMBgNrKFPmisSga7WfOp5d6FBF0TBHr+ejcPPMS2bLsBy82MfyjgC8sMg7TPAbjbEJfXcOTGbOtTRK24p8mVazbUrL1dUPbcS8xXqNG8ebdiZAacxudIWVd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:52:49.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02474a74-8416-47c4-51b4-08deb139fa17
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7522
X-Rspamd-Queue-Id: 61EB253B2E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36793-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Linus,

On 5/11/26 4:13 AM, Linus Walleij wrote:
> Hi Judith,
> 
> thanks for your patch!
> 
> On Fri, May 8, 2026 at 11:43 PM Judith Mendez <jm@ti.com> wrote:
> 
>> Regmap initialization triggers regcache_maple_populate() which attempts
>> SPI read to populate cache. SPI read requires mcp->dev and mcp->addr to
>> be set, without them, NULL pointer dereference occurs during probe.
>>
>> Move initialization before mcp23s08_spi_regmap_init() call.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: f9f4fda15e72 ("pinctrl: mcp23s08: init reg_defaults from HW at probe and switch cache type")
>> Signed-off-by: Judith Mendez <jm@ti.com>
> (...)
>> +               data->mcp[addr]->dev = dev;
>> +               data->mcp[addr]->addr = 0x40 | (addr << 1);
> 
> What does this 0x40 mean here? Can you use a #define to specify
> exactly what is going on?

Really I am just moving the two definitions up in probe, they will get
re-written later. It is the base WRITE opcode for SPI chips.

I don't know much on this driver/HW, beyond the things I had to debug
when enabling this driver on BeagleBadge with a on board MCP23S18 chip.
So please scrutinize my changes.

Will add a constant definition and respin.

BTW I found another bug so will append to this series.

Thanks for reviewing.

~ Judith

