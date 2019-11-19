Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2442C102CAF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 20:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfKSTbc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 14:31:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36109 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKSTax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 14:30:53 -0500
Received: by mail-wm1-f67.google.com with SMTP id c22so5182853wmd.1;
        Tue, 19 Nov 2019 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=atgCQq6D206yrKTfApmYtmm3QS5gK6YModY6x30k2BE=;
        b=gTJsgzCLOkSX2EH25Zd90WuQpbaViFmzsK+VFs3NpiACe+7qRIOb/Gm1ZLyvLeP4FK
         tLXXc/iN9Ph9cQBUdCHBWsW9Ccoot4Nm8eWF7DRlh9VeU1uOfmBVhC62HM9phwZj5tV/
         zSRARy+Z2XFUl0a7Tf4rRJPIXRmXzHDEH+evzHhE3JaLV6PLbdH1OZDCRHk6T8MvVZVo
         TLvx4+d/ldZrxZ8faC2KZpXoIorMSASRHZmtQ4e8iIe7b0CkgK1m03FNNEqxmlMdcXXC
         8pJr7s5fFX0+mXpgYpvgYw59G9ZOtvstjP1Q80UNIJNxe4sikHstFYaXglBmriu737jq
         AoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=atgCQq6D206yrKTfApmYtmm3QS5gK6YModY6x30k2BE=;
        b=pzNbBHGfMAZQPlEZUDTGW7uyuxbKskOYh0mB4sSuWDqvtTTosY/4FzlX7BBBq/29LH
         Ymd0+UinZII2FA+O2hfpyeRSg5lryCX1DUUiW5hAu6drJU5wkRVmzItxmqrWn5eNK41i
         tLEzCFpSiht4LzfTP3z+flklD+VzmiBong9Jb0ZNcL6TMKidtPIS2I8S+fifmt7p+InU
         OCzF60pboRqvevmseD4zx5x/vVEaPfSEjySmg+LPj2fi7bmfKTemfL/p9009nsUyjP/6
         zCgWen/Q2brA2nN1diBQXZ3sQbpWFH7fWErCNWfHkD3ek+YCelNBR43GrOP5iT74UfI/
         u33g==
X-Gm-Message-State: APjAAAXM2VTkJd7oDqiI7HLE6zd+5ikxPrNovBZynUIBqCAXfjtZromk
        R5FlGq8HkZIyS9UswXwaaEgSZfJQGn8=
X-Google-Smtp-Source: APXvYqxHW6iFZ7BjSns+zzgTg6IU8rAATggrmdyaDbcHPjWxwjU3YpCXL0zChJ0g1lcLekDDG3SIag==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr7386540wmk.36.1574191848892;
        Tue, 19 Nov 2019 11:30:48 -0800 (PST)
Received: from [192.168.1.19] (chs184.neoplus.adsl.tpnet.pl. [83.31.16.184])
        by smtp.gmail.com with ESMTPSA id c4sm28732282wrp.86.2019.11.19.11.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2019 11:30:48 -0800 (PST)
Subject: Re: [PATCH v5 15/16] leds: Add common LED binding parsing support to
 LED class/core
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <258b5c9934e2b31a5f433a7dbb908dfe5da3d30c.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <745e427d-819e-12d7-5c94-7a8d1a414956@gmail.com>
 <4c03b7cec4d4417ba3c60b9d8a333ddd4cfa79ac.camel@fi.rohmeurope.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d9521d73-82c5-46c3-fccc-333234914f4a@gmail.com>
Date:   Tue, 19 Nov 2019 20:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4c03b7cec4d4417ba3c60b9d8a333ddd4cfa79ac.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On 11/19/19 8:21 AM, Vaittinen, Matti wrote:
> Hello Jacek,
> 
> On Mon, 2019-11-18 at 22:55 +0100, Jacek Anaszewski wrote:
>> Hi Matti,
>>
>> Thank you for the patch. If your driver does not depend
>> on it then please send is separately.
> 
> The BD71828 depends on device-tree node look-up. It does not utilize
> the common property parsing. I could of course do the child dt-node
> walking in BD71828 driver - but it kind of breaks my motivation to do
> the LED core improvement if I anyways need to do the parsing in BD71828
> driver ;)

If you do not plan on spending too much time on contributing this
set then I propose adhering to the currently used parsing schema :-)

And you have to know that from this development cycle I handed
over LED tree maintenance to Pavel Machek, so you will require
to have his acceptance in the first place.

