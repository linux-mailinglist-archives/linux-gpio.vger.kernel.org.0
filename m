Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167552CF22D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 17:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730699AbgLDQs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 11:48:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:57418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728997AbgLDQs2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 11:48:28 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBBEC229C9;
        Fri,  4 Dec 2020 16:47:47 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klEFF-00G234-Lh; Fri, 04 Dec 2020 16:47:45 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: [PATCH 0/4] USB: ftdio_sio: GPIO validity fixes
Date:   Fri,  4 Dec 2020 16:47:35 +0000
Message-Id: <20201204164739.781812-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, johan@kernel.org, gregkh@linuxfoundation.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having recently tried to use the CBUS GPIOs that come thanks to the
ftdio_sio driver, it occurred to me that the driver has a couple of
usability issues:

- it advertises potential GPIOs that are reserved to other uses (LED
  control, or something else)

- it returns an odd error (-ENODEV), instead of the expected -EINVAL
  when a line is unavailable, leading to a difficult diagnostic

We address the issues in a number of ways:

- Stop reporting invalid GPIO lines as valid to userspace. It
  definitely seems odd to do so. Instead, report the line as being
  used, making the userspace interface a bit more consistent.

- Implement the init_valid_mask() callback in the ftdi_sio driver,
  allowing it to report which lines are actually valid.

- As suggested by Linus, give an indication to the user of why some of
  the GPIO lines are unavailable, and point them to a useful tool
  (once per boot). It is a bit sad that there next to no documentation
  on how to use these CBUS pins.

- Drop the error reporting code, which has become useless at this
  point.

Tested with a couple of FTDI devices (FT230X and FT231X) and various
CBUS configurations.

Marc Zyngier (4):
  gpiolib: cdev: Flag invalid GPIOs as used
  USB: serial: ftdi_sio: Report the valid GPIO lines to gpiolib
  USB: serial: ftdi_sio: Log the CBUS GPIO validity
  USB: serial: ftdi_sio: Drop GPIO line checking dead code

 drivers/gpio/gpiolib-cdev.c   |  1 +
 drivers/usb/serial/ftdi_sio.c | 26 +++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.28.0

