Return-Path: <linux-gpio+bounces-35646-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNcPIOhn8GlyTAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35646-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:55:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DC47F5E6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 412E9331225B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 07:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D5B3D6666;
	Tue, 28 Apr 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fLIvst1e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1F3CCFC4;
	Tue, 28 Apr 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361146; cv=fail; b=TZCWWnKfQ27kwfGLr18ZZeLdDYpqcr3ZQNOb3dx1k1nG0NOLMgeNEzI0vO1j46l68LaluPnwk9I9tcN2lDhJLIQ1hXkYnwgiNPlmp0pltnEXbf9/LNA/s9i+b+iGu7ULvbPkjXPBu+tx8O3TdRAWQFLvT0T8I95LPfhvnBBmfHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361146; c=relaxed/simple;
	bh=r+z682TwOQVQQHEUUSEZRbnzsbAdRwkWkLRrIH7NXjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AQJMkNB4oPouEE4pOQrKCJeNiPsyY+U7nIIrMA6DLnVUXS+2n8kEuVHHIMMX6havsomMT8vQx51IimDjc5J2GvhDOlInpxlnmgjxmY/akl/pvJSBZCTeeMmjnf2FUCbGEH+FeTjAoP1bOXQ8AEL18WeYl+V3+NImOtrAiWwHHVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fLIvst1e; arc=fail smtp.client-ip=40.93.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHalBljTsqhUnLDRmwN4B68FchroGamOt1ZpSwPYoY4pGSagzMXCTk3z4ngW3aFTwlSpnnBQcoxWBQKSEiNi0JG8gGqcv5rs8bgDXQJRrJWbZMsNUcv1c9877LMovhtZfKK40WVP89p0D/2W8hEdh9uAVw2sgFw8e+b3gQNJvyO0pPV8w7yAC/wiKSqbG8DXEdy2N+Y11VfQVfrUfV66qWIXYq3n3fiRY5/WW/IWlZUoYqPtgV/fgdpj4Jnh1LJYMdOs1XE8FrXeYjS7kBBaIvY73ueERMJnFNtGQBJc+q3Ezk0mcOj2IzwoFUJx2wVgAdHjAFroY/GhfjYOtdOp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RGhWb3pV9aImbB6FCeZNp/U9ZSNBoqD2tyoy8boP7g=;
 b=sxXyDAHzMhgoa86lDkFADbY8/leHAdorXsGXBzYBGxkFhgFUxi1fpzujW9nQptD7Hf9Pmi/hQIXE00gqSR3F31BN8OE3QgqsVUU08om5thOumBG7/CFEc0oPvJGb7bSj0CQbNZeksdePDJOogMGPsu43iLxFFnhBXjw4Y512isG/auwKf3VV5LVJAiv7E7XpfFhSrtYT31jmbDFwS6gn7g4qs1MPh8g18r4WnomL5/9NwmEOvFaNHx+7Vq6u6ULYcXWnGCSEQxJjHxxXbSk0rlXTYtMfSBy4Zdiz8ZPSaTa9+XhfqxmP6qPxA9EPfzRWxWzeRojpgRSJqd+ss63ZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RGhWb3pV9aImbB6FCeZNp/U9ZSNBoqD2tyoy8boP7g=;
 b=fLIvst1edSq0A6/QlbOhnTGjbZbcWm7asOOheprvFhBJMcr9+WKDoIXi0ycroUmAp+/DTQydvJbckJS0FDQhZGeHeFOeacdK8NgkJjZVYwdn3uk3bJLxfOrgp7PXNWmCzoaAZx/a5rcVvUMiNxy5Iyjdt4P3kEgN8JqXhY0Ebj8=
