Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146692C6778
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 15:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgK0OI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 09:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgK0OI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 09:08:59 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4708C0613D1;
        Fri, 27 Nov 2020 06:08:58 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h21so6638311wmb.2;
        Fri, 27 Nov 2020 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GhG55MQHgqw8eiTwjvqStLw5a3ohAB5jEbTPCiqfZCw=;
        b=EoQ8BvsxruUJyTimV6AVWytBEIYLkmCkD/RLU9C7USblg8sdjx7ZDhoXSJXLWQBsvc
         t3bG7gdzawEcl1YVL1PTnzCnbrhT3icurrx7JxAbSAezFbBUk7NaWclX7JUHHbazhneR
         iNsJebsGBNfjzIqdlLEK2tQPuXOFsHZ5PPE8+//iDKGHEMk1gJVaD6vuPajTts3k9GVH
         zAixYavwZZxThsJQ3EUT1q2Vl2ksMR/iTxl8nA2k6F80L0oNKzQEMZfqi1LuEzbl4iLt
         iBM15G44F5cJZ89qw1b1oQ2BVJmMfIyhJiQtbiL2lWAop/taDUW8ynmwMQ9/j1jVrFAd
         cJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GhG55MQHgqw8eiTwjvqStLw5a3ohAB5jEbTPCiqfZCw=;
        b=oxhzERbtbjIy1ggat0ZavsDGlbTce4tuI/Ie0Q4+SBV4NxPrnv7D1oQ7zgwjq7y4vq
         DsDLuQCXpPO8w+Yo4gXqSs2BK/RdUScTXjqZkTjVHuXcIEVDbHTl+lmQBV3NFut2jExR
         Yy2zo5YjNmS7/8dAM7mfCINzOjCs/hDQJjR8ZgjDjoufnTbrJMN9hGn/KDT31c1FImnr
         GvOQT8RcFdP2UgQFKSMZygatGUzQ2NiexJwwA+1xNkdb7FefqzJe1FiOOleUuIWkK72n
         FQxQSahO66LrTq/2O5kVUPD1rz90DyI8fiuUtp4gYaQnDzyhTv4djrSLYr8lHHniklIe
         Ap4w==
X-Gm-Message-State: AOAM532mwtzrVmO7nRUcMXHp7IkJXkzAVXRxxQDtAduls1ArXlSLngyB
        nStoUicgIww6m16DbmE70Ko=
X-Google-Smtp-Source: ABdhPJzFgj6t1hMJviAZcoTHhibL2AztyJjOHzqzcdI1IqcBoj8WsGac8IGEhK3y/xGA44cFSqFaaQ==
X-Received: by 2002:a1c:a507:: with SMTP id o7mr8202524wme.164.1606486137652;
        Fri, 27 Nov 2020 06:08:57 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n123sm8065073wmn.7.2020.11.27.06.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:08:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 0/2] gpio: tegra: Convert to gpio_irq_chip
Date:   Fri, 27 Nov 2020 15:08:50 +0100
Message-Id: <20201127140852.123192-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Linus, Bartosz,

This set of patches is in preparation for making use of the IRQ
hierarchical domains on pre-Tegra186 and bring the support up to par
with Tegra186 and later.

The plan is to get this into v5.11 and then add the missing PMC pieces
that allow wake events in v5.12. In order to prepare for this, I've
included a DT include patch that allows tegra-gpio.h to be included at
the same time as tegra186-gpio.h from the PMC driver. If you don't want
to pick that up, I can take that through the Tegra tree for v5.12 along
with the PMC driver changes.

Thierry

Thierry Reding (2):
  dt-bindings: gpio: Use Tegra186-specific include guard
  gpio: tegra: Convert to gpio_irq_chip

 drivers/gpio/gpio-tegra.c                | 218 +++++++++++++++--------
 include/dt-bindings/gpio/tegra186-gpio.h |   4 +-
 2 files changed, 148 insertions(+), 74 deletions(-)

-- 
2.29.2

