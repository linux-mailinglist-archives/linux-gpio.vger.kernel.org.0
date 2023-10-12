Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6897C6DA0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 14:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343837AbjJLMKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 08:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343869AbjJLMKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 08:10:04 -0400
Received: from mail-wm1-x364.google.com (mail-wm1-x364.google.com [IPv6:2a00:1450:4864:20::364])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A20B8
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:10:02 -0700 (PDT)
Received: by mail-wm1-x364.google.com with SMTP id 5b1f17b1804b1-4054f790190so10189505e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1697112600; x=1697717400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfpJWT+uZPVvMAHLIGZwwFyVZalEkuy3gXVTkAu6Log=;
        b=Pb+h10mHgloKs+MVktpVyv38aKwh9SJxk8TTTCvGFLP0K3x2+hjs8dVFEB1GvLY37x
         XYoxVj98kwIbkb6d6Ccx6NnsxnGwVQVO4da7QkkmwG7NnWk4PII7jbWY9dVjI3Ra8wKT
         H5Kz83iY9UU8E4YFuhGFRx0ExQYg3JMVlHedQBKns7JIJ0EllAxG9YQJqYd/M+gpdT/+
         +cUYk4RwKk2twiJFQyxIHDVxSQrRa897BDDIQ9SYzbgj8jL+n4OF5a61OQOJB5AwIKRU
         D7dVUnrR0U9qaw7B0G0gtDgV0VQVe6x4+IwtS/BTJbFBtgqA2xC2RSBM8uSxy05ViXXq
         6qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112600; x=1697717400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfpJWT+uZPVvMAHLIGZwwFyVZalEkuy3gXVTkAu6Log=;
        b=dCUPj4lzGXm61bo9Br18onbeFg1+XVy8Q21leES0ray0txPF9iP3knmkfSlH//RRhS
         B1HavGObNZaWtF5SCiBipD9R+UwQvKcIlTgZyhT5hcj0YAdA/QbqlTFmpgUsYXaG42uR
         DVPQ2xFUOwSaDT3FNyWWB71PQLeTJRV28r7COzzt0klJ3zGBR6UYZbv8C1u/tItmiJTs
         mf9XQw1S0cP3YV2J9SHDl+/MErIR4xRBEsKeOrcqyM9L65YWBhh75XMeCnjHMFs0mnzO
         gUCgo6EQ5fJwrExIp2jMZTile3P+qrwZTiiGE1O1GvSvOsCk5llcWpBxg5X6frqEau50
         dyFg==
X-Gm-Message-State: AOJu0Yx1BX+K3PySu3TrVk0OJ+GILWSWkXZV7yKCxbc4Cv3robr/7xxl
        OqcvJU3PgRMnAYpRn5wbxAYpwMHWZWUmnT31d7GwGwT5llkp8g==
X-Google-Smtp-Source: AGHT+IGX9tJiB8g3vgobIoEj1xZzrsgvpN7pfdjvP4lP0/S6uVQnDsmG001ACQxrtczhoxq8AHQXM0bi1UX1
X-Received: by 2002:a19:e010:0:b0:500:b74b:e53 with SMTP id x16-20020a19e010000000b00500b74b0e53mr18203780lfg.46.1697112579983;
        Thu, 12 Oct 2023 05:09:39 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id v14-20020a7bcb4e000000b003fbc072d865sm1394583wmj.31.2023.10.12.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:09:39 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH 0/1] bindings: python: don't use exec (...)
Date:   Thu, 12 Oct 2023 13:09:24 +0100
Message-Id: <20231012120925.58508-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There's no need to open and exec the file, since "import" already does this
implicitly.

Since we always expect this file to exist, the change of error in case of 
failure from:

FileNotFoundError: [Errno 2] No such file or directory: 'gpiod/version.py'

to the following:

ModuleNotFoundError: No module named 'gpiod.version'

is immaterial.

Phil Howard (1):
  bindings: python: don't use exec to get __version__

 bindings/python/setup.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.34.1