Received: from SA1P222CA0038.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::19)
 by SA1PR10MB5823.namprd10.prod.outlook.com (2603:10b6:806:235::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 07:25:41 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::b1) by SA1P222CA0038.outlook.office365.com
 (2603:10b6:806:2d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 07:25:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 07:25:40 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 02:25:36 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 02:25:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 02:25:35 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63S7PTlA490896;
	Tue, 28 Apr 2026 02:25:29 -0500
Message-ID: <29485742-6e49-482e-b73d-228295daaeec@ti.com>
Date: Tue, 28 Apr 2026 12:55:28 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA1PR10MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8ddfbc-3b63-40b7-833c-08dea4f759b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|1800799024|82310400026|18096099003|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	VD0qqZ7wE0UfNhfPiqXa0Yyo7rgipeIwN1MMqcwssWpU3VuOWLmt1eWs9lQ9dn69j/WyJ0vzXo7iIViEuGlY+e0h90etRk4Kd97rJB1Oo7IG6Cfj86O+KPWn7Mq4LKZXiOI+dELlm+NR3vn46c11LNbgwEqKJjmhGKOp3L4z7fdEdzkgQuQJZ4ca4gOUCNPl/JrmUKmO6fYYGUzrdr0nQTzUo8zt7IB/DUFwPoRphbzrHqsVDuk1ugXtZ8m6ZUe9YS6rJjY7lH0Y1esldBQlaZEA1bxjj4dmW7RUThHDS3Bl8mldS5Q4d9MMqkqhZyBw82jTUE5Pv46fcl7Ciw8NaPcXbIIzSWsa9q4puh62b8v59JAan/QWQM3PJxCRJoJW4nKy8qKiWcNnmMxHGigWEwJ2cuiO0AkO9TW3VSfm53yepAnsXF5TYaaSZXPhEnw+iSPB2CS9E5IAiY/N5OBOr6ClWUq4EaPeQ5pbMr6PkXZE5sPbVVQgOByhhphAcGWVQ1/y2/cTHs/ufneepbtDeRkEHvdlIr5CD3iJhHcbLwPirXu00BsjIzf79sJh8ENnkG2viO8OdcKVFp7uyiihmtJ/D5YWbngQaK/y/es3LR9jtz/l4buprUQlEuPO/QUFjkFpQ/jdoeMvRO4/2pEPg5CoSJNhkfsZSdrGjoFkCbcs0EXM2WS4W5bdpWgSrR/pLwUGUMDdJViFWPJLHJYKOANZtpdzWrruQQ1EGn0ULdWvIsw0x5OfMa8OViLy1q6hpE2Jdfp8n1BEIt0zyZtnRIkzZVsgIbXcopTmlF9/Mii+BPN7TEOoQao1Fttnvn9Z
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(1800799024)(82310400026)(18096099003)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtEklt5Glk8w7fwe9Onv2y5hZKccaw9lvxBBzrIPls3ZnHjXZoQ/oU/JjDwhqkqfk4JeIxXUAG/LlFk/OcYdPATyafn6NOnEjLz3FYV4d/n9G3pTavDh5wVOnSjQDNkeWEpybZCEn8PIsTs1VGhUcuEFJVtx6UiKmPGYC5jtsmsGtfSaTYryLORJdkQe6gVcb9lJd3qCUO0EARyyinWW4OCscwSWWBONzqLyPxIRnWFJRrTtP/gCeutJIlNJPbQr/xcJzn8lyFySWjeVLoafr9O9hU+pRPYpbuWQ/bP5PeC33iFkVqNvtcbIkZY7DSShnEhT7/Lk/EglV8/EiUGovSVVYsy/QEXCe9jOgNglEuk//TnDpBf4XX7nldrGcJSpikLJM4Ht5E4vMZH2AOgtVaFssc3lq9ZZ+1XpaTd/U5ibsT9j87Y/W85jjsI+W9zJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 07:25:40.1266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8ddfbc-3b63-40b7-833c-08dea4f759b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5823
X-Rspamd-Queue-Id: D14DC47F5E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35646-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]


On 28/04/26 00:53, Shenwei Wang wrote:
[...]
>>> +
>>> +struct rpmsg_gpio_packet {
>>> +     u8 type;        /* Message type */
>>> +     u8 cmd;         /* Command code */
>>> +     u8 port_idx;
>>> +     u8 line;
>>> +     u8 val1;
>>> +     u8 val2;
>>> +};
>>
>> Could you please document the fields in these structs (and the below ones too)?
>> From the code, it looks like while sending a message from Linux to Firmware; val1
>> and val2 are used to describe the values to set. Whereas while receiving a
>> response, val1 represents a possible error code, and val2 represents the actual
>> message of get type queries. If that is so, you might want to change the variable
>> names to be more descriptive and also use a union.
>>
> The fields in the two structs are fairly self-explanatory. Do we really need the additional comments?


