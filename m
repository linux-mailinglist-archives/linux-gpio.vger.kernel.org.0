Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A90D253EC6C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 19:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239815AbiFFOgT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 10:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239814AbiFFOgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 10:36:12 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBBB11A389
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 07:36:09 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g13-20020a9d6b0d000000b0060b13026e0dso10886385otp.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jun 2022 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=414Q+sddG1YR3KgC07ld9bq5c8kfHuuN7fWJhAprjG4=;
        b=WeZ7FVCxuYf5Lj6RSSLppFKvRuxmy4+3OJKXYynkNkXt4mTGaDJyOWQMjCA6mzyQu8
         ljaGWAZEC4em8VzNWUsJiy5z/eNy0zMLP39WwPuSBRNksPvlfpEBEm3HbEQubc5dNP1q
         3fJ2+uEuCsb1MTWs/j5Wxk7ib9rhVUjtyijkIbjIo/fYy9c2A7dF+8q67RALSRFVFH8H
         pczMR64UgDszNvNRTQzYRGRpMQiAmOyQNzGcAiCWb8fUABvfu17oXkGJL04Cnml1D6Gu
         5y3OSbzrWMaP6LXUZHDW9z6JwKqZy+Hv1ZiWgMJX0jBljB80AkN5b6mFP+NdNDZqZcPr
         7naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=414Q+sddG1YR3KgC07ld9bq5c8kfHuuN7fWJhAprjG4=;
        b=f54hQrHQuxCkl2t5irWldexhcMaL+jKH6wWPZEsHnvChovrOOemQZtlRr9+lqHCfIN
         +NKjzxcwOFcW94m8ssMPdrnkbwinCGGl6xJ1Ghy+Glm4Zg1rUtiFTU3e3lDyK86CaYvQ
         DJumhQL2QHdHc8R8/MoIkYK1uMIOlqRr83fMfNcT1tGl6tOJrsILM1R2T+pZaUV7qAFE
         8H0p8hu0bXim57CuZMAjH/O5h0TL9tk5YP8X+/+VYP5qi3iyGGWRuZbwxcgPvDtDATOd
         2pywkQN0LyFEgp4V+3Fb4L9TOHTM9+phDuHMH8eiL0XTxim7J6deqoFp7/nn/GdydxRK
         2OEg==
X-Gm-Message-State: AOAM532nTOjdEghWGlk1kqDQcmBpBpT8OrxB3AkYNtptTrpqJyKzyikT
        gLHvqRHrJu6V4B6nrQWHQvAFqjMzpJh3UQ==
X-Google-Smtp-Source: ABdhPJyY1pXBGwdS6vY88e/XFCOW/YWfD0n6EgJjbnWbbhelZ7P8O6d2RQHc3ype2mY+oTNeGM8Afg==
X-Received: by 2002:a9d:648b:0:b0:60b:c4c6:7dfd with SMTP id g11-20020a9d648b000000b0060bc4c67dfdmr8919077otl.105.1654526169079;
        Mon, 06 Jun 2022 07:36:09 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id u13-20020a056871008d00b000f5d4e5b9a0sm6942791oaa.2.2022.06.06.07.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:36:08 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 0/5] gpio: Implement and utilize register structures for ISA drivers
Date:   Mon,  6 Jun 2022 10:33:15 -0400
Message-Id: <cover.1654525394.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PC104/ISA drivers were updated to use I/O memory accessor calls such
as ioread8()/iowrite8() in a previous patch series [1]. This
patchset is a continuation of the effort to improve the code readability
and reduce magic numbers by implementing and utilizing named register
data structures.

One of the benefits is that we can now observe more easily similarities
in devices that share similar interfaces; such as the i8255 interfaces
used by the 104-DIO-48E, 104-IDI-48, and GPIO-MM drivers -- as well as
the similar interface used by the 104-IDIO-16 and PCI-IDIO-16 drivers. I
hope to consolidate some of these code blocks in future patchsets.

[1] https://lore.kernel.org/all/cover.1652201921.git.william.gray@linaro.org/

William Breathitt Gray (5):
  gpio: 104-dio-48e: Implement and utilize register structures
  gpio: 104-idi-48: Implement and utilize register structures
  gpio: 104-idio-16: Implement and utilize register structures
  gpio: gpio-mm: Implement and utilize register structures
  gpio: ws16c48: Implement and utilize register structures

 drivers/gpio/gpio-104-dio-48e.c | 157 +++++++++++++++++++++-----------
 drivers/gpio/gpio-104-idi-48.c  | 128 +++++++++++++-------------
 drivers/gpio/gpio-104-idio-16.c |  58 ++++++++----
 drivers/gpio/gpio-gpio-mm.c     | 116 ++++++++++++++---------
 drivers/gpio/gpio-ws16c48.c     | 119 +++++++++++++++++-------
 5 files changed, 366 insertions(+), 212 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

