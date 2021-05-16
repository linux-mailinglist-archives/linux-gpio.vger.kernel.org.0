Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F3B38206E
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 20:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhEPSlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 14:41:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37107 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231358AbhEPSlA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 14:41:00 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 May 2021 14:40:59 EDT
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id iLZ1lyWmcMajpiLZ2l0Aat; Sun, 16 May 2021 20:32:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621189955; bh=7cTrg+GU9k/ZVtBQMMRNn/CYTMHS8XO/LSG0ww7pHN8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=BMcfyrvAKaHboqVTJhIC30XvVgmg4ZnM5j21EmDnLHoXWMWC9HBB3PchAsvlVNgso
         0L/Glq+sEZUqjYHl3s6aKbyWhocpy/QPY+l4cWrT4Bnmo2nB7zTOSxJeEtq8G9ofJM
         4j3D+H4MuQBmrf+RdMxn9gMBNk5t4juP012z3b9Fx3Qa2rvce3XLyZ4Ex7Fma2UlfM
         g3rEXr/dyESIAk+XCOXEm6OvbQR3vgmIidhyGweZ704RBFNK/IhLzWgHNv1/KrNVN0
         3in05HE0/gxW4zyz1VIzqMzT/YZDaO9AkRtfcX3x2vYkTztb2//4B7xEI30ioyYSFc
         fqVtnxfIoGmzg==
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Apple M1 pinctrl DT bindings
Date:   Sun, 16 May 2021 20:32:16 +0200
Message-Id: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfBL2etnaLpahmImfDmopdzD+YTDabxnN0nXcvofsVQT6otmhSDmPSOM15IwXJr6DHFqFpctr+Vb4/Q6/rCAf1TFHZbTdD+jm/T1a9aon0fT9BMCZZatX
 Bol9M552q2Z7djmv203XcTSzEReGFuNkDpajb+qbtiRyp7jT/fCQjd2ww5Fjd/n7YX2URd0zSSNu20z3LDIdWfXHSq7tC0fdgwJ/jcSTs/GgKCwplIwRI+fM
 53nsog6MT0ZYDkDp3g1CbjSOoDQLyCOxNWyMv86oCSPLAopr3gJ/eEnfD8E5mjAX+HLgG68iZLVQMZFCOngBS3Ohvq+OsUou1jQKnnNwlm1I6Ihcp6yH5TF+
 haee953CsbhntPfpj/G+4arlMXVAZDtVDZNq5l4hErdUjeuZIOjY3uW+nWlmnk1GNCxkgVreev4fyqKCbyvbAr+LP48IF05TCD1Yd8J3HpE3479ilSrpL7Nf
 U8tdrbSucSxrYk8H
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Mark Kettenis <kettenis@openbsd.org>

This small series adds bindings for the pin and GPIO controller found
on the Apple M1 SoC.

At this point, the primary consumer for these bindings is U-Boot.
With the help of these bindings U-Boot can bring up the PCIe root
complex into a state where the OS use it without having to deal with
the GPIO pins.  A Linux driver may be implemented later to support
power management and/or other devices that need GPIO control.  Since
the binding is based on standard pinmux node bindings this should be
relatively easy.

Changelog:

v2: - Fix typo in DT schema


Mark Kettenis (2):
  dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
  arm64: apple: Add pinctrl nodes

 .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |  83 ++++++++++++++
 include/dt-bindings/pinctrl/apple.h           |  13 +++
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/apple.h

-- 
2.31.1

