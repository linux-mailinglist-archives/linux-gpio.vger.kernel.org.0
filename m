Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6FD30D078
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 01:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbhBCAtK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 19:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbhBCAtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 19:49:07 -0500
X-Greylist: delayed 430 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Feb 2021 16:48:26 PST
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7FCC061573
        for <linux-gpio@vger.kernel.org>; Tue,  2 Feb 2021 16:48:26 -0800 (PST)
Received: from localhost (ip-94-112-197-111.net.upcbroadband.cz [94.112.197.111])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 4FF33400071;
        Wed,  3 Feb 2021 01:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1612312832;
        bh=J7vktHgOmi5o8d414tvIUJM94Dj0r0K0e8/uGElwh9k=;
        h=Resent-Date:Resent-From:Resent-To:Resent-Cc:From:Date:Subject:To:
         Cc;
        b=EjId96+YJvIQpKGtZNAVV7Ooz1AlgNNHcctdfd/nkNCZnNbOk1hA83yHUXDd1RLfD
         bAcMfh/aJcQR9j4svBZwrhwwIl1sELlYKJcswMFFC4CeOrelXn5tWN9a7remaTMkEg
         YBytL+RLtBp99rELusIlY/Y/NavRBsV9EUS4zFvpfEEG0qDxi79iPBRDgdHS4OnLN3
         M549dQwqUysl0+NJlvx4BIFRcsMOf5/Yvebyq5YdXZF1RjZyZYOaK12roKvrl9iOGY
         OQstYKDW8BQaRCL2Lzzso0usZXFnmOZKJvv+kQiOaL23FkMoP4LkN1khSAg+hNvXdk
         6IFyHz0xMHiwA==
Message-Id: <b60a6c6efc4c41641e82dd5f91d036b97378de6b.1612312770.git.jan.kundrat@cesnet.cz>
From:   =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date:   Wed, 3 Feb 2021 01:15:53 +0100
Subject: [libgpiod] bindings: cxx: fix building with clang's libc++
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is what I get on clang 11 with libc++:

 line.cpp:248:39: error: implicit instantiation of undefined template 'std::__1::array<gpiod_line_event, 16>'
         ::std::array<::gpiod_line_event, 16> event_buf;
                                              ^
 /nix/store/vk8ynr4hj2a8w7g1b9m8wknzj39iiv4x-libc++-11.0.1/include/c++/v1/__tuple:219:64: note: template is declared here
 template <class _Tp, size_t _Size> struct _LIBCPP_TEMPLATE_VIS array;

Signed-off-by: Jan Kundrát <jan.kundrat@cesnet.cz>
---
 bindings/cxx/line.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git bindings/cxx/line.cpp bindings/cxx/line.cpp
index bf4a3eb..9b66d1a 100644
--- bindings/cxx/line.cpp
+++ bindings/cxx/line.cpp
@@ -6,6 +6,7 @@
  */
 
 #include <gpiod.hpp>
+#include <array>
 #include <map>
 #include <system_error>
 
-- 
2.29.0


