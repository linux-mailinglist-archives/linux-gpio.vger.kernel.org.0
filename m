Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A01C287A2B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 18:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731257AbgJHQkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 12:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731278AbgJHQku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 12:40:50 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93A1C061755
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 09:40:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r21so1418988pgj.5
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V9TRh62h9HdQNNSNYLmhb1iwaCtZPdrpFvSLIPnpgFw=;
        b=IoddpZF+Q0v3oM/wI9Y5nlRoM3cRCP4LzVs8LMws6td7xCM/bmGl6HW0vQoTuPYVUV
         5pS4cbjlfLDHMsiXG1AjB1/z8J1P6UNoPtoSJjHYtJXAi/4ict91aNhethEJoOGvELYw
         IJX5+ESbuPDMl978xqLF85TQh/n7WS2s3dmeL+ruHVnCFxEN6tfIYgY//SZJjUaHBpBM
         ZG25HB8cvVk0iQZCbEkmO0UCmZI7Fut06LC69JYedpetx6SWqBw72zoIv1zRMMokOzoY
         WeoKd/0SpB8iPibcsP6PUrObMDWc7d16+XXrpevfAIW5FcYzO1R7EYZkbkK0hNpyjSth
         K+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V9TRh62h9HdQNNSNYLmhb1iwaCtZPdrpFvSLIPnpgFw=;
        b=KTC6VFoQnwZyLjRH6ha2R8yCnB5n2XcDmaAOH5ggyfMHZrhW5FJtBKsU7BVT+EURFt
         WCO40rG1K88YKRNiPRMAi0wEx5gWOuBveZDSBR97H3CiE4hTOA4L+ADeHILMxtD12/+5
         ENBqHMx5rw/IK9BfRnv3mHShv+RUl8k/QUvyiXjQriruWT4aXcNmeexK+aCTBGLjHSGp
         VkmBbSTyRMcl6bIgsaDtt0fnn/jbnx3eTMUa4GhgQmZUNVEf7iI4S2v5eMkAg69Q6kqB
         R+bF8+hJbJX36Ovaaa/t4y8YlWOBl1yGcO19KmCjc3Ttuaq4FfIrbIsPVWibg7WY0nTg
         IQAg==
X-Gm-Message-State: AOAM530DUdm86dxbjRsy8ypwR/VpiFIChuIPSXcmF5M7ZKOCIxzVHp+E
        Y4MCsucIhz4FOZzITaMVrIY=
X-Google-Smtp-Source: ABdhPJw9/0x/HeWz/GXCP3piILInsg/8yRIxMsaiiwccSlixm+/51iy0TeVixCWYUGJv953oLfFC8w==
X-Received: by 2002:a17:90b:490:: with SMTP id bh16mr8898736pjb.214.1602175249409;
        Thu, 08 Oct 2020 09:40:49 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id g129sm7952703pfb.9.2020.10.08.09.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 09:40:48 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 9 Oct 2020 00:40:41 +0800
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201008164041.7nidwia2jzfgrcon@Rk>
References: <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 06, 2020 at 11:16:50AM +0200, Linus Walleij wrote:
>On Tue, Oct 6, 2020 at 10:32 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
>> Disabling the glitch filter works like a charm! Other enthusiastic
>> Linux users who have been troubled by this issue for months would
>> also feel great to know this small tweaking could bring their
>> touchpad back to life:) Thank you!
>
>Oh you found the bug :D
>

The credit should goes to Hans. Thanks to his expertise, only
one shot (disabling glitch filter) is needed. Thank you for
introducing him to me:)

>> $ git diff
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index 9a760f5cd7ed..e786d779d6c8 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>                  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>                  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>                  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>> +               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>                  irq_set_handler_locked(d, handle_level_irq);
>>                  break;
>>
>> I will learn more about the glitch filter and the implementation of
>> pinctrl and see if I can disable glitch filter only for this touchpad.
>
>Yes we certainly need a quirk for this of some kind, examine the ACPI
>quirk infrastructure in drivers/gpio/gpiolib-acpi.c to see if you can use
>that to handle this.
>

Thank you for pointing out where I should look at! A quirk is the only
foolproof way before we confirm the other two suggestions given by Hans.

>Yours,
>Linus Walleij

--
Best regards,
Coiby
