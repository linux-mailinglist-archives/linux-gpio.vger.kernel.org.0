Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 512294DE0A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 02:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFUAW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 20:22:58 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:35153 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfFUAW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 20:22:58 -0400
Received: by mail-pf1-f182.google.com with SMTP id d126so2604923pfd.2;
        Thu, 20 Jun 2019 17:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OfKMu2iAcPe+SgaPMfmOs4iKx9Rhc9WcDHM0DB8ECUY=;
        b=WrE4Q5/u5xOSe2SX5QCQhxapxpvZmotpFqmMeQ1Aeq9d0STZdthw7JU1gCgElZH6Tv
         TBvPtZxvtLRbHQhQvHbDdidGzvjxEVnXsgFhX60DEcQlPxXkl/A68j+U0BnZ+GQlTOdl
         wm2X6rASGesN8Cv/QPJb6juZ5ZKVho+DUFzaHfPy+PJjKYZfb02H9NclKmhsCtyzrC2I
         jK3N82eP2myUBbkJCiw/4nXI0+PlpBZwyjwdX+jaSqUnnCo4WqO+RvgtGzEPgP+mQn+B
         tT8HrCFkCUVJYlA7JiKG8t1y4pI0NWiDVsnXPVD26v5yifDUvz07KKkOZIM407PZFRAk
         cqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfKMu2iAcPe+SgaPMfmOs4iKx9Rhc9WcDHM0DB8ECUY=;
        b=ZKz+owuAP8hXaENgLLjRZScheBYLK4YXiuTqd0Hf9xOcPelPT2gae6mjNSJmRgAQot
         /H0UoWzUYs9AZEcLSAYcp9ZOFRV0FxmYD4I7gJ8VkEXqHzcroJyzNSPU/BFi2TC4l9kD
         F1VyafDslDCYYWZd8BZs0aNThBjxE/ULY9ygyfw6B/Go6S14yNm/P7G9JxDHSAAG7e52
         MAO6Tn5CRS/fetV11MKarrUNYWldCYHYfxBFvG6wHu9HnTwacCdqh6Rk89TDIUhRYEC+
         IEOwzcjvdvdTdkxbRB4/TI6hEA0kBCTfuEk7s+HjdRxKhR5XEFlnR4kI4r5+DAMivAgi
         lRew==
X-Gm-Message-State: APjAAAXxMEOCZxif/7u7Jhfm0oYzWFf0U9qBAyZFZ7e/FJ/6iLldIkXS
        ML28v36YjzqkO0eU9tn/NHA=
X-Google-Smtp-Source: APXvYqxMrrgrDWCb6fLWKGsJn7A4fku1ruQeHqWX9BUEtDebV3r+9CBCQwK8Q6YUlhjaCi4XJ0BS+g==
X-Received: by 2002:a65:620a:: with SMTP id d10mr15252567pgv.42.1561076577000;
        Thu, 20 Jun 2019 17:22:57 -0700 (PDT)
Received: from [192.168.1.70] (c-24-6-192-50.hsd1.ca.comcast.net. [24.6.192.50])
        by smtp.gmail.com with ESMTPSA id j16sm735757pjz.31.2019.06.20.17.22.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 17:22:56 -0700 (PDT)
Subject: Re: [RFC] Initial state for GPIOs
To:     Martyn Welch <martyn.welch@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com
References: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <9d9caeea-4f24-7951-3bb6-fa5890744f06@gmail.com>
Date:   Thu, 20 Jun 2019 17:22:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+frank (me)

