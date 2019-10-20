Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAE5DDEEC
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2019 16:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJTOnt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Oct 2019 10:43:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44288 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfJTOnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Oct 2019 10:43:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so6047218pgd.11
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Zn993W+tz15EU+ukFNn5G4Vxb6wOfPnjiHrwIVw9ew=;
        b=HLEni6ab825ZtsPPNBKPYraDr5IYfiJJDtLRd/9yTxXCrXnBUfs2uPEpLjCLb3GBE/
         1g3U8OtPbLFsAw5hUMHDxAlsIfGpkryqs9mWw4tnYutOscoFZUW5K7QJ1Lti0gKQw/qn
         TGKR/cquTutihGVRMokqlMSoINu5Pg5eQnrdcYks8u7miSNmqpjOJ+8sJ3hyT2TBRJs+
         xA+BW6AnyqmY930qEYiwQXDLO25Qtx//9jrD8kj1BXu4C+fmCK5EeqkIogm4AAdaCpKq
         8H4Q+1gtMaH3qVigysns0Nc6vK2QkcT6sU2cS+bPtyPNc/2qhqk7ppO6NChDQ06L1EGl
         iYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Zn993W+tz15EU+ukFNn5G4Vxb6wOfPnjiHrwIVw9ew=;
        b=svPvwCSK+VtW4lMUzil8rWRf7zpAi4Ad0GO2f7HVoTcLoHeyIY9wqXMiHMLm1S33tq
         x419op3wHEf9Yrp8xh/4RUKNrXo/wRczXTQmOlBaBe71Q3V6/jiKQkflHrEOcOPMbG55
         qRU4faPTu0tWMToMojOyrCcrWC7gI4QsWngFkuuCbD7K/nxqZ53GX/A4ORgoecqgU+AT
         CnyKACgBKVhHvWzzmXux75jvPAOb4AvaP23ZYx7PjlRgXvi021n6ire9/7T67O7OTJam
         QAp0OfCpIqm9XXVR0BVWpAJhmj7mBCR4cjdwsmKyyTtbkDAskFiBHKugi/tB6V/VfmmE
         FPTg==
X-Gm-Message-State: APjAAAVLlwOB4Orh8+Fa7sKG48M/Z1NGaxP8Ea5dwJJBSKXcjKmS8lJ6
        eZKsum1NRyfETliyfr0uKpT0x2cSqAp+hw==
X-Google-Smtp-Source: APXvYqyS27TERnyZt+5F9TSS3kUXo/YWsAz/j+9PgQqREcwJIOf47FLqbntphtcnxc/NIfX/gWxEmQ==
X-Received: by 2002:a65:6203:: with SMTP id d3mr3570848pgv.272.1571582627740;
        Sun, 20 Oct 2019 07:43:47 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w14sm14671842pge.56.2019.10.20.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:43:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com
Cc:     drew@pdp7.com, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 0/5] gpio: expose line bias flags to userspace
Date:   Sun, 20 Oct 2019 22:42:33 +0800
Message-Id: <20191020144238.14080-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The major change from v2 is the change to three separate flags rather 
than encoding four possible values into a two bit field.

I expect more work is required.  While I was initially satisfied with the 
patch, I have noticed a few deficiencies that I'm uncertain on how to 
best resolve:

There is no sanity checking on bias flag combinations, they are passed 
through unaltered to the pinctrl driver.  I'd add sanity checks, but I'm 
unsure which combinations are invalid.

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
gpiod library[2], as libgpiod still requires updating to match.

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
  gpiolib: add support for bias output lines

 drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
 drivers/gpio/gpiolib.c     | 65 +++++++++++++++++++++++---
 drivers/gpio/gpiolib.h     |  1 +
 include/uapi/linux/gpio.h  |  6 +++
 4 files changed, 126 insertions(+), 40 deletions(-)

-- 
2.23.0

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
[2] https://github.com/warthog618/gpiod.git
