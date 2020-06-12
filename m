Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6236B1F7331
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 06:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgFLEvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 00:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgFLEvD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 00:51:03 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EC8C03E96F;
        Thu, 11 Jun 2020 21:51:03 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x207so3743245pfc.5;
        Thu, 11 Jun 2020 21:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RPSLD4Mi1c4R5cV1RmVgYtNhgloEt4Yjm6YXvT1kNec=;
        b=NSK56d2jRsy9yump8yO+/8N2yKXPS4SS43XGNH+mey3dQ8LUX+eLunbBSq30WSUTcB
         3Q8kOh4HJ4UM8ER6IK5m+i+rTmD6NawurDKX+SOA71L34e8a2z94QQ2/IEl2d9Xfh+Pn
         3yvy9/PBzh+0rJrA2EbbH+5UkUDjVW+D0TED675qFXf+WY1diqPzpg6zW8G/iAu3vkJB
         YaHynnrkcwpMuDKL8KogXosUfJUJUB2IOBR+lmQhT9h/xhg2wLBdrIeBXqO7FRzzhtL2
         OjEzEHsYHzXwRuK7qADAOeVvLJ+/bUjaOhIh4KriVFVgRJabGmu7mviqSVIr0CR8Vudi
         MijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RPSLD4Mi1c4R5cV1RmVgYtNhgloEt4Yjm6YXvT1kNec=;
        b=SfRAqfS5ANWzZG9ewgWYCQD5HBHpPzahoq4Rbv0AHE0akhm1CJB2mQayK0DEVI8xUa
         jEJw7OIFI5DOjndBryDUNtOW8oqwHjVVPrrn5G2IFtGdFcO/z0RpTOcffAzqt9/F1FN6
         15XT36V5MVTetRi0W0gvK+MMp7mHvV3pCvFAjsYhjjBjljqSbPOIiyu8eWzFZ8tiUru2
         qXpdjL0Q/9mo96XsdMUTRgCjKSQ3kJ2TF23UUQqa4Leko8lfzBElvq5Xn9V2+R+Cj5ZN
         X31FgqfMLUqal3Zb7+YCOx0AnesejEdjhniS0cWaTNQrcVLheXQQ6S8JUOT1KxJ9f0od
         3ErA==
X-Gm-Message-State: AOAM53322wMbZfvv/grDQIhEjpDU8ZnAWC5TlvoYV2c3HSVgOztGCS4d
        j9tfmJLWtDMuaUY/2V+SbR1WXjZBFbA=
X-Google-Smtp-Source: ABdhPJz9Mvt2iul+d4IJYhd6IPjQ8B7Z0auByjXNbQmg+bDHB7w9lBqf0B+jFi3OACnEwXib4mlrkQ==
X-Received: by 2002:a63:f502:: with SMTP id w2mr9335991pgh.321.1591937462765;
        Thu, 11 Jun 2020 21:51:02 -0700 (PDT)
Received: from sol.lan (220-235-122-244.dyn.iinet.net.au. [220.235.122.244])
        by smtp.gmail.com with ESMTPSA id b23sm3952216pgs.33.2020.06.11.21.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 21:51:01 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/2] gpiolib: cdev: fixes for split from gpiolib.c
Date:   Fri, 12 Jun 2020 12:50:32 +0800
Message-Id: <20200612045034.27425-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A couple of minor fixes for the recent split from gpiolib.c:
The first fixes a couple of W=1 build warnings by including the module's
own header.
The second fixes the file comment.  This was in v3 of the split patch,
but v2 got merged...

Kent Gibson (2):
  gpiolib: cdev: fix -Wmissing-prototypes warnings
  gpiolib: cdev: fix file comment

 drivers/gpio/gpiolib-cdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: f6d984418ffde19322fd149105200224ac2bc089
-- 
2.27.0

