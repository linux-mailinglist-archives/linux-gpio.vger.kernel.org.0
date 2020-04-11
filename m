Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76EA51A52FF
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2020 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDKREF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Apr 2020 13:04:05 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40913 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgDKREE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Apr 2020 13:04:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id s8so5609971wrt.7;
        Sat, 11 Apr 2020 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IOsMm1GoNxNPYYmUzD6jyXB9lWe+DZS5AsZXr/XfoUc=;
        b=Yily2VDjSsMda9iki03gFoCEaOVqcW+S746+ti6agF+KG13Utd3IY5W3YTK/aLJKEc
         79QFNOFfc+aMVMREmQ8KYlkzCsrPVhId0Myk0Id0b/oGg4RycTaAzxdP0bY60MtwvvEt
         naIVlKYlbHFIpjNmUhY5vZB3bsIGKGBBw0A4LlvmhZFWj0wg3D/rEtgTEte4pd8huIH7
         HqNhzI7qBf8F1sV/TuRsGefjKIf3k18Hzkg8EJ1s78ydC/syNA32PDUTE03R4ts38sgM
         VPukKz6XJvhay4pW1tHjGMqnRBlKTNelSBnjdntnqb2RrnRlQyJLCWemvapW/oqPg86K
         oIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IOsMm1GoNxNPYYmUzD6jyXB9lWe+DZS5AsZXr/XfoUc=;
        b=ZYWpp+P9Z+3QpK33iDSxRFkoTtf0UvU2W+wEfgYgR8ndDmLoQlpwXtXKMiPE0XIIo2
         nfYBCCUTYd0KiiV3TWnff0Mhh0t+rfwgl5F92pRb/zp0pWNOpzhvwkbCxmG3tyhFXN8F
         eWOzT+d5mb4z6VVP07TnCDdE/eXaXARcuS5UL2X6mly+Aqgcc+Hp72oSSkgnWzTwdHXj
         /cK+pFw08J5DyaPXnDW7mmxrSVCT9cE9hjb0YEuplinG9yq6VZuZBr5ZrmwVd5lYlCVq
         uQEmocWw9qQFQ/9Kt5FeF/Ce7WkX/L/SH7doUvJF+xz03evPinUQtmkr//lWQggnxWF7
         Z0tA==
X-Gm-Message-State: AGi0PuYAiZ1v6X2KnM3klje4fLGKo3KL0vDaqJjuZRVfWYWc83FaUqCr
        V2EbUYO5gs2b4/0r72OkMhc=
X-Google-Smtp-Source: APiQypIMueKGRpDHbSjx55N7jiNFBXeZ09WkesAqa0IiAUoyQbK4pwSfYGNHPwWisyKHBoW7d61usw==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr7091115wrn.379.1586624642970;
        Sat, 11 Apr 2020 10:04:02 -0700 (PDT)
Received: from localhost.localdomain (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de. [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id x18sm7105067wmi.29.2020.04.11.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 10:04:02 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 0/2] pinctrl-meson: two small improvements
Date:   Sat, 11 Apr 2020 19:03:54 +0200
Message-Id: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While playing with audio output on Meson8b I found out that the
vendor kernel uses a custom version of the GPIO_PULL_UP flag. I
suspect that we will need this for audio support on Meson8b and/or
Meson8m2 but I don't see it hurt other platforms.

Also while comparing the register bits with the GPIO direction (of
GPIOs exported to sysfs) I sometimes had a mismatch. This also wires
up gpio_chip.get_direction to have sysfs and the actual registers in
sync.


Martin Blumenstingl (2):
  pinctrl: meson: implement the gpio_chip get_direction callback
  pinctrl: meson: wire up the gpio_chip's set_config callback

 drivers/pinctrl/meson/pinctrl-meson.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.26.0

