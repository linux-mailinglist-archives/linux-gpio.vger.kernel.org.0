Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991A11F14FD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 11:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgFHJG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 05:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgFHJG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 05:06:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72A3C08C5C3
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 02:06:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id p5so16487703wrw.9
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hEAlVcSB3x50Ky0nMGuCiUX7cIf9lf5IbJZRm4/cSro=;
        b=l1Puw3aqdyx+QTkD8wNiZJwXtHOZNoswf/vR/lCtGvX05axmNgUIe4eYb/UFnHQ4jm
         bXvO4Nn1kV2mohg5vkluP8ONb4QO3ZhwT7Q4LVERCn0tgmVdzJbFZYHRuxbgPBVumcMc
         Ku0Na75co0gNN0c/Ng118GTlwjmq1bk6nc1LIRN1yyLLbeAQ6189aWihjtiMg3Pyr1A6
         wOBlwjfovzKVlHDsV7TyNpxaVz3xHvRQTEswvs/sSErNxGOqm3xAy9SJLaxbgU7/P6bs
         YDH4WnikgRpL7XAEkawhJXc75Gs8JhoBgXA4D37aYAoXM6SQWPN4UWz5gxpFNXLrrXD6
         4klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hEAlVcSB3x50Ky0nMGuCiUX7cIf9lf5IbJZRm4/cSro=;
        b=nUquY0tJIZHvd08LJWEqZKZ059NidG0KtRinNODq92jNwJNOfcYLeYGTm0NXIUykhs
         v0mUFmCWIsByj0/qXnKURXd75LFYDSwZ5b/+4Jygnn+592Qi/RlPvwJhJn09wQcl4uwP
         Kr7DFgWvUqg1lZNnZGXV9rbAPz5JgsF8viJYkxQ04Bim2l6gfby3epqG+hvzMvht1vf9
         qhEItYRNJg+dJwf+j3VpP/lV91wVVJj86B6xDCqmhJB8B4UwNzIwoRYuoGtxUQdHbdfx
         mlP0oNaUacOSNxlOj4Qzz04/t3PsNGMhh1l/BR1j5B/gjrcwk1eGk+ceudkg8ConM5Rz
         XcLA==
X-Gm-Message-State: AOAM532+ZSzz9XWSQ8AS7fTujzarD8W3CMr2YDwUWjwyeFUJ0Z5rZjF3
        l2rdkLDjuEJZOXLJorJexdNFCrSHcyw=
X-Google-Smtp-Source: ABdhPJySjYHLBD9pzAn9I/9EKhB7lT+qnduuFqL9K/Siq560ZwLteevFtdupvu9rb6MvTFCwBFEMNw==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr21120315wrw.4.1591607215124;
        Mon, 08 Jun 2020 02:06:55 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000f89b400cc883edd44ec4519.ipv6.abo.wanadoo.fr. [2a01:cb00:f89:b400:cc88:3edd:44ec:4519])
        by smtp.gmail.com with ESMTPSA id f9sm15378727wrf.74.2020.06.08.02.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:06:54 -0700 (PDT)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-gpio@vger.kernel.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [libgpiod][PATCH 0/3] Add Android build support
Date:   Mon,  8 Jun 2020 11:06:49 +0200
Message-Id: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series adds support to build libgpiod library and tools as part of
an Android build.

Some comments are included into the individual patches, to explain the
choices made.

This was tested inside an Android 10 AOSP tree.

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (3):
  core: add missing header inclusion
  tools-common: fix build for Android
  Android.bp: initial addition

 Android.bp           | 95 ++++++++++++++++++++++++++++++++++++++++++++
 lib/core.c           |  1 +
 tools/tools-common.c | 10 +++--
 3 files changed, 103 insertions(+), 3 deletions(-)
 create mode 100644 Android.bp

-- 
2.26.2

