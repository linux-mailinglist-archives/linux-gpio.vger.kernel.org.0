Return-Path: <linux-gpio+bounces-36460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cxnsFenO/WkLjgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:54:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC314F5FFD
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A5FB30160E3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 11:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7A7397E9A;
	Fri,  8 May 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IDB4Kc2i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319A2E9757;
	Fri,  8 May 2026 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241199; cv=fail; b=ArdufyrivGpo7uB3lgXYXWcsT8Bj7F26CHE9iUVtUUBXduSNV9PvN/PJCG19aaJ8z1Ew5W0VShXvkD0DE11mfuVdwIFojROXDfvOaMFftxJB1Pmn+9Z/f5/Nvi6OonaN5PjR1jXIkDUMcxKYGgb8ypY40mvog71kAi3xBcuSq1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241199; c=relaxed/simple;
	bh=kUruMmg4aOFo9e3NNr9KsKyOO8lo94kuiR9hXz3V4is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VZ7Kk5/p8dsNNvFvPqjAwrkhoNcVlSsr65Agd5GUBkMc2xs1RNnizIyVs07bYnVrCrQRUBWku1nEoADDzInRzlQukvv2YZkEDyjm83OJRqOEeu0pf+9K/md3k2ysOgXKf9d8xiHFuC5uFSZkd44xPU2l+xMiKoTB3h/nYKbsiRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IDB4Kc2i; arc=fail smtp.client-ip=52.101.48.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmaQuh8tHB+DHtkNRGwrAPbk5wKr46jSzsIazBfb+B8sO1MddihgVBDfiXfaUjQ3NPY17OhbB1tIw+b0VpwRNW+F5yjBnQrC2GL8oDkQ1H5bgWqb0UBty4sgSMUoQzEsHCjXTPr5Fa5WMirN987MPthsROWUVJ+hC77hcvWtY/CPyLZet9CDNk6EDFier5X6QYubdCE7uSEdepxVV6ifzBvd70MYBqiyRCGnv/Cg8yys2iC1MASf9MKmsUBdFYwDp6rw3pwKu0c5arBTYjNUhspj8rY7ulNFGm4kV/9hhjZEPD2T0j0Xzp6Ti20ReY/CIPSBkxH6wubo+oH6Q54PcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rIgBVNnQtKV9bJPq8waCbpORckLkslBlkOWlwr9rHE=;
 b=WYxXQ9f5pu3Il4pg7GO8rfHFwo7UjfxAb/Za98HFQn2h7QTXjnplPPAUCP5aM/Hkyfs0IDelrCY9Cms0UMgVGtZMwo47l6MxnWVb6S3znNPgivHa2X2Bjg6huwxBTQvdmD4yCdzpzm1dKQofqSsqysJiuXUJvBoBvhIjlJKyPAgiNuybTQcOIqAK9b/3YX9IdAmyfDwk7o2yDMo6lBy1z0xO4LuhpEcO+6WeyMGXLCKfmTyxlpNbYNYppuSbgJ6Jfonixo99d3X7sJUbhyVRpFK67tsYqLDCrEvMlG7vuvxIyKVIMMBYX2DMR6g1K1MYuOC//MkeqIKLfiAt1jsdtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rIgBVNnQtKV9bJPq8waCbpORckLkslBlkOWlwr9rHE=;
 b=IDB4Kc2iUH80uaISiABF2NexgU3i1veYOOQtAqMndb1VEWWuOG6Y2zSxJa77o4xuyx01kxw9RNlra0ApcWWQqPKH7DN3fRBjYPgb+PDAgB5rLCZb+61f3VUL7fJsLVVkQgGc4NFT+xYsJqnvQ2W2I9qdPHNV+vSCzuHh/3AReEVinx0+PtYlCojH0+tGnfESgyIoxQ/c7X+ZIs4jh+KiY0CniB3KLmZrMK0FCrXsU0C3OGN/CRXFmpg/TqWTZ+AZBPtGkcV6S8Nh2XwF+JbPlgJ8/emyy7moWaXbnKAX+C5PLmScIQ4rmPlNKlw1L53DhQsz61hKMb2Jji1xKQhQnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 11:53:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 11:53:11 +0000
