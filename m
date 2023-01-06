Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9476603E5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jan 2023 17:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbjAFQFu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Jan 2023 11:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234688AbjAFQFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Jan 2023 11:05:34 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80678CD3C
        for <linux-gpio@vger.kernel.org>; Fri,  6 Jan 2023 08:05:26 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id z12so2387359qtv.5
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jan 2023 08:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NmmuheTPvVy+17AeXaL7dLZnUFML73M4wyRijeVUHg=;
        b=dEZwz9uSN+tuw/WVUGcZkF7+AWEv/sahLk4+588DBuB12zE9pfMLuamKFRVXwga/Qw
         Y/WLFfwtLgjCOuvh0bH/8cccEJ/y7Tg8X34W1qRQgF4zlHY01qvK3/5RrpGNiydB8aPZ
         PWrzr5kLQRH+gOn/qAxf8bX4U3JJExR2KhoMxEBMNKZSuTBngcGL90SPkfrfdoa74NGy
         CsDdiKAH0Bm/ntGt61SsCi++2ywaRz7Hm4PRIGayKpAkHA2MYSvptzwh/M8tU3Uv0Ugz
         19MkYbrFJnwJ4lnjwlPhegh7IcwxbtwR3rAPeyBxbTZcwSxtY1XczdwPvBtWzUcKiLhQ
         UshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NmmuheTPvVy+17AeXaL7dLZnUFML73M4wyRijeVUHg=;
        b=z2rYS/oN4NHse1qdM1WIRSFMKa+DGdc6x1ZVGUDsGEcnO2ZdBhf/f1PEtfk67lqSUF
         NFaub8ZkBqzWXPoNCvyM2Q4B6JoOG6UjrNpTAJcana6vAE9oCTfCVr4roKikQ1ujIhRO
         uUett9HeC2dwW1HJj+MVDGjWLYUcxQCAvmfZlhBEvgaFaXFbUKu5WvUl7m5V+Ea5FPz0
         dKrbgXMXB2nrFYm44qjo+e3BiabpN+QMUvtT1rq4msIz1otRTHDYMU/RLtbDZvpmUvHU
         vEcS0GiN4ewl5jOoVNF/KzyjGJjk14JdEyKa1x30nJbgMQcp2sjqpqafwDWFrbBsGOg5
         KTPA==
X-Gm-Message-State: AFqh2kpC+zTLCE37/GLQcOXqawVQE59E3QFc/2oMnF956/HPdRif0e8t
        Wp4xn4OpAg8zWaXPaekUP0E//CToF/kBAA==
X-Google-Smtp-Source: AMrXdXuaiDFc3xhwn1RQjnApbHQcnhHed/C31ruWv211+zNgV2XWQnxJtL26mavjYBmxyDKeQFSCQg==
X-Received: by 2002:a05:622a:4d47:b0:3a7:f183:7f66 with SMTP id fe7-20020a05622a4d4700b003a7f1837f66mr84365144qtb.22.1673021125298;
        Fri, 06 Jan 2023 08:05:25 -0800 (PST)
Received: from bat.kanata.rendec.net (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca. [72.137.118.218])
        by smtp.gmail.com with ESMTPSA id s13-20020ac85ecd000000b003a69de747c9sm680063qtx.19.2023.01.06.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:05:24 -0800 (PST)
From:   Radu Rendec <radu.rendec@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/3] gpio: pcf857x: Implement get_multiple/set_multiple methods
Date:   Fri,  6 Jan 2023 11:04:16 -0500
Message-Id: <20230106160419.1020733-1-radu.rendec@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The first two patches are just cosmetic changes. The actual changes are
in the third patch. They are all bundled together in a patch series just
because the third patch doesn't apply cleanly without the other two.

Change description from the third patch:

  This change allows the GPIO core to read/change multiple pins in a
  single driver call and subsequent I2C transfer. It helps a lot with
  PCF857x devices, since their I2C protocol always reads/changes all
  existing pins anyway. Therefore, when the GPIO client code does a bulk
  operation on multiple pins, the driver makes a single I2C transfer.

Radu Rendec (3):
  gpio: pcf857x: Replace 'unsigned' with 'unsigned int'
  gpio: pcf857x: Fix indentation of variable declarations
  gpio: pcf857x: Implement get_multiple/set_multiple methods

 drivers/gpio/gpio-pcf857x.c | 79 +++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 25 deletions(-)

-- 
2.39.0

