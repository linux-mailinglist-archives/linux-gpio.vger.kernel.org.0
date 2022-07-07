Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316085699C5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 07:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbiGGFT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 01:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiGGFT6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 01:19:58 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431E13122B;
        Wed,  6 Jul 2022 22:19:56 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2675Jqka065614;
        Thu, 7 Jul 2022 00:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1657171192;
        bh=neB5iajCmLQMPo7WImf2pu6sK0uT/3tlIZLXgS5GbKw=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=L3QALqSlzJoA+NNSiNKA28rA22umcYlLyt3RpIyP3O3Mdcu/UKdIMtQPrEso82e9D
         F31xoak0Vkg+Xw7QpyQ59QLe16ltydn7X9GzFZGX9KxJcYB8cMZDUb0lyrJEoOANwV
         76IufhzillesNLNYQOi0TRPwfdm1bCtF/cz80hDg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2675Jqvo014130
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Jul 2022 00:19:52 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 00:19:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 00:19:52 -0500
Received: from [172.24.145.182] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2675Jnkj090190;
        Thu, 7 Jul 2022 00:19:50 -0500
Message-ID: <ddc2b24e-37a3-4751-80b9-84b13606a703@ti.com>
Date:   Thu, 7 Jul 2022 10:49:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5] dt-bindings: gpio: Convert TI TPIC2810 GPIO Controller
 bindings to YAML
Content-Language: en-US
To:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220223174215.17838-1-a-m1@ti.com>
 <CACRpkdbj2B90-RE2XKQJ5qEj1hZQA-u=vUu2vpXwNqQLf_kaPg@mail.gmail.com>
 <e682175fcfc54217a6ed006270877f4d@ti.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <e682175fcfc54217a6ed006270877f4d@ti.com>
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

Hi Bartosz,

On 05/05/22 14:28, M, Aparna wrote:
> +Vignesh
> 
> Ping. Can this be picked up for next merge cycle?
> 
> On 15/03/22 06:31, Linus Walleij wrote:
>> On Wed, Feb 23, 2022 at 6:42 PM Aparna M <a-m1@ti.com> wrote:
>>
>>> Convert gpio-tpic2810 bindings to yaml format and remove outdated
>>> bindings in .txt format.
>>>
>>> Signed-off-by: Aparna M <a-m1@ti.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Yours,
>> Linus Walleij
>>

Sorry, this patch has been around for sometime w/o any comments and has
relevant R-bys. Wondering if this fell off the radar

I believe patch would go via GPIO tree?

-- 
Regards
Vignesh
