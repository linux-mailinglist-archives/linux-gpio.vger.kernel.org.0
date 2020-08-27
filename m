Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D782A25470D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgH0Ogy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgH0ODq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:03:46 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EB6C0611E2;
        Thu, 27 Aug 2020 07:02:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so2672043pjx.5;
        Thu, 27 Aug 2020 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=X4apR4B//8lGTz4JOK1BB3c9HouQiXw6zDBOEnLp1G3RBtqM/1rNn25hbIvvyCyWEc
         SD8csXQRRS/pQlJfn/KAIElO13CKPLtqz83CDRkgOH03XUT9zyQ17e4SWCPbgoyb6scp
         3P58vJFjMOBjNxC01VwTD2SM7ExaTY/19NJa/6PTuGlgkzJGPwhtTzvR7y446Gya9iRN
         MKKoMVLKZIe360xl/jnataGlH7pkU6JLZW3sZsMX2kg4iJvYifmRvWjOJaySZIdEEyx5
         kkqdqIpEfPGhO5OeMNTgbmh5r+Jl37OrWnFBifWR1CdGkzawemaBw+BnaQBZmTAmVPa/
         Z53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL4xScgLpm6GZnT5ws/9FIwwZ74rEqIv1N27JN7upQo=;
        b=idcCGYmIT7wy2YBPc12oZbK9cRdUiKy0U0tSRY87voUfxZOF6uK/JWdSfc5G8kLqVy
         Hy6troDojkWyeG8Vo/bbhA3iAL7nfpqBNyl2m0VvdlegCBLCb2zHtMC7e8qkpW1RsnGe
         9ImW1vf0wH7lLxXqfUwzd2XgED08PFCx5v9KPOhjtLtNtAg7bB9UUZ9lkXyvPCHOYnBi
         +D0cppcWYsFENQEtXMd2ACFQcOQ4/ozLzyL6KG3VsdNOB1qTriMG39OlLAvl+a04Zu18
         LhCJHDsVBXbGRjqP/PUiQJapI/03pKv6iKvwJTmpOT0x2PczgYiarX+kC/bwxuPRHQdP
         r2+Q==
X-Gm-Message-State: AOAM530FnqKSSk6S9cf+jzj//nywob0JR5Z3CwUyf4OUhFvlnxhUu4bU
        xgwYfqtxrGnE42I3pYWDUj6rrqXVXKc=
X-Google-Smtp-Source: ABdhPJxycp3ZEidz+QyXimUL7Vj0YcVmXgcncrMbBCfAb4vsa8/B5X+dEmxWJJszYWemsh3DV3J+pw==
X-Received: by 2002:a17:90b:1b45:: with SMTP id nv5mr11154625pjb.35.1598536926957;
        Thu, 27 Aug 2020 07:02:06 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:02:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 06/20] gpiolib: add build option for CDEV v1 ABI
Date:   Thu, 27 Aug 2020 22:00:06 +0800
Message-Id: <20200827140020.159627-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a build option to allow the removal of the CDEV v1 ABI.

Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

This patch is before the v2 implementation, and is non-functional until
that patch, as some parts of that patch would be written slightly
differently if removing v1 was not considered.
Adding this patch after that would necessitate revisiting the v2 changes,
so this ordering results in two simpler patches.

 drivers/gpio/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8e409b9c33dc..0c62e35cf3a6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -82,6 +82,18 @@ config GPIO_CDEV
 
 	  If unsure, say Y.
 
+config GPIO_CDEV_V1
+	bool "Support GPIO ABI Version 1"
+	default y
+	depends on GPIO_CDEV
+	help
+	  Say Y here to support version 1 of the GPIO CDEV ABI.
+
+	  This ABI version is deprecated and will be removed in the future.
+	  Please use the latest ABI for new developments.
+
+	  If unsure, say Y.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
-- 
2.28.0

