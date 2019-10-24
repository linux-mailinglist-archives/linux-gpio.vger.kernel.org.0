Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905FBE3D2A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 22:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfJXU1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 16:27:14 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:59796 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727563AbfJXU1N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 16:27:13 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 51734891A9;
        Fri, 25 Oct 2019 09:27:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571948829;
        bh=TzDk+b26arhZ49teYJMAkw6XfZatjK6lDIP138sg0hw=;
        h=From:To:Cc:Subject:Date;
        b=vKpGLy4DUFGKsKvFoeBuAX7I/uu8cwliyFbFMFUrGs7H+PfigBEOvQKcvyjl2rQTJ
         c3m4Ut63NcgQ5C1jU1uCqItuOpVj9KYkpegm+5WnvYmghdtFC4dTmrZKutIqxj538d
         7rDdTNGNeh4qcDmTgXYsVWpYlBgISGue5YwCLWFpcQ3v8QivWhdpmQLhRXNhkPs+AO
         RsN6NsAxFfyMP+9sICbiq1i9Nw/kjPg8XtJGnR6VzXymfK1to2gm7cWEwstJMYOZgg
         zR2EZZHbtsZw5ImWkr6LwNYffC/2mkMwjLgSf86sOpi+kxTmrV6VU1dZOMWDS2SNyC
         HrcNQm4PTTPqQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db209190000>; Fri, 25 Oct 2019 09:27:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id F192D13EEEB;
        Fri, 25 Oct 2019 09:27:09 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id B7E7D28005C; Fri, 25 Oct 2019 09:27:05 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/2] gpio: brcm: XGS iProc GPIO driver
Date:   Fri, 25 Oct 2019 09:27:01 +1300
Message-Id: <20191024202703.8017-1-chris.packham@alliedtelesis.co.nz>
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

 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |  70 ++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-xgs-iproc.c                 | 321 ++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
-gpio.yaml
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

--=20
2.23.0

