Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A03129A933
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 11:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897409AbgJ0KJS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 06:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2896823AbgJ0KJR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Oct 2020 06:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603793355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1xMFEL5l8qWQjfzBJoFlYHiuXf7nJEtoo8X1gM79n9U=;
        b=LVvNeobD3I0BYpHCFVwl7DDPI6OBcIFnW4XLFwZAFYxlQnvpKxUr+2rjKQ+xtjKYc2Y29f
        NZ4kMILmcEb0vynxxqLnIT7Fl+LDq2OF/ufnfmRlWDaDDSlUAflVfoblxQgutap1IUoa86
        ea/7DW3MpJypzKPvHb6qg0o9xaIA9g4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-YlM02zo6Nz2XOU_CKoPRmQ-1; Tue, 27 Oct 2020 06:09:14 -0400
X-MC-Unique: YlM02zo6Nz2XOU_CKoPRmQ-1
Received: by mail-ej1-f69.google.com with SMTP id d12so661996ejr.19
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 03:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1xMFEL5l8qWQjfzBJoFlYHiuXf7nJEtoo8X1gM79n9U=;
        b=AuEh7d82ZYUmvprqfR2kjqmlSMirFOF7xHe8Y804q1OvsjNbH9b/Gtojpfd4FSdHOg
         FuXa+NvHGMcF9EUB7ivNxTNaE4RnsmvNMLWvpAWYVSlrAYz0WLoU7/83iUGy5+wZkZWw
         O4DTRC3n+LSeR87yzjTNcGQc2lBvO2naWyqF7v0nz1uEFTir8Sq+IiMwLkDCQ7ekGoZf
         Fe3fkrc9O7/uSnZksaQS9VIYQliKdDZMm/7vidUnTezPbPuU9Uv5ZzhbLw3qkFxwSbv5
         PY/VgGPAlkBGEQZOAarf+Ns1J08ncymFQPMiFmfT27eJTucJZUBB4ydBbbWp9Ly/pLdQ
         25sw==
X-Gm-Message-State: AOAM532VKULV0HdSYFt0tO2Uuh+amLnbnl3u3/bvQOSVIfj79cxLLk03
        TCCOSXe9gIWW2QEXuQ4dUMBHyk5oyBhlxISOUMM6TOWWMXljzEK9bVqGJGxTgsneeB186LKGgbr
        kIiLdrIIuERrYMQXAvf+oQw==
X-Received: by 2002:aa7:ce18:: with SMTP id d24mr1432209edv.9.1603793352722;
        Tue, 27 Oct 2020 03:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS8z+oH2D/VE0FuS6Z10aO24uUGqVEAJBgkvHzLOfz2K+8Ui2Yli+nXDkH4oh162wHg3Eiag==
X-Received: by 2002:aa7:ce18:: with SMTP id d24mr1432176edv.9.1603793352431;
        Tue, 27 Oct 2020 03:09:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y1sm649975edj.76.2020.10.27.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 03:09:11 -0700 (PDT)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk> <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
Date:   Tue, 27 Oct 2020 11:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026225400.37almqey2wxyazkn@Rk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10/26/20 11:54 PM, Coiby Xu wrote:
> Hi Hans and Linus,
> 
> Will you interpret the 0x0000 value for debounce timeout in GPIO
> Interrupt Connection Resource Descriptor as disabling debouncing
> filter?
> 
> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> 
> I'm not sure if Windows' implementation is the de facto standard like
> i2c-hid. But if we are going to conform to the ACPI specs and we would
> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> can fix this touchpad issue and potentially some related issues by
> implementing the feature of supporting configuring debounce timeout in
> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> What do you think?
> 
> A favorable evidence is I've collected five DSDT tables when
> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> an non-zero debounce timeout value for the edge type irq and for all
> the level type irq, the debounce timeout is set to 0x0000.

That is a very interesting observation and this matches with my
instincts which say that we should just disable the debounce filter
for level triggered interrupts in pinctrl-amd.c

Yes that is a bit of a shortcut vs reading the valie from the ACPI
table, but I'm not sure that 0 always means disabled.

Specifically the ACPI 6.2 spec also has a notion of pinconf settings
and the docs on "PinConfig()"  say:

Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
property is specified by multiple descriptors for the same pins, the order in which these properties
are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
timeout, 0 should be used for GpioIo/GpioInt.*

So that suggests that a value of 0 does not necessarily mean "disabled" but
it means use a default, or possibly get the value from somewhere else such
as from a ACPI PinConfig description (if present).

So I see 2 ways to move forward with his:

1. Just disable the debounce filter for level type IRQs; or
2. Add a helper to sanitize the debounce pulse-duration setting and
   call that when setting the IRQ type.
   This helper would read the setting check it is not crazy long for
   an IRQ-line (lets say anything above 1 ms is crazy long) and if it
   is crazy long then overwrite it with a saner value.

2. is a bit tricky, because if the IRQ line comes from a chip then
obviously max 1ms debouncing to catch eletrical interference should be
fine. But sometimes cheap buttons for things like volume up/down on tablets
are directly connected to GPIOs and then we may want longer debouncing...

So if we do 2. we may want to limit it to only level type IRQs too.

Note I have contacted AMD about this and asked them for some input on this,
ideally they can tell us how exactly we should program the debounce filter
and based on which data we should do that.

Regards,

Hans

