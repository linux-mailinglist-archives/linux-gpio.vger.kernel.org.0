Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9C9204036
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgFVT0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbgFVT0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:15 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8990BC061573;
        Mon, 22 Jun 2020 12:26:15 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y10so4790183eje.1;
        Mon, 22 Jun 2020 12:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gj2WcL+UfsP/vfAuxkjNvRlld/AvTW26Bzq7KWznkaA=;
        b=KREBE4CEUDwy07agZ8BAZBnD322lMhTfCBL3ADNaZCRbA+MPCy38oUONEEdNY5nSjg
         NP/f0WaFng526c7G1LtxnBH7HtClmo8PT0QZI/TNSDddacui3JXnOWQ+sNwFpVg0Glmx
         3eiN+YMhz4hzl1w+1GXKx6SFhD4vNScZnkzrnVG782OTXs83JKaYdYE56aTt7ElLr8c+
         OoYkj4jSl5so/kNmZzNXUvivB+FYvaO3khMK+UDw3ywU34FratQXN7VpeI1hKKz63afJ
         KUOYw8fgO7XLNgisRrZHlci0Aaw9NjWfXQuUXVdcjAqhCImNxSbKFL1fSGDghMzZZ/3c
         AdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gj2WcL+UfsP/vfAuxkjNvRlld/AvTW26Bzq7KWznkaA=;
        b=YeNKZMkg69Iei59mn4VpZ1MfS4xsoBAI/o2fzlCHwjQhYHSHhPtD4JDDhOY3hlevo4
         T9mk7Bz+6mNrXsbMjoxkZhmdSTNzstgE+sFMLIphHp0+5m9FeKwTVmV0kRk9ivlg/+Wy
         751wkV8J92mCLsBbH647DBAR5f+4XEkVNpARKbkudR+fYuZybhUhJdSngj1mu6WySbpF
         EyOgi+dRasVteA8iTAD2W80WO8emYvYj/zJwfA+E0VPlfUD6+bwPvhI9mzrvVlu/FKbW
         iHlRBr++wsrMTcp17LCgRAFiB2OeQcZ2k41qj7rFqUwNFx+SVT1sSHDlfJgwP8k6qOeo
         xdFg==
X-Gm-Message-State: AOAM531MdCSBdj6wcCQmvWWfqDaMzl3yqn/of+0shTxFCvebRtHaj/er
        +YDjIXRxQSBuK/6isOWU5Rc=
X-Google-Smtp-Source: ABdhPJwWoV5mZUWtcrPC2i1Aj1BKxZFMvk8oUbCiBQT4eMDtfh7kKyFOTAAFexX2DK4KBs/68mT13Q==
X-Received: by 2002:a17:906:66d0:: with SMTP id k16mr17597135ejp.293.1592853974299;
        Mon, 22 Jun 2020 12:26:14 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:13 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/7] Documentation: Document pm660(l) SPMI GPIOs compatible
Date:   Mon, 22 Jun 2020 21:25:52 +0200
Message-Id: <20200622192558.152828-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
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

