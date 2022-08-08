Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8A258C866
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 14:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbiHHMdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 08:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbiHHMdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 08:33:13 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B80654A
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 05:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3QK17NFjnchOXTyc7Nc6+GWvcUTMKEMfZEZSxCTu/rPVbrGIXanZecwZcLcChKYBECWW8Z5ssrUuTiP6/I1R7VD/jw2pLOSsf6i9h5SCm3HplGQSdxnN4fiRh0isqwwbx9N5wo78ps3Jiaatj2kcrPJULf4sI5bZF1AGpaOs2O6Y1HOcM9uQP+vkggeb0fRyL9NPN0XQZ4sHKKa0HPGsHs6YZY9J4a34zKq6/kaZ1NLTg2TcRlrr+V56kUZo1mJB9IYuSA79BL5K8APGDlhp6/SAE9I/JgZLN6IWI+vBgclKtf3Qb0D3SYmt7chlvfWH9vdI1CsNd9A+t3+ZRO2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwmNw1MenHD9v4iRqNr5W8JJ4/qASW7T1Ei2Ii2Cqfo=;
 b=IFAepR4m2A1YmAmn8G1Lb5h/eF2zK4WdhCuQX7B9DHrBIozzT6Ujuw//53BQE3ier8/1bip80IiPhSdipwQ8hj74LiQhdb0pudWIWn/hOBwuA7pM8UYH1+Q9B+ElNn3+GY3T9IohGth7uYPvXResp2W4KjpkYA1gSsU2xGVgx6JHs55mxfPHJgzfl+awPx6MlGCbmssfFCSgxTITYzokl+GRrUb7Z8F3TpFmgKlj78OojkJ5MBx7WiJOc8Njl14MvE0NlHuSH84gAj/lEfHAvTDiktG4aW6i99a2o0hw5Kkh4aNENJKUV7Yxmsjabz1YuG7SP2GUO9GzgaIpy/5o2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwmNw1MenHD9v4iRqNr5W8JJ4/qASW7T1Ei2Ii2Cqfo=;
 b=DUnG7zvp6+7FTc0x/nts3m+mVwgYtxCga/AEUG44W0K9DSjYXY1FFdG5VLOjVUX95Kdom74rVvyXVRVqbKWqJJLMDw0WeNIe4MCO3c8x3JtMsR7fT2i1OkViqQ1jQJnXcP3STbUNwIywdQv7eJcTTpamnh9CFpcCEw9HEWuADF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4581.namprd12.prod.outlook.com (2603:10b6:208:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:33:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67%3]) with mapi id 15.20.5504.018; Mon, 8 Aug 2022
 12:33:09 +0000
