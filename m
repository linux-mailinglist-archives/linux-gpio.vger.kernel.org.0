Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC17351D0A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 20:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbhDASXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 14:23:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239674AbhDASQp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Apr 2021 14:16:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C419E6121D;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=9PoexKn9B5sUWryT4Sa8hCkGzVDwIievA60/TyPSyHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iFRlkOcszOpL6rWYIXnLOz+v6RhlW0xR5evg1Ll2AA62ktfi/CR1Z40nb9/3TKtyM
         Ij7WycN2aDV9Vte8hYEs2IKLipd7tYAbRADCjP8Z6vVtwZ0AJ07X9qR7Zaso83jQwH
         /lGiwH1uRCD8wPDNkTGZ+Mrx+ndm+ArqMweiUnE5+9AyevgTCc05fvQjhEL5XTLJ0j
         IobUl/1sEL+cdG45cX0iGS7jIff4q243+Cs0tKiMGa3dP3qvS3L9XyHJIRmxDTOj5c
         mKGDsjiQlwnMMIbmmmtIrloOb85ZpfgMyVHQVMbBakxVk40r4CETe1quWzCI7L3ozn
         hyLHuE4zBYZXg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c3n-OB; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Drew Fustini <drew@beagleboard.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 32/32] pinctrl: update pin-control.rst references
Date:   Thu,  1 Apr 2021 14:17:52 +0200
Message-Id: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
renamed: Documentation/driver-api/pinctl.rst
to: Documentation/driver-api/pin-control.rst.

Update the cross-references accordingly.

Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/device.h                  | 2 +-
 include/linux/mfd/madera/pdata.h        | 2 +-
 include/linux/pinctrl/pinconf-generic.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 38a2071cf776..d1183cfdc8fb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -399,7 +399,7 @@ struct dev_links_info {
  * 		along with subsystem-level and driver-level callbacks.
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
- *		See Documentation/driver-api/pinctl.rst for details.
+ *		See Documentation/driver-api/pin-control.rst for details.
  * @msi_list:	Hosts MSI descriptors
  * @msi_domain: The generic MSI domain this device is using.
  * @numa_node:	NUMA node this device is close to.
diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pdata.h
index 601cbbc10370..32e3470708ed 100644
--- a/include/linux/mfd/madera/pdata.h
+++ b/include/linux/mfd/madera/pdata.h
@@ -31,7 +31,7 @@ struct pinctrl_map;
  * @irq_flags:	    Mode for primary IRQ (defaults to active low)
  * @gpio_base:	    Base GPIO number
  * @gpio_configs:   Array of GPIO configurations (See
- *		    Documentation/driver-api/pinctl.rst)
+ *		    Documentation/driver-api/pin-control.rst)
  * @n_gpio_configs: Number of entries in gpio_configs
  * @gpsw:	    General purpose switch mode setting. Depends on the external
  *		    hardware connected to the switch. (See the SW1_MODE field
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 6aeb711f7cd1..fdcd773adba3 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -88,7 +88,7 @@ struct pinctrl_map;
  * 	it.
  * @PIN_CONFIG_OUTPUT: this will configure the pin as an output and drive a
  * 	value on the line. Use argument 1 to indicate high level, argument 0 to
- *	indicate low level. (Please see Documentation/driver-api/pinctl.rst,
+ *	indicate low level. (Please see Documentation/driver-api/pin-control.rst,
  *	section "GPIO mode pitfalls" for a discussion around this parameter.)
  * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different power
  *	supplies, the argument to this parameter (on a custom format) tells
-- 
2.30.2

