Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825022B8B5A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 07:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgKSGJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 01:09:29 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38385 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgKSGJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 01:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605766967; x=1637302967;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=62u61aTt6vzUSHF+pqrME4vVag2/9ClQkgJ7buWSxfg=;
  b=VQJ1tOvGBOTmiAVsFtbVuxlUdjtV/DApV3kP77simkXXDrpSNlSO5dx8
   cCs6Azgl04UcWCgtaOJoKPEk4cv0vQSbFXcCpFPPoONeWC4bhqleBWsfw
   8vg+YVTmHbkoWtMt5LE4V8Z/zgJJfOK71VUz1BIaYr968ymzZPjo1XGDz
   avrrPb/juPE7ucx3DLW7UzoFVnYhDGkZf7TSwz35rYwR//Xf1jm54nlmP
   uk7YK1e1+iztY74UIIq4iAy8vfOGYWwFzadd2ZkLMt0mZvL5J6jmrqfKW
   0Q2RFHJrNbQOkRV2Xgz6nNSr6MyfU2kORnRrzSSmtw7kjZGIKAAPJqYpi
   w==;
IronPort-SDR: TneHCohqRu8Ho47X43rw+7Ody9BBRgj4ylShJg+reydCN3Dkilt47bKPyQd9t+UPs4XX38nHNX
 QUeHHyXFMKfLH939hk/6lv+fYLJ2Anqysb6JN8uaFFmwAMqd8zCRuHODg8xZY/zHOqUttr1jtu
 8wDXRRfBgA+7EgEWsTPnX1bRMsXVhEYJoNn8OprTXHjkUYdmsmopHlrCEbwuNBWjPP8lIHMacP
 NVhWUfd0ZT9neWEnXGnJ/RYwEnWUQTj9++gurcHT/aJ8d9U8zMxmZn7w7PPH+/z/Dl1jEqJ/Q/
 7VE=
X-IronPort-AV: E=Sophos;i="5.77,489,1596470400"; 
   d="scan'208";a="256550939"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 14:22:46 +0800
IronPort-SDR: Up+74Ijfb6XnJm5U7A1Rn/efoPI7lsRNYswQ6AJepdpf1Nw3R5WLAfX7UTnkBecf5+b0Id5uFn
 M6WDQoAqMGTG/bNH+WSAPGeNEQzYMk7WhFD3dGKgltzZTk+91K8OIibeTLJua/ZfWcxzJfD6eH
 rjFbgHeashIub3FQDDWj2Vk9cB+D3aCfN6EgeFKnMTrvYysfWtnqDl+nQ5rpjsIIrUHd7WzsH6
 57sFpYL1M8x8fSalz57Ah8JgBe4uiopmRRigZ8NMQswMQ63fGTEI08Blo2HLNJ2LBeOa7Q2AWV
 bFxdCpgK/22WUMaYcXPAHb7Y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 21:53:54 -0800
IronPort-SDR: vXLtmxqK01Lpu/siITvtzSJlYPDKQEyFOgZSRtg/z9yaROebLybjvnpQPL8ygcd0OcbVihxpgR
 dYbktYAhqCIUb7sRLMfkrifohM0kMz27bIkAuvwPmoUH61N9qW0USSMUHddH3arE7+Bvt+twyX
 VBPfNGkYcYQADl2Wktm6IZ3UD5gJ26Gt+2kU3fvyb79hA+OBw3FKVHulOa8QqoGGCDHCAr4TQn
 GnTFBX44zVhfcCupp8rgpd1gXZoIU9CGiAQnnoNaY3JT3jhCOamOYv00UhsKnMA9j0n/skM0dl
 K6o=
WDCIronportException: Internal
Received: from jfklab-fym3sg2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.107])
  by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 22:09:24 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Fix dwapb gpio snps,nr-gpios property handling
Date:   Thu, 19 Nov 2020 15:09:19 +0900
Message-Id: <20201119060921.311747-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Two patches in this series to fix handling of the "snps,nr-gpios"
property of the Synopsis DW apb gpio controller. Parsing of this
deprecated property triggers an device tree parsing error in
of_link_to_suppliers(). This is fixed in patch 1.

Patch 2 adds a warning message in the dwapb gpio driver to signal that a
device tree still uses this deprecated property.

The first patch is extracted from the series "RISC-V Kendryte K210
support improvments".

Damien Le Moal (2):
  of: Fix property supplier parsing
  gpio: dwapb: warn about deprecated property use

 drivers/gpio/gpio-dwapb.c | 14 +++++++++++---
 drivers/of/property.c     | 16 +++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.28.0

