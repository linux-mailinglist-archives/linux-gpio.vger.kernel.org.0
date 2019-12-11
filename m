Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F2911BA5C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 18:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730010AbfLKRcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 12:32:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57437 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728265AbfLKRcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 12:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576085560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y12wlbSvkuEx6hrDq4ife4K7ITZLnh8SGNBP1jLgnxg=;
        b=imPvHEEkbA9jPkPnT/Hk3dDk494brYNKFWr+REXeuEA/bkJDobyKPrajgXLTDbtG6FUV6b
        0YBo/SCWH+Ldb2UDHFjUXNHnM+kcavgcrQ/ZQFpSKwIEA9199itAbbir3miOuu8DiJMs8v
        6VlBdrvgC2t0j4Eiuy5Z63jj9syEk0U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-vjIrn0SwPOqy03yncSlkvA-1; Wed, 11 Dec 2019 12:32:39 -0500
X-MC-Unique: vjIrn0SwPOqy03yncSlkvA-1
Received: by mail-wr1-f72.google.com with SMTP id d8so10651031wrq.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 09:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y12wlbSvkuEx6hrDq4ife4K7ITZLnh8SGNBP1jLgnxg=;
        b=TxGa8aN9XE60Qm2CMgSwrgPosMsBsHFG0ud1X6p134R285B2RdZ8I0/3ItWN2rbCPg
         b1XRRSsypoSUTL++xHoYubGKsJwnbIv9OcYjl4XWPrIDLnIU0qfBTwEpZIHH/5O/ZjKf
         hJnL5AUW85H5oezIJ9frhEp8BkScYzqGLdkaBPD66NNVKaxD4tN4wHQaFuYkeu+8lMsc
         DSzaTu6KD/N168Q/3OPu9Bakynq7ap+Fk+1zVnL+oz58XAXELEx9xyYRCLhOJdKcmtmW
         lV9Euctt0T652Xb1OyUAle4RSWplUarYEVWzGO9K1q88ttNLnKvay2g8Um9bL0hiY6mr
         R9Dw==
X-Gm-Message-State: APjAAAWA82KuSKkXitdXiPYGxjvIG6esXQu8k9UxZFLT8NvahZtZhkRY
        6OeB/4/iseRZhexrvhlIkylEbbOTwn0GlMOWIW8dHhZ8MAR248qMyFM/akTDIe9XCjgc2S8lbTU
        jHDIQk/GMXvYqA5sEku7ECw==
X-Received: by 2002:adf:df90:: with SMTP id z16mr1036610wrl.273.1576085558006;
        Wed, 11 Dec 2019 09:32:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJNDISSzLaekbps4PPe/Y5SFMhSF7OjIT8TamyAaUOOzgveUOLSuGFFwaNrhfYHhJrY6DB/A==
X-Received: by 2002:adf:df90:: with SMTP id z16mr1036575wrl.273.1576085557720;
        Wed, 11 Dec 2019 09:32:37 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id o185sm2736280wmb.40.2019.12.11.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 09:32:37 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20191129185836.2789-1-hdegoede@redhat.com>
 <20191129185836.2789-3-hdegoede@redhat.com>
 <CACRpkdbRb-LF2tNN-ueo=tKuJc+u4B7Y20+BCyqnN7wYbm8y7Q@mail.gmail.com>
 <87wobfj65b.fsf@intel.com> <47c36b75-bc30-502b-7f8d-035cf2348fc4@redhat.com>
 <CACRpkdaJGZsJpYu3cgQCeWuJD1y9CQyzuk_VYfGfAT8WC=_1VA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4bc1d1ac-b3c7-4ea5-9150-bc1b9cffb963@redhat.com>
Date:   Wed, 11 Dec 2019 18:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaJGZsJpYu3cgQCeWuJD1y9CQyzuk_VYfGfAT8WC=_1VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11-12-2019 01:24, Linus Walleij wrote:
> On Mon, Dec 2, 2019 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> There is only one problem, currently is is not possible to
>> unregister a mapping added with pinctrl_register_mappings
>> and the i915 driver is typically a module which can be unloaded
>> and I believe actually is unloaded as part of the i915 CI.
>>
>> pinctrl_register_mappings copies the passed in mapping, but
>> it is a shallow copy, so it contains pointers to the modules
>> const segment and we do not want to re-add another copy of
>> the mapping when the module loads a second time.
>>
>> Fixing this is easy though, there already is a pinctrl_unregister_map()
>> function, we just need to export it so that the i915 driver can
>> remove the mapping when it is unbound.
>>
>> Linus would exporting this function be ok with you?
> 
> Yep!
> 
>> Linus, question what is the purpose of the "dupping" / shallow
>> copying of the argument passed to pinctrl_register_map ?
> 
> The initial commit contained this comment later removed:
> 
> +       /*
> +        * Make a copy of the map array - string pointers will end up in the
> +        * kernel const section anyway so these do not need to be deep copied.
> +        */
> 
> The use was to free up memory for platforms using boardfiles
> with a gazillion variants and huge pin control tables, so these
> could be marked  __initdata and discarded after boot.
> As the strings would anyway stay around we didn't need to
> deep copy.
> 
> See for example in arch/arm/mach-u300/core.c
> static struct pinctrl_map __initdata u300_pinmux_map[]
> 
>> Since
>> it is shallow the mem for any pointers contained within there need
>> to be kept around by the caller, so why not let the caller keep
>> the pinctrl_map struct itself around too?
> 
> So the strings will be kept around because the kernel can't get
> rid of strings. (Yeah it is silly, should haven been fixed ages
> ago, but not by me, haha :)
> 
>> If we are going to export pinctrl_unregister_map() we need to make it
>> do the right thing for dupped maps too, we can just store the dup flag
>> in struct pinctrl_maps. So this is easy, but I wonder if we cannot
>> get rid of the dupping all together ?
> 
> Maybe ... I don't know. What do you think? I suppose you could
> make u300 crash if you do that.

I've prepared a patch which makes pinctrl_register_mappings remember
if the mapping is dupped or not (store the dup value in struct pinctrl_maps);
and which modifies pinctrl_unregister_map() to do the right thing
depending on the stored dup value.

I still need to test the new series and then I will post it.

Regards,

Hans

