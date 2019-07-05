Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C85B160D5D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 23:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfGEVxj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 17:53:39 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:34379 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfGEVxj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 17:53:39 -0400
Received: by mail-lj1-f171.google.com with SMTP id p17so10527717ljg.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RVhp9sD9l1Fh7vJIHE7psd1pUKNZ7W5F8oACMY7W1Ao=;
        b=c4niO4pwvEQah4Pqnn/zl8+RVdfUUI7KIaDriNJQXwu/NGLs+eKeEfhNIT5aKEFnpU
         8dKRem6sGATIv5K6eC5hslEcP89oNCvTA9tQjCFQP3c+ZsOeZBRr4xoGHdnap7qYt40+
         RSEFWpx1kIpDnp44Xq1yGGB1hPu8ZFWLi6D/PzEbrpcRUWgc+bVuMUXe2SJIaFSmmG80
         AIQWTczh30g4eDExPEn5Fy+v40KPPncvAG1TIGbeGm4Y7Muij2PeOgZwMWUiiVf1h9ON
         EwtL/Zhhg8C1NL02TPLu3uy5e9L21J3977O1+lFWXijJLztCXwe8qeO+ckjktx3NWXZ4
         x2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RVhp9sD9l1Fh7vJIHE7psd1pUKNZ7W5F8oACMY7W1Ao=;
        b=B+deYKIBkrk1CfPruUvXbzghd0FQ19Y1ye4EP4yoKYo6PUUwA1uPBMhaoFENr1wdVM
         CeumIUQSKCTr48VD6uzMBiwVBYHwBopG9r8bW9wn8InCsNYhLBdpMaeD2E1BdRkvVlUX
         wiP0uXjwq/lGKZrbb9N/6d2fmkVzDAIa9SHyaC59q8HK4pxsyOpM3LtZaDKCR+jJOjIy
         EdyD0UIA6mGS2R/vE8KJVwWxgXc801gPFDr2XbCKqoe5NekVuz7AAYz5jYPR1hnrKVZK
         9TqiMkZXJeBPK4Dlx2i1xFFIG52OdyPMYbm4RgOgLewwRgi2S9kHANfYCsjJOJH0iniG
         4Bow==
X-Gm-Message-State: APjAAAXBabo63R8yzIVZpBx7dRKxRGXRlp9MVpZwWnXaZKPI1vmgFXDQ
        QmhGdYFLJt9VRS1Mb5SuXKp/st01BpWvELRv/xhhkA==
X-Google-Smtp-Source: APXvYqwaGrH2h+Z98/ELblKzu4yMSF6RGFMj6RI688gHIeWsG2kw7fK8UUVt72WdXfpVrC4bXciBwl2IVtwAYJ/zDKs=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr3282903ljb.28.1562363617011;
 Fri, 05 Jul 2019 14:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <d4724d7ec8ab4f95884ea947d9467e26@svr-chch-ex1.atlnz.lc>
 <CACRpkdZD7x1eeatXRTtU5k7Zoj5tfG8V98SjaO=xubwaa9teTQ@mail.gmail.com>
 <f9eb3387ed384676b0b298e4da7eeaf0@svr-chch-ex1.atlnz.lc> <755abbb5b984414a966367c323f62e59@svr-chch-ex1.atlnz.lc>
In-Reply-To: <755abbb5b984414a966367c323f62e59@svr-chch-ex1.atlnz.lc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 Jul 2019 23:53:25 +0200
Message-ID: <CACRpkdYzXEKVzmq_wimvbeMmOqnW8okyK09V-RpzdoesmC4P7Q@mail.gmail.com>
Subject: Re: gpio desc flags being lost
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 11:30 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> The problem is caused by commit 3edfb7bd76bd1cba ("gpiolib: Show correct
> direction from the beginning"). I'll see if I can whip up a patch to fix it.

Oh. I think:

               if (chip->get_direction && gpiochip_line_is_valid(chip, i))
                        desc->flags = !chip->get_direction(chip, i) ?
                                        (1 << FLAG_IS_OUT) : 0;
                else
                        desc->flags = !chip->direction_input ?
                                        (1 << FLAG_IS_OUT) : 0;


Needs to have desc->flags |=  ... &= ~

if (!chip->get_direction(chip, i))
    desc->flags |= (1 << FLAG_IS_OUT);
else
    desc->flags &= ~(1 << FLAG_IS_OUT);

And the same for direction_input()

Yours,
Linus Walleij
