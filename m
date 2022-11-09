Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8FF6224A9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 08:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiKIHb1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 02:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiKIHbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 02:31:20 -0500
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CE31EEF6;
        Tue,  8 Nov 2022 23:31:18 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 1E4A141A42;
        Wed,  9 Nov 2022 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1667979076; bh=nWvNg1VPCRK8w6aaa8acSaDwMto5C+mMnVSDnwfo4Ic=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=m7ltRRcdvpiDH+yE9dvAvP4fgJTboKU8BTktrI9Qrsxe5N7qUqvwp2NXOC5KSlVS6
         1n+7b/PlqzcYgfCdLLhIoklrh/fJtuRW00MlCrtgJJGjdz1qFucY/zqKxnTTAKuKTo
         H4AiUSA2w+uVw1h3wiW6cNeFqHXBNKaWFMxMYfbQB2Y6TbrP2FSoRDF1JV/2iHO0Eb
         6sgwaT+OPYdICSYkzVVpd5OB3tSPqenaB6fALru0fyJ6R7PFbIGeZ3j7m/12CTiBdu
         5nKkUuInkppC+QLTcDNRm5Xy3BUv09Ff06vyGnhLQ0jZ1zptBj/Ia8wRWpZFpuhJA9
         G8JmzEUmFEcZw==
Message-ID: <2acc54a3-4fa9-2c93-449a-eed24340a00e@marcan.st>
Date:   Wed, 9 Nov 2022 16:31:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
 <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
 <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2022 07.09, Russell King (Oracle) wrote:
> On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..1a415b78760b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>> @@ -0,0 +1,37 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>
>> Does not look like you tested the bindings. Please run `make
>> dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> Oh ffs. DT bindings are utterly impossible to get correct.

I'd be happy to wrap the bindings up in another cycle & take them via
asahi-soc, if you want. That will also allow us to add the nodes to the
t6000 DTs which are on that tree for this cycle, and unblock merging the
driver bits of this series. Bindings updates are not a hard dependency
for drivers, only for the DTs themselves.

That is:

1-2,4 via mfd tree (if Lee agrees to merging the RTKit driver platform
bits that way)
3,5-6 via asahi-soc
7 via GPIO (I think)

- Hector
