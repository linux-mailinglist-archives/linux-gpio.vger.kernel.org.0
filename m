Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C354150740
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2020 14:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgBCNas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Feb 2020 08:30:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51785 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgBCNad (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Feb 2020 08:30:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so15922638wmi.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2020 05:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkFDQxZCGtJvMWzgeiZLBXi4rV3V0DscLDICyLa6gb8=;
        b=WMxnr3hliH7xsSmJQs31Wm1EwnsEB4wXvs70NjdbIQsbpXyUzmv3RXEwLv2P0FpP9r
         Q43faHFZ9r18pgqRxWLRryYOW0aULXFUCsE3yVebQPIlXMPGCa0ycpIJtcIwZPcjiXVI
         c7Vy261zT6XDDrnudN9lOJAzy1iQS+RrK/Yv+h+y1u64tGkURfOdm2t67OnB5kBL2TDq
         RkAr9U1Su1sh1ip5LgN/cz3YnX6vgTcbSGONur+niBD8+YnTfLaNZKTdSbhk0ns+svc7
         1KmsWE3GKLWB7x1Lji2qRNm6zqJMPySYf6uvgAlQqpt3vhtmFXOTbOeYwPvBC5yK5mz1
         pJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkFDQxZCGtJvMWzgeiZLBXi4rV3V0DscLDICyLa6gb8=;
        b=fY69cyCgLPKAc+DwyuBc/YG+Tx6E9DX4ZdZiRed+fAtWYwgnpsg5x5o7DJKgrC2XNH
         6Z6OfKdY3xCjK0I6YHUfTPxwv8A+2YIcTawa4QrNNZEHHhys4vhHAAXWISYJoo0EjV9k
         BvaHF1VSKk+RIGSqFWHROTa8x8+e+9DRyYQaeKE7WlDJSkJJyvFnndLm80/HFYQH1xnz
         5t/vsmz8rbwllknFl3Bos1RTkyJpTSP4uR0MOURPVrDXrwVV37dnKynBGEtwMqXFiy/l
         UJLBD0WghGhhH2XML5X7exS6erb4qMIYNX00b83ZBDeTHB2Ddwc59MOK1l6D6Ii+XTxj
         LoPg==
X-Gm-Message-State: APjAAAUc5IZ4jwbK/Idz5YAvl1xL0jbrdDBUnnGt4r4utT/lU1aSb0/H
        6alG6wG/04ej7mjCytYhPcUDZA==
X-Google-Smtp-Source: APXvYqzn5qm82dgj5JBm0iOxgAssGQdutrj66VNZBEU6GDKHm91YhpdHpMfx5cHD2PlWa09RqDhJWw==
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr29957834wml.110.1580736630865;
        Mon, 03 Feb 2020 05:30:30 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id l8sm7594540wmj.2.2020.02.03.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 05:30:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] gpiolib: fix a regression introduced by gpio_do_set_config()
Date:   Mon,  3 Feb 2020 14:30:23 +0100
Message-Id: <20200203133026.22930-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

These three patches fix a regression introduced by commit d90f36851d65
("gpiolib: have a single place of calling set_config()"). We first need
to revert patches that came on top of it, then apply the actual fix.

Bartosz Golaszewski (3):
  Revert "gpiolib: Remove duplicated function gpio_do_set_config()"
  Revert "gpiolib: remove set but not used variable 'config'"
  gpiolib: fix gpio_do_set_config()

 drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

-- 
2.23.0

