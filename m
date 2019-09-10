Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0611AE57A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfIJI3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 04:29:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45794 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfIJI3H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 04:29:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id l16so18215109wrv.12
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MCbK8gJ7l40GbIle84rlNLNgucHtMu06/EDn3aBlvBw=;
        b=edNnDP/EBkkfYB/Rb+00iiHIlu1K2MBdzuskNr3Us+h6kvz+nLV4CJK8kJxBS+pf7t
         RwKUS8I78DeFd37Ja8u3wdzcS6rVGpJbu+rodU9hB6Cxy8RTwWiNMLYCiTW/Yl3rHWDu
         ud75zAaMr4PlIXaEsEj62ub2On9ADal9/z9lEr1w1zBJwEIsS2qa4Wn3mQWQlTjeDMJx
         QuacdXQNMbpRmivWXvjH9TcOl9QcBRUyAZ1Vy1AFt37GPAoeO3kEnSrurMP67D9TQ2Ce
         bHkW55yoULNCJVLS2gmPaei3P8Bb0LZk7LdDl9txUCnLPlHhs11OD7p8xi4ksUbhS6Fo
         WBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MCbK8gJ7l40GbIle84rlNLNgucHtMu06/EDn3aBlvBw=;
        b=bJUTqyz6oSwSQhRfTMwhPZhC40hiTNkkqZtIgZZ1whypQFc9eTXLdqoEgYqhq+zT4d
         1f6GRt33ntxRBYfMJO29ZypALK5lwAJpCTnT9sS1vr2rANwfkTdyvguekxOEZVYBRZy/
         ZyhFrw1NeT8Gw7YpmAcqApdLHFiMu5zHJOym02myfA/0gcXH8S+UtYJyG2CfGltNLBAG
         xJ8EMjhEoZDGV2nNLA6ZzJ0/sBZrpjPrswaPGAdLvPmhCL2sMSSu+GN+EAlHJhJ0iOC2
         +w8ghlb7meKelVMCl/YECIj7gbFvSzieSr7jE4KixfNvxdaYZvcF0MQwVN+Atgbf8J+t
         bLoQ==
X-Gm-Message-State: APjAAAXpZiBV5MrgkQi/RK7xHb25qHWbjmmy2VYcBd7f9cmZhIPg3cXd
        sz1tn8opEHeQN6yN0ZIQDlhISA==
X-Google-Smtp-Source: APXvYqyBbp7rMq5RUJyFEKMtEwYBt2iS5pGaBoG1qUralv0ZWubXm8AbGBUJQ0luNG7TN754JLriiw==
X-Received: by 2002:adf:f151:: with SMTP id y17mr4543391wro.244.1568104145698;
        Tue, 10 Sep 2019 01:29:05 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id d9sm27413266wrc.44.2019.09.10.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 01:29:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.4
Date:   Tue, 10 Sep 2019 10:29:03 +0200
Message-Id: <20190910082903.2727-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following (hopefully last) bunch of fixes for this release.

The following changes since commit f74c2bb98776e2de508f4d607cd519873065118e:

  Linux 5.3-rc8 (2019-09-08 13:33:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-fixes-for-linus

for you to fetch changes up to 5ca2f54b597c816df54ff1b28eb99cf7262b955d:

  gpio: fix line flag validation in lineevent_create (2019-09-09 10:04:53 +0200)

----------------------------------------------------------------
gpio: fixes for v5.4

- fix a memory leak in gpio-mockup
- fix two flag validation bugs in gpiolib's character device ioctl()'s

----------------------------------------------------------------
Kent Gibson (2):
      gpio: fix line flag validation in linehandle_create
      gpio: fix line flag validation in lineevent_create

Wei Yongjun (1):
      gpio: mockup: add missing single_release()

 drivers/gpio/gpio-mockup.c |  1 +
 drivers/gpio/gpiolib.c     | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)
