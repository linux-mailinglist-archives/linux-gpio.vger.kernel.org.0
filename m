Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD7C7B1EC3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 15:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbjI1Nnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 09:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjI1Nnh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 09:43:37 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C19136
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 06:43:36 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690f2719ab2so2961913b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695908615; x=1696513415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqK7quKf/l4fe/ENZJcx8mmpiJDqOuGJS4qvF9KMko0=;
        b=CrDrmH8hoOBek3PEgSCThupT8jgeFSBoFV1mNIReU3nIUN6+tmccq9iGHfduEP4lqx
         mO83vLvi3C9ho5kEeUR+MHeR4omWNdrLzVnuM9SBCvicaLA4XHJb8zSqmMpjE2yEDban
         jEd2y0hcflX7geTbag4q8lfW3JZGIHkmSwGhbGRENDYLT54f9b0Vtkw6Gr7ll05RayZX
         sUkH3BCXdEbGzeHuX2cb5qFitRx1eNjyD+Y8bCh1hCOZkK+9P1J8IDDo2cLyO0/6iVcP
         PkxaZI8OhuePf8KL7DULisq3cuBnMJhT6LF+VHRGUORMgtwj8mW4frFs4oZTcso8D8wT
         kudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695908615; x=1696513415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqK7quKf/l4fe/ENZJcx8mmpiJDqOuGJS4qvF9KMko0=;
        b=lkcCU2XrPDF57xKwTIgN49+JsDEKkwJLHC1sgJitHqf9CSLS3dKi860mLs/w8b7C5c
         xPrbCop8LhsbVSzyJL8fHDc/e6Kl5cGE0OASY0ltoQcYKdhTjUz02Zm57ye/16zOlOZw
         I+hbOHYQaBuRniV5q6erMolB8598betkFq77nUDohUuNqqUA+ucniEgCW6T6bs2Qv3+Q
         0BgDc7Jsy2PHSFvNSO5br2XltcnyR2ShhdxGSZcUqLBcD9d31K4Kq/A37PthjNqupGR1
         oE3nxnrRCo1J8Mvftnjoxvm/TyxRiZTUL9j6ymrad+pWycUSuh2fvjrftaSAs8PgU1WV
         f4hg==
X-Gm-Message-State: AOJu0Yy4SmGweMjSYbwngdRrUHo9qrO3B9u3lySY+yk8038mjWPJAgAi
        /52Lopeda0wyy0ABjUUgVqs=
X-Google-Smtp-Source: AGHT+IFyJhiCAvoxZbmNhB+cS1yAZmZUF3Y4N3KffEBmJMbm92Npl4JQWyLU3rhdtVglAwvp57lEMQ==
X-Received: by 2002:a05:6a20:8403:b0:15c:b7bb:2bd9 with SMTP id c3-20020a056a20840300b0015cb7bb2bd9mr1263673pzd.6.1695908615352;
        Thu, 28 Sep 2023 06:43:35 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:386c:ba81:a385:9374])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b001bde6fa0a39sm14964387plh.167.2023.09.28.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 06:43:34 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     aisheng.dong@nxp.com, ping.bai@nxp.com, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] pinctrl: mxs: Remove undocumented 'fsl,mxs-gpio' property
Date:   Thu, 28 Sep 2023 10:43:21 -0300
Message-Id: <20230928134321.438547-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The 'fsl,mxs-gpio' property is not documented in gpio-mxs.yaml, but
the imx23 and imx28 dtsi describe the gpios as:

compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";

This gives schema warnings like:

imx28-cfa10037.dtb: pinctrl@80018000: gpio@0:compatible: ['fsl,imx28-gpio', 'fsl,mxs-gpio'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#

"fsl,mxs-gpio" is only used inside pinctrl-mxs, but can be removed if
the compatible check is done against fsl,imx23-gpio and fsl,imx28-gpio.

Introduce is_mxs_gpio() and remove the need for "fsl,mxs-gpio".

Tested on a imx28-evk.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index cf3f4d2e0c16..e77311f26262 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -395,6 +395,12 @@ static int mxs_pinctrl_parse_group(struct platform_device *pdev,
 	return 0;
 }
 
+static bool is_mxs_gpio(struct device_node *child)
+{
+	return of_device_is_compatible(child, "fsl,imx23-gpio") ||
+	       of_device_is_compatible(child, "fsl,imx28-gpio");
+}
+
 static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 				struct mxs_pinctrl_data *d)
 {
@@ -402,7 +408,6 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
 	struct mxs_function *f;
-	const char *gpio_compat = "fsl,mxs-gpio";
 	const char *fn, *fnull = "";
 	int i = 0, idxf = 0, idxg = 0;
 	int ret;
@@ -417,7 +422,7 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	/* Count total functions and groups */
 	fn = fnull;
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat))
+		if (is_mxs_gpio(child))
 			continue;
 		soc->ngroups++;
 		/* Skip pure pinconf node */
@@ -446,7 +451,7 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	fn = fnull;
 	f = &soc->functions[idxf];
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat))
+		if (is_mxs_gpio(child))
 			continue;
 		if (of_property_read_u32(child, "reg", &val))
 			continue;
@@ -486,7 +491,7 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	idxf = 0;
 	fn = fnull;
 	for_each_child_of_node(np, child) {
-		if (of_device_is_compatible(child, gpio_compat))
+		if (is_mxs_gpio(child))
 			continue;
 		if (of_property_read_u32(child, "reg", &val)) {
 			ret = mxs_pinctrl_parse_group(pdev, child,
-- 
2.34.1

