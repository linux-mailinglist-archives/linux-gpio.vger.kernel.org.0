Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6399B556E20
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 23:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244773AbiFVV72 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 17:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbiFVV7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 17:59:19 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4F4764F
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 14:59:17 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2dc7bdd666fso154434027b3.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ShVpNHmjygEofAqZTHbL2NPyHgeZoFDheDozlrqz8Mo=;
        b=mPUp1ZaiPzHiX/ODKTWQHSWhTGs2yrj0nz46pJea4DKVIWXpl3q0hnFrpNlVeVuFMu
         O6opAaXQuvi5uzX9EE3KaV2tOUFGq1jDJOmlWAwGI9JnOmBxCTczh9qb6dkX4IMOxw4R
         7k5Jju5GTUCe3yiEswDVY4cctHhutRwGFrXTp4d6H7EswQNBSuousy5e+nF8IFajtZYo
         OjoVhxEhdXwBTMSSxpG6OZNtheT6Ku7+aQY740oMkBnQKdxNivQym1AS38woNuH1PkQi
         LMpv++OC1nrl7lO39MRZ8QiA8XyTUqyfG3zJSRr2zKL91xKNcPmDsDkOZgGsgRtYkxv9
         yh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ShVpNHmjygEofAqZTHbL2NPyHgeZoFDheDozlrqz8Mo=;
        b=1vz9TZIfIaOMgDnBX5t976PX2HjXaSO8ZsiZnsEo9COuqoqRbTJ4OFnVHMtL73mepy
         OobHcB/zkFbcCU0l456UmOm94C2Yk74oWGVTwC4jFjB9WXeYm18QgUIeMAeFZYY5X/fw
         lGXf2tDjf6+BAiTLrpS+vhGVJLntz3qp68J17bHy2PDGaaZ3fxCLaycXlICKqYX5h5NA
         eq/N6hXDgNmD40LZNU0Hu2iLoWoHPhjTOWtTVdrUVSrj4O97NaT3nto0Y5UTLobASMwj
         fyZuE7eBpmxxfXSyk6pqomkWHZwyoTnJJ8MLTHgrxKejwDWff7ZbdID+b9AA/9wPeJiJ
         MtUw==
X-Gm-Message-State: AJIora/0MuPORvCkgNFYWXILmWuBSan9ggFML6CBTucCfr+IgwrQAO0l
        gfrMWJj5WDa7XIbvWWSXeaxYC0smGwaYb3I=
X-Google-Smtp-Source: AGRyM1sPRolQYIbNGET+LNO41EG5xKdb86jsaddJpKTB6LWlD19bkf1RVr0BB1uN5nuhu99u7pbeK+zWsKcFtIE=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:be1f:89ac:a37d:6bb4])
 (user=saravanak job=sendgmr) by 2002:a25:73d7:0:b0:668:e7db:d62 with SMTP id
 o206-20020a2573d7000000b00668e7db0d62mr6272113ybc.265.1655935157166; Wed, 22
 Jun 2022 14:59:17 -0700 (PDT)
Date:   Wed, 22 Jun 2022 14:59:09 -0700
Message-Id: <20220622215912.550419-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v1 0/2] Fix console probe delay due to fw_devlink
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Sascha Hauer <sha@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

fw_devlink.strict=1 has been enabled by default. This was delaying the
probe of console devices. This series fixes that.

Sasha/Peng,

Can you test this please?

-Saravana

Cc: Sascha Hauer <sha@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Kevin Hilman <khilman@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Len Brown <len.brown@intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: David Ahern <dsahern@kernel.org>
Cc: kernel-team@android.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: netdev@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de

Saravana Kannan (2):
  driver core: fw_devlink: Allow firmware to mark devices as best effort
  of: base: Avoid console probe delay when fw_devlink.strict=1

 drivers/base/core.c    | 3 ++-
 drivers/of/base.c      | 2 ++
 include/linux/fwnode.h | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

