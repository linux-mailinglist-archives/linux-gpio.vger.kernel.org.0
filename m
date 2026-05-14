Return-Path: <linux-gpio+bounces-36857-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMfOFW7yBWq3dgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36857-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:03:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5B5446AE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C873030534C7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D954A31E840;
	Thu, 14 May 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cf4v8iGz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406431E853;
	Thu, 14 May 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774452; cv=fail; b=Tw21pmjmZjRiBIKWb0EP5Frp8A2GU6M3Dn5rkHu0k32CcekwgaHheOeoszOMC5Ai0DqyRMB7aj+GFSs45sG0KtvecG2e2KO5tP8St0lIH9Y2PTmvK46Z0sCce3624Ywv9yhquVeepUYGMUnxmS+m7BrR0tNyvOPbNtsZWA+Zu70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774452; c=relaxed/simple;
	bh=9mAvxMGi/PRWKGVza1iy5dgEjIiaYryQHeFe8Q3LuGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jIC3wfYk8iU64/mzGmwec8llWxSPa52FvQJjdfhIovVfmdPD47Vpgh22HuqrDU8R1+VZPi728jhZIgzDscA7NvVfeFzhTobKnKkVXz64Gq0qegYPP+5js/aEsSP1zZQBllrkfsG6SuMt0vKKEnCsJhNkiDnuGVv+GynLxktQ3ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cf4v8iGz; arc=fail smtp.client-ip=52.101.193.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZzwq3qOX8/pqiWbWmemFUMyh+21oATtgJBY1caK7ycVIn2FfO/ClK519f6AC65QaWeuA0K1CiwusCWo5qpfiyUGSdpH3OPwSeXvRWF5gT80j3UTIsJeDmgqsKMoo5XjyDPZoRUuT5s/Sc5uLgX0aBOXf4SSQxv4jQ0bJYVkMiqMkChXC/GA4BaSUW/JFq2Po8C6HXEx5yEY94oprwXZ+5te+ZT83J2qGYmnmwapN6wbutmCFDEGgKEjFpqKVfMKGNRNR8QzlRXYsPoembBBXlbm80eUxEGeUqljHaiJwrqwcPFsvEyn6hkaPsNUij6Z7FjwNeufmlkzEruTsA81ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mAvxMGi/PRWKGVza1iy5dgEjIiaYryQHeFe8Q3LuGo=;
 b=OmfxS2mQGkVfile8opr1rmyUqOblNvbNOar43D0nSBpBtmg9psbcb0c5rg0iJWUDRUCtgz8oinwoMfUDZF9mJds5+CSZ+w7KmZHiiJhjsGl6E+RwMUe2K/RHo0xbpC+PSQJ2V5SMpBUQ25DF+RiKMhscvnpzGAo1W6GmZbMos1Bxdjn1xAL6lmBgyeN+Se6/dK7Vvc6gynCoj8PThzBvSoGitdTAp3oXKAB7vuNx5riuGc3h5BxJq2bgALHJXUUvf+gaphNyZ8zJ9eochWIA/z0rEotgG0jL3r5nw31z9tcjC9WLuZZOKM/ypZf8kKAfHzlaYttiOXry3NvBR46ChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mAvxMGi/PRWKGVza1iy5dgEjIiaYryQHeFe8Q3LuGo=;
 b=cf4v8iGzJHf88lViktd9C2mnM+iOdWnjXs+Ax61al1qgo1toPdQEkS8jqq7awXw0gqJamJwENT7HTmQpHzP2llpLpGFRgB1k8DmQ6w61y+tyQt3WcEVhHAj7PoURN+e8qoEgjQQxjnv90m6Ib0kHEvr1ssOkf5he6XlQpHyy9tnMz8FyE3wB6b7UnOv2VK0agtfmDoHkg9yFahEDvvhBMTYH6vsdl0HG0qmuMPgDQR85dAPVSKSFYMZxF9XHc9I0eESdThf48qQQzlbc6v/WIUgndwga5yNev7zXf9M+hl/bP27gJhY3BlzxZDcCfDgQiM7DVblWp/1OS3e6/jWqTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:00:45 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 16:00:45 +0000
