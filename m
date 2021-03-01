Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4106327A66
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 10:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbhCAJGK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 04:06:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:38056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233700AbhCAJFt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 04:05:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8612564E04;
        Mon,  1 Mar 2021 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614589508;
        bh=MZVQyEykFEiKaPxHXQUeHA3EpjEPE1zGkLiaitaAfXk=;
        h=From:To:Cc:Subject:Date:From;
        b=sjqL5XOsHdzhHTiiKCtrYIBrQgOpr/3ayO0gknBc4SL9+LFjL28xPTa/ucUzFGQW0
         6ZEEbA+0Kg9ChBCQ/E8bVYIER3GnR5SVLyusgRy2TSydxDdZlSjxI4dWKMPaLOl00J
         YPgJlIAsRXAhTepPrKizFJLlnCPgxCGxfDZjH8eA3N9Dtzs5a+LryGt4qflaIwWXmA
         3nx9iECPAy0jp3eYZ6kyObFu3bboNDhdBxCaDDy1LtDVPLbkm7VaGlc9nNYgESZoI+
         WGy1niXjuktuT7ZFZNZHrjuivvsBB6OkeATsJSsaU1wvPK4o4hcSnL938TBdF1blzS
         yzvmESmpDT40w==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lGeUX-0006pG-Ak; Mon, 01 Mar 2021 10:05:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/2] gpio: regression fixes
Date:   Mon,  1 Mar 2021 10:05:17 +0100
Message-Id: <20210301090519.26192-1-johan@kernel.org>
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

Changes in v2
 - drop the corresponding drv_set_drvdata() which is no longer needed
   after patch 1/2
 - add Saravanas's reviewed-by tag to patch 2/2


Johan Hovold (2):
  gpio: fix NULL-deref-on-deregistration regression
  gpio: fix gpio-device list corruption

 drivers/gpio/gpiolib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.26.2

