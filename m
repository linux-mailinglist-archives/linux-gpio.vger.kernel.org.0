Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6888139C8A4
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 15:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhFENUq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 09:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230090AbhFENU0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0C4C6143F;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899118;
        bh=EeMjO89d7aFZ6t6gjtXe5Yq7iNjoeJqszcxkBk9Ryjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UMPkEjm+F7ZTSJCY+IPSv6vgA4uYyvViEyG6GHRNYyrT2g+63+PV1EYMvdjIf5Bpp
         X9XPq14/uDB3BaryhI6Fq39w2MyD5c9OdOhHvON5lB8PV1L/XMEW0cxBNyz2PFg1M4
         RwNCl9c2KadndxP3rer0THE/TmHI79rYXDQZVkcseiLbMsmuXiM1BUxYwNqdTxF9QC
         FRSBUd8+sI9mRI6UFJqtK1JDt+Y9iLjeFjSnbvT6v+GgKwaB7+BY1ZVMQiu04PgC9O
         wjnVFe5mPXhhrJbAkO9bSpFlL4Ep10VCTufHHig4YFPgmAsye82XUwid30BOJApVHi
         eRG23e3cnFKEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCC-008GFd-3T; Sat, 05 Jun 2021 15:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/34] docs: driver-api: gpio: using-gpio.rst: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:17 +0200
Message-Id: <ed02be4feb78dc86dbd17ddfa2e896d8dda7fa8d.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/gpio/using-gpio.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/using-gpio.rst b/Documentation/driver-api/gpio/using-gpio.rst
index dda069444032..64c8d3f76c3a 100644
--- a/Documentation/driver-api/gpio/using-gpio.rst
+++ b/Documentation/driver-api/gpio/using-gpio.rst
@@ -9,13 +9,13 @@ with them.
 
 For examples of already existing generic drivers that will also be good
 examples for any other kernel drivers you want to author, refer to
-:doc:`drivers-on-gpio`
+Documentation/driver-api/gpio/drivers-on-gpio.rst
 
 For any kind of mass produced system you want to support, such as servers,
 laptops, phones, tablets, routers, and any consumer or office or business goods
 using appropriate kernel drivers is paramount. Submit your code for inclusion
 in the upstream Linux kernel when you feel it is mature enough and you will get
-help to refine it, see :doc:`../../process/submitting-patches`.
+help to refine it, see Documentation/process/submitting-patches.rst.
 
 In Linux GPIO lines also have a userspace ABI.
 
-- 
2.31.1

