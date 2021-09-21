Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD11412DF2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 06:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhIUElV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 00:41:21 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:59391 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhIUElU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 00:41:20 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 01FA52B01422;
        Tue, 21 Sep 2021 00:39:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 21 Sep 2021 00:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=I4ve/cgxK4c8BY7+UtD8bEL+nk
        Zo9i2k6Rhodknqgww=; b=E61X9XFXPJOOQayHDvUcuo+rTPfjF/ky5zk3Mi4hS2
        rVVK7HKI5BQweODHKuu2SNklSikLEnAOIzatUf1x7kuwKzatQtG8tUPknIs5tEwC
        WeIgCgSwgZnqaYJajBac1iUb5AEU7Crh7uNRm4PudjOuvyrWKcwmt9GooSEqsKH9
        CYmYdY9A5VMxgX62Qu87Jsm9OC9KHz5PIv8rCwVpdF8khFJoT9I/55qqnn1HRQT8
        GQPGdPZRlM4kemArr9OEUtxrC47/24fL2tFGdsL4y9rYZ8UUsMYUxWenQrbWKH/w
        GMqT7P2AKDB/oK7+vfBqLNGXOajv2TfAVNMWd2Ap72gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=I4ve/cgxK4c8BY7+U
        tD8bEL+nkZo9i2k6Rhodknqgww=; b=QY39RzHwtcUTsQe560mXBFfewJazNxmHD
        kwLUpf7ulzx9P9K3cbWHYtxi73rS8UXVYnkpWgoNnUWYVwmBe5MIKYeoPJqwYS7p
        8vdPnFh/xwbXc/Y0lcfECT9cswW4rB3WpfzGetDElmk99o6KkJywz3cZZ/0q/QdQ
        TOT14YNDOEY4N5PeZ6qzRHueeixC8eUkNUKd/Gg8yDHzkXjBgdahpO2UkJFXDtKV
        bhpxE91z17KsYiSiBa9KZrXRv1b30oKbhiFR4j9MdF/lrOkveu8Po4QdJY5VRFur
        Q/jpmVZwhK+fYOmEguV54k4krU1zeC/MYZDeXMEY0Yw1zCpbTogsw==
X-ME-Sender: <xms:FmJJYZHJLT_T9fV3dqW3bn9m2U46-eGylFh4XlKuzQXB_3YE8gqlxQ>
    <xme:FmJJYeU0OeEl9zSWJOabAYrzoNaha1yRsl6ZE8cCPK2NpZFfuU-tv5XvBJb-KbBj-
    bR0YyIfbpkgG96sgg>
X-ME-Received: <xmr:FmJJYbKbXZvDlhXv7C8ptlPjqRKPl3orZ4pXxhhk09hj8_genBMP718FbOqfRUpDvoX8pAvKaZbliGvmUvhI_zCcMW6dY7EueWDqSrYWDlzhZrBJpPe8Pa3_2mNKuo_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
    ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
    gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:FmJJYfGiuGlE5cw--FLcNStViYGe8Uy1h9DQ4UQTwmfdb66xrBaeeA>
    <xmx:FmJJYfWqcVZH0UBaIn9YnzwLehPcyxlDMEUPUf-0McBBRXb6O-4wXQ>
    <xmx:FmJJYaOEwH6J_x2IEnl145O3Y_kw28D3KNxTrG4gxdHtfVTs1-ViLA>
    <xmx:F2JJYYPknL0ldam98KQi0LPq5Ky-KgSwjxjyJmQM9K7vP2J_MHVekGZfzYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Sep 2021 00:39:45 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH 0/2] leds: pca955x: Expose GPIOs for all pins
Date:   Tue, 21 Sep 2021 14:09:34 +0930
Message-Id: <20210921043936.468001-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This is a rework of a Rube Goldberg-inspired RFC I posted previously:

https://lore.kernel.org/lkml/20210723075858.376378-1-andrew@aj.id.au/

This time around there's a lot less Rube - the series:

1. Contains no (ab)use of pinctrl
2. Always exposes all pins as GPIOs
3. Internally tracks the active pins

Without these patches the driver limits the number of pins exposed on
the gpiochip to the number of pins specified as GPIO in the devicetree,
but doesn't map between the GPIO and pin number spaces. The result is
that specifying offset or interleaved GPIOs in the devicetree gives
unexpected behaviour in userspace.

By always exposing all pins as GPIOs the patches resolve the lack of
mapping between GPIO offsets and pins on the package in the driver by
ensuring we always have a 1-to-1 mapping.

The issue is primarily addressed by patch 1/2. Patch 2/2 makes it
possible to not expose any pins as LEDs (and therefore make them all
accessible as GPIOs). This has a follow-on effect of allowing the driver
to bind to a device instantiated at runtime without requiring a
description in the devicetree.

I've tested the series under qemu to inspect the various interactions
between LEDs vs GPIOs as well as conflicting GPIO requests.

Please review!

Andrew

Andrew Jeffery (2):
  leds: pca955x: Make the gpiochip always expose all pins
  leds: pca955x: Allow zero LEDs to be specified

 drivers/leds/leds-pca955x.c | 65 +++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 31 deletions(-)


base-commit: 239f32b4f161c1584cd4b386d6ab8766432a6ede
-- 
2.30.2

