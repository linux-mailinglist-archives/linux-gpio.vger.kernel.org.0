Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6107845F297
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 18:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235558AbhKZRGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 12:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhKZREd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 12:04:33 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCA4C07E5F6;
        Fri, 26 Nov 2021 08:37:34 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b1so25489502lfs.13;
        Fri, 26 Nov 2021 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Kh+r+enE/aDMEcIg5E7aidz6CHPbgPNpbPDxwc6DgE=;
        b=nuOBw0N7ESsRZ8Kle97wVZLlQu5aQBukVf/f3QaReGPkqwkHgtMY7p4eOcM5+i8XSn
         1zq5QczRWSGt8aK4RwWE5pEcgdnliAyGZ5N6R2p1aBnOLWpvKVxyumHzclidwN6LdML2
         ZJ3sq4ftv/ypq0M2epY2umP6kFY2drnTmDeiUsitz7BJt4o3AbPVpp9FAlgvrJViG7n8
         4Ne14u0MQ7M6fRkRA8f5s6F4cPD1B6BNPf6PCKYodipNwgpO3dMbij/5dXhqtzVPQji3
         ksL6/0rHO+Kgdyig82NsV7TMB9Qwg7u2qFMoHGkqHRuKtCKxizqOXiPO9rk5pjMLrCni
         uoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Kh+r+enE/aDMEcIg5E7aidz6CHPbgPNpbPDxwc6DgE=;
        b=2sknrVBYxNrTtQwrbfDro4Zk9pxJsF6PleePbx+kVq37RFH5Fi4uCX+UC+G/8KCmAM
         xcVFlyPSQCU7mIby9miEx7/e1rV5RbsmE1+MFij2Y0OBffF/y2QbHA4TxeHwWlv03l23
         paQSCWE2ebFhzXgBqHG1iwydRo46y7TCqp5nkkruyN6/iEcXJTbg5uVPXDj1oI0h84hf
         S5Zj9DALDftSriBrof8iMC6BgGWIHqon30ESefXPT5QYmQR8vZ0XAveH0g8eDANoxGOs
         sexYfLylh7jEDaYr9l4ERJF0/40zWewH43bpzt1K5//fVLccSuEyL9SOWMMYT7HJt6B8
         iiTg==
X-Gm-Message-State: AOAM531ujeLThwPOzqrAs+opTkXbCgIUFQecr8AxRpPNDLftund5DimL
        6tHECPZzcmhtcSGdE7AAWX8=
X-Google-Smtp-Source: ABdhPJyUXNOan4K2/n26Y8rT6nUMdDqi7PPMlqzjw3ahkpFZkcIvq40b55PsRAVMeykP6zfjqvU4FA==
X-Received: by 2002:a05:6512:b14:: with SMTP id w20mr30228832lfu.164.1637944653083;
        Fri, 26 Nov 2021 08:37:33 -0800 (PST)
Received: from localhost.localdomain (public-gprs174427.centertel.pl. [46.134.20.156])
        by smtp.googlemail.com with ESMTPSA id p5sm540608lfa.251.2021.11.26.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:37:32 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     linus.walleij@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        dominikkobinski314@gmail.com, ivo.ivanov.ivanov1@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dkobinski314@gmail.com>
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility 
Date:   Fri, 26 Nov 2021 17:36:57 +0100
Message-Id: <20211126163657.65471-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
References: <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Dominik Kobinski <dkobinski314@gmail.com>

Thank you for applying the patch. I believe the second one in this series (https://patchwork.kernel.org/project/linux-arm-msm/patch/20211125215626.62447-1-dominikkobinski314@gmail.com/) should be also applied to the pinctrl tree.

Regards,
Dominik Kobinski
