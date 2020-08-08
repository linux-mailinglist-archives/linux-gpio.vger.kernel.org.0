Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE04A23F72F
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgHHKGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgHHKGU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:06:20 -0400
X-Greylist: delayed 366 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 08 Aug 2020 03:06:17 PDT
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D55CC061756
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:06:17 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4BNyQG6xwzzKmXM
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:06 +0200 (CEST)
Authentication-Results: spamfilter03.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=peiNovEDox7Xr0ucChHl56A1TaIfu5mdE/OnGI1oVDA=;
        b=tMoIjka3InEX1BZcSTfWepo+Ssw0FuZ0akAXlgZn1HODURC/9IW4v2K1cHm42znsxkLPj3
        idDFS6VQuU6nMjwntz0hvEZyeZFOqhZcc4we3epB3/A8CxdWdne4bhSjooOoINkyktujCH
        0OoutTc2IhPsN/EUU8VFR2Jztl1tsWKFncWj2QKK3TSBmUauNtM48YzAPNWS4dur9xBHaY
        zZxYO149pOHTyJP96WU95TxhLx3Gh8kQcdlRbTlJtd9V8hgxkBIKwKElD09VlurIhQYY70
        ie5qux7TB9QD0sIpODYPnb/JF1NH4DtiJsR2aAWOZ0wApu8em/ecrPmvwX7fAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:message-id:date:date
        :subject:subject:from:from:received; s=mail20150812; t=
        1596880801; bh=JRqIHSJcaFIczpCSiG/bag2bZxpQfi9qbsRychI1fPw=; b=B
        qnHcz98Qt0Sc6BaXh0OmGMZ62aZZNuWRbc1t710x+E/6RujvtzsQJT1L9Bl+bSgF
        OHPEMTG6dtld/prIOA7ZtWiE5t45fkKW+q6L5DcC/Vd9m0MveG70XKQnnMyqF2yl
        oFEt9AolJPuld187XvRXHAKHQYA7S2EMxjx0uBx8g+IAZq7KcYl3h56r1mB4D38U
        iakVg6lMiAPdVPTXgt1svSHpjKlhq0UMNR50cZjnz7+NKizKKyyPbY11FRlzZ568
        WMWz/o/byqCl8nv0l9WSNh6MWOt5EDklVoyTgE2Dv7X/mZPXsiheToa5b2xYJj5c
        9qLiZqqOYHHkfHCOfYuSw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id rsPkaFjWAgrn; Sat,  8 Aug 2020 12:00:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 0/5] Documentation improvements
Date:   Sat,  8 Aug 2020 11:59:39 +0200
Message-Id: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.75 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1B7B917A2
X-Rspamd-UID: dc9e87
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey,
this changeset improves the document generation by reducing warnings
as well as supporting building doc out of tree now.

Alexander Stein (5):
  doc: Fix doxygen warnings
  doc: Use autotoolized Doxyfile
  doc: Fix doxygen warning
  doc: Remove obsolete PERL_PATH
  doc: Add @file to headers

 .gitignore              |  1 +
 Doxyfile => Doxyfile.in |  8 ++++----
 Makefile.am             |  4 +---
 bindings/cxx/gpiod.hpp  |  6 +++++-
 configure.ac            |  1 +
 include/gpiod.h         | 30 +++++++++++++++++-------------
 6 files changed, 29 insertions(+), 21 deletions(-)
 rename Doxyfile => Doxyfile.in (93%)

-- 
2.28.0

