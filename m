Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318FC34F0DF
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 20:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbhC3STF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 14:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbhC3SSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 14:18:47 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C918C061574;
        Tue, 30 Mar 2021 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=KxGoy1weYbtqCANsJUAKQtRWb25OeKHfyfClNVXIBaM=; b=gbPTeAjgahdLzSFS7IrPEdFOWG
        +5DgazEYkC/GgEruOlW/Hbb6e82wb0caoCT3AxFssyjF98qFWKiaqxManyYPM2dKrDpGWwNxXO/Qk
        hUjY20ZPidsEh1h3xJL5VsWkBeAgdcJoLnUusm3Q+FPeBbgkxbhnJ5ZFeFzZk3F9VbCA9qEsXUIo8
        R+dYBRK3ldbTMRybAOrQoddsWb16bNbRBLbS9oVSc/rrL0Sq50GzzFjCT1HoN7lozeociZMGq5RrK
        BiP/fYKQm0k6Hysxd/+KyJ6TavmJD53Iu+Xo41pytJEKdM4C+DvlknOTYKP8iMrskljP3gDJibM1L
        e/fz6THQ==;
Received: from [2601:1c0:6280:3f0::4557]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lRIwc-003QJf-5Y; Tue, 30 Mar 2021 18:18:35 +0000
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
 <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c74ddbd9-900a-0817-4c16-86f7cf9d96cc@infradead.org>
Date:   Tue, 30 Mar 2021 11:18:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi--

On 3/30/21 1:56 AM, Wolfram Sang wrote:
> diff --git a/Documentation/dev-tools/gpio-logic-analyzer.rst b/Documentation/dev-tools/gpio-logic-analyzer.rst
> new file mode 100644
> index 000000000000..2847260736d4
> --- /dev/null
> +++ b/Documentation/dev-tools/gpio-logic-analyzer.rst
> @@ -0,0 +1,63 @@
> +Linux Kernel GPIO based logic analyzer
> +======================================
> +
> +:Author: Wolfram Sang
> +
> +Introduction
> +------------
> +
> +This document briefly describes how to run the software based in-kernel logic
> +analyzer.
> +
> +Note that this is still a last resort analyzer which can be affected by
> +latencies and non-determinant code paths. However, for e.g. remote development,
> +it may be useful to get a first view and aid further debugging.
> +
> +Setup
> +-----
> +
> +Tell the kernel which GPIOs are used as probes. For a DT based system:
> +
> +    i2c-analyzer {
> +            compatible = "gpio-logic-analyzer";
> +            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
> +            probe-names = "SCL", "SDA";
> +    };
> +
> +The binding documentation is in the ``misc`` folder of the Kernel binding
> +documentation.
> +
> +Usage
> +-----
> +
> +The logic analyzer is configurable via files in debugfs. However, it is
> +strongly recommended to not use them directly, but to to use the
> +``gpio-logic-analyzer`` script in the ``tools/debugging`` directory. Besides
> +checking parameters more extensively, it will isolate a CPU core for you, so
> +you will have least disturbance while measuring.
> +
> +The script has a help option explaining the parameters. For the above DT
> +snipplet which analyzes an I2C bus at 400KHz on a Renesas Salvator-XS board,

   snippet

> +the following settings are used: The isolated CPU shall be CPU1 because it is a
> +big core in a big.LITTLE setup. Because CPU1 is the default, we don't need a
> +parameter. The bus speed is 400kHz. So, the sampling theorem says we need to
> +sample at least at 800kHz. However, falling of both, SDA and SCL, in a start

Is "falling" like a falling edge of a signal?
If not, then I think "failing" would make more sense.
Even "failing both".

> +condition is faster, so we need a higher sampling frequency, e.g. ``-s
> +1500000`` for 1.5MHz. Also, we don't want to sample right away but wait for a
> +start condition on an idle bus. So, we need to set a trigger to a falling edge
> +on SDA, i.e. ``-t "2F"``. Last is the duration, let us assume 15ms here which
> +results in the parameter ``-d 15000``. So, altogether:
> +
> +    gpio-logic-analyzer -s 1500000 -t "2F" -d 15000
> +
> +Note that the process will return you back to the prompt but a sub-process is
> +still sampling in the background. Unless this finished, you will not find a
> +result file in the current or specified directory. Please also note that
> +currently this sub-process is not killable! For the above example, we will then
> +need to trigger I2C communication:
> +
> +    i2cdetect -y -r <your bus number>
> +
> +Result is a .sr file to be consumed with PulseView from the free Sigrok project. It is
> +a zip file which also contains the binary sample data which may be consumed by others.
> +The filename is the logic analyzer instance name plus a since-epoch timestamp.


thanks.
-- 
~Randy

