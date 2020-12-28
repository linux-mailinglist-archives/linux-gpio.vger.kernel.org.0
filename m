Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946B42E3492
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 07:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgL1GsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 01:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgL1GsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 01:48:11 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140BEC061794;
        Sun, 27 Dec 2020 22:47:31 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id t16so10495103wra.3;
        Sun, 27 Dec 2020 22:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/UKmRzFqrXr3oBhWBs08I7ckptL5gCh5r4ECFD/wdmE=;
        b=gesGFLjMF1jc+zUjpW8efQN2E0o2in6H3jBs8+qWtu6Bsh7GYmPoWQ6cr/VdIK0Tvg
         HELFZFNYCJBR+lh8zbDwqdlMWRdlvaFB+2ZcQkOD3o82sop6RNKflDOSMPe1u46v6kn6
         y9/fV7yavtjMZDDSsrz+ivZIbKWXoLmeyDTBFExZzh0/gfn3Ss4V8ZnoT/v+NGv+gMtU
         9LhMQhH2k/PpPkszB+/oBKGBTK0JRz++Gpfb7yVbU33q2pMPSqjKrJJkUaLNZpHZsMN7
         HhPkh2RFNl3h6nBpzg5SpGFHe9/AbrFCmnpHfXFICPMFDKIjKK94VEkC1iSM7G+aT5Fs
         fgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/UKmRzFqrXr3oBhWBs08I7ckptL5gCh5r4ECFD/wdmE=;
        b=oJo3RLYFQ//uE+JdfTTCZdp2r0jr6B5sijzX4p9e59E4/tvTgGEaJFudpFsdrE+KRS
         pRX+N7nNLSZX6CqWIXYVgTuyxVB6w0JfdxpIx3azCB/Hj22j0qqUpnFMLXABxLBtp7jn
         oCKsHw3/nrk/T4OghmPZXwjN94drUgbwf6JMp1lZNtZjAtqvFFpTnuQpWWeBfOxsUnWG
         FWsPf9bXRqW7fWMZ4dC+9IXUovlqbSde03p0Hsqo/IXNXGI5E2znAiI5OzL3VzFi/0ZY
         KXpfvd6QvZ7Il07eN/6tar7tK81jw25PoAouT9EvRSgFyz8+D1eRWeCoUaqa1qq1Z3HH
         EE7w==
X-Gm-Message-State: AOAM533/3reQo+1TMZy89JXhbbENIvf0uR4zhYCOLZt67LmZFzgDydLO
        LtjBxVnew8HWkJ7Wp/NDAWU=
X-Google-Smtp-Source: ABdhPJwks9F5j8NQOuvz2ZNc477KFidIMN1/2amuv4aRqeDjuIhl1C5M/ksA+w3VCpU12hmjgAZV5w==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr48941609wrq.47.1609138049806;
        Sun, 27 Dec 2020 22:47:29 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id s3sm17107194wmc.44.2020.12.27.22.47.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Dec 2020 22:47:29 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, neil@brown.name, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: ralink: rt2880: fix '-Wmissing-prototypes' in init function
Date:   Mon, 28 Dec 2020 07:47:27 +0100
Message-Id: <20201228064727.30098-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel test robot reported the following warning:
'warning: no previous prototype for 'rt2880_pinmux_init''.
This function is the entry point for the platform driver and
it is private to this driver. Hence declare it 'static' which is
the correct thing to do fixing also this warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi Linus, 

Just a note to let you know that this patch is rebased on the top of this
series which are pending to be applied:
http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2020-December/149353.html

Thanks in advance for your time!

Best regards,
    Sergio Paracuellos

 drivers/pinctrl/ralink/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 983da62ff3be..1f8e8d5b71fd 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -361,7 +361,7 @@ static struct platform_driver rt2880_pinmux_driver = {
 	},
 };
 
-int __init rt2880_pinmux_init(void)
+static int __init rt2880_pinmux_init(void)
 {
 	return platform_driver_register(&rt2880_pinmux_driver);
 }
-- 
2.25.1

