Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7017DB69
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgCIIoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:44:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42518 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgCIIoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:44:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id q19so8992770ljp.9
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WuWdu7nxXfXVt4yHlJeP8mC4hyCnfyWtZ6yU8HPw5Fo=;
        b=esNgclYyu48TDTWPjISveSQvodz5uYROWjA03ivciBULXvldwwxd7ntoUpWKDUfOhG
         DJ5l8YSvUsEFI+XcIZkQJkXdJ2OOAJHuQAdUgrw3tLtCF3yqCs3xQfZEd9UU+Xd14fD0
         eNkTkB2FlvwBmSzIpkK865PRiU0yxhtfmsdIk77eeDvJtB21aWYqBEwb9wZwnOAzkHCT
         o56aGxOW6HbEo5TMiUJGh8JMbZ46aW8r8yTnnw5qU00MVTT1HjF9AbC9hp+JZnOxUFSs
         9r+Kr7VUQ2bJeDhef8nkLO7Ua6DUBnUo822+ibc5oAYGzSNL5ZRIxLpH8JBZy4I+sllj
         Bbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WuWdu7nxXfXVt4yHlJeP8mC4hyCnfyWtZ6yU8HPw5Fo=;
        b=OrBtzGr5Jz0ZBjRhQ2nSZ76KEe0SCR6QqzKcaOgzUpNwdapM0pMxaX6VU5BVibWEBt
         EqWLcbw0sVOXo1sBBknpr8wl9ScCoP1F9MycixVqIAoa5WjTG6KfZMY1YV45grkx6Y/m
         1z0jmETnBuN3NQSHO/USeQWHXWaQY3pHWLGVT6Lx+cybreisEKDkHecyJYXABkUF+Q81
         +o+5jBOSLqhmwejTuYAQN8nv8VFIBFpKCTDMySC1VOYpxJmbhs5ADomEBuaB+xVIIGO7
         VXHglONDEH/r3hp70CMlnqkGUzlvMqWkyK7qQBp+79V3cl/d6ckvuc/N2JIEL6dtLk43
         NAwQ==
X-Gm-Message-State: ANhLgQ2jYdtU1b/Yr8M3RQQLV6Xb4KD+mzp+xGg6ru07jOgbEz0sTuh6
        qIek0SO/bAItzSEQQyccVtywSLh1LGG/whBAQaSGuw==
X-Google-Smtp-Source: ADFU+vslcN9/s1UNg2sU76s/qyS/lNsAhzbkrCnooWqOOLmAI2CKk33RcEZ5HS7lDWi1QmS/nEaiEqLd9O2UYTVTao8=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr806580ljm.168.1583743470931;
 Mon, 09 Mar 2020 01:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200302111225.6641-1-hdegoede@redhat.com> <20200302111225.6641-4-hdegoede@redhat.com>
In-Reply-To: <20200302111225.6641-4-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 09:44:19 +0100
Message-ID: <CACRpkdaASfOQ5EYjUDyq88E8x=J5EE7OA8LckgBC8N8o-Q7YcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpiolib: acpi: Add quirk to ignore EC wakeups on
 HP x2 10 CHT + AXP288 model
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Lehmann <schmorp@schmorp.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:

> There are at least 3 models of the HP x2 10 models:
>
> Bay Trail SoC + AXP288 PMIC
> Cherry Trail SoC + AXP288 PMIC
> Cherry Trail SoC + TI PMIC
>
> Like on the other HP x2 10 models we need to ignore wakeup for ACPI GPIO
> events on the external embedded-controller pin to avoid spurious wakeups
> on the HP x2 10 CHT + AXP288 model too.
>
> This commit adds an extra DMI based quirk for the HP x2 10 CHT + AXP288
> model, ignoring wakeups for ACPI GPIO events on the EC interrupt pin
> on this model. This fixes spurious wakeups from suspend on this model.
>
> Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mech
> Reported-and-tested-by: Marc Lehmann <schmorp@schmorp.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
