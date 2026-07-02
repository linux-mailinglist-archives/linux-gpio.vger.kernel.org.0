Return-Path: <linux-gpio+bounces-39340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YipVE/niRWpvGQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 06:03:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A32446F357A
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 06:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=Pn4PnbV3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39340-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39340-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FF7F302E31C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 04:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE17634D397;
	Thu,  2 Jul 2026 04:02:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4D2DA76A;
	Thu,  2 Jul 2026 04:02:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964971; cv=fail; b=LqiXoaFWs9eaZMtEyd1lkyldtzQts2tDpxrhGUIkmFlzeCxmmUuQP5c9Z998xYTOimfFJ6n7y7J8hccTgybQvdHaUUi+Uy9H0BBzeReeyEvxClnHC7PgaJIgHouH/4TS14BWTGQ/pEOaQi+4+2tYoJsahKHLdoIkWIsmxTvRAaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964971; c=relaxed/simple;
	bh=NNBgZAD9JGUC0N4kkgcuZQXl0wFkIHsGj5KUDDrcXJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pxX9n1mDSGO3DGv0XEZTQ034RZuPb63poNi4PHjkfHkxeMCCbBCaNbAVc9yPsXxj/7MtGL/jAMYU7mYSBePr5hMj9AK9MP+5v1BElg5MuLu+oRG1jwOOcF5m14kMtu2HyxmYHg+ImYK4siyEb1Vx73obDkWW9f/PAfeLI/9dgEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pn4PnbV3; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEwcbsMfz2m/rNNQ7lWRXign30zf9lxYmow2ADDWU6MQu138F5/02w2WlhCa5IU7czNoRKh350k/MCjjB5MQCw/mvKOfchubyWy94M1LPj4ihF3riaJcZpp0EehVJa37uEG4m4QqReU3crwphK9OGMa5x/9oaz6+yvGMj68QNjEI0gu2eVtjmHMp1P1BqGBSGKbE/q4R0tvn9iyWcWh0WkZtlkg1Tvx0DIOyGmXxEJC0Q1U9U+PNvD5KgSRIogUkYpMPNQWXH7lHcXmefAASfXu3FSCrbLnlWABtURxhik9HMLsl9De7DTeBPabtHcQYpxOouSfZjf/fnuRsYn8fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnYMPMLxVD5w0BIBBWl6O8R+zbdq0fQFmNcLQmrPf30=;
 b=E1/+DOkElGpvj7U//dupbvSsk+oUbPrk/I1GLW5Qc751Nv79YCkp3+unicJtAdEwLKmEcRBnse22TpZYFT6r77i80fvN3olMUtR12Fyxsbn4B5PRJVSjVl/uAmT86cD7u7o1pTL71z4toD4eyafngSyQO1aWgzIMlBty6HU8+FwdBySJ17w5Lams6wRqnypJpY5fMPW8eCjY9pLsWzIdSwY1xk9gau4weVm0Ka6lFi+SqS8ZlCILvxQV1/5yvzjrN6lXVCbY1NXlVC9mbg/b1/lvjGGvC80GSEOFNNTK0mppDu+leYsK1J2bWBpF6ysxZccix7LGAnlmXfrCwOEV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnYMPMLxVD5w0BIBBWl6O8R+zbdq0fQFmNcLQmrPf30=;
 b=Pn4PnbV3ErOLc8P46DlBYBW2jRfYqm0IQi/xs00WcOy/PIDUx89BYZp81rngWhBY+1BzE2/arWdVBijOzlhC6XOJiDof8AR1LM0P5h3HGFOWzeDKOGB9k9Cry9upl1WN9OxND+h+GGFa7FSwCAKX8wXkzw4ItImcnjwA1Yo4R1o9PE7jgBLE3lkvDfiYBmQQMsZcPpmFQAHtC6i/meTIURxuUz7mNg2JDqx1zsWhaDVjg4vWTZGX8+yM52idaMJ1VBim0O7kR3TkwGwM7JyeJDS1MABdjPwXHfup5+s35+Cl29yoT/epGz6//mWjkd++gc80ffP7lQC/y2Kc9FyXOg==
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 04:02:43 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 04:02:42 +0000
Date: Thu, 2 Jul 2026 12:02:35 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>, 
	Li Ming <ming.li@zohomail.com>, Lizhi Hou <lizhi.hou@amd.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v8 7/8] PCI: of: Set fwnode device of newly created PCI
 device nodes
