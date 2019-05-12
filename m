Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902EB1AAC8
	for <lists+linux-gpio@lfdr.de>; Sun, 12 May 2019 07:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfELFin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 May 2019 01:38:43 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36009 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfELFin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 May 2019 01:38:43 -0400
Received: by mail-io1-f65.google.com with SMTP id e19so7613167iob.3;
        Sat, 11 May 2019 22:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOZN+SK2gVP5ZzIA+xeed/ra0KVa6puwpCXtwiG4xO0=;
        b=U5TdMqOHTZdMmfJpeoYu3o1G/g5jmufNUwhBklpJrRmAp2KOTN1uTeUCE97H96r9Cm
         9MbZmd+9XiYvMzsuLSjBsBh601tjwzvkeizdGRSMF84AJuNVZn7QEX7PHFJpf5SZGsxM
         5Hwn3gm555I5m+HPPHgGfV+XbqZdnwiLl1r2TT5ZagIfYfhmEEIIE6LFj26O3wMbIc6H
         IJId3e7uOHtz0VAX2nZlfdyYnHA2XDtAwNNKr0tirwoUnkZoKe+zlGZOOCKQTBpW8zPd
         qI5bHbzb2+R7+Z9hWsgxUgTEvE3r+PnlHffwU19xlIh95siFVyAFGVbbFOESCGinoSNW
         Xt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOZN+SK2gVP5ZzIA+xeed/ra0KVa6puwpCXtwiG4xO0=;
        b=fHq2D3lb2ExuQWhP0uSYAcZ01s7gNdPOdSYZ0TnizMsZj+QDoxXzB37ge4sDbLeouH
         2UqwoDn0Z2u+mentgy57GA9oFJhnDhV7Q6UxhHEdmcnlsp48zv9JsB1jIPU7dW6xSn9A
         USXsgdZFQs/d54z7agoXz9+jJbtSYLwyTbuJ3h8rZ7l4pGE+UkKgGCUGReFa6thVm132
         ibvqsJZqlNVXfRl1ERJPXEC+zQ56ZoaDBhGSGh4glknGXatPbk+a26MabG+ZSH+56WcG
         MvesobN+nJqygivpDxUW3RJanozZHXdscXo7Ukqx2pXGEdIhlC0r9Q13tyb17tK6fNsL
         l/jg==
X-Gm-Message-State: APjAAAVnYoP43PPsBrKoQwnW1x/KjBDe/4r8Av+W7hLq0xLDZtMBmukN
        QDCiGpQrA6b4YJ7Nz/U5YsE=
X-Google-Smtp-Source: APXvYqzeCyGJksHSbg6OMEEaQF92TD5KLU3uA4fwibMQ3+I0+oAjxg1LMdZzyKzifs71AGudSCqejw==
X-Received: by 2002:a6b:8ec4:: with SMTP id q187mr11277905iod.280.1557639522264;
        Sat, 11 May 2019 22:38:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-243-191-173.hsd1.co.comcast.net. [73.243.191.173])
        by smtp.gmail.com with ESMTPSA id i195sm2982290ite.41.2019.05.11.22.38.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 22:38:41 -0700 (PDT)
From:   Kelsey Skunberg <skunberg.kelsey@gmail.com>
To:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Kelsey Skunberg <skunberg.kelsey@gmail.com>
Subject: [PATCH] tools: gpio: Add include/linux/gpio.h to .gitignore
Date:   Sat, 11 May 2019 23:37:49 -0600
Message-Id: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

File include/linux/gpio.h is generated after building
tools/testing/selftests

Add gpio.h to .gitignore to help clean up working tree status.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
---
 tools/gpio/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index 9e9dd4b681b2..a94c0e83b209 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,4 @@
 gpio-event-mon
 gpio-hammer
 lsgpio
-
+include/linux/gpio.h
--
2.20.1

