Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0C34E18C0
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Mar 2022 22:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244272AbiCSV6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Mar 2022 17:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244268AbiCSV6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Mar 2022 17:58:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68FF260C72
        for <linux-gpio@vger.kernel.org>; Sat, 19 Mar 2022 14:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ZANJSblX0TZCK+Nkrd6vqR9UqAP
        caPEfKPQvNgD9izI=; b=YXiVgMczmIRUgwOcbsjW3hk5n7YeHsNhVEtBE+zPJXv
        pHb8seruffLBdnsMZvcq6BhUW9pnAUcRQioGMV3OfnSd+P2Tcw/Fvj151zZHXYc2
        Ql17F+hiEdVtuzwvhuK0lKtDbCqY2K4Ly7lDS1ik8qMRuFVFLL+R6RWd9Lm2+YoU
        =
Received: (qmail 244794 invoked from network); 19 Mar 2022 22:57:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2022 22:57:16 +0100
X-UD-Smtp-Session: l3s3148p1@JyGyWJnaoNwgAQnoAFEUAKkXZRZ8X9Wv
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] pinctrl: renesas: r8a77990: add drive-strength
Date:   Sat, 19 Mar 2022 22:57:04 +0100
Message-Id: <20220319215706.59519-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series upports a BSP patch. Please check the notes on the patches.

Wolfram Sang (2):
  pinctrl: renesas: allow up to 10 fields for drive_regs
  pinctrl: renesas: r8a77990: add drive-strength

 drivers/pinctrl/renesas/pfc-r8a77990.c | 38 ++++++++++++++++++++++++--
 drivers/pinctrl/renesas/sh_pfc.h       |  2 +-
 2 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.30.2

