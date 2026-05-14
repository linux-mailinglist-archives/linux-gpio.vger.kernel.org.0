Return-Path: <linux-gpio+bounces-36858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNrMCO3yBWq3dgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:06:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A25544754
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75E023086FC4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1DD3264F1;
	Thu, 14 May 2026 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LipQBTLk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAE33016F7;
	Thu, 14 May 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774547; cv=fail; b=K6+d9D+p1ICdtrG1alIEWiwRQdvxpiMFEn4WpPUaOwHGRV9YEUnCmeUL6DD7u9cYuoisiNSFfHEeNdJHs6pGYGC3u40sBFu0BVLhUP5yEVXbw3jneKnlwgHqn6GwMIB+FHbOCP0zeD3GEE40tKDf2MILfs/CsQaowOpVgEeORH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774547; c=relaxed/simple;
	bh=VLXJOhVqpBa/0dr+ZmI/zvhVsiXnAw5DP5w1pGbOwmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O2NO1/Y9TKFfiqt5D2RQWaLPbXmcxbc226LRFY544xMx2ZsjYTcp4gEWly6GtE7QQwnVORR5tpbqEuw9ujaec5RI6A0mUJ5ShS91NW68WxHcT/Oda/WelHn3FZROnhW2y43po/eE8GpE3WLU4uMsWESaO3l9u+yy4EuTK+Cy26g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LipQBTLk; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peZ9oZ/shWb6aKwNytCgRd1VrmXDg4UPaqqQ7g5l5CP+9ifC+SsTUa2lC5lRp4jJCOnQ3XuIfwSAEyZtBzQUavevTiusy36cKm0Vs8FZxm7asmQh/VDv0xtTfDspdu8nTexTesnt0L25n7H4FccOsfEvf617tPsw/jV8feyqXgkvBkAulIjE284EJZzIHHAuHP4X4G9LA07zGVldpLokmQWd8gj8PMQuvPJmPWbhKqn/5+JA63WlHHXkYjXpVDFDIsCEIWyRMxjbWQCKgh3l5cgPUhOrtvmimVfZ+H0rARZmeW+GbPkEQ//y7Gt+fG4DYX/JTOjQsOHItZ53/PjsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJDKv3EQ5PbS3qgZMI4iWvPePd5TuWgXf/5Ovht/MDc=;
 b=Ey1E3OaZZH9nsK6eHPHdvXvHHD42Oer5nWjw+JYKO3Z9uQHeRLV/uMGAx07PwKgxtQLNxho2assLTOE3SyFD/Sjr00L8ROeYlyxt3FwUeeeBYPoiEZB5f8zuCSZiY+eVd1Xc+ESG346NC+MNmr7DoiaWpVEa70S0WTnycoINvsUeVQBOnesN4aQ48fiHVi7dy4svGZYN0N+UyAqAzr4EYqn9QPrNHVXpGiQWHk51OfQOmOjEm/XPme5/lU5pa67lfWmDK1Y3QKFTik3Ae5X1uQNKM+mkIlzYhyM8nrcUUJ/sPazJwl1XCinzYUQmkmHQ/3pEg9C7nRbyV/2N3zeNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJDKv3EQ5PbS3qgZMI4iWvPePd5TuWgXf/5Ovht/MDc=;
 b=LipQBTLklov3iKs8SygBiVqxocWfgOXiIZteQa6MQnsMAmCtOSvhax78DP4XrONmn2MtLNhUidbVaU5Ipn/hV1pFTzQWDjrrO1f1RLKOuy2/oB//BBGMCZsWoSb5OxKDLPEQYxNPbv5nrHzsepHQafZU93hFZXbMrmz5SF+pED3mCAMIcWCTFq9FS3150q4WB95i26EyCgJon35npknufpSwtPBdsf7GI6p/PDnbLHP2mUw/vy56EV160SqKzstx3dM0SagE/6AIeCUljQpQ/TuMWw4GHF1//i9VVsMKk0Qw7dSiK7TSe7BqN02Vpp3wEDEUnFfXn90lOGUoeHtyjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPFDDA81179A.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 14 May
 2026 16:02:18 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 16:02:15 +0000
Date: Thu, 14 May 2026 13:02:14 -0300
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
Message-ID: <20260514160214.GH787748@nvidia.com>
References: <20260508105448.31799-1-tzungbi@kernel.org>
 <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
 <agVCoxuTu7l60TH-@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agVCoxuTu7l60TH-@google.com>
