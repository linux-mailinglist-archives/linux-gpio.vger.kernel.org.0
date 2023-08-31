Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7757878F473
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Aug 2023 23:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbjHaVVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Aug 2023 17:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344470AbjHaVVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2023 17:21:30 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C191B2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 14:21:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50078e52537so2468531e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693516885; x=1694121685; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIAIOeDSTfKrgQJ80mI2Lc/XDfwXatItYiPi5mLUvyM=;
        b=QiXweRyX7OdTscrg+DhLQWm8CRkaKZ4bImDMM7QIxRty6iT0uZFxfB2q6ZDGqZ1cMZ
         UuJBFrO1cqBKixfSUaHuLcEB/mxBEkzFkjcVWD5gCVJ5voSj4ObetomFxbBSK3sz7j5a
         cTYPLYTsVJ75m0ClgtgVc7R5probFDIbMfH+QWrYFgQ0o4D1AJIqHcAAyCPaFgQPAluz
         i+8dx1iI7Qw9hwsXYpagXtdYNrCU8ojcpaT8M2SzVCggIgbNEz+0PGAHIu2XvezQZMaU
         ACaFkMPMA1DVo9dAebkPVXu+Bk/T1E/UvtZ86iTNzUD9w+FsKItpmBRgZDhXQ0RSotfG
         s3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693516885; x=1694121685;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIAIOeDSTfKrgQJ80mI2Lc/XDfwXatItYiPi5mLUvyM=;
        b=PtHaDcZuTSRriRp3IyuNaKEkhDEOZBTeAF0k0uDSJPoXn9p9yhMQ6NZXWX1uhQUY4y
         rt8luP4Qf5vU06l1YNYyjBqixqhL2qjpinjaZbljEaaZn8gibxozC5LAdVfIDIlI0n4u
         n+H++WBT8GODGD0mt0mBQOW+ar7K6mOgHGc+LB01X01DQbznAuvRUeW0dvg5pTNaFcy5
         woFJiaY1ovWEZYdh+jVB8cLwaPSKofmUJ2sL7ms0kApTz+i4bfmerFhwTuBVQ7fzgLO0
         tsq/OU4bhpiOJHQGuQixnDR+IrReqMxDeAq5444gFB9QOQ0ZO/SMkrXpbtY1EkLIIDpn
         Zrmg==
X-Gm-Message-State: AOJu0YyavX8CEHfUKeujpLa+5uK8YTrVHXMTNu2di5Fm74Bhwe6KENYn
        LO382wZrBEvPmOpOsEjPWTKxzg==
X-Google-Smtp-Source: AGHT+IHZ/+FHfwYZ003t1TK8QD7vvzYbMVTQHIA4Pne5qpANXX318f38VfVVKKwZO5gLj7omI1WbQQ==
X-Received: by 2002:a05:6512:318c:b0:500:85bc:4c6 with SMTP id i12-20020a056512318c00b0050085bc04c6mr418971lfe.48.1693516885321;
        Thu, 31 Aug 2023 14:21:25 -0700 (PDT)
Received: from [192.168.1.101] (abxh154.neoplus.adsl.tpnet.pl. [83.9.1.154])
        by smtp.gmail.com with ESMTPSA id eo4-20020a056512480400b004fbc0c7218bsm414866lfb.118.2023.08.31.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 14:21:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/4] MPM pin mappings
Date:   Thu, 31 Aug 2023 23:21:21 +0200
Message-Id: <20230809-topic-mpm_mappings-v2-0-4c2b4495e654@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEE8WQC/32NWw6CMBAAr2L22zVteeqX9zDElFJgE2ibLRIN4
 e5WDuDnTDKZDaJlshFupw3YrhTJuwTqfAIzajdYpC4xKKEyUYsrLj6QwTnMz1mHQG6ImMm+V3V
 RqjzXkMJWR4sta2fGlLrXNCUZ2Pb0Pk6PJvFIcfH8Ocar/Nm/j1WiwMLKquuqss1MfZ/IafYXz
 wM0+75/AeEnR4XKAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693516884; l=1091;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=l0jjoSHQuN4nPBpbTHITNbqTABTuyFGy+6UHYs+/Muk=;
 b=6xrGy24nLiTTnK1CvwRL0tTbTX0oK+frEWaV+rVojtS3gHfVzBry4DGJJu+n7VoY6HeDk2Aby
 EPvpip67Z9GBetTdBM92Kz/qxlj9p+0VT9Y9VcbI5N8ZQRGjEEVe4G0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds the MPM wakeirq mappings for some SoCs and fixes my
"big oops" within the 8998 driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Remove the improper 8998 fix
- In the same spirit, amend the 8996 and 6125 additions which were
  wrong in v1
- Link to v1: https://lore.kernel.org/r/20230809-topic-mpm_mappings-v1-0-5e17dd76b3c8@linaro.org

---
Konrad Dybcio (4):
      pinctrl: qcom: msm8996: Add MPM pin mappings
      pinctrl: qcom: sm6115: Add MPM pin mappings
      pinctrl: qcom: sm6125: Add MPM pin mappings
      pinctrl: qcom: sdm660: Add MPM pin mappings

 drivers/pinctrl/qcom/pinctrl-msm8996.c | 14 ++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sdm660.c  | 14 ++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm6115.c  | 12 ++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm6125.c  | 17 +++++++++++++++++
 4 files changed, 57 insertions(+)
---
base-commit: a47fc304d2b678db1a5d760a7d644dac9b067752
change-id: 20230809-topic-mpm_mappings-31ff2856244a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

