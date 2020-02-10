Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2E15744B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 13:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBJMNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 07:13:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39668 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgBJMNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 07:13:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id o15so6858935ljg.6
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 04:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vN2cr2vYuekIm6JB3RgzI3N00DPK13rxE05UgfLMK1g=;
        b=YIBsA5VJek4eTnKn2pyI8v0xnHMc6C4Me1qGENSJaftZsVsADcpc7zQdgAcvstNpGI
         5uUV001BlBaybQA8GmgHoJRqBxxM5Lq5CyNCKgSrOzLzaC414i3TG5gAYLt+8gc4q/5G
         rsoeEPAQcQL8WP6F5zUiR722OFbq6TNOkeoAyIfgowZ/o9t4weJ/jtY0nAdAYSM8mlG5
         PECJAaVQqb8k39iwk77F+1E6Jwh7tqDIzlLNToxNuoiaN0m8pDpC8mUfCGgCLxr3ZHDd
         jEUB4tk2OlInOczT/HDeua+aqxGkJUWFpjji73fqdMH8VPQ91nMkt+nZRLmdaJeynLuf
         zaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vN2cr2vYuekIm6JB3RgzI3N00DPK13rxE05UgfLMK1g=;
        b=jIpzkOYtv2jn7+OXqOH7wch0a/q5akNbASrSzyQJGN4uSTBvwZtjPdSAggQUjgc7EQ
         d/HDvL5tJ5N7KCxLJYDgC7OTT8tDlhHXViNrYFED/+sXmkTQQjEfRKxk+9xAG8SK8Tos
         hUH+AIRhvbGREzoBWpAZZE7CVHacKa3+kUCqDvhc7dH64vmAzHzbxqKsq7dOfukFHrDY
         Bn5AZsXrU/6qLJvKzX1iudQJZlzAPpKiIZbr/xQMPWCuUUsfIn3N1dPIEcbHzEnWV/ns
         eI1oyiAVTfeLbRHG7ZMQTqCfNf5MYhkrZAJWUmbfAdPAicPqeUm6Jp4hltON9MHOpaSl
         GQyA==
X-Gm-Message-State: APjAAAUjZqRW0y/vtDp6Rl0S05D48WgdP4GBDJLyyeoYG6qfFZlMTnfS
        szdRIE3DA5YsPTd9Yt3xG9u7kCvoJyarWGi9sbhAjdEH7Go=
X-Google-Smtp-Source: APXvYqyqMjSOxKkLTzhlykvdu5X6v3ck2AqaYe6S9rhtmxvr4OjpPMMK1+q4Qeb5isYmKKI7mE7VWDk2kpFAgXhCU18=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr756323ljg.223.1581336814637;
 Mon, 10 Feb 2020 04:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20200205194804.1647-1-mst@semihalf.com> <20200206083149.GK2667@lahna.fi.intel.com>
 <CAMiGqYi2rVAc=hepkY-4S1U_3dJdbR4pOoB0f8tbBL4pzWLdxA@mail.gmail.com>
 <20200207075654.GB2667@lahna.fi.intel.com> <CAMiGqYjmd2edUezEXsX4JBSyOozzks1Pu8miPEviGsx=x59nZQ@mail.gmail.com>
In-Reply-To: <CAMiGqYjmd2edUezEXsX4JBSyOozzks1Pu8miPEviGsx=x59nZQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 13:13:23 +0100
Message-ID: <CACRpkdbBOfYQ9kxaDG4vwtnm1eu3yMDM-ZGJPyev-P4Fz5QT5A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: Add quirk with custom translation of
 ACPI GPIO numbers
To:     =?UTF-8?Q?Micha=C5=82_Stanek?= <mst@semihalf.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stanekm@google.com, stable <stable@vger.kernel.org>,
        Marcin Wojtas <mw@semihalf.com>, levinale@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 8, 2020 at 7:43 PM Micha=C5=82 Stanek <mst@semihalf.com> wrote:

> Actually it is a GPIO offset in ACPI tables for Braswell that was
> hardcoded in the old firmware to match the previous (consecutive)
> Linux GPIO numbering.

That's bad practice by the firmware authors. (Sad face)

We have enough problem saving ourselves from our own
legacy ABIs without someone handling out more guns to shoot
oneself in the foot with. :(

I'm also speaking on behalf of Microsoft and others in this I
think. In the past we would find Windowsisms in the BIOSes
and get really annoyed that we had to work around them.
Now there are Linuxisms in the BIOS, that's not any better.

Yours,
Linus Walleij
