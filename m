Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704493AAB32
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhFQFse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhFQFs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:48:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4C4C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ei4so3119896pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsJhWYmZBDgj/tFiSi4wj9WE1h/l2+Md9lyjAfn8iR8=;
        b=wOOS4VAbMd2nYdoJCV7egK2DDp1ZSn2v/Mh602YP5TNj1U98qN22pMvHXCHEVEA1Qt
         FbyLCP/dCif4jQFWf3+IQ80pEwNx1KWoyuxvxDN4xBTRxVAK5KPkQrUMidoUvPsLrV2Y
         n5CnoG9OS5jzBKxDG0is7darEbEt6H5odeZdifnyx4BiSpS0sml8er8yu8ZxY/q/DdEV
         KWSXIp+GlJhrNVUPzExysq+4SJxfPgyMraAN80OoymMQy0T+SmOmp/Ly0UDSIBixYa2V
         tpqC94gmiLEU+4HZiv3obFyR7lGPQb3aBysr9T8Su+88O1hF9nBP8mEv6qUsnh4augaT
         GDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsJhWYmZBDgj/tFiSi4wj9WE1h/l2+Md9lyjAfn8iR8=;
        b=gzePNRVsX4J2vKLBQ2R/5iVZ/a20gIEgYORNd7DAh7E7IOLxHUUvP4lmxM99z+yyvC
         S//rOuqkfEZAe/g0fTHjQM4TSJNyUSrZeLl9ymv3pKDigNPKoUqhc0v1lDLYQvWm1BMo
         RSn5vpMj2xKBwzCz7a+kg0i0cai6J7h1pZ71Jp2s2kItvp27wCZ1gECmceO6WtVNkfgb
         KYtvOY/fztYItA+P6k+iaIrHorr7BL/XeGs8kIy1EUcQlFJHecCzj3oBiKWcRDmURd2H
         TVpdkItQo2QMiF183mgNsHgumG4mCI/oe66qXt0qVtol0orEyv7mPQI/JuL8K8cxx1S4
         +JNA==
X-Gm-Message-State: AOAM533/U0NHOZleGwMhg4WZim7hun88SxIIGJSLbnOGH0kJZEA8rQxH
        b3OvI+tMnBAhqgKkid6jOGKYHA==
X-Google-Smtp-Source: ABdhPJwFGa8BwqCx26oWn0H764ybHhUWQQnQydJTCyAex86fJTVXNqRgghY+dzqJ0C8cV4n8umQWMg==
X-Received: by 2002:a17:90a:d483:: with SMTP id s3mr14661286pju.61.1623908780546;
        Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id y27sm3882700pff.202.2021.06.16.22.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:46:20 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Add compatible for sm8150-mtp board
Date:   Thu, 17 Jun 2021 11:15:44 +0530
Message-Id: <20210617054548.353293-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
References: <20210617054548.353293-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sm8150-mtp board is based on Qualcomm Snapdragon sm8150
SoC.

Add support for the same in dt-bindings.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9b27e991bddc..d7bb90e5082c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sm8150
         sm8250
         sm8350
 
@@ -198,6 +199,11 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - qcom,sm8150-mtp
+          - const: qcom,sm8150
+
       - items:
           - enum:
               - qcom,qrb5165-rb5
-- 
2.31.1

