Return-Path: <linux-gpio+bounces-1208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A259F80C0C5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 06:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DFD1F20EF3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 05:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7F31CF88;
	Mon, 11 Dec 2023 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1dUasRa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5153DD9
	for <linux-gpio@vger.kernel.org>; Sun, 10 Dec 2023 21:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702273301; x=1733809301;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oH2GwFbm2l3mEjNfoB2q8XFjj9hEIS5NLQ+meHQK6Ks=;
  b=a1dUasRaf+MVTBLI9zpEJk1ngA8z6yRC7ppNqQwGGl7v/BsrgJyUSo7I
   cuT63QNHGMaPTYb+KxeJc4FpiJZn5PHkgShHeT2j3NvzJetV2tA3C3GRk
   YqVQwCzCwenVAxmbb4vxUp6yEvWz9x3itNPRYW1BupCGktxySb6kxbiAx
   Fi9bvxSxoVdkZkx0Go9ZTGUGRJwONMosw/O533YBNF5ec/WENFqav+gVj
   bUydNgrbmWrnGMfpR7foIWqAb5DAMVQcBn7KtTFk7hJl2Clwht/t7BuG0
   hfO/S/P2+yzkmjAG+9qbJmTuFZF93IfJbLdIQDM0rEPb+XBon+LQy0Efd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="458906424"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="458906424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 21:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="772916426"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="772916426"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2023 21:41:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 21:41:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 21:41:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 21:41:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Dec 2023 21:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq2ARmfDJYG/2idnryIOPTxUoihetO0+Jr+jOmUnpTEpsLIXr4tY4NFBXvJPMofTggWN8Y7alKJPyYMAuI8IuQkaqWml5gtx2IUHDrrgrU6vW9tIsKqiT+P7Y7STomarnPJ6WIsUz4CZ9rlCvgedeKkzVJws/Xlx7sEQe6OrFuoAtZMKq351gcyqDX7d5OCFwJVFdmXrvFHpQQlzgVt7ir5JASFCriTkLXmIJJbkmIwc4hE5SMXxEQe5eSuWQU7LjuT0DpNiJCZrJVzchWVBNMK/z/9mUrJUPqMv6xJ9Hp+k/3GgwpESlRaAIMbRIATDLdAXiw/zs+Wez4n0EJ9bXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chnqoPko8BCJunFWSoa2hUXmA5T+k51PVn5wSlHHGlI=;
 b=jyyTLjlL3ojonSApOpFaiQaGBWXu/LMGPIsaOxmSWrrOWkqWGom2oIi6JapdKY5j4A3CPCcOPXIhIlmE271hv6xnwdCf096ZhKawb25fjtPJ5eU/UGccjE/YPbM/cmshdU6E1GubSSIJRgcfwXjath9KL/3t1nbU1ew9E2p7de9SPUBs/c+Rog4zybUX8gT8DZBvmBtEILXSI7jRTqjcvJaDxYSD0d3bFuQ7r1J2JrIadxoNOa5LpVRYQ3+4nmz3ZbYQ2imWReqIoioA/sqchiloHRa9gGvEw8MPzfHzu92rjrRZyJUlIooyYp3GQQdNXGNpAN8I+q2veJ3dH/TmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:41:33 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 05:41:32 +0000
Date: Mon, 11 Dec 2023 13:37:02 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: kernel test robot <lkp@intel.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [brgl:gpio/for-next] BUILD REGRESSION
 d22f93c6a0df15b9d1f500ab57d97ecc99b3657a
