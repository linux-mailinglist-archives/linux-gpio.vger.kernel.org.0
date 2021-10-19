Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8BD43347E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 13:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbhJSLSm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 07:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhJSLSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 07:18:41 -0400
X-Greylist: delayed 1334 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Oct 2021 04:16:28 PDT
Received: from chandra.tablix.org (chandra.tablix.org [IPv6:2a00:ee2:100:3a01::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65D2C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tablix.org;
         s=alpha; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc
        :To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=i4oGjo+Ih1xjZ8ZY30E1MdBgsqy640tSdXfj5PM0dVw=; b=JEJeHea0YJokQkuEiEjDuZfyhG
        IXow+s9O7kPdKRoR27+fKQ2xknDBM0hIeTrS8Gto5RZzop4UAGR+GHrZ5cGU6vs8r6rPqNfaciXQQ
        N6dRLUldE2npEGCM4iAKyWLLEH9RgPyZ8fHrN6x9baxSzj7Q3Owti2kgpLf8e2Vm6tSnpMCnVTAz9
        0zvraU6u6NgBRUQyXxabU0zEJG65XJJC4HP+X/6XYZRNAZL+bgCv+V8qNlZPZ+L76kj/Jkdun/17Y
        CbcOnnu1z6CC9Ve2DeAyG4zc7m2qqs+5HfhXAbOkl7aMcqDLodxhGIhem0t/NXsgvFmPYXetrnKNR
        EHto/OfA==;
Received: from [2a01:261:355:1d00:9067:d686:f385:2acf] (helo=muffin.lan)
        by chandra.tablix.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tomaz.solc@tablix.org>)
        id 1mcml1-0004jq-D2; Tue, 19 Oct 2021 12:54:11 +0200
From:   Tomaz Solc <tomaz.solc@tablix.org>
To:     linux-gpio@vger.kernel.org
Cc:     Tomaz Solc <tomaz.solc@tablix.org>
Subject: [PATCH 0/2] mcp23s08: add get_direction and PIN_CONFIG_OUTPUT support.
Date:   Tue, 19 Oct 2021 12:52:48 +0200
Message-Id: <20211019105250.9405-1-tomaz.solc@tablix.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Motivation for these two patches is setting mcp23s08 outputs on boot from the
device tree.

gpio-hog was already functional with mcp23s08, however libgpio incorrectly
showed pins with output-high or output-low hogs as inputs since the driver did
not implement gpio_chip->get_direction().

Many other drivers also support setting pins to output-high or output-low via
pinmux. In contrast to gpio-hog, using pinmux to set the pin state on boot
allows the state to be changed later from user space. mcp23s08 did not support
this since PIN_CONFIG_OUTPUT was not implemented in
pinconf_ops->pin_config_set().

One issue with the second patch is that pins set to output-high or output-low
via pinmux still show up as inputs in libgpio after boot. This is because the
pin direction gets cached in gpio_desc.flags in devm_gpiochip_add_data().
However output-high/-low in pimux only gets applied after that. I am not sure
what would be the best approach to fix this.

Tomaz Solc (2):
  pinctrl: mcp23s08: implement get_direction()
  pinctrl: mcp23s08: support for PIN_CONFIG_OUTPUT.

 .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 12 ++--
 drivers/pinctrl/pinctrl-mcp23s08.c            | 72 ++++++++++++++++---
 2 files changed, 68 insertions(+), 16 deletions(-)

-- 
2.20.1