val1 and val2 sounded arbitrary, that's all. If we are moving away from
that, then there is no need :)

[...]

>
>>> +     void *channel_devices[MAX_PORT_PER_CHANNEL];
>>
>> So this is technically a rpmsg endpoint (struct rpmsg_endpoint) without naming it
>> "endpoint". Every rpmsg endpoint has a reference to its parent rpmsg channel
>> (struct rpmsg_device) which represents the same information here. So we should
>> use the framework standard here.
>>
> Yes, agree to use "endpoint_devices".


I did not mean to say to just change the variable name from
"channel_devices" to "endpoint_devices". Infact you would not need to
have this field & struct anymore.

Pseudo-code:
1. Add a 'struct rpmsg_endpoint *ept' field to struct rpmsg_gpio_port
    to maintain the ept to port idx map.

2. Call port->ept = rpmsg_create_ept(rpdev,
                                                            rpmsg_gpio_channel_callback,
                                                            port, {rpdev.id.name,
                                                            RPMSG_ADDR_ANY,
                                                            RPMSG_ADDR_ANY})
    from rpmsg_gpiochip_register().

3. Send msgs from local ept in rpmsg_gpio_send_message() by:
    rpmsg_send(port->ept, msg, sizeof(*msg));

4. Get the port info in rpmsg_gpio_channel_callback() by:
    struct rpmsg_gpio_port *port = priv;

Which also eliminates the need for struct rpdev_drvdata as you can just
do rpmsg_get_rproc_node_name(rpdev) from rpmsg_gpiochip_register().


>
>> This also allows for dynamic creation and deletion of ports too! (if/when the
>> firmware supports it)
>>
>> Which means at port init time, we should make a call to
>> rpmsg_create_ept() for each port tying the same callback
>> rpmsg_gpio_channel_callback(). And based on the 'u32 src', we could identify the
>> appropriate gpio port in the callback.
>>

[...]
>>
>>> +
>>> +     girq = &gc->irq;
>>> +     gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
>>> +     girq->parent_handler = NULL;
>>> +     girq->num_parents = 0;
>>> +     girq->parents = NULL;
>>> +     girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-
>> gpio%d",
>>> +                                       drvdata->rproc_name,
>>> + port->idx);
>>
>> We could just re-use gc->label here...
> We also want to include the remoteproc name (for example, remoteproc-cm33-gpio0), rather than just gpio0.


Isn't it also included in the gc->label field?

gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+                   drvdata->rproc_name, port->idx);

[...]

>>> +}
>>> +
>>> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev) {
>>> +     struct device *dev = &rpdev->dev;
>>> +     struct rpdev_drvdata *drvdata;
>>> +     struct device_node *np;
>>> +     int ret = -ENODEV;
>>> +
>>> +     if (!dev->of_node) {
>>> +             np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
>>> +             if (np) {
>>> +                     dev->of_node = np;
>>> +                     set_primary_fwnode(dev, of_fwnode_handle(np));
>>> +             }
>>> +             return -EPROBE_DEFER;
>>
>> I know this was asked in the v10 version also. But I don't think the answer is
>> sufficient. Should we not continue the intialization of drvdata etc if np != 0? Why
>> return a deferred probe, and let the kernel come back to it again to do the same
>> stuff with extra latency?
>>
>> We could just do:
>> if (!np) return -EPROBE_DEFER;
>> else {everything_else};
>>
> After configuring dev->of_node, it would be better to restart the driver probe process. 
> This ensures that all required resources, such as pinctrl, clocks, and power domains, are 
> properly set up if they are specified in the device node, before the probe function is invoked.


Hmm that makes sense to me... Thanks!

Thanks,
Beleswar


