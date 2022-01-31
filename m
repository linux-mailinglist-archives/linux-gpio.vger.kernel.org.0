Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D384A4925
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 15:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346623AbiAaOOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jan 2022 09:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379346AbiAaOOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jan 2022 09:14:51 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95A4C06173B
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 06:14:50 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id k25so43218464ejp.5
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jan 2022 06:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMBCFmw9ChBGF2oPlPR6ZxE0ECTBg0uAfijnK5pLjCk=;
        b=OOiYgA4Mh1nOc8UPczHmtyc8rjsO6ZCZ5xq0a6+U2EsrLH55LZNNlq/8ckg7+6003d
         Yl7yDkfAWPUm+ygawoWMrcQc/lIBCPJu6pQTOBg5kS8V49SsYGjBPqS1Z/hHh2xfCDN4
         lg2Oq4EXhIJexkOX4KOv84+UHB2FtHIKbbsaJO10PHExGSl/2uu3AR7EKLvfmHe2RF5F
         46BAKdUtwiU5ftwW+K6Yh9J7AH4kMSn0Q7gfT+rndOdcS5kNgyvsJmQCf3btY7N5Tjs0
         rwBDNfF2Y+m3GvH6nrFhsD8jx1mCHeiwD2Rwt4+kHNgQUQeqPWgEj/EYyEWTgBprs/Nn
         GSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMBCFmw9ChBGF2oPlPR6ZxE0ECTBg0uAfijnK5pLjCk=;
        b=Dnek2y81j4ey4EvAZu/t69Hd54LYLHBqLGV0umDZGDu0AA9pDLjHpC4GaZRXDuYn36
         qbn72xOF8QdGZMx0bNCeNlXNrNNlN5oIMVmojmdVRMt6ddiKIaaGPELzL8hPrAtn92mv
         wz4x2EPiIMGvYMasx1PPLcomKDebm7znmbDhnHnD419XErDMmjS/3R6kb0YGTxNzQCjw
         wyxSkmYkgClArx5lnePqWm0YRR/SzLeWEm3X1pnPObsgyFbBMmT/VslOO34Lq/wnm/yM
         yEEMeVxrfDKQrF+Epdvxt1pbiaLSbFvL52IkTHT8D3SlT1fABul+u7AVJPjwF2Z06Aag
         /WRQ==
X-Gm-Message-State: AOAM531HkpwXr8Q8pKg0Q9gqce9JAdqojCZnGsDFwXwUCK5r+J/3XkAG
        N1Yz81AlwgYw42KkQRfXE0pAud12VVEH04PwDJ4f0sxHz8c=
X-Google-Smtp-Source: ABdhPJyO70OdA6/WPizruhGQpoU2FXQobOkNtnJ4Fcop3GbQoE7A/r5V1MdeH5frmjIn97oCt8aMCYDPLsvKoNydIHM=
X-Received: by 2002:a17:906:7948:: with SMTP id l8mr16987855ejo.636.1643638489363;
 Mon, 31 Jan 2022 06:14:49 -0800 (PST)
MIME-Version: 1.0
References: <CACjtZiTK2oUbAQJ5W6CcB=RgNvA=5x0RiEev5eT-SS3RzF9_iQ@mail.gmail.com>
In-Reply-To: <CACjtZiTK2oUbAQJ5W6CcB=RgNvA=5x0RiEev5eT-SS3RzF9_iQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 Jan 2022 16:13:13 +0200
Message-ID: <CAHp75Ve+cZ41K2goqeJv8ow91cNx7uNGprwR50+X3fqAWsddmw@mail.gmail.com>
Subject: Re: Device Tree Property for Setting of Labels
To:     Matt Walker <m@allocor.tech>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 31, 2022 at 1:21 PM Matt Walker <m@allocor.tech> wrote:

> I have a need to reliably identify GPIO pins in userspace,
> specifically I would like the method I use to be invariant to
> declaration order in the device tree (so not based on gpiochip#.)

Not sure I understand the goal. We are trying hard to drop any global
namespace for GPIOs so each of the pins is addressed by [chip,
relative pin #].

> There doesn't seem to be any existing method to accomplish this; and
> there's no existing device tree property in pinctrl that I can see, or
> in any driver that I looked at, that would persistently set a label,
> name, or other queryable property. (Although some devices like the
> stm32pinctrl add a sysfs node like st,bank-name.)
>
> I propose that a new optional property `label` or `names` is added to
> the base pinctrl schema that drivers would then use to set the `label`
> property in `struct gpio_chip` which can be queried from userspace via
> `GPIO_GET_CHIPINFO_IOCTL`.

Names of the lines are visible if you supply gpio-line-names DT property.

> Two things come to mind to consider in this scheme
> 1) I think I've seen other solutions like this where the device tree
> node name is used instead of some additional property, but that seems
> like it would be a breaking change if accepted because then all the
> labels would change as the drivers are updated.
>
> 2) Some pinctrl devices (I'm dealing with an mcp23sxx) register
> multiple chips under the same node. Right now the label is assigned by
> <mcp23sxx>.<address> and it could be something similar such as <label
> | mcp23sxx>.<address> but if we had a property that accepted a list of
> strings then each one could have a unique label if desired.
>
> If this is an acceptable proposal then I'll put together some patches.
> Or if someone else has a method I could use instead that already
> exists I'd love to hear about it.



-- 
With Best Regards,
Andy Shevchenko
