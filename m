Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9544696AA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 14:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244231AbhLFNVZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 08:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244222AbhLFNVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 08:21:25 -0500
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C57FC0613F8
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 05:17:56 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uDrMmpEGIQyExuDrPm2JUS; Mon, 06 Dec 2021 14:16:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638796611; bh=jO0TUoA+45A9m9vG9AnfIIzZ+3nO+dpDmF32KYvu5oo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=UHYx+DRuDdSbq/na5EDgsaib+IxdjTtU8j1xzceseJhzckOTcTurONFpRE0L0cMLs
         7WYMmJMNuXrku7N6Ox6ZhaAr7cUU+s3gxrUgjBlfH3cn6Xrn5FCrmzg6byJB/+LLuH
         zBzK/2SsYfZIOcHdA2xyNr72ZnV52NIu5RVZgNorQEUHxWVzFjJhqENpOzapVU6fi7
         knA82deNFgtGZ2bKK5m+s0FCF7os3o+C4bFQWYUAkpJ37QZK7Dt3J2JNIGp+USLelR
         lw9lUgCmgZpw/IIq/9+DfnCCsqoVEd5ZA4/95MFkBfMoSp89od/98z7ZcNs7DBXaky
         tOMBS392ReU/A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [RFC PATCH 0/3] pinctrl: can_sleep and pinctrl_gpio_direction
Date:   Mon,  6 Dec 2021 14:16:45 +0100
Message-Id: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNdKAb2cv9XamxDB1XdW+MQEwt0sC1y2cbdRAmqQ0Yub81j7bvvaMYrNU2IHqEx8vfIPwA1mhYkFhzskp4H16uq0YM3LWSBi+IhHNZR6BCEcCDyfHglf
 juBMUceREyGwf06ta9Gvme/S3dIG0UfBav90DxlqqMMFeGSJ3QzPxzMdiw+VenwG/mqqinqc4evfmelq2oEt67aAIdSZXTNFGkviDI7xIJ8KTokaj/x3+MpK
 lHDx/x3PTig2a4w/bJXAylrZIUESgIU8q9iu/yzIx/RwQVZ3QIBvVS8zV4bOnRpJJtyQMUZMU3g0XiZ08uDVr5leqDkdFvSKX66TQkeoi5inTNifVqhrUTW/
 b29y+Lwl
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Based on this discussion:

https://lore.kernel.org/linux-gpio/CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9KPvwXVaowLMRhcejA@mail.gmail.com/T/#t

I propose this RFC series.

The first patch adds a check if can_sleep is true when pinctrl_gpio_direction()
is called. It does this only once per pin controller (a new field is added to
keep track if this has been checked or not). If the gpio driver set can_sleep
to false, then it makes no sense that pinctrl_gpio_direction() is called since
it takes two different mutexes. This way you get at least a warning that something
is wrong, rather than only if CONFIG_DEBUG_ATOMIC_SLEEP is set.

However, if there are gpio drivers that call pinctrl_gpio_direction() always from
non-atomic contexts (so never via gpiod_get/set_value() etc.) then I'm not sure if
this check is possible here.

The second and third patches convert the bcm2835 and sunxi pinctrl drivers to
set the direction in those drivers directly, rather than by calling
pinctrl_gpio_direction_input/output. Both set can_sleep to false, so going
through a code path that uses mutexes is not a good idea.

This series has been tested with the cec-gpio driver on a Raspberry Pi 4b and
with an A10 Cubieboard. Both pincontroller drivers set can_sleep to false, but
call pinctrl_gpio_direction_input/output().

Those last two patches look sane to me.

Regards,

	Hans

Hans Verkuil (3):
  pinctrl/core: check that can_sleep is true in pinctrl_gpio_direction()
  pinctrl-bcm2835: don't call pinctrl_gpio_direction()
  pinctrl-sunxi: don't call pinctrl_gpio_direction()

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 12 +++++++++---
 drivers/pinctrl/core.c                | 11 +++++++++++
 drivers/pinctrl/core.h                |  4 ++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c |  8 ++++++--
 4 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.33.0

