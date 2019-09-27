Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCF95BFC9A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 03:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfI0BNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Sep 2019 21:13:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46189 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfI0BNY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2019 21:13:24 -0400
Received: by mail-io1-f67.google.com with SMTP id c6so11685500ioo.13
        for <linux-gpio@vger.kernel.org>; Thu, 26 Sep 2019 18:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vEE9lOyJedYGEKwzVDnKuOkrG0RTwYW04dLMK0cfVNI=;
        b=aewx8DaVgi2IdGL01e4RMmtoymyhqnU1GKAbN4jN+2MeIAH5LDTe27X9hTI4aQQZ6v
         9TRC9vcS29nS6XOnSEfGzgsIU6hpszM9EamSBK20+M5v1RzMXAoG5eM5ccdafnaMZgsC
         j7Jiv/gSplXSNatW+xjRZG6YvpXWe+QvxtcNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vEE9lOyJedYGEKwzVDnKuOkrG0RTwYW04dLMK0cfVNI=;
        b=K0W0U0MNaf6olDfi5N+I6ylMqSj/VC3vRyWn1wzw/gmc16c5xPVNReXnTJRRlqoAAK
         k99EsofwlVa4HpvbfjG7M+NiG2XgWb6oNVE0JjGEuIQMiJ5J9HQv0N0yPEfMcZeDEQsR
         dY3XhSRkuNO2i6dz5F6M528tFdGz7N7jWudiFzMs602LzlA+NKiy2tibrea0qobrGrq3
         QrRO0BcR44cptUGae3C0B3KSf5mEkaB5ICtPZDsiYJ9JzJdfd8jQriR/JcQwWMSMLlaa
         VaxB1604qzmsxmJ7mlozJYg1PC7M47Ulb/6RFwPeA+4Zgl+mRIBqbHQqKiGPup6Yh2CN
         6TMw==
X-Gm-Message-State: APjAAAU4TEXd7tRyAhlOQLwFpW1feh3Ky2m8abnut2Xo0zSADm5jAfX4
        B02XZAX+HZ99uZg5iiacODHd6g==
X-Google-Smtp-Source: APXvYqyi25JQWLz5zuPdbjoyS7rTFaHfpEmPpxHwSsRTBjT+rhIcseiZPcgjtZuZTSP2Nu6zbDvXAw==
X-Received: by 2002:a92:1685:: with SMTP id 5mr2085408ilw.81.1569546804169;
        Thu, 26 Sep 2019 18:13:24 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z5sm1717813ioh.23.2019.09.26.18.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 18:13:23 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, --cc=linux-kselftest@vger.kernel.org
Subject: [PATCH] tools: gpio: Use !building_out_of_srctree to determine srctree
Date:   Thu, 26 Sep 2019 19:13:21 -0600
Message-Id: <20190927011321.4612-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

make TARGETS=gpio kselftest fails with:

Makefile:23: tools/build/Makefile.include: No such file or directory

When the gpio tool make is invoked from tools Makefile, srctree is
cleared and the current logic check for srctree equals to empty
string to determine srctree location from CURDIR.

When the build in invoked from selftests/gpio Makefile, the srctree
is set to "." and the same logic used for srctree equals to empty is
needed to determine srctree.

Check building_out_of_srctree undefined as the condition for both
cases to fix "make TARGETS=gpio kselftest" build failure.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/gpio/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 6ecdd1067826..1178d302757e 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -3,7 +3,11 @@ include ../scripts/Makefile.include
 
 bindir ?= /usr/bin
 
-ifeq ($(srctree),)
+# This will work when gpio is built in tools env. where srctree
+# isn't set and when invoked from selftests build, where srctree
+# is set to ".". building_out_of_srctree is undefined for in srctree
+# builds
+ifndef building_out_of_srctree
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))
 endif
-- 
2.20.1

