Return-Path: <linux-gpio+bounces-37166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH5wDHv4DGrnqgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 01:55:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A51586254
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 01:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A1A3011875
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 23:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC7F3A8FF7;
	Tue, 19 May 2026 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hF0XqIrl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543033A6B79;
	Tue, 19 May 2026 23:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234930; cv=fail; b=qc8IQWhuIm9ONdyf12X1CO3+TDVvmDgjPtKRdsAeGBiYUms9dKO83L/0ZQhl6O4mQJ50OFy9kaWyVBDUH8Qc2+m64J7XhzXa3qKwEC/sDp3EjPISOyGGIAmIk6sQ2x6qq83zBQQV2Ehikqxan3QTQoSx9JV3vrLhHPwAdAT0gRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234930; c=relaxed/simple;
	bh=0prtbj/p00s5TOuv0VGr4ZH08U9rXQLjG59yNo+aySs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VGlBKieadMJB2zmjXiRc0he1mzQX49gpNX8ZrObT5sGWJ06WX1LGcdOuRdNF9v7loGRd6b1ZyG/bbw5zUv/KausujoK4bYneJwv6M78m141W3ki0rTcbsipSaA45PUCXIfZXpDnAIE/BXN+V4TUz/Zpy6Ml/gh7ddcCYYv4fKGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hF0XqIrl; arc=fail smtp.client-ip=52.101.52.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFBGpCc+IW8N/gADfz3txTb5xPqaZj/THdXAf5U37XoIGh+DY0RBD5jef52y5bPorRVR/L3hfpRh0awWGG2MtWfh7XGDpfpo/kVJMbKWbKHARpBGo9gJwYwpce+ZpRcM4+zbPsfoxKxwVDFkLqBCZLeNX8/JEAupXIzPjA9ELp/YhZMstxfJ6mdAOVphIHsAFREp8dNtWaw1L86Ox1OACMqzA/2NnhHYPQwEN0b3NzqVlxC1DOcfWIaVol5jgJFRXFgj8Q8WY4COzkXdFgQlGjNENB5dvu4zPXwr19fK5AQse8mgqJ6a6jZVvpAyvbO3um3Pahe9AlE39LH/+LGjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdNUL+5FaYIL9TRc1kDGEz/Rq/aZuksjdQ18uS2s4f0=;
 b=XtFbDTUQdPf9dkMg3E65dP4qfI62wsS5t0NWnByKhVDMO+zVD123PXIfAxSkLHPnvht5Rtu5OCp9AiOD13Qw3WLAsUbE6rDML8yiUrwN9eSkOB75F/PpIIe7U/c+WJknSd+8xWwgSJmi/tp60+AHsQGIrHv7PAzR3LWyCcnrIv9SnSdlrFAfJLx6z5VzP9tY2WwmxHsFkP6OgjecVqsUwFbXNkTMGMHMPQVDWp//Lxk9dTu26FRXHMqDiY0h68ZnJfnvlB+7YCPh5VjMfp1am4YJFMJZTECu/ARe6cm+Bn6et5rq1nQ3m1bdxdKaaJ+W3D8BTMWT2AHhp8K4T9IQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdNUL+5FaYIL9TRc1kDGEz/Rq/aZuksjdQ18uS2s4f0=;
 b=hF0XqIrl4UDHc/yN+LlNOdmmwSCVRmCHjrsddkoUdYg7q5wnKj+I5X/zqdVo5BH8CRWhZtub7Lx0lOMaYxZEKznMMWzbFCCQsLHQMOugUyhEg1XnOoD4kmvDPHIQrlONMNGnPy7j/W2S8+Qwv7xNjNtG/xbSMc2INTSFNM39JYCQ/HsMkhH3LsNiei2OOJ/ViZ1tnJBu/68eJVrk4JG1gJ8SjoLFpXgV/JlccxFn3aMAqTJw/v6egd1KOJrMv1RSC+lMl8N/08TSYMwjsSot2facI49o7VgjfAcyoHTbPrilhHtDrYVnzTgPDTeiDjBXwZEqOh/fiLBVic5MPhTWTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 23:55:24 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 23:55:24 +0000
