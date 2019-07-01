Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DB15B7B8
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfGAJOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:14:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52928 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbfGAJNP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so15004056wms.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=HsAPm2yLJUTmVQ7VrhIS3c6633P/oVY1hyXWdRrTSY0DaJFH5bo3iwB4WDLzqoIjFb
         +ofZX4UV7FR6yYxUXONipQWUjI3LKOc/TveJvoc3qP8bVzL0lMb2xqRjT3Aj98RxHlB+
         GpNhcY2zmaGoJcTVbOliiJ6VXhUVfeSD7wO9C2/2prWgE9+Gdr833y2faMoNUxwUOhv4
         Ty6IF1dEIyHgu4lzo46tWct6hPdW3k3KdsfcG0Wy5bOHVMxjZgNe2KVsQXBtDH5beIQX
         zOrKkgH/T2TGdTUlj9ohM0pkt2w+MnhOGAblF+pefLHBIOfNrheg34r/1SMhDhjzwlLK
         yNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3PBhHywaKoqeEXor4qGKKEbTn6ANfeSg4ls1LrAVLLs=;
        b=NqKbkoB7KO6n6m1PtnN6GoasYPaMdUnOTA4XL6VGZko0zbix4weD0uwBcArS68vCik
         yWhnHTrC07/LhE8NBhIgsDt7PiIhfPjorynPANn7poZ2srACS+lWQdP4KOHdB/fS+QVy
         7vdN4CmFJ1KYfL90hzYI3gTxWRUEaxxdM7Sumy8a1AC/gzZ5t4zPhPZ695kR1uYvnFDK
         +YkDH7JmYM4X1ELwEqqPPKCefqjsJshn5r49llnYEOIXnAiErg1P4wnDPfQGQuFztmX4
         FCklweJSTQtNlO9lVZfemmJSaLCPp2lWQAUrsoF+AYAfbrp69IKZqzsJlN327saxb8Eh
         Y44A==
X-Gm-Message-State: APjAAAX58Xz5+ue0DykIOqgndngU2j7WRDrXm8TpXaQmmslvpUCe+43D
        qhy6bAW2p+UiELmLvg9xtkZSyg==
X-Google-Smtp-Source: APXvYqwUZnbG+qavm8RsJY6F9HtxkvEbIBbdChezRZVD4NLmW5HAZs5R0eARFRcCFjxg92naHMdEkQ==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr16534969wmf.166.1561972392885;
        Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 02/14] clk: core: introduce clk_hw_set_parent()
Date:   Mon,  1 Jul 2019 11:12:46 +0200
Message-Id: <20190701091258.3870-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..06e1abe3391c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2490,6 +2490,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bb6118f79784..8a453380f9a4 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -812,6 +812,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.21.0

