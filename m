Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7AE7A1CF8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 16:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfH2OiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 10:38:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51690 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfH2OiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 10:38:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id k1so3997318wmi.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YoyhpnPzVIVpxofR/lrTNbfXSivH1y110GNbQfwK7Is=;
        b=wUIWeajlm+pwQ3rJwb3AUTeHw2qPBY30XQR9qsbCCIoobDskJK2Vfv+2l3U08O2ZnT
         X1U8ohF9TtCalLsXR4ySqyTQXGN53OOQ+5NQjpGawmSu8uWs+pVWSJX62iV1+bYIehkj
         UBb85qDMTdyAbHz/vf2X76+eWa30vV1DdEfD0HD+egyJfwk8fTwFh/sg4EhVTU+Nqz1q
         wvvY6sjsPcbO97gNc9E/QWCgndsib+bFUyZPqyPVceJ1SzZOao6Ebd5SsAx689xB7ICA
         pVYHmjrZPO6CPwju4kZmoIAty/ZqOS+RUUqOJHerIGK9CCoKudYBWU/km0QcrCUVKkov
         2YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YoyhpnPzVIVpxofR/lrTNbfXSivH1y110GNbQfwK7Is=;
        b=Edjp4akZno5oOfzeMxqoAGO92m3icGAefSxR4xJa2A2o0jQ+YUQlrPB6hevS85DdEb
         Mhv44ldV9fAyZW2g/yzAjagyRAJzRFIoxp68RF5WwkGBCj62g8Syjsg6bInTPrB9DP82
         Y0tuAC0d2OiC5KtXGJayu1+KIEjE9njDye3bBPh4G9AQrICb1gHEUdtBPdKyVfXOO83P
         YQRrMGljijGVPk58j821J55uUrow13SfdSqvKz2tFV7ihcBTMuTR9bY7UXPJLNofMbQn
         9mJhoIfj0GyBFFwXroE+cLu7OyBrb8x8wj02wY5WeEPHSl0tdKkvjDqfdTGINr9AUDFy
         +9KQ==
X-Gm-Message-State: APjAAAUv1ewKMR0RMAsKJTChwI6Q1utbLF57dfn+tTddylPkYyqmESut
        dEhHt1w4k1RBXszcJ/3eRZ7jgXdzOmg=
X-Google-Smtp-Source: APXvYqwwe3iJ7Riyj93TjIaXa7UIdIe3e1SnS40Ec1Rafqt8qLYekD3kspM1ZWU+jsQcDq4k1ZhDTw==
X-Received: by 2002:a1c:a7c9:: with SMTP id q192mr11696984wme.144.1567089484914;
        Thu, 29 Aug 2019 07:38:04 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/9] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:34 +0200
Message-Id: <20190829143742.24726-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
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
2.21.0

