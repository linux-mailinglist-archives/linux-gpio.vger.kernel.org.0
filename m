Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB06634FFA4
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 13:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235119AbhCaLn3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 07:43:29 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:49146 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235115AbhCaLnZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 07:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617191004; x=1648727004;
  h=from:to:cc:subject:date:message-id;
  bh=X5Gmo/4ZuyeqnIOkoGKQMLD98RQXFlOM0T/todCgfX4=;
  b=bSocJmAbjvjtjgeWdPNeUin2JnRUDjQ4lmse+7sN/K/TeyPaiQIVZFb9
   LBhcthWnkYhlE0jPpg05Etpjlxe3YI6l5q8AvrOS3iPtBxrG9sFF1x7bR
   8wKBBiiO2K/MCgonubbF3LQNlopIuzeJF+hsFD8W967MLZU0tfLtCyhMO
   HVxXlpF4oPckvdyY/8i7CoDHjs154j/qvfCYemEBufNEjcNSNrOwvFk9i
   uTFuEIVJN3uAw/YIZvQpgCR/5uiSRVWq5ORx+HwNSS4+NYJGESQYo0/2q
   R/gebA1uJAZuExkCegZZaJQEXUZIoiHkin9kV39t4FCvObqRC21HJvmrH
   Q==;
IronPort-SDR: EIjX4UL5pgCuvBRGTSXtJMPw7X5B0bbvw/aQMRBVg2YEMIFTTbcBWwkRVWPkn0upGOd6pYSNwz
 MCur4k6bd6+AOrP/A1xoD8Oy7kDcUnaf9o9P4KujoCcK5j5IrcAaUR1RyqjpebXl9nWVE9kDEn
 vgO4rvpiZZ0Yt+czPlwhN96MEUouW7nBegO6LBfbiQ1fGRGWj7Nt8a3ogr0Khi4PIAEV5SQuxM
 lVyryr9lFgCVdJB3jSrNaMBwqcPCWY5hskG2qgM8fJ3n9JFMogkmsirbF4BDdAkkZO2Ocga4uF
 AcM=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16742380"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 13:36:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 13:36:11 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 13:36:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617190571; x=1648726571;
  h=from:to:cc:subject:date:message-id;
  bh=X5Gmo/4ZuyeqnIOkoGKQMLD98RQXFlOM0T/todCgfX4=;
  b=jDPMc8Tz16rDGY2hIW7wv0Cl8HtoQloGLn2ZGebCA4KUv6xD7tVi00Q0
   bpXeBHdemRnWLAtX10u3BEWzr2lziBcB6kgyqefzsE40LXcXvctn5Vxbi
   FMLPrnJDz9qxzXVe4m93AC3+CxsD+19qUAKRgNCkuSkcz6xABgvHAPpKr
   2xlYQi53jWRQ8jQ1vS3myZxKhU6WhuINqCjRHAGcv78kYQrUv6CPT020m
   muV3jO6BtZ88TynkwkyewTEHYnpO74ewOU7cNXjqdbU2Ti28Z+QYekQC4
   AH3hWnsSxHcUBg9IJKoc2WhzC4NgRwQ4OHzzK6kWYgS6V+tXXiunMpZmi
   g==;
IronPort-SDR: z4lzFvsXXpZ2CqB61sfz2roATZXvfdKY2stu/02aH0emegtjwe2riikCScvstEOzt0aR2SI3P/
 YPiDtR3xNJhKbEo9BWTei5JBHODKf//r3Le5Lk7PD1OqgqkeM3N/1+OEtLtkeNI4woJIeF/u6h
 mRyVJOpovgwK4mthgRvKEJZd3G6V6Y2DLf5MrCsII5Kt05AZw0gVzt3CZpRJNsfgAi5kq9h7FX
 d51ZaUlnUMT+wSXfa3Us0eotV2EySJVGZxM7+UC6uJEvq93CWvP3VLBka+p9T3u75FuZXVhyad
 214=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16742379"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 13:36:11 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id C4CFA280070;
        Wed, 31 Mar 2021 13:36:10 +0200 (CEST)
X-CheckPoint: {60645E92-3-486672D-C0FA7804}
X-MAIL-CPID: EC9732B570E100E35CD847992BE1ACF9_2
X-Control-Analysis: str=0001.0A782F29.60645EAB.0011,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/3] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
Date:   Wed, 31 Mar 2021 13:35:44 +0200
Message-Id: <f38e80b6b439e4a9cc349a090923207865b3d3ed.1617189926.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver was registering IRQ 0 when no IRQ was set. This leads to
warnings with newer kernels.

Clear the resource flags, so no resource is registered at all in this
case.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/mfd/tqmx86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index ddddf08b6a4c..732013f40e4e 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -209,6 +209,8 @@ static int tqmx86_probe(struct platform_device *pdev)
 
 		/* Assumes the IRQ resource is first. */
 		tqmx_gpio_resources[0].start = gpio_irq;
+	} else {
+		tqmx_gpio_resources[0].flags = 0;
 	}
 
 	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
-- 
2.17.1

