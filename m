Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C14E35BB89A
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 16:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiIQOA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 10:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiIQOA6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 10:00:58 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8605727DD0;
        Sat, 17 Sep 2022 07:00:54 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4MVCJd19r6z9sSl;
        Sat, 17 Sep 2022 16:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1663423249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6DcmRe0LF0MU+4e2ppiRLqDmTlbfSLqTxFtL2uF+s9U=;
        b=B6D7zWPq4RveuzvhLcn58lD/iQM9co7uL0yfSGedLxZ4d2HlF0oP7IRi02oYHih7I9vfIZ
        IKKpk8LIVOqCmtG8FxXG9QqMB7PcdJ/b9n6H7ely6Pxh5l5/Ro6kjXQAxJYdR8o3/rmizh
        mVaCzJk9GaDK9lwI1enWKwHMeT80+UD9xFzAxv41yk8BmuJ37Jhwaa1A+4WpeDlhOB9rOV
        Ucz5kkDBYPKZ4MDspUqpOG3GnnbdAiaqU7Bunr1+iGM4doEcvxUUypcQeuM2+3E+AuPT6u
        DRryxn97n2D3VT/VlWWweoNlyH5R1CzJkgsnQ9YzZ88sD5aU910OuBKXgPGcaw==
Message-ID: <d756107b-5cc5-53ba-b420-d4664e3a9bb7@gorani.run>
Date:   Sat, 17 Sep 2022 23:00:40 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
 <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
From:   Sungbo Eo <mans0n@gorani.run>
In-Reply-To: <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for the update.
I was thinking I should reply to your patch in the last month, but I was
a little busy at the time and I forgot to do so...

On 2022-09-15 20:48, Shubhrajyoti Datta wrote:
> slg7xl45106 is a I2C GPO expander.
> Add a compatible string for the same. Also update the
> driver to write and read from it.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> v2:
> Use platform data insted of compatible

Moving the command property into the new platform structure is nice.
And please add more description about the device in the commit message.
We don't even know the full name of the vendor from your patch.
I like the older version of your patch in that perspective.
https://lore.kernel.org/all/1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com/
And a link to the device datasheet would be also nice (if possible).

> 
>  drivers/gpio/gpio-pca9570.c | 39 +++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)

And I was also thinking that tpic2810 driver might be more appropriate
then this pca9570 driver for a device with one command byte.
Actually I had forked tpic2810 to create pca9570 to support a device
without any command byte.
Come to think of it, the two drivers may even be consolidated into a
single generic one... What do you think?

Thanks,
Sungbo
