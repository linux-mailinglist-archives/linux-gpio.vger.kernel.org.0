Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632037D164A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Oct 2023 21:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjJTTdP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Oct 2023 15:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJTTdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2023 15:33:15 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374A7D5A
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 12:33:13 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7af52ee31so12789727b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2023 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697830392; x=1698435192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uu1gxoaiSCDvjHYC63VPHObtftPo1HMSxb99HwsWrrI=;
        b=VGCd9IIj+nJo2bk8RIXGnKPwvooRGY0cRpzmRiSKxXf5mwPPMaLrTASio8N7zCH7qe
         yubULmDBtUfMLCmWOPQNz7ufQ6r2KCj2mtTxTk1x6c/xINgfkYt+01tkD+bXL8qaqfSg
         qBPTaD1BBCSdnREjJGlQMAf9CyYy/z/NEUjLVYP2pbqneksw3n54N0slV5pgjacS9oKg
         rrTSsb8yKTEWMNiuwAG6sAUjoDZW0PKWGuM3BREnIBrCb+VgKHbX8wUt7sFdy9AU7H0e
         ixerhVc6Agg5QyvkcwiIRiz6SxkPScKghRC1MNy1VuFkGl/XgAJo/Du1DVwZZuo/wFG6
         +HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697830392; x=1698435192;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu1gxoaiSCDvjHYC63VPHObtftPo1HMSxb99HwsWrrI=;
        b=FXAPR0fNDXvbfe8rU+Z2hpXm10O9nJx/x4sG1eYbnjNyDM73KK7O/2hAE7ihJbAjqr
         BjRQBXieE8/t3AM7lqnaMMYovZkJklYYVGt04x+gwz/oVLEPHUE0L7pY3QsIbthH1tt/
         ++MrkpWkN2J9pcmpSI62+XfDtsx2SI0GyETkaILcjEpLUspAOj0+R2MEPQR/Bd0tTHHa
         04ktGokO+jckpovdWV2GPC5bHB8Cff4oDqcID6D2aSw5+STIZ801tTIZJcrG5rdqxwDK
         q0DnQKXfolQILFH5qbvwagrEG9FoQMeHB94LVD7sgyximHjnxEV/onbR+BiEn1Bodbjq
         yBPA==
X-Gm-Message-State: AOJu0Yzb8Uxwrz2MGZCL+tn1JUI612sG/+UuvGCD9IojImBlhHgeO7zo
        41DcJMNh14l1g0WVvNXaCs2jBHEONM/DT/f7b4bLqA==
X-Google-Smtp-Source: AGHT+IHT3/lwk69X8cQP65zd03w5o5bFQ2Mym3jaWPfkeIdeHwtHJSGTsNq5bSRrc7a7/MkHQjxqAQLyRaHrW61OfpI=
X-Received: by 2002:a0d:d608:0:b0:5a7:ba00:6dd8 with SMTP id
 y8-20020a0dd608000000b005a7ba006dd8mr3177033ywd.8.1697830392417; Fri, 20 Oct
 2023 12:33:12 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Oct 2023 21:33:01 +0200
Message-ID: <CACRpkdbYHwfAVWtMjbaAsm89KYJmM5KTCyn43+XkFu+iDCb1vw@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for v6.6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some late fixes for the v6.6 kernel, details in the signed
tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 58720809f52779dc0f08e53e54b014209d13eebb:

  Linux 6.6-rc6 (2023-10-15 13:34:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.6-3

for you to fetch changes up to 62140a1e4dec4594d5d1e1d353747bf2ef434e8b:

  Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
(2023-10-19 10:12:48 +0200)

----------------------------------------------------------------
Late pin control fixes for the v6.6 kernel cycle:

- Concurrent register updates in the Qualcomm LPASS pin
  controller gets a proper lock.

- We revert a mutex fix that was causing problems: contention
  on the mutex or something of the sort lead to probe
  reordering and MMC block devices start to register in
  a different order, which unsuspecting userspace is not
  ready to handle.

----------------------------------------------------------------
Andy Shevchenko (1):
      Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"

Krzysztof Kozlowski (1):
      pinctrl: qcom: lpass-lpi: fix concurrent register updates

 drivers/pinctrl/core.c                   | 16 +++++++---------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 17 +++++++++++------
 2 files changed, 18 insertions(+), 15 deletions(-)
