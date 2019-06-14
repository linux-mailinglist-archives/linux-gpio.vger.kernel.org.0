Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C03E464FB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 18:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfFNQun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 12:50:43 -0400
Received: from mout.web.de ([212.227.15.4]:37853 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfFNQum (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Jun 2019 12:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1560531029;
        bh=w21hW0UjOS9V/aSHu9UGGrfjEKoKC+6rxpIW2WiCcE8=;
        h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
        b=L8D24imof7Pg+A6Zp3gnrUDv/D+dsDizadCqre3CjgyHmzp7Y6hfFJIiejUA3WNH6
         iWE3hkiSi4aLnQcxbIBChkFXHtfnQvUkQQk57MXd35hJRfcagxts3sKLdJsda8Zbe5
         /AuQuw0JsH9EuNilDKBBM/GJOOJFo6zvVydcmDGA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.126.132]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfYTr-1hz7x02zIR-00P9at; Fri, 14
 Jun 2019 18:50:29 +0200
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190221162627.3476-1-brgl@bgdev.pl>
Subject: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
Date:   Fri, 14 Jun 2019 18:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190221162627.3476-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CDUmOft4DVOQ0nItkPeEhljEaJ0EnGpyqzjKlXS8EM77gNnsI/N
 W9eGmgc5XNnCFgYf6xHUM4BFKj6uF0bOGGV+9eKa47L2q+ELfnHt4gFZOhwSWebTGnOkz9z
 V3Z4yvxQlPd8gZameHJYgMaqZ9CZzjLI3d5PgtKj24But+cg0vnGMlmz7XlcKgOiyhm8JHu
 YLpKsbZMmzJbW2Q8jqPCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W2PfOOkyf+g=:bIszttgVhTZFs9PnMSGGxx
 3NAzcpzoSUesADLm5fn6Cylx/KvjyMl6sdNctR5Pt7Xz4yd1Za5K66pbt42q6JWtZPNCRA0uQ
 oCyFpEvkEWndM7n0ZwHfXqtwaZL4BFtjDj4tJZjjxjN2wvdAKAOq2As6PAmsEFIdDxt0IDj4W
 S65CoK3IdjeMLQDqdUR53vJf5Ilao/HU6U+IAwVhITxRib7fRpni5OVgCPBps/xpHfFsrFPfo
 dOwwWcK1l8VhRZDu542u9A19iDav4Zanf0e/XXRZfJ9DEadhfy5OVND0Rr5ReUC9CtQsEAnNP
 +cleowHQhnT4LsHrg2l+UzXwEV48pF89tBTRIBTFE+hW7NTUw6ACquOnjtqkzQe+GE2/n1u2g
 xjqXakNo+bNQOnFi7/7qhF5AHcyP8uMI91kKiHqMEC/tFwqMM9vH64CoryMt4vOYMtAYFrgFa
 jaEyl++24NtE+9uruP3okHxCxxblEk2lP8nMJFqhThRXrraBSys+WzSgT0XEuI/elAlkEAyb8
 WoD2DV3vXuSAHlv28ZZSnHSq0O19F6QXwdEs6KxRL/3wwaICzRthzxfi5r3zvWp0/QwlZTjDg
 P0GogRrUl+g2FNRdO+hsZkynasNwi/Ekj56cHkcrrkhcAtkmjDyFEQDyyu8vDtRQE2+XS0aP9
 9r2khnrwbPVfDSklZ7V96Q+FZgAxGx9lkufVO8fybFutmINCtTbMom14bCn8CycscdWL0EebA
 6zIh6G4Vx7fu1DIcdxiF75TyB2MvL+WUp7AxG0Ij+ssywXk7H+o12gaubpVeP35mADcTRxkvQ
 uxW/ct/yONbro7Vgg0NMwvMO9w3GkU59LTmQI1ypvH+YDTW443rXyV4XQsOs9mYEWvHRTgoZy
 YZXeIJBuueGxnMFTLoV2/xcxOz0fJlPZ9J6kopJRMmoo+P8td7MtvWOz01n3IOktV0k+fkziQ
 7c5Jyg5jRS1RFvEXde6jtRK2k0oFSLO1YzaBYfu6C+BBhUfJKdJgx
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Jun 2019 17:45:13 +0200

Move the preprocessor statement =E2=80=9C#ifdef CONFIG_HAS_IOMEM=E2=80=9D =
so that
the corresponding scope for conditional compilation includes also comments
for this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/base/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4d1729853d1a..a5f40974a6ef 100644
=2D-- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform_d=
evice *dev,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
+#ifdef CONFIG_HAS_IOMEM

 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a pl=
atform
@@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  */
-#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev=
,
 					     unsigned int index)
 {
=2D-
2.22.0

