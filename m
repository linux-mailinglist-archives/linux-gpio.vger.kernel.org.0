Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C134F649C7B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 11:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiLLKmS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 05:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiLLKk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 05:40:58 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6494A11812;
        Mon, 12 Dec 2022 02:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841335; x=1702377335;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SZvNSGUvnYe1d22Vo+/FNiWxbX8g27X+rr6u+7Ne0/o=;
  b=cap3KE83lIJrMaLFYXQAlz1C8vh1liovBUNw+SOxrGQYGx6cGCFW9GKA
   MEZnvMQRaKIPWgJbGLInSmrQPrLEMQLQeKiIGZIjuRtzMq1OVswcwRII8
   6IiaHjEX9gZ2tuOJNt0M/Li30qdbBAN41Bq4hVeUsCiRCN5oQJ/q+Syzi
   EmmBoc6f5oKiTNHkHAccTHeAtSrBUE5fo/VR2cKjpEjLD5ag+o1dhVGp5
   wdeLANU7bpqgJ2nGMFSDe0quYt09ROQhX0wEc/r9j7yGlRgr7zzQei+x0
   fUG6Rzrh9m9tNC2iEs8FiIyBipcRyN2HDogK/wN6uNtNin+//DTU4qYWj
   g==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892495"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Dec 2022 11:35:32 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 12 Dec 2022 11:35:32 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 12 Dec 2022 11:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841332; x=1702377332;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SZvNSGUvnYe1d22Vo+/FNiWxbX8g27X+rr6u+7Ne0/o=;
  b=MpEDeWMKsE2lAHuvdOM5wYUy7VswQOG4sahzB8gPxrrdvkOGRr5XsNaa
   uV0bf1OcYa6ES/6y3SQnGD+KJfkeO9FZHvr+Upkmm6lhTsYY9JwCfOoh0
   bV9Szc4pu9S+TKyqseyZHQU2FlQkiC3LzlfWthwDIbwRNAWUojXzuBor5
   a1r6NwM10Z8BAUBwsmAq5WYMChMltNObJ4Z3OdBJhCYi05ZDFqjdpz1oy
   KqHLsP/kwb4W/OBnEvZ2paCbpzS7EkVkQIMAFxH+A8WB2pBfZGgVnsyql
   W7/794kAY53i7t21c/AXsytTKCgva8UX4TlDPPyCjgv2eHrTFLV7OMhbf
   A==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892493"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2022 11:35:32 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 47DC2280071;
        Mon, 12 Dec 2022 11:35:32 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 0/3] gpiolib: ramp-up delay support
Date:   Mon, 12 Dec 2022 11:35:22 +0100
Message-Id: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

this series is an RFC for a general approach to solve the issue at [1]. While
a device specific property works as well, a more generic approach is preferred.
In short: When enabling a GPIO the actual ramp-up time might be (much) bigger
than what software usually assume, in my case >100ms. Adding a delay to each
driver is cumbersome.
Instead the (optional) ramp-up delay is added to each gpio_desc. The delays can
be specified per gpio-controller, similar to 'gpio-line-names'. Actually the
parsing code is almost a 1:1 copy of devprop_gpiochip_set_names(). Due to
(temporary) memory allocation, I opted for a separate function, there is code
duplication, but handling both properties in a single function seemed too
tedious, let alone the to be added ramp-down delays.

This feature could also be added as a callback in gpio_chip, but the callbacks
have to be added to each driver then. I would prefer a single one-fits-all
implementation and another indirection in the GPIO call chain.

Laurent suggest to add a GPIO delay node in DT. IMHO this increased the DT
complexity unnecessarily. But comments are welcome.

The following 3 patches are a proof-of-concept on my platform, consisting of:
Patch 1 is the proposed bindings and straight forward.
Patch 2 is the current implementation
Patch 3 is an actual usage example for specifying the delays

TODO:
1. Adding ramp-down delays (Just the inverse copy of ramp-up delay)
2. Should these delays take active low flags into account?
3. How to deal with setting multiple GPIOs at once?

I skipped 1. for now, because this is just a copy with ramp-up being replaced
with ramp-down.

I'm not that well versed in gpiolib code, so I'm not sure if I got all placed
where GPIOs are set. So patch 2 might be incomplete.

For now I skipped setting multiple GPIOs at once completely, so to get some
feedback on this approach. A possible solution is to check for the bigest delay
in the set and use that for all afterwards. But I'm not sure about the overhead
in this case.

I hope there is some feedback. While thinking about this issue appears to be
more widespread than I expected.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20221209083339.3780776-1-alexander.stein@ew.tq-group.com/

Alexander Stein (3):
  dt-bindings: gpio: Add optional ramp-up delay property
  gpiolib: Add support for optional ramp-up delays
  arm64: dts: mba8mx: Add GPIO ramp-up delays

 .../devicetree/bindings/gpio/gpio.txt         | 22 +++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |  5 ++
 drivers/gpio/gpiolib.c                        | 80 +++++++++++++++++++
 drivers/gpio/gpiolib.h                        |  3 +
 4 files changed, 110 insertions(+)

-- 
2.34.1

