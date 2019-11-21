Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839C810530E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfKUN3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:29:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35870 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfKUN3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:29:31 -0500
Received: by mail-lj1-f194.google.com with SMTP id k15so3245170lja.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YN2w1QdeDBIuN3qrvGe7lcTmletib6z+wgOMFKHY7Jc=;
        b=z0D/vAdjjQSyzAWXFCGlx0mQhnZHTcZlfWaq5Qz5iceeXxCA4g/kzxHhHFEFlTe1+N
         nhZogCkSWdq55opMhIVeMgHKii93UZkSEwOzzefX64wRD+5244EDJLmgZh4vS4GHvxGX
         iY/4KLPuCtQ+5vUYXQnVsXirlpHZfrSD8NqYLTskvhXDRRzExKj9C7ABEeBDZPUR8Sh9
         IivRc7UELfFmAbKWQBW8pdUMVq7ujo9lH4i1hhdCX+AfD+tuapyWaOxjdn1akEC32+mN
         2411hXmyZbtqijqvGxZkiA3KvTGiFb8CNvvOdYI7li575zqxOY8YzlQyNpGU+lhM9U6J
         V1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YN2w1QdeDBIuN3qrvGe7lcTmletib6z+wgOMFKHY7Jc=;
        b=gfGvsGDL/vzFfHyZv1OAi9Wr7fFRkTJLci7O3kSHEMnC/XRKxYI6z4Z+CPROZPiYQl
         42ymR27Z9TO09G8Mk/9FQ2AAUG9yE9Xe5F4E+34S9mkOfzv5dKcHZjye5EEGHPnnIKCl
         gKOBTFSoy8iKhKG2guoxJbDV9tVuPjr9hFl+5RR7g6oYJnA3wgPAT57RRLnmh08YW73q
         A5h+V72EbjZ0N7NXYGjNl0PSD0Gdo+jZ0riEoigxhAQGiaee1iDj2oh1SLBxuxqrRGuP
         pvy8C/ezPEm1ajETJzmpqnZiolWTNrQxE1U02ycXHz3oWwKyIoOR4OGw+dW9MyuEwcZ4
         GuiA==
X-Gm-Message-State: APjAAAX9tWgDwDI8JowDhS5jd8A/haGih0nEsFHd5VJNrWs2mxwU308h
        2EEMyE8e64DemvyGWBCo9RDLB/SD3KqkCwul3a6ytw==
X-Google-Smtp-Source: APXvYqzJjUSGVSxtMk/wGwbd/ToHrDSThJ5abTzaibpX5Atj5Wt8bITkUmmAvXD2mRbW1lHFa+1ERqvKcZOi8m3HrVU=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr7269836ljb.42.1574342970066;
 Thu, 21 Nov 2019 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20191115125551.31061-1-olteanv@gmail.com>
In-Reply-To: <20191115125551.31061-1-olteanv@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:29:18 +0100
Message-ID: <CACRpkdZ5eWHEV-oN77QxH9X4DZRUB3zM=gP=+rM=ZLAX6Wxw9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Don't overwrite default irq_set_type callback
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 15, 2019 at 1:56 PM Vladimir Oltean <olteanv@gmail.com> wrote:

> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> The per-SoC devtype structures can contain their own callbacks that
> overwrite mpc8xxx_gpio_devtype_default.
>
> The clear intention is that mpc8xxx_irq_set_type is used in case the SoC
> does not specify a more specific callback. But what happens is that if
> the SoC doesn't specify one, its .irq_set_type is de-facto NULL, and
> this overwrites mpc8xxx_irq_set_type to a no-op. This means that the
> following SoCs are affected:
>
> - fsl,mpc8572-gpio
> - fsl,ls1028a-gpio
> - fsl,ls1088a-gpio
>
> On these boards, the irq_set_type does exactly nothing, and the GPIO
> controller keeps its GPICR register in the hardware-default state. On
> the LS1028A, that is ACTIVE_BOTH, which means 2 interrupts are raised
> even if the IRQ client requests LEVEL_HIGH. Another implication is that
> the IRQs are not checked (e.g. level-triggered interrupts are not
> rejected, although they are not supported).
>
> Fixes: 82e39b0d8566 ("gpio: mpc8xxx: handle differences between incarnations at a single place")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Patch applied with Michael's Tested tag.

Yours,
Linus Walleij
