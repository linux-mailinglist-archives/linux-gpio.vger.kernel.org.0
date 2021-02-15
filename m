Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA2631B9D7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 13:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhBOMyo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 07:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhBOMyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 07:54:43 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352C7C061574;
        Mon, 15 Feb 2021 04:54:03 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id u11so3672858plg.13;
        Mon, 15 Feb 2021 04:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZgaSt3foww3LKti1xLjH9ESlqQ5fFDh0YJtrgKJLUo=;
        b=Eeqtr7wDuFgFKopoZe3pNkVjy58jZlEpcjj+VH6zl5DsCxkPsHxgLZGZoTJK6EasEV
         KoRDouq2BQsWF/dXRaDvUTemda5K9MuGdNql1GZRpVzVroURhG/fVODTTBWE4jpiSDYj
         BWPoOebmkZMujAG/PpfEYX0zDLodNSRqSTbbu3ELhP6xL3gPF8hOTez56mHx8ZjP1tNX
         ciqx5Yc38GuLAmOAcJitO9ICq4sld/DID3FS7nAWOnX92e2naxPVKxHQwcpONMRGYO43
         stuW2shrGgT3NfkBs4gwaZ978wmrgzk18v7lDE+AIQYTHc1uV0lCiPmvj9lmNcbKtsDn
         gkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZgaSt3foww3LKti1xLjH9ESlqQ5fFDh0YJtrgKJLUo=;
        b=LnUll52wGTe89QMQWg9GNcl8+zEFS9wc4rMemL/qwQgDTATh+T0H3NUdaPQeQGkaNM
         zKz0kNW3XsrsnwMICd44Da3v8Kyh2tdkLUP95Y8KETDJyBb2d2Si3ptUUJ8KzSdgeND2
         brqqM7bgGJ2qj2Bdk8J/iBEU+9ec3bd15tJAuIl5jFAE9TJwiev9e4vGUGYKlDbwrym0
         rtJUTm+tdoD5H5jc5jixPoWVitg1Zb2/sqxXcGyy29qzbmofzcQKi/Z28h12YLg0GJCw
         L7vQrMwEXYqvEK2TZ/zZAtyef+WcG4iyPBVnY6hp0dOcAg+Igd4LJQvr7MlSVsI7oPEe
         qytA==
X-Gm-Message-State: AOAM531Y/eYBWP1os5hQclHIIWZPdMEVIjHuDXBO1ROg08ANstvW0uqe
        zGmHCNHOFoyFDb1c67P+/2YP4jApnzrRNGJjJrk=
X-Google-Smtp-Source: ABdhPJx4iLBwW3dX8rPuAiC+0iF5zsyULMLkaPC60k4/jtyHgAKkfJPWmra1H+U8qgGwcRbvgUHDkLwWX5dkuyIyU8Y=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr15067149pll.0.1613393642679; Mon, 15
 Feb 2021 04:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20210211175140.85391-1-alban.bedel@aerq.com>
In-Reply-To: <20210211175140.85391-1-alban.bedel@aerq.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Feb 2021 14:53:46 +0200
Message-ID: <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on PCAL6524
To:     Alban Bedel <alban.bedel@aerq.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hint: don't forget to include reviewers from previous version

On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <alban.bedel@aerq.com> wrote:
>
> From a quick glance at various datasheets the PCAL6524 and the
> PCAL6534 seems to be the only chips in this family that support
> setting the drive mode of single pins. Other chips either don't
> support it at all, or can only set the drive mode of whole banks,
> which doesn't map to the GPIO API.
>
> Add a new flag, PCAL65xx_REGS, to mark chips that have the extra
> registers needed for this feature. Then mark the needed register banks
> as readable and writable, here we don't set OUT_CONF as writable,
> although it is, as we only need to read it. Finally add a function
> that configures the OUT_INDCONF register when the GPIO API sets the
> drive mode of the pins.

...

> +#define PCAL65xx_REGS          BIT(10)

Can we have it as a _TYPE, please?

...

> +#define PCAL65xx_BANK_INDOUT_CONF BIT(8 + 12)

IND is a bit ambiguous based on the description below.
After you elaborate, I probably can propose better naming.

...

> + *   - PCAL65xx with individual pin configuration
> + *     Individual pin output config    0x40 + 12 * bank_size   RW

Not sure I understand what "individual" means here (no, I haven't
looked into the datasheet).

...

> +       if (config == PIN_CONFIG_DRIVE_OPEN_DRAIN)
> +               val = mask;
> +       else if (config == PIN_CONFIG_DRIVE_PUSH_PULL)
> +               val = 0;
> +       else
> +               return -EINVAL;

Switch-case will look more naturally here (despite being longer in
terms of LOCs).

...

> +exit:

exit_unlock:

> +       mutex_unlock(&chip->i2c_lock);
> +       return ret;

...

> +#define OF_L65XX(__nrgpio) OF_953X(__nrgpio, PCA_LATCH_INT | PCAL65xx_REGS)

When you change to the type, it will go accordingly. Don't add
LATCH_INT to the macro.

-- 
With Best Regards,
Andy Shevchenko
