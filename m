Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E43C32646E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBZOzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Feb 2021 09:55:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:52632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhBZOzn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Feb 2021 09:55:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D60F664EDB;
        Fri, 26 Feb 2021 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614351303;
        bh=w9ir0e0TIjg6ykgGXU5YOusAn0SRJtGaS1FrxyZ1mPw=;
        h=From:To:Cc:Subject:Date:From;
        b=Hf0gcllL+xERrx5ymy3htPhW7wWanvYtm69ik67x2dE4CohkSYCjI3GG4tbnEkPVQ
         7L5QNz2yWO7POKWDbnCJfY4PlYCQe5WAAPU3ZKjy1SbtpIqqA51bQ9SSvkFegPws29
         WuTF2OkeJd9tcnHw4cbao9XR2YjtbLXwy5b+Xv614GUG5VE4z/r/C4KgIxVhvS7I+J
         YwAjgkm3JwJMmEjh+q+6c2RY9lVu3b0BwbKnRrBPOsolkGiBPN+WbWgajzrzCEiGuW
         xDNhnc8/B7ZoWE3YIQc6/qLAmta8avnzKfFtNncYJw98i9u1/C0UsY/xuggVfQhAdh
         prDGuNa1jB6PQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lFeWY-0000Jz-JQ; Fri, 26 Feb 2021 15:55:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] gpio: regression fixes
Date:   Fri, 26 Feb 2021 15:52:44 +0100
Message-Id: <20210226145246.1171-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here's a fix for a regression in 5.12 due to the new stub-driver hack,
and a fix for potential list corruption due to missing locking which has
been there since the introduction of the character-device interface in
4.6.

Johan


Johan Hovold (2):
  gpio: fix NULL-deref-on-deregistration regression
  gpio: fix gpio-device list corruption

 drivers/gpio/gpiolib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.26.2

