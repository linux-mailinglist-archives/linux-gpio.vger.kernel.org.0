Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B6732ACDB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383611AbhCBVQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576911AbhCBFfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 00:35:10 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B25C0617AA
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 21:32:16 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id x29so4876437pgk.6
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 21:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ht1wwu87z3JhpBjBpd8FKyeEduSGnqVohpzCm9+7/Ow=;
        b=apVKSZWgoeLiDpHGcX9NymEg4gxI8eP1A0FI3ekhcDryElSYAp1Cv9S2hb5Q1Fvd94
         qDppsqWoER9gr7I3cb6h159kaZJ47P/CzWeQL6Uh8umGZQyPgnugA+OZZwDL8BN5NqlF
         aR58jeM97uEpZvimxpMIlzOMouImC/zkebnEwYU54EtMB7TFh3f10qA9KBwDZic2n1j3
         qTiJVVF3qdm09EJeDi3YuYkU694RWSDSSFeBJvJ1zN/TRHJz0235FA6fFFxpwiAWOTwo
         zjNpFfIi3IQa3uIh1N2rK6oCgqxWszWvg5CQG0iG7ICaR9hc2K7Z9WSSdZiv98+7I6lk
         LF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ht1wwu87z3JhpBjBpd8FKyeEduSGnqVohpzCm9+7/Ow=;
        b=Nu65uxDu3n7162DDrY6nfTjbhbDv1mVxRXtPQFKoIN1qmPbGRS5q1j4+6+EvGK0u6p
         kLVpHSG3+2JTs15uWUdz3BCIQYOd2KPXwzNZtnnQmpD202xQ0pG6QQyAAjQlASVeUm31
         3+FfOGDor/V+VJi1OmhnroAoVeJZfkYYHRdftq4LnACrmf5lswl6yqDZ/9rZWbOLCJmU
         24y05yQNafXku30QoQaef17rgMOXmdvw8ylHEfphEABbN1gnp3IyKZoV/pdSXDYS0zlS
         Hp7UvB9Nfgs+ZERfQFC+9hRxL+09DHwd8xVAuvah9LekhbazRndXMjwQA106GvKu8CnL
         V2Jw==
X-Gm-Message-State: AOAM532PkzUYTYjLRMa+u0FhMyHfze7QKuKj7hMxvDayALz1b7rbqH0e
        80oIy2RerTbmtlI3vw4Wlqd7rQ==
X-Google-Smtp-Source: ABdhPJxKSVFYlEEmAbq+oSCI5KZXWULv5hz+F0Clg77XGNbgbbBU2Yuq3l2SVsGYd7wf76F6Tso05A==
X-Received: by 2002:a63:505d:: with SMTP id q29mr16349370pgl.218.1614663135741;
        Mon, 01 Mar 2021 21:32:15 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:37ab:7b44:a136:e385])
        by smtp.gmail.com with ESMTPSA id o129sm17929757pgo.27.2021.03.01.21.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:32:14 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v9 3/4] Documentation: rename pinctl to pin-control
Date:   Mon,  1 Mar 2021 21:30:58 -0800
Message-Id: <20210302053059.1049035-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302053059.1049035-1-drew@beagleboard.org>
References: <20210302053059.1049035-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctl is not ideal as pinctrl (with an 'r') is much more common. Linus
state that pin-control.rst would be the best name for the documentation.

Link: https://lore.kernel.org/linux-gpio/20210126050817.GA187797@x1/#t
Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 Documentation/driver-api/gpio/legacy.rst                 | 2 +-
 Documentation/driver-api/index.rst                       | 2 +-
 Documentation/driver-api/{pinctl.rst => pin-control.rst} | 0
 MAINTAINERS                                              | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/driver-api/{pinctl.rst => pin-control.rst} (100%)

diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index 9bc34ba697d9..9b12eeb89170 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -461,7 +461,7 @@ pin controller?
 
 This is done by registering "ranges" of pins, which are essentially
 cross-reference tables. These are described in
-Documentation/driver-api/pinctl.rst
+Documentation/driver-api/pin-control.rst
 
 While the pin allocation is totally managed by the pinctrl subsystem,
 gpio (under gpiolib) is still maintained by gpio drivers. It may happen
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index f357f3eb400c..cd382bda2cf9 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -60,7 +60,7 @@ available subsections can be seen below.
    80211/index
    uio-howto
    firmware/index
-   pinctl
+   pin-control
    gpio/index
    md/index
    media/index
diff --git a/Documentation/driver-api/pinctl.rst b/Documentation/driver-api/pin-control.rst
similarity index 100%
rename from Documentation/driver-api/pinctl.rst
rename to Documentation/driver-api/pin-control.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 281de213ef47..c54c98910dd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13800,7 +13800,7 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
 F:	Documentation/devicetree/bindings/pinctrl/
-F:	Documentation/driver-api/pinctl.rst
+F:	Documentation/driver-api/pin-control.rst
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
-- 
2.25.1