Message-ID: <akXg4G4ksietvkwE@MWDK4CY14F>
References: <20260630102804.413563-1-herve.codina@bootlin.com>
 <20260630102804.413563-8-herve.codina@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630102804.413563-8-herve.codina@bootlin.com>
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 022b915e-71af-4591-9dfc-08ded7eec3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ojd/ur+7GwDsqAknVwjWog7FKeXMsJ/ynr8uztlhUUuUrnm9ICA0fz2+TtpNBB7LMN+2C6bZTvNnWdKM65bzQB0ztvZmp34d5RVCFZRImYhWkRhSuUpUql90DIEaPa0ssvi+q3urbVLLbu7J2Fw7hNMhrCBURXISZsalUS/kO7uYYuaHi8NjawPNyz2MKoBCTp2ftIl+92XZgtaedb28qRpwYdnAjk0abGux+3W4DAtk0kdNMXcIY1pWvBMT4T1D4ZWzX4t5Qw+XMPIwwmOvIbsjki6ON7CU/QAavA7fqsoOxxm9Wp5kCpFtzC6R6dLQNFQMiXmkMel4/SsFH0704++vgkRJwAUhBuD6kLyhqr21XV8NMOuCAJoiu4TTh8Ui8W2s1OLP8+ysttwPnZ6M6zn09sxFmgzxA8J0KpvOCiCY0tPPYa+vCrLJTM1icjxMAVlLO7rjlVT/G+H5XRi+5/k4y/boWdZYus5Xlxg9wFuQ/gLcHojpmC8VqzL0u8wjyxVW3nqUmPWKryEajecoW1RHpvEVm42WGuYisVgsyz80Cy2Lzp6rzrUeFw1MlN1emfFsjNXE9iF6zVcURWfrcky7xssU/P4hNaFNlTpdVlGtoS+39iESZnGouOfKLZfuUtF/W2EY7TGUYegL3g1yG4ar6IfUp0NqGMGEml7bMB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kSNzeRni+AiBBRWP/g9WOiTRHcLUiglVaET+qGzHQ73waoHVa/eWP+yhEzPg?=
 =?us-ascii?Q?1aVmmdkPCbHXIY7Bv3ov2YjR2yFYvAqNmDtx83nkVB+4ZT8oTuifUT7XkgIe?=
 =?us-ascii?Q?HD/E4Qeg3TwqkkUJ5eiAIDBgkYNNWnga+xKrk875EcDBxCg1ZxBLEB6Gle5X?=
 =?us-ascii?Q?mRTUriaABV5MarWFCFcYZ4XKZ03aclpEiJAmkC+5gHnmUsDC00G6KfjPZffN?=
 =?us-ascii?Q?kKYx5Xj67VOu6tAzNyz16m6o7NnQa2ro8VLhmpZLnWowOINCgJqe/RV2xrtW?=
 =?us-ascii?Q?rYErclGmze+ay74SMk7CImWup/fkBpnp6nc3E5+jlTPU8mVZ8Q6ChmQUTTUT?=
 =?us-ascii?Q?AdheOA9Jdz2NNn/JJwN8SA1oXyElg4xOgg0CuuZoIS34ufkbkhpAa1ixcS9z?=
 =?us-ascii?Q?VrB3xh4pGs/m7JkDN6csO6kM1vucIWHZuqcC42jotaaSLpEGvnhJcpqJ4x8g?=
 =?us-ascii?Q?XwCr4Os0DdyXAjm4SVApNHPRui8ujzGXF1sBF4PGI2mqkDajfX6dBOTq8zWu?=
 =?us-ascii?Q?fswcS2QZRNL7ELNGDnVOdt87S48QQdS/UpeK42HZhfzvKJSwoyvmOo6OwtT/?=
 =?us-ascii?Q?KBpDQBMQUhf7N/u2O5ZFpTs7MWy2bgYkEfEDVQW0h9Q3rBxdOVjMiECh/Khy?=
 =?us-ascii?Q?GS1/C52aVPrMc/e+BvhsJ5V4mr4GJQvoJtAMLhP2k0wtXSduAsOZyM2XEq5Z?=
 =?us-ascii?Q?rjypkRI8yzXnqhEKjmEKw3zt64+BNZU3HXdkGD5pfQLCJpSfNQ2EojOgJn7X?=
 =?us-ascii?Q?/2i0FgFh3KJdhL0BKQCo9yl1ZVTi07wi1GYe7v++3I4aOZtOVjjvKFRlFVP/?=
 =?us-ascii?Q?dp15FeFKwJhgANCipwA4trkCLM7b5JAOjIuIxNS2iIEn3WQcWKATCACVNUMR?=
 =?us-ascii?Q?O54M6I0LxdNMzwZb/nuohYnLiioNh7eT0P+kVjB9M5DiElDACVRdfg/DQS4m?=
 =?us-ascii?Q?mtK/xI1b7fLGeVnQm1Y2Zi8H8jgdXGtvrSEBTI+q1duP0r1fLRIASzx7q09T?=
 =?us-ascii?Q?deSoqoSTcWxC61O0U17b8UiujPyub4n1zlX4hqJCcdct2j1F5ubjvYTP08hU?=
 =?us-ascii?Q?t+70g1gfOg4twEcgq6nxH75iPk1l5WjKSC/bMgyZ2+J1HhX3qdFW7uYaAtEJ?=
 =?us-ascii?Q?1l+1L0ro57DDAaK8VZzur1HQpCjTD4+A+13EMsRjB/8XdqU/+KQzu7tFfw4V?=
 =?us-ascii?Q?RhOSDLwEx9iKb/UiuW758cXlW2pWfLbPCzCd/mCaU141iwX7e4qsAI4ARyyp?=
 =?us-ascii?Q?WhZjD+HSL4QYKk1UvhiFaJteRclBzXAZ1E484i2UmRn3/FvLfi/nFNAlZ6Ps?=
 =?us-ascii?Q?wWOlPcYLhMC+BuMZnlqiuqPcneFStSsvnMI2IkuN/oOeWhnL/nvkJ4i9/XUD?=
 =?us-ascii?Q?IyJY17rKDprfSC1I7fuzwgXRx43xpHpSG9Qw3F3ffNOwyRM5m65Xa/kWLFAp?=
 =?us-ascii?Q?t2kgVpkHjMg3mY1F5241fVqDbRRNk1R8pTKykr1cJ2fBgM/qKzE5RAfI7/GL?=
 =?us-ascii?Q?kvaTdWzcm5PpQEyFv/kYPV/ys7C+fgdUWkx0ZEKYspxK/srFuRT6hTYDm3np?=
 =?us-ascii?Q?prACrDuQ9ira+B7vL6JKE0Z8sPhUMLSn3SIYHIqejxA9hDjgNwVVvdCx+14g?=
 =?us-ascii?Q?Zue0WFKYMkwiLqSKQ/JmQaXN1LRADzmqvYZiZ6v9Yk1Id0uPAScLCxVDFosx?=
 =?us-ascii?Q?KnqpTPYkoL3LHOm7PtvRT/iDXhr7GWOAdZz+fgb0p2PCIOjy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022b915e-71af-4591-9dfc-08ded7eec3c9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 04:02:42.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkZQjkdBLvgQyOxL5ev1CnndbaMTmkkAwnzyr5Uh32HoG20sQAmtWcI06uqqQ128RMY+yWT0cTPl3ZGXKHr49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39340-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herve.codina@bootlin.com,m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:lizhi.hou@amd.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:steen.hegelund@microchip
 .com,m:luca.ceresoli@bootlin.com,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORGED_SENDER(0.00)[icheng@nvidia.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,linuxfoundation.org,google.com,cirrus.com,opensource.cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,amd.com,lists.linux.dev,vger.kernel.org,microchip.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[icheng@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,bootlin.com:email,nvidia.com:from_mime,vger.kernel.org:from_smtp,MWDK4CY14F:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A32446F357A

On Tue, Jun 30, 2026 at 12:28:01PM +0800, Herve Codina wrote:
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> nodes are created and filled based on PCI core information but the
> fwnode device field is not set.
> 
> When later an overlay is applied, this confuses fw_devlink. Indeed,
> without any device attached to the node, fw_devlink considers that this
> node will never become a device. When this node is pointed as a
> supplier, devlink looks at its ancestors in order to find a node with a
> device that could be used as the supplier.
> 
> In the PCI use case, this leads to links that wrongly use the PCI root
> bridge device as the supplier instead of the expected PCI device.
> 
> Setting the fwnode device to the device of the PCI device allows devlink
> to use this device as a supplier and so, correct links are created.
> 
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/of.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index ee9eb384b377..eda14cefca5e 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -709,6 +709,13 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
>  	if (ret)
>  		goto out_free_node;
>  
> +	/*
> +	 * Set the fwnode device in order to have fw_devlink creating links
> +	 * pointing to this PCI device instead of walking up to the PCI host
> +	 * bridge.
> +	 */
> +	fw_devlink_set_device(&np->fwnode, &pdev->dev);
> +
>  	ret = of_changeset_apply(cset);
>  	if (ret)
>  		goto out_free_node;
> -- 
> 2.54.0
> 
>

Hi Herve,

I wonder if this part has some issue, it sets np->fwnode.dev = &pdev->dev,
but I don't see am matching clear on removal path, I doubt the back-pointer
can outlive the pci_dev.

device_del() do the check
"""
if (dev->fwnode && dev->fwnode->dev == dev)
    fw_devlink_set_device(dev->fwnode, NULL);
"""

On removal, pci_stop_dev() calls of_pci_remove_node() before pci_destroy_dev()
calls device_del(), and of_pci_remove_node() -> device_remove_of_node() has already NULLed pdev->dev.fwnode by then, so the "dev->fwnode" guard is false, and
of_pci_remove_node() itself never clears np->fwnode.dev

If something holds an extra ref on np past removal, e.g. a DT overlay applied via configfs that pins np through its gragment targets,
np survives, the pci_dev is freed, and np->fwnode.dev dnalges into freed memory.
Then fw_devlink walker that resolve it via get_dev_from_fwnode() -> get_device() would hit a use-after-free .

I think of_pci_remove_node() should cleaer the back-pointer it set,
before dropping the node's ref, e.g.

"""
np = pci_device_to_OF_node(pdev);
if (!np || !of_node_check_flag(np, OF_DYNAMIC))
    return;

fw_devlink_set_device(&np->fwnode, NULL);
device_remove_of_node(&pdev->dev);
of_changeset_revert(np->data);
"""

Does that make sense to you ?

Best regards,
Richard Cheng.

