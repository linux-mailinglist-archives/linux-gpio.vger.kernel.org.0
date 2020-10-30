Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2507429FCDA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 05:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ3E7E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 00:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJ3E7D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 00:59:03 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B28C0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 21:59:03 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 10so4234895pfp.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 21:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OT/E1UmEcZKYphJk5pz+xdil9P/tggfLbV4uIxXmL3g=;
        b=K7qNnGev0ev1hlrMJD+dBlHuS31+Qll13RHDCMS/5ZwYWTLuLfnxxDrv00KVRDnpqK
         z76cEkzqPWYrD0fjIZsl8rwhxMQ3vwl9tpyFdUiQ3ZD4sY2xaQmzuw7lLEBiH4Zg6KMH
         KE0tV1aud6r0ISrUccs7DdT9OM154HPoqTk/BvfESpvcnU9Kc02T7op90fdQAElFO4y/
         XnanwZAPsk4SvOLmlertQKLgtiah8W4rDFG+kOXiaUVryxA+NwKz4KEtTsbsboPs/Wq9
         BKR7Yigqt+tG8kJRvJSz78gnuW6v8z3QKVW+I9J3dNUuUy51XIzKYCeTItsCqyjkGa2X
         ukQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OT/E1UmEcZKYphJk5pz+xdil9P/tggfLbV4uIxXmL3g=;
        b=qvixYpaBnpssvaKB89QEG/Izf3jQUTw8CKkvjBZoTHDKAjr2gC0auh5XjM2IBMLRLJ
         IA4FlAfp+LojgYprjvnK1Q1fZVhnf0aUaZMCeOdzLsdDLA93+V03YI35ROWZgT/fbDcM
         lB1LoSPsCUPY+1g3xsjuH6KIhi8IM8Sc+rcnlqfblg3izOk8k52or70wSUGSEa9Xp8wf
         ROELYxfm3CCYOwozaN0XcgkNNDBsH2Pvia6YxlP/oqruf3OR5DPdPmcWg9d/z27cEjCx
         Nc+Tab0Y6WSNL7wJRpnBCOc9yIfQ+C5qyyVrS3CKcR02Jglta8KniEX0yHCl2l/GN2eK
         0EMg==
X-Gm-Message-State: AOAM5338pQiWE75EAsat2/3iHJJcDXVNrOofyqUiNf4c/x3ujFd2OJfe
        nidIY2DGEjjio//dM+lgHXLMWaFvmlbA5kWO
X-Google-Smtp-Source: ABdhPJxpkOUXta4+RBSDn1XAflnQtyhivdOK+wEhrWE1UkWCTK05PfqyE44KWJJwO8ks8R1VI0zz3w==
X-Received: by 2002:a62:168a:0:b029:160:193d:b278 with SMTP id 132-20020a62168a0000b0290160193db278mr7693656pfw.48.1604033943184;
        Thu, 29 Oct 2020 21:59:03 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id y13sm4440450pfl.166.2020.10.29.21.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 21:59:02 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 30 Oct 2020 12:58:39 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
Message-ID: <20201030045839.odjzwlh46zpmqtng@Rk>
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <CAHp75VeGs6v7EKfQ30YPf8gUE+fftUP3V8HRif7P9xs1wkXcKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VeGs6v7EKfQ30YPf8gUE+fftUP3V8HRif7P9xs1wkXcKg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 11:52:14AM +0200, Andy Shevchenko wrote:
>On Tue, Oct 27, 2020 at 2:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi Hans and Linus,
>>
>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>> Interrupt Connection Resource Descriptor as disabling debouncing
>> filter?
>>
>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>
>According to the spec
>
>DebounceTimeout is an optional argument specifying the debounce wait
>time, in hundredths of
>milliseconds. The bit field name _DBT is automatically created to
>refer to this portion of the resource
>descriptor.
>
>I interpret this as 0 == no debounce (or a minimum that hardware has
>if there is no possibility to disable).

Thanks for the explanation!
>
>> I'm not sure if Windows' implementation is the de facto standard like
>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>> can fix this touchpad issue and potentially some related issues by
>> implementing the feature of supporting configuring debounce timeout in
>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>> What do you think?
>>
>> A favorable evidence is I've collected five DSDT tables when
>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>> an non-zero debounce timeout value for the edge type irq and for all
>> the level type irq, the debounce timeout is set to 0x0000.
>
>To the future mails: please, do not top-post.
>And please remove a huge amount of unrelated lines in the reply.
>
Thank you for the suggestion!
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby
