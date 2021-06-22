Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738313B0E63
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 22:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbhFVUNR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Jun 2021 16:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhFVUNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Jun 2021 16:13:17 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A2CC061574;
        Tue, 22 Jun 2021 13:11:00 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id my49so298240ejc.7;
        Tue, 22 Jun 2021 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rjZNqLJoXaQTxBxKy4A/rWeiCl19M7WJIDJpQ+1Brpc=;
        b=U15pq6Bqc3LQj7b/LN7JtQeH9F3Gvr7/TTE836y99x5lMrL56guU+mTbZBvydzgYJf
         6nFHNn5u2R+HjRJIZ+Fuf+wB8zIGoJeFTu93vYQKB/GFiM+Pw7gFKUcxKaNQFWMBHGjY
         moWjA1tT9zCT/3NYkcZokN8/k0kvZUuS2tL0m+P+0WFBomWovQpPBP9sFKQd8x+5K0Mg
         3PLAAZYzgY40B75tdN7XPYjTjivkmclXRRAgZwnDtq9r9rF8mqcWmtbAkIN3lEVrcmVy
         dHz+fsbs+NbPsCLDfokJT9bFiafQKDGa/hwMKRKWvMLoIp1lyLtM/WcbAjzBJWywokN8
         C3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rjZNqLJoXaQTxBxKy4A/rWeiCl19M7WJIDJpQ+1Brpc=;
        b=UnKgMn5xM27ZJTN4R6+5mCOr3CCmwc4SrZLf+JCU1r2nriVNKJxQbHwfAY7fhaHsJP
         wGg2z7Npdy9qf0dfVaM548Ze91Lw/2xeIiA8t2tC0So+01FGLEjhBwCna6GLkOX3XSgb
         QqeABleAjnH4Zu4anrVB1xZBoxh4IFQVxoCwAF1OEYhmx662S/x6G+lvhD9AaG4tM42J
         UqXWxXgmyn0kq36S7wk8vqhWwiZBIo0S5MtaneyR6PjxVcWmaEDt+6EXdeMskp5oSk1S
         pAgZE7ebxpSoapjfQ4Tr5BNY1uETximuhyS8jfYpwj7cjWVmeAmVOEp52AjCXb61q8dY
         KhUw==
X-Gm-Message-State: AOAM530dDRrqn7Ir+0PEU6E7zBiXgroGAJ6c9QJLylnwxmtDW+mpckO4
        icT7H/cP1TmKH4fsF7oOa0A=
X-Google-Smtp-Source: ABdhPJwvEd6RsVFusgPSWU7IMl433poNnHKZNFH16Na87cPgHJSs51D1xgHANCDdtq9z4+aQLa2zgA==
X-Received: by 2002:a17:907:2623:: with SMTP id aq3mr5941852ejc.292.1624392658812;
        Tue, 22 Jun 2021 13:10:58 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id p13sm12694405edh.79.2021.06.22.13.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:10:58 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 0/2] Add Pinctrl for SM4250 and SM6115
Date:   Tue, 22 Jun 2021 23:10:52 +0300
Message-Id: <20210622201054.532979-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the Global Clock Controller on QCom SM4250 and
SM6115, codename bengal. The code is taken from OnePlus repo [1], and the
keyword bengal corresponds to sm4250 and sm6115, so I'm adding both compat
strings.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

Iskren Chernev (2):
  dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
  drivers: qcom: pinctrl: Add pinctrl driver for sm6115

 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml |  172 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c         | 1482 +++++++++++++++++
 4 files changed, 1664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
prerequisite-patch-id: 0949ba2e2f20cd3acfeff8be80dc78c7a02962fc
prerequisite-patch-id: f72aa823fffe9b245a924a6da8a14a473fffa5a2
-- 
2.31.1

