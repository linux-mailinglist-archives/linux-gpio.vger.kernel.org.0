Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B77D39D7
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 09:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfJKHJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 03:09:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35871 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfJKHJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 03:09:35 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so8748722ljj.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWgob5d4p0REGmPW5DeOf1y1OySo7atv0XXWHpToEJg=;
        b=M7K+x7qr1CP6YGrOrQeh/6Z7skPB12+78Ch9HgdOhqTtJ4KEBhNTuNRY9XvQ7/afRF
         RrNadeFv6la1MO/xpxJAh4yMJgAYoUJYE6bi+pQy6eziQCBxAskB+52EPc1QLlscJePK
         ELFEaNqqgMgYM6n0/LMqwkDwpzJf7QMdG+jDkVl/haUu/9nxKbUp2eAjFPce6UfpylN/
         2/0zqK6hs4eJjIpKwy94EFNXur6Vnb7gagHJxisYF9XwAXLpkPmHPY8LRNRSNmZ1f5sK
         Xwv/zQf2WuoWGJDXcl3MQjTs8npzlO+ZgpdXxpPCL6GVvFn8Z+rCg47tV3hNOgYKIRwK
         omPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWgob5d4p0REGmPW5DeOf1y1OySo7atv0XXWHpToEJg=;
        b=n7zHh2QcL/HA2xVa1ijQS9JMr8mx7yj0lQc0bjBEbdG+cK2X6NqE9yoZ65sPuLWPuX
         93zcNCEklBcFQszpLBSaTU8ASCW9/5pM3v5VLdU0ePFbaA5F5nnXA8Ix4Urz78NdNO37
         armbRI8GylYJARGZ71RGzZrF43g24+vrxTLUxDPSDHivmDNYlm6BtuJVO8qCb36gVjin
         KhitCQI0WZaRiZGFhM29PUiO9dSVd2tIx+WE28jtXsHuc3+kmSxx6vFdL8YgHbTY3tkF
         c8OoZ3bbV4f1e4YN/vhfUtiC3joDBIC5o7VofBIADhI+8giXkm9DNiB8ety8eYmxaytA
         IXPQ==
X-Gm-Message-State: APjAAAX9sVSeNxlu0gPI2ZeS7vAjwcgjm4JBGgKfQECq6f0N7eZDG0jH
        IAxyXQZV5ebCJrbVXHnf/lC2/X1ZCbb4Ce73qTO6yw==
X-Google-Smtp-Source: APXvYqyurwzYo6EDeyeIoHS+h97TDxDhJaJD9VsyALGFgC8zMTxvBvVpbA4LNHbmJv8ZUvvjbMsXyXd4bKMLcjpcBE4=
X-Received: by 2002:a2e:481a:: with SMTP id v26mr1653653lja.41.1570777381015;
 Fri, 11 Oct 2019 00:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsEZohCedO1d+-oQkGnxpZm6kJnBCRgGPswRKGOxkx41yCxiA@mail.gmail.com>
In-Reply-To: <CAOsEZohCedO1d+-oQkGnxpZm6kJnBCRgGPswRKGOxkx41yCxiA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Oct 2019 09:02:49 +0200
Message-ID: <CACRpkdb7irxRVCB2htGhomnO-EpPSPRd9VqmHktwBo=+2Zx4tg@mail.gmail.com>
Subject: Re: GPIO controller driver pull up/down without pinctrl
To:     Jay Aurabind <jay.aurabind@gmail.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 8:26 AM Jay Aurabind <jay.aurabind@gmail.com> wrote:

> Quoting "Documentation/devicetree/bindings/gpio/gpio.txt":
>
>          Optional standard bitfield specifiers for the last cell:
>
>          [snip]
>
>          This setting only applies to hardware with a simple on/off
>          control for pull-up configuration. If the hardware has more
>          elaborate pull-up configuration, it should be represented
>          using a pin control binding.
>
> So if I do not want a separate pinctrl driver, how can I do the
> necessary pull up/down setup in the gpio controller driver? I could
> not find any drivers using the simple interface. Is this facility
> available?

See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-pca953x.c
Callbacks pca953x_gpio_set_config() and what it calls further from there.

Yours,
Linus Walleij
