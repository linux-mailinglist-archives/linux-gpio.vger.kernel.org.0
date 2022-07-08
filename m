Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA5956B238
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 07:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbiGHFZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 01:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiGHFZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 01:25:06 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36217255AF;
        Thu,  7 Jul 2022 22:25:05 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2685Ormr084794;
        Fri, 8 Jul 2022 00:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1657257893;
        bh=xK5TBYGanW67/SypumVd0v/dH1Qgsl08EJyTmepsg3g=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=tiRSZ6xi5iKTUyIMEC1oyF24B3MCA5BqXKUXWyXVTzr8qLNxrE2PA1/+i+6lVk9aL
         f1vwjAx+Elafz826diUQ6WrZgg0XZ/zAnVb9V7+WW6aDpWJSO5DLy/k4ZwKlxJ3z79
         dBp0sOkv0Sj5ditAbGIHonTL+2dasqYExVZqAbiI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2685Or10101383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Jul 2022 00:24:53 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 8
 Jul 2022 00:24:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 8 Jul 2022 00:24:53 -0500
Received: from [172.24.145.182] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2685Op2Y017254;
        Fri, 8 Jul 2022 00:24:51 -0500
Message-ID: <08422d68-21e4-b2c3-7d07-a19a121b24de@ti.com>
Date:   Fri, 8 Jul 2022 10:54:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20220223174215.17838-1-a-m1@ti.com>
 <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
 <e682175fcfc54217a6ed006270877f4d@ti.com>
 <ddc2b24e-37a3-4751-80b9-84b13606a703@ti.com>
 <CACRpkdZ7Kb0=7LHa13KJeZc2Kwb6z5kuH9nnHrk4p9OqB8+QgA@mail.gmail.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <CACRpkdZ7Kb0=7LHa13KJeZc2Kwb6z5kuH9nnHrk4p9OqB8+QgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 07/07/22 16:49, Linus Walleij wrote:
> On Thu, Jul 7, 2022 at 7:19 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> Hi Bartosz,
>>
>> On 05/05/22 14:28, M, Aparna wrote:
>>> +Vignesh
>>>
>>> Ping. Can this be picked up for next merge cycle?
>>>
>>> On 15/03/22 06:31, Linus Walleij wrote:
>>>> On Wed, Feb 23, 2022 at 6:42 PM Aparna M <a-m1@ti.com> wrote:
>>>>
>>>>> Convert gpio-tpic2810 bindings to yaml format and remove outdated
>>>>> bindings in .txt format.
>>>>>
>>>>> Signed-off-by: Aparna M <a-m1@ti.com>
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>
>>>> Yours,
>>>> Linus Walleij
>>>>
>>
>> Sorry, this patch has been around for sometime w/o any comments and has
>> relevant R-bys. Wondering if this fell off the radar
>>
>> I believe patch would go via GPIO tree?
> 
> You need to use the right mail address to Bartosz so he can pick it up.

oops, thanks! looks like original author copied wrong ID

> 
> Bartosz: this seems to have fallen between the mail address cracks,
> check it out.
> 

Bartosz,

Let me if I need to resend to right inbox.

> Yours,
> Linus Walleij

-- 
Regards
Vignesh
