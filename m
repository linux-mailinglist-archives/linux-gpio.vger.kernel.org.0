Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B937230934D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 10:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhA3JY1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 04:24:27 -0500
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com ([40.107.223.56]:10465
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233622AbhA3Drv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Jan 2021 22:47:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8gYikmxuo6NFDlp00ekDK67AFhffC+JbSDgqhtaRseTJl+bU7lxT97EW+42U/kVLvO/bPnEH2STKrU1SyMV7ChRY0vKBKK0lxYXI6rNKnrptmnP+t6RIkFlT1CGURPolW0jcD883lcANIRn3tJbirQrpfqWxzYVFg0HzA1NnfcnDbYUum5ye9Zb1ngCa2gpclFkGO4rCPqHVF25oAQfuRkXDYqklwlv2rIANeslAh9reyFZPUMazA7wFTrw+FxTDS7vsokkFUAHEPBfJL/9ObPZw2WKiBdOj98Y/ssx0mrTw16QbVnwFhcmjrHLtSCVLLiGQ9BKS4arbS37OFzawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onBo8R6Wf0pru9pZNrHE3IYj+fl3hcH4xm9OSjmYn2s=;
 b=RvJghu90bNFyhdh2/tR6EDGElxHIkzALXnBg3Qui+hluRr0MNYQnkhQpFXb/HfHfJPH0okBTfTa8p62+9Le7aiwDOCCDdy+LcQ5Dx7cQSPOjkpak0W9kpx/Grjvww5eQZ8PnnCyPO+7Ypty8s+fF6b64eT2E11GgEeN1TsMGFiPoSJ/hX8xQ+fydeSwJUE2VsQ4wGyebNhzEqEJIgo7gshIbNlEA44f63qufwPSGXOwqvSVruwqVsocKx/CsBSXuCIzX0VQrGitUiRlTlsxSR06wLncd9wlI8iSPsm+nX4xbJRg/yEEPK3oW13+32oSFAqjNmGvjheJyHWUFSyPDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onBo8R6Wf0pru9pZNrHE3IYj+fl3hcH4xm9OSjmYn2s=;
 b=AmiK+K+aEBuZsV9K98GaX2gxqX+izd//uOvIwCOQKyv5YsVt7TfuGeSXBgGFqF8qIBYNdJYJ+L/NyHmelyMj08B0zHxWdwWstXmBR9PrXkmpwdUUYXV+zoD1MiEhl1od+OD99hfAeXZiNnkc1k7jDASM6OIQ/9N92A/ITr4dgDI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB1830.namprd11.prod.outlook.com (2603:10b6:903:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Sat, 30 Jan
 2021 03:45:26 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::5003:3066:e469:80a0%7]) with mapi id 15.20.3784.019; Sat, 30 Jan 2021
 03:45:26 +0000
Subject: Re: [PATCH] gpiolib: free device name on error path to fix kmemleak
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210129081917.1808218-1-quanyang.wang@windriver.com>
 <CAHp75VemJWQDKFFrrCKWnUGHFiPhuh=4Aqhn8T6qF5yuMOCOKg@mail.gmail.com>
