Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E6C32C800
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355750AbhCDAd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:26 -0500
Received: from mout.gmx.net ([212.227.15.19]:57301 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1388046AbhCCUhT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 15:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1614803744;
        bh=krf83YAsrVMgeh7UXqPBmCfNvjfc4y0k3/eS3xhnn14=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=YxyZuBaoGYx94U8HmohLN2/BPqMQwYh6YRJwQO4YhfG7j06rU5nJNB0kycH3zfu/0
         9o/0lOEFqJZRObJYD5FDpSuGK3rwvUB3TeWigoMsewJ2mCAANsr98rHsbtnUL7t98s
         CIiFZgusEa3ZUjMYTeqZRdAmNH1dsdXv726TYLS8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1lZnXZ0J5x-00qBjz; Wed, 03
 Mar 2021 21:35:44 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: driver-api: gpio: consumer: Mark another line of code as such
Date:   Wed,  3 Mar 2021 21:34:43 +0100
Message-Id: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n4fnNw5p0yFhEdNKY4BFARpZidn1Dc9Nu4bu+BXyFCIblOoK4Xg
 CaftcURAz72LR07sKYma2OpID0Ae4hYOjgP1VohK6VVHmolHmy6HtJNVpMKE2BugjH6hO0G
 ujvPhJIJEz8IDb6oq7SOPdEj1DN1Xy3mouvqBWKRfbCEJHnVynzdlz1LjTRblZ9X66SipL8
 2oRAZgv0HyJU2fVTbSQ2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DHNKB4Uq6iw=:maW3EVuHLenWGldgqYI1dJ
 +eM/3u3ykE+vu/Zy2zv9afrh3uWBpiVYJAsSBb5Fp8nY+dhERnqZedhuPBcQco2rKb1Lmpxgv
 uQbjh+/XUselFWRJmIkBb7+f//iIAQ05ruBqFfv1ktkowOdhspfRkc5S5x9zvfife/pEgXB4l
 W13eAIH5c36c6kNLJvig7bidbD/f+b/3RWUIooTf8IlW1vXGIpKc6YprlT7Dj7h3uGNAgJWih
 fIXMEfei0sIruz8XOl19r/ULIWWVUPNhSYJt1pdDgSEO3QD4CXoyrbl+Lei/229bvB4voHNKu
 ZVQ6FZS69R5cfpkkLSfXQhZaPFVmBdvQiwnk9UD+CFqND4Qb3LeF4Llj+7Th//ocFmRYXjh+7
 yePXwJ9r+3wrcDb2OoZuU+TtgWU0K+7k4O/jkfA1SvXjJ/6qqh2SKxjaXSKdSWh8NyQgiEUfx
 OyytOuUX8BwhVGsju8lLvHmKj6emttq7U24jGkK8WvS1GKox8QlqSv4woVcawOFPFo8W1dn7x
 37GwCUxzBUnDeqn2B3m9sNmJT5XM9XvOsKnBkrLRreDM1smeY95J3fW7VXgjgmJvkVwsvyh7m
 jvv7uLKQv8GEKNn4szoIBfLcuFjKIl4CvdA1OsikB1P4fqUrzMIzYXoh+kh9DnLZxivEm6JqD
 aBo5t8PBQEeromOcWNeg2OEO/S+jjqG9LxBIVduZdL0eI0Y2HN5i2gsfkraRNEiATrhU3bIlJ
 ZmMDZzH17iMZhEmX6kexF0gkI14w72ADA+icDDCe3nq/fDlId1qDRG30MFPHBpcGp0JNNkqmH
 aLr1J+W8PQCcRufDcWvXNnysjVsxniOnDrPv5JoKDVjU139yGqqMgPLNumf+Ld6Y5MJ3DFerJ
 DEXh6JhzCNy9g9rnCv/A==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make it so that this #include line is rendered in monospace, like other
code blocks.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/driver-api/gpio/consumer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/dr=
iver-api/gpio/consumer.rst
index 22271c342d923..3366a991b4aa7 100644
=2D-- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -12,7 +12,7 @@ Guidelines for GPIOs consumers

 Drivers that can't work without standard GPIO calls should have Kconfig e=
ntries
 that depend on GPIOLIB or select GPIOLIB. The functions that allow a driv=
er to
-obtain and use GPIOs are available by including the following file:
+obtain and use GPIOs are available by including the following file::

 	#include <linux/gpio/consumer.h>

=2D-
2.30.1

