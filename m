Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7597D6E9E18
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 23:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjDTVsi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 17:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjDTVsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 17:48:37 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B811FC3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 14:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y29Rby9+Sx2F2P8bzvAc9oMH7KBt+BVf+2bsPrTysSSJ3HHNYOv629odEmQ7CAY0mfwRaxt3x/ibb24T694vkcfNR9CaWsl5nYcXfW3PxV862fQVSh24QqP4yD9+RhMlioV07VRwa9b9TLUd/l/gFYxZEE/BOWppDcQ2hiNFX9WAeKKt/GU6WOfdPP+x6x6xC5abDR9U0/uUDMIeAau3GKP6vlr7cs1W0iFuqoSuV+owDVQbFWjmeDrbIiL9WNdPx3SHkg0Ge68GXR0oiq0jfCTHZgLpiFslMPEwYT3OV4mD+bpeCPvtWTmua0w2O3kq+53aOoyhjJu9jPOjKdG/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNOcH1AcprSYvqNtd+TJMfYU2MyiNemdOal5bv2oR20=;
 b=Q/YAzQq/BGkHAdWPkKEtgm4wsNE0HyOaGqOB0qPPIzGU/M5b8aT7GCVA32gHF9vBYOe8DSRXAwa8z9+YhZ2QE4sIDe8rQOUpXJRQOmPv29wvdAr6AKkdUZbrA/cAOT/uemhU1wyJM2JY4tJac8sA4UuD0UXOs0YWQ2sdVNZfVdoh/JAaRePSRbrJmZsikY8/x0knw/Q3Q/J71sBmfXngrEDIQfql/wcYQ7udV7f/dZSxwwemCew1vswXc0TJuK7YLIjCIeOCD8QRAb91og1akZakRMMmWY8fktHrdp0FtdYzZG2clPRk8xBojfq33rzTNx3lWw1s14qrnK6ungvT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNOcH1AcprSYvqNtd+TJMfYU2MyiNemdOal5bv2oR20=;
 b=m92rgBPTYWOThQo+gvArDigEyz1KzxkuPe8q0XaAe/WgkBXFxZjIaacbt81DXo+fcb37gqAeSSuHx19bJ0tzFKVEkmkWWKXQ7f+/CsHA38Sg3qEjlaifESkYI1VK4aWan4ctPTPq8lYEMhaDF8FFe89vXytqIsCLs7AjEHH/nHLUvIuQoMkyHh1zL/IF3Yo6H8wH+dbsqtFpgMjDzMEbwr5gXEDOGQKmA15D3iAv5kG9vaoMjIMcHI8xHh3ACFV5f2xbm9MRyCjJ2Nfn+3UIlyiDfcWu91/8SK1/6rI1SSK5R6sMvj1PTpSCP4ba7ORJslaF9BMxb8mlmhuXvKCwfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by PH0PR12MB8097.namprd12.prod.outlook.com (2603:10b6:510:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 21:48:34 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 21:48:34 +0000
Message-ID: <2e5cfd08-f879-7ead-d2d5-dfc97907f853@nvidia.com>
Date:   Thu, 20 Apr 2023 14:48:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
Content-Language: en-US
From:   Dipen Patel <dipenp@nvidia.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
References: <20230117084159.485234-1-linus.walleij@linaro.org>
 <dbf568ba-22a6-3936-6acd-3a6e3260d9fa@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <dbf568ba-22a6-3936-6acd-3a6e3260d9fa@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|PH0PR12MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf3d3cf-98bf-4cef-789b-08db41e8fd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjNT6R9CJXmDRLPYOBB3t3t+gkkZvmGtkBvZdbqCijMQ91hK7NKvxvemO76znoNvIHCyfWQ9udta/xeIYhRUCM+UVwXfY5Pnwo0sbRIXWxg5N+AE4vY0L1Hg5PwLBt/+VJF4ohwE0exaCWV88iUxJTBIap6HNFbBZC6Yii5egvy9AHKJTwjL3s+6iREu+iELT3dVlo/x9wRxhXi/R6sD2eO8qtxwM0TOeMeusPPqP11lT1L7trJP69jJXS9SE2GShl206tCIIt4BZL/WFH3mE+isV3MElDzdufF6bBVZdN+U0FDdrxuu8bC5FsVN5WD1dK5YwzfNzFDqcIliF7/+sQWo0m8PSUW9hjnx1WG8xUzB2vSyOnM+lIbNczjBJnCE5ofh4/3o+aCgR48kqwodWAlG66qsIy19AvNa8rx4o2wTZxfdyBF3bhsbOFNRsiQG03ug281iAiFAFMqmZXnSIvSc2kU3o5IJHCeaID4wRlFCltvT5anJaUCYrX6UWEC+fdVWT90i00v+O5hKJ5ecuMEYVdEoMeRQkv7Kc4r0boJBfYFmVElBAhswWndZp8nrrGj4k/G+atrhM5AY16NWl1qcRNbyH0NfJkfzJCs5c3xE95TAosuSZqDpxx+llwLiLPjF22plKCkl6dLBUI4nnqeArUndUMTd9DAteR8SAiXlFRUclb/eoyuJmwkQpDpX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(2906002)(4744005)(2616005)(478600001)(6666004)(86362001)(53546011)(31696002)(26005)(6506007)(6512007)(966005)(6486002)(36756003)(186003)(41300700001)(8936002)(8676002)(38100700002)(31686004)(4326008)(66556008)(66476007)(83380400001)(66946007)(6916009)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWJ1QjFOOTRJTE9sMWp6THhyeXBXeFYxdGZsR0d3bXdqRTQxNjRGUytZYkc5?=
 =?utf-8?B?MzVPbjAyOTlkejF4S1BEWXp3UGdRNlR5aUJZc2hBYTVqQzVma2Y0VFg4L3di?=
 =?utf-8?B?bTJlakg2c1ZCQk1obzJPR3BHOEJWUE1jQ1pSTXNCa3FpbXR3T0ZHQjh0d0pZ?=
 =?utf-8?B?VUIrODJDQXVEMlFBOGJEUXpGaWJBNDU0K2xSUVBXdHZocitYWHFxdDgrRFJa?=
 =?utf-8?B?TUJ2a0xYaHozV1VNZHAxRHR0TDVCeXg4RVdXT2VDUG1HNUdqMEZHSjNna1FT?=
 =?utf-8?B?TnVNRkZ6SVVBSi8xQ3RwYS9YNmRmQUEwR3g2ck5qUjRwSVJDdGhUaFVZWUp3?=
 =?utf-8?B?TnU0bXI5MkZFSUxmemlVcGwzZ01COGxFRGxmbnI1dkJXWDZpWFE4NXZ1NWRE?=
 =?utf-8?B?TzVybW9QKyt4VVpIODFkZWRLTktscVhRM3FuNElJbStDODFDdUdscnJBLzNN?=
 =?utf-8?B?NDZEUGcxdTFZaGRVZU5BUm9zRzVjaFppc296cTc3cCsyb1IxdDRjTUJyclJh?=
 =?utf-8?B?QllkME5VdFpZa2NKRkU2WFF6RVk5anRmcjh6UjlXVWZNLys0alptZ0M5SGkr?=
 =?utf-8?B?Y2k2YjhITjJ6YVRVVXNkd0tHSG8ydjFPVmNpSTlCOE5QdTVoQmEydmJTS1ph?=
 =?utf-8?B?WHhLaVM5c0hyV3VCQ28veHBFbnZsbGJ0UkFFZ3EvQVc4VHFVWTdYcG40WCtn?=
 =?utf-8?B?QS9ITEtscit3TDZxc3RBZWkxTUU3Y3V3NzRyZ0JWa3Zqek40bm56akdpV255?=
 =?utf-8?B?UUpwNkxWSEF5MkpSMzlSNldOMk1tWGpDbE9QSGt2NURPMko2OVFlYnUydS82?=
 =?utf-8?B?TWo0SmQ3SDgvSGttWXlYM0c4OHIvUWhaTUdwU1lzc2Zmak9PcmFHTjBTUzBE?=
 =?utf-8?B?V3BKYUZmeTZoendVNVU3Tis2YzkwOWhDM1MzbXVqSWJlMTYzdGJZS1BMSjZQ?=
 =?utf-8?B?UUdnYS9UUDdhVE1RNyszYm1qMUd6SkhNNHB0TmF1UDZjbmplTlhrYXJqS0xW?=
 =?utf-8?B?Z2tsU1BMVXNUbFVaVjdweG5YWkRGYjZmUzVmYkRGL1pyY3JTTnZjRkZDclFm?=
 =?utf-8?B?QmNDSEtSRHVxSmloVkVuM1lESy9MWkdKdGVhZ0F5d0dhUnVkdGpWZzVsTkQ2?=
 =?utf-8?B?QnVhWVRGdUpTSkRwWlhXakJXamlWQkRuc2tHTU1ibXFxcVhjUE9INVYxbmpa?=
 =?utf-8?B?Z0p1OU5JTkRRVjRtWWU5ekpGNzh3RThJR2Z0MC9jMWZxNFlMVUVjT1JRZmg2?=
 =?utf-8?B?amhYOWlqNmZBWDNtZ3BNazNLTWVqQXk2WjJRSnpEcmZuOGNIMHNVYW03MXpV?=
 =?utf-8?B?c094SmpwSnJNNDQvQjlRY2NPRFBsVFY1L1JHekRYWEllY1BlNWpQL0hJTUJz?=
 =?utf-8?B?OTlFa0JRbEM1Y1Z6ZDBsWGI5U3h2L2FGMVBHNGUzRWlLSjZIeXQwbVd5aXJC?=
 =?utf-8?B?NmZSZ1ZpRENMcHZtQlhlSElqdnEzNUZoSzNlcTREdGRnYzR4S3N5a3NpTnho?=
 =?utf-8?B?OTl6K08ySGR0aTdBYlIwQXNBY3drM1hWRURxRXp6WWJDVVNRSmtOUXV1aERC?=
 =?utf-8?B?UmNMTXhEdXR0MERqU3IyT1BTRTVUNWk1VFNVQkt4NUJBaW5FZWdWK0xxR2dy?=
 =?utf-8?B?WC9OaHEycUhkcUI4T29sYlNhckNFUGFkdFBZWTFjeFdLWlg4c1R0cnBaNzFj?=
 =?utf-8?B?UERHM1VFV0ZZeDQ0dm9vdmN0UTJSRDk4eDd5K0NPZlY3TkxpOURHU3ljd25U?=
 =?utf-8?B?UHpGMmF6bGhRdDN4VG1IS1BvWWRaZTVJdnhQZW5sYjcwRzFRdXV6a1dVWitz?=
 =?utf-8?B?dEo3aGoxUDlob2hCcTRySDEyaEhyU1loRDdJQ3BFZEFwWUI2M0RqMUdyYVlh?=
 =?utf-8?B?UVFFYXpvVGw2NHFwbkkrdEw4RXJlWGxkYmdSOHpYZDRtL0dpZFBqNTZPVTJv?=
 =?utf-8?B?VmRwY0JIRVpNMGxXMC9QeTVJTXozNHVYbjlDV0FvaTFrWU9FM3BRWldyUU9U?=
 =?utf-8?B?NkhVaVM1UnQ0eFp0R0dUbWRYTW5jLzEzb25PVU1TaUFQYnBTTURISzYyWE1M?=
 =?utf-8?B?bVIwVEFmZWNlQlRuSmhLUllhUVRFbUtsdXhTakVZMHF5RHpCY2lrc29yblRW?=
 =?utf-8?Q?+hnKZ58dewBmBVF5I0IGOXrVL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf3d3cf-98bf-4cef-789b-08db41e8fd13
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:48:33.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ1bvBb/+eyTSuJYL/VVaolOmnYULINVafCk74TlXMkS0zwlNoqfXr4QL3S1TG00R9GEWrCd9UbwWIZlSYb7gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8097
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

On 4/20/23 2:22 PM, Dipen Patel wrote:
> On 1/17/23 12:41 AM, Linus Walleij wrote:
>> The test driver uses the gpiod consumer API so include the right
>> <linux/gpio/consumer.h> header. This may cause a problem with
>> struct of_device_id being implcitly pulled in by the legacy
>> header <linux/gpio.h> so include <linux/mod_devicetable.h>
>> explicitly as well.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> I will push this patch to HTE subsystem tree...
> 
> Acked-by: Dipen Patel <dipenp@nvidia.com>
> 
Sorry for spamming your inbox, it seems https://patchwork.kernel.org/project/linux-media/patch/20230208173343.37582-4-andriy.shevchenko@linux.intel.com/
is the latest version of the patch and its been there since Feb 2023. Do you want me to push that patch through HTE sub tree?
