Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C414813256E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 12:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgAGL6E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 06:58:04 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37479 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgAGL6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 06:58:04 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so38688262lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 03:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xDan+NrzXoxR0IPHrL1TDLZarGAclLuRifX+nstdyLs=;
        b=ZPMn1nE42pxSFIb1/Jg5EmMBDBWfpJQgc8kIHzd/wnsIg2z055kAeJe7IZ2lGrc4VL
         5iOir8/YoGZBNkqMWNXaOcbg+N/r6+fBoQT6km2FvUpMk7pcIVvr8jxVeX0JbAzzGCZN
         iI49xWxMtMPuXPX0jJ2HosEiAOgGCEvLEVp4WJzyqu0yjdtWOLNiu7F8F7TIV++LYAZr
         uOhFfo5Xoefp+qWIgsAz4DVWy6WFyiBlgFZ5gTi7lZacYbdFEhKD6rb0esbk/bVgt7Kh
         ds63EIcLrBWwiztHDjS82JL3nJTbkG9Wgjt4BDhKFhlUtUkb1ZapxVFO3gsFt5mE4e6D
         w8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xDan+NrzXoxR0IPHrL1TDLZarGAclLuRifX+nstdyLs=;
        b=X5oyVVBFUfacac5zGS/3vQUVmhC0ghX2Oc4g+++Xxj+HHxKpwKRMvQzVYI2Mq57o4+
         vlkzcJzEXkCtwpMAopggTHNdLR8cmqHbuYT9AgCkIeWhBz9XFOeXiAA+lXjPobg3NTuO
         M4gRRxoA2XaW16B0yx4Xae0qEuvLdQcPopIWUPaS/ORUjCoC+czvK62uVVz7hfwNqxYX
         dN//kHXdvcGV+1w5Y8qXVpOEetv3zpw06Jbs6VQuhVzqYBUziV0qYKgPzkh4M+r9md2D
         xVQ6YLl6NUsh8Nk698gW8L4EqGufJ1co93XwmS4DtBbksxgJ55Q/ViW5jdcgwZX7Sx8V
         za3A==
X-Gm-Message-State: APjAAAVh2XDEyMzKOAPb2HaSfyv0dPf3eEbjXA6wKXV0MIaR4m/xK5tk
        9NoH7yeW0jdmNzTdkyM/nNSS/kcCQm65J6f+UeXEJA==
X-Google-Smtp-Source: APXvYqwBV7Ee1u2/FkNJ0D4MbpRQIHVF3KeTSLqGk3g7UjA/Un7cz14I6dnnOSlGcQuSrKdeuZpBbnhTEHw44fEXAz0=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr59154614lfd.5.1578398282446;
 Tue, 07 Jan 2020 03:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20200105160357.97154-1-hdegoede@redhat.com> <20200105160357.97154-2-hdegoede@redhat.com>
In-Reply-To: <20200105160357.97154-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 12:57:51 +0100
Message-ID: <CACRpkdYx864UEo9-Bpiian4evJMrrCN-kp61s+Y1gc7BZ88KZA@mail.gmail.com>
Subject: Re: [PATCH resend v2 1/2] gpiolib: acpi: Turn dmi_system_id table
 into a generic quirk table
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 5, 2020 at 5:04 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Turn the existing run_edge_events_on_boot_blacklist dmi_system_id table
> into a generic quirk table, storing the quirks in the driver_data ptr.
>
> This is a preparation patch for adding other types of (DMI based) quirks.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied for fixes.

Yours,
Linus Walleij
