Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7C8EA170
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 17:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfJ3QHf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 12:07:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35043 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3QHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 12:07:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id m7so3329226lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fjCIatttNjum4+tmpUBOgozlvg+bbVx8X5eZm0n8G8=;
        b=nWXMbiHe4wDM0YMS1IXy3HYQMJrhHxMBuF+2n3ZpOtX6bZOhZNC2wdl9TM0o0Chbx1
         Yc59P1aPyEb8GwPOADCaYuMl/gMQc6Mflk2SLBJ8S0E2rWhW+nmNXba7sUxACE4juTIP
         4vanooQa2r3U9Z89OwmKqtlML20VioEsBlAs9pslSe/CdWlrmrWNS1pcRcq0J3EwyF/H
         lGA2/YuhCzmKPCzXhesoN1hhF6hHFRPnh2Y72i41J7KL39inZT0gorYQX1Um2yYDB4sZ
         y9lG99DGHBXwz33i7xQRn9HUrPCH4S0VErwwVoqp7YACyefSRbA2fU04ImWm1Fn/pHyC
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fjCIatttNjum4+tmpUBOgozlvg+bbVx8X5eZm0n8G8=;
        b=rCn5UPQgcuJ6tBXL+JgzpNUrdVy8PtlCDx7pISH7irCzn/U0/IVcKAjGCLV3DaeF1w
         2Rsr6Qw+GfKa+MASs2umq1cXjw+4/Z+8X7nDMxK5sY1L6kUk9RKz8EJAe1IhA+j3UCm4
         sqAqK9tHwPkRTITqKD0Qw/6qbZAiiAlSzop8jPmMsIFD6JgtvmeAmwUe8aF4D2mumo8T
         k46gXpnGaLWmWmh7/sBbvzgBOA7Ib1v2jUFXKwsr0rz/4NE4Q2Z9PZx7WhdoG9/+Rmoj
         v1ORn7CyaX4f7Fp6LP7uSrR5tsZY3jtfoUpsL7/Q8tDg80DnxHV22LdX8LEwH/tsnSKI
         0TeA==
X-Gm-Message-State: APjAAAV5+CQ9VLhUHRXn255zDTCX0bN6HQL/q5tnuoZLLhocsbDVMVtE
        KuThZrH/R+CwKTrUEistAp5lagSD5kLXffhsGKzqqA==
X-Google-Smtp-Source: APXvYqyiUxlQqcEW/atZsjBLK2leQgZ69QBESYkWKM7fGO1o2Y4bNf5y7ElteAmqVXt2L6HMckH22YX9b0oIOQzzWog=
X-Received: by 2002:a2e:93d7:: with SMTP id p23mr343725ljh.251.1572451651079;
 Wed, 30 Oct 2019 09:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191030144940.21133-1-linus.walleij@linaro.org> <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
In-Reply-To: <0e8c15d9-c805-c1ee-f8f0-528866c7ac1c@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 17:07:17 +0100
Message-ID: <CACRpkdZZcfttLrVSTH9RQi3ANcB-uvwOtHUQMiH5m4faaekqjg@mail.gmail.com>
Subject: Re: [PATCH] gpio/pinctrl: Add pin ranges before gpiochip
To:     Hans de Goede <hdegoede@redhat.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 4:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 30-10-2019 15:49, Linus Walleij wrote:

> This does not seem to work I've tested in both a Bay Trail and
> a Cherry Trail device and neither will boot the kernel after
> these changes I'm afraid.
>
> I think it might be best to pass in an array of ranges (*) to
> gpiochip_add_data and have it register the ranges before
> doing the irq-chip setup.

Yeah this new way of populating GPIO irqchips seems to be
pretty imperialistic and pull the whole world into the gpiolib.
I don't mind, once we have the semantic in one place we
can get it right. (As with the previous ordering issues.)
Hopefully it saves us from other problems.

Thierry: is this approach for pin control ranges in line with your
initial design of the new way of registering gpio irqchips?

I guess I can draft something to test.

Yours,
Linus Walleij
