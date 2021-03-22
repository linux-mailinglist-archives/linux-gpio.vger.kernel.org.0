Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCF4344201
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhCVMhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:37:48 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com ([40.107.21.112]:36897
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231418AbhCVMgd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 08:36:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIJIfT7tgmoD4gVo/nsjLvzvdxuBEHxrLcwi+zGzBHa0GJ4bkjgq5oZwhoVc2myUvNCr2eDuKBzQ1K1rigWfHak8iFILZkZkN82FJgV6GY800PS7TTSvD0u4umVnyIYw4NDTFWwdG06pmDTC7/r1vBCzncuVQnWqlO/eMPpm+Eu8jl4Dp+czoMDpwB6tqm7o7hfJmF47MT2vr76BpJ1uTi9ZR2yL16iuuN05B193BsSlDhjg41InvRDDqvv6d+UoBbxHdwhK/j35AecDbdKx4D6UcvBPBlqUJV9fToM9+M7gZM+IODFBysX0NYz4ZjchDeEtTgfzm69lPmrWeK74BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl6iKmcKLx1CeZv+8icIcqAW848s8JXoJkuBlzyevUU=;
 b=JfFmk0olKWNipUcDscyy+1Zjhu0jQUrzbIs+clm7JGBLan3a0kpMznAAn4PZHgrAXLGVuqxpicDwtKTTIR6/WFCUH9Za2z0oLtM5JVKTonVfejivAfZe75W3gggGr7fa9/ZtIJsfsKZWy67gfmrk6O6wUAzG6/g/qgw5s21qGlS92kssnBUW92H3ETJ4cToj9y2DUSuFiSuwoqKahW8w+apMc2fpbF5QT5SJgYiK0To56WIR2YVXRMfRVKKj4HjJhDlByHEQWSg5bE6ZNfq+G2mJeiTCRbtXXPZIO1rUwbwvRMOARXqQ7kBYy6Nk9PrvSdjl0KuOKeYKkVsEScTgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl6iKmcKLx1CeZv+8icIcqAW848s8JXoJkuBlzyevUU=;
 b=AY84wVAuGjX6Q9V10qck5YH+LDl36+M+Ttwyy7G77bx2u/DWvNePC9Q2IdujAxOck4p4wt08bSheB01BGekDm+YzRU90ue5VQjWuRB2mDQbWW+Si96hIbXxtazPaow7DeYNjBLSHeRrZr+DuvQ4Cm4c1wXVM2qZLy10Mr9jl1NE=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM4PR0701MB2212.eurprd07.prod.outlook.com (2603:10a6:200:46::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10; Mon, 22 Mar
 2021 12:36:31 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.019; Mon, 22 Mar 2021
 12:36:31 +0000
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR
 line
To:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com>
 <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com>
 <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
 <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com>
 <CACRpkdYnxfb1wQDxpLOs7H9-3cTm+dtQRpNxmQBGLce_TYwOCg@mail.gmail.com>
 <CACRpkdZn9EHTH+MJtph3MUF1WxuTZzbTqRmtec=XgVUoy5VZsg@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <1de688c3-1014-2e29-ecb9-09cff4d52d95@nokia.com>
Date:   Mon, 22 Mar 2021 13:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CACRpkdZn9EHTH+MJtph3MUF1WxuTZzbTqRmtec=XgVUoy5VZsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.167]
X-ClientProxiedBy: AM0PR03CA0098.eurprd03.prod.outlook.com
 (2603:10a6:208:69::39) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by AM0PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:208:69::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 12:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d43ebfdd-48f6-4915-e772-08d8ed2f1ee3
X-MS-TrafficTypeDiagnostic: AM4PR0701MB2212:
X-Microsoft-Antispam-PRVS: <AM4PR0701MB2212FF9EC14EB57CEB88BA7D88659@AM4PR0701MB2212.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OniFcR2zAWDEE03VqltdxIVGOZxDn2SxPK4F4aCvRJ2PQ1iRpjUvmwzPwDz/pKTSEy11ZdzLi5nZBOJost66sM1lHyH83BezVcTQ2C8xzp9LvieXROyCrr+qQa732fC4RZ9duVzjcpKoI+BF9lzmZhBKXG9p/vz341dXO4cRaX8HLWh/+BZvLOv2mFIOv/rO6IS+Q5qwy43/Ece42tjCycQZPIh7Dq841Bg6T+f8hxE787TR1xhIFZtPwLJhnfll06hCSa7fUProCdAhix51B3Af56zXch8Tx21LOvWO453Qj0rMoToZ1cm9c46ARrNAETmRc77zsie+gC0yHod7T7bwEv485sMdkecEoyfn2Bjo8G1EMEP254Q8XzefUOMIKOh0amDkgSSLZ6EffIx+vI7dJ3zZI+p0TldpxC4qb7PNOMulgFILAQFophNYzAtwWTagt+OqAwPBQgWk5C7C8U0y/kB1HOMBEznXvPukQa6TCHz3TYgRPTt3Q+3UtIevU6b+3r3uCh08I0L4IYt4jEdw2DBj0oyFRxJS3zbFcq0puILS0IwClYrIX58R7TlvXL+ebMTJPc+gLDozXfoz2JxMcuMwlTwpgibRoa3UEkiWT5L3wjMXCpX/J0jFYjEeQPtSRklj9/3F7CA1Ae4tB6hAI0Y3wdkAvIQA9/kZf++NkspWT+T2qLZtvjWTAoMknAsMpQulfFuhgHtbrqYRU+JYx29TvShpg6yVxw3GH+s2w5hoCPOm+KlQMTxOvzvhnPpppI45ZYPXcEvcjhCmnn5uVM9kwtihR5IocUlKzis=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(83380400001)(966005)(2906002)(26005)(186003)(16526019)(316002)(6512007)(6506007)(54906003)(36756003)(110136005)(53546011)(52116002)(4326008)(6486002)(6666004)(5660300002)(38100700001)(8936002)(31686004)(8676002)(31696002)(66556008)(86362001)(66946007)(66476007)(44832011)(956004)(2616005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ymh0QUltYmhEOFdrWFlkdXpqUkFJYndOVGFRSG5uNFFtWGxBUlh3S3h3STRH?=
 =?utf-8?B?dzNrK0Q3SkxVS1B0V3VPM2xBUFlpOVU3SThjdis5M2Nyb1lCakNBUFowM1Bw?=
 =?utf-8?B?YXVWWVdKME9EYlpjV2E3THZteXFVdThnMW0rQXlnT2VqeHlKUlp0OXZiTEMw?=
 =?utf-8?B?MS9wdXJaSGcraExKSldtVERGU1hBMUt3cFNLRXM2WjVqUjZ4Zy90TVh0amV0?=
 =?utf-8?B?dUZ0UUtKbVhPa1VnaEpteTZGaHVNZmdmV3QyaFIxNG5mUXFOK21nWkJkT05W?=
 =?utf-8?B?WUIvSjBGSGN0Mk5RRWsrMEVRbDdhN1BHMHlEYkN0WkdaUW8xTSttbEh4Tnc0?=
 =?utf-8?B?WjEyS3Iyd0RyblBCd2trM0ZjaVBTUWlZeVRHWHNRbTNDWWhlTWNzSW5BVnlr?=
 =?utf-8?B?OEp3SUY2aGZqYWRhRmdBTGZpQ05rWkVEUFJ4ZmNuNEx2RFVQMGZ0aHhIOVlZ?=
 =?utf-8?B?dVdsQVlZbjJ2TnZqVFpyOUlkS040TTJpeFNFd0tyY0pmNDJtcnBldzFGQkU0?=
 =?utf-8?B?ZUNzUm0yK0d6N2NyeXdzeXc4c2ZqVnU5eC82T1lNemY0Nm5ZeTV5OWxtUmwx?=
 =?utf-8?B?NmdaNUNUeC9CTEowaGIzQ3lzYUdESThDSzFObzYvZmhIOXVzRWRyYXVKM2ty?=
 =?utf-8?B?N1I4R3IxMEVxZlpnRWp2NkhqekVDa3YxclExeFByUnZ5aUtrWXZlT1ByT0tn?=
 =?utf-8?B?ajNiNXpsNXpQMTlaWHN0NXI4OHNkczA3Smxyd3p3MFMxOHFoRDRXQWRKR1BH?=
 =?utf-8?B?WGlhWWRkemMvblArSnhVa2FBZndHUzFNSDFxY2tjZ1JHUDEvMndKeXBpUGFS?=
 =?utf-8?B?Yi9uQzByckQvOEFoc0NjYm8wcEloeGthSFB5VkRTdFJMZlBXOW8xQ0NXNXhk?=
 =?utf-8?B?amFZdnBDN3lEcVZ3dE5nS0d1OFdUN1ErdStJSDJ2ZWVwQXpReURjZ0dhOHdm?=
 =?utf-8?B?V0xEUzB5MjRyaWgyd0MrMXFiL3EzclFnMkpwY0FnanhzeWZqZ0hnRmtqRlRz?=
 =?utf-8?B?V0VKZSttMWlRZVM4dFdDNm1qcHdpZTYvOFllVk5kbnBhVEUrOC9JUDdrT3cv?=
 =?utf-8?B?RmJSSlRHUE1XcWEzeitrc01QMkZLb2hxaHQxNVVzYWlRK3MxbVZzQ0pZUHVx?=
 =?utf-8?B?d1Z3ZjBpUFVkVnprR2cwekdrdXg3THNTc3E5MVVOTS9rZWZON3lGSTI3U2lj?=
 =?utf-8?B?RXRpTjNSK29hSTFvTjFiUkdTUlcwNm9vTEQwR2xmeE9oT1BkZzVaTmhGUWUv?=
 =?utf-8?B?ZTBaSU84akd3eG81aTEyaU80ZW5GVklRcy9icGp3R0JJeXRneFZ4eDBBQXRk?=
 =?utf-8?B?bmN2aDlSRkFRVmdPRmswZUlyRk9uMFFkU1hSVEhRK2dvM2V1blNMUUptMnRU?=
 =?utf-8?B?MFB3SW5kV1hEcHlFWkg3dTFFc1JNWW0vZVVGQlQ3S25MVlJsMC8wU3BjOVhY?=
 =?utf-8?B?SFN1dldZakcwNVRXSnVjS1oybnNWY25oSkI2TlpQcWNlT3dOcmxkUWZBRmRm?=
 =?utf-8?B?clU1OUxWNzhwUjNERzQ5aElDU0FLeFlOSkh6VGVBeEdxZEttRlJnNXUveERH?=
 =?utf-8?B?ekNCcmFkK0U5dGtLYXlnNkZrcGlnK0lVOXEvRUdXWlBoRWhRR1RzSGx4RUVQ?=
 =?utf-8?B?dUkxT0YzbENIRHVHdTNyQkJnbmtTZkphakFWTGNnMFhEUlE4aW40ek9FV0Rt?=
 =?utf-8?B?NlpNd3RTUFlyc09GT3YxRERNMkJEUEdLZ3FGN3orY1FsTXpzZERXVHZQUWpS?=
 =?utf-8?Q?2WSxIz18ZLxopvdPMfSTh2QIR8irs6nsEdADs0c?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43ebfdd-48f6-4915-e772-08d8ed2f1ee3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:36:31.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VMmOIPgxpbbexgEV7T5oHeGYXeIy8AcLE5Cb+lOwWWMcqCOCGFt+06u8EC6ASiu6UYAkhrHJHJU5LcHSK2nBKwJ+I55/fOoxIGGu4OwnrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2212
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On 22/03/2021 13:17, Linus Walleij wrote:
>> The thing is that hierarchical interrupts are supposed to
>> connect the lines by absolute offsets that are *not* coming
>> from the device tree. This is the pattern taken by other
>> in-tree hierarchical GPIO controllers. We have repeatedly
>> NACKed patches adding all the IRQs to hierarchical
>> GPIO interrupt controllers, in favor of using hardcoded
>> offsets in the driver.
>>
>> Do you have some good idea of how we can achieve that?
> One way would be to stack more compatible strings:
> 
> compatible = "lsi,axm5516-primary-gpio", "arm,pl061", "arm,primecell";
> 
> Going from more to less specific. We see that this is a
> PL061 and that it is a primecell, but we also see that
> it is a version specifically integrated into the axm5516.

The problem is, it's not the only SoC with this "issue".
AXM56xx and AXC67xx will follow, and these "hardcoded offsets"
will be different. We are not going to add a compatible for
PL061 per SoC, are we?

Well, you can always merge v1:
https://lore.kernel.org/linux-gpio/20170222123049.17588-1-alexander.sverdlin@nokia.com/

I have a ported version of it as well.

> I do see that today it looks like this
> arch/arm/boot/dts/axm55xx.dtsi:
> 
> gpio0: gpio@2010092000 {
>     #gpio-cells = <2>;
>     compatible = "arm,pl061", "arm,primecell";
>     gpio-controller;
>     reg = <0x20 0x10092000 0x00 0x1000>;
>     interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
>         <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>     clocks = <&clks AXXIA_CLK_PER>;
>     clock-names = "apb_pclk";
>     status = "disabled";
> };
> 
> (Indeed this doesn't currently work with Linux, thus this
> patch.)
> 
> It is indeed specified in the schema right now as:
> 
>   interrupts:
>     oneOf:
>       - maxItems: 1
>       - maxItems: 8
> 
> So from a devicetree PoV all is good. But it is not the
> way hierarchical IRQs are supposed to be done IIUC.
> The preferred solution is to use a specific compatible
> string and hardcoded offsets.
> 
> It'd be nice if the interrupt or DT binding people would say
> something about how they expect these hierarchical IRQs
> to be specified from the device tree. I'm just representing
> earlier review comments here, maybe they've changed
> their mind.

-- 
Best regards,
Alexander Sverdlin.