Date: Fri, 8 May 2026 08:53:09 -0300
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
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <20260508115309.GA9254@nvidia.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508105448.31799-9-tzungbi@kernel.org>
X-ClientProxiedBy: SN7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: d07708bd-fb1d-45e8-5c9d-08deacf860eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	4zi5IIremP9VsW1EXLtNtdICHLO+NvApW5I5OTFUjbi5R0V6KnzBeMfIlesuDEJvBP/YplokrmtHyzoOVwh7a+sm9KfHOFPbJqreqenwTx3KazD6fJ6tECxN3aZ4xuF91yGPA4JkbwqXK5GJgc5LJgb9fqPKOhHgpQiPhdpU2x33gbkWoVF2glkmu1F4fmcY+RkyEInG0IkjqtpiiUA8uCYk3QPwykeaezCiPf0oPOpJGvePBz0oG2/yi0uGVwg6jvq2GCFXNQ99sUgscVNONB0z5NAN5DIrNZA48KZCKUIBMyZQXw/ooABBrtEAXk8erVGXICyTdrAdUO9DlbjS7jKQM2C/FpDlLkjQ25Q0MfXeUCIxzWrodSQi+ZSIDIC7tV0sWK55nAGmxojZ8o7rNA/uKXiojk1dClodd7lWwE0q//1T8WlcurTdy6rzI7YeQ7JFmM26bFz95XgptRdn7aRk4KACrBw/tYiozKJCKZGKBnUT+qGdGF2iRQAeRpYOYUxxPK5uOtUZHorKkgvK3qsAZt5Wz/HeXjUgobvci3eAR6L9KWImwwOqQLQE6Cv4ls7zp6jCaoBRhbx4rudAS39looJb/oVlaK3BpnxAWvpLezMqnRgbuM3rO4rfrCG5EpHyUWdVyd+IuUFmZODQqZ9BoDXGmnwULDpehEV/q3PkT/HKC2JK/JKq48XKl6ed
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZDvGRynBZLHdmnhsG0qWCCl9RJQ+2CBIHfpwFuoX6NTQe9MHVqXfzQe39Grc?=
 =?us-ascii?Q?3RcpF4k8ATGx/sWUpALxZPnHS988JB2CgScd8fL6OUdDQOiLs8hY2Q6gSy4B?=
 =?us-ascii?Q?7VTARE5naeONfcrHQuxLa48JA25Vp6wcEY0y0GUH7w/cRUeYuQQQrWra8jv7?=
 =?us-ascii?Q?vhDZJzxYRQmI3NEmPMPEQHsMUeSPdhKlqrEvCsAGwQrMbyt2B2MVXsw8Vtx4?=
 =?us-ascii?Q?FHoluiDQ+f10XiV7QW4nOpZZM5wjpeTPbWHvm9PRBUZzvvYRlEJOMkRCPa/l?=
 =?us-ascii?Q?YdG2vfOCUNUomKW5bdZQgnai0+U4hyMwM2OQkzjUg4MCmnYGU28z064Zoj4A?=
 =?us-ascii?Q?dCCdKbUHArvhyKknJpcijFoeWwQ911st9UguuO5B8CCX+VukT2kVSm41s8tI?=
 =?us-ascii?Q?Z7xB80sqTiCtlvq64hLSMLKGiauMHujK5Eg/EvZ7GJGmvgDpRAL/hNPAGQjO?=
 =?us-ascii?Q?VKevuvQLvf4phL+eP43RYeLVekQlA8ndA78Uhvaxz0NlFBqmOK5FJboToK14?=
 =?us-ascii?Q?2YTVDH5TZ56joC3iUobH3vDTkqiX8HDwG2u5a6jLzc4OT0aVgLvvMZoFqDqS?=
 =?us-ascii?Q?8UHrFXMGDF2Wvm6WParQnQktPII4SCNKZTcQSQsAeEbNjHgboMA9rpbaW7Ym?=
 =?us-ascii?Q?SfT2WO+1Ktma18lBY3dbiYdRmn01or5Hm+2csxihvQCFHmav1MAFKSaZOJvu?=
 =?us-ascii?Q?Vx82Up14U9ur6Fy4LlEk72i+Fk9CR9zvZlMwczmIIhh1p/hSUj3yRr6bBgXm?=
 =?us-ascii?Q?NLWEPkMsjGaTZ3TpFKGHc/GekvOKksoY//1MYpmaDBr6UVYj75yF+9T8pwXM?=
 =?us-ascii?Q?n34+n3sVsL4zray0OHdthQYuwhvFadIL42qiKQV1qH1uKkMBrI0FiElgB0M4?=
 =?us-ascii?Q?vEZJ5cS+2vVo4qs1NUy9xdwDMjd5pFYTCViPZprlDZ71K2mZTGalUVkAH3/M?=
 =?us-ascii?Q?5u1VMvaasPQE2ZuLgOz8tBgaqrKWruR0tRp1dUe2Dfz+0e3KDTMwM0/8+g4q?=
 =?us-ascii?Q?blHaJbc0xY/R3oXBv9YGaSeebKJY5MZlqvc3Mt/3T+TEPys+mzViuWHSgkJq?=
 =?us-ascii?Q?jR0pJUTpsrnUUo3NxJbMkWLFUp+Jy+ZRehjCABYQtp8Xd+KNAQALxL5q56u0?=
 =?us-ascii?Q?YvrfH2jF90Yv9PXsiIUyN7S2FXYd60V1XTtsQOKOfPdYKjBNjpfI6jg5rEQ6?=
 =?us-ascii?Q?RqsBNDOCqZ+S2x58ui5+rRW0rjTSg2k1gRn2V6IfHoycz0M59gKuI7RQROVR?=
 =?us-ascii?Q?wtrCgBJhRubBBTZgJSypEqXIW2S8ERDBqCrTHoDSTokS3bGw13TlUD9c181S?=
 =?us-ascii?Q?/YUgesrR+jGHBa/1dfmgCXzEONWvoLIlu6QUZkRC/f3IVE+pZV64gvwTrRxk?=
 =?us-ascii?Q?S0tDkajgnGQRwTl4UiFpv9//6xOfzxM6an/L8WuoQxABOiS8W3QWU1uEGWx1?=
 =?us-ascii?Q?l2wDigaBML/8DFRDY4mvfd3fNfdFIWytTg7udZ/O9w21/8VTkJVzml/f9/em?=
 =?us-ascii?Q?7wid8Kbt2HqJGaDc4r/aheOlgQPmE02DTBMcij0qhPUgftyBN0jfAdzHp8cZ?=
 =?us-ascii?Q?6xbz5JQS8ECGT6TPS72jYd5TPCLP/VbNedTPn+2GfpW791pXcMMIvO/xSXzX?=
 =?us-ascii?Q?z52/Jg0GLmV4Lc7EKGTQzANYN+MmEEqK5bVZyCeSHLs/HTuKnPrPCSZLrAD8?=
 =?us-ascii?Q?n6qhI7eC8CLo1FIQhBCh9GvEuxrc6r3o/1Cwf14ZwIfDDviZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07708bd-fb1d-45e8-5c9d-08deacf860eb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:53:11.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5XO68bUrStqZpJOVcv9Ac/RkMTV02P2ZFJM4o4j+64z5XeV9/MgWCY5VciUrMpR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
