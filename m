Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F0C47C72A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Dec 2021 20:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241230AbhLUTFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 14:05:05 -0500
Received: from mail-dm6nam12on2129.outbound.protection.outlook.com ([40.107.243.129]:42635
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232879AbhLUTFE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Dec 2021 14:05:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+vbSfWuFc+fkOTi1uHLeNxTsZBkf1swmGebIkpPKHkV8G/BA83xcxvXoXDrE+Fq3NYpdaIsU7wDeh5nhViLNKowljXvkT4VhChEirwckhJkLg9nhOr2P4+9I6yw4MvHR2mDAYDbbatYQohha/xUzNuBroQKqOmk5fb5+phsWTPJoO9gGGazKHekoKIzbxFCvpfNR/ypJV+sy3RGnBfB7zkt6I+dZ2I2YqOSsh14qkZbU4pzKQ3mYrpdv7TF6tPBzpuj+ezp3ZdTOGGw490i9dZu3sIZCPfhGClm1F3mhc/MZDq2vkFIramorKpXoZ10UcB25n7jFFtLMGCqiMrXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggmDDPbf4wuXsautqe5qpesYc0eC7sJ4+vHUJpr6RRQ=;
 b=eIaLcOPudZs5g29cV4OmIbiepFIo6mnsGG5vxJgCX5r3KqL0/ATfRLqmc9PBX34NvEJUbM8LZhOI/RxyZJFi5Dm5+hZQrUnZbgNVZn8BgF7nesx80hk1rmKYGP2MXXs/rF35pw+KkDj+Od1WmnwQkRDEZIBY0gOOAKtsPIEdBxv9WKgfgo58gzlY5WEkkg2/g2T7WPW5xoG7to2e7BFIWEXKfnRWR9bYu3OTAtT3NTGI9guP/sHsYrAX769CMfNUvpt/qHlBMvbSg3jEnTvk/AGNGgyKVMPcA2PgyUfCWtrgsSiWywLtkX3E0J6AYkLecvWF4HvfVCY9lEsPsM7x2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggmDDPbf4wuXsautqe5qpesYc0eC7sJ4+vHUJpr6RRQ=;
 b=rO/QujHDisvmkeulrzN3FMPf5QGiX9vQyy9f+oCwBRAqrnwlL0OJAPrE6/6XnTyGOe9peboSsBu5RyUuzDYuSub9pMiHKGjBJKkXG77TmVxW8HfniPfkrlDi8cxzyvJuQnCLulZ3XOc2hwNaUqd1fUr953c2NlXGJi+R8cQdsNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MWHPR1001MB2176.namprd10.prod.outlook.com
 (2603:10b6:301:30::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 19:05:00 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::2d52:2a96:7e6c:460f%4]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 19:05:00 +0000
Date:   Tue, 21 Dec 2021 11:04:59 -0800
From:   Colin Foster <colin.foster@in-advantage.com>
To:     linux-gpio@vger.kernel.org
Subject: activity status for pinctrl-microchip-sgpio
Message-ID: <20211221190459.GB13192@COLIN-DESKTOP1.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MWHPR1401CA0023.namprd14.prod.outlook.com
 (2603:10b6:301:4b::33) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abcaa6fe-9faa-4352-b0e1-08d9c4b4c9a3
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2176:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21761C63FB94BBA26A16ADBBA47C9@MWHPR1001MB2176.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CubdqlIu+89ZRR+aj26+TBwCEF0VkVyEjneu5K788+JItPWjvmm2ApIBl02cxqXYsL0EPS5vfV6yfC0grA2TBRgKUy7GdIEIN2VZAD9o0sLxSoaR301EPc0q8kur44LnfKCXo5Fg+YiOaQ9YT26kyqtrjuKOHL6TJoyOBaEYCmf34pqVk87zERZqYfpI97Z3OEIGdkgzBQ+ZxztMUcqMq6dNkd4oNLJPVQNVLVIiTBzh3589XvD15bHCHL8vK/c1/3IrLKzq5CzPNVuYsyGWzddnFDbHHSQxekCcT3NHxnVkCIGnysp5PwZFIbGY7OW+QOcjgrutAT+9PJFbldTzqRuCoewTVLhUMBVwSxxLYFl62XiqxhndD2bq/V5IwHprILR00bAdeUzYZxQLlPjxjVsNSjT8jwloSyePEUoWuH3iP+MW6tA+zQkuGfiY98Ilk0Exh0xuGxALI/XG18GDtoPhk4kHGVaURZgYh9wutj2qXebDWV+zurd6ULtKywYQTReCWg3HLviLy33kIXPXNxey0t8yttv1TUwRKFYj6MpFsukRk93DOFm3o8XfZ5tlCgORTfhK+oiVi7Buo5K6VJ9nJ+bXvAKqVAEVKle+sEjoxvI5KhVk9BvoGNwUVUB2jZfApomQT1nBrxwlZuxeND8ngvav+IJAo8JNDFipz+jx7UQi6TPBbmtqdSP3KKQ+/S6hfvoLNaGbK1tf226HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39830400003)(376002)(136003)(366004)(8676002)(9686003)(6486002)(8936002)(6512007)(38100700002)(52116002)(1076003)(33656002)(86362001)(38350700002)(6916009)(6506007)(44832011)(508600001)(26005)(2906002)(186003)(66556008)(66476007)(316002)(66946007)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/vvEcVwAlmk1r5yxIutVgMrtu5WWRZAKoFCGZzIo5evNetRKEgYXzjbSItQ?=
 =?us-ascii?Q?NMUerztjDjqM5fD227ENqZuQTVC4XT63CuauMwQJCXHMyR2jPgdQykEEQn2P?=
 =?us-ascii?Q?n1KmYQRVWWEpmu2eo5JefeKgPYhb0mmw6TXK5sjvzuY6hlyQl3kxWEPCZEgl?=
 =?us-ascii?Q?hJutP+9hr0rleNBXWhUb5amKWi2yoAEMHlQoy+FOVZl2FGC6dWeCEf6hrrK5?=
 =?us-ascii?Q?vXqzCipF/+YyGxZdsnsvOeK/aeanxD+6+fetIk0lvQ6PXFeu4K40dHcMaN2A?=
 =?us-ascii?Q?KiLsJT1KhQzVymXd6sHQXS3E+FdixojA3gtv2pN+T5CT7d5LXu9+L0FR2E3s?=
 =?us-ascii?Q?ZERQGeX8OYkZSvulFLwOcqsaVWpZeYsPkxhE34VNknEGZZYys48lgo+bUenX?=
 =?us-ascii?Q?jEW6HvHfdxcfQnOQZqk2ORSvrV6jpE6vYUfLxSrzreCSX6F6sAC22CO5D4T3?=
 =?us-ascii?Q?Z9uiGdgMEFV4qh2KCGHUSnSil7Pycydt1MOO6L38CB+38nq3r2AcWoUF6jzW?=
 =?us-ascii?Q?p2PGAKoxTJnMZa1b185qISHuMCrDCNWwlKQzaO8//jq+T8ls2yrhweGDkYrG?=
 =?us-ascii?Q?azAQWH/HGZafWmFRFH+sL1cTlil0bm7mWe49PTSS0ddCBLJflxbcBWt+RZlS?=
 =?us-ascii?Q?dhVss1FUJwDTAj73wGqA1K3X7JGqSuP3aPtzt3QnXMhU+ZTooa2iv56XGwkx?=
 =?us-ascii?Q?V6dsnHXd5ix87e7MF11QRlmbj5WI1B9ePFD7EPrPt0W13yTPedqh/o2wsK0b?=
 =?us-ascii?Q?CITA1wQ+OxTX51OStTCwDRKhNkYoC9XvwJVo1aITBl/c+dnIAbMcWZyN7ixh?=
 =?us-ascii?Q?0Mp9P+gVm8NoMocEaijmy6u8xydIYJKsCnASu8hhkzwmCXzGP3WAON52hL1d?=
 =?us-ascii?Q?plcMBdUltP5fXq2wq4UV2vx2eFbpgCUz/xGwIc/3NVTWqSdfJ5Yg5y8G7RuK?=
 =?us-ascii?Q?wLNt9XHEJeNTN56/vepNkpeSoiu5o4mx6zYp/z9OSTge5jtT8Ur4MvIFiXvh?=
 =?us-ascii?Q?lM6df1Utdp/bx7VQ3KOVHZMFWmIows/kMNL/YMnNaaxrLWp7MLjmbWbxSJAs?=
 =?us-ascii?Q?ITQuQRwkQuIRddrc9bxnhvZZUejMVrB3k/LjyIlqkoE1ZlyHuUpRZcAjo6Os?=
 =?us-ascii?Q?RKWtx/7y0WEj5ZXatWlKdy6PSk5+ZVZqo1SoPyFKD3Dyk3Ve7kwmw3FiYBqf?=
 =?us-ascii?Q?fFPG82+fL53ietueWRJXP/LL8sqgXaUJ2MJCY3LgVT2Qvc4nIIgj/nO3MXs0?=
 =?us-ascii?Q?ktGz3MatYSrKPqJo1P8cBlqLD0aFjAbCPPNU1iGtzKr5/LeWFMtZIVIrqwN2?=
 =?us-ascii?Q?B5oSBajg6gyIVp/1BFOTPgC3nOAS7QhqzknnMIEmsN0MK1p0hkoaIBV0kNOv?=
 =?us-ascii?Q?enjR98d2wVmZN/5mNn8T6npi2RVPmyNiCsMzdcTXVCIyLammyf2v2iagI23U?=
 =?us-ascii?Q?o5PsERhpGwCkNwEhC8ux6G6TYIp21phecaS0QAR9uuNBiazwgi2/bYC+QzA7?=
 =?us-ascii?Q?AAWTt7kNcPuww9IcZMmuE8V7THRoE0ZzEqOHJ+rSxoiMPJwIymimRvyAH46a?=
 =?us-ascii?Q?8iyGLNEJe1Lef7eQwZ1yauZumM3yVaOZmWExXVGj/EifKIXc6NyvqI8kfoxr?=
 =?us-ascii?Q?NeDqSioS7jYk3sGSa2Rmdmf0BoL508PrpeI0dESPeUxL9SxG0pdybCJ0q0na?=
 =?us-ascii?Q?kQTMaDiLQ9UftBowjl6BmW8NGp8=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcaa6fe-9faa-4352-b0e1-08d9c4b4c9a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:05:00.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEnaGDn1JPjNAaRXXwN05n6X8qjE9oUUiurtsjbLuaFLUksV2MREeXdf7B7tld3MCMJgok60HtqKsGPK47D0qvFGO39bbES0bMuX5LIcnbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2176
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I'm taking a look at the pinctrl-microchip-sgpio driver. After
converting it to regmap, it was quite simple to finish support for the
VSC7512 MFD RFCs I've been sending out. As it currently stands, I expect
that patch set to get chopped up and submitted for 5.18 due to
end-of-year schedules.

I don't know how the other chips that use the sgpio driver operate, but
the primary function as I see it for the VSC7512 is the activity LED. It
seems like that functionality was initially planned by way of:

static const char * const functions[] = { "gpio" };

Has there been, or is there expected to be any work to add this
feature? If there is, I'll be able to focus on PCS ports next. If not,
I'll spend some time on activity LED functionality.

Is this a feature that'll be desired for SPARX5 and LUTON? Or just
Ocelot? If it is Ocelot-only it would seem like a flag in sgpio_priv is
necessary. If it is for everything, then extra parameters in
sgpio_properties.regoff[] would seem like the way forward.

Thanks,

Colin Foster