From:   "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <02e614e9-fe2f-d7b2-6c47-2431475780ed@windriver.com>
Date:   Sat, 30 Jan 2021 11:44:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <CAHp75VemJWQDKFFrrCKWnUGHFiPhuh=4Aqhn8T6qF5yuMOCOKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0170.apcprd02.prod.outlook.com
 (2603:1096:201:1f::30) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by HK2PR02CA0170.apcprd02.prod.outlook.com (2603:1096:201:1f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Sat, 30 Jan 2021 03:45:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff174712-9e98-4090-429d-08d8c4d17ab8
X-MS-TrafficTypeDiagnostic: CY4PR11MB1830:
X-Microsoft-Antispam-PRVS: <CY4PR11MB183026976124F3998BDA2465F0B89@CY4PR11MB1830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vVgIUeb/ozu7Z0T+/yLTyjWhvgzMss2pBxlmiZQr9oMKOfmV4F0c+VnGpHcMvp5Kh9jn2hog+KDVWy3Ob2Wts+c7T7zDGRK42RGotxYlOkCQPvLTqPB+l5YRpOmlp2/Qr+XLV+tK7Da12OsWhxW+bXXQR9zN8wx0XuOvyeT3nrjTAGvNz/P2SBEAdHJ6xRTBG9AJWDK4gtfAxTH+18OHKzdr4QPTu8rC54V8UOqf8Mwk2amg9ROdlqP+xj43mwVb8yjf/adaB2fJMSZHFPILuTmItS9JFbFVJoziamdQm0hPz+co6uXE/IemdRvP4Y7s3eUKDcoriR+/DrUmk+GQ06w/Djo8YE0SOtRNfyq0OCQ2T3oUgQ9ch5KHeyprWKGLIZYdPASyWz7abpE8vTnet7o+Q9DmZYgDa6jcjHx4/PYd7C4UyaEAR9MSYOdPawPUrbrHj6k4y6AW8eftDZwrx+ndnObD/peCpQuDlAjn3aIg9ktDV5ZmSIE1c4gm5eYxcO+c9vsR/LTe3b+larlPEXOlznvRD76YMh6s12jUTuLvmsocNCHX57FDgEurg3FhEBw5QPVtZs+Vv1ZjUo7H2oosAqnApmst5ANkCXuvTj7QGApWoItCAXml2Wh9RWO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(52116002)(186003)(26005)(16526019)(2616005)(956004)(54906003)(16576012)(316002)(86362001)(5660300002)(66556008)(53546011)(66476007)(31686004)(66946007)(6666004)(6486002)(478600001)(31696002)(4326008)(8936002)(36756003)(2906002)(6706004)(8676002)(6916009)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NE9HcmV4K3hzY2JuVm0zSy9rZHEvN2FxY3dVdEhXUEFyeVg2SkZzbDRMZU00?=
 =?utf-8?B?aGZ4bndkclVCZ3BWZ0F1dHNJc3UreFQ1aDVlUW5QcWZacTVaUXZRbnRxaHdP?=
 =?utf-8?B?ZEhXOVgwUmllOXJmaEtNa242ZnVocGFsY1FJb2xVUlRUZ3VraW5xOHZhWFhn?=
 =?utf-8?B?eG44ckRMdHlESkloV3dYWEQzYUhvbEpPWEYxV3JIZnArOVNTNzliRFFOMVM0?=
 =?utf-8?B?ZU45ZW5LZXluVjVUSHVXNm9VK0VuSlV5Yk9Ua1FKZTBNdUdZSzZpTVV6V3hJ?=
 =?utf-8?B?VkQ1N0dhd3VWcldYTmtGYkhwNHFTd0JnbDhSenZFVWZudjlpbFlPcEVFalFK?=
 =?utf-8?B?TVFidmFtYk9CR2ppbXljMHlEQmtsMWpYQkZWSDVzVXlvOXE3Yjc5bS9JUTA5?=
 =?utf-8?B?M3lKSjlKM0VIdlY3Yi9BWkNKOXhuYk1ZV2ZFMTEvV0drL0MrT0NkR0UrY1pY?=
 =?utf-8?B?MHhWcjI1alFMeFpMMGFPanVPa05SVG9ncW1nbDB3ZytmL3JwaTNCTjZtcy9U?=
 =?utf-8?B?Nk12MHFsRHhyRnlUZHpndmM1Y2tFcVdUbmkzR3NoZkg4aTMzdko4V0dEVmVB?=
 =?utf-8?B?L3kyQnYrK0RMTlFDZHRwRTZZOXVQQXY3UUJHUUIra0tBbEtqMEttQmRJWUg4?=
 =?utf-8?B?UXlsalp2aksycFl2bTIrT1ovT2grZEVMYUw1cGl2Q1prM2hDVFMwV3ZKT3RY?=
 =?utf-8?B?WGZWMHVoM2cvbVpyZHQ5TFZETFpFZ0xsVEh6R0tqTDVRZ3VKUlN5aldiSWtV?=
 =?utf-8?B?MzB0VERMbnpVK1ZJd1hTRkdBZXMwSFE1UHZ4VDZVZUZidzRXSnVVNVVuZHE5?=
 =?utf-8?B?a0ZnZEhmZ3NTbnRYbnU3T0FJYUVrM2pyTTJZQXJFNVBtdWZORlc0Vnk1dHNw?=
 =?utf-8?B?RUkwUW0yeEp4VFg2ZW8vWCtTVlRZczIvMFFSSXAydnBDSk5WMWI5UHZqcUx1?=
 =?utf-8?B?OFB5c2JkajZUM2xJT3FHTVFqZFNQOFJxczFlQmM4dUQ0K0NqcWdWeERTY1hQ?=
 =?utf-8?B?TURjZkpwenNpMTFDQVpNYUZOMGZGa2lCWWZDb1hsMTVyR0NpcU1tOFY2aTVE?=
 =?utf-8?B?NElVdWtaVVkzenJ1VTBIVFY1VU50cW0rbDkyK1pBVlcyeCtIakpkazBPZGJv?=
 =?utf-8?B?T3Y1ZEpYN0tlei9xKy9FWEhJU1E0Z0RxcjlQcXlCODR3Y0dEanJsWENKeVBV?=
 =?utf-8?B?b3RtMnp3TUxWbmdIdlNTZU5DRVR2R0dPbFlwQkorcDZicGhoUzVNMDJZYW5m?=
 =?utf-8?B?L3F4aFkraFV5eVpZdTF6d09PMlF3ektlMmhJL0VwZmRubHRDcFFZa2UveUJR?=
 =?utf-8?B?bWxjZkgrajE4WG40VGxTODlmRW1LODE3NTJoS0RBVEhZNitDbDFlL1IvSVg0?=
 =?utf-8?B?UUo1Tm5sYkN4VDRUQ3Z5T2hPMzJ4L0NZR3JYMjZaY01xb3hHWlBpeGlOL3Fl?=
 =?utf-8?Q?cRVpzibo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff174712-9e98-4090-429d-08d8c4d17ab8
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 03:45:26.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qreHbfmhGC9WLvSabGJDtuiflEV/5rsRkFiUJRC6FGLzxMXTviO9140AEz1nH5Z/+LIF7MYU0wCGbJn323mOJbQD7MpIlCkix+Lj4mHDDwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1830
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 1/30/21 1:26 AM, Andy Shevchenko wrote:
> On Fri, Jan 29, 2021 at 2:01 PM <quanyang.wang@windriver.com> wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> In gpiochip_add_data_with_key, we should check the return value of
>> dev_set_name to ensure that device name is allocated successfully
>> and then add a label on the error path to free device name to fix
>> kmemleak as below:
> Thanks for the report.
> Unfortunately...
>
>> +       ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
>> +       if (ret)
>> +               goto err_free_ida;
> ...
>
>> +err_free_dev_name:
>> +       kfree(dev_name(&gdev->dev));
> ...this approach seems to  create a possible double free if I'm not mistaken.
Thanks for your comment.  I didn't catch the double free. Would you 
please point it out?
>
> The idea is that device name should be cleaned in kobject ->release()
> callback when device is put.

Yes, the device name should be freed by calling put_device(&gdev->dev). 
But int gpiochip_add_data_with_key,

when running dev_set_name, "gdev->dev.release" hasn't been installed 
until in the tail of gpiochip_add_data_with_key.

So we couldn't call put_device here.

Any suggestion is much appreciated.

Thanks,

Quanyang

> Can you elaborate?
>
