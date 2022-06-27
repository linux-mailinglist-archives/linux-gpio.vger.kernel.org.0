Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26A455D3B3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbiF0Ixm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 04:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbiF0Ixl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 04:53:41 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D536350
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 01:53:38 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3578A3F177
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1656320016;
        bh=cVIA1rzk9lEClXQUVijI1mtxn42A8LDHnGLvrJ0uW4c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=UHHapKF9EmLJwnFOQQ6S7DziubF+fHVost1Z3bnf4im//rUfYsRNeuxZRX7LC56lT
         /v0x6FL8VKlqzPfdyecNqEmVH+9HaSGGJvbWpd7v/9aO8LqasF5Osr30297jbNyFVe
         vtv4bX3JIXBHoAjGiNgw2plyfeuJJ6zGgA+dduVXAZWmeFTxm9tNmFx4fOhr59U2kF
         uGg2fNHk2V4Iw6JdsOZeTbaV44HKepvVfCzjy9EvIk8SMnvDMuL/MSopnV+nIqJGN8
         foSKMaOs590mVFfyDwj+siHvBQRv1tDNDETty6UIo4yVNtsRe9jd7L8XKibL6jjwGM
         AVaFMs/6DiMkg==
Received: by mail-ej1-f70.google.com with SMTP id kz20-20020a17090777d400b007268efe3bccso729537ejc.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 01:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVIA1rzk9lEClXQUVijI1mtxn42A8LDHnGLvrJ0uW4c=;
        b=2XHHQ4h3zim97qPwG3z3t3qs4yMAlZviBtDj7rR7bJ5FNY4gagee12K3tlbHYEJhnl
         sjRdO5rk09XOU8ar4MPqCkxhwZEiPiLqGa4c8PUv8dDccsyQ8/Ba73EcGj9RHFhJPkRB
         6TTdUBaaTye8lLawkU2fTdUStrOhHjG2FcE7iqS+3schglsPrValOHlLDsB3IXiRERfb
         VjmjrZeNL4YhlV6pOSzjVzCoCDiqeJtwsDUzz1u5egVGrfxdeTs1qiqx/irCjFOmosCi
         ONz+eSdh2KVpChaAwi9XNni+txioTDmV3gyIM9uCYtjB/rYD7RDGnMdzM6QO2aFFjzLk
         jCjA==
X-Gm-Message-State: AJIora9XcGoSHWqMQ1/f5sYN90QixcH54pOsN+FMX9UctlnAByPF94QZ
        iNnGwqRNRTwVx079s7WQGV6aa+9JOWDp6eODkfk+jxMyqtZBDizUS7FukawOO4BHiBW2Fshr+fr
        RKZu6YKPXP552Q2Cp8TqzvxW2pwjhZnqlR+CmEqU=
X-Received: by 2002:a05:6402:1907:b0:435:c243:a66e with SMTP id e7-20020a056402190700b00435c243a66emr14848118edz.44.1656320015579;
        Mon, 27 Jun 2022 01:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sNHSVdtmZNUqbh6HEAFeSWdppkBk08VGF7GzfJ6T5jHtMcBxx0Ir+RtXruR6wV2wBKuoa6Rw==
X-Received: by 2002:a05:6402:1907:b0:435:c243:a66e with SMTP id e7-20020a056402190700b00435c243a66emr14848107edz.44.1656320015403;
        Mon, 27 Jun 2022 01:53:35 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id el3-20020a056402360300b0043585bb803fsm7049090edb.25.2022.06.27.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 01:53:34 -0700 (PDT)
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
To:     linux-gpio@vger.kernel.org
Cc:     Jianlong Huang <jianlong.huang@starfivetech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: starfive: Serialize adding groups and functions
Date:   Mon, 27 Jun 2022 10:53:33 +0200
Message-Id: <20220627085333.1774396-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jianlong Huang <jianlong.huang@starfivetech.com>

The pinctrl dt_node_to_map method may be called in parallel which leads
us to call pinconf_generic_add_group and pinconf_generic_add_function
in parallel. This is not supported though and leads to errors, so add a
mutex to serialize these calls.

Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/pinctrl/pinctrl-starfive.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
index 2a86c1035cc8..3eb40e230d98 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/pinctrl-starfive.c
@@ -207,6 +207,7 @@ struct starfive_pinctrl {
 	void __iomem *base;
 	void __iomem *padctl;
 	struct pinctrl_dev *pctl;
+	struct mutex mutex; /* serialize adding groups and functions */
 };
 
 static inline unsigned int starfive_pin_to_gpio(const struct starfive_pinctrl *sfp,
@@ -522,6 +523,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	nmaps = 0;
 	ngroups = 0;
+	mutex_lock(&sfp->mutex);
 	for_each_child_of_node(np, child) {
 		int npins;
 		int i;
@@ -615,12 +617,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
+	mutex_unlock(&sfp->mutex);
 	return 0;
 
 put_child:
 	of_node_put(child);
 free_map:
 	pinctrl_utils_free_map(pctldev, map, nmaps);
+	mutex_unlock(&sfp->mutex);
 	return ret;
 }
 
@@ -1267,6 +1271,7 @@ static int starfive_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sfp);
 	sfp->gc.parent = dev;
 	raw_spin_lock_init(&sfp->lock);
+	mutex_init(&sfp->mutex);
 
 	ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
 	if (ret)
-- 
2.36.1

