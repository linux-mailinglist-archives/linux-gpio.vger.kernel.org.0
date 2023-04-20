Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254936E9D7A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 22:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjDTUyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 16:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjDTUyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 16:54:22 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEED40DB
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 13:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViwOhugr25ivjRmFWkgzdPtihVe1SKDxcKWaqNnBpJO/xxrBQac8kVGoRrSKF6dqUuhDzHlJmnlLsuKqdQxd+uis37VMXMBMdD8zZ4g65NklZq+T5Q8/eSw9pFvZ2X3S+qPh0oYc8a2DgWlc5gPnMnZdNtCJm8k+jIooP9BluifSeyc7orQBgqOEarA98gJzj+h/hAyrpj73NOMQQsNceZhNdWuo++0HYcHvaXg3zxPpJMePI1zPWSFJoTCMDTpqe/+qKYu6qnYijGLM/Re96wEu5vmHbbyEbJBj3cl0IF8a1nxmlM2rz4dn4BffUSnz69wqZhwsQZgb2t6RV73cwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UZroH/MGnXWwK2gEcmpjNqUzhq5Gexx/gYzH9+5wDI=;
 b=nTlGFSSXNQnTyLLdHw0jQnIIWZLcMbgF1okwKQ7kQeTVgBCbEkSe4KGf0LcdrJXXOYgXjGeKVUE8FmU9ZgkVA7SYtSTv+vs2pciy7kDrg+VdYSNoTTQIHciZl1PN4JQRWNvTgNiYiSFj9SZHYEE2sI1+EgAbT7MV82U7T8esAglfkAUC/ktm2mG8QIQAMNVqev6OsrH3QMFFJRAzAYg5IuVYOO/OgNBIlyPt8AyTzC01OcJSvYBJXCKFhur1x1wdSxGybZVa355zBoqJ7kSqTNpnxh85M6F2ZS27Et0WAx+xcIebit/Nt5ukuwDNXP41OfhyVISQhep9wiV3olh/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UZroH/MGnXWwK2gEcmpjNqUzhq5Gexx/gYzH9+5wDI=;
 b=V9/fJa2sQsrzVfwSLvNAmPTB7aZnckzyqXPzFlDEI23mxNo0gu1HkfGabVGU42DjFtOPASN+6PQ0gUUaBPaW8fD1U9kJHOGC0UHwykAnM6C9kuAkdKG5xxy2nwnSCZU/S2Tn02V51onI9cgVTMq2Z7Ujy8fZ9ciRAMoPWhCv919KukoRw9cL9eX6mUmQwIXfBPPIajYINBu952mtFhwXjZDP54IdvAtJysZY3JLBYSIBi5/FhsQ3B5QUUikTwKnPWVxSmxqINJgMHvQUF9oKsy1wXN0zc/pIMOfqBeFJ/tOpzS/rrmDzG+sgTfz2qDMlrpo/dhYoF4XB/nFNrpl+vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 20:54:19 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:54:19 +0000
