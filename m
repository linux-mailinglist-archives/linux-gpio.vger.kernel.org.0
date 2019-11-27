Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38AB10AF9D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 13:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfK0Mgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 07:36:46 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:36889 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfK0Mgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 07:36:45 -0500
Received: by mail-ua1-f51.google.com with SMTP id l38so6910732uad.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4+dp/IvtnZLwKEKhja2wgs6nPctc4v2DuCodEWDqcs=;
        b=JDvm+YAeCCFzlWGPTtT28hlukA3HxH0LOI5qtjteFUIVFpy/P8ZQF4qzE79rONA91W
         EX6rMXLnKIkTnZaLwU5HVXbYftLCAvjtG6D3VwVO2yRuAIpFrCjNUNHByrhc3aNkLT+f
         fhWWaNMwWb56+j3MVJXTUXU+NqxKhfakA/GmCZ1tTEOIj7zGVYLWwVQWw2/y41P474pN
         o3D7WtO4TMa4nGzpmKrGZPA0eIxvN/cNvN3p2VZ3eVICzjGaW3oPEweaKjlqD8DpkXuj
         kk9mLU54Yrvb0ZVr6ZpvaBVr3dqZcBx3a4NHFlZxKrPyfwypMmfKTfoGPOC8eYO285Xz
         +Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4+dp/IvtnZLwKEKhja2wgs6nPctc4v2DuCodEWDqcs=;
        b=gJnio5F3pyV4Nm7IJOTqnIjxLeHEypwd6hEfStMB/uWvunDRL2gloCvtJcQvoDRMHX
         j/kARMltqHtBYvoJaQuoVdnsHSfNFL0SPhXM5Jhyo8M/6JR+68qxLxCQgVeRIWJDDr3R
         cVZ9JA70j8cQHkd6p0vmxnlzvuI75DW6zmjYnf99IGwD3yhK3nrYZqyLQa2VOIy7k/qY
         ZXjDG9EMhR+/eX3+adSD5uAi0fqqw1diDawUymHkpm83U5Z0QCXCrn2nnP9SUS05/P14
         JYU0RqJhHXHIQ3rT2zEUwqLFIX2+QznithpnTfkfBEUDOJABq3QXN1OmTsgGa69hyKfa
         JoOQ==
X-Gm-Message-State: APjAAAWpSTFkciQA+hMTwzs1j3EkuUEnqTuLF05Dj05LFgsAWI5R8MRs
        s5yB8o9PHgdCEu0gsmN0K/UI3Y3DVAU1KWgD5sipGg==
X-Google-Smtp-Source: APXvYqwY2Q3iJ57aajkDk90rym40Bm2ukfUnT0o25Xpf9KPN4n2dRfBBeQyhCOnRCGNNzRYozwNHCafgIuwVx9DyEuM=
X-Received: by 2002:ab0:608f:: with SMTP id i15mr2384386ual.20.1574858203122;
 Wed, 27 Nov 2019 04:36:43 -0800 (PST)
MIME-Version: 1.0
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
In-Reply-To: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 13:36:31 +0100
Message-ID: <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
To:     Phil Elwell <phil@raspberrypi.org>,
        Phil Reid <preid@electromag.com.au>,
        Jason Kridner <jkridner@gmail.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

I think the people I added to the To: line are better suited to answer
this question, they have used the MCP23* chips in practice more
than me and know how they work.

Some minor comments inline.

On Wed, Nov 27, 2019 at 12:20 PM Phil Elwell <phil@raspberrypi.org> wrote:

> We have a user asking for help to construct a Device Tree overlay to use
> the GPIOs exported by multiple MCP23S17s sharing an SPI Chip Select
> line. This is a special feature of the MCP devices whereby the SPI bus
> is treated rather like an I2C bus with each device assigned a unique
> address. His problem is in constructing gpiospecs to refer to all of the
> GPIOs.
>
> The mcp23s08 driver claims to support this feature, and there is a DT
> property ("microchip,spi-present-mask") to declare which addresses are
> used buy the devices.

It's an interesting hack and I kind of see why they are doing it.

>  I've spent an hour or so looking at the driver
> code and crawling through the kernel GPIO infrastructure, and I don't
> think it's possible. Here's my logic:
>
> 1. Although all devices that are found are presented as a single SPI
> device, they are each registered as independent gpio_chips.

So they are presented as a single SPI device, but they are
different physical packages (right?) so it is actually correct to
have several gpio_chips but incorrect that they are all
represented in a single device tree node.

Interestingly there is not a single device tree in the entire
kernel that uses the "*,spi-present-mask" attribute.

Could you provide an example?

I *THINK* the idea behind this attribute is just plain wrong
and cannot be made to work.

Instead the device should be represented as one SPI node
with subnodes for each separate physical device when this
attribute would be used.

mcp {
    compatible = "microchip,mcp23s08";
    microchip,spi-present-mask = <0x03>;
    mcp0: chip0 {
        reg = <0>;
      ....
    }
    mcp1: chip1 {
        reg = <1>;
      ....
    }
};

By introducing such child nodes it gets possible to reference
these chips by phandle <&mcp1 ...>;

Notice use of reg attribute to address subchip.

IIUC this needs to be figured out and both the DT bindings
and the driver need to be fixed to support this peculiar addressing
scheme.

Yours,
Linus Walleij
