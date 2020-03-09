Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6442817DB61
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgCIInN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:43:13 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41458 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgCIInN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:43:13 -0400
Received: by mail-lf1-f67.google.com with SMTP id q10so6209772lfo.8
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFZklOC8eQ4vPpmf/ePS4n1RvGmzQQVrmDJ4B5UJgcU=;
        b=DtynUAXIFjYZ6gSHrY2iYPGMgJjKNYH48HuQlgYfyYk+hbqEGs0Unck6FXXh9i9kdI
         dRwVtn6WkGNlVDEBBGQ6rI81Nu4rCY149BKpy746m1tM0dy5aTMv6ctWdF38l0p5V3Zx
         u26/3YnRsedbRvhfVscXtnWeiXQIl2KAm7ZHmPQ5QWrywuqyC8kDi0Km8SggiSS8h99s
         2QnkOquHIdGMCi+lAKWqS5PJ6OP2tlA+HDlc1djs6ZoiX2v3FGdItqUM0Ul0llFIh/B5
         I4137mhC7k7sqNb6mYx5/8wNwoe5f61/XgUKTvfaOuD/MEzahn0b79pcmQUNimxsBgC8
         OBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFZklOC8eQ4vPpmf/ePS4n1RvGmzQQVrmDJ4B5UJgcU=;
        b=eonqVSqBGXdWq9YRSTK0HV0A8eoaGXaoXP3y0zPV0ZOf4HI3x1C3Vdl2m1QYdvVQm+
         8MeMzfPqTW4o9R+RFLOde2bxO++Og/zLwyeTbn1Q4BhoGI44uI73/qBvJCI7nrd4hE5V
         YH6mkDm+v/XynCgRcD8CBnqViWR7R340DuLPQm/lTw6iDzk5DZursHulIqP+4rUectCi
         uAbecvcp1cY59AvEimxNEvKlJ0aLYf3zG01yN4zSmovOd5yZKiQCH+XiEROunliRuxez
         dwHTC2sIh2ZC9wIKsT8g9CrYI3lui10fC4HKekiZgMXXNCDvHTfUA6E2DgE9mmj8sj0y
         F3SA==
X-Gm-Message-State: ANhLgQ3ZUqa1S5gf1nzVSC1TfCaDsibvLQl6FHaW69KJLGQH7us+wQSW
        NREYVo9wS6DANcuGGFQ2eF/nNWGz6jFVOTdYU2lFKQ==
X-Google-Smtp-Source: ADFU+vs6CZg4lfnwU6po9hgDsaGmf042x14BEQSlH7x9WJbDgmP61IX5QXg0Aixt5wGl3qa+KwwuhZn3QBrRh9gKphI=
X-Received: by 2002:ac2:5e6d:: with SMTP id a13mr9107029lfr.89.1583743389738;
 Mon, 09 Mar 2020 01:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200302111225.6641-1-hdegoede@redhat.com> <20200302111225.6641-3-hdegoede@redhat.com>
In-Reply-To: <20200302111225.6641-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 09:42:58 +0100
Message-ID: <CACRpkda1On50ZVOsbGfk0qvq=iyCt0R5WKGNMK8oHXhQPH39Jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpiolib: acpi: Add quirk to ignore EC wakeups on
 HP x2 10 BYT + AXP288 model
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

> Commit aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option +
> quirk mechanism") was added to deal with spurious wakeups on one specific
> model of the HP x2 10 series. In the mean time I have learned that there
> are at least 3 different HP x2 10 models:
>
> Bay Trail SoC + AXP288 PMIC
> Cherry Trail SoC + AXP288 PMIC
> Cherry Trail SoC + TI PMIC
>
> And the original quirk is only correct for (and only matches the)
> Cherry Trail SoC + TI PMIC model.
>
> The Bay Trail SoC + AXP288 PMIC model has different DMI strings, has
> the external EC interrupt on a different GPIO pin and only needs to ignore
> wakeups on the EC interrupt, the INT0002 device works fine on this model.
>
> This commit adds an extra DMI based quirk for the HP x2 10 BYT + AXP288
> model, ignoring wakeups for ACPI GPIO events on the EC interrupt pin
> on this model. This fixes spurious wakeups from suspend on this model.
>
> Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mechanism")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Split out new quirk addition into its own patch

Patch applied with Mika's ACK.

Yours,
Linus Walleij
