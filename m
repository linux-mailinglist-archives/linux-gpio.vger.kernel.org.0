Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C48305392EB
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 16:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238994AbiEaOF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 10:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238215AbiEaOF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 10:05:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193E35DE4B
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 07:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGxkFGlIjj7W+Dazv3eFngYrHMPkoFJNK8ll78z4Ci758DOFOs92N7jWZveqW4hxboGeBfnEFoFQydbeIoIz4WDO3zPGmZ9K2dOiMhuMWv60ffEOA9SqXdxAYTBE+JIq8pro03OHRTp2cZuX8zlj5F7WKXQHKIWTeAVwh8YttvBtDY5Lm8z0z/5Dr9LvOQSLf3YMQoQVlHu/iWiEmpS3DVPwQ/E+fyj8vYXDRIquk0b6w1l0xEqHHk8Ac+bzY94KGb8eVCpjwn83ZIhuRIYfoUSZI/74L+amAoFxblcGtO9lCW/OsHhyuNSf7JFyTcKVKUWyZF/ACK6SGn3cxGZyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq3WlOWFYQpZcSf9pn8r+5hM9GLXdf1XrBxGCpHQWxQ=;
 b=CeMsqOyt3X8XD4PruQNPG3BV/wPEsdTmPTc9yYqYWU99G9BZcDpv2hfyGI6+Jhyel37NZaYnPmr/a4mv9fS38U+bWlJZu6aif22jONqAZyhMQaP484oDA+n2XeX9I4PTd7Xh8t7+KcxXIbO3dOPfGqJa6coMwr2lY/FN9P6hs5DYx7zIUGVq1K0dz4LWGhff7nMursJs8VqJMoUmsa7UhIRlXHkxk8vCNO0M1++YuuRAKhAAxtmKMTqlP2ftSTdELJsaukmkl7kWRCd8lNbiJ5ZTsahL+IhWVyiXnUTGi46hJ1xI3QqntsV6JaZjiQPntCHx6U3b5e2L9m4McJRbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq3WlOWFYQpZcSf9pn8r+5hM9GLXdf1XrBxGCpHQWxQ=;
 b=AXg749xgK87pfwcGvaYQTvD/IuqZXT2Ezx8Lj0wXLD2djdYtlN5rXb1KUx+3mUbFKd5Qt+5NfQfMQShehBOFxknI16aWXqDbB2tMe2UJt6dnKi3kNOXCQYp4uUcdWpw0oqALUT8gipbinpFk3FqfiQSX20aVnftjHVuTsvQFTIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 14:05:54 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 14:05:53 +0000
