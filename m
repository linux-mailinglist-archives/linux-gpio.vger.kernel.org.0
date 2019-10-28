Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3BC0E6D52
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 08:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbfJ1HiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 03:38:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43454 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732043AbfJ1Hh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 03:37:59 -0400
Received: by mail-pg1-f193.google.com with SMTP id l24so6310759pgh.10
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 00:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZdgHK1z/LcMwv9wDk4dkM4TEScMOaCjHgZ3Msl/MIE=;
        b=YJMw151DACLrQ5Neqsre/H+lLNyWuO7CQdbEkN9d2cEzchUALqCCVG6ZIPgbP986iR
         eR6gboWZAm9x2Fn4OMc7GJfEHhNVN121/lYSlMfzDjmaymEwLp3GtSvbbF77A8hrL9PO
         InzHPw3KkCGaEkmIBAJoRAIvRQCkza3fozRJVlPcd7Cmif1M48lI/YXSQt3GwO/x8AoO
         rGeO/KO1zxGlyCYuyDdSuFjkL/SOkSU6rpRF75VbUFlM/Jim4kBaCvAzVuTfD0pZBoTC
         8WxnSnSTHecUiEUZIsPE7lI07hARpHY4WW787ozMtK/Ud4G6AgcrIcMVUtRIZu0HnxVs
         0P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZdgHK1z/LcMwv9wDk4dkM4TEScMOaCjHgZ3Msl/MIE=;
        b=UPKwm1D3vrowRdQZIJyGbSosdBP3j5YQq0EWAE0b98QNnd+dy3orYKPLR8GiPON02t
         j8IdoYUYANcz7SDRl/uW2PY5nkUh1eswGYBSHM1mGSToDE0VwTB7Ov53pnO4cgz04Ae4
         6256EnS3ctVyImGNypRo1ciIL0+sHnTAFtuMRZVj57f94u55H4VrDOxoL0rvWsogFwqX
         ZJgePwf4CeYMizP5omaR/yWQh6kLmYlQYoMzI6m8TlSBR3ufDlSIbtdZQq5rDqwLxF/Y
         3HrRK1vHqbAh+sbLVoaYpJZ1S+6SJp6Fb09vyitmy15ByvrYg9z9BoZ0oiQ7Yw7GCgNk
         HhOg==
X-Gm-Message-State: APjAAAU7+nDWWbu4CGIw90wVkX3XYIa75/+psE9Cm+N5jSRh8mMBEvp4
        305yw6y8fOVz/Nl7J9ti0jdd3l3hv9VRgla/
X-Google-Smtp-Source: APXvYqwInKAgi31OFPXh0qL3JCxObKedty8B1N4tGvsr9MIBJ+ETqMJ+Eq4HNSIPjd/mgwF5PbXLMA==
X-Received: by 2002:a17:90a:77c3:: with SMTP id e3mr20176155pjs.138.1572248278511;
        Mon, 28 Oct 2019 00:37:58 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id b17sm11191015pfr.17.2019.10.28.00.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 00:37:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 0/5] gpio: expose line bias flags to userspace
Date:   Mon, 28 Oct 2019 15:37:08 +0800
Message-Id: <20191028073713.25664-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The major changes from v3 is the renaming of flags in patch 1, rather 
than in later patches, and the addition of sanity checking on bias flag 
combinations - only allowing one bias flag to be set at a time.

There are still some deficiencies that I'm uncertain on how to best 
resolve:

The setting of bias is performed by gpio_set_bias, which is hooked into 
gpiod_direction_input and gpiod_direction_output.  It extends the setting
of bias that was already present in gpiod_direction_input.
In keeping with the existing behaviour, the bias is set on a best-effort
basis - no error is returned to the user if an error is returned by the
pinctrl driver.  Returning an error makes sense to me, particularly for 
the uAPI, but that conflicts with the existing gpiod_direction_input
behaviour. So leave as best-effort, change gpiod_direction_input 
behaviour, or restructure to support both behaviours?

Also, the gpio_set_bias is hooked into gpiod_direction_output, which is 
fine for the uAPI, but perhaps it should be hooked into 
gpiod_direction_output_raw_commit?  Or the setting of direction 
and bias should be decoupled?

And now the actual blurb...

This series adds gross control of pull-up/pull-down to the GPIO uAPI.
Gross control means enabling and disabling of bias functionality,
not finer grained control such as setting biasing impedances.

The support allows both input and output lines to have any one of the
following biases applied as part of the line handle or event request:
 0. As Is - bias is left alone.  This is the default for ABI compatibility.
 1. Bias Disable - bias is explicitly disabled.
 2. Pull Down - pull-down bias is enabled.
 3. Pull Up - pull-up bias is enabled.

The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
and BIAS_PULL_UP.  These map directly to the similarly named 
pinctrl pin_config_param flags.
As Is corresponds to none of the flags being set.

The setting of biases on output lines may seem odd, but is to allow for
utilisation of internal pull-up/pull-down on open drain and open source
outputs, where supported in hardware.

Patches are against Bart's gpio/for-next branch[1].

The patch has been successfully tested against gpio-mockup, and 
on a Raspberry Pi, in both cases using the feature/pud branch of my Go 
gpiod library[2], as well as with my feature/pud development branch 
of libgpiod[3].

Patch 1 adds support to line handle requests.
Patch 2 adds support to line event requests and restricts bias settings 
to lines explicitly requested as inputs.
Patch 3 adds pull-up/down support to the gpio-mockup for uAPI testing.
Patch 4 adds support for disabling bias.
Patch 5 adds support for setting bias on output lines.

Drew Fustini (1):
  gpio: expose pull-up/pull-down line flags to userspace

Kent Gibson (4):
  gpiolib: add support for pull up/down to lineevent_create
  gpio: mockup: add set_config to support pull up/down
  gpiolib: add support for disabling line bias
  gpiolib: add support for biasing output lines

 drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
 drivers/gpio/gpiolib.c     | 81 +++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h     |  1 +
 include/uapi/linux/gpio.h  |  6 +++
 4 files changed, 142 insertions(+), 40 deletions(-)

-- 
2.23.0

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
[2] https://github.com/warthog618/gpiod.git
[3] https://github.com/warthog618/libgpiod.git
