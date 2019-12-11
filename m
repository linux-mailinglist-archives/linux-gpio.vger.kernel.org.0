Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB40511AD7B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbfLKOcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:32:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39087 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbfLKOcL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 09:32:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id y1so5546804lfb.6;
        Wed, 11 Dec 2019 06:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=I/qN2tanqUKZDvFX3/9aZXGYpQisaWWATCmdCTHOfCc=;
        b=oJuoLuHBHavjgxV4Hx1cgqWgJm4QE1N/K9Orkb1D1+vAzEv8nU9pqTV7hrvK4ljF0a
         x490B8FYuXVTcPvCpbEafoxe55Gd5Xz0oggGfU3nkbZOQXz4kHn7NraAgF4U+/ce1wU6
         b18BpiJMTocO5SUv4Ru4PmxmIaYk8LWRAXhuYNOSc93GLhNtWycujnc7z7EtXK6n4diw
         hx67j1teSEIcreOk4S2U4E/rUB9dHQGKznboYxSVTn0GhsDFqX/gGruy15z4bmWJqRHn
         /LyNZLr1WClDgiEfWZpJmFX5BBdHQQlN/SsrEW5j+e1QZf9xE7qRRsXNmuUH+DjTMYqv
         Erow==
X-Gm-Message-State: APjAAAWm9D40sixEOjBEjgTxBkYgrUzCBcEtXKxZaZ5Z3NZFsxeK/Wy6
        L+In97GlqKAsoGvfXWbb7oU=
X-Google-Smtp-Source: APXvYqxcbhVK9kxySlyOcrIdHH+ijf3BhMhBtW/zkiYEMH/YQ3hcXL+bKnv5UxBcUsFeJEGMoOLb/A==
X-Received: by 2002:a19:f716:: with SMTP id z22mr2494614lfe.14.1576074729594;
        Wed, 11 Dec 2019 06:32:09 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id k23sm1318457ljj.85.2019.12.11.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:32:09 -0800 (PST)
Date:   Wed, 11 Dec 2019 16:31:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Use new GPIO direction defines for intel pinctrl
Message-ID: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We added definitions for GPIO line directions here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=9208b1e77d6e8e9776f34f46ef4079ecac9c3c25

Let's use them on Intel pincontrollers too.

---

Matti Vaittinen (3):
  pinctrl: pinctrl-intel: Use GPIO direction definitions
  pinctrl: pinctrl-cherryview: Use GPIO direction definitions
  pinctrl: pinctrl-baytrail: Use GPIO direction definitions

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 4 ++--
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 ++-
 drivers/pinctrl/intel/pinctrl-intel.c      | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)


base-commit: e42617b825f8 ("Linux 5.5-rc1")
-- 
2.21.0


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
