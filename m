Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D47229420
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgGVI4b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:56:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34309 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729217AbgGVI4a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jul 2020 04:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595408189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vkKf5C1Z1oVLTHEanbHWInj2gBncKHeaq5hsgkkKCNw=;
        b=eNUX1N3Mn8EfDK+8YQKHx3wj0+J4r3lxVB+PUlHPafWSiqpI9kBGQnGELbD24LyfwXeaw0
        RgoAsnIeArx0GvZJmV6M39/2HvsxF7g7L96xlwEGFxDlNZUn02Dtuam5NUwD4lqeXBQm6g
        r6BhED5cxAowv8Yy3/TbEJv+dzvdXCA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-q-2cyKd_N_m-Ot_la-O0cw-1; Wed, 22 Jul 2020 04:56:27 -0400
X-MC-Unique: q-2cyKd_N_m-Ot_la-O0cw-1
Received: by mail-ed1-f69.google.com with SMTP id m12so517614edv.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vkKf5C1Z1oVLTHEanbHWInj2gBncKHeaq5hsgkkKCNw=;
        b=RKq7tDTRflUJIbvHKfT0c1FNUB93M3Wsw5HQ52ieFQnHL9PnEPQtnF3GlEf4GemdLD
         A5Ck2hZ10E9H8kt/+IbqePDwSq1obr1n9WQGoYeQOw7LW6wsESsyYw0sC3S53WyU+EC8
         XvkXiLzAGYOrJbfZI4OMzmG2vN3X/qsyUWi0G2PbqydSv2ByKNm7r1oNhEcXnVRUxJtF
         GYaVUI/PUs49QQTfcho+6VE6xpgG09luVtadEErCsna7/AUsmFGIZ/r/U/Ci4Dk+A1en
         sdaD3gfugamdaMCZtTixPuA/Zev+Dyqs3DdyjPd2JVAdmBr1TW7mDVm5tjlz5xHJ10Kh
         nRJw==
X-Gm-Message-State: AOAM531VcgueWtBOvy75QsQtrl04SNE02HqTyd+xy4cjlsID6qmwY2PD
        Utti/fYwsCFoU4z9DRGXEFXwuZ7mAMto5fbhAl2TAuWgRX0HtDwrs+kmKzlszsMLHHtXLb7q8kM
        T9/dhif0C3ZOLOlHb7FqoDA==
X-Received: by 2002:a17:907:1059:: with SMTP id oy25mr30988974ejb.90.1595408186202;
        Wed, 22 Jul 2020 01:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUeDmne1kEsB8K8AfqPWHghglAiXGkX9bO4TcJ0jtvupI8IuIqTuixe3XB8BaW4G1mBR45MA==
X-Received: by 2002:a17:907:1059:: with SMTP id oy25mr30988963ejb.90.1595408185961;
        Wed, 22 Jul 2020 01:56:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l6sm18913420edr.39.2020.07.22.01.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 01:56:25 -0700 (PDT)
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20200721140153.369171-1-linus.walleij@linaro.org>
 <20200721153936.GL3703480@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f8c609a2-30cf-dd4b-c956-1d90af9cdf02@redhat.com>
Date:   Wed, 22 Jul 2020 10:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721153936.GL3703480@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/21/20 5:39 PM, Andy Shevchenko wrote:
> On Tue, Jul 21, 2020 at 04:01:53PM +0200, Linus Walleij wrote:
>> This makes the driver use the irqchip template to assign
>> properties to the gpio_irq_chip instead of using the
>> explicit calls to gpiochip_irqchip_add_nested() and
>> gpiochip_set_nested_irqchip(). The irqchip is instead
>> added while adding the gpiochip.
> 
> Took this version instead.
> 
> I dunno if Hans can come with some comments / testing results, I would like to
> send a PR today or tomorrow.

Sorry for being a bit slow with testing this.

I've given this patch a test-run on a machine with the
PMIC the driver is for and with the caveat that I've not
actually tested the GPIO IRQ functionality, since that
does not seem to be used on any machines, I see no adverse
side effects from this patch, so it is:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

