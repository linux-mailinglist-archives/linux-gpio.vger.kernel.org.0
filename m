Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D6E45FAE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2019 15:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfFNNzi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jun 2019 09:55:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36448 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfFNNzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jun 2019 09:55:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id q26so1820410lfc.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2019 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=toIQFVSDSnLPmWcb1vpYKt0Fmmr0QhOZJQ7tDGWKn10=;
        b=dbcaPYnsG7DSaVGAjqnZVFOubE/+oLiRQA3TD1xTOPRoLdu/xQ9FflaH9XFDATVzqG
         Rw3UqjQp9PA3U13wmws1ZbLQMPZJ6FpUGXHjo21mXdNLihamXYvC+ug+1cgpS/U/YBp3
         tV5rXzpeY9TSplBoHRHiUphK1F6MIauP4BxMM27QNnym2HSOF1quqPQMDAnyNb5v4cum
         UdMze1f747Io40j47fySFmcwsR4fq+AA816VO1WnYTCyPR9M6LmDS+A4LrzfYDRm6kaG
         fz8TOvVT8hasrnZ1oSLxGhKbwJUc+6CgHknyihYEycaB9aOmx14G60ZNAQ9Jcvw6kCnZ
         whqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=toIQFVSDSnLPmWcb1vpYKt0Fmmr0QhOZJQ7tDGWKn10=;
        b=PYg/URVINLKi64FaT0+A9Q8wSxZKOUNdobKPmVVP1/babFQV8bSTRGGMCE4oNs14PU
         i7wgVVN/GaeUJIs6fyKKEitEOhrFOBvAhCWLsF2o1ea+SUOda/1grOyGK4Mz2ZkJvNu3
         1HS447Q7yyjxdIadq7hHS0tYG1VU+rLsBXaJ9qA05CVadYQDO4DFW3U8UApSg1xAtNsG
         nH5xWGFKtg28l8Bjz96m3RtVIHXn4pBVLdHw3v4hEqsBjOpc2FyhockX+pOhCfkT2su0
         rNVlwyI7aOdp4FRGsSqKsICbyYnWdW3S7Wo+G2e5IQABSNbcexF1gGloe5d8fzAUTq/S
         8fBg==
X-Gm-Message-State: APjAAAU1wss7BUakkoCqXGQ2n9pTqu/SuKk4PCuyp97mMEsqiiB6+Bj1
        XaaGx0pmmKVghCPpak2AcNfRntFFp7dfAdmhgv1B0T427hs=
X-Google-Smtp-Source: APXvYqwY5yHG57AOGkWyQsJ/ugoc/WLcOg9xPOJPMyOflpF1UTc4MZgbPz7uaP+uIegIZXrV0NA5KdbVRXAQx3nhvLc=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr46988976lfh.92.1560520536900;
 Fri, 14 Jun 2019 06:55:36 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Jun 2019 15:55:25 +0200
Message-ID: <CACRpkdbKHsO_dgbqg3J0Xqrj7K2tp2nM9=1-BY-mB1oHpSdnsw@mail.gmail.com>
Subject: [GIT PULL] GPIO fix for the v5.2 cycle
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here is a single GPIO fix for the current development cycle.

Just some random snag in a certain GPIO driver.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.2-3

for you to fetch changes up to 3b00691cc46a4089368a008b30655a8343411715:

  gpio: pca953x: hack to fix 24 bit gpio expanders (2019-06-08 00:03:18 +0200)

----------------------------------------------------------------
A single fix for the PCA953x driver affecting some fringe
variants of the chip.

----------------------------------------------------------------
H. Nikolaus Schaller (1):
      gpio: pca953x: hack to fix 24 bit gpio expanders

 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
