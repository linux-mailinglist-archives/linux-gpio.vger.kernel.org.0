Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0BBA756E9D
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jul 2023 22:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjGQUyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jul 2023 16:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjGQUyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2023 16:54:02 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FC01A6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2023 13:54:00 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1b3c503af99so3391253fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2023 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627239; x=1692219239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyy/hqOdv+k0nTAkjs+7RYMgFYdulT0nhGoNzbzeMig=;
        b=KJTf9YmZ+opwlSlKQtj4qmVAgcviWKLlE18bPJ9PK2xx2vbd1cglf/B19eHyMCF/iu
         Eo/LO0A/WooxN5UAWv3ScN8m/gCHPScAd1o8ZsTnssQOVautf5+DNwlXfqz2MzgkWZ/e
         bX5C/SPhH1uy1+IfbnoAxp108QlYMtrHQK59JmnuHeuXgWbVGu3YO42QzGuG5u7RkEdr
         oHzNxQ4hcPd/NvOcdLGlAatT1hr1aZ0yu1Letu3MtHfILsfG72e/s4DAm48dG6rMbobc
         NpbivKFS98tExj0Qk/X0qClcS/8nQ5Rz0KBZRGMZH8gxRbYknPYghwWTPxJqFzB+Soz4
         MlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627239; x=1692219239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyy/hqOdv+k0nTAkjs+7RYMgFYdulT0nhGoNzbzeMig=;
        b=e5TLhUIUA+oc7WOepvIwbpvq5pInalagUM7aAyL+tTtbSVIrAS5n56DrbDSfEOOWrr
         2kRfs3P7GjQ/3WbQgwfp9Q2olq6DT/18UnOamT3hgQ3lH09tzMjCIjjO1sWlS7D/w+YO
         Oq3h3hmpX9yFHcQuCJX63S40icMh/e88mUVfMrWJ1813/01Uippqa1WINJSL7qTslJmB
         FQ9/wca+GARIbnstSVdKeAmit8UvkLCyUlUnNadamKBK2FssX3qQVR0gougMVN5Ne81g
         PIyhP7oty1EkWgJ9ceSu0ChuFcEockhZf4wYLf16Q64czzkCj8ELsa3PBElY/D2z/RH0
         NP6g==
X-Gm-Message-State: ABy/qLb2cHghs6iT6giI70RjjeBGfl9X/+4PNpsOQ0NUOk4DtrF0oGNW
        s6J4gKsDAwjZSA1DE1bhrSmToA==
X-Google-Smtp-Source: APBJJlFdP1Af7JGzTPtkK/vllQtffloe3sX9PaU93xyPQ8qir6P/+bH6Lv7otG/v4/4fcg4rtzqtJg==
X-Received: by 2002:a05:6870:fba0:b0:1b4:4a2e:b698 with SMTP id kv32-20020a056870fba000b001b44a2eb698mr13093826oab.47.1689627239068;
        Mon, 17 Jul 2023 13:53:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id z8-20020a63b048000000b0053031f7a367sm206991pgo.85.2023.07.17.13.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:53:58 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] gpio: sifive: Module support
Date:   Mon, 17 Jul 2023 13:53:55 -0700
Message-Id: <20230717205357.2779473-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With of_irq_count() exported, the SiFive GPIO driver can be built as a
module. This helps to minimize the size of a multiplatform kernel, and
is required by some downstream distributions (Android GKI).


Samuel Holland (2):
  of/irq: Export of_irq_count()
  gpio: sifive: Allow building the driver as a module

 drivers/gpio/Kconfig       | 2 +-
 drivers/gpio/gpio-sifive.c | 4 +++-
 drivers/of/irq.c           | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.40.1

