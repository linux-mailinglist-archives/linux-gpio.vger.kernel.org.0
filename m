Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164941F8E5F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 08:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgFOGtG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 02:49:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728452AbgFOGrN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 02:47:13 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA8D920899;
        Mon, 15 Jun 2020 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592203632;
        bh=WPe7/bYjKlBgbB2jve3JvxrAVd0G2R+iB0dbw6y3t5o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dPyCV8IGIfHhToINSgCHTx4MPNtSCMHYGFK94virHPa0vJW1MT2EZ1d+2+SGIN32l
         Kn1A2N7d+13JN31Eoedept+vFEq5NIngvHa2uV+IaelYouYhOFT57d+4aPVYlFLR0Y
         AFULx1U2H5zUClAKUZsADTGQE3fGj4LKqVRtmAmo=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkith-009nmj-Oq; Mon, 15 Jun 2020 08:47:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 12/29] dt: update a reference for reneases pcar file renamed to yaml
Date:   Mon, 15 Jun 2020 08:46:51 +0200
Message-Id: <72d7ec91a60e852d34f3e15bc5faef1f62a8260e.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This file was renamed, but its reference at pfc-pinctl.txt is
still pointing to the old file.

Fixes: 7f7d408e5a00 ("dt-bindings: gpio: rcar: Convert to json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index b68613188c19..1b8e8b4a6379 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -114,7 +114,7 @@ with values derived from the SoC user manual.
    [flags]>
 
 On other mach-shmobile platforms GPIO is handled by the gpio-rcar driver.
-Please refer to Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+Please refer to Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
 for documentation of the GPIO device tree bindings on those platforms.
 
 
-- 
2.26.2

