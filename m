Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A1E25F733
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 12:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgIGKDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 06:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgIGKDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 06:03:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1208C061575
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 03:03:04 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i1so12045738edv.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eu0tVdC2SapQmxPGnrOiQAZ5HG6pSAsS9H4UlH7DET8=;
        b=ugGVMJW5RJbLvOkkPTzMtesjDjGP+0VKjWNbvyeyw2RAMXE6OInFtbSWjFRmI2mEZS
         Qsd8ZTpoPGy21huaFxq7lp3WRwdQ2JfnmeqB9iOMeg5qjFXrc5D3naTXSyS3YuGEFwBm
         oRbHf7veaLO0JOYUz/DRU9qgAEXENey2/qrOyy7qen1h8LeM1btTG83H6yE/8QPWql7s
         PzxcpQ97iEe6gy1nn1Kp/keE93njE+5j0WNLrCc2AomoVHBqeHFuwlm8+z6haucaxF0Z
         72HZWjDalObdCuk9FIuI/j7BVINn0EVKCXAj8MCKTFXVU4ebqr3a2n1HRESpqbxbLXcv
         oUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eu0tVdC2SapQmxPGnrOiQAZ5HG6pSAsS9H4UlH7DET8=;
        b=pnvIbTnTDBWjGHaSKGkkawWaU1+HRt+ucFpPvoyRVAJcxFYItwuGT81Kp7phjbZlUt
         N/VVq3B04fUyp12LicffoN8A8idDOJMBuMj/d9pLazkQ5ApTHidMoubxRm8sQWc5B205
         PRAcoJO3/Q2nGy60fCtpIJlwMwDogNRsNKYrorM8KbZxhd9wqvpPdGht+8YzyLtA3yPd
         uMRfWCmX01GODCWy3TwSg8xDrY8tUbedO71GOGHcJ1fmOXPQpIeo7Jc9QAz7X+f5MAIt
         kgi8z09Lixe6pFqhzHc2oRBcVbxNH6YQHkud5iAyWq2Kwg1zRUA9RqaVY2fNuwy8IKUK
         ebAg==
X-Gm-Message-State: AOAM5333D8v+ZpHIl8GovldwJJmnJnKtZP+xoz6nwN6FkHFEhGvaBWsN
        72In6J2QBKrEtAN081r8vAFtA2AKK6kkmXmz0XWS+Q==
X-Google-Smtp-Source: ABdhPJyHe8iRM84KrK6dTuGNdpxVVoq6lwssCgqCJnFgT/lL4ex/fl0tLxkqjF/9CuLd6Vxm+bMEsR7nsnt/D2ZfdeU=
X-Received: by 2002:a50:d809:: with SMTP id o9mr20387639edj.12.1599472983149;
 Mon, 07 Sep 2020 03:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-4-brgl@bgdev.pl>
 <20200904163517.GW1891694@smile.fi.intel.com>
In-Reply-To: <20200904163517.GW1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 12:02:52 +0200
Message-ID: <CAMpxmJWQsgV5WZrdPW3UUOVTEy1L6Y_rb7ThQK1QTRinmHSqWA@mail.gmail.com>
Subject: Re: [PATCH 03/23] lib: uaccess: provide getline_from_user()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 4, 2020 at 6:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 04, 2020 at 05:45:27PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Provide a uaccess helper that allows callers to copy a single line from
> > user memory. This is useful for debugfs write callbacks.
>
> Doesn't mm/util.c provides us something like this?
> strndup_user()?
>

Yes, there's both strndup_user() as well as strncpy_from_user(). The
problem is that they rely on the strings being NULL-terminated. This
is not guaranteed for debugfs file_operations write callbacks. We need
some helper that takes the minimum of bytes provided by userspace and
the buffer size and figure out how many bytes to actually copy IMO.

Bart
