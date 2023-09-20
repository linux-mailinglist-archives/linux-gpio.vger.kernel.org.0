Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9617A8F43
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 00:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjITWYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 18:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjITWYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 18:24:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF651A2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 15:23:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50307acd445so634373e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695248630; x=1695853430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jR1kBH2yPAoDrpPyCmiq+S860RDZqntfgvwfMKAURlY=;
        b=tP8rYbNVcTi45kIObh/+t4+iVmT28or+bPinceavu2qCkVF+E/r8kdUnfNTbtKIOny
         U3+59TJGWeQvcsyivSp7quYHdGjBJihs8WrNuzGEyUCKmLNMOGKtqwHTsrAmfpU0lKQb
         4cDGDjU5wX7IVpeGdTVD7D+5hTFf1sT0qpjaijCMrnlaAySrS2CoDkP8s7iBlj3lhomn
         n90dSfKxRSy4UqXQ7cgfn8AgZq5m8ws3yp3P99BmqH39nKGCFEaYHwNBJuZRNRerJekw
         wDaePxR9Shhsp94My2wxvthk35oSHNAuV/7ZMxnOXPzrnX2kr49VK2wXCd6faqWYJ6fx
         glkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695248630; x=1695853430;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR1kBH2yPAoDrpPyCmiq+S860RDZqntfgvwfMKAURlY=;
        b=VmKwU0HAa67YeLAvgWiOjNbebgr1BmQEO1qU4NeB1zxXKbPFCx+rhytI7nwj9ZtGak
         fV347/kADgTbVs3GvZAn48Dw/vDqRZ/6WBDos+a9iCPvDi5FKmtbGvibkCOR1MWaH7cC
         HvAoDSKTh5AOB4kOOBzqGxvxo454+x37DFiRIxca5/5yz/ddBaViaE64gIQqLxsZrYQZ
         kL6ve6O2GWfbyUNepb/QBg62rueG2QItyZn1KLKEgxASc0TO0OrJxd9wHujG74AfYqlz
         JuQZa5H55Xv8FE5NKB18bS03HXsuH2b6S4mlXyKwkhJMvoIfwzusItu3dmjPOQDYw7XP
         ZW1Q==
X-Gm-Message-State: AOJu0Yz6jQGILg1c0k2lgz58NJgvQLzjmPjpQ/eO9+4bUXjADnsSd0R9
        97KgCBt+rl+eyrV3mSchuS32OQ==
X-Google-Smtp-Source: AGHT+IGrTKOvNc+sfjk9kwfUoKjO5iAktlPUvUR5xMaHp6VFLlMa0p5fwsDhBwnnb/PP+HiK/IHP3A==
X-Received: by 2002:ac2:5e65:0:b0:502:fdca:2ea6 with SMTP id a5-20020ac25e65000000b00502fdca2ea6mr3015106lfr.61.1695248630097;
        Wed, 20 Sep 2023 15:23:50 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u14-20020ac2518e000000b004fe0fead9e2sm14557lfi.165.2023.09.20.15.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:23:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] gpio: ixp4xx: Handle external clock output
Date:   Thu, 21 Sep 2023 00:23:44 +0200
Message-Id: <20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBwC2UC/x3MQQqAIBBA0avIrBvIKSi7SrQom2ooVBRCiO6et
 HyL/x9IHIUTDOqByLck8a5AVwrsMbudUdZioJqa2pBGyaHNGfcgHu3l7Zmw456oN1u7LA2UMET
 eJP/TcXrfD1iQ7uJkAAAA
To:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO block on the very legacy IXP4xx GPIO can provide
a generated clock output on GPIO 14 and GPIO 15. This
provides a straight-forward solution with a flag for each
clock output.

More complicated solutions are thinkable, but I deemed them
overdesigned for this legacy SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      gpio: Rewrite IXP4xx GPIO bindings in schema
      gpio: ixp4xx: Handle clock output on pin 14 and 15

 .../devicetree/bindings/gpio/intel,ixp4xx-gpio.txt | 38 ------------
 .../bindings/gpio/intel,ixp4xx-gpio.yaml           | 70 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/gpio/gpio-ixp4xx.c                         | 36 ++++++++++-
 4 files changed, 106 insertions(+), 40 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230921-ixp4xx-gpio-clocks-7e82289f4bb3

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

