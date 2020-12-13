Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE1A2D8EA3
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389237AbgLMQSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbgLMQSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:05 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4032DC0613CF;
        Sun, 13 Dec 2020 08:17:25 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id e25so13042779wme.0;
        Sun, 13 Dec 2020 08:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmjKdO+JEpT1IqCZS5DtE4FSFs2mvQW8g5a7Dp6tEjk=;
        b=IxPbfQKxUyhWWjWPfr179EFDY0r+LSab9s12y35Z85P9SQiZmygiHbZ9c7D13MiBNF
         0rOMzuPZbg8RLwb03mF2fNFChQzWS21iCB/cXvGpSOc7YkO0aef8cUWBhhNfsJL7wM9x
         PwZwm6HmYPvo9mfj7S7W4tdDd/JpT61IpfxvKFF7OL9Bd7B4rlnPSYHh/p8lsw8w91hL
         wBmRgm3rJAZgZCj2FC1SPSFBH2Owr474D3biHgFr/0JMlXbZyAm8EXys21T7FNusjs94
         WwDPV1ZQOqn5gYz3rmZhnx6701eoVuxrds8/067XaNm1r+ZXW9qbhAPw01V/6/2JPt5M
         KtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dmjKdO+JEpT1IqCZS5DtE4FSFs2mvQW8g5a7Dp6tEjk=;
        b=F0vxdAJLy0N4B+P9aM3464yIK/WwCcVdHBuz5De+M4vkEWf7e8Y1frwlKkXNQldyCH
         L3Fj27nv6ndQh00xe/VsAFgGZUkqtDBRvYTu1v56bmfpYkSWJM7A+mfqeAr+9zf+puhK
         IIRBY93FQDIZIfvky5YtC13BxdgVFuQp7vKeGgWm2ea9wXRwKX5oOcnU9G+ZBpeOxrLc
         jQy9QYT67yrNqa/MIdKuQ6wMcoupiW62pYTwqoUdMiHdCG1VIl+mj/NC2enCeVZHJ4zR
         UlwKLzkWWTeWlMskjGB83O3NJHZBMo8+AHoXrt3LHQwhs1Otv0xXqyL277P9Bdixsb80
         krPw==
X-Gm-Message-State: AOAM533V1akfrfVbc3yyqAsKqQLVpYZe0ULIGFzmzWl5nQdof0FdKEtb
        /N8yZnZNdyvuJxMDp37o5N/64W7ck1s=
X-Google-Smtp-Source: ABdhPJz5o+Q66aJWk460uLI3HwRYoGxECEUuhnH+7NlpQFQfP/nUe8tczjt9EpUFQTxM9EuxYAKlYQ==
X-Received: by 2002:a1c:5406:: with SMTP id i6mr23593347wmb.137.1607876244038;
        Sun, 13 Dec 2020 08:17:24 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:23 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 0/8] pinctrl: ralink: rt2880: Some minimal clean ups
Date:   Sun, 13 Dec 2020 17:17:13 +0100
Message-Id: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After this driver was moved from staging into pinctrl subsytems
some reviews for bindigns and driver itself comes from Ron Herring
and Dan Carpenter. Get rid of all the comments to properly be in
a good shape before merge window.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (8):
  dt-bindings: pinctrl: rt2880: properly redo bindings
  pinctrl: ralink: rt2880: avoid double pointer to simplify code
  pinctrl: ralink: rt2880: return proper error code
  pinctrl: ralink: rt2880: add missing NULL check
  pinctrl: ralink: rt2880: delete not needed error message
  pinctrl: ralink: rt2880: preserve error codes
  pinctrl: ralink: rt2880: use 'PTR_ERR_OR_ZERO'
  staging: mt7621-dts: properly name pinctrl related nodes

 .../pinctrl/ralink,rt2880-pinmux.yaml         | 62 +++++++++----------
 drivers/pinctrl/ralink/pinctrl-rt2880.c       | 45 +++++++-------
 drivers/staging/mt7621-dts/mt7621.dtsi        | 46 +++++++-------
 3 files changed, 73 insertions(+), 80 deletions(-)

-- 
2.25.1

