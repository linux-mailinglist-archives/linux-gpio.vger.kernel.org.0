Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0760B5328B7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 13:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbiEXLSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 07:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbiEXLSW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 07:18:22 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893A15FF3
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 04:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOmeCeXcdMZqOiEidiaiP/HQ1eAfTNbE+bOsQhyMhOtWKvta/UYGoNOHgeUHaFt9DaiUtGswjYi0T7UMzNXH9OKh716olMEWDRXouELbQBV+frTGu24pwTKOKam5NEyejZotsdF+J74i5EurQHEMMmyGVTwa3xpWbqVYZKGIPEDwk14mdZeqEX2+FOEQ+D58eTTL/mhha9K34Nk7rgJHvQmMExUvgHs/TtXYftqkNpihYicM+WK/8QA6PMkJ469xdOdQNG8yz3A7n24pVSpYukASaoznoGlVz4X0Zo93BpvDi5RGzf3uiuQnGPRL980JTVA5qK/sS6pOei+8Frbxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDCLFL+H3yHGNdja0IQ0nZ4RP14cdv2fzPTDg6ZJ2Zw=;
 b=SxurdTeOaioDnS95Zrazzf/IbJU2jYVCibeP3gOZ2BNKzpk+EkeLPGUkaXowUCPq6axwxAfICHQMZTWeLZnmGGElqUd0JDWUBITeN1k2FvYAVeZqZHbOU8ouWw4P+J7twAI3k7QRjlps6Xw6LeLKxOovXLSItFvpKioYzpbxqBhrZw3Wi3VJrkUleFJODvGsYZDjDtQSKDMs7ftxeRmjoZNpg9SZGFjUDxaDK88LeoL18ZGvl+rbXkcuBT8WCheJkFd3PEArAQBChhbbI7VyHBZf18qsJrVFM9adwEUsKcvc7aXoNmLvUYwrJsvIu+GduXHX5KOl1RfeIN5+xp3v2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDCLFL+H3yHGNdja0IQ0nZ4RP14cdv2fzPTDg6ZJ2Zw=;
 b=apbP6KfKvdWCO3g7QjRX3BZj63OwENyLahMGae0XteH0SiUOqOyK/Hwm8ZmNluzwAo2S6VsvMoqe4Qf9J3j9tw3bIWtEg3cpNhsr7SbbehHiymqNJq0JALYQq/LPJ3ZlIpumuESm26Gzf6UMazLB2pHUMquJIxLa1TP/9qeKCAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MWHPR1201MB0143.namprd12.prod.outlook.com (2603:10b6:301:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 11:18:13 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::b3:bdef:2db6:d64e%8]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 11:18:13 +0000
