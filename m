Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6198CEB31A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 15:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfJaOs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 10:48:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46540 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbfJaOs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 10:48:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id 193so3234866pfc.13
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAz3dZQ1+PeJBVteQgNZhWc6GtR60GDAt2mWNwMyC6k=;
        b=MsJc0KGubUkG10/gkEDS4Dgqa1fEFjunO6BW3TjHj0YzRxbR5V/+TydXgYEkFrS4f7
         WuVi95cm5VlZYrfaPdraa11CxU/6C1IDevxfJD3wSIIS2CMa2OpoFYRfU97gL0YiTeRx
         pi1662AKFCQTtlDrO7SNGiAsTJ9ffi2N55kDqiLgR0GzIhuAoY7TYQMIHELSzxtBqS83
         A8Tl8rabJmLdinY2GqtqbxxVtLqgRhYocskWbw/Oebt3ozVyMUwNP+dyHNfNHwmKjRJ3
         iYN5z2au9XA95oLun33Vn70/fxarFYzg3We7QLumUgInOamK6sslavQz7fy2CED7Fu3Y
         XYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XAz3dZQ1+PeJBVteQgNZhWc6GtR60GDAt2mWNwMyC6k=;
        b=mJ1RSvDUZt6P8tPvjQQRoA0IZL6A//ZFv1/bMpk4Cs4muEF9vk5+ZgJvOLvfTN1RXh
         1xQ+UHUT/DDEVrKgyA0TzU7CHHb9HeTaGeOnmYHodMesOPbv4A0n+2nGTzl4g+3Z0ZIr
         ZPOLQ20NQUMz3BPO4E8F1KmrSMRoxS2UKhRjZQ83Qt8kx0zpKfLcJPhVmlwpkONPbW98
         iuJKOD3ZsjPtpwKjxIdYuV/X37KUQFul4mMNU10YcI/2l4S9eb0xclIEsxVhsAmWj5vY
         dp6SbAHLNi0AwURSgUkZy9uQiiMYhp4wmlv4BaRqKPSVdZkgzr2S1/fm8zUHgYhBUvz+
         umng==
X-Gm-Message-State: APjAAAUjehiDFIrQh0bPNTFqCxVm6IWVtlzl2H3zbyXeHzpj1sb2dYDj
        jq2LyeU/ehquPd/oVp25FTv3lBsNMdqXXg==
X-Google-Smtp-Source: APXvYqwGQC9ckzlQfCpRXVab8aaxVPhicOb0M9f59JRJc+jHu5DaCk89S90knGuA96AHCqKEFQwyPA==
X-Received: by 2002:a17:90a:de4:: with SMTP id 91mr8066267pjv.113.1572533337445;
        Thu, 31 Oct 2019 07:48:57 -0700 (PDT)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y126sm4568456pfg.74.2019.10.31.07.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 07:48:56 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/2] gpio: add new SET_CONFIG ioctl() to gpio chardev
Date:   Thu, 31 Oct 2019 22:48:23 +0800
Message-Id: <20191031144825.32105-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes from v1:
 Address v1 review comments, specifically refactoring line handle flag 
 validation out of linehandle_create in a separate patch, and refactoring  
 the set_config itself to improve readability and minimize changes to 
 existing code.

Add the GPIOHANDLE_SET_CONFIG_IOCTL to the gpio chardev.
The ioctl allows some of the configuration of a requested handle to be
changed without having to release the line.
The primary use case is the changing of direction for bi-directional 
lines.

The patch series is against Bart's gpio/for-next branch[1] with v4 of 
my bias patch series "gpio: expose line bias flags to userspace" applied.
This is necessary to support setting of the bias flags introduced 
there.

The patch has been successfully tested against gpio-mockup using the 
feature/pud_set_config branch of my Go gpiod library[2], as libgpiod has 
not yet been updated with the uAPI change.

Kent Gibson (2):
  gpiolib: move validation of line handle flags into helper function
  gpio: add new SET_CONFIG ioctl() to gpio chardev

 drivers/gpio/gpiolib.c    | 162 ++++++++++++++++++++++++++++----------
 include/uapi/linux/gpio.h |  18 +++++
 2 files changed, 138 insertions(+), 42 deletions(-)

-- 
2.23.0

[1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
[2] https://github.com/warthog618/gpiod.git
