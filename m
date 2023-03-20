Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AB76C1594
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 15:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjCTOwb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 10:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjCTOwD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 10:52:03 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B6C2BF05
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 07:50:30 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id c10so2094222qtj.10
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679323825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGYxOnCO4fdyW1zjZ7kMdbvesDIV9vyeIW/AoUlrSts=;
        b=cWOWNvNmSdmHRFE3JPHVuKP5Gqlae6U6S+iKITGifoRfOmFfWu0f/rT4IY2sYO8sCR
         t572AteucfzHtwDVc2V3gTOk+3QPUTELoSsnas+dZ/Epyq0h8AP5Ec3wzKtkcC/ANlvs
         R2eXsmPunaXJsHwujjX+ge/JL5qxwhAlqW4vxVfKhEzFkPE7dGr9k/uAYCWXyENpRgvF
         /7c03m9PTvVx0FQ2EinxKGnlDaBTYEmfrSpo7BHvS/mRtIwaSygI4SzrBJ/mT2cBmPk+
         yaG4KV8NiPMzlrD9U5hhTq8PpzoCl/lvf2H7JU4NqYOU30K0u+/vPLaWkiBkOrGNm7L2
         jrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGYxOnCO4fdyW1zjZ7kMdbvesDIV9vyeIW/AoUlrSts=;
        b=mhmUdiR6hq2JysgAusy5+CYSAiiGJFTlgtZnQfY0RXW0TBiEzf/UIuEKG7PHF8Rnqq
         If7nGj1qOsBtYaOyybJ/W4JRX03lzJ9MRvx6ccsQt4revdBLG7iuUf0C4vPQgImESMsl
         bhblTynVPTkatOBhuqmnt59LhaBr66KpqsV0jt3HM15GEoG6ubXbQ2pJI7WA/ju+GPFP
         +RAY+R9zsVjhLCPRveKVaTFRftxrqYjhe1HyiI17ZPOP1QXD3PtX8bhQSi+H/82EVCoQ
         Hyetnaatu3ZBdvEkeOy2CdZ8Azyfb/OW889oE62lf1s/FE4qK0m8gb//rdBQJ/qoGxU5
         tQVw==
X-Gm-Message-State: AO0yUKX4cXJA2/eZnAT0NBHK9N+cIRzpQAlATecUie33mGs5PF8+wbqH
        09b0EuvWu53wUr7sJo+ZHlMhdw==
X-Google-Smtp-Source: AK7set/2mTIX51TKnPXVeGwvJ/bQkdewluPRoJMLffadcsDHr16GM/eouraXhTDrbqWDz/6Of0d75w==
X-Received: by 2002:a05:622a:d3:b0:3e1:6c7e:2ee0 with SMTP id p19-20020a05622a00d300b003e16c7e2ee0mr5869615qtw.11.1679323825452;
        Mon, 20 Mar 2023 07:50:25 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id o14-20020ac872ce000000b003e03178112dsm2661003qtp.13.2023.03.20.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 07:50:25 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v3 0/2] Drop map from handle_mask_sync() parameters
Date:   Mon, 20 Mar 2023 10:50:14 -0400
Message-Id: <cover.1679323449.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v3:
 - Inline dio48gpio->map usage in dio48e_handle_mask_sync() to avoid
   redefining map parameter

Remove the map parameter from the struct regmap_irq_chip callback
handle_mask_sync() because it can be passed via the irq_drv_data
parameter instead. The gpio-104-dio-48e driver is the only consumer of
this callback and is thus updated accordingly.

A couple pending patchsets also utilize handle_mask_sync() [0][1], so
it'll be useful to merge the changes in this series first to avoid
subsequent noise adjusting the dependent drivers.

[0] https://lore.kernel.org/r/cover.1677515341.git.william.gray@linaro.org/
[1] https://lore.kernel.org/r/cover.1678106722.git.william.gray@linaro.org/

William Breathitt Gray (2):
  gpio: 104-dio-48e: Implement struct dio48e_gpio
  regmap-irq: Drop map from handle_mask_sync() parameters

 drivers/base/regmap/regmap-irq.c |  5 ++---
 drivers/gpio/gpio-104-dio-48e.c  | 37 +++++++++++++++++++++-----------
 include/linux/regmap.h           |  3 +--
 3 files changed, 28 insertions(+), 17 deletions(-)


base-commit: 03810031c91dfe448cd116ee987d5dc4139006f4
-- 
2.39.2

