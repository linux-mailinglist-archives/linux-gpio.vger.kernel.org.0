Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB8C45EA0F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 10:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345902AbhKZJRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 04:17:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359744AbhKZJPO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 04:15:14 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0198C061372
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:11 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso7620604pjb.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nzlIrRw5KEmdejFl5iafweINOu/oGRNG9pBzAZgUP3M=;
        b=p4yP+kXxdFbm83YzRbrwcSTOsJSkpudn6XXnjPe8CGIHN1Lm+WN6Rdee4/Sp5WFjQu
         ChXvj/EPq767Bei6Ly6rpO59ry0UtSNUHpYzqLTESAK5mQN+NIbPi8TWx0wvyKrcKjbq
         khr8LEwXPn6MyWU8FX2IHEUF1MND9VHNK92UHVyGPtH3RocaPkLQhNQ1chtnnPT1A9ZA
         XhSlyFlf6I8z3ch8RF7wr3J8nJw+kPx+1GNCL7xq4/AqyLJRAHOY2cTErwfUh2XxO2sW
         2lpWFQfQCqIrx4n5cXEhhnwdeSXqLHdDab9WCRlvEmNfOD9d2BqEVkbG9QxN6V9RDCkf
         kHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nzlIrRw5KEmdejFl5iafweINOu/oGRNG9pBzAZgUP3M=;
        b=DpjmJw7lFJ/TJHiBcYm7z7S1wP51ccSgsCBNBL2YkPXkNx6IaGhfn05NYlIfFKG50o
         xvcZ4jg3f5XZruTMqSLC3N+YeMMgvjoAmljxRG7ZO0aRrreQG7UIqwgjsrrnwNmdG1TD
         vvTURV3L2w06Z5vu2oPFz2HoMRLeN6snqKINr8n8ijcZ87/nqzwcSBIgsCu1PvlR94jR
         sS3QVv8GkOT3Eyj+AXvKrAJUdaog8RcThCkc92lPq/99IUr7T1rBzsd33bP4EXGwntrG
         DJ5I80Dh9bz2BfEdW8qWuxjYCdO1XYw54f1LaOcoKv5XBr9QAciguXPsvxMn44LbfhOv
         ZvUw==
X-Gm-Message-State: AOAM5314bbzaP5fdkFtxIlFcWjGcMtK3pdR2DeKveJoJCHlnn6yhnBqg
        fMgpReWrP3iKl/Cun4K8+8bJbg==
X-Google-Smtp-Source: ABdhPJxPYLV4MCcQGhREqnqgYV5zfm1+vN985fOgCQIl0Osw7+cljO/5rKqNfyj1REE2AvvybyfHvQ==
X-Received: by 2002:a17:90b:1057:: with SMTP id gq23mr14065733pjb.203.1637917631131;
        Fri, 26 Nov 2021 01:07:11 -0800 (PST)
Received: from localhost ([122.172.196.175])
        by smtp.gmail.com with ESMTPSA id v15sm6635589pfu.195.2021.11.26.01.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 01:07:10 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/2] libgpiod: Minor fixups for 2.0 bindings
Date:   Fri, 26 Nov 2021 14:37:03 +0530
Message-Id: <cover.1637917008.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

This patchset contain minor fixes for the libgpiod 2.0 helpers that I found
during my rust bindings work with it.

It is based on next/post-libgpiod-2.0 branch.

--
Viresh

Viresh Kumar (2):
  libgpiod: Fix ioctl number for gpiod_line_request_reconfigure_lines()
  libgpiod: Remove dummy declaration gpiod_line_config_get_event_clock()

 include/gpiod.h    | 12 ------------
 lib/line-request.c |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)

-- 
2.31.1.272.g89b43f80a514

