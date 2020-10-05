Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A663D283089
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 09:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgJEHDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 03:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHDu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 03:03:50 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFBBC0613CE;
        Mon,  5 Oct 2020 00:03:50 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x16so5416868pgj.3;
        Mon, 05 Oct 2020 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AvxnWGbtDBsncfh/smejBVTJpYJGtAnZQe2naUF7G3A=;
        b=noAI5OrHrr5N/VCGcgq77e4I9GxuzpUXbVcpjPN2TWvGANrfxc5mIor7M7+bqhucjT
         4JUZbFzPzafONtF3tpL5OXwEKVuemcSNfU6H1ZpbQTKsL/BROGArfa8vNEUBAA2EWEXv
         xmItgxyrEehXVspNW807Ky7Z7+mD/xuTTbzse9oDY0j9di42r/hcsILSnmHgiHmJfTxX
         chDHrvhjuGgwaVx9vdgHNxK4ASCf2mNAIiNqYJnPk6BzkEazJmN6gLe0l8msgMvGKDL7
         +MYVtU6rGXmnEC6UYlFlz5OYsIn7OZG7+O471THcmaLoEcZ534sVLFg/hvCUYrD5nAD3
         cWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AvxnWGbtDBsncfh/smejBVTJpYJGtAnZQe2naUF7G3A=;
        b=dLqaRwTzk1XAp0xnU6bI0K4XEtd6i3DRf/DfireMK4hefqoobe84ug0wfNb4w6XOUN
         kHbXd5+0QMn0JOKStCv15GoVAi4b+MFOQtvHymt8tmm0RkPC5cvFj0wr37adwHQPCyni
         4GiI82AAgJWl3kH+53O1d/SoMoZS5Eg0CX4JOhkaISni/UXJ5ds2+UYKYjfFBMf2jKSs
         qLt2lgxYmEIC3Ks7+JzjExLuBgnB1vGUcTmmox8leXOSxfe40sS17XrYHKEnQHM3WSXf
         j1wYOBZGJ1tGUtsnM5mTaXQSvN3WpEid5RF9x6IeJ9njAG9iEv9rpaFXFy6vTsB95wpD
         616g==
X-Gm-Message-State: AOAM531YcdSrZTTNGNPjTDlGdTCWsyFgWt9o8/zMU8WpHT+8TE6ojP2N
        nOm7ofk4AJ656VYSB9K7iutFqpl+lYz9xg==
X-Google-Smtp-Source: ABdhPJwKTGUTagXOAWQsWboZc7oWwQ4475MDlyAnbhsmNvSbcc3/myKwG+Or1RfbYq8e6uxOSxx8vQ==
X-Received: by 2002:aa7:8216:0:b029:142:2501:3968 with SMTP id k22-20020aa782160000b029014225013968mr9745808pfi.45.1601881429591;
        Mon, 05 Oct 2020 00:03:49 -0700 (PDT)
Received: from sol.lan (106-69-166-86.dyn.iinet.net.au. [106.69.166.86])
        by smtp.gmail.com with ESMTPSA id 78sm6868764pfz.211.2020.10.05.00.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:03:48 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/5] gpio: uapi: documentation improvements
Date:   Mon,  5 Oct 2020 15:03:24 +0800
Message-Id: <20201005070329.21055-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm intending to add some GPIO chardev documentation to
Documentation/admin-guide/gpio/chardev.rst (or perhaps
Documentation/userspace-api/??), but that is taking longer than I'd like,
so in the meantime here is a collection of minor documentation tidy-ups
and improvements to the kernel-doc that I've made along the way.
Hopefully nothing controversial - mainly formatting improvements,
and a couple of minor wording changes.

Cheers,
Kent.

Kent Gibson (5):
  gpio: uapi: fix kernel-doc warnings
  gpio: uapi: comment consistency
  gpio: uapi: kernel-doc formatting improvements
  gpio: uapi: remove whitespace
  gpio: uapi: clarify the meaning of 'empty' char arrays

 include/uapi/linux/gpio.h | 106 +++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 52 deletions(-)


base-commit: 237d96164f2c2b33d0d5094192eb743e9e1b04ad
-- 
2.28.0

