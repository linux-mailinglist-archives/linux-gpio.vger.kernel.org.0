Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A04149094
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 22:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAXV57 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 16:57:59 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:35644 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAXV57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 16:57:59 -0500
Received: by mail-yb1-f196.google.com with SMTP id q190so1717441ybq.2;
        Fri, 24 Jan 2020 13:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FAgORkqjjQWplSt9zJQeczIU9aNbThp1xcMsMJfyq+Y=;
        b=VpCxTbGcQ0V0/R3sS4OeSE6EGkbPL0lOUOIzs42gE48xq633Q1/8Tnf4c35lP/BQGK
         pasXqcFCk7obZOD8f5MLzdSZ6GrKGkXJjSfNSxxi0DPwtXyIUXKDpz0nbq3xxL+/h7TV
         59KHVYvQGAhY1u44szVqcpvsr/k43DABswn5ipfFXiWtRjnjBNneIosq3POD0l59rSWA
         gDWMNI7byCHb5kGgvuvJgCXXkTXYpIWqP+JfHQ8StWJZzyLCRyqN8VBdXi3ow57w9m57
         Q/Ne5VUTkno/kRIM7qeEgx0Wklq2KnsHUoypgkY249y+spvoMcOauYJPwn2HZHdHN2GN
         Felg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FAgORkqjjQWplSt9zJQeczIU9aNbThp1xcMsMJfyq+Y=;
        b=N8kJm/t5PofOGQaU/wfM/ah2+4lhnjNBts5mNdgZs0P05eXffprOWAf3mImKTTcoZo
         tXroWh8yUduOD/ycm9XMWE3iQ1oVtU3coYEJdBDz++dVGzp9ercZWrNeo2xkRZLpHKXd
         C8ZYzwhkH+uZ2X/wBmexKh6epWv2AgIQn8+MGzhk2hIo8cM8UjoH7MNXOsMQ8dL9tbij
         SzTw5JacvPMaEyno4p2O0kCoozS6KjevXjltXo9cDzBWahLcHCNcjT8l+uAg8DZhcnCD
         GMyxvAzwcDTSkI0nf4ACPELmasSe7uEseCukO1i+LT+yTgWUx5wQVdxUilh+xXyWFVSe
         JwAQ==
X-Gm-Message-State: APjAAAUMixYV5xDQRTcTCmlI9KYLng70am1kq5IbC6C9eNdxHPI/E+zI
        4IX5EqxRwMClZKHam2C9pLQ=
X-Google-Smtp-Source: APXvYqzVbEeZtHr5DuKQ0VnGjzr5Ff6DvzTWn142G41ZVqDxUi8S4qU+GYb2P4b40NsfZ0LeXkx0kw==
X-Received: by 2002:a25:e696:: with SMTP id d144mr4150569ybh.316.1579903077801;
        Fri, 24 Jan 2020 13:57:57 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id a12sm2935604ywa.95.2020.01.24.13.57.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jan 2020 13:57:57 -0800 (PST)
Subject: Re: [PATCH/RFC 2/2] gpio: of: Add DT overlay support for GPIO hogs
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <a58d8d75-00b3-dcbf-8cdf-0b774bbf5be0@gmail.com>
Date:   Fri, 24 Jan 2020 15:57:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUQbRqyv1FK5JTbL-XL_YPZx8Sf9tQfU-eCozCNyDXYBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/7/20 2:11 AM, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Tue, Jan 7, 2020 at 8:10 AM Frank Rowand <frowand.list@gmail.com> wrote:
>> On 1/6/20 5:34 PM, Frank Rowand wrote:
>>> On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
>>>> As GPIO hogs are configured at GPIO controller initialization time,
>>>> adding/removing GPIO hogs in DT overlays does not work.
>>>>
>>>> Add support for GPIO hogs described in DT overlays by registering an OF
>>>> reconfiguration notifier, to handle the addition and removal of GPIO hog
>>>> subnodes to/from a GPIO controller device node.
>>>>
>>>> Note that when a GPIO hog device node is being removed, its "gpios"
>>>> properties is no longer available, so we have to keep track of which
>>>> node a hog belongs to, which is done by adding a pointer to the hog's
>>>> device node to struct gpio_desc.
>>>
>>> If I have read the patches and the existing overlay source correctly,
>>> then some observations:
>>>
>>> - A gpio hog node added in an overlay will be properly processed.
>>>
>>> - A gpio hog node already existing in the live devicetree, but with a
>>>   non-active status will be properly processed if the status of the
>>>   gpio hog node is changed to "ok" in the overlay.

Verified by testing.


>>> - If a gpio hog node already exists in the live devicetree with an
>>>   active status, then any updated or added properties in that gpio
>>>   hog node in the overlay will have no effect.

Should be documented.


>>>   There is a scenario where the updated property would have an effect:
>>>   apply a second overlay that sets the status to inactive, then apply
>>>   a third overlay that sets the status back to active.  This is a
>>>   rather contrived example and I think it should be documented as
>>>   not supported and the result undefined.

I was wrong in this case.

of_reconfig_get_state_change() does not simply report whether a node
is added or removed, which confused me because it returns
OF_RECONFIG_CHANGE_ADD and OF_RECONFIG_CHANGE_REMOVE (as well as
no change), which I was incorrectly translating to node added or
node removed.   OF_RECONFIG_CHANGE_ADD and OF_RECONFIG_CHANGE_REMOVE
properly report a node becoming available or available due to changes
in the "status" property, as well as accounting for a node being
added or removed.

So the case that I was worried about is handled correctly.


>> I went back and double checked the related code.  For gpio hog nodes
>> that are in a non-overlay, the status property is checked because
>> of_gpiochip_scan_gpios() uses for_each_available_child_of_node()
>> to search for gpio hog nodes, and for_each_available_child_of_node()
>> checks the status property.  But in the case of a gpio hog node
>> added by an overlay, of_gpio_notify() does not check the status
>> property in the gpio hog node.  The check for the status property
>> should be added to of_gpio_notify().
> 
> Right.  of_device_is_available() should be called to check this.
> Note that of_i2c_notify() and of_spi_notify() also lack such a check.
> of_platform_notify() calls of_platform_device_create_pdata(), which does
> have the check.

And thus I was wrong about this also, so of_gpio_notify() does not need to
check the status property, since of_reconfig_get_state_change() already
implicitly incorporates this check.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

