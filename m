Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D1F60730A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 10:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJUI4J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 04:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiJUI4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:56:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40589158193
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:56:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id q9so5651414ejd.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NYrwhi16X5/3SFMiHALA32aV8nqAFGSfduJWXT+ZmfA=;
        b=TDhVMfud9VAZwnS8X4AWhWj5ZCfkWDcnpssLqNHsRBKjs+EihqzYt4oXeCewoH/0jQ
         8BtEziI7BM9Y94IGBpt85J3YTJiKmmNg6tPK4/AGMa0IVHZFyDlmuIwVJqdqN7CtUeKL
         TAF12XEXXThtODAl55aVvlgSzjY1YXBch67ySji7ypPMRxfgQPjNklsUFNb21YP3XNPf
         NcmnHKM837GTgiN+9ZR4a30vJOuzoxd0qmX1pFgsuYJCShRRy7ksGK9eKmY7P2sk3pee
         1HuND87Gr7EQC/IITCl7GXsBMeyn08XUfGPFg7oa/ASyt9RUxvvXGvH1B0WBvHdPVD+G
         5Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYrwhi16X5/3SFMiHALA32aV8nqAFGSfduJWXT+ZmfA=;
        b=2ezlCbH0ffSU6evgyPXzRYOZHZX7KgrFCRmxk4VoEYLZ/uC8gHBw8T84yVBFjfo4KD
         i9BAILiJIvKuKxedaD6ukhyQT9QMUGj+tmdmIyTjqxmDRCeltGMMK248MXJeZz0jhMZW
         JPhgylXCrxdAfYSsyA0eMYajVf05Cb5KlLfe8wqXlm8T13HuuIJ+2ZA5g6S6T4i+0h/t
         n+bbxWILmkMfKqTCOGshDwEOiOGCda6G3TRdnpEb2HaieAGPX5qzNDpRPw9V78vE9Exn
         ePWgQq5Yf4BUcLDC53773rqRP2z+KdmpxnsftUifFRw4n7Y1sBNYCpG4DJV4mlNp9wAG
         HnpQ==
X-Gm-Message-State: ACrzQf3OGIvrNVpWRXplQH44dPQB3o2YdkMUJSP0wfq0yKq57Xi1aYCF
        jUnHhVpS3qXaDPAcF/G4QzGUCHjzRfQ/94FJMehlytrDKUlg6g==
X-Google-Smtp-Source: AMsMyM4yxyDYDupkHsdCM3pgOrn8sEVec9iYraBTwkj5aNBc2Uw8egkLYxTPGpqJ2vMQVoB/AkxugQf/lFbyPKYRh4Q=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr14780288ejc.203.1666342563338; Fri, 21
 Oct 2022 01:56:03 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 10:55:52 +0200
Message-ID: <CACRpkdbqRy5pXiy2r5CBiBXd8j7VbXKq40pmx_eXtFMynyAMug@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v6.1 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some first pin control fixes for the v6.1 series.
I try to be quicker to get fixes upstream now.

Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.1-2

for you to fetch changes up to 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

----------------------------------------------------------------
Some pin control fixes for v6.1:

- Fix typos in UART1 and MMC in the Ingenic driver.

- A really well researched glitch bug fix to the Qualcomm driver
  that was tracked down and fixed by Dough Anderson from
  Chromium. Hats off for this one!

- Revert two patches on the Xilinx ZynqMP driver: this needs a
  proper solution making use of firmware version information to
  adapt to different firmware releases.

- Fix interrupt triggers in the Ocelot driver.

----------------------------------------------------------------