Message-ID: <e835f5d7-6463-48d2-ac6b-8bf92f4047bc@amd.com>
Date:   Mon, 8 Aug 2022 07:33:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [bug report] pinctrl: amd: Use unicode for debugfs output
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-gpio@vger.kernel.org
References: <YvDlZaydFKN5loe/@kili>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <YvDlZaydFKN5loe/@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR16CA0071.namprd16.prod.outlook.com
 (2603:10b6:805:ca::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9516094a-e7b6-4d63-a21c-08da793a269e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4581:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUPdftC/3+9mXOLHXfrZGzMHYInx+8SjmdEOEtIg6i8/0TCeJTFm9U7fS+JPZmmfnAC2H2GNS9Vk828PW4NEyh4uqR01jrWcSseU+Bwl0S6CQCOs6gz7AAGjAWrMHwzqQSUJy5ZtEW+n7k4PivYlHhi+Qzt2rGFhrAmv68Lb2FrIQHyO+XtHJj9hBoSFAxGKFz3mnBksoZ0a8SjBxDFsSo0jKfBx+a8zJ/gNTGiEqPHwrMl4myzJhqDkyDvixmGRdfZsByXj9QSpwNvLm2T9GXYTGtUUDI1rqy9ByEypK742QqzxYA9NEWZ+ud0b5V6o2EqnnwDwdRVdsyXVsNvLivuAOaEthx7iZN/EifaQfdYPD/c/KFPOVOEYJPqPgbCR0Ul7X+/ImlLhUjBLClkEosl8xN1CT9sDshuB8m/TWawoZP6ok2tPXoOUmgJDOFouLZ1q5+qPZ/laRo34Ruq03Qgu8G6e2Xd3jF6A7q3EohrPDPomakD0ZIrNlBKTOrxWJ4qzmdTuwRJvBEGrQUk7X85jU6+7SZydznFi8SFhLnACmRFBblbn3ZKW4srPu7hOWeChbB7BbbeOfWvZ/yScTsiTT4Py8Gt0wxU5q2ty/340nUEKQMmiuS6+or9CuBTntHwyrs5MbPxXnzFL7jeAYguNbvR4sfdCwmrKbP3u63QIYw+tPpcY+LBMxJnTnGJ0Nf2v/SLGzrX+gMIlXDcYpTq+iqv9eTMbDJ3jPyd/Bp4Uq5ERB9UmYRlgyIw8S094yOQHrQuE91vQ+trWBs5CPYS2FHBJPI2j02KKFX09tOQc7Iiy7XlSdoGp+mOAalvnX6WDpQd8GeFyY4+oKvmKiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(6506007)(83380400001)(53546011)(41300700001)(8676002)(66476007)(66946007)(4326008)(66556008)(316002)(186003)(2616005)(6916009)(26005)(6512007)(86362001)(36756003)(2906002)(38100700002)(8936002)(478600001)(31696002)(6486002)(44832011)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9QQ2N6a2R5NEMzNkQyUGJXYkdSbHRON0h1VWs4dzJVZHFvZWtCTlZXakNT?=
 =?utf-8?B?OUFVK05WODVhYzFXQTdzZnZwQnRxckx5YUNSbnU1L1krNUI4b3RWaitlMHR6?=
 =?utf-8?B?b2x3R2VZNThBYkFMWnY3RHhJeXhOYkZkZzc3TXhGN3U4NlFrTVFwbDFxYmJj?=
 =?utf-8?B?bGJkK0FLei9xdnV6YkNaUnVkZElzNms5ZzV2RVFjbWN5SE95bDdWWllxNnp0?=
 =?utf-8?B?QjJtdUVWcHlwQnBWTUZucjdjUy9Qak5STVFiUVRpbUY0VHBmQVJqTjlsdDRL?=
 =?utf-8?B?VzRVTmpJelBhVStNV0JqTnlpOGtMdFRBajFWaVBOWXA1VksrZ0Z0TVJ2Ulkv?=
 =?utf-8?B?TVJ2d0o2YTBrOFo4em5sVk9Xa2w5a2UxZm9XdlBKbmcwbHFPNVZlN0FlQjUw?=
 =?utf-8?B?QkFQUlduTnlwU1BRMjRWMTBuRE82YzRUYU1uaVVrSUNYcmR4Ny9nWEFURGgw?=
 =?utf-8?B?Um1WbWJLbC9OSDJIWkQyRTR4NmhsV0VFNTVWMUZlR3R2c3REOVp0K3JPcTc5?=
 =?utf-8?B?alRWQUZ3UjZHRUZuclBqMktJZkFIbFJjeUFtQXhTdnlCSmpCSVVheDhnQklZ?=
 =?utf-8?B?RmU1eElSRDYxWWJMQ1lZZVl3K1VrSzRKQmpyNHo0TkFmMnd4aVBMMlN5N1Fz?=
 =?utf-8?B?T0Z4TUV0MG1lMHg2c2h3ZlhaVFVpNEE0dkYwWWR4TEpEKy9NTnBSS2NqY2lV?=
 =?utf-8?B?L3hzQUJtWTkwVjcvS241ajdLemQxYngxNWNobE1yZzFncWVuMkhyUDZiVXpD?=
 =?utf-8?B?QVdaVVZQWHlzTndjb2FRaDhPRDJjZkRKWTFuQ3gxMHVReGNUZlZJc25ia2ZK?=
 =?utf-8?B?RXBxQk5iV0dUM0VsVHVPczBVaTlsbUZ6UWszdGV2UUo3VThQUStFRDc3eGdE?=
 =?utf-8?B?NWNRa3JZK3VvZUtnbml3TDFMbnlPMGdxYjN4QndsRHF0WE5SNXp0MzNJYXJq?=
 =?utf-8?B?TkhXd3FZMkJPYWRGY0JnUm1kVStrc2Y0TWhwY1NFZGsxa3lpUHIzeXd3NHZM?=
 =?utf-8?B?OWtONnZFbDhTNWpYcTQ2S0FVYm9wT3BZM3RpNFhrWmVXellBQitLRk45Tk1a?=
 =?utf-8?B?UjYrbzdocmR1ZzZqYkhHbXltMUkwT3M5bUxlSFNFb1FVRENWVUpsTkMxdUNE?=
 =?utf-8?B?NEFkSkhNUDNGNE9rYjNMMVJremZZUjE5anZBN0pMVnZIRlBjM3BWdEtuSkVO?=
 =?utf-8?B?ck5mL01lM2tCT3hCKzJsOXJDVjB2WFY3SEF0OGF6RDAzZkRFS0RROS92TURn?=
 =?utf-8?B?OHB0SUJxRHo1eFlzS0IxY0xQWExhWU5qQ3NhcUZieFVSRmtWZmtIQkFreXJa?=
 =?utf-8?B?N0JZZ1Z4d00zVHU3Z3ZJQWI1bk51YmRwZ3FHQVZOMWF5ZzFZSEFuenNxVHk2?=
 =?utf-8?B?alo1RGI2S3R2Q29ZK29wdGRJL3lFQnBBSm5TMjhRUXpFODdSRStRT3FpWENx?=
 =?utf-8?B?VTZQakc2YXFHcmg4Q2ErRzNYUEpkS1RkVnZiK1dvVVNoY1IwSGVJM0RmS0xJ?=
 =?utf-8?B?SEVPemtYT3hLT3A4UEJEZlVSQUNiMTVNNE11SFkvc0lVMTJHQ3ZjQkxEaGVI?=
 =?utf-8?B?b21VUUQ5M0Q4bTFubnJ2T3B6YzcvSTRaclZXT3p4VWJ1S0FPVWhmbCszMEpo?=
 =?utf-8?B?Y1g3REVRWFljZU0rSzJlVWNzckJYRHFGMjZia0lLc1dESUEyYllBVS9hak04?=
 =?utf-8?B?NCt2ZVdQdDVjNTkvakhYYkpucFU0K1JMdzVjNDNkMFNaaFFxM1FJZ0xGdjFS?=
 =?utf-8?B?TnJ1STRQS0VWcUJMUkxpRlc1TVZPcTczTGEyZVVVc0VMaG9oMWZDZkIrc2ZO?=
 =?utf-8?B?MDRDNExqN0VJQWFZNHhseW9lZUlmOU5paEpRTmI3bHNoZVZXZlZoMjJCQlRn?=
 =?utf-8?B?cmtwWmM2dm53L0xpRXdUMzZUOEx5QjNhcDVvVmlOVmtaRHp2Yk1vSXh5YWRn?=
 =?utf-8?B?TC94UmRPSjJmbzlWMnk3OUIrREp6Um5SMFRqTWdtUTAxRnd5ZVZRVnFSamVx?=
 =?utf-8?B?Mkp0eGM2MFFsdzdCRmdOZlhnNEV0MmNFeTlyN0RSUDB0SldEZ2l2OEsrbGhJ?=
 =?utf-8?B?emdLWTQ2NzdUQVdsdUk3SkV1TjV4bnFzUmVGKzRCNW1OOEU0cjFneEFTRG5O?=
 =?utf-8?Q?oM8xOO/kQVW0Yrub07sTuAfKd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9516094a-e7b6-4d63-a21c-08da793a269e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:33:09.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwPHxBmQ2W0kK7y0fI865FD2eV1trP02+OiXqBECP2GdXTRSgGewVQgMWg0bK0o1h/ZMro+pc3Sm/hkVqC02lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4581
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 8/8/22 05:28, Dan Carpenter wrote:
> Hello Mario Limonciello,
> 
> The patch e8129a076a50: "pinctrl: amd: Use unicode for debugfs
> output" from Jul 22, 2022, leads to the following Smatch static
> checker warning:
> 
> drivers/pinctrl/pinctrl-amd.c:249 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8c'
> drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x8e'
> drivers/pinctrl/pinctrl-amd.c:294 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> drivers/pinctrl/pinctrl-amd.c:300 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> drivers/pinctrl/pinctrl-amd.c:306 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x85'
> drivers/pinctrl/pinctrl-amd.c:320 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x86'
> drivers/pinctrl/pinctrl-amd.c:326 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xe2'
> 
> I didn't add this Smatch check and I don't know the rules for this so
> when someone adds something that basically looks sane, I don't report
> it.
> 

All of those are expected to me.  If there are rules against this type 
of change then we should (unfortunately) revert that patch and the 
follow on patch that fixed an unused variable.

> 
> drivers/pinctrl/pinctrl-amd.c
>      247                 seq_printf(s, "GPIO bank%d\n", bank);
>      248                 for (; i < pin_num; i++) {
>      249                         seq_printf(s, "📌%d\t", i);
>                                                 ^
> In Gnome this looks like a thumbtack.

Right, it's replacing "Pin".

> 
> ...
> 
>      279
>      280                         if (pin_reg & BIT(INTERRUPT_MASK_OFF))
>      281                                 interrupt_mask = "-";
>      282                         else
>      283                                 interrupt_mask = "+";
>      284                         seq_printf(s, "int %s (🎭 %s)| active-%s| %s-🔫| ",
> 
> Gnome emojis seem difficult to read.  Theatre masks and a water gun?

"Mask" and "Trigger"

> 
>      285                                    interrupt_enable,
>      286                                    interrupt_mask,
>      287                                    active_level,
> --> 288                                    level_trig);
>      289
>      290                         if (pin_reg & BIT(WAKE_CNTRL_OFF_S0I3))
>      291                                 wake_cntrl0 = "+";
>      292                         else
>      293                                 wake_cntrl0 = "∅";
>      294                         seq_printf(s, "S0i3 🌅 %s| ", wake_cntrl0);
> 
> 
> Sunrise emoji?

"S0i3 Wakeup"

> 
> ...
> 
>      369                         snprintf(debounce_value, sizeof(debounce_value), "%u", time * unit);
>      370                         seq_printf(s, "debounce %s (⏰ %sus)| ", debounce_enable, debounce_value);
> 
> Alarm clock.

"Debounce time"

> 
>      371                         seq_printf(s, " 0x%x\n", pin_reg);
>      372                 }
>      373         }
>      374 }
> 
> regards,
> dan carpenter

Yeah all of those emoji are the ones I intended.  Details above.  The 
point of this patch was to shrink the length of the line in debugfs 
output into something more manageable that it didn't need to be imported 
into a CSV processor to look at the data.  It can be used with something 
like "less" now.

If you (or anyone else) has a better proposal for any of those symbols 
I'm happy to make a change.  My goal remains to keep the lines ultra 
short though.
