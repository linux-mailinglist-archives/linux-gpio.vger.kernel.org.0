Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939AABDB7B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 11:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfIYJwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 05:52:51 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43538 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbfIYJwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 05:52:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so2896074pgk.10
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2019 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TV3RT1yNKXy5j0AoE4e6keZibU6Zrl0Z4HmWZXehpjw=;
        b=va8yIct1jAIbfCuT/3sEP4exm22IQ2TSwWZP2+TsQD7Czgf2QXVgxepvptPTgLoifq
         5r/FRHyIQOdjDoO5V+eirOa4qQ5m5BXLaK0Jc+RM6BD8Edgv9isDVFsB3SwVDyL/+8mW
         s6axDG4Eti4ok2rYzMLd/40V9QkKJEHTx+7q/KUEWYKzi84PeWgSjNOMUYp2EGX7VEdn
         daIsmeq4cDoSg85xqv9HhaCnxKuPz2KJBDNiSb8+6It47l89jyS3m7xe/EhL8qnfHRx7
         JJnNtE22qP4BEFxoOCaOPhlXs2Wh8b8y8tYKZda6+/4/ZMa0oNQbDPQcjzVrutR+SOFO
         IuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TV3RT1yNKXy5j0AoE4e6keZibU6Zrl0Z4HmWZXehpjw=;
        b=ZY1dHMRvELYrI1Z4OGPCQ5fHLke3dDEZJbuPySF7s9BEJpPS0s4hFxWkH2aEx0QcZe
         hQ2524cTJie+22PyagYM4EUz17vG+NaJ8me5zovz4dZehEh8/XkaGjgnfp22a1ehldq6
         bqchzEsscNT6JBCoqIkd2s+vtfGDURVTY0H/oH2yWTxiZb907EwPqP7y/NF7bo3FilkX
         LrKJS+A7WOcpWjPO3598tnfoV5Pay4A7kcStGCC/aZMGVh4A5rc3mdJ46cyftxOjIX/5
         tY8ts84zzgeZokYXUEWrb1wUbauOsbO0OyTWufHuH5U4gMGH7WFWTW0Y86f7cDgLdeew
         Pg6A==
X-Gm-Message-State: APjAAAXBpIFy+8F6EWcpqtFF0lLYgcQ6GlCwNBT8AIWAEXq6JHDSafAT
        WNSp3kf1u2xXxTdopSTVWdBXgAwzC7rN3A==
X-Google-Smtp-Source: APXvYqxAi3M7mauapLMsR6LDIGh2upipMbm+6rwiwwDaLqwegdnLSJD1q1FWwqTsxI1Xn5NqnSB2mQ==
X-Received: by 2002:a63:d908:: with SMTP id r8mr8046960pgg.263.1569405167866;
        Wed, 25 Sep 2019 02:52:47 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id p20sm4037221pgj.47.2019.09.25.02.52.43
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 02:52:46 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     stable@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
        linus.walleij@linaro.org, natechancellor@gmail.com, sre@kernel.org
Cc:     longman@redhat.com, linux-gpio@vger.kernel.org,
        david@lechnology.com, linux-pm@vger.kernel.org, arnd@arndb.de,
        baolin.wang@linaro.org, orsonzhai@gmail.com,
        vincent.guittot@linaro.org, linux-kernel@vger.kernel.org
Subject: [BACKPORT 4.19.y 0/3] Candidates from Spreadtrum 4.14 product kernel
Date:   Wed, 25 Sep 2019 17:52:26 +0800
Message-Id: <cover.1569404757.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With Arnd's script [1] help, I found some bugfixes in Spreadtrum 4.14 product
kernel, but missing in v4.19.75:

513e1073d52e locking/lockdep: Add debug_locks check in __lock_downgrade()
957063c92473 pinctrl: sprd: Use define directive for sprd_pinconf_params values
87a2b65fc855 power: supply: sysfs: ratelimit property read error message

[1] https://lore.kernel.org/lkml/20190322154425.3852517-19-arnd@arndb.de/T/

David Lechner (1):
  power: supply: sysfs: ratelimit property read error message

Nathan Chancellor (1):
  pinctrl: sprd: Use define directive for sprd_pinconf_params values

Waiman Long (1):
  locking/lockdep: Add debug_locks check in __lock_downgrade()

 drivers/pinctrl/sprd/pinctrl-sprd.c       |    6 ++----
 drivers/power/supply/power_supply_sysfs.c |    3 ++-
 kernel/locking/lockdep.c                  |    3 +++
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
1.7.9.5

