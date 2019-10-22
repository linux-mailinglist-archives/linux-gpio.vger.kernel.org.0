Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D43DFFD9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 10:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388042AbfJVIoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 04:44:02 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:39062 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388166AbfJVIn1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 04:43:27 -0400
Received: by mail-wm1-f42.google.com with SMTP id r141so5696756wme.4
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2019 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4wzsYdI/UBS/hDiEwuJ9S9NtfpinD6pNSX/pGZnoi0=;
        b=Msg6F/GxlqK4EM7T+PrzjdhF/JFDQ4NXZ1hU5I/y5yZ/4dJFfBBnblwHelqpqcUYOd
         PFBHVXpVlIk3IWP5+/fsBS4wkO7+b/nxCT0E6ltu1iy3MJi/G79dZ8YkP0Ny2nWzC1Tp
         Qb4VIkmH878+v2cOTA3Swa1fepWES/rHu9kBiBcREYPwPwvkkp7dNFXKsWeaW6X3MR0k
         Dlr5CrZZL5jCYnIT3kV+8O+ZCycLlH6RnxhihfZ0qTf8MRRm1kxBeVzi9JmdAc5DYGum
         cMW+IwnfT6kUt3FIKQsRgp1nuGUccEmIgcpaW7VKKq4s4uP5B+YHi3DHFQiqewmRENNR
         oAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4wzsYdI/UBS/hDiEwuJ9S9NtfpinD6pNSX/pGZnoi0=;
        b=GBcvw9PfapUN+ygZPJySsH1FVZuY0rqkJSxDNCr2/tk6yWwwcd7lur0HsUarNPcZ0m
         A9Ve/AlH3OE46B5u30U2nH+gVi5lWPyCcLE+PNIIB1HJMdM0CX34UE9DdXhO6oB1Gwjb
         HSnErHeIrqEkhKxDiiDgHh99Cja8a8Xz/hXW8VmfWuYQq4fnCj2nnLkymkFR/9aXE6l2
         i96qQ1satcce4gjErh52IViUyvDzrLgXSO18XTjqzCatUP+ahq5j9sNxJK458WiYtvB6
         PNW9pt08BqhM7deDrTDsGrHxt+QlNn049VJilhO0gXSpFyzt5ikS59mL/oXk38Dx40s0
         fiAw==
X-Gm-Message-State: APjAAAW7i1Q3pA9vfBxekyj2UOddQViVggLeQ6GBscKmg748yO82Dutt
        lsOcxyESgen+4KUPvY6ZfZXDPw==
X-Google-Smtp-Source: APXvYqz1TkesZOhWeSBN/HwWQwxqaB7FjLPheJGtDtKbbjD4OSgqbrYOeUQBZVOE7iQrQzDyw6Xf4g==
X-Received: by 2002:a1c:2c88:: with SMTP id s130mr2007920wms.66.1571733804304;
        Tue, 22 Oct 2019 01:43:24 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 1/8] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Tue, 22 Oct 2019 10:43:11 +0200
Message-Id: <20191022084318.22256-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

devm_platform_ioremap_resource() should be documented in devres.rst.
Add the missing entry.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index a100bef54952..8e3087662daf 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -316,6 +316,7 @@ IOMAP
   devm_ioremap_nocache()
   devm_ioremap_wc()
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
+  devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
-- 
2.23.0

