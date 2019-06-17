Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718D747D4A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 10:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfFQIig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 04:38:36 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:44387 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFQIig (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 04:38:36 -0400
Received: (qmail 9143 invoked by uid 5089); 17 Jun 2019 08:38:34 -0000
Received: by simscan 1.2.0 ppid: 9085, pid: 9086, t: 0.0565s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 17 Jun 2019 08:38:33 -0000
Subject: Re: [RFC] Addition of kernel
To:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@collabora.com
References: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <4e399cb4-189f-a690-8cd4-c2232cba22ea@electromag.com.au>
Date:   Mon, 17 Jun 2019 16:38:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <dd30c34a83293926c072f6a3fe612dcf134b7620.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day Martyn,

On 17/06/2019 16:29, Martyn Welch wrote:
> Hi Linus, Bartosz,
> 
> We are currently in the position that we would like to pre-configure
> some GPIOs at boot time and be able to later affect the state of GPIOs
> configured as outputs or read the state of GPIOs previously configured
> as inputs.
> 
> The device tree property `gpios-line-names` gives a very useful
> mechanism for identifying the correct GPIO to use/read for a given
> purpose in user space, but doesn't provide any guidance on how that
> line is expected to be used. The gpio-hogging functionality enables us
> to configure GPIOs during boot, ensuring that the correct state is
> present on the relevant GPIO lines, but does not provide the ability to
> modify or read these GPIOs at runtime.
> 
> I understand that a lot of people have requested such functionality in
> the past, but I'm not sure if anything concrete has ever been
> submitted. I'm interested in determining what the general feeling
> towards adding such functionality would be and to gain some input with
> regards to how this should/could be implemented (assuming the general
> concept is acceptable).
> 
> Initially we are thinking of providing a device-tree node containing a
> "gpio-default" property and would contain a lot of the same properties
> as "gpio-hog".
> 
> Code wise, it would seem to need to follow roughly the same flow as
> gpio-hog, but avoid running "gpiod_request_commit()" so that the GPIO
> line could later be requested by user space.
> 
> I suspect there's a whole load of details that I'm missing at this
> stage and I've not fully thought through the implications for later
> removal.
> 
> Does something like this seem viable upstream?
> 

I'd find something like this useful.
If we know enough to name the gpio lines, we more than likely also know enough
to restrict the IO configuration to input only in the DT.

There's a new driver recently posted that solves some of this:
"Add virtual controller for gpio configuration"
https://www.spinics.net/lists/linux-gpio/msg39681.html

It solves a number of problems except for restricting user-space from
configuring a pin for output that should never be an output.



-- 
Regards
Phil Reid