Message-ID: <e35efb44-6e74-690c-91b6-c8270f624894@amd.com>
Date:   Tue, 24 May 2022 16:48:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] pinctrl: amd: Get and update IOMUX details
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com>
 <20220524074007.2792445-3-Basavaraj.Natikar@amd.com>
 <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <CACRpkdZ267_CjNoro4A+eBASjz=qCL4ixLnbsac5U+gCsBSGwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1e0861-4af6-4899-fa5d-08da3d7717a0
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0143:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0143AC4C321ADEC7FA04160DE6D79@MWHPR1201MB0143.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoU3c1zigcrNe+gXHnhLfj/az+Oo40k59fltwVRdw50MVpk1TieXMAvQ+XKgy3FTOe8WUXJyls/HWM+AjJqvcElXH8iUfPvt1Z1DPsWzI+BTanwPiGOSRfrvaXFbIhXA4+yGfUBejz8YOrXM7ZrjY8c4xZyowjoonHa2Q2p+uN7kBYE5sOHgYNZiGNOyKMICHXp5cqJuLuw0dd19wYArWu1y1S5pejy7VB1tnYCxTjFGHzWCnn2zCpnuuhDCV9KcJr70IsBPlM1/cumXo8/K+myDk0K6+EByvenGX5EA1g0Jdn5BfV9HYSwASGvcMiOxrlDhrhz3/l1cQ9YHd73FBwCg0nGo4Vw5NQePgNTQluvIV06k3a3y0y9ZSUFnP8g9PuCcXR7HIbddXSCjo6YL9xvkF4pUNBBKpwo13y7GkG0gSWgPlA14t9JEj06CWQPtaQ0jW1/MhGzLn2GNk8AG53ajdCn3jHXf2haPobMiXyQCcKxQCh80P6T+HRfCHqzsWaAnot4pN7kfM5mkFNqKhmla9oog3mYqZwOoXZ54Zfsweh1P5o7LF6gZ/MfSititUbilcrjDR15xPg+UWU9tzoUTi/Z7zczIr9gFEqbN13t9Klu9mAEsgFvTJZBNMoB/79B0T9yAqaEmpCxZ+qLfsA97RaBBetkQzJm3pv1Qiru/YtQQURZvlvObczXF/WIvTaSXBGR3GZ+jKGU8EBcrwJ4yJ8zPc2l0TpYdiNd7I0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6486002)(6512007)(26005)(2616005)(186003)(31686004)(31696002)(36756003)(6666004)(8936002)(5660300002)(4744005)(2906002)(38100700002)(316002)(110136005)(83380400001)(6506007)(4326008)(66946007)(66556008)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBHbnRIYVRJSG1QcFZXUDRpSVM0elpUaXNpTGZTTVZTOHN4TFR1WXhCeXlq?=
 =?utf-8?B?WGJZUGQ0YUl1S2dVc3ROTmd3ZHJqOExOeEQxbDl4TzEyRE9yUm9YeGhKdGhx?=
 =?utf-8?B?RmJVSkg2MUY3Wllqc3ZsVWJibFRWRHFRellSNGtzTjZVbzlpVS94MzBZSW9y?=
 =?utf-8?B?ZEFUWTJ6VGtoN2VGc0h1Um9lYVFlbzRCOUZ5RXk2dmZEL05xbG1UWGkzeVg4?=
 =?utf-8?B?eCtjK0NxTGpibDFleEJ4Um5iaUVOS2oxZjA4eEQzMlFGM3lMT2REZzVUYk4r?=
 =?utf-8?B?c2hrZ1NITjVtQ291NnVCcGYzL3V6UExBeEU4dDRLLzlCOWExZzROUjhZWnNv?=
 =?utf-8?B?cnNuZnovT3BvMk9qcHByVnFmYklFMmJ4enpjWWN5QmRRNFJSVUJHN2lJbWVC?=
 =?utf-8?B?ZjdzLzA3dHVndG5aL0c3T1EyN3BKS0dCRlBDRXpFZ0tMVENsaUFkNTlWeUNV?=
 =?utf-8?B?NjZyVnpra3dQMVI0bmhQc0FSd1VSTUFBYWl4aE1GT2xjQ3pIRmo0Ni9MMDJO?=
 =?utf-8?B?Y0JGN013K3ZSZDY1U3lTbjNTeHQzVmUyMnFSZURwUEJiNTNnV2Y3WkZUVnNV?=
 =?utf-8?B?QTZSdkloVzVTTHlGcjk2OVJIVkFKNE95RGtxOC9GOEZsNWcvcjFlWGlOZ3dQ?=
 =?utf-8?B?amUvRlhaSFc1QVBKbG1DUFVBMytLSTBVUmVGakZuSlZuNEV6WVZNTXk2b3Js?=
 =?utf-8?B?VXZGaHloK1dNKyswSGFlOUE4WWF1YnEza1pUNDVjWkszODJsZWwzc2VKWWVu?=
 =?utf-8?B?QUlhQkFMeVFYM1grNEVtMVBXcG1uMTBUWEpvcVFsVEtRbEZBTkNudE0vbWRz?=
 =?utf-8?B?SStWTVJaY1NzNWMwd0JIUVVRSUh2aHpwOWFpdkt5Z052ZGJIZVVlaTk0czhJ?=
 =?utf-8?B?Ykt1K3RSOEJzTW56WVp3MDdMZXJYMEpMRG1iL1VWZUtQVlFPa0VERFVLVWsx?=
 =?utf-8?B?TFNxYjZyNXFpVnhkYUxGWU5KZ1ZiK0ZMWTY1QWUzcDRwbWpqU1B0dW5SQllZ?=
 =?utf-8?B?dC9UNkJyTXJTWlVnZlY2V2dhOFQrNUpTYWpnV29WcGZYT0JTZnpyVVV4WU1x?=
 =?utf-8?B?MWRsRHd4cmUwR1dtOWJUdTJjTHcvM3ZINHZ5b3dlOWRGbHRKcitvOUJUU1ZN?=
 =?utf-8?B?S2tEa0JHS2FEK0l5dVB4amJvbm9JZmxSbHRXaUJ6S3RyODdKb0libG91L0sw?=
 =?utf-8?B?aUhmNElMNWlPbjdzeGFOL0M2WUwzeFpMOHVWU2lySDVMaHdiTXc2VkpqR2tP?=
 =?utf-8?B?Wjk0eXk1eHZMM3pVRFJYcFZTVTFPcU9NQm9BWE1NQnJxU0FkbkVwUW0xbWZI?=
 =?utf-8?B?d3d5UHJTU1NqaU9PRVp3Q09OY3JKQzIzdEcxQkxBMFg3bXhrRGt2YzR2Skgz?=
 =?utf-8?B?R2tXQkdjVmJpNXFjaXIrQmV3L1JUUEtDcXU5blVzR25ub2Vhelp6LzVYN0pp?=
 =?utf-8?B?VUhEREI0OXdUSml6ME85cGV0QXR1anNhSVJDOTlmbExEZlhwd3FTdFc5MlNO?=
 =?utf-8?B?dWRQSlN3TDhudmFGVEUxMFFudXVtMzhaYnVoSUhPTmJQNGhTb3VWa0xYeHY3?=
 =?utf-8?B?N2ZjQUNPUkZnRGwzYkp6Y0xxcUM4Tkp6N2ZTZTBxc3JxZVlraTV4U0FMdlRo?=
 =?utf-8?B?UWpUaHhkWXlIQW1tc3J0MDdlYjM2L3ZhMC9Bdmd5bEMwaGxFd3d5UGZzclhQ?=
 =?utf-8?B?STYxaStxQTF4M2l2d1RpMUgxTnpmNlM5OHZxZDFUb1ZmcHhsSURySWlXNks0?=
 =?utf-8?B?bFZ1bVlhNGZORnRvZFovOTErS0VjOHFOWnFDeDZsa0RmV2NZZFpENTFhNkda?=
 =?utf-8?B?ak5NR3FBSWJjTzdSRjdEOW5jN1luNlFWaERkQ0NxM1U1eXhhZlJXTVFWVVcz?=
 =?utf-8?B?RkhTU1ZmY3gxWmsxRllGbDZWc3Nhc203SVc0RkI0SDVTQlZkSTgyR2pjTHlN?=
 =?utf-8?B?R284TkRYdzZQMFhFa2VZUzNTdTJiZjJsUWxlTytFTC9saVZQbTV1R1RyQWhk?=
 =?utf-8?B?ZjZJcWp1ejRzM1BoeUFzMStDVjBLdnhlcnZYYkZDaDBLYUV4d280U3d0cVZa?=
 =?utf-8?B?TEJJQ2lKcWNHRks4VnBHTVZaMktrNkxLUEVQVzlLS1B2c2R4MVRnRENSMXpq?=
 =?utf-8?B?RmtJRUt6ajJqNGdVazB2M0JBMXkrb055MXQ3eXU3Tit1OEE4ckhINEdVWTF2?=
 =?utf-8?B?MVdGc3EraXMrVGpKUnZ4QWFERjBOUThibUNBYTlOei81enV5N00wd0VReC8z?=
 =?utf-8?B?ZlI3YXlCTjVoTk44Tk45MWxGamFTVitLZHBQMUJlOGxwMGFCQWl0UWdaRWMy?=
 =?utf-8?B?N2MzOEhCWjBUaHY4aUYwV3dvZDlzeE1sZi9nakx0aFpLRHNzd0gwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1e0861-4af6-4899-fa5d-08da3d7717a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 11:18:13.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qz2dPPPOb+SPy5Z7Ct3NK2/ikn2S8iZUecejim6vIGZnA0Zk+RQ4keNsOsifsLnfBfp+rq7wohfakWPGokWUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0143
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


>> +
>> +       status = acpi_walk_namespace(ACPI_TYPE_REGION, sys_bus_handle, ACPI_UINT32_MAX,
>> +                                    acpi_get_iomux_region, NULL, gpio_dev, NULL);
>> +
>> +       if (ACPI_FAILURE(status)) {
>> +               dev_err(&gpio_dev->pdev->dev, "Failed to get acpi_get_iomux_region\n");
>> +               return;
>> +       }
>> +}
> Oh this looks scary to me, make sure you get the review from the GPIO
> ACPI experts, Andy Shevchenko and/or Mika Westerberg. (Added on the
> To: line)

Thanks Linus for the feedback.

Hi Andy/Mika,

Please provide your suggestions for this patch.

Thanks,
Basavaraj

>
> Yours,
> Linus Walleij

