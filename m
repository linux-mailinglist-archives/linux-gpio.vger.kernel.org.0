Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E46302C63
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 21:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbhAYUTK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 15:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732246AbhAYUSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 15:18:32 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146EBC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 12:17:52 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id b21so2869730pgk.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 12:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI4sl8G+4hFwvELQm/CMR4LlaPzRQZuYxBBvXs5wygE=;
        b=BQ6rcGfdZVHEJUr/KQIQ/MqcH0b8KiQ1ymPB6vzlee81sbwvqpyHbqds2FWK4RsWD7
         GKzkMrD+DUDfID5sgpshV5uye4PJvtB6HidhTWuXERAunFxSfZrD0pMvbcp2UBRN28Mz
         nJRL9/fslxMFeNggn31PlToT/WOZ69XPPXO/EzOD5GuUKkhuIzghcryLGY2LlDJpYx+P
         gkipByYKM682/kgf1ILqjYvpvYxJDnPTvKgca07AMce3TNb1MyvaXDFOUW0IsfD9cZQw
         7Q4okzLDpYIu+s29Ut8H/WdVu4GlcqDc8RSRDPUtKQG+fwRAKXUI9js+coPEwBwrIODJ
         vAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI4sl8G+4hFwvELQm/CMR4LlaPzRQZuYxBBvXs5wygE=;
        b=phjeohURMF7gwc/4l8pjIsYdhtmfFST+Tq2yt1peNxMpdBl0iRtUmkRqC29tF+d1KI
         WGySmPmS1cmBiEwDMSNzExVznysXWpj3axYbr9e8+y19U29gIy/U7raa34IbAdRxEzwf
         FEmp0QO2Q9oOPMJZO5ABADCj9d8kssCFsPRJotxuoAGZxiAkVfIRqtnm2MHd8euK41fq
         nD8tPBiNF2Y865/ECPLDVAyEMFcZ3d8m4FQFso4ncfvE7j19+8ocKTMe85/VpYEQGQHa
         7OvDjll2ursEoRVI7kS1SHB+J6DuFUyYqumb4sEc1yM26FBSqlXmpkMOrgHbMCVsL4pO
         Rluw==
X-Gm-Message-State: AOAM531C5+V2TMmFCCdQvXQUgkiTFmoeoGRDOj+H+v9cN0VUMeL1JYSu
        9EY2LU3vjKLPqA9CEDT9j1Fz9DhvM5VtZw==
X-Google-Smtp-Source: ABdhPJxtPOjUQ5wdM9VRPBSc184JdIsczXomVKGP5VFsTInAldN+UmFuyMfEr7Y7wTfX66DYTGNhfA==
X-Received: by 2002:a63:1f45:: with SMTP id q5mr2188519pgm.414.1611605871181;
        Mon, 25 Jan 2021 12:17:51 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:dd5e:ff29:33fe:cad2])
        by smtp.gmail.com with ESMTPSA id me5sm191141pjb.19.2021.01.25.12.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:17:50 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH] pinctrl: single: set function name when adding function
Date:   Mon, 25 Jan 2021 12:17:04 -0800
Message-Id: <20210125201703.48575-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pcs_add_function() fails to set the function name in struct pcs_function
when adding a new function.  As a result this line in pcs_set_mux():

        dev_dbg(pcs->dev, "enabling %s function%i\n",
                func->name, fselector);

prints "(null)" for the function:

pinctrl-single 44e10800.pinmux: enabling (null) function0
pinctrl-single 44e10800.pinmux: enabling (null) function1
pinctrl-single 44e10800.pinmux: enabling (null) function2
pinctrl-single 44e10800.pinmux: enabling (null) function3

With this fix, the output is now:

pinctrl-single 44e10800.pinmux: enabling pinmux-uart0-pins function0
pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function1
pinctrl-single 44e10800.pinmux: enabling pinmux-i2c0-pins function2
pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function3

Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Robert Nelson <robertcnelson@beagleboard.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 0271a13a535d..e7f3ddbbd515 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -790,6 +790,7 @@ static int pcs_add_function(struct pcs_device *pcs,
 
 	function->vals = vals;
 	function->nvals = nvals;
+	function->name = name;
 
 	pr_warn("DEBUG pcs_add_function(): name=%s nvals=%d pgnames[0]=%s npgnames=%d vals[0].val=0x%x vals[0].mask=0x%x vals[0].offset=0x%x", 
 		                   	   name,   nvals,   pgnames[0],   npgnames,   vals[0].val,     vals[0].mask,     vals[0].offset);
-- 
2.25.1

