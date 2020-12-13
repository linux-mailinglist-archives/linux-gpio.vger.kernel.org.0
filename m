Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A522B2D8EA8
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404349AbgLMQSS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391144AbgLMQSK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:18:10 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71DBC061794;
        Sun, 13 Dec 2020 08:17:29 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id g25so7607646wmh.1;
        Sun, 13 Dec 2020 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=14/39lqjLWy5D8ojS/4hZl9Olsf4TSz2SKrvUayrnRw=;
        b=AY6LlAAKxuWWJVitg9V9x8itqgp5ue823Dr3j6+y6801cBoiqE8xXbiyTxem2M/6RD
         6HPqa90EPqElJfBkOzuPA6HRrohRfxBDSiQ3zN3R9bnsOmIK+3jex3R1L0iop9U/9MwJ
         m4L3iokWQfvkLkEmrqEU6n5Lr6e/WZMXAqoR9Q1Zxi1eoMlbV3woSiNKw0M7awpkvseS
         PCE/MJAIoMkbmAlTawzBzbCaeVmIOmBg+AwWvAYCnPF+1evIntGxOvQZuvrfNOpTXMZR
         I5MlZjA7gMKAs0IwCC1UFJtYKWJEHyrdioENnzQXY09Vj7jodjJU08jmUYzdizO53UxH
         DodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=14/39lqjLWy5D8ojS/4hZl9Olsf4TSz2SKrvUayrnRw=;
        b=WqPczBOM83glvieua2a7/geSwNYaKWLcv6ughoTXY9pzutVV79IFVpuN0xKAhOQ0MX
         MZ5BVjaHZ6Jr5DUGXCS5sVt/bbOD01O3rH2fNmGDGWO4n7qsp/n4df7NgEsycyXqmRXd
         Y4BMCZATHDPn6eOK8g9uhuVnXfEqbO97bY9TH9AgXP8Gns4UuFvPZmEGhD07woI634me
         JU47eBKfD2107cojN0EM8x4TxStW3449iAShCBXc2+QKyYw50pQwK3emuF2ch1T3dtuJ
         hd72f5tLpRE+SxftYoa++zfzqHBDMoP6wsBO902obneN6E6+jtLEm9204xsm5OJPxsMV
         B/NA==
X-Gm-Message-State: AOAM530XhMjeRIyPxxMi6YmrlJVAMrg4bOhFGOwRNP/2juBoB70TcgN/
        5nYMr1N0p6mU3VhIiZInU9c=
X-Google-Smtp-Source: ABdhPJw7+qwxllgPeP+/Eke6WG9i5PxiacrgprRiq8iwFKUKEM60eIukF4H8XeXddBHTPQGc/okAEQ==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr22712332wma.105.1607876248657;
        Sun, 13 Dec 2020 08:17:28 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 64sm27102073wmd.12.2020.12.13.08.17.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Dec 2020 08:17:28 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 4/8] pinctrl: ralink: rt2880: add missing NULL check
Date:   Sun, 13 Dec 2020 17:17:17 +0100
Message-Id: <20201213161721.6514-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Memory is being requested to the kernel but there is
a missing check for NULL. Hence, add it.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-rt2880.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 6e0bf7c4837b..3c3336b724ca 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -238,6 +238,8 @@ static int rt2880_pinmux_index(struct rt2880_priv *p)
 			p->func[c] = &p->groups[i].func[j];
 			p->func[c]->groups = devm_kzalloc(p->dev, sizeof(int),
 						    GFP_KERNEL);
+			if (!p->func[c]->groups)
+				return -ENOMEM;
 			p->func[c]->groups[0] = i;
 			p->func[c]->group_count = 1;
 			c++;
-- 
2.25.1