>>  Besides, we would require
>> to convert many of current LED drivers to verify how the
>> proposed parsing mechanism will work with them.
> 
> I see the risk you are pointing out. And I actually think we could
> default to old mechanism if of_match or match_property is not given
> (for now). I could then see the existing drivers who use init_data -
> and ensure those are initializing the new match_property and of_match
> in init_data with 0. That would be quite trivial task.
> 
> That would allow us to convert and test existing drivers one-by-one
> while allowing new drivers to offload the LED node look-up and common
> property parsing to LED core. No risk, but less drivers to convert in
> the future - and simpler drivers to maintain when all of them do not
> need to duplicate node look-up or basic property parsing ;)

I personally would prefer to do the massive driver update to using
the new mechanism. I know that this is time consuming but we are not
in a hurry.

> To make this more concrete:
> 
> We can only do the new DT node look-up if either
> if (init_data->match_property.name && init_data->match_property.size)
> or
> if (init_data->of_match)
> That would keep the node-lookup same for all existing drivers.
> 
> Eg, 
> led_find_fwnode could for now just do:
> 
> struct fwnode_handle *led_find_fwnode(struct device *parent,
> 				      struct led_init_data *init_data)
> {
> 	/*
>         * This should never be called W/O init data.
> 	*/
> 	if (!init_data)
> 		return NULL;
> 
> 	/*
> 	 * For old drivers which do not populate new match information
> 	 * just directly use the given init_data->fwnode no matter if
> 	 * it is NULL or not. - as old functionality did.
> 	 */
> 	if ( (!init_data->match_property.name ||
> 	      !init_data->match_property.size) && !init_data->of_match)
> 		return init_data->fwnode;
> 
> 	/* match information was given - do node look-up */
> 	...
> }
> 
> Furthermore, the common property parsing could also be (for now) done
> only if match data is given:
> 
> 	/*
> 	 * For now only allow core to parse DT properties if
> 	 * parsing is explicitly requested by driver or if core has
> 	 * found new match data from init_data and then set the flag
> 	 */
> 	if (INVENT_A_COOL_NEW_FLAG_NAME_HERE)
> 		led_add_props(led_cdev, &props);
> 
> or just simply: 
> 	if ((init_data->match_property.name &&
> 	    init_data->match_property.size) || init_data->of_match)
> 		led_add_props(led_cdev, &props);
> 
> (but this won't allow driver to ask for common parsing even if it was
> verified for this drv to work - hence I like the flag better)
> 
> And if you don't feel confident I can even drop the "common property
> parsing" from the series and leave only the "node look-up if match-data 
> was given" to it.
> 
> Anyways, I would like to introduce this support while I am working with
> the BD71828 driver which really has the LEDs - but I can modify the
> patch series so that it only impacts to drivers which implement the new
> match data in init_data and leave old drivers to be converted one-by-
> one when they can be tested.
> 
>>  I've been testing
>> my LED name composition series using QEMU and stubbing things in
>> drivers where necessary and I propose to use the same approach
>> in this case.
> 
> I don't plan to do any mass-conversion as it is somewhat risky. I can

You do not need hardware to test DT parsing as I mentioned before,
so I don't see too much risk involved.

> do conversion to some of the drivers (simple ones which I can
> understand without too much of pain) - and ask if anyone having access
> to actual HW with LEDs could be kind enough to test the patch for the
> device. Tested drivers can then be taken in-tree as examples. And who
> knows, maybe there is some developers looking for a hobby project with
> access to LED controller to help with the rest ;) I don't have the
> ambition to change all of the LED drivers but I think I can give my 10
> cents by contributing the mechanism and doing few examples :)

If you want to introduce good, robust mechanism, then it should be
tested against widest possible spectrum of use cases.

> Anyways, please let me know if you think you could accept patch which
> won't change existing driver functionality - but allows new drivers to
> not duplicate the code. Else I'll just duplicate the lookup code in one
> more driver and hope I don't have another PMIC with LED controller on
> my table too soon...
> 
> (I am having "some" pressure to do few other tasks I recently got. So I
> am afraid I won't have too much time to invest on LEDs this year :(
> Thus setting up the qemu and starting with stubbing is really not an
> option for me at this phase).

As mentioned before - I no longer apply patches so you will need to
consult Pavel, but I bet he will have similar opinion.

-- 
Best regards,
Jacek Anaszewski