Date: Tue, 19 May 2026 20:55:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v11 4/5] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <20260519235522.GP3602937@nvidia.com>
References: <20260513091043.6766-1-tzungbi@kernel.org>
 <20260513091043.6766-5-tzungbi@kernel.org>
 <20260513115102.GF7655@nvidia.com>
 <agVCtBbqT6aZL0mx@google.com>
 <20260514160043.GG787748@nvidia.com>
 <agiCQQO9KGoMS1Jj@tzungbi-laptop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agiCQQO9KGoMS1Jj@tzungbi-laptop>
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: a287ef84-a1bb-4424-d5c1-08deb60217b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799006|5023799004|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CMRucnGRPjKjAHhA8EkTb1dh/sXI0ko9LxoT8Qd6R/z9eiw7WbiysZYltRxmWrHkeVofv5GS72oS01LTeSazAfyPpADnS2oq2BLZiZGSWtvvYCHOA7bCC95eRcQh7qwm2EcZgYtdi7pg/WXFY5M5a5JfmrKk/YLgx1N/fKycMQAUBlN4EMXti7fxCzpxJDj//qxQZiJugpo/Tp7b3ExHE8Ee7a8Xz5kus5hJPIdc6L82IsmL/e2NbHcuwDjE37FSYqi84F7DHIgX86uPnZMRzGm9y2JyKK45iQQCBWW9hN888vB943aUT6zdlVFH+SZ8w4AFhFIEyreo71nXjPpPixvBfJGztcRnM0PrOxEIdUgF+GsT72bJXaAB6p8kJF/J9+7Q3vM8mZcuJ5wQIZHQRZvHsOW1x2jED1H5Cn4VlcPHg/BiaPsRAyDpXIXwjSncVPCyO4SHP2eRpqSUdt8ZtZlOjkGe4ZQSJUnWp2J10TN1W2aiiUGeItPkazzE5d84TN0/ABH/w+S9aIUjpcuv9hy2GrLS8ycw9uozdeUDHB3w4SqNSetnrwp2p8mc/e9Y5rS40fzGlH9PNMlK6NLIvcL3g4sZ8OjOukYuk5aszwaWHNK4z//X/Z0MJaFDfrNMHgdJb7vE4kVCl9vzRaiISqfUyyv6PljzRL0yUjXvhJF6hNtpL9//qiu0PaQVxK+3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799006)(5023799004)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3skluzJPAahmKVnS5Xi+fqQ9TOA+l6snNow1uudsmaclGLpvyENUOyg/Vx9e?=
 =?us-ascii?Q?X+qZSR+Gp1kueivtH2/S9wjx+dmlYbOohs7YSejPI6/Yt05xGGkrN9ueMIEq?=
 =?us-ascii?Q?c76o1Il0Z9N4MUJrG7R5UQjmR8W++c+ZQREWciKBY3ToN55KCRHALt3ty44m?=
 =?us-ascii?Q?RWsZ1YZJzh8g7UIbYayWJg2cT+ULyNDphMhRYt2rGnZEWEFZtJ/Orjk8qPCz?=
 =?us-ascii?Q?y2We21S1MyoxeBCa+l/VYDML+ME14LGbkkYWCmnByR/Vv7DbdI0jaSNiuzC9?=
 =?us-ascii?Q?+DvM+UGErZyLcVClurNKSFXKdTOc/EZxL8gYj07LsbyIaHG3g+g9GN+sj0C6?=
 =?us-ascii?Q?3W6OEShp1XFbXW69y1oaUgGkDCUCkPv9MoWQAa9NOdKVng/GDHvhAEDC8BGW?=
 =?us-ascii?Q?9ZVO/fe7KzJai7DNKIg6c6rvmqfnymI4Ke8XaXZr/oaCz6+1LzQxTSnJlinl?=
 =?us-ascii?Q?xqawQ7lGUHEN/sdbgByjOS4i3nypJj7CuAKdVcNxzYf/QpP2THTi821FhCwi?=
 =?us-ascii?Q?pfrWa2EHx3eaEYEwOlQYp05IOUP1HV6k/tiNdb7RhqRxBcZ1uxv44Lmp/v7C?=
 =?us-ascii?Q?bmj5bYH6z79Fv/YiB/tXFAmdkE8DKiKCB2Xwntx/gghMNY9vF31VEyLPmj5g?=
 =?us-ascii?Q?dRjx+TpCJtmD5sKY1B//8fyUcSeiNKnksXa7wWv3rGVSaViNSt05MVaBqlE5?=
 =?us-ascii?Q?VCP3n/GJEQwiDn9GFPSkv1YQ+3Eft7x6F8WWV4i+MYC1E/GTZQW5HV4hb+aY?=
 =?us-ascii?Q?X56SyHTiTmaGMwmyxF00bQ9Fzad/st/c4wVC9TaBjvU8beCRfOdTWDndtqJl?=
 =?us-ascii?Q?GwD2kpx9iWtFDrBQ8qjl8e/OY7Q5UnI4lpc/pF5Abu9QvQAJtvnMy0U+qwUK?=
 =?us-ascii?Q?qX6Lu5A3UeNTao+keunAT9A2p6SSaEYNJhWbf9BS7sVcBVqD9VGU86P5oZkM?=
 =?us-ascii?Q?NCToQTI+8aKmbuhSRozFppPe5mOafVF21TpaJNcQio3CH1Rnfs/t+D6WORBc?=
 =?us-ascii?Q?47rEQ+J+DJIc+6xFv7LToZYI3tyBU0x1zJAQxl/lggDGmC9C/JOM0D/GaVpp?=
 =?us-ascii?Q?J5S7wvlba+nhj8prXyVjKRVQwka0OXMTKNNDJB3XoRsIlNAXgFAIKhoiHqi6?=
 =?us-ascii?Q?YdhRAXEHgnPppXzaCgXn6Wvbux4lrxvxuv4VfulOUrS+VEg/ulqolb2I68ee?=
 =?us-ascii?Q?wHRmpxEKMlrhgvgmAFOuReh+MPwIOnB2bTFFhxBeOMfisYVATc1fE4jAJrMe?=
 =?us-ascii?Q?5d8ORoArLaiilNdmekt7hCCL3kxljyA1Nv9NwHFAshxq7ntn3oKZXaztgAFM?=
 =?us-ascii?Q?mmMImJIzfCsjw7F1jGJmmstqT2bHHEjJjB5xjbtQifcejXjcHxmAUvyjYRZP?=
 =?us-ascii?Q?6gaGLrNzpGBuJdq+inQPMN7Kpws/AmA1dhwaj+Xfp+8WvH+D3jBzJYOI2Zex?=
 =?us-ascii?Q?ZZtK1Thf+76TyVEcmJipfBzXROUwg0rsjKhm//Pgg2CrLXM/DXcIMaLXIp1k?=
 =?us-ascii?Q?TTUbs5ZIe80fMvzs/V0/yWRO0W/V3k84Z45cB6D6QopczllFD7vVs0fcjV+q?=
 =?us-ascii?Q?Nd/TbqJAH11i8QxymUV8xR0MoWY8Ee8yfXFz+H7nYDwTjD+nVQWxHk4nKdqq?=
 =?us-ascii?Q?AvaN/vbg8YBp2K4jdopW9WKI12ts6XM+VaTY2nc8tJ6ExQ7N1zLjx87YiAdz?=
 =?us-ascii?Q?ZbngJCulhgWUDdKTsvBH/eFtwwiHXmc6ykJ/e8MF52U3wcRX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a287ef84-a1bb-4424-d5c1-08deb60217b5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 23:55:24.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYXjEMAYxlsFr/EtZb54yB4MUdnyXHbYcd8q7ykyTNVlGQtWmdZoc5TtxJjZeOLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37166-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid]
