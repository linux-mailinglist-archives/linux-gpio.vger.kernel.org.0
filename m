Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C2F28710A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 10:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgJHI5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 04:57:34 -0400
Received: from ns.lineo.co.jp ([203.141.200.203]:38812 "EHLO mail.lineo.co.jp"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgJHI5e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 04:57:34 -0400
X-Greylist: delayed 611 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Oct 2020 04:57:33 EDT
Received: from [172.31.78.0] (unknown [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id 992E280535E27;
        Thu,  8 Oct 2020 17:47:42 +0900 (JST)
From:   Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH 3/6] dt-bindings: pinctrl: sirf: Fix typo abitrary
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naoki Hayama <naoki.hayama@lineo.co.jp>
Message-ID: <614fe604-ab8e-21cb-0c3a-db6ddeff2a4e@lineo.co.jp>
Date:   Thu, 8 Oct 2020 17:47:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix comment typo.
s/abitrary/arbitrary/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
index bf9b07016c87..fbdd1a716a1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
@@ -60,7 +60,7 @@ For example, pinctrl might have properties like the following:
 Please refer to pinctrl-bindings.txt in this directory for details of the common
 pinctrl bindings used by client devices.
 
-SiRFatlas7's pinmux nodes act as a container for an abitrary number of subnodes.
+SiRFatlas7's pinmux nodes act as a container for an arbitrary number of subnodes.
 Each of these subnodes represents some desired configuration for a group of pins.
 
 Required subnode-properties:
-- 
2.17.1