Message-ID: <ZXaf/mcA358gmZEP@yujie-X299>
References: <202312091806.NgjIKxZC-lkp@intel.com>
 <CAMRc=MdTQ1n+xJUZNrnEPn3uu9_kYatuW3EayTve9-EJ22MsTA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdTQ1n+xJUZNrnEPn3uu9_kYatuW3EayTve9-EJ22MsTA@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: b25b9a31-1695-4679-e836-08dbfa0bd4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQejV+drsP2Egn9Fn2zcCUXzqplOc+yGJVLoJdQy9f3aFocGY/2/jxBtdWTj6RAcGj4q+GQTB2XWAUyq6GYoQeh+fhkkdpewR1qVVJwKqRpMXpqDGOkheyjDqEFbaTVQXr0+cy1MFjy+4MAhsTeaMEYiqJhJArwQ1E4GfUnW/d2h0CdY/i9yO2T2dcqq8NHRrGhs7wjfI2FdeFMtgnezlsd/tCZK6ePljqKwa6fgzgd0QL/cTxC4dFg0zpcidDGCGEZu2AwEco51TtCdc9F7tb/R5SZuzSWO8QfrrGhmtWdgmfb/R3qmJilD5etto5mfz0EUjrJYDCEalFCPnehppliCbFZGba6HnWmSfvbWnajCw2pBnShfPj6YUjc++cranZeLluDcDyOLtst55NumqhKeLizBsqzw8ZnEcrSLiCw7tpMQ090tt+TliMUPXRD+8A1bWKvqwL9OU/9YJFp3mjfoiu7IvXS1Np17leVzKIedBN4kj7GZDLK+TA7JA/1aCszyzWGI3e7nRvXPwNYE9kZlaCScvh/uioqeCF7ow1yiqOmsTzLJ0+e55N4zR1uKrzEb5iMopsfgAffp+i2pUvIYSGwuD0H9VsiOAZ9viYLTdva5dvD2IufO+1p0qcYQBj+8h6G+sPdJYrBSI8reXIAmpPO64gsdAw04hOvnnU38o+wFCA0adVifgVePrnfT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(346002)(136003)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(2906002)(41300700001)(33716001)(38100700002)(86362001)(82960400001)(9686003)(6512007)(26005)(478600001)(6666004)(53546011)(6506007)(966005)(6486002)(83380400001)(4326008)(5660300002)(44832011)(316002)(6916009)(66556008)(66476007)(54906003)(66946007)(8936002)(8676002)(98903001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkt0eDNQWDZlejV4aXN1WTREcjYwUmpncHJoVWJHQ0RqQU5UaWtualYwZUgz?=
 =?utf-8?B?Y3J3QVpLN0llVk5LWlQwc3ZTalJLVXA5SzhBUm5HLzB5dGloS25BaWFCb2VC?=
 =?utf-8?B?Ni8xU0g2OFZrWENiM3pEdm1hTTlMV2ZuUTVuai85b2lza3ovUnJrZnN4bEVu?=
 =?utf-8?B?MFdHRThyS2Z0L1BYZmhxWFdycy9UcUtDQTJybGh2SktKN09kTEVDbXRsZ0Jx?=
 =?utf-8?B?U3NCd2g5Ymh4NGV5Z3hndmZvRlF0TkxrWk1LaTBWbXNsaEZ0VWhSRzhyemtJ?=
 =?utf-8?B?UzRqK0oyb2NoQVZZKytXdWVNWmlZdmdlK3plZlI0WDNJMUNRM3U4M2lFWThR?=
 =?utf-8?B?QnJyTE1BWkJQbjJCN2tQSkl5WkhrTndXcE96dFVkMUEzUHlrRlpKd2JmaDRR?=
 =?utf-8?B?L3JZTk1MQzlZMlVqdmxEYXF3SFJmSXZIekFzV0sxaE5sRHVXalBjM2dnc0ha?=
 =?utf-8?B?YmdpamRsSmswSndsaEtBRFlsK2hvM0tRRnQyUHptWWozaG9waVBxYUFHZnRB?=
 =?utf-8?B?N0lZV1h0NnArYXJVM2FjUis0NGtIZ2VNMWw5dlJoamlaTzM1M0tRcW1CaXZT?=
 =?utf-8?B?WXVZZm43aEZsT0hPSW5nRUVOclBETDAveHdlTkVGalFKcnhiRS92aEpWemhZ?=
 =?utf-8?B?RWNoRWkwR0Z1REIvUEVsUkpLakVZMkxZSXc4TUpJWjdObk9zdi92cXlLZ1FF?=
 =?utf-8?B?WGpVZ1RSdW1HRmlZWjZYOGZHMU1vYzMrZHROZXBFMzBvVlNnS3E5UTI3aGdJ?=
 =?utf-8?B?ZHlIeDJsVlcyWTZTaUtBcmJUUnJjeHArVE5pS0NyTUpPWE80T2E5N3V6VDV0?=
 =?utf-8?B?QjRHN21uYWppWFZQS0pKcStMaW40eE81dzRTc3pEUkxYK2xEQzVNZnUvekhL?=
 =?utf-8?B?dmp0OThVTjNkc256amJ1ZzNoTUt6WnVBVjVISFpPQjRFb3FsTmJnUmM1eGxG?=
 =?utf-8?B?bzJPVG1ybVNJSm0zWkcvOWhZT29RL3dtU1ZzY21saUxjTDhsTlRzTEVhUXU5?=
 =?utf-8?B?SlpiWnBER2V1SmFJQ1NDMW0xVHpjMG45bUsveUdvQ1d0bFBVaUVJQms0dXNN?=
 =?utf-8?B?dm1oclpsYVNCTENHWHJsRmRCTTZ0ai9uenhNWmoraWlaVUpJaEt0SDIzbWdp?=
 =?utf-8?B?NmFYQktGNmw0MVlSNjZKSnNubHhzNDFFUUVUZ01BNkNMWUNnNVMyZTdTTlNl?=
 =?utf-8?B?SThUb3ZvSm92NmZ2b0hYdWtLbGRNazhRNW83Q0dwTGViYkpvQnpQRkloTGdp?=
 =?utf-8?B?RXVrZXhodjdxZXZhbWZCTWZTY2FIcVVHc0ZlbXFDQWVRSi9YYUtxRk9hWW9v?=
 =?utf-8?B?QUpYZTI5d2tWU1pkVTJvSmJnUkZzWmFheEtJR0FGSVJ4MFg1UVN1MmZ4TWRt?=
 =?utf-8?B?VEx1SFZEdjVYaWYzcFFhb2ZHdUc5U0N1YUZRRk9xL3B1ZTRXSk9pb3pCNVBB?=
 =?utf-8?B?RlVpYW1IcnRnMTN6NGJSRzZkbnJZNWl0T0hHK2ZmUFJVZ1YxRUF4dWZDRHRi?=
 =?utf-8?B?R3U5Y1I2aHlaUVVNc012cTJiN2wwbncvVzEybm9TUEJ0ekVzSkVnNzNxYjJn?=
 =?utf-8?B?Q1k3T2Qva3JCelh3Z2hRVXhYWmdqR1RqNUJiVU4rd2x6MEZBajB6UjA2b1VN?=
 =?utf-8?B?ZDBOY0ROSWFtcWFmcC9uNUJ3bVFqMUJoTXZhT3VydmNwbnE3UVo1WDVaZnNU?=
 =?utf-8?B?cUxwbEx6ZGJkcnFuT2NiTlBVeVFlVzduNEEyOUZaNU5YQWRkc1VhUE1mYk9E?=
 =?utf-8?B?NWttVjMxcUZueDMyVVVUbjFsV2MyVHVPRkl3dld4QXdKL2lYNU1ic3Y0b1ZT?=
 =?utf-8?B?VmI1RE9Od2EwWXBkNnZ1T0RwU2pZdVZCcG5CNWtBMm1EK0NRclNTcWd5WStK?=
 =?utf-8?B?Z0RKR2lNS1ZERm1Uc2NJakQ4bk5OMTY0ejVpU3Y1d0xlY05SeDBPTUludlI0?=
 =?utf-8?B?STBqTysrdEdMMHhNQmoyU1VyYUs4MzVKQjdLU25nMEFiRFcxMjZ3YWh4MC9H?=
 =?utf-8?B?amJ5M05lVXdCdmhXTHB5OEcrZzhXYjFXMW9NNnBZbmc3SFJWaS81UmdOSjVy?=
 =?utf-8?B?ZUZjSXUxK3dDQ1NOcWlWdmI2RGVKQ1hCVFZ6QzRGWTI1WDN1dWtrQ2hmSlEv?=
 =?utf-8?Q?cjUmUBTVGj4N6yw6rkk0CkvIX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b9a31-1695-4679-e836-08dbfa0bd4ca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:41:32.7384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsGuUIeTDxSdl8pzLZhoZNIJBzqWCAA2SCBb497Pv6vcQ4+LC/OroSmWiC1GnnQDnxN7uQL9DxZmLAYriijCkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
X-OriginatorOrg: intel.com

Hi Bart,

On Sat, Dec 09, 2023 at 08:10:03PM +0100, Bartosz Golaszewski wrote:
> On Sat, Dec 9, 2023 at 11:00 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> > branch HEAD: d22f93c6a0df15b9d1f500ab57d97ecc99b3657a  gpio: sim: implement the dbg_show() callback
> >
> > Error/Warning ids grouped by kconfigs:
> >
> > clang_recent_errors
> > `-- i386-allmodconfig
> >     `-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
> >
> 
> Is there any more information on this error? It doesn't even look like
> it's related to GPIO at all.

Sorry it is a wrong info. This is a mainline error reported at [1], but
wrongly added into this mail due to a bug of the bot. We've found the
root cause and fixed it just now. Sorry for the noise and please kindly
ignore it.

[1] https://lore.kernel.org/all/202311201620.mhbq1YMe-lkp@intel.com/

Best Regards,
Yujie

> 
> Bart
> 
> > elapsed time: 1472m
> >
> > configs tested: 124
> > configs skipped: 2
> >
> > tested configs:
> > alpha                             allnoconfig   gcc
> > alpha                            allyesconfig   gcc
> > alpha                               defconfig   gcc
> > arc                              allmodconfig   gcc
> > arc                               allnoconfig   gcc
> > arc                              allyesconfig   gcc
> > arc                                 defconfig   gcc
> > arc                   randconfig-001-20231209   gcc
> > arc                   randconfig-002-20231209   gcc
> > arm                               allnoconfig   gcc
> > arm                                 defconfig   clang
> > arm                   randconfig-001-20231209   gcc
> > arm                   randconfig-002-20231209   gcc
> > arm                   randconfig-003-20231209   gcc
> > arm                   randconfig-004-20231209   gcc
> > arm64                             allnoconfig   gcc
> > arm64                               defconfig   gcc
> > arm64                 randconfig-001-20231209   gcc
> > arm64                 randconfig-002-20231209   gcc
> > arm64                 randconfig-003-20231209   gcc
> > arm64                 randconfig-004-20231209   gcc
> > csky                              allnoconfig   gcc
> > csky                                defconfig   gcc
> > csky                  randconfig-001-20231209   gcc
> > csky                  randconfig-002-20231209   gcc
> > hexagon                           allnoconfig   clang
> > hexagon                             defconfig   clang
> > hexagon               randconfig-001-20231209   clang
> > hexagon               randconfig-002-20231209   clang
> > i386                             allmodconfig   clang
> > i386                              allnoconfig   clang
> > i386                             allyesconfig   clang
> > i386         buildonly-randconfig-001-20231208   clang
> > i386         buildonly-randconfig-002-20231208   clang
> > i386         buildonly-randconfig-003-20231208   clang
> > i386         buildonly-randconfig-004-20231208   clang
> > i386         buildonly-randconfig-005-20231208   clang
> > i386         buildonly-randconfig-006-20231208   clang
> > i386                                defconfig   gcc
> > i386                  randconfig-001-20231208   clang
> > i386                  randconfig-002-20231208   clang
> > i386                  randconfig-003-20231208   clang
> > i386                  randconfig-004-20231208   clang
> > i386                  randconfig-005-20231208   clang
> > i386                  randconfig-006-20231208   clang
> > i386                  randconfig-011-20231208   gcc
> > i386                  randconfig-012-20231208   gcc
> > i386                  randconfig-013-20231208   gcc
> > i386                  randconfig-014-20231208   gcc
> > i386                  randconfig-015-20231208   gcc
> > i386                  randconfig-016-20231208   gcc
> > loongarch                        allmodconfig   gcc
> > loongarch                         allnoconfig   gcc
> > loongarch                           defconfig   gcc
> > loongarch             randconfig-001-20231209   gcc
> > loongarch             randconfig-002-20231209   gcc
> > m68k                             allmodconfig   gcc
> > m68k                              allnoconfig   gcc
> > m68k                             allyesconfig   gcc
> > m68k                                defconfig   gcc
> > microblaze                       allmodconfig   gcc
> > microblaze                        allnoconfig   gcc
> > microblaze                       allyesconfig   gcc
> > microblaze                          defconfig   gcc
> > mips                              allnoconfig   clang
> > mips                             allyesconfig   gcc
> > nios2                            allmodconfig   gcc
> > nios2                             allnoconfig   gcc
> > nios2                            allyesconfig   gcc
> > nios2                               defconfig   gcc
> > nios2                 randconfig-001-20231209   gcc
> > nios2                 randconfig-002-20231209   gcc
> > openrisc                          allnoconfig   gcc
> > openrisc                         allyesconfig   gcc
> > openrisc                            defconfig   gcc
> > parisc                           allmodconfig   gcc
> > parisc                            allnoconfig   gcc
> > parisc                           allyesconfig   gcc
> > parisc                              defconfig   gcc
> > parisc                randconfig-001-20231209   gcc
> > parisc                randconfig-002-20231209   gcc
> > parisc64                            defconfig   gcc
> > powerpc                          allmodconfig   clang
> > powerpc                           allnoconfig   gcc
> > powerpc                          allyesconfig   clang
> > powerpc               randconfig-001-20231209   gcc
> > powerpc               randconfig-002-20231209   gcc
> > powerpc               randconfig-003-20231209   gcc
> > powerpc64             randconfig-001-20231209   gcc
> > powerpc64             randconfig-002-20231209   gcc
> > powerpc64             randconfig-003-20231209   gcc
> > riscv                            allmodconfig   gcc
> > riscv                             allnoconfig   clang
> > riscv                            allyesconfig   gcc
> > riscv                               defconfig   gcc
> > riscv                 randconfig-001-20231209   gcc
> > riscv                 randconfig-002-20231209   gcc
> > riscv                          rv32_defconfig   clang
> > s390                             allmodconfig   gcc
> > s390                              allnoconfig   gcc
> > s390                             allyesconfig   gcc
> > s390                                defconfig   gcc
> > s390                  randconfig-001-20231209   clang
> > s390                  randconfig-002-20231209   clang
> > sh                               allmodconfig   gcc
> > sh                                allnoconfig   gcc
> > sh                               allyesconfig   gcc
> > sh                                  defconfig   gcc
> > sh                    randconfig-001-20231209   gcc
> > sparc                            allmodconfig   gcc
> > sparc64                          allmodconfig   gcc
> > sparc64                          allyesconfig   gcc
> > sparc64                             defconfig   gcc
> > um                               allmodconfig   clang
> > um                                allnoconfig   clang
> > um                               allyesconfig   clang
> > um                                  defconfig   gcc
> > um                             i386_defconfig   gcc
> > um                           x86_64_defconfig   gcc
> > x86_64                            allnoconfig   gcc
> > x86_64                           allyesconfig   clang
> > x86_64                              defconfig   gcc
> > x86_64                          rhel-8.3-rust   clang
> > xtensa                            allnoconfig   gcc
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
> 