Date: Thu, 14 May 2026 13:00:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v11 4/5] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <20260514160043.GG787748@nvidia.com>
References: <20260513091043.6766-1-tzungbi@kernel.org>
 <20260513091043.6766-5-tzungbi@kernel.org>
 <20260513115102.GF7655@nvidia.com>
 <agVCtBbqT6aZL0mx@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agVCtBbqT6aZL0mx@google.com>
X-ClientProxiedBy: MN2PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:23a::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 547f3974-7d62-4c07-2c56-08deb1d1f50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	l5rUoUuxpERc65wKy8DcsPAA0V5OvdXZfSR4q2EpPAaSh53U91c0+JSBN77XfhUvqy56jDICcVW6e+ZsycxXUwQLI3EFrHEMhr87UhX5tKsvOx8xlURJ07fffXpQnMcz8+xsEu4YlsMf224xa1FJk/FDwekqSYf8t8LYpIoAtxb/XaiF4FeyoaZTekvxQefjxcwH+8dEwTzo0H+WL+6+FWIRzRZ5jchIVTA1NBZDjgevS4x+dwaij+XxO0Hts/yam/ZmTBM5DvIA+zZiOBCR3k4dDpQM6/psxCkrw18/aFZB8KvYdRKC1EmE6xIWGWKzVrfVG0ar2XohtPsVBDVuIir2L24ofFmQLbW6qEvCXuO0Bug/1rWXYHmxJdZLThLlVmG9Kg871dK1MU+b+ZnPJsB8YndbEUsQewEM8mgwWs512bkBiDo59O+5cbQXfGmsqVUQ+gobzdfGAnXq0p7lsUgE+KKJgXju57oMtYiF/yUthYyVPBYEVpITl0Fya5QWUvEczcXlTW2zNcvlw2uyfzUYbkicMtYZxZUkFSGciUyApMvd1JKODbtB+UrZ9sZa0wsqB0LBuuMq5bNq3Hdcxr7xmU0NeTUHotb4WA0oxIss5F4p8xZ4En96EBnNXqesFt5WWwoi/ml1cYTA9Ar+3CZl8doXxkb4h4Viu60XSDgBm795RLUXEYGsM/2RGIMT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2w7Z3nNgQFkeMzvBmpW1jzyJBgFltsKnT8KsNHPqAUWxnEXd3gKXsQM+tZV9?=
 =?us-ascii?Q?VZySS2RzV5WHtzfZCXKNPUSFC9g/h5LrBOAfdeBUn6bkjf8JlDrz9zrlS1Dj?=
 =?us-ascii?Q?ZKXjxYsJ/m/Vukj6lPcmOA91JS2FD8rOPS6v5+H+XwwZwLSVfcLqpN/Qi/8Y?=
 =?us-ascii?Q?7bHDzQ/wJ6sPWS+/H51eSH+mOWGtIK+01DLxgzrLFwHU/EFAvGdUk967mzj4?=
 =?us-ascii?Q?IwsaQUSuCdAzsSntEjjCpls7DCGAlOVKxmuLdby6OHPu/ssh0HOVgXPtvQkm?=
 =?us-ascii?Q?+xMIV0IqLj3172GQCO5GPcuuXNfaTmxBfesprlG2COYEEGKkFDkqhvp5FChO?=
 =?us-ascii?Q?zeBqcXC4or3O+o57l3kZXn52LrNOi8qO4be6EHLDCX04s/8vxo/4FRrifvah?=
 =?us-ascii?Q?YH6IR795RiCJhE3p7GSBq/JFJeVBN187JKPWs0cIUOlCHco+8RG3KUv113BO?=
 =?us-ascii?Q?QE2/BXX9QvNVYyat3rfu5GOg6UGYg5wcV7/H73jfHpRQn1hgunF2kHgF2Gim?=
 =?us-ascii?Q?fOw+jKs7IInvDn2oF6ShlSWGpd0wapWnYuJpaqTLPAq2V2SmOB3+pvfy+Oe1?=
 =?us-ascii?Q?ZxqzXVIwvPM/K05aUKjr1mueO8XrRHhzAZA0exhtEmsUifC08mspI64aXktA?=
 =?us-ascii?Q?erv5Ryqu44DyWhblTzgUmBfv3O5eOABcDNo1q3Mb8Yx7Y8S0ZsqzzuO/6wRL?=
 =?us-ascii?Q?3ZCFAotdCihzmXv0kk0j5EABDxIuGGhmSk6D0mWWktjmArp2nkrgOY/01or7?=
 =?us-ascii?Q?Qtu3aYg/QLo8lGF1A+Vc3pr1X4+44jDcfwQlWtUhAGpiQpA664lH6TsuiIRL?=
 =?us-ascii?Q?tl2qefXr+46W6RrIjT54zoWAGyB6Iv7jC9HXdMxh8uphEjb4QqGdNX5E+Y71?=
 =?us-ascii?Q?lP7ZoYmzN+rK3eIlIjLVtlN8K7h7EVFIa9U1VEVu1wqcK60DlvWVS7jsOsBU?=
 =?us-ascii?Q?27DBvH5HWYECoCLPugkZCTQ27I2ilfAzu1CqBium34mOFE4hReFFD9lOGBAn?=
 =?us-ascii?Q?jAmBy2hEAPPY+A3mFQKuZAsUQZ28EWVaWqN6PYuTr5/B7eHKMa93CCH8DspJ?=
 =?us-ascii?Q?jXf/pH1ZifZ055hgpiRhVFTfmdwgnMZ10obsS65QPrQbfaFp8AwHaZ6Z6TSr?=
 =?us-ascii?Q?DuPX5grD/ySMPuXtYL23FR4bg8ucZdq+a2Khg4RZ2LznXODYXsuQBwzphcUA?=
 =?us-ascii?Q?eNLfftfqnboTzPcLJd1rGFa11MAoycXOuXYoqtHbtxO6hZN1cwqC2jEPXimS?=
 =?us-ascii?Q?qNvbv75yw03+9kW8zihRUEWCNsPTOugPOZ2F9DMn0JsIMIVvD6SuMJakxEOC?=
 =?us-ascii?Q?m/us+k6VPSRoTIAI+W5IVC83CfJqsn88NiPsq4927i/8XnW3Spa5ywBlUyCn?=
 =?us-ascii?Q?zmHXCW3GCSra36/PdMKg07Qoz3kSNeEmSRZJI3dX9FFnN2vi8FOw8pW5Ypjh?=
 =?us-ascii?Q?SyY2d1gvZu2k1O0ZqnK03Rak2g/H0BHrD1cmNPv7ZWYffb7KDDfj/wIyabmR?=
 =?us-ascii?Q?hFryiptv7xY6DSRcih8U6APirbMY97F2TANVGFlPFT0vSX9v2wPKwK9d5IVA?=
 =?us-ascii?Q?aeGtWg0R5ClqqSPJ91ehUmsQrRsG/dUJjgeHBgbI0n8HPUifR35mm+Qf+h0u?=
 =?us-ascii?Q?j2W+vpMJp7xNPA2ORMvfeGWLW/XP1iJG3CG+BGc4odZZwABBqrcHWNzYuhvJ?=
 =?us-ascii?Q?OvU3hojpe7M8NJguHb+ipSG5MstKd7EDwm8tK0D7x1LLZQxa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547f3974-7d62-4c07-2c56-08deb1d1f50f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:00:45.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwD9CrhSRKj6A6fQ6M9DBLzcV2hskiKGstpklMmXucvDJDmsDo4HSS8t/x+vT4vd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
X-Rspamd-Queue-Id: BCC5B5446AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36857-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 03:34:12AM +0000, Tzung-Bi Shih wrote:

> To help me understand, could you elaborate on why the revocable mechanism
> isn't suitable here?

Stay within one driver. Create the revokable is probe, consume it
within that drivers fops/etc, destroy it on remove. Do not randomly
pass it to other drivers.

> I'm wondering because if this piece of code were to transition to
> Rust in the future, would the concerns you have also apply to using
> Revocable[1] in the Rust context for this driver?

Yes, even in rust driver local revocable objects should not be
spaghetti coded through different layers.

Jason

