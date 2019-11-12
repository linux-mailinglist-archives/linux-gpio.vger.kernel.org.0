Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79A44F9CC9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 23:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLWKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 17:10:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40523 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726896AbfKLWKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 17:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573596636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OGswjGzUffihOSl/n5t/dLNRnhblfx+YfOx5kFh8IX4=;
        b=MqBBnL1ccLn+386iAV3tNxlXoqjYavAJ4X09ylK6awPfvETwE6Xckg927d9j3Tw+9uiRcz
        bzqH01q4gYEjEawDnFz7bSAMllHgrbwnYwXa4Df7dtt+22X6tLXXXqJoTgUkcDkuHCrc10
        5tSsssc+HCEuhO+RqQKkXGwlOwmE9M8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-jauRki2nNwWoJGWr97e18w-1; Tue, 12 Nov 2019 17:10:35 -0500
Received: by mail-qk1-f197.google.com with SMTP id a13so131065qkc.17
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2019 14:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bYI+fJWrfaTVip21z6+iZIacHnQTlTHn+UZkjofOrJ0=;
        b=eENKAcnnICKwAYHgW83eh2EGyq66U+5fyA4MjnI07QKsBW/fNzKKQkDL9Xmr5lyQwC
         KeJKpRY/HBGmb0UEKae/j44uUNxHJxpmwYO97GOSv8erAjpD/12j1tBmDX+3wjPRnvWs
         jUncxlFzAy4lpPdni7nblYR68mTU6Fh0/MBTpMVqWnKCf0LG1jKIHMvwWPKSDYm6HEYj
         H+c8+krXl0xmJn7f0kgRoMx22hcZmBBMjpOPN1GgxIOIbomlCMmIdPIhxw7dkNcjsECP
         59XEr/w+B5QzE48+xt6OhlDTV2YP6FYjmCWkvR7Qwu43zFqebqBZyza2heCaiURO1yu2
         YM8w==
X-Gm-Message-State: APjAAAUfojymhtsJQSYth77wk3rkF6/aqVeSgT9NpRQCkDMa6qFvR1xn
        redCOZAyNnWCOZTWSAtCSJV6mjD7MsmcX3fL255rDLyIBDQ9X2JEjUOcxVxCp9E8x7y6l4ZEf44
        TnodJ+7cYrQK8uqQ6g9RTnA==
X-Received: by 2002:ac8:41cc:: with SMTP id o12mr33202587qtm.310.1573596634718;
        Tue, 12 Nov 2019 14:10:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtJyW+Mbx1NhfAQ3HEARf8vkQ6SiLwJiZfZFujYl6xkNZFUELs855wc2YOfNBe2HIaIxJO6A==
X-Received: by 2002:ac8:41cc:: with SMTP id o12mr33202571qtm.310.1573596634433;
        Tue, 12 Nov 2019 14:10:34 -0800 (PST)
Received: from labbott-redhat.redhat.com (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id s44sm140751qts.22.2019.11.12.14.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 14:10:33 -0800 (PST)
From:   Laura Abbott <labbott@redhat.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Laura Abbott <labbott@redhat.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] tools: gpio: Correctly add make dependencies for gpio_utils
Date:   Tue, 12 Nov 2019 17:10:26 -0500
Message-Id: <20191112221026.5859-1-labbott@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MC-Unique: jauRki2nNwWoJGWr97e18w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


gpio tools fail to build correctly with make parallelization:

$ make -s -j24
ld: gpio-utils.o: file not recognized: file truncated
make[1]: *** [/home/labbott/linux_upstream/tools/build/Makefile.build:145: =
lsgpio-in.o] Error 1
make: *** [Makefile:43: lsgpio-in.o] Error 2
make: *** Waiting for unfinished jobs....

This is because gpio-utils.o is used across multiple targets.
Fix this by making gpio-utios.o a proper dependency.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
I made a similar fix to iio tools
lore.kernel.org/r/20191018172908.3761-1-labbott@redhat.com
---
 tools/gpio/Build    |  1 +
 tools/gpio/Makefile | 10 +++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/Build b/tools/gpio/Build
index 620c1937d957..4141f35837db 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -1,3 +1,4 @@
+gpio-utils-y +=3D gpio-utils.o
 lsgpio-y +=3D lsgpio.o gpio-utils.o
 gpio-hammer-y +=3D gpio-hammer.o gpio-utils.o
 gpio-event-mon-y +=3D gpio-event-mon.o gpio-utils.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 1178d302757e..6080de58861f 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -35,11 +35,15 @@ $(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux=
/gpio.h
=20
 prepare: $(OUTPUT)include/linux/gpio.h
=20
+GPIO_UTILS_IN :=3D $(output)gpio-utils-in.o
+$(GPIO_UTILS_IN): prepare FORCE
+=09$(Q)$(MAKE) $(build)=3Dgpio-utils
+
 #
 # lsgpio
 #
 LSGPIO_IN :=3D $(OUTPUT)lsgpio-in.o
-$(LSGPIO_IN): prepare FORCE
+$(LSGPIO_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 =09$(Q)$(MAKE) $(build)=3Dlsgpio
 $(OUTPUT)lsgpio: $(LSGPIO_IN)
 =09$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
@@ -48,7 +52,7 @@ $(OUTPUT)lsgpio: $(LSGPIO_IN)
 # gpio-hammer
 #
 GPIO_HAMMER_IN :=3D $(OUTPUT)gpio-hammer-in.o
-$(GPIO_HAMMER_IN): prepare FORCE
+$(GPIO_HAMMER_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 =09$(Q)$(MAKE) $(build)=3Dgpio-hammer
 $(OUTPUT)gpio-hammer: $(GPIO_HAMMER_IN)
 =09$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
@@ -57,7 +61,7 @@ $(OUTPUT)gpio-hammer: $(GPIO_HAMMER_IN)
 # gpio-event-mon
 #
 GPIO_EVENT_MON_IN :=3D $(OUTPUT)gpio-event-mon-in.o
-$(GPIO_EVENT_MON_IN): prepare FORCE
+$(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 =09$(Q)$(MAKE) $(build)=3Dgpio-event-mon
 $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
 =09$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
--=20
2.21.0