X-ClientProxiedBy: CH0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:610:b1::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPFDDA81179A:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a60b19-d517-4021-a8ca-08deb1d22afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|4143699003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nXtmdahPAM2LNJ/ZNy1+iXeQhHMwSmvR69Bei16MaEdrH5ZzGh3psz6LwkB7dEnttbtFjUG0lSJUhCtSbDFNUXSiWrQasb5mO5s4171C2YU/yvLHzLGzoXMS8iH/0Zz0rl+OFEhNMur3t2/FnHP9QebjiSGbbh05Y2FAPVxC0KiWv9hL7idw6aMngmrwwOLoiGAkBPvPugPJCX/DxGMlgjkeOP2+s/NH8/k/HAd5qcj7vUGqSl0b3B/POJ6xkEViTo07ZrJDrONoVsJcNw+KDHXtCgrdjMEMDUuY9MLflDtejyYSEh1Cfdg85jXvobQyTn7o0Y53sF1rXQSpP3zjCDvG1lzf/+F3cBKmJdI6jfs9Pcmh0nKSMLBO1ZxjoZxXVjWOb/AtT6BPEVlyWhwCXolLgEPAzhcjrunKswP4bRfqfMYukgEJKzkTm6ce4s5weA8dek6I+BrsFjjO1iu++7uwNTGTdeyhepxZ5ok7hKX51GrZlENMCKJiUCWssJ9mZo93mPqY5ApdfHAYgkO/0nU7o22HJy7/QmssDZE2bNpOnWsrtYF7AfCliHwIiWv0cA4ptsa0UZAgaMZ+hNO6wT67IlEoZN8y93itq/GHloDCnhwC9O7Xz2gsELvz7lPK2htqxixVAdA96sae8L1vEED+km64Zq5xzTpUg1KgDC5Uq0x5YGbMj0I2muOrMLoXreFBqdoflvoPmjS2bK3Z+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(4143699003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+z8E5SI5rMbwBAXeZduuXdS0f+kRopqFaGMRrcUpl31gr5bviyZqbQyP9YQP?=
 =?us-ascii?Q?OojJzCDtuWW8t7nQ/ZVUhCbD6MZvJHpBFQLxvLhtzLlznX9ltzPPk4Mr/ks6?=
 =?us-ascii?Q?UlZUyaUJuB8WMHRRw6WH25TYU1pm7aLKqAfSzk2OA4ucX1AYOFQ0eZpCzqon?=
 =?us-ascii?Q?KqQ2IAp9JTp40xSf6WWRcFvOkZ9/AzJMvvsUreEzD86R4Id6FUaZfcnSSjMI?=
 =?us-ascii?Q?JpqFsgfVPh1KbDLijXbQvBKRmJoXWHl2GPdnNCwGRYeHzE6ier5N2NfpeUUO?=
 =?us-ascii?Q?2S3zaCazu/NQkBB7AY63kPoH58AfqoWymaVnl+eMeTp091Uj7Jye+n1mL2XW?=
 =?us-ascii?Q?Q0R3bg95FtnuMtSscIVd4xw8LxOsj7qpyuiTCISFdNHu0s3Ur5uHucfaVcY4?=
 =?us-ascii?Q?kY5aJSSRtYxJIY+7hz6GH4eLZNq74F1BDjxkXnaWbOFXCAJ8RLgmxckWURrn?=
 =?us-ascii?Q?0TMfAG/UJHBXhgA6RrXD1g6QX/BsQIccU2galjJtmG4Hx/EIS8gdQ8trGQMQ?=
 =?us-ascii?Q?PbRj7ZrFEvhb9q1f6LmtBQam/KPf3GHa71ppzozk3Pux9AGjmq18658bYz4H?=
 =?us-ascii?Q?Nc1FC9VopITGksNK/w2fKcR791qzYOjp1ZS6Y67hDbOne3C91fz6pEB0imGI?=
 =?us-ascii?Q?5cHcgn1SEdabMwnPiwZ3/qMqJ77EaNv2wPx4whgvd/fbTrxLZ9n9d7T+5lGl?=
 =?us-ascii?Q?9pbW6PpDYkze23fTVAYRX1QQWspeknFjwcm00degsBayF+fKTEortYeYSXjN?=
 =?us-ascii?Q?fPPQ/K3vSxUmrVCLuZfUzXzp/NIzDhBGvIAiP9rgUUAyWxM0rC5fhSaNMEnM?=
 =?us-ascii?Q?3Rn22SZM2ZGI8pVgNO7/GUPjRivVf+XRMPAFH95QT757Y2Eji8IL0M/kCMsk?=
 =?us-ascii?Q?3wex1EXpJFqMRm1jLmWP0TBEBD2ZawqlgRrC+gmmU9vbCwS8cgDwQYVEGNiA?=
 =?us-ascii?Q?zm+LaIaMFGTt8MwpLjqYBwAKfuNW7iBus6WGglf0/ON35+t2ISLFquPvGTkc?=
 =?us-ascii?Q?8rrRLHaFi5Le7wscELRmlE90QFocbhbcaIIL+6mg1deaNr8/gc0NoUjgy3Py?=
 =?us-ascii?Q?MBRPm/kL2b3u9MPjIay7Zl5GwGJhBwPfUqRormcd9qQUrl9ti4fNF81Lq4ri?=
 =?us-ascii?Q?MD2FADQmEhTT6zThTCE2vHQoJLZeGlVKNl+cd5Ex61s4QQrriY6xuSHZPCIR?=
 =?us-ascii?Q?DzbRa5Nmb3MoHXLN0Eyipi71VobmbJPl6aI/1yV9eUqOZKb2zh8Wpw9A0/2m?=
 =?us-ascii?Q?TqyRRkb7lGI0z+wqMIazXNQ/0w6nxwqzynXlZn6MoVrBXI/Z8BMflLSMmi43?=
 =?us-ascii?Q?MA4/AgAoq6PW/a7M6vaHkZiCPAzRnoEBCXclpfyA9v67lBkQgsT90/ln/hCo?=
 =?us-ascii?Q?1mpnXA8RFwVrg2Q5kDEuVmpSJUJu2HUw1a8mOhk2eeknNEAEetU5B9er5VBA?=
 =?us-ascii?Q?2eTFsrvXckp1fzKs9yG8JN6ydmOptxvNa647bZsw23mo32oP+zA77U54otGB?=
 =?us-ascii?Q?kZvTlte5eU/nPMCbIPtfr6Mr/U35d3hEWSpEIEmtz8olQPaBfiZTnYmYaRXf?=
 =?us-ascii?Q?aLDeoPUgIKRfuN6GUrFwdkhdI86z5F9NE0Hm6GHuYZIWgxq9get1a4rtzSeF?=
 =?us-ascii?Q?B5FiHrK8PDzc0ruwdRX82a+aY9wm8hs7QwaP8aDJOnW3O4FeywXtaipwG3dy?=
 =?us-ascii?Q?NvPoUnKc2h7qeKIgekb2cAQtj3zEwV0l78UazrXBPjGG7oHr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a60b19-d517-4021-a8ca-08deb1d22afb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:02:15.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcO0kJLnTIxonZx1/42onrG//obC2BD59GUfnSqsqcBFnyRRZjNg1qqVe7fPvmBp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDDA81179A
X-Rspamd-Queue-Id: B7A25544754
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
	TAGGED_FROM(0.00)[bounces-36858-lists,linux-gpio=lfdr.de];
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

On Thu, May 14, 2026 at 03:33:55AM +0000, Tzung-Bi Shih wrote:

> > Given you say this is such a bug I think you really should be sending
> > a series that is patches 5 through 7 from the other series and a
> > simple rwsem instead of misc_deregister_sync() to deal with this bug
> > ASAP. No need to complicate a simple bug fix in a driver with all
> > these core changes.
> 
> Apologies for missing this suggestion.
> 
> For "patches 5 through 7 from the other series" I guess you're referring:
> - https://lore.kernel.org/all/20260427134659.95181-6-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260427134659.95181-7-tzungbi@kernel.org
> - https://lore.kernel.org/all/20260427134659.95181-8-tzungbi@kernel.org

Yes

> Could you provide a bit more detail on the rwsem approach?  I'm not
> entirely clear on what data or operations the rwsem would be protecting.

Just put a rwsem, or even scru, inside the driver's fops.

You can refactor that out to a misc or revocable later.

Jason

