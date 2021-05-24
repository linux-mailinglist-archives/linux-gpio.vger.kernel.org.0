Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F71C38ECD0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 17:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbhEXPZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 11:25:17 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48844 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbhEXPW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 11:22:27 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OFK6vK118394;
        Mon, 24 May 2021 10:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621869606;
        bh=kGpI6I5BF57mdUVw4YFYiV1QGy9tp4KteKS2TI1W130=;
        h=From:To:CC:Subject:Date;
        b=LNsXPz0XeHyzStqOkKh2FV8gIcdY6KI0G586Rtp6cABgmFnjseLhYgfvlWDDGMf8z
         Vb1f6dFLa4q3or333sxmTRcHqw9VpIdxm/Yes/76G76mOWl9l9W1pRIyHzG9uHpyvh
         5Na3a2o6kVOqnAhj+IDA5QZFo/L7dZrK2KO3/Atg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OFK6Zq129447
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 May 2021 10:20:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 10:20:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 10:20:05 -0500
Received: from gsaswath-HP-ProBook-640-G5.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OFJv26055198;
        Mon, 24 May 2021 10:19:58 -0500
From:   Aswath Govindraju <a-govindraju@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/2] dt-bindings: gpio: davinci:  Convert to json-schema
Date:   Mon, 24 May 2021 20:49:52 +0530
Message-ID: <20210524151955.8008-1-a-govindraju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the davinci GPIO device tree binding documentation to json-schema.
The GPIO hog node names are defined to end with a 'hog' suffix.

All existing GPIO hogs are fixed to follow above naming convention
before changing the binding to avoid dtbs_check warnings.

changes since v2:
- Used gpio-hog.yaml for gpio-hog property
- Added constraints on gpio-hog node name
- Corrected the gpio hog dt node names to align
  with the dt-schema

changes since v1:
- combined the individual compatible properties into one enum
- added maxItems and minItems properties for gpio-line-names and
  interrupts
- updated the description of interrupts property
- removed the description for properties that are general
- updated the pattern property for gpio hog to indicate any sort
  node name based on its usage
- corrected the example wakeup gpio node name

Aswath Govindraju (2):
  ARM: dts: da850-lego-ev3: align GPIO hog names with dt-schema
  dt-bindings: gpio: gpio-davinci: Convert to json-schema

 .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ----------------
 .../bindings/gpio/gpio-davinci.yaml           | 186 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/da850-lego-ev3.dts          |  10 +-
 4 files changed, 192 insertions(+), 173 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml

-- 
2.17.1

