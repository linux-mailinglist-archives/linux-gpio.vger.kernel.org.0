Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6458D2570EA
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 00:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgH3Wnw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 18:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgH3Wne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 18:43:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B91C061239;
        Sun, 30 Aug 2020 15:43:33 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so4597634ljc.3;
        Sun, 30 Aug 2020 15:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n1KgmKzf9ZQjO5d8PcXFoM5eqQdcOF5HadjFNB7yUQw=;
        b=e5OUNGlDjVPabuTDOWq49DimXDtA3AxZrDVXbQosQ5z7l1BcK29CvGUmxa0m7TFXxa
         NXNGNlG1QDoAyQvH6mNmCXk38CDlV5Op3Bu30YbU1feIPqu5RjT+hXF9CDc0kXce4zh8
         aOz+W4zGnx2HzCFRd3avfJXvzbNOJHToiH+TG6ri/izyaKgLYmUuht6cdRZoTBxX+yRR
         uUN/ViZGUU+ZgaceyOAFbDKQguWTO9n7Rlu54HUUmxA66pKw5+1X+LczunQ6ZfdQrwvF
         m0b7ecP2pS1ReDeb7p+eiLLX9rbNtuHOwWUBt1gAnzEpvRwhOh40Nba4lP9NUC2ED2ld
         ZIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n1KgmKzf9ZQjO5d8PcXFoM5eqQdcOF5HadjFNB7yUQw=;
        b=NIJxW+wwsuXwJl073c3D+P2emPVsL48QoQIWsjEaT1FIVR+hmc67X5ZLs56Sa1ohDG
         X00zwn7ISbu9eqY41/yDl0Aw4iKwaq4jHGPkt4yLIC01g3LzZ6J1GJ3bz4bns17wq07n
         NW/mn26f3TuVuVnv3YIPOYhsHBn6KRH+o1nAxSJE+QrSNx3Vh/F66tULUvqGZV3rMy9l
         C56u9fRPu7Ts4nx0LvhAGYnwjVCo7v7zyvvHNWg+ejnIVsOfQZljGNU42M+M9zvyp3g/
         wDTSzksfCFY52HeeXlUOWm1Y2qdF382sHAb/qRIyjIMS51eTJWY3toAk+pwvrsytjNr0
         ZA0w==
X-Gm-Message-State: AOAM531vl15X7MvAu2GZ75t3euAh7vXyyVoZqnp6meT6kSihI6ZFPaM+
        d5LFSlamJ6YBof/S0LnDUt3Csf529HymHA==
X-Google-Smtp-Source: ABdhPJz/0qGsKjG+lINiuxRXF0yRJvzQCyCDdgrTfwKEoeLf7VD7PfyRp76crHFJI6ta8/JGf2CIqA==
X-Received: by 2002:a2e:8098:: with SMTP id i24mr4116451ljg.50.1598827408288;
        Sun, 30 Aug 2020 15:43:28 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id m25sm1190072ljg.79.2020.08.30.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 15:43:27 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/3] pinctrl/actions: Constify static variables
Date:   Mon, 31 Aug 2020 00:43:08 +0200
Message-Id: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Constify a couple of static variables which are not modified to allow
the compiler to put them in read-only memory. Patch 1/3 is probably
the most important one since those structs contain function pointer.
The patches are independent, and can be applied in any order. 
Compile-tested only.

Rikard Falkeborn (3):
  pinctrl: actions: pinctrl-owl: Constify owl_pinctrl_ops and
    owl_pinmux_ops
  pinctrl: actions: pinctrl-s700: Constify s700_padinfo[]
  pinctrl: actions: pinctrl-s900: Constify s900_padinfo[]

 drivers/pinctrl/actions/pinctrl-owl.c  | 4 ++--
 drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
 drivers/pinctrl/actions/pinctrl-s900.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.28.0

