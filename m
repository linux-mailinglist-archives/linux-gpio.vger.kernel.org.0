Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1891490A3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 23:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgAXWCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 17:02:32 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:46582 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbgAXWCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 17:02:31 -0500
Received: by mail-yw1-f65.google.com with SMTP id u139so1589332ywf.13;
        Fri, 24 Jan 2020 14:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zFiHwuMtp9FCMHuqkYpXxiBeZnK3ss0THxxh5gVFKqY=;
        b=rsX4D5HgnOHy3N9WmIKUTj3WjFlmyBbVt/RTx9u1k1JRhJYhFmoNTG++e+B4gxQGAz
         RZ8YmNDH9IoclhAtofAJjiWnmS+ICguvPY87IRsmnSyviGXPxOeYkkauiUE2drFDmBSJ
         VIqlF0RIN473B7p3st30q5A0QxFcAZfz5bmeTdgv/c79/iI6dEDcEXLbCRKk6JxhOp2B
         9j/7dyR4DVR8QndawAP+FydwJxmC0vyA+QtVE3NH1aTyriY57J3bsNBcbLHzk7VDhwrj
         N4UpdxM+CgIaczQoKNojfqdgJuYCSCh8uDS1yCmu72MWRu4jLF/eAyIFiW9ieDiP3hNj
         ytSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zFiHwuMtp9FCMHuqkYpXxiBeZnK3ss0THxxh5gVFKqY=;
        b=HO6ZemkIEp977/1grOw+USzZ/BNQiU9ficaPr9j2PqiTTPI6v0jK4Bvjh5maDPcOB2
         /rEBjbh2TTqBEEJYU4AStSW0HXyv1gSpXbWVua1WNQezD6VoL/aLgHoRZVz2tJTfSnTE
         uCb8nj1qfhcn0J6TTbScbta3SDMguFgI1VQQo9o9sLHxeb+wevAl7kSOUzKbIQ28Vx1u
         u8QTX1iKvMlk/4/nSokzFIxSo7ektf1ltRiodXMW8pkeUgHbojR8jAdadBCucwE2xhBj
         NaC2NrKLv27IALWXpaQik6mK3Pu1VKML4yF9qBNfF/gtKE0lleYpn09bMXjkK6dlVhHs
         O1oA==
X-Gm-Message-State: APjAAAUDLqxtLajIkiF4uzVKc65jS0JCmvhkPo3qCNE9OiHy5MBMLA9c
        7KzhErmLIuILigQKbtz+sV0=
X-Google-Smtp-Source: APXvYqwvOnS7O6xR9GtG4Hi0afUgGYvBlhIiQeC1bhuUvEpkOxoqoL7N0p46A2BRuqh2iZOQXqT+gA==
X-Received: by 2002:a81:8350:: with SMTP id t77mr3625861ywf.442.1579903350395;
        Fri, 24 Jan 2020 14:02:30 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id e186sm2761729ywb.73.2020.01.24.14.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jan 2020 14:02:30 -0800 (PST)
Subject: Re: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
From:   Frank Rowand <frowand.list@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <20191230133852.5890-3-geert+renesas@glider.be>
 <41e1c51e-bc17-779e-8c68-bf2e652871eb@gmail.com>
 <70d24070-4f6d-8fc8-1214-1bd800cb5246@gmail.com>
 <CAMuHMdUQbRqyv1FK5JTbL-XL_YPZx8Sf9tQfU-eCozCNyDXYBA@mail.gmail.com>
 <a58d8d75-00b3-dcbf-8cdf-0b774bbf5be0@gmail.com>
Message-ID: <a281b966-7ffd-74d1-911d-f106026c8c8d@gmail.com>
Date:   Fri, 24 Jan 2020 16:02:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a58d8d75-00b3-dcbf-8cdf-0b774bbf5be0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/24/20 3:57 PM, Frank Rowand wrote:
> On 1/7/20 2:11 AM, Geert Uytterhoeven wrote:
>> Hi Frank,
>>
>> On Tue, Jan 7, 2020 at 8:10 AM Frank Rowand <frowand.list@gmail.com> wrote:
>>> On 1/6/20 5:34 PM, Frank Rowand wrote:
>>>> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
>>>>> As GPIO hogs are configured at GPIO controller initialization time,
>>>>> adding/removing GPIO hogs in DT overlays does not work.
>>>>>
>>>>> Add support for GPIO hogs described in DT overlays by registering an OF
>>>>> reconfiguration notifier, to handle the addition and removal of GPIO hog
>>>>> subnodes to/from a GPIO controller device node.
>>>>>
>>>>> Note that when a GPIO hog device node is being removed, its "gpios"
>>>>> properties is no longer available, so we have to keep track of which
>>>>> node a hog belongs to, which is done by adding a pointer to the hog's
>>>>> device node to struct gpio_desc.
>>>>
>>>> If I have read the patches and the existing overlay source correctly,
>>>> then some observations:
>>>>
>>>> - A gpio hog node added in an overlay will be properly processed.
>>>>
>>>> - A gpio hog node already existing in the live devicetree, but with a
>>>>   non-active status will be properly processed if the status of the
>>>>   gpio hog node is changed to "ok" in the overlay.
> 
> Verified by testing.
> 
> 
>>>> - If a gpio hog node already exists in the live devicetree with an
>>>>   active status, then any updated or added properties in that gpio
>>>>   hog node in the overlay will have no effect.
> 
> Should be documented.
> 
> 
>>>>   There is a scenario where the updated property would have an effect:
>>>>   apply a second overlay that sets the status to inactive, then apply
>>>>   a third overlay that sets the status back to active.  This is a
>>>>   rather contrived example and I think it should be documented as
>>>>   not supported and the result undefined.
> 
> I was wrong in this case.
> 
> of_reconfig_get_state_change() does not simply report whether a node
> is added or removed, which confused me because it returns
> OF_RECONFIG_CHANGE_ADD and OF_RECONFIG_CHANGE_REMOVE (as well as
> no change), which I was incorrectly translating to node added or
> node removed.   OF_RECONFIG_CHANGE_ADD and OF_RECONFIG_CHANGE_REMOVE
> properly report a node becoming available or available due to changes
                                            ^^^^^^^^^^^^
                                            or unavailable

> in the "status" property, as well as accounting for a node being
> added or removed.
> 
> So the case that I was worried about is handled correctly.
> 
> 
>>> I went back and double checked the related code.  For gpio hog nodes
>>> that are in a non-overlay, the status property is checked because
>>> of_gpiochip_scan_gpios() uses for_each_available_child_of_node()
>>> to search for gpio hog nodes, and for_each_available_child_of_node()
>>> checks the status property.  But in the case of a gpio hog node
>>> added by an overlay, of_gpio_notify() does not check the status
>>> property in the gpio hog node.  The check for the status property
>>> should be added to of_gpio_notify().
>>
>> Right.  of_device_is_available() should be called to check this.
>> Note that of_i2c_notify() and of_spi_notify() also lack such a check.
>> of_platform_notify() calls of_platform_device_create_pdata(), which does
>> have the check.
> 
> And thus I was wrong about this also, so of_gpio_notify() does not need to
> check the status property, since of_reconfig_get_state_change() already
> implicitly incorporates this check.
> 
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
> 
> 

