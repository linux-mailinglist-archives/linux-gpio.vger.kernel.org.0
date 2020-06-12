Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B7F1F7A0F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgFLOrV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFLOrU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 10:47:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865FAC03E96F;
        Fri, 12 Jun 2020 07:47:20 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C38E924F;
        Fri, 12 Jun 2020 16:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591973238;
        bh=uU2xQmtH42tW6IeH3dGPC0lnUtMW5Hht2lqVT2Xjgz4=;
        h=From:To:Cc:Subject:Date:From;
        b=JUrEayeG7tbFE0EaqcSKTcecMDVLls8Vl7ypODt5Ph1HOtNgfrQ1Zmg1qSwHLRPqh
         kgIq1pd3nDQVwWbcFRnWnH049/v3J4k+xQ6QU6ImcPQiwLax0fDUjtIR2/1YEIJQLJ
         ZEhpP4JcSnMVu8Q4167QaYmuGVgCiu8KZ/WMAlz0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@iki.fi
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v10 0/4] MAX9286 GMSL Support (+RDACM20)
Date:   Fri, 12 Jun 2020 15:47:09 +0100
Message-Id: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series provides a pair of drivers for the GMSL cameras on the R-Car ADAS
platforms.

These drivers originate from Cogent Embedded, and have been refactored to split
the MAX9286 away from the RDACM20 drivers which were once very tightly coupled.

The MAX9286 is capable of capturing up to 4 streams simultaneously, and while
the V4L2-Multiplexed streams series is not available, this works purely on the
assumption that the receiver will correctly map each of the 4 VCs to separate
video nodes, as the RCar-VIN does.

This driver along with a camera driver for the RDACM20 and the
associated platform support for the Renesas R-Car Salvator-X, and the Eagle-V3M
can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/v10

This latest v10 cleans up the DT bindings validation, and several comments
from Sakari's review in v9.

It has been successfully tested to capture from all 4 inputs simultaneously.

We're very much hoping that we can aim to get the max9286 into the next
merge-window. Please let us know if there are any issues blocking this.

Jacopo Mondi (2):
  dt-bindings: media: i2c: Add bindings for IMI RDACM2x
  media: i2c: Add RDACM20 driver

Kieran Bingham (1):
  media: i2c: Add MAX9286 driver

Laurent Pinchart (1):
  dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286

 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  159 ++
 .../bindings/media/i2c/maxim,max9286.yaml     |  366 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   22 +
 drivers/media/i2c/Kconfig                     |   26 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/max9271.c                   |  341 +++++
 drivers/media/i2c/max9271.h                   |  224 +++
 drivers/media/i2c/max9286.c                   | 1320 +++++++++++++++++
 drivers/media/i2c/rdacm20.c                   |  667 +++++++++
 10 files changed, 3130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20.c

-- 
2.25.1

