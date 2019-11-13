Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 402E3FAD94
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 10:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfKMJsO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 04:48:14 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34506 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfKMJsO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 04:48:14 -0500
Received: by mail-lj1-f194.google.com with SMTP id 139so1829075ljf.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 01:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h8wWPeVlxP12uFhWBWhUM2EQL5na81+2nwYPn3zw0yc=;
        b=gDtzJC28NlmXeZiJmIKE9Qz+Nir1oEniQBbLai/rrcacDhIUd+glk2A11lbxsk7w4Y
         qJtL2hFy1wUrl5w/bFUgWydUJ4p/Sz82Q99D0kDF5A1F7IOfNIJdCk1IpHN0RVpqkfVK
         FXTmmrjXsRyOr6giqiH+jsppUR10snvjXB20YR7sJrqYbBWS+/ruQeer2N041sgzgi3Y
         dWvAqNpGI69gyF5c8sYzYCTFDsjkrA82k+iOgIXS+iDlEJCNHpokg3521gCxH9Y1n8p/
         1aOW5Cktd8OpCwcILp1P3MIuKdXI2N07ziDh5DYsYd4BcUjmqU0RMMOY/nMSs8WcQUgX
         n3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8wWPeVlxP12uFhWBWhUM2EQL5na81+2nwYPn3zw0yc=;
        b=L3cZ6huN12HBNVy2poxWC64XyOtQdCniU6aDKqPrS8RAIsDsKiZscwZ6PrF8s+Hf8p
         256Vu7igMyK5Ab7yd+oymhh6+VLRAqk/c6LB2QeoEJ8O5aDf65Th2kJO4RlY/9RWwHkx
         Cv1kSZzsEQHzUVRDSOQJoHhZi/pfw/5mD3ApYYIOiTJ/nC9/5wSLBGuptStVoOLjsdXo
         FEZcM9sgnPxBkqt4w1Ah0+jwtOJptnUCYzkErmqVZNOuUCV3AvBqUb509ONLIQD6Rzk5
         aICcSJGBEPqJ+EfJHqJ3Oj7i5NgjKUZxdqBF4oELf9IfKc+D4rwthXVcEmt2zJDtDucv
         9tZg==
X-Gm-Message-State: APjAAAWo0VkjpMPqDmM+iWpCPPUQv6O8GxojGxzwg2PazSLPcSn8iDcu
        u3I4w0is5ZAoRckxJff2XMJwXzggPdXF/n3IjupIwQ==
X-Google-Smtp-Source: APXvYqx+oO/wZZVcmNlHrY/wGD3B3azI1/sGwCtgVyPgIZiRzdhe/sAfrwTVxdFm9E0QYhm1PmbdJlXPZOUS6ScYo5U=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr1840767ljb.42.1573638490344;
 Wed, 13 Nov 2019 01:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20191106115109.119346-1-hdegoede@redhat.com>
In-Reply-To: <20191106115109.119346-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 10:47:58 +0100
Message-ID: <CACRpkdbchDjcqfR2dgebNxJds206HTmKbQXXzoy8A2s-J85soA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Add Terra Pad 1061 to the run_edge_events_on_boot_blacklist
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 12:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> The Terra Pad 1061 has the usual micro-USB-B id-pin handler, but instead
> of controlling the actual micro-USB-B it turns the 5V boost for the
> tablet's USB-A connector and its keyboard-cover connector off.
>
> The actual micro-USB-B connector on the tablet is wired for charging only,
> and its id pin is *not* connected to the GPIO which is used for the
> (broken) id-pin event handler in the DSDT.
>
> While at it not only add a comment why the Terra Pad 1061 is on the
> blacklist, but also fix the missing comment for the Minix Neo Z83-4 entry.
>
> Fixes: 61f7f7c8f978 ("gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied for fixes.

Yours,
Linus Walleij
