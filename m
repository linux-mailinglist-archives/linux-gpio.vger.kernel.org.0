Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B2E120715
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 14:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfLPNZc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 08:25:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54556 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727877AbfLPNZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 08:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576502731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uRdDoSIR5AtO5m9cdoh24W2ysjI5Q/CXritZrr/9PAw=;
        b=GAO/qrxOVitZW/0UmM/KDj9b9ePlD6qf8cCOSGoO5/8+H5/1q5Z7WhWN+brHyjHiis+xyf
        wxtSr7MetoO47QZyFsWkyXbwV5bbLkxYoxFq+c6VvAMQvMlMLoCfsh0xRnyGDXrN+rTLEV
        O8YnsaMIz+Dwe/C+OTjjpftwwe1npMU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-4GlvgJO5NFChboz1b2CG6Q-1; Mon, 16 Dec 2019 08:25:29 -0500
X-MC-Unique: 4GlvgJO5NFChboz1b2CG6Q-1
Received: by mail-wm1-f69.google.com with SMTP id v12so410805wmj.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 05:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uRdDoSIR5AtO5m9cdoh24W2ysjI5Q/CXritZrr/9PAw=;
        b=tgOXySDY0OCOsimRnUIPCJ2uAZv8UrMpTvvTgNooWsx+/E23cvz2ahrFsWSsR4Z+IN
         7RZY+jI+uEIV3letFC9kLdlX4WY0NIbDSnpGCLHLN1VjfLsCPbl6MqZd94l3FQnRe0BI
         3v67wjfsBUADb6MQRnXc5TOMy3f/7A6nqPVik4j3aoWj24khozGNrsqN1UHmECZWYW4R
         zxXiqXlZrWmvYTzcr6668+oUohIg6YlJ8fCK988NN0y8Rwunq7Yl9YdKydVa56IHMpSJ
         JYcrWuUHY2uo5ojJLompf8CUQ4T4w4/nZHVhnHF7qHgkhEr/d4EkwV+CjnKrqdY22uXh
         zh7Q==
X-Gm-Message-State: APjAAAUf/cRjNCsjJXnL57Ft0qxGdQWtVvjX1snbE7WK1UdPZ6TxAE8h
        OvAQHZOIA3IECh/CGsqRD6Wh4C4qKBFL7MHcHMP1Jbkj/RB3OIfDhZtwtBgmGJN7ciFHhdpbW61
        r4Z/ldri1jJKYI1+XUiyirw==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr29618647wrv.197.1576502727648;
        Mon, 16 Dec 2019 05:25:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4OV/uMjHjWFkzOaNCoPh9pj0FgIpenm2MmRU4IcHuC2XwF2EWIH1IgvkhnbCC8jhwu7H/vw==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr29618624wrv.197.1576502727472;
        Mon, 16 Dec 2019 05:25:27 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id m3sm21622971wrs.53.2019.12.16.05.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 05:25:26 -0800 (PST)
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
 <1474a983-3e22-d59b-255a-edd3a41f0967@redhat.com>
 <CACRpkdaYgpY=Anem00tPS=HPCD5XUrfWmWjvPkszggnHCpgK2Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <970de91d-5678-1771-3816-bdff8e7e336f@redhat.com>
Date:   Mon, 16 Dec 2019 14:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaYgpY=Anem00tPS=HPCD5XUrfWmWjvPkszggnHCpgK2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 16-12-2019 13:16, Linus Walleij wrote:
> On Mon, Dec 16, 2019 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Ugh, taking one last look at the "pinctrl: Export pinctrl_unregister_mappings"
>> patch it is no good, sorry.
> 
> Ooops!
> 
>> Linus, can you please drop this from your -next ?
> 
> Sure, done.
> 
>> So I see 2 options:
>> 1) Add an orig_map member to maps_node and use that in the comparison,
>> this is IMHO somewhat ugly
>>
>> 2) Add a new pinctrl_register_mappings_no_dup helper and document in
>> pinctrl_unregister_mappings kdoc that it can only be used together
>> with the no_dup variant.
>>
>> I believe that 2 is by far the best option. Linus do you agree or
>> do you have any other suggestions?
> 
> What about (3) look for all calls to pinctrl_register_mappings()
> in the kernel.
> 
> Hey it is 2 places in total:
> arch/arm/mach-u300/core.c:      pinctrl_register_mappings(u300_pinmux_map,
> drivers/pinctrl/cirrus/pinctrl-madera-core.c:           ret =
> pinctrl_register_mappings(pdata->gpio_configs,
> 
> Delete  __initdata from the u300 table, the other one seems
> safe. Fold this into your patch.
> 
> Go with the original idea.

That indeed sounds like a cleaner solution I will prepare a new version of
the patch (and this series for the i915 CI) with this approach.

Thanks & Regards,

Hans

