Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BA72C9170
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 23:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgK3Wsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 17:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgK3Wsv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 17:48:51 -0500
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D32EC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 14:48:11 -0800 (PST)
Received: by mail-pf1-x449.google.com with SMTP id s201so9989210pfs.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 14:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=Q7I/gLM80QOUJ29h8NZUceaYOmEn3jh/fTr59l2Sd+U=;
        b=ONcvrS7NDPgCMLvdczj3/dCLgTHmDlXypEuvMQXDUy++qe6a0On86tehN/hShHrfLg
         1LCEwcm9QMis8tWSo1P3Na6/dtK2Ir4leUQXH72aUiPS4TKTQIjHo455+zaEBhNCR3yf
         C/EA2/14dsH1YdKT7U53GyvOFicFc8mWUGCQfmZ3UBv6/Tla8eEKOGEYozwDbIEAp4QV
         Bmv+Rrxv9oWo1kyryPk6NrmLptbcuk93gXAU5hZa38U7c4uCXKGUyHQB4a0di5sXZ6Wo
         8anndDxcPZgPXEuatVUZd2A9vmI+GoUS/ETjd33gooc4uLr73qZB7zc4ww2MAz/UIe3j
         nkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=Q7I/gLM80QOUJ29h8NZUceaYOmEn3jh/fTr59l2Sd+U=;
        b=cVtV08U93LN7mA02p6+9yQk9suFQhZwzAXKz5X3ud8pQ685/lZc+SwSlm9GjJQF7xG
         XgXsSnBZpJ6cZ21g0ES+5xxa0USVtVHxcLLMCZVbsVxQIzzgNd5fUbmuPHNFw/2YYRdH
         84EtAvqaqG8PG02B43cMLGqfxpV9AS6MNzj8DEMPoHAvFvYnNprXK4EDMFSRBTHw6gFu
         qLiQsCcvWOyfUrYNt6NofqxPKuaO818/EHZXDah4EcSXxch1BslAMJViUeb1AnaDbzt6
         T0ExhUPKbAl2jYgtvn4VSh8UF8RKf99ATqWFEBoJjodXdTqbQ1krbuVhkaUSzBcWTn2p
         E3Hg==
X-Gm-Message-State: AOAM533Iwa3RcPXv7kCuH07gRptPDyQrquLwm4eyA5qfyHpnQaI/cjRd
        0BX9/Iay1saskI8zp/luh1dYxkW7CvvljbpffyY=
X-Google-Smtp-Source: ABdhPJwTeJKVzaaMicXzyd7TBuEni9hNg1wu+vXCPIYYQOvV0bylLk0wu6TGhwSA/R8sdmiYphB1QK5F8yFL7Da3+/0=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a62:ce4c:0:b029:198:1f1:8743 with
 SMTP id y73-20020a62ce4c0000b029019801f18743mr21027885pfg.79.1606776490772;
 Mon, 30 Nov 2020 14:48:10 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:47:52 +0000
Message-Id: <20201130224753.1569357-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 0/1] gpiolib: Don't free if pin ranges are not defined
From:   Will McVicker <willmcvicker@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Edmond Chung <edmondchung@google.com>,
        Andrew Chant <achant@google.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fixes commit 2ab73c6d8323 ("gpio: Support GPIO controllers
without pin-ranges") where an imbalance of requests and frees to the
pinctrl driver were introduced.

Edmond Chung (1):
  gpiolib: Don't free if pin ranges are not defined

 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.29.2.454.gaff20da3a2-goog

