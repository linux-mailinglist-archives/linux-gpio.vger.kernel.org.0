Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EBF20F912
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 18:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgF3QHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 12:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgF3QHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 12:07:13 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC720C061755;
        Tue, 30 Jun 2020 09:07:12 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49x8Pl3xpLzQlKq;
        Tue, 30 Jun 2020 18:07:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593533225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/VL3Dz21dAtlF89v8AL+P+yUgMw+q0l6pUr1vTyUoRU=;
        b=EqeihTTHsiTT+BI6AgUseJbDcpN1EGzeddVVIET8Qls83y16c1BxHS8/mRSrurLqael9cY
        3Nqv++7+9xGp22RZPIexb54ttwZp57nN9avBi+GB29Kb7ctK96/yXxe1d4c8Vl2aHreM4V
        ygmrRdOl4zYQ5Thcwdb/AWrdNKq6uFQF3Tt74bk/VuGr3vTaF/oFpQzYXd3+XqjZ3JYzKG
        Z/arA3T2RYn8wS3Nm68G1dOY5oIv4qSI+uVgyMGqegA23TSu7t/yySz7lFgxGIe1IUc+Cp
        svGunnbd0XUKBVMzKVEOwO+KTEeKXA/wrDnMPMFD2NFYzFX1gbl42feidMw/5g==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 5ezmpbc6kQ54; Tue, 30 Jun 2020 18:07:03 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
To:     Rob Herring <robh@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20200625075957.364273-1-mans0n@gorani.run>
 <20200629220117.GA3012245@bogus>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <7686930b-2dca-bc88-1989-9daf74bf5af1@gorani.run>
Date:   Wed, 1 Jul 2020 01:06:54 +0900
MIME-Version: 1.0
In-Reply-To: <20200629220117.GA3012245@bogus>
Content-Type: text/plain; charset=euc-kr; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -4.58 / 15.00 / 15.00
X-Rspamd-Queue-Id: 2A4AE177B
X-Rspamd-UID: 942bc2
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-06-30 07:01, Rob Herring wrote:
> On Thu, 25 Jun 2020 16:59:57 +0900, Sungbo Eo wrote:
>> This patch adds device tree bindings for the NXP PCA9570,
>> a 4-bit I2C GPO expander.
>>
>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>> ---
>> I don't feel I can really maintain this driver, but it seems all yaml docs
>> have a maintainers field so I just added it...
>> ---
>>   .../bindings/gpio/gpio-pca9570.yaml           | 42 +++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
>>
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dts:21.13-26: Warning (reg_format): /example-0/gpio@24:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/gpio-pca9570.example.dt.yaml: example-0: gpio@24:reg:0: [36] is too short
> 
> 
> See https://patchwork.ozlabs.org/patch/1316796
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Thank you for pointing it out! I didn't noticed it. I'll re-submit an 
updated patch soon.