Message-ID: <036b540c-061d-bdf8-4d63-23f0a8ebeacd@nvidia.com>
Date:   Thu, 20 Apr 2023 13:54:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
References: <20230117084159.485234-1-linus.walleij@linaro.org>
 <0ec147e4-7be8-3187-0a37-249f42533724@nvidia.com>
 <CACRpkdbS617tC0kd7a6KaAvabxM4CNDBnmYZu9TFg_hbWE-PaA@mail.gmail.com>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <CACRpkdbS617tC0kd7a6KaAvabxM4CNDBnmYZu9TFg_hbWE-PaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bd8e78-325f-46f5-2a87-08db41e168ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqvnyk0YWcFsyiOJZ200X5HWS+1UHeLmDoXLlu0v6etWNJZWfF2bfQGzWemRZGJTJAneyFZdY2zaN7qoKLSgxYNqZZzbaEaN9KZ+JG01T98h9b7kXyfmQowowbigy2WtOzB0TQT3Q39j7ZgPwm1ZxN49PsBYDaaBbHA03nMgeen5LyK0SGUJYf6gYCQ7zQD5KI4E7T2Q45O5OrdrgxtMjNaeadUiou3bSMMaqZd8VIYG4F0I0pwn+qdBsGj7jjPLvmgmBWtSZSXo8SK8OLGrRvyc+Iwx8+kXYoAOFc8dgVrxb0lH3MIlQURFh2Gnd4jQzLH91l1eIJ6Njx8kY++E9kVL+h+fa5bLwcRlVBZ3dlnrHDdb3OSc+6yuEFbBbt6GnAAcxzW65h3ZdJ1Lw+AIGQPvkaIwMIDPQ/e6Mtcmsos2h4kdTyhbp4hai3EBDCB7p0CRykdUMRtey0kSlI79aqO+oG4HoWDxWThLH9E3shXsXMpxEwiY0FOv7+Mm/RXvtMoFVcv1il4asg/mwEjyf+N4QiHT6SdElOmu+Or5xedX62rpcE3ufgskBvWG4jZ6L3okWexYuAzdtXqJINdIh/RvmEBUB4ndtrxSIjErk3TWTgo/uuubEVfUEA/vVJ02uQHAXKE5kZbEJ1BVngmYWKPF9AzdvZtD3RhH4X7gBtjawjN/uvJtku8NHySRQP55
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(2616005)(316002)(66946007)(6916009)(4326008)(66556008)(6486002)(478600001)(8676002)(41300700001)(8936002)(38100700002)(6666004)(66476007)(4744005)(2906002)(31696002)(5660300002)(26005)(53546011)(6506007)(6512007)(186003)(31686004)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVJtZFo1U3Z3UCtrU01jSXN0Z3Y4UXk3RGJpRWpSNTlzUVIxUkI1ZEcxL3I1?=
 =?utf-8?B?eGR6b01pQ3dabmxYTkZtWStjUkJmNTdNWGFiSFdlRnROZ080WVJNVDhGR1RP?=
 =?utf-8?B?dU44SEE2WVJqYndBemYzbmdFNUorWlJ5WVErU0MxbkJZOHk3WkM1dmRCTGpT?=
 =?utf-8?B?c0hXUmJidHh6U2I1SmJpK0JYc3cxc2pLUXNDOTdiVXdiNzRqN0IwMkFzRXhh?=
 =?utf-8?B?TXBqL0hFL1NyZjlzdVdpY2hZVy83VFl4NUlWWS9GSHF0dmRmVGltQkNnMEFI?=
 =?utf-8?B?TWZoaGpJbndVRFVxbVArQ3QzOStrQjhWWnNhZWFBb0tSVDVyQzVmdlUyWWQv?=
 =?utf-8?B?RWc5alVHeWhjVEh0R1Q4MDBOTTZDT1ErRFV4bDljTUx5MWZjTUVBSEM1VXRV?=
 =?utf-8?B?RUswTEdrUHVkMUloNHBBb3lWVVhnY1J6eEFDY0tXL1ZUVjROQzJKR1VIRGt1?=
 =?utf-8?B?c2lnQm5HRFVXSTl4MDhrVlFVQ08zWHVwdEtqaUJNajVZQ3ZhMGxWUFFoNm13?=
 =?utf-8?B?ZmZybkh6ZTNpOG1FZDRZT0hla1pGL0E3cW9Sd29VQ0ZPNmd1eWlLa2dwM21H?=
 =?utf-8?B?SFlMM1ZXKzNIZUhyUUJ2KzBlMkZnMnlhanpyU2k5V3FhZTdwOS9wTHBaOGhZ?=
 =?utf-8?B?dDdsVnA0MkY2a1p5RVhJSkkrZWRPVE1VSDVnVCs4aUMySmgrTWFOTjdYdHVr?=
 =?utf-8?B?YS9mQkh3NC85dWNSczhybXpNazAyaWEyQ2REcUNzK054bW1EckVXem1vN2J4?=
 =?utf-8?B?RzlPYThlaU9sV04xOVNiekliTllrRkhsZElTbHc4QkFRd0Qwdkh0NGpsV3pw?=
 =?utf-8?B?d1BSNlMxSXlDWGRhNXl0R21zeHIxUkZmZjZGSWpGYVhyVEZieEZDWWQwSXdH?=
 =?utf-8?B?a010UlFScEJBR0Rob0hOVVk3cHZveGxLRzBSSXNSR3lRTFkzUDdqMEozMDZ3?=
 =?utf-8?B?T0xOYnhmRHNOQnFWZ1ViQnF0bmFSbW42cE1IU1lVbEhROHpiUys3OCtXWWNB?=
 =?utf-8?B?Y0FTSmFlN3hxc2l6S0FMYmQramlkeGZudit1Nk1CcDVZNkNYNmhOM2JwenA1?=
 =?utf-8?B?U01RRTg5SklLanFYandBL1o1TWR1L1BWa25NSDlQNkdTdEllVllSS0Z3YUEy?=
 =?utf-8?B?WFhNVTVUd1BJTWtNSHRsUWEyMFhrNy9QdmIrQkNReERLYU9DUndRN2ZJbmU5?=
 =?utf-8?B?K0VIM1B6ekkwNGphdWFDbFdITzlNdFI1YzlTbW5BS3FCeTRsaUh0YndDempW?=
 =?utf-8?B?Q0hkeEVtZk80K2w3OVBmRlZRbU8vRm8xSmVkV0NjMWtmNDZuOEpNcld4dE55?=
 =?utf-8?B?MGVnQUNMQ2I2WGZaTy9LSDYwVlhIbE4wZUQ5M0VMVHc5NmdQTlVxTmVrRllW?=
 =?utf-8?B?dERnMEk2M3VId3dzc0p3S2FkRnR4SGI4NVZLUy96cDNmY3F3SWErT3lRZU1S?=
 =?utf-8?B?aHkzRTVON21NRktVdW5ZRXZRcTMyUnJSWWl1ekxSb0Z0eG9vdlY5MkxUdWNt?=
 =?utf-8?B?UU9PSFJjbkhqRDE5Z0RDTkNkbWdHM0hTNXFpUjFFMkdRQ0hSMzNuYlp3RzhC?=
 =?utf-8?B?OVVhQ0U0TnNMckpZVis1YXR0d3pFdUk1SHpjUGxVN1BpYUg2TU90anQ5bTQ5?=
 =?utf-8?B?NGRmQTEzNHdrVzF6Y2w3Rno0dEw5dDlyd0VSYThpQkpjQ0J2VXZHR3Azek9t?=
 =?utf-8?B?UU1BeHB4VzQ2UjltM3NoRE9uc0NTQnJHamNYRGlFb0dwVGhSY3FjUE9QU25k?=
 =?utf-8?B?YTk0V3FxUmR1akRhZ1RVMFIzeklQRktvYnEwU0w0S3IzSXJUOWVoYkUrZkIv?=
 =?utf-8?B?R0UzdllCQmZiSy9xeVl4SWJldjZoTDVkOXNpVTViUXBteVJ4Um5kZUQ4UlF6?=
 =?utf-8?B?cmd6VWdxa1N6OFFzSUxUMjBGeUxiQ2p2elZtd3Z3VXM1ZytMa2N1bXoyN05N?=
 =?utf-8?B?VHJNdFdIWFVIa2RtSFEwWm5jN2xyMnJWaUJwVHFoYVNuOGNxaWYzRUhzcnhK?=
 =?utf-8?B?KzdnbEo5Q3NURkxOWXFnMFp6ZEVqS3dmLzVxZklRLzJtUHlWZUduMFlnU1FE?=
 =?utf-8?B?TmpQbVhhUDF0MWZGWERuVTY5NHFWVGFEK3kwNUpEMjlKcVhFV2ZzcitkUjNQ?=
 =?utf-8?Q?ZUHNSSxmePyvQWoUYsYum3hni?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bd8e78-325f-46f5-2a87-08db41e168ef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:54:19.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bbk0MFP39h3Gd1axZgcum/kyd6MBSuEsIwgLJADjOpZl2ZsKdEa7gTI5Czvbdh86nh4HOu5uM0LgoNCE0qUww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/20/23 1:48 PM, Linus Walleij wrote:
> On Thu, Apr 20, 2023 at 10:19 PM Dipen Patel <dipenp@nvidia.com> wrote:
>> On 1/17/23 12:41 AM, Linus Walleij wrote:
> 
>>> ChangeLog v1->v2:
>>> - Its mod_devicetable not mod_device_table oops.
> (...)
>>> +#include <linux/mod_devicetable.h>
> (...)
>>
>> I am not sure if I have followed up on this patchset. It seems this gives an
>> error mod_devicetable.h not found. Perhaps you meant,
>> linux/mod_devicetable.h instead?
> 
> Hm are you using v1? That had <linux/mod_device_table.h> (one too
> much underscore) by mistake, this v2 should work? What is
> the output of the compiler?
> 
> Yours,
> Linus Walleij

Sorry I referenced v1. This however clash with Arnd's patch (https://www.spinics.net/lists/linux-tegra/msg70013.html) that adds the header.
I guess I should be able to pull your changes with some conflict resolutions. Thanks.