Message-ID: <9f7d1107-a4a8-86f7-e3a1-a92ff206b90d@amd.com>
Date:   Tue, 31 May 2022 19:35:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/6] pinctrl: Add pingroup and define PINCTRL_GRP
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
References: <20220531084322.1310250-1-Basavaraj.Natikar@amd.com>
 <20220531084322.1310250-2-Basavaraj.Natikar@amd.com>
 <YpXdooVIYNQGoQMt@smile.fi.intel.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <YpXdooVIYNQGoQMt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::20) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f8a350-f575-4531-fd88-08da430eace2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5062BEFB412B2E1F9DB70187E6DC9@BL1PR12MB5062.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFeKHJ/tSS/RFqENkFVay0r7duzImbt5TfPogc9sFig54yJrRB3OLrka68bbnn1l7awe92ePoW2aGoMby+Y0A1H8e8Gp4D5uBLYJ30khcRzrrWYSVUL1mM+9wJ1DlZrDXYJw7k0so+Qe2alXtMVUt2zVnebyzqURIQWSzP2iCiD4hWqgobK6z+clzJLXeqxFUuiE+gHovDBsRiSG2BXwu8X2nlz3uv1eivALXCxeEMVlL+lFopu2eDRWO5lXXwHLLHBHM6682Nr0RJ6C51RGHypHnedEQYbovOjheHsTu/xtOlhnT4SELvDrbntZCz2uGLg7HEJiDcEWo1t3UUWEbKExlRc85HyrcPmluWAmKp1JgBCCXIdYQVO2Z4VcF4JAkG3WC/A4vMB0TlzUfyquNIn9Y6uR8m/4QoK8UqM+bgBatFJ+hdFSuVxqr44JYKJ72t67c+/Jd9WJrmcygsS/Z/L73MObMgLxQROYDWBdDBpptEey6Cm/D7lScnnTsPh/7ANHVQyHHiGMmHRCo5Lnr6ANsP2z7Bkq79HTBTOAVYKU48s0UDuHtV04oGNyZsXWVtjuz8Pt5cjN0gHSk8jAqwT9spxNXy1ppy2Wxwyugf7mhRIRUldHUQV6fxp/1EN3Ugg/A2GclGT6vHoqIjmDfp+KeuGr4ZoyzObH+wMv6vAuoUa+m7GzWTavpqbym8DsDQIjWRu0hMd93vz5f60PbT+oKMaAA8tho7mnfUQtWsbPY6zBXj3aE5WMEtVe0cXy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(186003)(2616005)(8676002)(6512007)(36756003)(31686004)(66476007)(66556008)(66946007)(6486002)(26005)(316002)(6636002)(4326008)(31696002)(2906002)(38100700002)(83380400001)(508600001)(110136005)(6666004)(8936002)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhmdVBKRTVKTm1pblhtNEcvT0p5ZjI0OE5OV2p3ZkNRc1QrQ0txamEyalJG?=
 =?utf-8?B?ZmRuSHd5cnJoSXBvQ1ZXSVZHRzhsYnMwODBLcjV6b1JNOEczRVBBRFRZK1cr?=
 =?utf-8?B?d0tEeXJKTnFocFVqclcxQUdJN0xuT2h1bVlDUEtsV0M2SStEQlh1aW90S216?=
 =?utf-8?B?Y2JlU3NBL05kb1g1Q3BZQXRIeXRtLzRhaHlKWEozV2xPYU5IbUpUb1dIaTVr?=
 =?utf-8?B?Q2RhNDdkVzhrckhIdzJRNStYSERqL2ZCTHFPZnA0R09aZFdhMVN6eWVrTko3?=
 =?utf-8?B?ZEp5ZXpIblFUTm5QOFowM2t1R2wvQzd5UXhtSmx2TjBFUy9RRGwyRVRQd2xa?=
 =?utf-8?B?cVo4K3JaKzFnZnJmNUc4KzFJYUg1MU1uOURwMTR3RjA5N0Z0TjZSWThjYnFi?=
 =?utf-8?B?dDFqdE9GdHJIL1dFOHIrVGNaZ29LSVVrK0xQUGw1WnkrYTNqNi85R3A5b3JE?=
 =?utf-8?B?a1VnbXl0Ti90SEl6R0JJY2E2TmU1cWtIR3hVT0hENXR6WFBWQnZJV2tCUm9y?=
 =?utf-8?B?VzF2WmQwTE10eXBqc1QxelVqeUt3UXN2NVV4aFIwTVdoQll5T1p3MzNkWjJD?=
 =?utf-8?B?QjZjSVZzeC9ETUIvN255cS9abDZMNHhoL3ZRZlF0UDR6bHJEVUYrWTVKRisz?=
 =?utf-8?B?eXFWMEMzT3RKbzBaZytUbFBqbUF4Zm5uTjZLV3dFWWRveU95S0ZkN25SMFEr?=
 =?utf-8?B?SExZYjFTZk9uQlo0VDdVR21ZSVZGSmhjbWRPUXo1eXRuZWwxdmY5cWQvQ3ZP?=
 =?utf-8?B?dyswc0dRVDVIYThDUFdmRmFBd1h3Y0JYNWZSOXBTVVhUbVdBc2hyOWNCWVFs?=
 =?utf-8?B?NnV6UnBaMkgrdldZMkFpUHdJaVdFVTVlMHRHdU12bXB5Yjh4dmRkTTg1OGRH?=
 =?utf-8?B?SjdZQis0VytmdzNUVFBXNlZLdkpkY1pPYWlsNEk1K2ZXQUF1RnNCMkM2TTBN?=
 =?utf-8?B?aUJpS2Zvc1Q2YnhzeVdpSi9mRC9ySGV2SjJRZ2x0Z09BOWsrYlpNaVAvN1Zi?=
 =?utf-8?B?bDFIUXlsQjczVGZhOHRPRnZ2VFBRc3U4YTB6eXdEdllTSGNJeUFKWUtTMER1?=
 =?utf-8?B?NEp2S0o4OHdkSXZrNFdLemhibGgxeTZpRUFHcWNaQmtoVnFuSS9aUDIwWGxo?=
 =?utf-8?B?WUx5T3J1WkFQbnR6QkZFM09TenBZY1ZSMUNxYVArSTJDWWVyYVZza1ZSK2tr?=
 =?utf-8?B?eEI4R2FUMVlldXAydzAxTGRJMHJORHJGZzNpTG9BOEsrUDZUSnhNK3VjbnJZ?=
 =?utf-8?B?L0hRVXUwMkdRZ0FtY2dZdkpnakNiWFNFNGJFcjBNUXdoZ21GRi83a2wyUldW?=
 =?utf-8?B?NWlYTWZpa2Flc3RlK1lNVFFadVBLQWRMU1lYalN1ZExtZzFTN055bWU5ZTFT?=
 =?utf-8?B?NWR6TGppZkcyaHBJdUZoa1RKRG1NRml5S0xGOHNIYmZteWVxQkVOcWdscWpU?=
 =?utf-8?B?NWdUdXhJNlVKWTNnQzNZWnFDQ0FzczRHL21DMjM2MDRaNU8waHpaU1B3RTB2?=
 =?utf-8?B?OXJkUmxpNCtVZ2hKL21MYVNRUUxxREtYZTIxNDhuWDJXa0ttRjk1S2dlRXMr?=
 =?utf-8?B?QXVQbTdGQVozM2Rtc1pCd0xsU2Vsc3NjNWJReERGVXRNSjFoRjBzek95bXJL?=
 =?utf-8?B?RSs3VHUxamVRYkM1Ymg0dis3VzZ4UkV5THNSb2k1UlNEZjN6aEV5azFvTzE0?=
 =?utf-8?B?cm9tLy9LMlgxMW9FMDdpY3FaTW4xNlM1WTlWU3JlQ0IydEJhcVdUM1g0UEg3?=
 =?utf-8?B?VGxWZ3RFakhEM2RuaVMvQzBjQ3dLQlZXTXRrM1ZSdWhicGxYY1pWcGl3K0w4?=
 =?utf-8?B?Qk00Y050cytWSTJNTTBLMUtJTWNJL3Q1Vi9zVC82TGZPL1A4VEROUlkxcUNt?=
 =?utf-8?B?dENTV3MxUWkvWDJEamgyb0ROQmJOY1FVVlIwc055MDl1VmcyclBWcGFhNzlS?=
 =?utf-8?B?dUZXTjBNcjc1dFJEeGoxQkVSOFA0V0xEZ3pVNytHdXV2TVUzVldwMk84cjJB?=
 =?utf-8?B?QUFObVhoWTYyTjhJdlp0anBoUDVoemtWYUFRRFRpSmlJYnJJejRKdlM3M3pT?=
 =?utf-8?B?WVdVSzk4eW90cWs3RS9YVCtMR1ZJbFZ5L3JIdFVRMnI4TVVWSjE2TUVqWHVY?=
 =?utf-8?B?NStpaTlZcHNKOVArcXJrRXpBM2ZxcE9NK1lQaFlIOHp6a0ovSmdGeUxsbnZH?=
 =?utf-8?B?akxVb2RMYTBFRlRCcUVLWGtYa0I4dGZ0bUgwS3VhdTI1ckVmTU1hZjNPWXlH?=
 =?utf-8?B?M1ZqZlJ6c0tXUXZGL3paTGRndldINDJkSVZsek1Kc2ZuWjl1ZUtPWUZUQU82?=
 =?utf-8?B?bksyYzFMMHBkNUxGaWNpS1hIL0R6d2FPcjNlbnVSekVub0RwSSsxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f8a350-f575-4531-fd88-08da430eace2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 14:05:53.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVOB6ASLTDtpFfFfLSQZ4bXUZtm4kKUFoRA8QHtwGZ74kjQ1qoB4dPXDr6oLtQz/+RoBghUdNVMYHln2vp3vkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5062
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/31/2022 2:49 PM, Andy Shevchenko wrote:

