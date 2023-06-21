Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CAC737E73
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 11:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjFUIso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 04:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjFUIsm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 04:48:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878D41981
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 01:48:40 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so3593884f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687337319; x=1689929319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VTO5KQ0jsuHZMICEKiPbBncYg5RGSJGp9qRNOE0H9E=;
        b=XVeotGiBRywuxJWmqbFPdb5SlQwoAfyxoNI4zyrSAXoU5sqfrSPOPXPqOk3N+rceV1
         yprhQQIK4rUr5BoO+wOT2IrLoaJU2mOnEjuhDSZtw4qJwwKXf32cd3GZfGf+L+ipwxOK
         VKj18iOl05Q93xdsPon4utHEx5G282tkDBL6UzQsi6irPZ75mspXMwV57p8UCrSdaGgL
         FOMPf2EHveAQ+x8fDatLmhySArd9OkKhxfHvanqU6iJ8VYu/+urB4h1uWXyU8sdx/NpG
         stjiUcAOXNOWSLm0vDvxv1thxKuYk0PLcGnV3CR5tcIyXblgm+BqIEtOOSgbl4oWlXxF
         1cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337319; x=1689929319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VTO5KQ0jsuHZMICEKiPbBncYg5RGSJGp9qRNOE0H9E=;
        b=cc5kokqML4KJQMgq6Vc3Ux2/AJ8X1TWIz/BP/X+V4oBOfEO+GJBRV+sHSjL2mkqWRr
         Rm5OrViH9mwhJKhvQKFzODHHyo6Se1veccyGoKz+PSEM3SJgvCkG6P2DlOWj+7YrQS/E
         +QNgdecGKKpAitTpv+Gpt/o+mygYMdPyWLi2uHj/TxUhp2mRswE42+wwMsyw4CtMrTUg
         tuo6fsDxrrjxUraHuWYqMtPtQdE1SAUTpPHuHUpeDwMtN5MPMxqTv39IN1/FhDowkTuQ
         +rIqHsbK00nSBuSmWjzIIE4XK1U8k3HZ75LnnszlnVXKpKkUJASWalLo6SqeFmNP+Vhj
         oDNQ==
X-Gm-Message-State: AC+VfDygfenD1v6MWj/tvEu9SV8DtH/QhETM7y0r1eMmsmseTGJPlewW
        Nl9sJR4ORq2uM2EitEgwbWFgPsIW9ASo1rnh8wc=
X-Google-Smtp-Source: ACHHUZ4HPadCNmIHDsOA0hLknK/T8Xgr8IV/+xy44S8zzMoQsJncXS+IMjZsYE+sTnAgZ2MmOAbSxQ==
X-Received: by 2002:adf:ffce:0:b0:30f:b045:8b60 with SMTP id x14-20020adfffce000000b0030fb0458b60mr9766078wrs.69.1687337318876;
        Wed, 21 Jun 2023 01:48:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
        by smtp.gmail.com with ESMTPSA id f1-20020adfdb41000000b0030ae499da59sm3856476wrj.111.2023.06.21.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 01:48:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joe Slater <joe.slater@windriver.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] tools: tests: add short sleeps between generating edge events
Date:   Wed, 21 Jun 2023 10:48:34 +0200
Message-Id: <20230621084835.114473-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621084835.114473-1-brgl@bgdev.pl>
References: <20230621084835.114473-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Toggling the gpio-sim pull too fast can lead to losing events by gpiomon.
Add short sleeps between the calls to gpiosim_set_pull.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bats | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index cc28f1b..1311fc9 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2072,9 +2072,13 @@ request_release_line() {
 	dut_run_redirect gpiomon --num-events=4 --chip $sim0 4
 
 	gpiosim_set_pull sim0 4 pull-up
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-down
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-up
+	sleep 0.01
 	gpiosim_set_pull sim0 4 pull-down
+	sleep 0.01
 
 	dut_wait
 	status_is 0
-- 
2.39.2

