Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8955DA433
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 05:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732713AbfJQDLB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 23:11:01 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48891 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732104AbfJQDLB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 23:11:01 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 204C0891AA;
        Thu, 17 Oct 2019 16:10:58 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571281858;
        bh=xrGrisgeEZb88kf6xkzyTFrAcQCeEBWEESK0FoOUtc0=;
        h=From:To:Cc:Subject:Date;
        b=nGz6gBJikh0TD1nGhHqEvLqBtod+Rtybh67nBDFjCW+RnMliQrAguKs8rqbfty/xh
         VgbdhQaPX6z4SnGwoPPhcNnbFE3u+HkyJGR+joemN6fUKkaI1wbes5ueOUOF6LVD89
         ctf+IEHEGbf5om0m3x/no1SM7eNo0ETZ5D/Gp69wViSLCcm+1+NqZwnokvs5VQCweX
         dOhgOAIggoESB8D61WFw+cZDiD1FHI2/VUXv3rLNU9e3u4x9zaw10Tivb5umTmzqi9
         LFxAiyR+gD19tPHfu4vdB2OQYYAM+dkBn1X329l1Kt6n0WczPlSkJBiBPxjOa4LAMe
         0aA+ra1qvzbfQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5da7dbc20000>; Thu, 17 Oct 2019 16:10:58 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id E94B713EEB6;
        Thu, 17 Oct 2019 16:11:01 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id D3787280059; Thu, 17 Oct 2019 16:10:57 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] gpio: brcm: XGS iProc GPIO driver
Date:   Thu, 17 Oct 2019 16:10:49 +1300
Message-Id: <20191017031051.20366-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is ported this from Broadcom's XLDK (now heavily modified). There se=
em to
be 3 different IP blocks for 3 separate banks of GPIOs in the iProc chips=
.

I've dropped everything except support for the Chip Common A GPIO
controller because the other blocks actually seem to be supportable with
other drivers. The driver itself is halfway between pinctrl-nsp-gpio.c
and pinctrl-iproc-gpio.c.

Chris Packham (2):
  dt-bindings: gpio: brcm: Add bindings for xgs-iproc
  gpio: Add xgs-iproc driver

 .../bindings/gpio/brcm,xgs-iproc.yaml         |  83 +++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-xgs-iproc.c                 | 301 ++++++++++++++++++
 4 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
.yaml
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

--=20
2.23.0

