Return-Path: <linux-gpio+bounces-36742-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK10LPNlBGpVIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36742-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:52:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969F5328F3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 13:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 325523023057
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF373FF8A6;
	Wed, 13 May 2026 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="edVPhUHQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C773FE67D;
	Wed, 13 May 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673073; cv=fail; b=E0We1DKqmhDwvG5TNLt7/4+2x2ViBIINtaYb7pxt5NtRe5hZId9p43Hv+MyzYkW28KBept3yvV8tlC5CRiq7DldrLeyiD7Pd9C9gLVB/Oi5rccU40ts7UFkTI+H8NMNoB43nvvu5Qn5L/XqGzIYXWkaPCDzclVQU60licoPQDV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673073; c=relaxed/simple;
	bh=GzXpYSD7Wpn8LBBlY0MP1lHk8/QUvu01FbW2Qsb1gKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ntpdfd8u1nrJlYs6pF4CP8dj4F7Fk+ENHj+uRjPhH/TmfUygwpLKY+Js+MMIhEJ7/TGblKAINEAyaWrLhFF+sWXuiOAJdZDgRHskKau2aPm5SeoYNrZ8SFtFc+Jb8jfyMgYneKZV6IC9vmc2Kik1mIg0L8Yy1IO6poQ3h3ldbI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=edVPhUHQ; arc=fail smtp.client-ip=40.107.209.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPs1HHb+vkVjmkZ8Tkw3XFK2eT6pMYnEWVv2uUmGz3DaAKGi1Aax8CvaTwVorEHz04hOmKcugE+//ji7Yf3IFylAw2EN29gYK50ofmSxhPv6U9qpo9t40hHOb+nEb0imEoorvreAQuypqT44c+zcBUEeiFY4JQOaMixzjCJSDYkDUUbro99alev3TVJnp4oWuzsIq4eyU2bIWkZCSO43bzaIf/XTOdn6vIEQjGu1RMr7ZZqkqZrZB2V4G4kKcHVNJb+ZcN7gve6MiytztBcZGPLmAYBZDaHmZ08DaDQGbnWjONW8MLXM4uTLi4OdgWUwm4PUIAYNOrU3wIqUNL/VRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0N+9xjt/ffLfSW7wWoaZHl7IwTBG0enAXkzyXkvdfU=;
 b=Krtk+iJNo8WI5Wq3s+ISHQDXfyys265o8swEToASaijenetdu1M4m2RWCsEo1LM4+ryts1ZuuP4CkJcl3Uc19Aqnczc/6wTnXbdsV9s2rBMZNoz329/dZFOWbqo+o8HqoxyBr3TtYyppGJkJHRPvjJ2bpn7lEKhINVjN0u/TlaPA/DvXMnChYIgH36AeDKylGyzbvXmuGd2i6QocERFpRe1jz73ZQLfXvIhLwKpjJypvaSd5Z98+fxHGYEeD209UZUfj7svZa/1+T07lNjxVAlWxZkNcvlwRkIN+sPV1UfH9kW/ksJVHGhrnpX1iuwXIlisiU0M0JRCDI+Fd1Yu60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0N+9xjt/ffLfSW7wWoaZHl7IwTBG0enAXkzyXkvdfU=;
 b=edVPhUHQfKgRZ4W8HJ/5MjnMLQTfqy/+E8+SKxmZk63yxS4H9cWgLLycYDNIcp2K7CI7ZrxA31541g6izj2WWhYEiaWpOw/C3sqUprcjMiJqHdjcWR+RpKh3f0pgYXzNZKYWe3k7Bpy/D4w5v4uXKWhRnujhLJ5JybPr1na6PixnU/z9ooJsIrkEoPgIO36PWEw0wEnPCkf2O7DQ01fhYUbaq7fmMrXn6HwUCVg+pxgfHuVwRclsFc16oUzWiVDOp4zOu8mK1XQLvhEm25a99/MtRQYYx1Jez97PS10L9/TJGpP/XrfWRuCTSPYMf0/cI93xJuq3AZv2m28vgXwDjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:51:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:51:04 +0000
