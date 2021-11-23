Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5FB45AAB9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 19:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbhKWSGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 13:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhKWSGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 13:06:07 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F25C061574;
        Tue, 23 Nov 2021 10:02:58 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id u22so12785390lju.7;
        Tue, 23 Nov 2021 10:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+xEZeptIFxKUhbqhiFVnqGqN6Ab8HrFfKJKYFIcuna8=;
        b=XkRRgNSIKJA+KL4lvhEPdfl4M7/lL3095XbjqfJKGR5T2tPClqoganY1qr8ZoNkCoM
         sVMh0rygRtxoykrMRuRiWlUblmvUhMBnUtA+rmdDLyuuVgTKDgq+x8JnZVnXvW5wX89m
         dd8p9h+OiunRY7nZARMZ1ZHiSURDMo0tiB+KAUQiiT4r3UiS8g2chmseEBO5Iw9ET5gb
         z864elY8U3h/nZEWQIjwd3U5R99vZfEoLNN4FSzesVnfPTQNTFs7xZJjMBi6pdLEDiZ+
         sFaTgz+CTpkQP8vmvNeJWIj0GTzyvi1T1Os7GVWOf3rTisxiiqcby7U3lBSgJx3ejydx
         XYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xEZeptIFxKUhbqhiFVnqGqN6Ab8HrFfKJKYFIcuna8=;
        b=PvjaXumtXhsITkTWBzGi3PyvSbOxn95GUyXgsndQq7f4rC1C5VvGmgAO/D9oJSQO8a
         P9mGnr5z0BzskO5U/o53ZDIvGMsj5JOpROsCnrGav29cuBo2N6qgccDxs+jxdAoezRj/
         QuiVuncN/O8qD23tssR79WKGH7PaZ0Pnh9tfqHZgm2JC12lxvWe56BZF99QwyVPTiX7V
         hDAMpZGguy4tTvHp6s6edtQFo5BoXzwiFJj5/CrJTQXovmfebCoJq52M6BGMTIRPHO4C
         oBy8nmFSTnBnnwOcK+hGMLB2XIAyKBH0U9lg4iLGbriDm+zh1TywKGvITREemUwa8SCH
         xLRA==
X-Gm-Message-State: AOAM531P0icvDjs4GhPgowfFlAzxUXvMdJpo7ZqepAuTBFZwrF0hcDJu
        hS5SV7H+0b794KAw/H5OLeE=
X-Google-Smtp-Source: ABdhPJyQKVczbO9Ysn5CcRlL7RMpM5Wdm1PgdHRQqlqakpz+n0cghsCDOkoQ594avR8B87GumXXBBA==
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr7822834ljj.213.1637690576876;
        Tue, 23 Nov 2021 10:02:56 -0800 (PST)
Received: from localhost.localdomain (public-gprs375115.centertel.pl. [37.47.96.140])
        by smtp.googlemail.com with ESMTPSA id g22sm1357724lfr.237.2021.11.23.10.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 10:02:56 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom: pmic-gpio: Document pm8226 compatible
Date:   Tue, 23 Nov 2021 19:02:24 +0100
Message-Id: <20211123180224.2733-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123174127.2261-1-dominikkobinski314@gmail.com>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 8952b4cc1262..293f480ad0b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,pm8058-gpio
           - qcom,pm8150-gpio
           - qcom,pm8150b-gpio
+          - qcom,pm8226-gpio
           - qcom,pm8350-gpio
           - qcom,pm8350b-gpio
           - qcom,pm8350c-gpio
-- 
2.34.0

