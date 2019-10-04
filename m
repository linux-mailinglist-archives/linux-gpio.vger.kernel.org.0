Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFBACC0FF
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 18:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJDQmC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 12:42:02 -0400
Received: from mout.gmx.net ([212.227.15.18]:40273 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfJDQmB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Oct 2019 12:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570207301;
        bh=4HspV+6W3NFfVmne4PrY7CTozrj72fiaMF7UaAeII1w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=aIp4N3A5sb4H5/cejWs+0rE76KAoU0kt2gU1Eo/MOoJIOqYiPNqh/10xAY1vMZRsp
         5e4yTIhyOk4qHU4EGlAYBheqE3UbX5CaHA04nhtSeYXIZmnaySkCVRnmkeTTDhzRaL
         9YnWvbEAzJn1wra98Th1gQt+1AQuEa9z8eIveGEU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.25.131]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSKuA-1iivro3jJo-00SeT1; Fri, 04
 Oct 2019 18:41:40 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     Michael Buesch <m@bues.ch>, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: driver-api: bt8xxgpio: Revive dead link
Date:   Fri,  4 Oct 2019 18:40:56 +0200
Message-Id: <20191004164059.10397-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191004164059.10397-1-j.neuschaefer@gmx.net>
References: <20191004164059.10397-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3JFFSC4Zuno7sL5Pk2Yo5U3ohyyM+uvYk9DboeDsNf8LHCqzw9u
 e9z0lzcshiGk1HcHfPSGgrP7b8ssbGPrqN+ViUb0z+fflralRDCD0LX4WFUHGZ9nkO66f0m
 WwAuU/470MFXu5cETsDdtqWa6jyA1v56W+eEcK8i11/z1QUmnqkk6RVJyA+OO4w1uFOlmbS
 OobqD9ZCKIKgo0kOeZawg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R+t44nuZ3xA=:poygZZRM2FWFOypik0GESg
 wYH6jQvLcYTI7ot+7P96b7Wqc4Ko0s47PzYhsP5uwc8IghZvN/+HSi/GKhpfus7hdPFYoH/hw
 2SUI6rPrepF8Z6XC7oDrPXirxc0SkuXaTqAebWmzEN8bgoMkl/OX/WUEebHlHGU9x4q/bZNN/
 tvmj87W4v1ejqHqbG0jb44Kmll2wYv5WPHqJBbtwhjvMB1xlnbVY4pignk2/dpO4jllCMRcj0
 97S+/KlHBAsrniY2WupqYJXL5Vgt4aiIJMrmTIm/e1lFFBdo3jjwE3fNlhO8qfTp5BQ2i+yCs
 ergipiphQAtUkWg2SSAiXgPd6BW/pIr4vENvSv3pFPpTgdnH5EI/sWGUEwRvhnMo1X7yI8U5l
 kbVFHNgV+gsFcVAfHnaFBPngKzUXRnLh81yJOG1MiitPGPSW9pRgbA5WCrpAdW5NAqppTDfWn
 i6MxpkOYjRmtxi697CS4k+ya7qBa/4Ngjg1suI2iOD8MIHiM8AAyKwsg1+s7XUcp3XsUNbIXl
 BSQGK0GpQevKmqf+7z18PDIAgHLn9cavmKRREpdHUUR/regu+0ecwgIsBjUfYcanDMXUo00rq
 0sL+tt6v3q286ueCN74SH+OFZWXksWfn1naSyOkgU7t8JPEQ0SrcnwX968u9y6UcErFBNyoG9
 WCI9bGQvrN77i7d87qMPy3KQqzXgGpmpZPg7TJmLHNZIcSy30x+hdNAic6tJIDNqRlAI8sHTF
 iDF150CDhE63Cw52Ma/KoHHgtxiEPPXp9nbshNqjucZWnEi0P6zKSGQxvgQO9EJXF0FfP1z5M
 paQDQaA59oaFAkioJXJsc7Rvp5PiI9B+AMGeDmf4DhyWfvfgaNIpR5hTmZolvGDWjedBpKywl
 +vB0k8pxjV0DtI0sAfELUgpJn2uydms8kQBg6APjLcMceYe0U2GJsCZs2Xp1IpeAZAvVUmdvK
 xUG+fK5DvVTnXnjkD1Th+z78W1p0v9riU2l5w2DNTuq68RBVe2h3EcviCVo+11JsT0IwVWtDC
 GvAj3E+ro4g8+3HPKPooxpquz6HtQs3yBIG/92GP/lzP6NyzQ7V1QW5LhQcJurO+s8T68NYMa
 CC1oob8QnfMDUuSpg+EpvD8JBc/DxOTD5ThlhZ70Dqquw4mFowPvXpfrU7wtjVuG+6AH9/Ota
 7rjntJFddeUaUgZ02VCk2gGwF4XuFDA4mqX46bogIxYUQPj9p30GdgNvwWXea/ruY3XAlF/3x
 y0UbzzSIF1uRPQjFO2D3K0nbu8K/8O0upGgRf2d3t6T6J8cpc1AIm4f8hGzc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

www.bu3sch.de has been unusable for several years, but the same
information is available on bues.ch.

Cc: Michael Buesch <m@bues.ch>
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/driver-api/gpio/bt8xxgpio.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/bt8xxgpio.rst b/Documentation/d=
river-api/gpio/bt8xxgpio.rst
index a845feb074de..d7e75f1234e7 100644
=2D-- a/Documentation/driver-api/gpio/bt8xxgpio.rst
+++ b/Documentation/driver-api/gpio/bt8xxgpio.rst
@@ -2,7 +2,7 @@
 A driver for a selfmade cheap BT8xx based PCI GPIO-card (bt8xxgpio)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-For advanced documentation, see http://www.bu3sch.de/btgpio.php
+For advanced documentation, see https://bues.ch/cms/unmaintained/btgpio.h=
tml

 A generic digital 24-port PCI GPIO card can be built out of an ordinary
 Brooktree bt848, bt849, bt878 or bt879 based analog TV tuner card. The
=2D-
2.20.1