Date: Wed, 13 May 2026 08:51:02 -0300
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
Message-ID: <20260513115102.GF7655@nvidia.com>
References: <20260513091043.6766-1-tzungbi@kernel.org>
 <20260513091043.6766-5-tzungbi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513091043.6766-5-tzungbi@kernel.org>
X-ClientProxiedBy: BLAPR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:208:32f::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c09024-2e5f-4b17-b8ef-08deb0e5e942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	C6YJROaNBZylH/JiGQdU07/E2mYN0AqZPubHpbQRz0AVunLCynPdoQ+EnnxUEIew7kCv4BJySo7kAXM1nrD440gwIn0MD6dj7yZhIbFUBEnIVAYnCWTjinXgP10eP+paIWOrtCUrsl6k/r1/tYZ7Uk9Zr+BhkSeOrC1L+alOKZKLoauIPPEASNw3h6F1NQ5HOd0HVamjDbFduL7x8px6MgDwkqVDXEIjQy+vDiPGsilVqDMOxTRdXxWbLYmI7ODtJEh/YWg+sfKHyTtwcSnLJkiyt8Zh525KK+ftmzh810MX4LhdXh2LuE45mFlWsQHiAoK+E02aVHi2QDPTKc2aIxpcUM46Mga2EGp3+h2Zmw2Lzlv7CKLCTvv7WUZjjD3IhpBgip8jfOEULyod1182pIAjwzG0xhoa960eadVw5YqwvmrU7Eeo1wYQGDx5kZpGZVcW4WsmsLEDFyotVXu9NS7jB9EVbshpFGdbWZ1bOkM52cen4dQ7o7oVBqyu7Pb3FsM1V98Xdvh6urOZWzw4BSHux7960EwxoBVGcGJveXOMuoQR77rfFlNbIWF7rX/tSgAoGJ0aq+7CNysDKtZ9u/qSelfTX4X7Cld9CxRfHpJIfQPf0LOpWRVmZRailElVUIS2HOh0YhCMbgkEUyqhG/MDrnDDgH9itGkmRSL0sHC6gbhNSskS2g/lGXRUzKCT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jb9QbnQrVWGJdYXx2fnu8YuX1+ATfSSXqX0ejYV51SwKlhA4d4pexRpITuqA?=
 =?us-ascii?Q?0PDz80OanXr1NpLcUee65+JtTXXHMk28lVIZp/K7GZxSvV7hrw+senG7hHSS?=
 =?us-ascii?Q?7pdib73+DU9GQqzc6qBxqZokYX177ct/OJ+6S70Vyu0jtU7g3CvFYSFLwfNk?=
 =?us-ascii?Q?kTKzEmJmsxD16MTyCIVK9s+q9W0JUS40z+EYL/vqgYgV1LnwPFZHeL112N22?=
 =?us-ascii?Q?7agnPxMkcxifO4ZI5NeEEj/lplVkdvbWVsDaJf/ATfmuFjb9nJkLHcnVEUOt?=
 =?us-ascii?Q?wHw88p5z3AxdJJFunD9iJ0Pf54ajZSIcfUTk4Lm9wf55TziLqabGjpfMCigP?=
 =?us-ascii?Q?mbS7bn1eMAph5kWeyWyoWe4W2Z9zXEnKosBJvVvcf/jwr7QMbA4LcQ41x9YA?=
 =?us-ascii?Q?dgfjNxwcrIbxJLNI7u4UdrM5IfITaZB5PbHR2NO+LKT98RA9z0Wyjr5yA63q?=
 =?us-ascii?Q?X19qOKxgXZnPUyNvwEOftmdZ3mNX44pp+AUG0Vfhm10dRLooEoWh+Q5RBnLS?=
 =?us-ascii?Q?fJx4NaTQ1S4rd8LjqAnGWMuEGgvkOu7LYzZ1O+uOL+eq5DaCT4KE8vQj64rJ?=
 =?us-ascii?Q?HVDVyaq6o5l2XHmQb+FbUnqwVcLJIdRaoA/BW5zAc2mrQPA0YYH14c6FUMZ4?=
 =?us-ascii?Q?CcPXKVnheFiN/j3nZcaV01iPJ9zfcKRglKnPkr5k8NpqlAXDc8vLw2/rJC8v?=
 =?us-ascii?Q?+PM/Iky39mmLZSiUX+sIjOP2rNoZhVuvq2m8EFWyH6REdp2avzw06Fph2PJ5?=
 =?us-ascii?Q?Z4tIrFfgCNsO3fjk/J4yZBn98mHIhzcmdSZa7rb3OcqS+Y2LibVundpZGPl1?=
 =?us-ascii?Q?oLi9BhaD+WGJFM0Wuc/wmL+go4GTCCYaPpCx455IgcZDtudgQuInQOCRa7Gc?=
 =?us-ascii?Q?tjpukgTzRc1aKXtD4kDMjxckXHeSOZgd3AZ8ajrSnqMqGT/12CIs0H39tFeS?=
 =?us-ascii?Q?DOM2xsOJvXm1EBuTSoBoP0x6VZl18vBjt0ZDgN3k6DsKdslxMFmUdS0B/LpS?=
 =?us-ascii?Q?PU6mR5ZZ10nXtBZoGGoPmJMxolRDXBq+rj8M3ZDaPv1OJP0VRHNO4MWj630K?=
 =?us-ascii?Q?fG1J7AoyvKZrFOhibM2aPDTimA6ardjWIq9ZwyQj9EyFvpWCERipJFZD88+6?=
 =?us-ascii?Q?8S3I9mFQElz05aZfsmzVfkFBK+DPBImU5DUprMHGgdBLRP4zL96z75rOfIHL?=
 =?us-ascii?Q?Ui240WyLkbAmzw6gFvS6n0ZiTMRy2uxRDzcljok/q4VBdV3IGUvgDrCGAbEb?=
 =?us-ascii?Q?rkz9NuPbEIoi5pd7iZvzfCkAZdtfT1+EVJhnsrk3aw1UKX/L88XYN3V5uQ+F?=
 =?us-ascii?Q?ongmDhA4ZiArNykErTqX7h0wogM3kAyPSiUDfdlU9da3/qzIOW5bALHnu6Ot?=
 =?us-ascii?Q?dOr7kZzA51Aq3uXReKCiTVtxscy00tQD8Hn3WOdV2bCAT9mcR9L9ozcuRQ/s?=
 =?us-ascii?Q?2AhGWL4qvCSnAcBz2copMyl4eiPd46lWDZPW5bq/DxcOJrWO11entDyrgPUV?=
 =?us-ascii?Q?7FvwGOAfOJkMh9YV2dYgSfIl4/kfOdycq9NtPKvJTGk06K6gfZvM1BN/lsUh?=
 =?us-ascii?Q?/6gcl64csRArm9egXvh33s7nqk7mAejMNPZPCr+38APOXiLPJB74j3fskzs3?=
 =?us-ascii?Q?MoBFsHBsdbp8EJt+abMXO71OHHJPP8nAuAUXKYI/NrbkaXCMxSL1u3NUn1Yo?=
 =?us-ascii?Q?tsO5kXoj3JXtCLCgakKFeb8g7ssZr/ZpN2zsAx/AHgd3f61c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c09024-2e5f-4b17-b8ef-08deb0e5e942
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 11:51:04.2487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3SYRCtthVbrUXj6p6dB0EvGKvdD2yf5R86gJd/ElNza/txxyq5VZ1Is7BsIWjG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
X-Rspamd-Queue-Id: 5969F5328F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36742-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:10:42PM +0800, Tzung-Bi Shih wrote:
> The cros_ec_device can be unregistered when the underlying device is
> removed.  Other kernel drivers that interact with the EC may hold a
> pointer to the cros_ec_device, creating a risk of a use-after-free
> error if the EC device is removed while still being referenced.
> 
> To prevent this, leverage the revocable and convert the underlying
> device drivers to resource providers of cros_ec_device.
> 
> ---
> v11:
> - No changes.

Two people are opposing this and yet no changes? Why haven't you
followed my advice to fix the bug in this driver in the obvious way?

Jason

