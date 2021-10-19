Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B52D43307E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 10:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbhJSIGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 04:06:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:36234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234711AbhJSIGk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Oct 2021 04:06:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B6A76138F;
        Tue, 19 Oct 2021 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634630667;
        bh=1KoIdQOJKC+q8eSROHr3duOzqfc7i0BTRJOLtAaUpjA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X5AXMhDYKI5rwQEKGv0/MhrxK3IsFJe3JbUJ87IC+iW+r6fCIBgRpQZNVN2GD4xYc
         P4kcALrzgy5W5FsFG5baL2bIxGQCcVJtgsAcqQwiOObGHqRBvq6oDCjP9p90/me+gt
         Nm+syWhy/WP5Ephay1hWIe2j5APgcZ5dxj6m4tnXM827TELV/DbGaEKlYc+nmAQXw9
         OxNHnLOdZPZ5ee2uxlKHlLD+oyu2RaC5kBr2qDDYBG0aV/+1Np3pEeggX/OqEt1sYJ
         8XJta33BObU2i6WU7S59NmZ+pamaR/zzIb+tM+IAEmfNFYYA9pd3YUXYqoDsKGad2H
         /5NgcyDgxXIJw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mck6j-001oJm-9w; Tue, 19 Oct 2021 09:04:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/23] dt-bindings: mfd: update x-powers,axp152.yaml reference
Date:   Tue, 19 Oct 2021 09:04:19 +0100
Message-Id: <aedef820f4dc9af5d3a3fcce2ad733d75e1ad4f0.1634630486.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changeset f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
renamed: Documentation/devicetree/bindings/mfd/axp20x.txt
to: Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml.

Update its cross-reference accordingly.

Fixes: f38d3e404326 ("dt-bindings: mfd: Convert X-Powers AXP binding to a schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

 Documentation/devicetree/bindings/gpio/gpio-axp209.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
index fc42b2caa06d..538f04e60ff9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
@@ -17,7 +17,7 @@ Required properties:
 - gpio-controller: Marks the device node as a GPIO controller.
 
 This node must be a subnode of the axp20x PMIC, documented in
-Documentation/devicetree/bindings/mfd/axp20x.txt
+Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
 
 Example:
 
-- 
2.31.1

