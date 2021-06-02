Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F1C398870
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 13:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhFBLiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 07:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhFBLiQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 07:38:16 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02C7C061574;
        Wed,  2 Jun 2021 04:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HjIO51Dy95B1sAIiwx/AGzUErMBUQXzVZagx1OmVJyM=; b=wqt6KE7pT37VTODlH9CiGDtX/s
        UpaWXBHdRKMTWes2YvNeCd4hZayvH1jU+UjKd87Auq8t9J+PPJ0JQG+0lDZpKVYST/fHwQdCCf6TG
        My1b7Cvumy6O5Nkyv6o3cmohO7IDFf0TCEjaL1Mq2UU+ZggCI5qNFtNr75jIiO36wHGuGU8xSsB+3
        GYIB/2ir9t3ypqjRK79j6VlytIvdSHh2OKwgZ74WtFaOiA5Ga/8ntNwI0pwlLuMn0kMRF7kfKdpuz
        uvY91CFI+w/LLQul0Rbop364nYEwUpYciqc+KLLWINqJrkjv0pbJlsEpmxQbXj6tgeyJZo1R5ynWI
        Knxp1CVQ==;
Received: from sein11.ut.ee ([193.40.12.11]:46381 helo=[172.17.163.37])
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1loPAj-0001LT-0p; Wed, 02 Jun 2021 14:36:29 +0300
To:     Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, andy.shevchenko@gmail.com,
        sandberg@mailfence.com, linux-gpio@vger.kernel.org,
        geert+renesas@glider.be, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, drew@beagleboard.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi>
 <20210530161333.3996-2-maukka@ext.kapsi.fi>
 <1622554330.022234.242358.nullmailer@robh.at.kernel.org>
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
Message-ID: <c19e2528-648f-0df0-c13d-127b897e9597@ext.kapsi.fi>
Date:   Wed, 2 Jun 2021 14:36:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1622554330.022234.242358.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 193.40.12.11
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 1.6.2021 16.32, Rob Herring wrote:
> On Sun, 30 May 2021 19:13:32 +0300, Mauri Sandberg wrote:
>> Add documentation for a general GPIO multiplexer.
>>
>> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
>> Tested-by: Drew Fustini <drew@beagleboard.org>
>> Reviewed-by: Drew Fustini <drew@beagleboard.org>
>> ---
>> v3 -> v4:
>>   - Changed author email
>>   - Included Tested-by and Reviewed-by from Drew
>> v2 -> v3: added a complete example on dual 4-way multiplexer
>> v1 -> v2: added a little bit more text in the binding documenation
>> ---
>>   .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml:0:0: /example-0/mux-controller: failed to match any schema with compatible: ['gpio-mux']
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml: key-mux1: 'mux-controls' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.example.dt.yaml: key-mux2: 'mux-controls' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
> 

These look like they could be caused by gpio-mux bindings [2], which 
this depends on, not being formulated in yaml. Should it be addressed 
before carrying on?

Thanks,
Mauri

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mux/gpio-mux.txt

