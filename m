Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018CE38B863
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 22:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhETU3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 16:29:17 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:55772 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238545AbhETU3Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 16:29:16 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jpGWlKVEa5WrZjpGqlTUNb; Thu, 20 May 2021 22:27:52 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621542472; bh=o/VOXlmBh1ZPZnnDv+64KXqpTUEGPerJE1a/PoV9LoU=;
        h=From;
        b=h+mYj61r2xOt1YhNmBxJpHL+MEu5uTWM9JEshHiHXHgKd2RJCbGXEVHZTgBjZKLJx
         MrRhmRkF0LQNxRNxY0mLgv1YJWqE1hniHZYFqeNY8pPx7SKJXtAwM+966MCwLj1xPx
         DObtLPpYi/ct5fcL4DtBdvKi3DznMOLJNTKnlsvH1VRP3dfp6ck8ugE13ZXaunllTh
         +6tyk6UPIzNeLBSUmFAnizce9J94YRznIbC3vjm/Dt9HgoA3fvZS/LvFvYTXP9jEdH
         83xoHKJhoK1Ndmfar3IBiDWffx4yKLXrNBYijq7Ue2CoVxHZHtjcpyUafO6P2O3Gtt
         RJle74aI88PRQ==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6c648 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17
 a=SMixqbvZskzAqJ1qg7QA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/3] docs/pinctrl: update `pins' description under debugfs
Date:   Thu, 20 May 2021 22:27:28 +0200
Message-Id: <20210520202730.4444-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520202730.4444-1-dariobin@libero.it>
References: <20210520202730.4444-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfC4IQyqC8yCTSZda7J5PnkJEZPbrYTBhBMpEICGiISDhj3SIApr58H3eUSX81XdpOeXFDgL4V8j6laxA6ZXoeDcOKIUSg9cKw9BjupDw/smTuSgUSlBr
 souIJhr6BvMOTnSpF4hwcJZS2Wqo/yklxTVGnC3TB8HlcSbXC3rsDCkzKfsgd1p6638feX3hC6nWXWDZcvgmMmXO3wW/tFtS6uaEKFqgATGlgZOQ+hSrwAFe
 Et0byIGpu8McQQG78e6hnTxI1qp0Hg5AJyXexs7/jTHJityWfH/4UoeKEZstSCnwPQViTVNeGaHRmyeyanWUEgGxPVIsL+OXs7edxmOzRXv6HYa85nOVaQeK
 bGX30ln9MURWLXnNh4dLXP7lZkgCY/DjJkMTBi5F6HuPhDWw7XKwz5i57vxVJ7KS0zSz3ZdI34sAT0LyKluvUvBb1Q0ldjgiY7+QdDLqmhghcrhdhytYHtq4
 /Hf8Cn07xvWV+J06QPnjBubUpIFRw2ZizMnkwg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Optionally the `pins' file created inside the `/sys/kernel/debug/pinctrl'
subdirectory of each pin controller device now allows you to set the
mux register of a pin.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

 Documentation/driver-api/pin-control.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index e2474425fb0c..3d8192fa45a3 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1447,6 +1447,9 @@ controller device containing these files:
 
 - ``pins``: prints a line for each pin registered on the pin controller. The
   pinctrl driver may add additional information such as register contents.
+  Optionally writes the mux register for the selected pin.
+  e.g. to write the value 0x73 in the mux register of pin 19:
+  echo 19 0x73 >/sys/kernel/debug/pinctrl/pins
 
 - ``gpio-ranges``: print ranges that map gpio lines to pins on the controller
 
-- 
2.17.1

