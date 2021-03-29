Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7532934CE9A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhC2LRa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:17:30 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55144 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232030AbhC2LRT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 07:17:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 0B5443585;
        Mon, 29 Mar 2021 13:17:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mt-4ynEJV8i1; Mon, 29 Mar 2021 13:17:17 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id E199A35AD; Mon, 29 Mar 2021 13:17:17 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Dahl <ada@thorsis.com>
Subject: [PATCH 0/3] docs: gpio: mockup: Fix parameter name and missing entry
Date:   Mon, 29 Mar 2021 13:16:45 +0200
Message-Id: <20210329111648.7969-1-ada@thorsis.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hei hei,

while experimenting with the gpio-mockup driver, I found minor flaws in
the documentation, addressed in the three patches of this series.

Greets
Alex

Alexander Dahl (3):
  docs: gpio: mockup: Fix parameter name
  docs: kernel-parameters: Move gpio-mockup for alphabetic order
  docs: kernel-parameters: Add gpio_mockup_named_lines

 Documentation/admin-guide/gpio/gpio-mockup.rst  |  2 +-
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)


base-commit: a5e13c6df0e41702d2b2c77c8ad41677ebb065b3
-- 
2.20.1