X-Rspamd-Queue-Id: 9AC314F5FFD
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
	TAGGED_FROM(0.00)[bounces-36460-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 06:54:47PM +0800, Tzung-Bi Shih wrote:
>  struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
> @@ -47,6 +49,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
>  	if (!ec_dev)
>  		return NULL;
>  
> +	ec_dev->its_rev = revocable_alloc(ec_dev);
> +	if (!ec_dev->its_rev)
> +		return NULL;
> +	/*
> +	 * Drop the extra reference for the caller as the caller is the
> +	 * resource provider.
> +	 */
> +	revocable_put(ec_dev->its_rev);
> +
>  	ec_dev->din_size = sizeof(struct ec_host_response) +
>  			   sizeof(struct ec_response_get_protocol_info) +
>  			   EC_MAX_RESPONSE_OVERHEAD;

FWIW I am still very much against seeing any revokable concept used
*between two drivers*. That will turn the kernel's lifetime model into
spaghetti code.

Your other series where you only have to change
drivers/platform/chrome/cros_ec_chardev.c just confirms how wrong this
approach is.

Given you say this is such a bug I think you really should be sending
a series that is patches 5 through 7 from the other series and a
simple rwsem instead of misc_deregister_sync() to deal with this bug
ASAP. No need to complicate a simple bug fix in a driver with all
these core changes.

Once the bug is fixed you can continue to try to propose more general
solutions.

Jason

