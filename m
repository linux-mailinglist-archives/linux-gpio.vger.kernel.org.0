Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBFB4D144E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 11:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345609AbiCHKLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 05:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiCHKLB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 05:11:01 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A335B22505
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 02:10:05 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id o8so16018700pgf.9
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 02:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNIVKpvm0s6LUmPZub3N1Ezg2lYCnjZhWgfroeSjFzY=;
        b=GW16XTWJxnJ3xJoYKWf2LL1zStyTxkVf0OSEZ22LTyDCb2dMqecV85IUwfEk/m0M9h
         LtLQkTaKSH3UP/vSgLNNEN5rwMTsf/1CXYjr3nMi+/Sq/zUm/wHJfgvLMntaw8JA242B
         s2PRMi02fpuOlEDiJu6hgSKAsxWE8pjbkjbxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNIVKpvm0s6LUmPZub3N1Ezg2lYCnjZhWgfroeSjFzY=;
        b=45CROBo9/2AIIEv6nsAWvXLE00mVFZZkMXXtRG0h4jxfzzGL62+usD8A2va33EH1bN
         LWNFYBeVOu2IPDcA84WSi9G1yED1MpDa3DNoDfa6YivPYdaNGhWn0F5hCUl3sJK3iTD+
         Z3iFBGawikKLBzrvPP3RBqWwBTo6Xo1485kogQw272dM4Q7tyfzFi2AmWfzMxAKisPKZ
         BN6I+0lJidb6i2KzHfGgj7p22O1S9GyIDXKUE2TuoYIdnYyfV+phtlrTc0pEawlHWM1b
         G8rlxDPu8VBuVNM9ofaupnvX6vSuqHMvxpMFOSdrK6DMBRpRxjgNXfeS2Zf8gv6r9H+g
         a/lQ==
X-Gm-Message-State: AOAM532svMa0KdA9a80ZMH5WKDwHuewqY+1U2ZTq+WZapVyw3ZsY68yn
        BmpV6PhiEMWjo8I0GcOJtc0OFg==
X-Google-Smtp-Source: ABdhPJztEHkxcH5xrdq032U7xg9J5hZyVp6igs1Tla6Wh1z2kfGqBekJR2Bc0KZMr/7ucD/i6KiSew==
X-Received: by 2002:a05:6a00:1bcb:b0:4f7:1b5c:479 with SMTP id o11-20020a056a001bcb00b004f71b5c0479mr5961549pfw.5.1646734205085;
        Tue, 08 Mar 2022 02:10:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
        by smtp.gmail.com with ESMTPSA id k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 02:10:04 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/11] pinctrl: mediatek: Fixes and minor improvements
Date:   Tue,  8 Mar 2022 18:09:45 +0800
Message-Id: <20220308100956.2750295-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi everyone,

Here are some fixes and minor improvements to generic pinconf and the
Mediatek Paris pinctrl driver.

Changes since v1:
- Correct PIN_CONFIG_BIAS_* read back for all cases
- Add patch 7 that reworks switch/case logic to make the code in
  mtk_pinconf_{get,set} cleaner
- Handle case where PIN_CONFIG_DRIVE_STRENGTH_UA is not given and the
  advanced mode needs to be disabled
- Also make the vendor specific MTK_PIN_CONFIG_DRV_ADV config override
  PIN_CONFIG_DRIVE_STRENGTH_UA (or lack of) if the former is present.

Patch 1 makes the generic pinconf library print out arguments for
PIN_CONFIG_BIAS_PULL_* in debugfs.

Patch 2 fixes bogus readback of PIN_CONFIG_BIAS_DISABLE being always
present.

Patch 3 fixes the type of the "argument" argument in mtk_pinconf_get().
This was erroneously typed as an enum when it should have been u32.

Patch 4 fixes the pingroup config state readback to actually do
readback.

Patch 5 drops an extra newline in the pinconf debugfs output.

Patch 6 cleans up the debugfs output, skipping the custom hardware state
output on the virtual GPIOs, which have no corresponding hardware.

Patch 7 inverts the switch/case logic in mtk_pinconf_{get,set}() so the
code has a default error code, breaks out on error, and has the indentation
reduced.

Patch 8 adds support for PIN_CONFIG_DRIVE_STRENGTH_UA (drive-strength-uA)
to the Mediatek Paris pinctrl library. The goal is to replace the vendor
specific "mtk,drive-strength-adv" property with the generic one.

Patches 9 through 11 are from Angelo [1], rebased onto next-20220308.

Later on we might want to deprecate "mtk,drive-strength-adv".

Please have a look.


Regards
ChenYu

[1] https://lore.kernel.org/linux-gpio/20220103101855.17350-1-angelogioacchino.delregno@collabora.com/

AngeloGioacchino Del Regno (3):
  pinctrl: mediatek: pinctrl-moore: Simplify with dev_err_probe()
  pinctrl: mediatek: pinctrl-paris: Simplify with dev_err_probe()
  pinctrl: mediatek: pinctrl-mtk-common: Simplify with dev_err_probe()

Chen-Yu Tsai (8):
  pinctrl: pinconf-generic: Print arguments for bias-pull-*
  pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_* readback
  pinctrl: mediatek: paris: Fix "argument" argument type for
    mtk_pinconf_get()
  pinctrl: mediatek: paris: Fix pingroup pin config state readback
  pinctrl: mediatek: paris: Drop extra newline in
    mtk_pctrl_show_one_pin()
  pinctrl: mediatek: paris: Skip custom extra pin config dump for
    virtual GPIOs
  pinctrl: mediatek: paris: Rework mtk_pinconf_{get,set} switch/case
    logic
  pinctrl: mediatek: paris: Support generic PIN_CONFIG_DRIVE_STRENGTH_UA

 drivers/pinctrl/mediatek/pinctrl-moore.c      |  25 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  25 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 290 +++++++++++-------
 drivers/pinctrl/pinconf-generic.c             |   6 +-
 4 files changed, 200 insertions(+), 146 deletions(-)

-- 
2.35.1.616.g0bdcbb4464-goog

