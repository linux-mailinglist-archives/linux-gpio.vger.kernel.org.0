Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E16162A0C2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 18:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiKORyf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 12:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiKORyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 12:54:31 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429132DA8C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:30 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y16so25589311wrt.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkgVHw+c9pvtOh4Y/MxKYOBifczQlOTzWXiETzzGzA4=;
        b=u8T/hn4r5IR3PLikK91l7uMdx0NaqKkQXAGQRH3BVoQCHGezP1SQtpKFVCUa9gQpYf
         DDJ9uTHbASZjLsSzMrfUHoZGQT4EYzRBhSRTL8ISdExI7FgvL3ZPgWZeGj2jMNHwlfvV
         RxuvzF/ubd4zVCnZexYqb7XpyyELqns5JMEhkwztHggqkMwtu1SACK64RXABiiVXKYNt
         GG70GcTO4v/UtjvmDVDgJnuY1Zfts4ZKKohIigBFuUWE9Eon7H9Gyb6r9Wbg2wfhxCd3
         GGX42D56uX4UM1kjw+VRY5lyE6Y/5u/xN3t8vtDwkPPw/Akvjgb/ghRU7CqfDtNWlRZp
         oLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkgVHw+c9pvtOh4Y/MxKYOBifczQlOTzWXiETzzGzA4=;
        b=NRbM8i0v1nzl+/Ca2jpBiHoe6dao6zT28nauTNUA7jY5t0ons1qMqMFssXN7rOoxKl
         pTWpOwWU9LOt5OLjy2J5asr8xew221DHKw6YJplUJCyACF9YNlwYZah9tCGnjqTP6whH
         UmShWhd501B4RQE5tz1x1PKqVcsM6yRAAFijl/fPVIqdPmWHpa6M/iVYUf3balY8Ui4N
         /NW0wNYPdrdtgOwBeBIZy5zrEtUCpfLUhnUNQC9EG6CLCIfCHe73zyBfnVeMClf8tcHR
         0ElhgnCptCz4i55l+dkhoFtULxNr/elgpF4krdlIDGTDI+BftTtnHXu7tSSq3PP0nN8S
         4V0w==
X-Gm-Message-State: ANoB5pmPvX3GWJ/QTeGUKAnMof6uO2QKrmAKug+yEfG/YTTsrSmQ6vla
        8n7Hi0yQ5s+qgNmHj44BTFwipBDn196/xmc9
X-Google-Smtp-Source: AA0mqf5jmhJVv6wInX8RFjHZz4ubAWb9pVuX9LTJE9yX9bQnHPv6X/PB5GfGOgmRN7iLuFKZ6FKZVw==
X-Received: by 2002:adf:f009:0:b0:236:657e:757e with SMTP id j9-20020adff009000000b00236657e757emr11642379wro.350.1668534868507;
        Tue, 15 Nov 2022 09:54:28 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm26599521wmg.46.2022.11.15.09.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:54:27 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Date:   Tue, 15 Nov 2022 17:54:12 +0000
Message-Id: <20221115175415.650690-1-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a proposal for adding ACPI support to pin controller.

The patch supports following resources introduced in ACPI from v6.2

- PinFunction
- PinConfig
- PinGroupFunction
- PinGroupConfig
- PinGroup

The patch has been tested on NXP I.MX8MP Plus platform with ACPI.

--
V2: 1, Fix styling issues pointed out by Mika Westerberg
    2, Added a new interface to free pin group descriptor
    3, Added vendor length to the descriptors
    4, Reworked map_config_acpi_to_general to pass an error value
    5, Few refactoring to keep functions shorter
    6, Dropped new generic pinconf types added in v1

Niyas Sait (3):
  pinctrl: add support for ACPI PinGroup resource
  pinconf-generic: clarify pull up and pull down config values
  pinctrl: add support for ACPI pin function and config resources

 drivers/pinctrl/Makefile                |   1 +
 drivers/pinctrl/core.c                  |  18 +-
 drivers/pinctrl/core.h                  |   3 +
 drivers/pinctrl/pinctrl-acpi.c          | 542 ++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h          |  78 ++++
 include/linux/pinctrl/pinconf-generic.h |   6 +-
 include/linux/pinctrl/pinctrl.h         |  15 +
 7 files changed, 657 insertions(+), 6 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

-- 
2.25.1

