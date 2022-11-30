Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E3363DA4C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiK3QNi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiK3QNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031D981D99
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669824745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVZppsKA0ZkKrWi0UQJ3nN97bBOZR3Uq+VmhTSXYrAc=;
        b=N8lhZELnm8Np3KMjwPA9i8Mi9hrohHrSorM4WxGNov9Bts/qpVHKku3l5Rh2CuMH1d86cF
        hBf/Y7OW0mOcJK/Nn9FIrDkdSYDqHKcoPQ673Qg8n6LRladGlKfklS4cD43mBu0Iq9nFeb
        IvNLmw+oU2b2JdEjv4tnd4QwMDL9Sjg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-r3mdvMpMM-Oa0QoSp6Z5HQ-1; Wed, 30 Nov 2022 11:12:22 -0500
X-MC-Unique: r3mdvMpMM-Oa0QoSp6Z5HQ-1
Received: by mail-ej1-f70.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so8847888ejc.15
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVZppsKA0ZkKrWi0UQJ3nN97bBOZR3Uq+VmhTSXYrAc=;
        b=0oy4e4f+RMn1XtXbd8I7xSoJQadCPiF9V7hiXM8EWuJJk+4xgh/fANRwhkc4Rt3O1c
         OvTNiqj/ulR4+JWNHlrIoTUWHbnEXJyxEnM4WqyRQcYmHY8s9O1ovzxDqhFyfFvbuh8p
         yUXQ4xNwQ5Rh3sgT+coD59/Sv3+yUPs3bdWj7oHDsyY8JHHyhKhGkxYh1uEqosca1wQt
         4l2uAjvxsLRSVubTouUTKGBsG3/src1AZMFL3YwM4rk9FSEN58SeGZ7rUNRFJY8qBq+3
         N3G5OK3xMa/JuAIGMd3kecNchfbyZBVVZDw23cRDdryZTqC6h8dyTAVXdssR3uErhn2f
         X5qg==
X-Gm-Message-State: ANoB5pld6avEGjdrYCVEMDINxSSnaptNceDiAVmzu5g3/xjfIktbCjoy
        tWmt993lpCUvd6USUTTKeXElMitftt4JFkSZ3SL2pnWEBn2ZNg5wGI0skN+kSi+17Ju3W99kIQ+
        KBid2XpghmpNMjenq+k2kIQ==
X-Received: by 2002:a05:6402:2b8a:b0:46b:2979:7397 with SMTP id fj10-20020a0564022b8a00b0046b29797397mr14524414edb.332.1669824735437;
        Wed, 30 Nov 2022 08:12:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6if3Kc2Cj0h+P6TmrYnaFX5IltT1cl7CIO76VkItJB2JB2khb5ke+7EhgOoPjv45ky0ZvgCw==
X-Received: by 2002:a05:6402:2b8a:b0:46b:2979:7397 with SMTP id fj10-20020a0564022b8a00b0046b29797397mr14524389edb.332.1669824735178;
        Wed, 30 Nov 2022 08:12:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007ae4717bef1sm816567ejc.15.2022.11.30.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:12:14 -0800 (PST)
Message-ID: <8a53e88b-1e74-bf34-62a1-780a1b29bcbc@redhat.com>
Date:   Wed, 30 Nov 2022 17:12:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/30/22 16:55, Andy Shevchenko wrote:
> The ->get() callback depending on other settings and hardware support
> may return different values, while the line outside the chip is kept
> in the same state. Let's discuss that in the documentation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/driver-api/gpio/driver.rst | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index bf6319cc531b..3d2f36001a7a 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -251,6 +251,30 @@ supports more versatile control over electrical properties and can handle
>  different pull-up or pull-down resistance values.
>  
>  
> +Considerations of the ->get() returned value
> +--------------------------------------------
> +
> +Due to different possible electrical configurations and software applications
> +the value that ->get() callback returns may vary depending on the other settings.
> +This will allow to use pins in the I2C emulation mode or other not so standard
> +uses.
> +
> +The below table gathered the most used cases.
> +
> +==========  ==========  ===============  =======================
> +  Input       Output         State        What value to return?
> +==========  ==========  ===============  =======================
> + Disabled    Disabled    Hi-Z             input buffer
> + Disabled    OS/OD/etc   Single ended     [cached] output buffer

You need to clarify what single-ended means here. You mean a pin
which is only capable of output I guess ?  So now way to figure
out if another participant in the OS/OD bus has its transistor
in the "on" state this pulling the bus high / low agains the bias
resistor(s) which determine the state of the bus in rest ?

Or you mean that the bus is uni-directional, even then being
able to detect a short-circuit is useful.

> +    x        Push-Pull   Out              [cached] output buffer

Why, most GPIO drivers are protected against short-circuit to
GND / Vdd and actually reading the input-buffer here will allow
GPIO API consumers to detect such short-circuits if they are
interested in this.  This would e.g. be useful to detect
mis-wiring on devices like the Raspberry Pi were users often
connect extra peripherals through breadboards.

IMHO for pins with an input buffer get() should simply
always return the contents of the input buffer. This is what
I believe almost all GPIO drivers currently do and also
keeps the get() methods KISS.

Actually implementing the behavior you suggest here requires
the get() method to differentiate between push-pull and
other mode. This makes the get() method implementation
needlessly complicated and will likely be a source of bugs
as people will get this wrong in some cases and people
will very likely not test all possible combinations from
this big table you are adding here.

IHMO the rules for get() should simply be:

1. Device has an input buffer:
   Return input-buffer value for the pin.

2. Devices does not have an input buffer:
   Return last set output-buffer value

Regards,

Hans




> + Enabled     Disabled    In               input buffer
> + Enabled     OS/OD/etc   Bidirectional    input buffer
> +==========  ==========  ===============  =======================
> +
> +The [cached] here is used in a broader sense: either pure software cache, or
> +read back value from the GPIO output buffer (not all hardware support that).
> +
> +
>  GPIO drivers providing IRQs
>  ===========================
>  

