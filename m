Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DCE72C631
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 15:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbjFLNk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 09:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235720AbjFLNkZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 09:40:25 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E263FFB
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686577223; x=1718113223;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4DulU+4u2nPsNZkgYyAkw+FK+H6JFtaHvfz0KjVcWAM=;
  b=dSDr/ouBoJlezYK9mcQ3+EEuOGRbo6anQatbQZIPvY6k3S/Zcm7OjxCs
   viLf6nBXPcFYG4VyN7Oj45kHUpR/40EZNi44O19xJ1d7w0CxWfzsNHwj5
   yNFrV56sjHi3dVupL0YQ9D83PRpFEdf9N2u55nYF+tCoHs3Y3Sl3UleKm
   raJ78GBEPKb22mesrDdYCPoJDsLloV0lBoIrFWg/KTULownEcEP+SQ6HS
   pU5wI1sKuvs0D3qhZPcYvAPMf2tUOtTDfjpcpggjPXErtyr9NGGUoSrdP
   6LpY33hPqnbH9hbcM/uvAgoC/dZtRVwSHV9p2K3MzuSobQSelcLkbGwL3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337672977"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337672977"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 06:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688615688"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="688615688"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 06:40:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 06:40:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 06:40:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 06:40:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 06:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3ZTXwrRC6Tw7vFM3wlN9VWQVASj0bTxo+HJFG/N3Go1CNuKdQHGxMufnRdP0HPYTEnabb9JA8jlf8fZRSLfyFXf6ajQNf4YbbGRUT2haQezFs3M00dK2ABF7tOggFq/v6rt4lFB5Jnke6hTSK5Fvuq2Mn9fgVZf1lTFIKkeR7kEpMHpJUH2qJKe8xeO7dOVKhQmMfM/Y1M8glC/Ju7PZrQ/zuGmaP3Aw7v6Gb59apBR/3ya9opDPOb3n7s+gK+3DWGvJ2fBKJW8mC9A/CQdB3pQuBnq05Br2fCCdDRAOkG4FsoYn2soiUfPxOB6uCedf6d+58TPsIgBwiVFLvL9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYzMt8FyvqIe/j9D8zM5xKyJxtjfSdmWF9DHLIYA+Q0=;
 b=GWdZylYnf5+BBJwOU72gpr7pLR9rl/xiI7GARtZBh6XoMZzPEO8MWJvhWQRlvEVduXiN3VwH+2v3VZDTm2r30IqBWvXVWWZTWEhLIAPOARW4YSZUu3noSWNrwdif1e+QMkFz+6+/SpkhioMAHhvqMbtKz/uB/TVRfP8SSIn96hTsO9CVbq2PcZLVaZ/JFtQrBSPZ0tsumftG0jB4503dU3eRESLIFcvIoMvtp9Hpy+Du22n51fhgYt6oc3Se4oh8Was9QM1NBrhEQ/oPCg+7mawGzpXufy1MDVfQkR/Q66zwzGyuNN6b+9ZHOj/T4pFNUyQCGXxOadlZMGWHcCbvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29; Mon, 12 Jun 2023 13:40:17 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 13:40:17 +0000
Date:   Mon, 12 Jun 2023 21:40:06 +0800
From:   Philip Li <philip.li@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Kent Gibson <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <ZIcgNne/L0lTpdAd@rli9-mobl>
References: <20230610020148.8973-1-warthog618@gmail.com>
 <202306101327.8CQ451FM-lkp@intel.com>
 <ZIQNbB30BUsirOr1@sol>
 <CAMRc=MeLYqU8HuqVs7wGpAjZ6U+_J3TMsNonknup=hOSPqj2bQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeLYqU8HuqVs7wGpAjZ6U+_J3TMsNonknup=hOSPqj2bQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f631444-bc7e-46b1-2026-08db6b4a8e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UW/MNk2ROJ047ZcsA+Y4wPGn8UbO6HVXFWjNwxYasoCDWPAjjbjhdJ1MXCubNTQoirWGXcYMaeowlOv0GqeosJJMb4Lkmoyc1X83OCbn02/w/cnsiYIRFMXSDVAjIu6OGSxSPje4Rzt9uWx5vDYROEWrk0jq9qiyXl77IVsIvTGRO5M1IEKjRFiwAuyRw5FbdQIcpdlKtgJTIahtHIaNdettuV7e3GMucmwxOOt3ejzjwKNlzJmg3ygS0m92kANdALJbtij8Fou8987p4n7TDJDHmnRjdQEficrkCfokyTMmjzduZ40jIkSjJslFGLsFCdsidq8aiojUIiywjacTVXUVi42T51UGTL1ODIH3qEnYbEKnRPUZL9OA4ywKXVHN24k3QP9WBAvA3zcw4mykpiPD8O7+FML1TimHo1OtqmnMJTvsu9rWmLN0Zp/Tn4rI83zfrx0/zXWH8kkfy67F4GH0W4RpWTzpBokT7owJVCwqE9jX5rm030GRtAY+tFbzrH3B/VpEm0lnloQ7AcvMAAFQkZW7Pcv/CMgj8E4fWs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(6916009)(4326008)(66946007)(66476007)(66556008)(186003)(478600001)(2906002)(33716001)(8676002)(316002)(966005)(41300700001)(86362001)(6486002)(6666004)(6506007)(9686003)(53546011)(44832011)(8936002)(82960400001)(83380400001)(5660300002)(26005)(38100700002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REM1SXo4ZnhVOEFQQmFNNGlUVkk1N2xSNHA2UzUyTHVIM1FsSDdmTTE4bzh6?=
 =?utf-8?B?T0JVOUJMYk0zODlGMk9QSm1aeDd6R1FzVXQ3eUlQcElGZTVtSGt2R3V3bkZn?=
 =?utf-8?B?OHRLVVhwSUhvRUtyWWhWMUwyREhRTWw5cC9tbmxiV1ZPUnU2Z0Y1c2pkcXEv?=
 =?utf-8?B?dDBzZG5SZmdZNk9PcVZWR1cxdXlSRGFqRFJTKyt1bk4wS1hFWFVxNDVlTzNv?=
 =?utf-8?B?aDlBb2ZQUVVBUVkzYVZLR29BMzhReU5vMHZGVUhaRVZXWWpvVjdEOUNQeklF?=
 =?utf-8?B?TlQ3bzZkYjgzaUlPZE0xdXExbmYwckhRdGlKZmNacFB6alBobVhsdXQzNjcv?=
 =?utf-8?B?aGY0SzMvYSs0bEdqZTZDcEtnVnY0OGFINys3OWZDRHB0YW4zaUE0bHFYV0Zn?=
 =?utf-8?B?QlJPaFQwK25DRldMcG1VMjhiWSs2aXZvem1qY1RWemZlMmJSZW1NL3FWT0M5?=
 =?utf-8?B?RW9Id3BReHN0VjZZMnl2NXhsdVhDK2RFSnd5L3BBNnFDbG1hTWRmOHpZalln?=
 =?utf-8?B?cEhDTjJtYXVWWnNkOWNsR1AydDlzUWNXeUhVeEFRWWs5cjhDSnZJSjZ1RC95?=
 =?utf-8?B?ZGtrcG1CTmpHUVZHR3BwOVFjeHFjZS8yY2EwYmFhUm5lQVpkeE1IUWNvM3RU?=
 =?utf-8?B?a01Zc2QyblF4cFBaeEhNZ3pmdGVLSFI4TE8yL1Z2WW40MHVzNE1rRUlhdk9P?=
 =?utf-8?B?dkpzSkF3MWFpY0ZtZnNWb0tIQkUvV3ROb1d5UWo4MEwremVBVmxSaFRsZjh1?=
 =?utf-8?B?bXpNNUE4dmlUQkJwbkUvc25RVmFVbHZwYXlNdCsvbzZBalVSK2tGdFpJMFBD?=
 =?utf-8?B?YUhFaWZXblBWMldqL1RJQmFOMTNFc2RLbUZUT3BWZXhTMkY5d0RONWxBQld5?=
 =?utf-8?B?OU83c1hpcFlmTitVekRNSGhYcUxNWlAvT3BUYkZ0WGVIcjJaRVIydmw1Njk2?=
 =?utf-8?B?Y2RNMlo0K1ljT2VVZjNob29FaVpqNGxEUXcwY2lEdGpTSDJHald1YlRyTHk5?=
 =?utf-8?B?YStvZXFkK1FpRjUvME9Wc084VjcyQVhpYXBuUzhVYTd2SEMvTE9RRVBNdzhG?=
 =?utf-8?B?VFFrRER6ckc3dGYzUXR0THo2WDl0ZGtha3dvbldyckhjU1hlTVdockJ1RXgx?=
 =?utf-8?B?ZXZGWHpWakF5TGs2MTVwR21ycnZodVFHdEo1Z0JmcEJKT0pNWWVJQVZ4M0pG?=
 =?utf-8?B?ajlLWm0xampXMVFpU282WkFjdkwzazZhbUwwSUJXSFE5QUM4TGpqQ3U2eCs0?=
 =?utf-8?B?VnVxSWhUNVdVVFovc0NUWEttYkJQNEFhaGNSZXJKYVdlazF5ay9RQ3Ewb2V3?=
 =?utf-8?B?aHJpY1duNzNiK3lDN0xkTEs4Mlk1TVljY1Q5bEdFY2V0UXBtOWdVNitPOWI3?=
 =?utf-8?B?bmM1eXNyM2xQTEpodFFiRjAxQm1FSUNReC9kRGc3enRGUExoc0RXYUFMT2Z2?=
 =?utf-8?B?eGlxZFdBZTR4ckpLcHRRZmlEWXZJVy9qZGJFUU5nS3pzYXJXeHM2OXBKT2lw?=
 =?utf-8?B?UG5uYm1YTW40WUhwMXRQWktZWHR2LzdvellGKy9XYzNDRmk3V2RPWjM0dzk2?=
 =?utf-8?B?U2xzcG1QbE9LdzA5aWNSK2xRZGpPbVJDQmxzUkd1NXVjUGVXcExHYXA1UmlM?=
 =?utf-8?B?UUV6Nkd0bU5GbzA0QjNUWnZKc1llTTR2eVlrZGR6cDVjQVo4ODBpUjZyTENl?=
 =?utf-8?B?enZieWxMcGVFbE1TVFAxQ2pZNmp2T1haVS82My9yMWJ3VDVwUkZ6WE9Oc0ZP?=
 =?utf-8?B?QTdUQ09SN2NwRytHcEFjSmMzQ3J1SXl1Zm9pd1dVMVRUOStNZU9NRXJYbVJm?=
 =?utf-8?B?NnVoUmdQbUo2UzZvZTZGcUdNTWthSTlLcDVIRTMyZ1FOblN3Nm9lcW5jbUdo?=
 =?utf-8?B?ck9XdXB1MHpDQ2hRL29ZYVpNZUt0eFlmS0wxUllzbkZFUmh1WWwydzFHNXM2?=
 =?utf-8?B?MjA2c3lKT1RybHZtOStwZm54TS9vMExSMFF1dG9wQzE5emdtVDlyNGJEUjVn?=
 =?utf-8?B?VHlLRTljYWpkc3JmRWpOSE1vOWc1UzAxQTJOVmxjeU8vNDZlWlB5Ky8rUHZo?=
 =?utf-8?B?dDQ5Q3ZRbDRNRE5nYzhvd3hlbmVwK3dqV0tTcWUxRW9OQUlMUFoxdHdicWZj?=
 =?utf-8?Q?tGB4JL5IB5WzQL5HdBJN3dHoO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f631444-bc7e-46b1-2026-08db6b4a8e92
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 13:40:17.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGNICPgVGIhRfzJZt6deOT/C00fAgRfr+04bMU+R1Mfg3oASWc7S9gfppy+96ZICfHvCL7OzNfMC8VdjOLtnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 02:58:28PM +0200, Bartosz Golaszewski wrote:
> On Sat, Jun 10, 2023 at 7:43 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Sat, Jun 10, 2023 at 01:20:47PM +0800, kernel test robot wrote:
> > > Hi Kent,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> >
> > Ok, not sure what to make of that - why is the test robot concerned with
> > libgpiod patches?
> >
> > The files in the patch aren't ignored by the .gitignores in the libgpiod
> > tree, so it must've applied the patch to the linux tree - which doesn't
> > like dot-files. That wont end well either way.
> >
> > Can we tell the test robot not to try paddling around in the libgpiod
> > pool, e.g. ignore patches with the [libgpiod] prefix?
> >
> > Cheers,
> > Kent.
> 
> Normally the robot can figure out non-kernel patches. I think this
> time it got confused by the commit only adding a new file and tried to
> apply it to the kernel?

Sorry for the false positive. Yes, this is the case, the patch was successfully
applied and wrongly considered as kernel patch. We will fix the logic in next
few days to avoid such problem.

> 
> Anyway, I'm not sure where to report this. Looks like the robot lives
> on github, so I'll try opening an issue there.

Thanks, yes, github https://github.com/intel/lkp-tests could be used to report
any issue related to the bot. Or you can drop mail to lkp@intel.com, that we
monitor the mail tightly.

> 
> Bart
> 
