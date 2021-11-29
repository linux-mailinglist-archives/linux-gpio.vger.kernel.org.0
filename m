Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1848546142E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 12:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhK2LyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Nov 2021 06:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbhK2LwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Nov 2021 06:52:10 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380AAC08EB59
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:10 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a18so35822335wrn.6
        for <linux-gpio@vger.kernel.org>; Mon, 29 Nov 2021 02:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09AJWSS2EnDzZy1NU9qMhGd+tyU1owW7fQbYGShYMDw=;
        b=SNKdRY+munpFHoTTdfKs2Lz5LxTst5XJ7mozPMZUv5QRL8sgpMjjwSgt8CSckz/oDV
         Sq1KybNAOwtDRvbGV8z5zZp+e0yB0WZFFaECn3QtglG92JvYb7v8xc4QIeS+YjKCte8o
         4tnXLpDeht2fc3dfkEUsU65qw8EB2iDNKBUSjx8TVRyi5Vc5CZO6x76MYbmK7jDg9RaV
         029JMEBs/PS8hBGi6vh62zOuE7UwhUI3eRaDvGK8O+HU6/cawGzc7wK1/x1axsOn16ys
         SDKX7AvejmPLUob+u3mZOAZHlUq3yosb+cyLLlTFEwMeRALgpJiAwQ50FsO5/XXwuWVx
         PzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=09AJWSS2EnDzZy1NU9qMhGd+tyU1owW7fQbYGShYMDw=;
        b=72qNQqXTeafkM2PxkonmtDoNh6OlERhBxU/TJgN+CYbpZEAQ5rlJQq0qVdkyBjL7Iq
         +bab7HsBwROrPq+D8SfUuB7+oyj6tctyW1TqawgnYG+osw//4u3cvVsEVYORvFozTyjN
         PEV1xjcHTbv9JKuSiW7T8v5EzoUhPwxwpz9786wn3jCRJeFQ51cs+fSBKjMUqSQl9LQO
         k2D+q/EqHLKhyg8KBFnttAw2Lk2sBHGN3xUB3no4ur9v99lDSXnDVmxCo0GrIbUvkzur
         efUvjLPHXzJiFlUxDUHwF2fX23Hr5R12oksaxCSk59gdMcsKpc6BhPdSrWUH6wu7Ilbn
         sd2Q==
X-Gm-Message-State: AOAM533JgCdideuRbN/IK2fP4JnfpU7NycoSEyv0ATUintYJycDlBK15
        abjCpCAbpHezwZn+XgOTY1hZCA==
X-Google-Smtp-Source: ABdhPJwgni4Mw5ZNcLMS7xYVGzDKQFDrpsh1MTCUKF1TsIbXke50+10EjtLWxDeSl/D+I5YEyGtSVA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr33657051wrw.138.1638183368785;
        Mon, 29 Nov 2021 02:56:08 -0800 (PST)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id z15sm13246285wrr.65.2021.11.29.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 02:56:08 -0800 (PST)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: bcm2835: Fix gpio hogs and pin reinitialisation
Date:   Mon, 29 Nov 2021 10:55:54 +0000
Message-Id: <20211129105556.675235-1-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tackle two problems with the pinctrl-bcm2835 driver and its Device Tree
configuration:

1. The pinctrl-bcm2835 driver is a combined pinctrl/gpio driver.
Currently the gpio side is registered first, but this breaks gpio hogs
(which are configured during gpiochip_add_data).

2. Since [1], a "gpio-ranges" property is required in order for pins
to be returned to inputs when freed. Note that without patch 1, the
device never gets out of EPROBE_DEFER.

Note that the Fixes: tags are little more than hooks to hang the back-ports
on - no blame is intended.

[1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
        pin-ranges")

Phil Elwell (2):
  pinctrl: bcm2835: Change init order for gpio hogs
  ARM: dts: gpio-ranges property is now required

 arch/arm/boot/dts/bcm2711.dtsi        |  2 ++
 arch/arm/boot/dts/bcm283x.dtsi        |  2 ++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 29 +++++++++++++++------------
 3 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.25.1

