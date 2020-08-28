Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBADC255CEC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgH1Opj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:45:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgH1Opi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 10:45:38 -0400
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EB282098B;
        Fri, 28 Aug 2020 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598625937;
        bh=yowQq2NG4nJh8fvUPdSabbCLjACL84gdik/XV+FQwks=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y0cWCO8ge9hfLF02ZtxEvxosDjutOC87NZ17e7tvvKiu7xWdHLHApsWBZL7yMny06
         Z0U8NNv6izVo4IiNZpxRhsu7q1m2OwD2+oqig0Drvk4P6psQpZTzTqAXLAQW1F8p8v
         ahnq83/17+Di0LDUha0RQcU824hIGR3VJe2Sq9RQ=
Received: by mail-ej1-f44.google.com with SMTP id b17so1836896ejq.8;
        Fri, 28 Aug 2020 07:45:37 -0700 (PDT)
X-Gm-Message-State: AOAM533a9xXzjUWUQePDmWt0CXSEGNMECSSnLShxbJF6eXr1g4eDQWp1
        h/nQAD1mRZq/BJ5IGaFi0hMJ4qLpvWXc9MQt7NM=
X-Google-Smtp-Source: ABdhPJyT5wwhhF+qi42/UWTQ0IlzMYCJlb70Us/PK8hLjWA6/O+xiz2nwy7hIm9a46c4eumxWu9wAFKPHgG/7RBuIZ0=
X-Received: by 2002:a17:906:4e03:: with SMTP id z3mr2118388eju.503.1598625936107;
 Fri, 28 Aug 2020 07:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-25-krzk@kernel.org>
 <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com>
In-Reply-To: <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 28 Aug 2020 16:45:24 +0200
X-Gmail-Original-Message-ID: <CAJKOXPej87cqgPtt4it66fp2CgjcyAQULG2260UH60hsnOZu7Q@mail.gmail.com>
Message-ID: <CAJKOXPej87cqgPtt4it66fp2CgjcyAQULG2260UH60hsnOZu7Q@mail.gmail.com>
Subject: Re: [PATCH v3 24/27] gpio: Add devm_fwnode_gpiod_get_optional() helpers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 28 Aug 2020 at 16:31, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > Add devm_fwnode_gpiod_get_optional() and
> > devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> > devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> > node might use it to remove some boilerplate code.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> OK then, I suppose this gets merged with the rest?
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

That's the easiest unless you expect some conflicts. Only one next
patch depends on this so worst case it could wait one cycle.

Best regards,
Krzysztof
