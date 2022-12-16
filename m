Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B4764EE41
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 16:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiLPPyC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 10:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbiLPPxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 10:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0096F0E9
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 07:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671205957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4e34CNHCsWFD7B+Us3y8CmVn17rfdvEA/dBGFbJ5AwU=;
        b=Co/WVElhTBNFetN6RoaNPrBe4MfmTghwpofsz2xD/y16Ytfl4LYv83o0YoQ1xvcLNdaWTq
        5ZcLlV4kqogd+YicSQL4haD5pZrVB8F2VdWCdHzGGlVkx5W2EkPggwicUALBNdS2RAj67J
        8GQIIrKuwU0j/hCIW4ZRuTEIGNkbL+U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-lQMedSToN92-pGx-uhg-_A-1; Fri, 16 Dec 2022 10:52:36 -0500
X-MC-Unique: lQMedSToN92-pGx-uhg-_A-1
Received: by mail-ej1-f69.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7so2101759ejc.20
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 07:52:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4e34CNHCsWFD7B+Us3y8CmVn17rfdvEA/dBGFbJ5AwU=;
        b=CmlNuXcy6UFAHVvScUEDjdW5PguhwWJW62gXNa07/7qmyRvZxbnZYwmlSsOp9IWNIl
         oZ0Rz69bFEpfKx/pPnfxq8EQ5TIbS2sZbEsMqDoFI3xFgilCiXC5faFgz2GWdeDjBAXf
         +SnpIMUFp7DVFyL3S0pAiqFPQeTtKYrzfYMzmu0NlwLLrsAE8ca/K2fnVgpKKldg2mZV
         nK4MBg1aJgs6du3t9pI2SR83WPnOa3n+eXKQYLqYKL5Y4gJGEfNp1fwPpxvM0/3eMufP
         FGcjug2iL5Ax0il2LZIFqYT6u5bU1VURjAgUvVb6KItLJ/nAtbbH7oA8odSHekI3zzbP
         k5vA==
X-Gm-Message-State: AFqh2krI/IhWuOGvAjqXqmRPIxNW4R72bVJZza3JhgZI4X27eT1ADiIv
        b4enS7bmubn/valsj+PdG1p/7Oky9Ywsmyjqo708Eq97aKqEasDb4po+UExv4WhGta8WW7/CmK/
        GHCeSE6EjGaEDHvFovNG85g==
X-Received: by 2002:a17:906:4ccc:b0:7aa:7598:128c with SMTP id q12-20020a1709064ccc00b007aa7598128cmr2775236ejt.37.1671205955222;
        Fri, 16 Dec 2022 07:52:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvyWTgGteDkvAr/0x5IdZx6K6SEQrMj7L6z3T0/VFD2ajwRyYwp+RMubECIDDut854nbfoMXQ==
X-Received: by 2002:a17:906:4ccc:b0:7aa:7598:128c with SMTP id q12-20020a1709064ccc00b007aa7598128cmr2775219ejt.37.1671205955042;
        Fri, 16 Dec 2022 07:52:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id w5-20020a17090652c500b007c4fbb79535sm976419ejn.82.2022.12.16.07.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:52:34 -0800 (PST)
Message-ID: <d2c93d0a-9c89-7b3f-4cd0-b49dc8fac911@redhat.com>
Date:   Fri, 16 Dec 2022 16:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 03/11] leds: led-class: Add __of_led_get() helper
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-4-hdegoede@redhat.com>
 <Y5x3smYGNoIOkc+o@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x3smYGNoIOkc+o@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 14:50, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:05PM +0100, Hans de Goede wrote:
>> Turn of_led_get() into a more generic __of_led_get() helper function,
>> which can lookup LEDs in devicetree by either name or index.
> 
> ...
> 
>> +	/*
>> +	 * For named LEDs, first look up the name in the "leds-names" property.
>> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
>> +	 */
>> +	if (name)
>> +		index = of_property_match_string(np, "leds-names", name);
> 
> I can't find this property anywhere in the kernel. Is it new?

Yes and no, adding a foo-names property for foo[] arrays to be
able to get members by name is a standard template for devicetree
bindings. See e.g. the clock bindings:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml

> If so, where is the bindings?

As for why not document this, there are currently no devicetree users
and the devicetree maintainers have repeatedly let me know not to
submit new bindings for fwnode x86 bindings ...

> And why entire code can't be converted
> to use fwnode for this case?

This is a trivial change to allow the new functions to work
with devicetree. Note this series does not introduce any devicetree
users, hence no bindings. But it is good to have compatibility backed in
from day 1.

Converting to fwnode APIs would be more involved and I cannot test
those changes.

Regards,

Hans

