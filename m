Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0290064EB25
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 13:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiLPMDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 07:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiLPMDN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 07:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8CEE23
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671192143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n0onGUwho42Lk/2Xvrk5LwW7Uvmn5kP1MKjLYRvtQAc=;
        b=YfkboM0nrji9h+OdnuVYJnxrgDmATNw5RBc2d1pEN5qn8+RjBsohTiYmRi5GMv7MdEBDyR
        kAMdDe1us3K2/KLKk+utnfXR6BE14VS+CS0PAd7eJOBuTvz5NJavuo1uI4A0rp4p/ey2Xq
        NRRjke+SFbecEGmhgeOt0SSpCksJuWo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-sPkErCI0MOGAKPDxtkza7Q-1; Fri, 16 Dec 2022 07:02:22 -0500
X-MC-Unique: sPkErCI0MOGAKPDxtkza7Q-1
Received: by mail-ej1-f69.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso1693147ejb.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 04:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0onGUwho42Lk/2Xvrk5LwW7Uvmn5kP1MKjLYRvtQAc=;
        b=YZG9ctKdI/JBXz6eE1Wj8gywkFLPPjftcHA6dvHSlX40uLESDf2L4puXM3GOaXFFi1
         0DOpN0Qzz2j2A0jpWuzs0+6G7NLwkBWQMWmJ8f3PzWd7b4NXLqFLq5IVv1MTWZx34UcQ
         gSKzfA+0MILQ8lMzX6PufQTCNs+NNjbOP/9T+km4bMhgJ3I36uPzaB7L2Wh94/Vqbueu
         yHxZafVPa/0V3ZsdPiWxMlqtTYoc6kup5LIPJ8ZLsXMw/SzADKCNVKJ8SDGFivkHXguG
         O7RjScYQtcH0zh9aQnC0UAyFfoi2fen40gJY01GvhV5lwqplHqOVp7+1SrYBGkkyssgT
         2qug==
X-Gm-Message-State: ANoB5pnBafOtsMteAu0Nia8YMKVcXaQUG/gZe128H6uR+/kQOf2T09y6
        pQcdnbFOom5eJGmLQJMeMZpklZIFSNl3LRfzbO9R37lT1BvEitW7tfbVun2XT772YAPavcflnK4
        y7htPeXPnNQt1OibPq8m/eQ==
X-Received: by 2002:a05:6402:3987:b0:467:e9a5:77c4 with SMTP id fk7-20020a056402398700b00467e9a577c4mr27286764edb.14.1671192141124;
        Fri, 16 Dec 2022 04:02:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4xS5GY2N7ApHCruZzxYhR/KCijYVIin7KMr5Sjan0LxTro5Ol3BiPdKrXUHFjiH/21a3awSg==
X-Received: by 2002:a05:6402:3987:b0:467:e9a5:77c4 with SMTP id fk7-20020a056402398700b00467e9a577c4mr27286737edb.14.1671192140853;
        Fri, 16 Dec 2022 04:02:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id cy28-20020a0564021c9c00b00463597d2c25sm784672edb.74.2022.12.16.04.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:02:20 -0800 (PST)
Message-ID: <6c5867ed-a78e-8919-b34f-560c0773727e@redhat.com>
Date:   Fri, 16 Dec 2022 13:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 00/11] leds: lookup-table support + int3472/media
 privacy LED support
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 12/16/22 12:30, Hans de Goede wrote:
> Hi All,
> 
> Here is my 3th attempt at adjusting the INT3472 code's handling of
> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
> (so that we cannot just tie the LED state to the clk-enable state).
> 
> Due to popular request by multiple people this new version now models
> the privacy LED as a LED class device. This requires being able to
> "tie" the LED class device to a specific camera sensor (some devices
> have multiple sensors + privacy-LEDs).
> 
> Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4
> is a bit of refactoring in preparation for patch 5 which adds
> generic (non devicetree specific) led_get() and devm_led_get() function
> (which will also work with devicetree) and lookup table support to
> allow platform code to add LED class-device <-> consumer-dev,function
> lookups for non devicetree platforms.
> 
> Patch 6 adds generic privacy-LED support to the v4l2-core/v4l2-subdev.c
> code automatically enabling the privacy-LED when s_stream(subdev, 1)
> is called. So that we don't need to privacy-LED code to all the
> camera sensor drivers separately (as requested by Sakari).
> 
> These are all new patches in version 3. Patches 7-11 are patches
> to the platform specific INT3472 code to register privacy-LED class
> devices + lookup table entries for privacy-LEDs described in
> the special INT3472 ACPI nodes found on x86 devices with MIPI
> cameras (+ prep work + some other INT3472 fixes).
> 
> Assuming the LED and media maintainers are happy with the approach
> suggested here (if you are please give your Ack / Reviewed-by) we
> need to talk about how to merge this since patches 6 and 7-11
> depend on the LED subsystem changes. I think it would be best if
> the LED subsystem can provide an immutable branch with patches 1-5
> (on top of 6.2-rc1 once it is out) and then the media folks and I
> can merge that branch and then apply the other patches on top.
> 
> This series has been tested on:
> 
> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
> - Dell Latitude 9420, IPU 6, front: ov01a1s with privacy LED
> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED
>                               back: ov8865 with privacy LED (pled not yet supported)
> 
> Regards,
> 
> Hans

p.s.

I have matching out of tree IPU6 driver changes here:

https://github.com/jwrdegoede/ipu6-drivers/commits/master

once this series has landed these changes will allow using
the out of tree IPU6 driver with an unmodified upstream kernel.

Regards,

Hans



