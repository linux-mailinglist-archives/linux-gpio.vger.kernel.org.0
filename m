Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FCD34CF3D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhC2Llc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:41:32 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:46789 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2LlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:41:03 -0400
Received: by mail-lf1-f51.google.com with SMTP id 12so7552198lfq.13;
        Mon, 29 Mar 2021 04:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0NXghuK6J2p/ROcymalVkTDQkV7uB5KSR64W6RUq5WU=;
        b=H4RgJNgK3lxQa8nULbqrEdmmu6SgcGeDXLA9KaiGbLWfIrx5vylTImN8XoxgxAZAHk
         YHwhRiEAo9wzHS23pJYwpf5dCn1d77+Lgrnze5IWqcBrwo/PyTKltDRHvCVbW3LQXpde
         lltKYgG20BvzGibZGz2o2BCK5I3tO4nDc+BiAtwqGcw/D6dbUmDncJkSxI9TWN+g7wnr
         3JsTMNLWoBwazbLt2VaQQfSRw8APz8fx32X/GijsLxfKX9QH1LLlHdbGWbpWUBZK25Cs
         fPg/VBaGTRQQHeqnqU3ervOnPHQjCn/V7Wg5KzOzK5IwxMqhXvUsmAmvkrzRbsyRaKsP
         hVdA==
X-Gm-Message-State: AOAM530LC9myUFXeLHqGJBDJ62WvBrvGxp/nXFnHwTXDfEywtwR7qVCI
        a2xGaTW/yMFP3BbpwKnBr+A=
X-Google-Smtp-Source: ABdhPJy9wjEmvwWzgpE8+6dO7bbkmx8DNwI+fDv6Wx9APGvhVvbn5OSE4fk/hPhmggCIMpxXZaQG6w==
X-Received: by 2002:a05:6512:b26:: with SMTP id w38mr16264361lfu.152.1617018061778;
        Mon, 29 Mar 2021 04:41:01 -0700 (PDT)
Received: from dc7vkhyh15000m40t6jht-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id f20sm984843lfk.207.2021.03.29.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 04:41:01 -0700 (PDT)
Date:   Mon, 29 Mar 2021 14:40:55 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpiolib: misc fixups
Message-ID: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch 1/2:
The deprecated and obsoleted - but still used (especially in older
releases) /sys/class/gpio interface allows modifying GPIOs which are
excluded by the "valid_mask". This makes the valid_mask not suitable for
cases where toggling GPIO can cause damage. Patch adds validity
check to export.

I assume many people are still using the /sys/class/gpio at least for
testing purposes - especially with older releases. Thus it might be
worth the hassle to exclude invalid GPIOs - they're probably set invalid
for a good reason. (Actually, I noticed this when trying to use the
valid_mask to invalidate undocumented GPO on BD71815 - which may be
connected to GND. The people using BD71815 are likely to be using some
stable-release, which probably supports the (deprected, obsolete) sysfs
until the end of the days => valid_mask is not safe way unless fix to
this is backported to stable).

Patch 2/2:
checkpatch nowadays reminds us that ENOTSUPP is not valid error and
should be replaced by EOPNOTSUPP. It'd be nice if GPIO drivers could
return also the EOPNOTSUPP from config and avoid being nagged by
checkpatch.

Matti Vaittinen (2):
  gpio: sysfs: Obey valid_mask
  gpiolib: Allow drivers to return EOPNOTSUPP from config

 drivers/gpio/gpiolib-sysfs.c | 8 ++++++++
 drivers/gpio/gpiolib.c       | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
