Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C536C6D92CD
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Apr 2023 11:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbjDFJeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Apr 2023 05:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235883AbjDFJeI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2023 05:34:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C7A40CE;
        Thu,  6 Apr 2023 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773634; x=1712309634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQBzJLxAwqw++PuzUEsUokKNrW8J4SM4pq3rrrBEeMU=;
  b=GXch8GG18muNnEtU8UyxxazM8RTe3717Kc/L2V+9POpdr2tU/qTPtwu4
   vMh54JNbwabdemUTrZk6Eaeuu4qiEACCOg/Bm5v5xGA1yCGVSmSKDtyAp
   jVbjYwKmAcrZ2642EnmyGS5+Fe3W4Bs6NBq13gV59zHLR3qIko//uQ/7F
   OmLb6MKTp6YEZAzWqRj8hCVNOFBgw9ofT5QVm+31f1f4ero4vGYWs6C9d
   pnTyQ44Vg0k251idVioPLgLl2ViMMYkbce7N+zYtSK+UZ82Hf1wA/Yanz
   tmrqgwNBBVrlnwrIJbA6L5BSugT8bqQT3WKCJoXy7fcu2uFU/OdvP+52W
   A==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188769"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 11:33:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 11:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773632; x=1712309632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQBzJLxAwqw++PuzUEsUokKNrW8J4SM4pq3rrrBEeMU=;
  b=oBq7yahBVHA6Icph5KEInTIXWV4rvw+cqTApyFeg8J5bqrI/byev92fm
   MNsZ8TDlhusGvKOcO1BvtGYCfAkkenfESCyPEfBeRdX2Oa4893LXHdfK1
   LuHX/hFYWKI6XaA8AHL+O22D57aGW+c/e1wKoB9S7uuwDulqoqDYFgW4z
   SxdtptcgkXli+Xr663w7yPufq8GIU9rH9Y6DbC0I7lTiNHmit74vnflTz
   SD8wP4eZXegx3UlOyygi/xxkDq/D/NAGGnJwMTzaVYrRjDqh0F4DpCySn
   P3LTNsGp7yM/kO9kozND4fGeqF8P/u4HQDzFL990kHbmQ2v8Ko5+H9C9w
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188768"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F3472280056;
        Thu,  6 Apr 2023 11:33:51 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 0/3] gpio: Add gpio-delay support
Date:   Thu,  6 Apr 2023 11:33:41 +0200
Message-Id: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello everyone,

thanks for the feedback I've received. This is the first non-RFC series for
adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.

Changes compared to RFC v2 are mentioned in each patch.

Thanks and best regards,
Alexander

Alexander Stein (3):
  dt-bindings: gpio: Add gpio-delay binding document
  gpio: Add gpio delay driver
  [DNI] arm64: dts: mba8mx: Use gpio-delay for LVDS bridge

 .../devicetree/bindings/gpio/gpio-delay.yaml  |  79 +++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |  10 +-
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-delay.c                     | 164 ++++++++++++++++++
 5 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yaml
 create mode 100644 drivers/gpio/gpio-delay.c

-- 
2.34.1

