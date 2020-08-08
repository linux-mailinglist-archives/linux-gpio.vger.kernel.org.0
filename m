Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A25323F730
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgHHKGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgHHKGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:06:38 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07845C061756
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:06:37 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BNyQJ5JN9zKmTV
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:08 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8+gLN/gdN2uwfZ6qrYoBtS0wfS1575iXb0EuFttOvE=;
        b=sxb+AZjQkz2eNfvXxZitSwm3sXRWB21Wf0m77GnAB7e6O3bQ+30E+wvoBOVNlBlbYKBnW3
        xszxJnaL4qAKs4XS2FLZ5OsG4uPd7QoVCSGL1onzpdMlKO5YbGwNVlrcNcEUObk+qt9Knv
        BNPOS8m/qknZI/6PmIUMDpRtpp0B0WuPbnb/qU375yro5FTIQoVEtzLPEyIt5ksHvDHvWK
        d3EGnFwi2WLQLgQ96EJhhIHzVQEoMJau0rgqAeCZhEOdEwnhSG8+OwP8dDWUU/z7JHJIu0
        a63FwHgWTz9n9theF8OUYBA6Msm14jQNegeDikHmlPTyAAspOnM+E5Jtrc1RWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1596880806; bh=6IuW3QAarK45Ye9np9TfdLagimv9nMDQw
        AagzmcSwWY=; b=Hd2mcJhkDWvVh7WLjRDejQ1nn3oEB4L4CktMvkpl90AGbKjez
        sf+pjDCrgMcubONlCi1UKaFipxjpz3inBJeN9lBaexKuwDJrAzSkVojdwEX67TC3
        C5Z5ql4k6W032U8vODY6bjoQOhw17pUkfdab/xtjixYOIvH3xj8cL/PHcYNgmNon
        HcGbm5e1M9lYBGSUnwmQfrf81PHdzg096UevhJBmJanPGDPvyuQ+DB6quA/qmIAq
        ArFzyw0oF4Fh22AmoMZaH/PsCNaPxN8vlRHZimmO0oOQQ558xBuiFSbkcDJEfOpx
        cKmjhndNjYPHNHkkrEISCgNUsDoFVZFAdxRXQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id LyDfOgxoBpS1; Sat,  8 Aug 2020 12:00:06 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 3/5] doc: Fix doxygen warning
Date:   Sat,  8 Aug 2020 11:59:42 +0200
Message-Id: <20200808095944.188479-4-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.67 / 15.00 / 15.00
X-Rspamd-Queue-Id: E31C417B5
X-Rspamd-UID: bc3096
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes the warning
warning: argument 'a4wide' for option PAPER_TYPE is not a valid enum value
Using the default: a4!

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 Doxyfile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Doxyfile.in b/Doxyfile.in
index 8c6d591..813ab31 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -79,7 +79,7 @@ TREEVIEW_WIDTH         = 250
 GENERATE_LATEX         = NO
 LATEX_OUTPUT           =
 COMPACT_LATEX          = NO
-PAPER_TYPE             = a4wide
+PAPER_TYPE             = a4
 EXTRA_PACKAGES         =
 LATEX_HEADER           =
 PDF_HYPERLINKS         = NO
-- 
2.28.0

