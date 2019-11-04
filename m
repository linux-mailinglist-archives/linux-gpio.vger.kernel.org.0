Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 097F8EE336
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfKDPKk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:10:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41876 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfKDPKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:10:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id m9so17986772ljh.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lkzso/KNS4hPCWEFFoEdJwSnP6JYaHS9kqjVc2qBLSg=;
        b=SMvGj4rLv4lmHgh6tBdDDlAO4lvw7wMFUoDufFyH+ziZ0UeHgeQPQJbGZci20EcAHt
         PPpaNu/TBpGR9j1QGJ4hWhCdObjhVAC+gZusQ0wywmtqTPaD4ddufGoinKU8XZqJxruA
         Y/LjPWwzOQGpeuqnzhJX32rH186w4wZITKVSTBD+vYjx0mh7EmLvpMKdwNmHXeEFXr6f
         FaBCNSm1Qnpm/Mnu9y00UeWyS6LGG7gW47pvDHqCAu1XKV3xjFsvF/EUS2weJGW7uT8F
         Md7syfTnNQYkDbOvm0/F5ub5XxdmHsxoslJh8UfeXy1hN07IxgesCiCMgpOUHQdcbFcZ
         TYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lkzso/KNS4hPCWEFFoEdJwSnP6JYaHS9kqjVc2qBLSg=;
        b=imoMvVGpN1DCQnxKUBPEQSp6VsCbAxH4+A7ZXNVqMnnXNBLoWGcKCBoJCUDAKs29iT
         8Gfnyz8SrIDXeIabuDD8/LNwkGySQvg6LijEiGhXS/I+WRJbM2U2xqgabHUgdL2HL3CS
         Pt8exDzV1XeUZjl1OGiQODIjMknn1yN4JRWEHjdhPPQT0R2y1y2fFqKOlGMOWmX8eY/T
         2IACU3l/6GApOi5R/KuHznTDIT0vlAfaCbtBx0X3J/YoJjWXOyOzrsL8QP2NAyYe4/Lx
         wzaFXjcINIKvgpmWqEbQvMsyXBH66rPSTs+eQuTDNIZq13YBMl4RlzOXGM5polKc9ViV
         DQNw==
X-Gm-Message-State: APjAAAXU9crA0jxNxKzoHha+Z6MmuwvGA0GNeVt80uL7hPyyF1kjv7tq
        F43mvF2PXXBEhlouVaQ6pzy2c46Ln4dBdvQsclqltcU4PeQ=
X-Google-Smtp-Source: APXvYqxZtILYkVZBV9bycwH3O8sWpn9j3Ct4pCpd4ecnL+1Hju1pNe6Oca2Ie8ZfAXakNm8baLEjMec9iW9V7cbVpvk=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr18480680ljb.42.1572880237929;
 Mon, 04 Nov 2019 07:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be> <20191024122224.11776-2-geert+renesas@glider.be>
In-Reply-To: <20191024122224.11776-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:10:25 +0100
Message-ID: <CACRpkdZ5DB4fBDpkCG7NMrRohHcejj0EfjqN882c5wc+pahW2A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: em: Use proper irq_chip name
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 2:22 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The irq_chip .name field should contain the device's class name, not the
> instance's name.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware.
> .parent_device not filled in as this driver doesn't use Runtime PM.
>
> v2:
>   - No changes.

Patch applied.

Yours,
Linus Walleij
