Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93211464123
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344667AbhK3WRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:17:14 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:42134 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344573AbhK3WMI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CE307B81CDD
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40812C53FC7;
        Tue, 30 Nov 2021 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310126;
        bh=FIjwXV914fpkvB8jfWfEg3YviC5U9kN8mg0qBX+8Ub0=;
        h=From:To:Cc:Subject:Date:From;
        b=Tfx1IY7a0fBEMDyE40P2H46/z7KtmZj7KR3HyEBQcmBL1RWyacx2C+yA5sO5tEb3E
         l8qO9vh6nM9NvknWwX529OQlZxcADwApPFaGLR1Ig7kio+qVsZYAaBZn6aBynJzN6q
         7Yh9IjCFzbAJfsZFS4dGy0T+v0JtOxBi6szDrmlxyJkvt8YXmRQxmEMV7gm1VY4mWO
         JJsMTFNRpYSpcsYs6aH49PoscznC7QrgPDTTl98HN28DN5sm4CmeGklZ4RaA9BNlVt
         bYMaRh2cDDL1CyOannZiJzlqBxOJNyfBiAdbWqAhRDkManxVvHEW0PgXj6l+f78gjO
         LnZGdCInS0kgA==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/5] GPIO PCH/ML-IOH consolidation baby steps
Date:   Tue, 30 Nov 2021 16:08:36 -0600
Message-Id: <20211130220841.2776562-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

These are tiny cleanups to pch and ml-ioh to try to make them easier to
merge together.  I can't really test either driver, so I'm not pushing too
hard on this.

If anybody wants to go further, Andy mentioned some docs here:
  https://lore.kernel.org/lkml/CAHp75VfDcQXqmK9=4k4rqi7t2OZaVPC13b45vLY7fELr7zBG_Q@mail.gmail.com/

Bjorn Helgaas (5):
  gpio: pch: Use .driver_data instead of checking Device IDs again
  gpio: pch: Cache &pdev->dev to reduce repetition
  gpio: ml-ioh: Cache &pdev->dev to reduce repetition
  gpio: ml-ioh: Use BIT() to match gpio-pch.c
  gpio: ml-ioh: Change whitespace to match gpio-pch.c

 drivers/gpio/gpio-ml-ioh.c | 52 +++++++++++++++++++-------------------
 drivers/gpio/gpio-pch.c    | 42 +++++++++++++++---------------
 2 files changed, 46 insertions(+), 48 deletions(-)

-- 
2.25.1