> On Tue, May 31, 2022 at 02:13:17PM +0530, Basavaraj Natikar wrote:
>> Add 'struct pingroup' to represent pingroup and 'PINCTRL_GRP' macro for
>> inline use. Both are used to manage and represent larger number
>> of pingroups.
>
> Thanks! My comments below.
>
> ...
>
>> +/**
>> + * struct pingroups - provides information on pingroup
> Try `make W=1` against each of your patches from the series. Here is the kernel
> doc issue.

shall address your comments in my next revision, I tried 'make W=1' could not hit the 
kernel doc issue. Can you please elaborate a bit.

>> + * @name: a name for pingroup
>> + * @pins: an array of pins in the pingroup
>> + * @npins: number of pins in the pingroup
>> + */
>> +struct pingroup {
>> +	const char *name;
>> +	const unsigned int *pins;
>> +	unsigned int npins;
> size_t probably would be better.
>
>> +};
>> +
>> +/* Convenience macro to define a single named or anonymous pingroup */
>> +#define PINCTRL_GRP(_name, _pins, _npins)	\
> I think PINCTRL_PINGROUP would be more precise.
>
>> +((struct pingroup) {				\
> No need to have space before { and compound literal means that it's not a GCC
> expression, i.e. drop outer parentheses ().
>
>> +	.name = _name,				\
>> +	.pins = _pins,				\
>> +	.npins = _npins,			\
>> +})


yes, or else I will hit the checkpatch error as below

ERROR: Macros with complex values should be enclosed in parentheses

#36: FILE: include/linux/pinctrl/pinctrl.h:42:

+#define PINCTRL_GRP(_name, _pins, _npins)      \
+(struct pingroup){                             \
+       .name = _name,                          \
+       .pins = _pins,                          \
+       .npins = _npins,                        \
+}

Thanks,
Basavaraj

