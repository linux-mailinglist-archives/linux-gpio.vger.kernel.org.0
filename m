Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D742520310A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgFVH6J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgFVH6F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:58:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FFBC061794;
        Mon, 22 Jun 2020 00:58:04 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id k8so12873256edq.4;
        Mon, 22 Jun 2020 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzouIcqNeHmwTME7jVaUjFBAtS8z2sOjc/dsKSoeppE=;
        b=sqqJimkiTu7IRJE5IFZNKQ6CmfrVpIe+bIAfK15kRWrQgdPR/PgM9Gmx7mSDshphvw
         9AL/m4v/pn6feUYYfdYFKynhB+dTk2f+kzeGaPTYZpMbiXsJZYG7Yek+JEtAu/C1bnkT
         PKpRHinlp4w8NiBe4VNItV9LHYnG5380XUZRUdGt/MSavJox1DUYzTHp7RO4c3nOtu6m
         cJEtAynrKCjWqu8RB10HXSiL0bTc+QoAjTQdybU7svGHwbvMAa8bo7MQNQJsa9lGgpPe
         2KpkIjpgqvTx2VZQYXpVAtdQQSMvx4JRId/YCJUmvgFZp+AT7C5riHbA9ewjSeQ59v1B
         D8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzouIcqNeHmwTME7jVaUjFBAtS8z2sOjc/dsKSoeppE=;
        b=ZHaOv3EvqHGlIXPdleCrwYj/1coKL7QK3gQDDMxJjiNouGJHZwWfsLl0s7yrckvfUB
         a2flrD21Gmt2kJUXF2CH1OOegAXf4r9AooDOLJ3rD0Ma3Jy5D6BT54YnpRLjhOu4KPXa
         Z+Junp5PEcU2Tmq5jYiFLm3bF5q+hGSW5wAZaU2K4nDX0GX4/u1OsDypePK8MTThCWoC
         g6liKchtxekMFe545tzyeSjh1NL1tB9NPM8s3tJulNqXBhP+hcU0obu6bxT/BXBUcp+z
         5Tbi8qZGyu6K8jdXEVhhUNJRKjRhqy9jNpU38rHHEGhqGnTxkP5gkiAtLAQDgSJUsV9S
         4+OA==
X-Gm-Message-State: AOAM532UUa0jxxijIwGKKSmc+pDhtJ8jYJMYiDEPrxjOpkbQI83CkWdp
        D4r+cuh7ckoBVLgaYA7sAVU=
X-Google-Smtp-Source: ABdhPJwhZoxVmh3ooaVs5Mou9B6IGPM/3LOIVUFAVD3EpJIA6khP/+uJ99029Qqvg2zPs6n27vdAjQ==
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr15883695edq.336.1592812683594;
        Mon, 22 Jun 2020 00:58:03 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:58:03 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/8] soc: qcom: socinfo: Add socinfo entry for SDM630
Date:   Mon, 22 Jun 2020 09:57:41 +0200
Message-Id: <20200622075749.21925-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622075749.21925-1-konradybcio@gmail.com>
References: <20200622075749.21925-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds missing soc ID for SDM630.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 5983c6ffb078..705f142ee588 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -202,6 +202,7 @@ static const struct soc_id soc_id[] = {
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
+	{ 318, "SDM630" },
 	{ 321, "SDM845" },
 	{ 341, "SDA845" },
 };
-- 
2.27.0

