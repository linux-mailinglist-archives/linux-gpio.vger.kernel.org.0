Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44C742D6D2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 12:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJNKQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 06:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhJNKQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 06:16:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9BBC061570
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 03:14:24 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w19so22363537edd.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GHc5A/qhNfuEto6B41cQAXzkLUJ5EigvZPwypQfoqNo=;
        b=LRSGJ4v6BqaTzAjcf1YExgGxiqvqx8nAF5XRA8swmqSepJG4/g1+zKVbsaEZ0zD+jo
         iRbow2iNFs8T7pgO3XftuJUw9FRgE5D08jyNciQFyuRtRMWAUrAZeoelZTt0okM2yDYE
         hvnHQvBEO/0CrDIUF5LwX1ogsUjVwqdMgReCT3U9c+8p5G0jdE+5VmecOjE0wqpHC0zD
         2clLAw6/wKUCAj5cPdyoT0jmJSW57hsMX4gP+O2ku29OosuVooqxTSQm9iknP8BmgJzL
         jUvWYQq+K9if+i3oREiytpPtOiyvpn7xN/Yi9ue/q84m5gGEylV3uz2J55q1xJaCi2Io
         7ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=GHc5A/qhNfuEto6B41cQAXzkLUJ5EigvZPwypQfoqNo=;
        b=ZMvPkqt/SDMQZRyLphWsdYfReiFXrdgkJHOLbymlU3vRsyIFZpyL6QqRPELD3g434X
         w393rLjNVkmlaT3sb0L5EWUwdJeHYCk5qnEY92+4g1Uqu34wafavIJ28td8RuivnJjhk
         nNkhzc3xS18AtR5AT0FNLC2wUpqKLN+xmh7q7THvicFwFpbVSWEbWNuaOVKJtGXu7ayz
         emdA0CRbus/9rwPpMC5upP4gLwjQb4dsIXa9dfOkU94igJcec0EDuvuQbJlp+qXH0c4i
         5Akik4QjLS305boTGbHqcOBalz76sX/dGvlA3AbNmH2kVLN+nXyqIpvucKqB8MCY73cP
         PtZQ==
X-Gm-Message-State: AOAM532SRoB1A5yEy55YG6k+bzYfJQIKuOM/RDPoW77LhONVCS1wjW33
        H7lt6d0vtw9x1crmMR8YcjUdjQ==
X-Google-Smtp-Source: ABdhPJyDwtW9LHvRz51bmzBPrlr56K96+xhvMtJUFN5ybCv8O/JwTFkvRi4bCVHoOhQIjmDPbfp3kg==
X-Received: by 2002:aa7:c741:: with SMTP id c1mr7454024eds.194.1634206463151;
        Thu, 14 Oct 2021 03:14:23 -0700 (PDT)
Received: from localhost ([2a02:768:2307:40d6::45a])
        by smtp.gmail.com with ESMTPSA id t18sm2127329edd.18.2021.10.14.03.14.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 03:14:22 -0700 (PDT)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: zynq: Add missing compatible strings
Date:   Thu, 14 Oct 2021 12:14:18 +0200
Message-Id: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"xlnx,zynqmp-gpio-1.0", "xlnx,versal-gpio-1.0" and "xlnx,pmc-gpio-1.0"
compatible strings were not moved to yaml format. But they were in origin
text file.

Fixes: 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 378da2649e66..980f92ad9eba 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: xlnx,zynq-gpio-1.0
+    enum:
+      - xlnx,zynq-gpio-1.0
+      - xlnx,zynqmp-gpio-1.0
+      - xlnx,versal-gpio-1.0
+      - xlnx,pmc-gpio-1.0
 
   reg:
     maxItems: 1
-- 
2.33.1