X-Rspamd-Queue-Id: 88A51586254
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 16, 2026 at 10:42:09PM +0800, Tzung-Bi Shih wrote:
> On Thu, May 14, 2026 at 01:00:43PM -0300, Jason Gunthorpe wrote:
> > On Thu, May 14, 2026 at 03:34:12AM +0000, Tzung-Bi Shih wrote:
> > 
> > > To help me understand, could you elaborate on why the revocable mechanism
> > > isn't suitable here?
> > 
> > Stay within one driver. Create the revokable is probe, consume it
> > within that drivers fops/etc, destroy it on remove. Do not randomly
> > pass it to other drivers.
> 
> In that sense, after applying [1], does the patch make sense to you?

It is better, but you can see revokable is creating contortions that
don't make sense:

> @@ -223,11 +223,9 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
>  	ret = blocking_notifier_chain_register(&pdata->subscribers,
>  					       &priv->notifier);
>  	if (ret) {
> -		scoped_guard(rwsem_read, &pdata->ec_dev_sem) {
> -			if (pdata->ec_dev)
> -				dev_err(pdata->ec_dev->dev,
> -					"failed to register event notifier\n");
> -		}
> +		revocable_try_access_or_skip_scoped(&pdata->ec_rev, ec_dev)
> +			dev_err(ec_dev->dev,
> +				"failed to register event notifier\n");

It is impossible for ec_dev to be null here, the misc_unregister does
fence open.

> @@ -482,11 +483,12 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
>  static void cros_ec_chardev_remove(struct platform_device *pdev)
>  {
>  	struct chardev_pdata *pdata = platform_get_drvdata(pdev);
> +	struct cros_ec_device *ec_dev;
>  
> -	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
> -					   &pdata->relay);
> -	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
> -		pdata->ec_dev = NULL;
> +	revocable_try_access_or_skip_scoped(&pdata->ec_rev, ec_dev)
> +		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
> +						   &pdata->relay);
> +	revocable_revoke(&pdata->ec_rev);

And this is complete garbage nonsense, we are in a driver bound
context about to revoke the revokable, it is not optional, it can't
fail, if it doesn't we can't skip the unregister or it will eventually
crash.

I said it before, but to re-iterate - what this scheme fails to
capture from rust is the most important detail - the driver bound
checking that confirms the content is valid without any need for
locking or possibility of failure.

Open, remove, are both bound contexts that can never fail to obtain
their protected content and don't need srcu locking.

I don't konw what Danilo thinks, but as the rust side has evolved I
think it was a mistake to combine the revocable and SRCU
together. Having two primitives would make more sense

The first is "this value is only valid under driver bound, present
your thing proving driver bound and you can get the value". This would
be fully 0 cost.

The second is "My callchain doesn't have a way to get driver bound,
so this widget will try to open a SRCU critical section that produces
it".

Each driver could have many of the first but needs only one of the
second. The second is the "code smell" that says something is not
great by not properly managing driver bound. Since a driver needs only
one of the widgets it would solve the repeated srcu problem on unbind.

From that lens you can see how troubled this C version is, it promotes
the "code smell" SRCU API into the only API and makes it first class
promoting its use and ignores/obfuscates/worsens the actual API we
want people to use: prove you have a driver bound. :(

Jason

