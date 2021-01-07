Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794CC2EC945
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 05:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbhAGEBU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 23:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbhAGEBU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 23:01:20 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B3AC0612F1;
        Wed,  6 Jan 2021 20:00:39 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id e2so2798987plt.12;
        Wed, 06 Jan 2021 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rV8vN//TYfz6ZIuGXF4C30ejEAQwTsAf8voldl2Zyg=;
        b=aIaU0o5hgRIKm046FdkdB6J82XYLvNeKQPhLDpIV2gTzyKRNQoJ67qJongtaMvORcl
         opkYRb50Pk2EeC+e/C7F3hzThNtiuI4czjOfDsj3/aODCZsoK3oMAUVohVrO+Bw693Wd
         03zTJ+cjdupz7s+uOhTMI2FVEZmWQeBeIxidpVsJLnZRCzMUA7vSaF9qtya2OmkKAixy
         IKiTWV3yPahr1D8U3P6Fov6S7rFpPHkYDUfhVNY0LOWXdF02hDe1tvn72OUzCIoxWs4/
         b7oxu3gpuJcRGDri7BegC9oAvigxRyriF+lLkObEKBirf/mvAfd5Rn16WuOxP8hpS9Gw
         YqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5rV8vN//TYfz6ZIuGXF4C30ejEAQwTsAf8voldl2Zyg=;
        b=brbF7wwolxCcR4DGuqzHEDnhc1JBVBrWOoAhdSHKAAduYrPHb/ET9Ys2oJxtxxvlUO
         EUeBHYhr7EFuEZuKO+O5zXCqz8BawMTagkBTxsdT4tTNIW1tIRjZWN+vJZ0VcK+pL5uk
         1t6e8uMGj3ctnBPaBbgjbtgERjDVIBs4Jq1vHIrpBfCiylUQf0N3nhYLHwn3hZS5GNsx
         4STUyj1tDmGQpv2bw5AFw5RhHqnR+9B7952v+iO/d6rSovWIdkkMXQ2q3KFebOs7SmoJ
         qd6hA3G0kcilti3bKVv67q7D1ngIAkAHWyc6S0iaaQR8wBTgtcfppsFPrLYLkf4blxIX
         lajQ==
X-Gm-Message-State: AOAM533RnUJqcHmA0dKcANUWpAJGAHpu+BEwEBhvqYyataTEt9PhL2y4
        hJrqm9hvQdf3KtahtGH0XtAJELtBfTBk0g==
X-Google-Smtp-Source: ABdhPJwd64KYSfx42xZMEb3zGwDKheLthtH8dQZw+Kw2aR7ZDodwVqkQG8Uwplkp9SNG8amq0xrj/Q==
X-Received: by 2002:a17:90a:cc0a:: with SMTP id b10mr7286415pju.59.1609992038876;
        Wed, 06 Jan 2021 20:00:38 -0800 (PST)
Received: from sol.lan (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id gk8sm3513551pjb.52.2021.01.06.20.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 20:00:38 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/2] tools: gpio: fix %llu warnings
Date:   Thu,  7 Jan 2021 12:00:18 +0800
Message-Id: <20210107040020.257671-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a couple of warnings that I ran across while testing selftest changes.

Sorry about the repetition in the checkin comments, but as the problem was
introduced to the two files separately it seemed more appropriate than
tying their history together.

Cheers,
Kent.

Kent Gibson (2):
  tools: gpio: fix %llu warning in gpio-event-mon.c
  tools: gpio: fix %llu warning in gpio-watch.c

 tools/gpio/gpio-event-mon.c | 4 ++--
 tools/gpio/gpio-watch.c     | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.30.0

