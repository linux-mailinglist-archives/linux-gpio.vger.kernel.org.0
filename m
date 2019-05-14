Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31BEB1C4B8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfENI13 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:27:29 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39834 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfENI1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:27:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so1805294wmk.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m6Un7OR1aiu9wrzrl8IRY5GNnopILO3r5dQ0m/pbT10=;
        b=JI4x7e7Oy3ry6mUfW5LiquXDPgzPcSd5zy3s2eWGX8WqMy4EoeoVL09PGiMTzW7OUy
         1zeXMdUAc5rN/k2ekwFxZQjgWsnxfzn+naKQC9NEexCAXDQsCNH5PPNziSSUXRDpJqs1
         OfiuS76sPDL4nxBByqQYJ8ceKziM9y6w6IehCyldMAoDofXEUxCn6pScPIkxOxhiNiUT
         siaJkO0/F1sbzN9mRsGPj0Y/nIBelz87TCjWLLrz3pynDQZ1UbNhYFiv1Zwtv+cuy+H5
         WGYV6ucH77gBg94yuAFVmhA++4wsANAXLf9KcVg6DK/Cz2foMz3t+tbLRKSQ3Y7xoA4w
         TEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m6Un7OR1aiu9wrzrl8IRY5GNnopILO3r5dQ0m/pbT10=;
        b=AX8todRC4tySa9Nlu7kG16CE1xcz1lQSDrGtBGmEaZg/tVbSF1MpwA5JousoAbfUPL
         XzQUe4kTEVIqjNWzg5Pqh/Qdwh6sLMZRzqwPZlvMTTAYnuSgPN4xPAUkYC8WmViuRYbK
         751s5TlNFftjgBRIWYpyKKG2Dr7dPGgfWqSB075VTe4CQYDoQUou4eiGnOUw8t5Tce0M
         bJ4rM8V2b7sKG7c0ilAbezp11oEE5Vy6rj9uQ2yWTg819rbA21bAIIJOz9v1jQ8eAcEK
         eErDeYkbm4pN0B8PIpvFV/fR/zMb5/S7xOuUwuFSFPc25l1mmOmqjzjzJoy2/J3XhJ6E
         Ku4A==
X-Gm-Message-State: APjAAAVRSpsxkIqOO8ub/ltHc/xU3UxAYpqIVN1FeULNUTOiZah+w3WZ
        h87aOab11FfYtbAHWLKNff9L/g==
X-Google-Smtp-Source: APXvYqwiyL+F34V5oX5aorvsSvFWYQaBw0/Pj5Q1wGOXb7PjKpXDBCJptQeHKQK6h73Y6MwygEhtkw==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr7711843wmd.75.1557822418092;
        Tue, 14 May 2019 01:26:58 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:26:57 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] dt-bindings: pinctrl: meson: Add drive-strength-microamp property
Date:   Tue, 14 May 2019 10:26:49 +0200
Message-Id: <20190514082652.20686-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add optional drive-strength-microamp property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..a7618605bf1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,10 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength-microamp: Drive strength for the specified pins in uA.
+			    This property is only valid for G12A and newer.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.17.1

