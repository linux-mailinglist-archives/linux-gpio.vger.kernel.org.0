Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E092848ACE5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 12:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238706AbiAKLqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 06:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22580 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238505AbiAKLqU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 06:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641901579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RzuBgljlPMxvVkB0baeQwY9PJZw8EqXemDkfwx+V21A=;
        b=QpgonbI7qfxt7EcVSAcDsbdk+lA2WiXaLA1TTzVHlUCnu2qixmkMz8gc0rNE4fS2tv8GkW
        cyMKCcmlCQMsSVKuFkJ+rPYFaJ3uXOtbYJBo9ifuOD+6LuNdOEGdznwQQk3NzMj4JCk1uK
        pM1BQMdWRvMAkYuurmg2koAr5fEJ2Jc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-NBoVNMYJODeMTUiIQNz1Fw-1; Tue, 11 Jan 2022 06:46:18 -0500
X-MC-Unique: NBoVNMYJODeMTUiIQNz1Fw-1
Received: by mail-ed1-f69.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso5049262ede.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RzuBgljlPMxvVkB0baeQwY9PJZw8EqXemDkfwx+V21A=;
        b=lyQS6dD3ZoXKHoxd/a0Q37mjrANYfTEtNGDUB07xQT6awgM2vmVhzVJcktoXstC5rL
         tEWn8B2y/Ic8CKPTHicYlpPllWFXPmGLWgy3LOGqCBAuoPK8huVn1WkluoCUczfi6gGs
         jnHtKy4J6c0HZ9Fc9Y7n1xtGLOcs970j8gnSWwsimNyZa2DUpnOHdidknhgu+kY+TBj2
         14kxpQL5B3iNhAb3mo8mzkEU0QSuPTjg3oPsbPZAf/Lpfyu/2Oy7gHWFf9tMnWhts5VV
         rmXWxyxH9cw0PN8cT+D7YndQuxg/+VLpFumRiUGHE8XAKKNFS0NgRe/PvfrsYogDUK0q
         6KAQ==
X-Gm-Message-State: AOAM531FNx8DjT4UtwU4Uwx3L0haUMJUZQT8vzBuKgn63yOXOb+5owKz
        52T65I4EfEdMRv9TgVKtcpGSwKd4nlIkGJYpFhMVE5wBMplEzO8ofRu+EWrPCyph3S1yg9C5QAO
        xX7A/DxbY8EfbXwBaPoq67Q==
X-Received: by 2002:a05:6402:14f:: with SMTP id s15mr3921750edu.118.1641901577081;
        Tue, 11 Jan 2022 03:46:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws87UF8esr8l6TmOLBBU3sGoSNFTH92DcHwwCzd5szm8rakM4iAM1IipqI9wBTbKwSWofbVA==
X-Received: by 2002:a05:6402:14f:: with SMTP id s15mr3921745edu.118.1641901576942;
        Tue, 11 Jan 2022 03:46:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l16sm5031362edb.3.2022.01.11.03.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:46:16 -0800 (PST)
Message-ID: <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
Date:   Tue, 11 Jan 2022 12:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220111105632.219581-1-hdegoede@redhat.com>
 <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/11/22 12:31, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
>> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
>> itself gets instantiated by a special MFD driver from
>> drivers/platform/x86/intel/int3472/tps68470.c
>>
>> This MFD driver itself can be built as a module, so it makes no sense to
>> force the gpio-tps68470 driver to always be built-in.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
>> Changes in v2:
>> - Fix some spelling errors in the commit msg
>> - Remove blank line between tps68470_gpio_driver decleration and
>>   module_platform_driver(tps68470_gpio_driver)
> 
> It used to be 2 patches in the series, are you going to send another one
> separately?

Ah right, I forgot this was a series. The other one had no review comments,
so v1 is still valid, you can find it here:

https://lore.kernel.org/linux-gpio/20211225120026.95268-2-hdegoede@redhat.com/

Regards,

Hans


