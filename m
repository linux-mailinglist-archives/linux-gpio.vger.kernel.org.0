Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92656CA4D6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbjC0MyC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjC0Mxe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1425D35AE
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so5227872wms.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=165NgY7uZe0xEaE1msAHdv1OQit9UrOek6qTFAsHcZc=;
        b=ZzRhmBOYjHFtV/HSqmkL0kLriR8hVJjfbzzieDzQnAxxR0UBhTgzNsSNgRXNtq7wHy
         kZ1UlETe+FZzTaD/9lIyOGTVHf3dAh7ZohhWVUKFlXhOUmMrxeHk99/GawJ/hu/vwlcd
         30+7bwW8hJjfs3a5GvkG7bDNETN/tGPlj7JNYWD4/vz4ePRb5tzQBvj3ZqNEJsf48zOc
         GxdKZk2I6tVYwvDDqKA1eOi4qRPHjCzTNP84/CvnbOCCUp96lGH6KvsD0YzQmhEATOrQ
         DqDMTlFCF7Id0cg/+prUJZdrlWUVva4ibYi9tLTssSS/xDvLgwpUO1SHpdtcNfp6ObaU
         XrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=165NgY7uZe0xEaE1msAHdv1OQit9UrOek6qTFAsHcZc=;
        b=Rze8/LMiATOvkTlTS8ssoyWaOfmu0kXpIDgZHkmdzcLGRQ99RraJInm5F25WjTW2sT
         R/fSUpdmLsNjTywWAGr2qyBxRL1ghOAWpANNNB9NXV6grpkF0WXSkqrga01euauVHuzl
         is8XUNYmxWlcitSHfHQrMWTElSVmdpGW0ltmu6SHSxy8/abZgHkBYinc25as8xhqAuYi
         BECXgIq247/R/BJeTmXrivKjfzTQC1cEVHLod8ipiMfmPY7d5BLaOOigM6Wl38Jr+zHj
         eBsOtfXIdQvB8rCi+EGbYB7e5Uvgmi8p8s1SNmnASbFrPmFbKP7B08vhyJDbJ1DjX/ya
         jZ4A==
X-Gm-Message-State: AAQBX9dyTUDzBphAbkte/K8gl5fzfi5/g0zPM3OEhbZt5KKNBlTAWuRN
        pjIf2sKoccIU3AJBwg8zkuhzdg==
X-Google-Smtp-Source: AKy350a5nFj/1tHgpxf8bwwMIZnECj2+1/tv1akuL5h+GSbziDVluF+PF1nfJKdEh1vXUrCcc4gGqA==
X-Received: by 2002:a7b:c009:0:b0:3ef:62c6:9930 with SMTP id c9-20020a7bc009000000b003ef62c69930mr5765235wmb.3.1679921611697;
        Mon, 27 Mar 2023 05:53:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 13/18] pinctrl: qcom: spmi-gpio: add support for pmm8654au-gpio
Date:   Mon, 27 Mar 2023 14:53:11 +0200
Message-Id: <20230327125316.210812-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add support for the GPIO controller present on the pmm8654au PMIC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index ea3485344f06..0d94175b34f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1238,6 +1238,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
 	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
 	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
-- 
2.37.2

