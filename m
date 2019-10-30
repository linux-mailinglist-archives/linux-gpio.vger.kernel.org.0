Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADEDDE96FB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 08:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfJ3HG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 03:06:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43584 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJ3HG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 03:06:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8FD7960E74; Wed, 30 Oct 2019 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419216;
        bh=Qlb5OXnTWZrRca7YNON8py275AkTLA2cLcpV5cTGem0=;
        h=From:To:Cc:Subject:Date:From;
        b=HTQ0OlwnWfsggjRl5Ih/3FKGzCgIG/zXGyaI2drYI0jNNAYoYHhggZV6fU7IGPxfU
         4ZFtD4Jzw41LHdjyIN/D/Ciw0ofvwgfgn+q8crWexuhj1tquJ2EyiTRJt67N+2Ui8p
         i0xifM7q8ef2r7l9+TdoRAXnMRAeCkG2gRYxtaUE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6026460BE6;
        Wed, 30 Oct 2019 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419216;
        bh=Qlb5OXnTWZrRca7YNON8py275AkTLA2cLcpV5cTGem0=;
        h=From:To:Cc:Subject:Date:From;
        b=HTQ0OlwnWfsggjRl5Ih/3FKGzCgIG/zXGyaI2drYI0jNNAYoYHhggZV6fU7IGPxfU
         4ZFtD4Jzw41LHdjyIN/D/Ciw0ofvwgfgn+q8crWexuhj1tquJ2EyiTRJt67N+2Ui8p
         i0xifM7q8ef2r7l9+TdoRAXnMRAeCkG2gRYxtaUE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6026460BE6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 0/2] sc7180: Add PDC wakeup interrupt map for GPIOs
Date:   Wed, 30 Oct 2019 12:36:16 +0530
Message-Id: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIOs that can be configured as wakeup sources, have their interrupt
lines routed to PDC interrupt controller.

Add PDC wakeup interrupt map for sc7180 GPIOs.

This series has dependency on adding device tree support for sc7180 [1]
and support wakeup capable GPIOs [2] to merge first.

Dependencies:

[1] https://lkml.org/lkml/2019/10/23/223
[2] https://lkml.org/lkml/2019/9/13/1005

Maulik Shah (2):
  pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
  arm64: dts: qcom: sc7180: Add wakeup parent for TLMM

 arch/arm64/boot/dts/qcom/sc7180.dtsi  |  1 +
 drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

