Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA003D90CF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbhG1Omk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:42:40 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42786
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235500AbhG1Omk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 10:42:40 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D2A963F24F
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627483357;
        bh=I1PKEMwXuF82cGlAevCPYveDll1B9ZxnvL7Av9RVEa0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=fDOoCA/wwBv4aFg4tVD6a3qPMsSS6HzGJtyzw+AB9TKVvIa9o6U4vpUBokH7gFC88
         N3hSgIbDCxZ5mi+CgK7xoZ2YJ6e03LUaPe11fyvg6yZ3FoDvb/ajKAFMEVxARVWZCs
         1IYv3faYMlKs8eSYvdKf4GtiJY3zp+6JQgc4lrUpAr972fcS4nkzxAV+2XQ4/yJEi2
         sUqFf9L0kpNCw8o4aU6lweActDtHG96N0fH4MQuzOFvIPOJ6hy7YhO41qbbuadHRf+
         0s7Lf96lvu5XgnCPxNL+nex0uuZ5IrP04y+mAOSp+uKmtWUOB/E4h3sFv9vKdE80pH
         AVCibPpJLJJsg==
Received: by mail-ed1-f72.google.com with SMTP id b88-20020a509f610000b02903ab1f22e1dcso1342213edf.23
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 07:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I1PKEMwXuF82cGlAevCPYveDll1B9ZxnvL7Av9RVEa0=;
        b=Pdc0fYSiJ0UaG1NF3zDP4VUJacTO9LigqkoIl1hS4fbYaB41JwiGnoB5G9WvCynp+5
         v/dw4tXkziXBlOCvhQg08bSrsPMkxjtLaooFNRhXAo2yIFY0sfFPrpB0ZYfha+TskzJJ
         5JxcBMrYlazTcsb/3widy81xJEvrh42FLbX6tkjaba6cicKdVeYRtk1z50CHYboVSFuU
         yjURRK25VH7KqwocZa7RIOetS/4MEcyHCsaUU5wwl3A2iIDSz4ObbkA9hCGOzxAyEv00
         366BVQ/+XRfM7m8Qq2NV5l1m/cTPWZWHj98eNH/pCZhHfjedynNhsrcqyniY/PSTEmnZ
         MiNQ==
X-Gm-Message-State: AOAM532z0jniGMMbQzlNgkMM9Ue0ucUeriKNCiBDsfPJ7wjhb9OrqQgI
        mls6W2DL8/glhZ1LFoVH0i3g+guth3uZaiShN0aUX6jxrQqSiBdEo/PFdbAXj1WNltJOgKw0YdM
        36syzxPyea11HSvrF+DkxjKumbLNKFcCBVCCHgnI=
X-Received: by 2002:aa7:c597:: with SMTP id g23mr186028edq.340.1627483357633;
        Wed, 28 Jul 2021 07:42:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlzVaR6Q3zwsFWtnXgHfb0bnEN67CBw95glR9J9AzgAsrKT/4ZsPZqnlvood7OLi4vWzsLSg==
X-Received: by 2002:aa7:c597:: with SMTP id g23mr186015edq.340.1627483357490;
        Wed, 28 Jul 2021 07:42:37 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id d19sm2683676eds.54.2021.07.28.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:42:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 0/3] of/gpiolib: minor constifying
Date:   Wed, 28 Jul 2021 16:42:26 +0200
Message-Id: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Minor constifying of pointer to device_node.  Patches depend on each
other (in order of submission).

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  of: unify of_count_phandle_with_args() arguments with !CONFIG_OF
  gpiolib: constify passed device_node pointer
  gpiolib: of: constify few local device_node variables

 drivers/gpio/gpiolib-devres.c |  2 +-
 drivers/gpio/gpiolib-of.c     | 16 ++++++++--------
 include/linux/gpio/consumer.h |  8 ++++----
 include/linux/of.h            |  2 +-
 include/linux/of_gpio.h       | 15 ++++++++-------
 5 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.27.0