On 6/20/19 6:16 AM, Martyn Welch wrote:
> Hi Rob, Mark,
> 
> Attempts have been made to define an approach for describing the
> initial state of gpios (direction and value when driven as an output) a
> number of times in the past, but a concensus on the approach to take
> seems to have never been reached.
> 
> The aim is to be able to describe GPIOs which a definitive use exists
> (i.e. are routed from an SoC to a pin on another device with a
> definitive purpose) and which the desired, and possibly required, state
> of the pin is known. This differs from gpio-hog in that there is an
> expectation that a consumer of the gpio may appear at a later date,
> which may take the form of the GPIO being exported to user space.
> 
> Previous attempts have suggested a variation of the gpio-hogs[1][2].
> "gpio-hogs" uses a node for each GPIO containing the "gpio-hogs"
> property, with which the Linux kernel will act as a consumer,
> statically setting the provided state on the GPIO line, for example:
> 
>         qe_pio_a: gpio-controller@1400 {
>                 compatible = "fsl,qe-pario-bank-a", 
> 			     "fsl,qe-pario-bank";
>                 reg = <0x1400 0x18>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
> 
>                 line_b {
>                         gpio-hog;
>                         gpios = <6 0>;
>                         output-low;
>                         line-name = "foo-bar-gpio";
>                 };
>         };
> 
> It had been suggested to either replace "gpio-hogs" with "gpio-initval" 
> or to include a node without the "gpio-hogs" property to set an inital
> state, but allow another consumer to come along at a later date.
> 
> A previous related attempt to upstream a "gpio-switch" consumer[3] also
> took the approach of defining nodes in the device tree. The
> conversation pointed towards a suggestion of using nodes with
> compatible properties, for example:
> 
>         &gpiochip {
>                 some_led {
>                         compatible = "gpio-leds";
>                         default-state = "on";
>                         gpios = <3 0>;
>                         line-name = "leda";
>                 };
> 
>                 some_switch {
>                         compatible = "gpio-switch", "gpio-initval";
>                         gpios = <4 0>;
>                         line-name = "switch1";
> 
>                         /*
> 			 * This is used by gpio-initval in case 
> 			 * gpio-switch is not implemented
> 			 */
>                         output-low;
>                 };
> 
>                 some_interrupt {
>                         gpios = <5 0>;
>                         line-name = "some_interrupt_line";
>                 };
> 
>                 line_b {
>                         gpios = <6 0>;
>                         line-name = "line-b";
>                 };
>         };
> 
> An alternative that has been briefly raised[4] when I approached the
> subject recently on the GPIO mailing list is to add a property to the
> controller node, rather than child nodes, that listed the expected
> initial states of the pins as an array, much like the line names are
> handled through "gpio-line-names". I'm not quite sure how it would best
> to treat offsets where no special initial state is required (gpio-line-
> names uses empty strings). Something like this?:
> 
> --- gpio.h
>         /* Bit 4 express initial state */
>         #define GPIO_INPUT 0
>         #define GPIO_OUTPUT 16
> 
>         /* Bit 5 express initial state */
>         #define GPIO_INITIAL_LOW 0
>         #define GPIO_INITIAL_HIGH 32
>         
>         #define GPIO_OUTPUT_LOW (GPIO_OUTPUT | GPIO_INITIAL_LOW)
>         #define GPIO_OUTPUT_HIGH (GPIO_OUTPUT | GPIO_INITIAL_HIGH)
> ---
> 
> --- device tree
>         &gpiochip {
>                 gpio-line-names = "", "", "", "widget_en",
> 			"widget_signal";
>                 gpio-initial-states = <>, <>, <>,
> 			<GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
> 			<GPIO_INPUT | GPIO_ACTIVE_LOW>;
>         };
> ---        
> 
> An alternative option may be to provide the offset as the first item
> (though this is then different from "gpio-line-names"), so:
> 
> --- device tree
>         &gpiochip {
>                 gpio-line-names = "", "", "", "widget_en",
> 			"widget_signal";
>                 gpio-initial-states =
> 			<3 GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
> 			<4 GPIO_INPUT | GPIO_ACTIVE_LOW>;
>         };
> ---        
> 
> I'm interested in understanding what form would be acceptable as part
> of the device tree binding.
> 
> Thanks in advance,
> 
> Martyn
> 
> [1] https://marc.info/?l=devicetree&m=145621411916777&w=2
> [2] https://patchwork.ozlabs.org/patch/545493/
> [3] https://lore.kernel.org/patchwork/patch/624195/
> [4] https://www.spinics.net/lists/linux-gpio/msg39810.html
> 
> 

