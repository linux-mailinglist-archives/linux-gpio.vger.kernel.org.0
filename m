Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1727832ACDD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383717AbhCBVRM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576925AbhCBFfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 00:35:10 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552FFC06121E
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 21:32:18 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d12so10549835pfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 21:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AND5hR7g+etm8p1XQXNCrrPsiiY+ufosQMI5JJrzRVE=;
        b=K8lCA4A1uHoty55BpP30fhzuelUH2422FzM5XyB/82aEOA5s8Jc2Pgs1pEWiBARHZJ
         BQl/rNrns8TZZ3ExaMbFs9OZ5/1pqLO8alJmor3Sd7nfjHmpzqeM5cDtJEXy2Qi/309W
         421xXN/4fvHLnYge+BcT9EoTKWNzKqc0SELYrRo3cU1QPhtfC7iqOzW1yVwOswg6ZDb7
         zcjwnnD3DCiTlt7xxta+/eTAf3f3cXHfkmaTghgaoc+RGIjSKC+e9HUjr7OPFsoFS190
         Ndf3AJb3ndkz+HcMgWIPB/dgvK9FxiS6OjhAOC0miRXWLZlistc5JY+uC2Krwokxad01
         AV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AND5hR7g+etm8p1XQXNCrrPsiiY+ufosQMI5JJrzRVE=;
        b=hjpLhjxDznCH4SbKbCrLlLXBC2y1kIaUDC/svim0XVjejHMFh81D+dUNL5IyssltFk
         xRXEyZQu8FXOk1wnUWFkt3ZDe6KE6aagW4UKcvlCTowf2k+tvuLF5H0YkakS1c9z6g8s
         Yd+z6JETZpeTlelM56KtqLnoLzI+X1cSAk32tgBLfnlnWhJsGj8hRop4wvpL5huzGhvv
         uAvJrx8yU1LrJR2bNDT2pJxmBbAoZhPZYNIY4uDczHOo4WlLdNjry3YS+9Aa0BFkaN8j
         466Jo2Rrf5LGw4cZvJe1VTi8oIzG7n4I6iOoSZ3kHup936jAp+QvxtRn10gF9os3Qjir
         R0tA==
X-Gm-Message-State: AOAM530iT45yodDPkIt8zEPzETJYhdtryPSL3g/t0gQN4/ci/b/+HW2/
        0WzjnowwI3cb/CU50CB+8fQsUw==
X-Google-Smtp-Source: ABdhPJwR7z3pWYUC4wTDcM0bfq7Sktc8xgnJwNYrkaJBxgxBFwsQ1OUnnxNUFTqJB+axKz/ngiOIvg==
X-Received: by 2002:a62:804a:0:b029:1e7:d747:de3 with SMTP id j71-20020a62804a0000b02901e7d7470de3mr1888106pfd.38.1614663137892;
        Mon, 01 Mar 2021 21:32:17 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:37ab:7b44:a136:e385])
        by smtp.gmail.com with ESMTPSA id o129sm17929757pgo.27.2021.03.01.21.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 21:32:16 -0800 (PST)
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
Subject: [PATCH v9 4/4] docs/pinctrl: document debugfs files
Date:   Mon,  1 Mar 2021 21:30:59 -0800
Message-Id: <20210302053059.1049035-5-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302053059.1049035-1-drew@beagleboard.org>
References: <20210302053059.1049035-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document debugfs directories and files created for pinctrl subsystem.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 Documentation/driver-api/pin-control.rst | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 3d2deaf48841..c905b273e833 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1428,3 +1428,40 @@ on the pins defined by group B::
 The above has to be done from process context. The reservation of the pins
 will be done when the state is activated, so in effect one specific pin
 can be used by different functions at different times on a running system.
+
+
+Debugfs files
+=============
+These files are created in ``/sys/kernel/debug/pinctrl``:
+
+- ``pinctrl-devices``: prints each pin controller device along with columns to
+  indicate support for pinmux and pinconf
+
+- ``pinctrl-handles``: prints each configured pin controller handle and the
+  corresponding pinmux maps
+
+- ``pinctrl-maps``: print all pinctrl maps
+
+A sub-directory is created inside of ``/sys/kernel/debug/pinctrl`` for each pin
+controller device containing these files:
+
+- ``pins``: prints a line for each pin registered on the pin controller. The
+  pinctrl driver may add additional information such as register contents.
+
+- ``gpio-ranges``: print ranges that map gpio lines to pins on the controller
+
+- ``pingroups``: print all pin groups registered on the pin controller
+
+- ``pinconf-pins``: print pin config settings for each pin
+
+- ``pinconf-groups``: print pin config settings per pin group
+
+- ``pinmux-functions``: print each pin function along with the pin groups that
+  map to the pin function
+
+- ``pinmux-pins``: iterate through all pins and print mux owner, gpio owner
+  and if the pin is a hog
+
+- ``pinmux-select``: write to this file to activate a pin function for a group::
+
+        echo "<group-name function-name>" > pinmux-select
-- 
2.25.1

