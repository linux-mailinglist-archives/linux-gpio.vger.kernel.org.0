Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDB123F732
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgHHKGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgHHKGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:06:38 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF57C061756
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:06:38 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BNyQJ6Hw1zKmmF
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:08 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ebkz9HY2k1O84TBrUWLSdj29jQXtfX78lxQCjd9HEyQ=;
        b=ex3z5ul/5p+6K3nX7UalF0czrAm/bhaOpt0vI2X3rK+egeHu3GcQ3kyBqi9LBWxOUKGII7
        nkKMcIW/9AgiicqfCh9eX/pitoBNLbCnbaBr24MARgHtNLZYATkclBJLN7MGNxkK+yK8aP
        2D7WRhS3wht6OTgmQpieeknsuXqBj5sLgvzy/iUJW1QKgZtlzfeOFgm4eYHq9781luUxze
        SydnzAffbxllaqHoOTa6XIrYD32YmAGcR/5RexJIBVxVprvy9xeUjtbPDLkE56wUbAP03Q
        vMO2VFW+qvdMj1cPJ3FaWgZb1gAr1nERsqBsjmdi4ywkxM4YZARqAh0ubzMb+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1596880806; bh=LjU3/3w32k9PzesNwFOpif+OQ5RFkqqXD
        aUmBPRRhHg=; b=u7seneVDKltlLLTGZkF4Pd+aWZELMLF+oSuVMsDATPrN+Wl2i
        jonJYBFXKPHdMXCcXe+jRoNuSlXAbLfEXQ528N23HkvtUgllXY/J/yhHxNT2bpWk
        wbzCr5LBLe4C7nwZUW8QPcKsu7/qxblZ0UJwDz+cVN4ATREGKpUXeHtrNElRC1Ao
        ok8/41XHl+vNmU4Hi3eZnuHvL1zBeOEuyLcGdFfWI0JyViruxy8WQPQDZr5v4C68
        Px+ymgZ6G20kEWkj0Fg9PwKQZFZBr/4JJKLZtWNyzC0rz42DMqg/blhRjyGMIDIA
        X0ywYO9MWjlP9Hz5nlOIWUzti8uHOx6DOJZoA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id zBBdhvHhPBwp; Sat,  8 Aug 2020 12:00:06 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 4/5] doc: Remove obsolete PERL_PATH
Date:   Sat,  8 Aug 2020 11:59:43 +0200
Message-Id: <20200808095944.188479-5-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.67 / 15.00 / 15.00
X-Rspamd-Queue-Id: 052CF17AA
X-Rspamd-UID: 61b716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes the warning:
warning: Tag 'PERL_PATH' at line 110 of file 'Doxyfile' has become obsolete.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 Doxyfile.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Doxyfile.in b/Doxyfile.in
index 813ab31..4abad2d 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -107,4 +107,3 @@ GENERATE_XML           = YES
 TAGFILES               =
 GENERATE_TAGFILE       =
 ALLEXTERNALS           = NO
-PERL_PATH              =
-- 
2.28.0

