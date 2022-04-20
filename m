Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EA15085DB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Apr 2022 12:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239572AbiDTK3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 06:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiDTK3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 06:29:47 -0400
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609C63D1EF
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=Z+mtptRTKOxUPhvfIqN2ga5JJmQOw3p7T1z2ixqrXbk=; b=sr
        EiiTSSvhb+QBIkfcRCmW675/vCfDA81rJQvOI6sTeWLypNPE+vz/SZeKo0w9ySCZOhzZWqea7F3B/
        c5ph5lmMBF/ZDefFDFXCGbYnCOh8t5Iay5CRnDBJ2KwD1HC3kXfslSk2F5k5poHVhitFtJQP9Y9xH
        m7+yrEHNy/k7RyWSM4i7cLwAhmqvN/UvHOiI6aG+EzuAaO42URGEEQfnibzmT5AbAO70KeFu13gpb
        LpgXzw8d57iyJcrQMQIR48yDJGVTy08VvZtgSc2dIT2/8wm4tWCfOwt4HtPAjWs2+S9hl+o+HFqZ3
        XXq1J6yggzrY2fb4nrLEtFpmn+JqqSXw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1nh7Y3-0007uC-2t; Wed, 20 Apr 2022 11:26:59 +0100
From:   John Keeping <john@metanate.com>
To:     linux-gpio@vger.kernel.org
Cc:     John Keeping <john@metanate.com>
Subject: [libgpiod] [PATCH] gpioinfo: don't crash after EACCESS
Date:   Wed, 20 Apr 2022 11:26:53 +0100
Message-Id: <20220420102653.3477176-1-john@metanate.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If chip_open_by_name() fails then EACCESS is not treated as a fatal
error, but falling through calls list_lines(NULL) which leads to a
segfault.  Move on to the next chip in this instance.

Signed-off-by: John Keeping <john@metanate.com>
---
 tools/gpioinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index d50af45..542a881 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -226,6 +226,9 @@ int main(int argc, char **argv)
 				else
 					die_perror("unable to open %s",
 						   entries[i]->d_name);
+
+				free(entries[i]);
+				continue;
 			}
 
 			list_lines(chip);
-- 
2.35.3

