Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913A92030FA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgFVH6D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgFVH6B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:01 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64681C061794;
        Mon, 22 Jun 2020 00:58:01 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id m21so12831186eds.13;
        Mon, 22 Jun 2020 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gj2WcL+UfsP/vfAuxkjNvRlld/AvTW26Bzq7KWznkaA=;
        b=jKaejiEoJbr3QjqQGxmPwFytG7gngAHtIWeQpamDnvg0ypOg/46ZZeF5aGS/Ta1Bmc
         u02YnC/lkj6NAzKz9b/T64b8W0GtPWZj5cQE9JUmC3DB0seupgfauzam6jcrqje+cPdY
         4DUjJSnO+xqxH8GXdQF4dUL7sK4BAda32uj9vkDg39tUehtBqWHUYN8cC4rGZCkSegwW
         fNde0JSQkAuCdyXIEF2zf7eSBIr1NPEB//oTKB7sNJ4pnfVxLPWz+1UHB1eoVz42tbVA
         CsJKj4whrpkpNOudHK9Wnu2YCHPRqlQ4YsdZ7OQPt603U5T6Eb+TagdcpO1iFOHkk1/g
         gEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gj2WcL+UfsP/vfAuxkjNvRlld/AvTW26Bzq7KWznkaA=;
        b=HuqLkpBbfJ/kCXn/KpqUApYJUh0B4dU0iYGtvSN90NweiICWZhbRW7hp/FG5Afz6hI
         0qYme5JR4f0ixbetZu2Unyh9KF8wdOw3RcKfKCrE2idlQxV0HaIeYqgMijhSiWp5EB9T
         1DWRxCFE1aAiL5JFkwk8snWatIoxyK7XtVsEtEJMcg2c0dmJ+SryQwACqALmgF/uZAE1
         z24xMyoJIgAU2PZJevuwdoB7nIn6N7fK9Ud5uUF3BG+KoHm2Y0MdIYzYtxFi+0cItCqj
         k67H6sbpCX5YvXe2n1iSse3h7UpxmkJm7u2ltIAGHZwARTJKQmiWNmzDkSSDdQCCiwlB
         t7aA==
X-Gm-Message-State: AOAM532ZzS8eYn0bYRl3j7y4eY0jJk+swgUb2UtfR56pACj2lz4ZaXQ6
        x5WsXA3+NV+LU2MjK6uta38xawjM974=
X-Google-Smtp-Source: ABdhPJw+RT493Z5l9sp0YlWw+gZksKXxQsusKEDbXAkvfCjCqIRiSYHjamVgq6VObiESb/7tEvFlmg==
X-Received: by 2002:a05:6402:888:: with SMTP id e8mr9689955edy.210.1592812680191;
        Mon, 22 Jun 2020 00:58:00 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:57:59 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/8] Documentation: Document pm660(l) SPMI GPIOs compatible
Date:   Mon, 22 Jun 2020 09:57:40 +0200
Message-Id: <20200622075749.21925-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7be5de8d253f..c3d1914381ae 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -23,6 +23,8 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pms405-gpio"
+		    "qcom,pm660-gpio"
+		    "qcom,pm660l-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
 		    "qcom,pm6150-gpio"
-- 
2.27.0

