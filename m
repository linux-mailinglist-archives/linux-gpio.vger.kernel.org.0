Return-Path: <linux-gpio+bounces-9491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB23967036
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C35E91F2334D
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 07:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FE016EBE6;
	Sat, 31 Aug 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1ND3IHN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C813A885
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725090751; cv=none; b=SrVD85+oE1cAVLt3Tq8g3c4C0cPqh+XMk56ghuADnIrGjBiSUVqpViCZiPisoZhAPJv8i04UFIZcF9Bu80p7DpizkqmZLMgmPp5pOh+q8UpNiGXVCecddulUK6mNNXEqko14OZAvcERPkFKLnx1eCvPWEuAawwvj9papbEul5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725090751; c=relaxed/simple;
	bh=AVvt57Z0sxrj4s1bCCfPtoY7eOlx6IexIbRFZ7lRcYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tBsBVx/1xCD7ORBWoOv6mfVMc48PjRgp9S89U1i7/XAgSNdkfklU/J5hYDZ4NrTVa7W5hskd7Isg1fzVHcPuLuGPFq6A5ahkaK75gsjNt46hXpjvz1Up/GMt2LjigvzGWalrzkh+RwBVZBAbwrwaBNTrlrYmrJ3FDa3jAFrS79k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1ND3IHN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-715c160e231so2222715b3a.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725090748; x=1725695548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtkkygVLjjrRxbM3vqt+WmM8hPWt/sjXJrM4oxyp8+s=;
        b=H1ND3IHN4H2nCKoZBDc4PlaX4dw0fESMETAoq5w6wo3g45yQB1nY4uRChXO6I8jdFx
         E9SSu3BQOSPpWur0RxAg9PyMtQEVShW+WQl4EeWBxgDnDhfptpH4fX1kSGCXl7TFPQGh
         JrLskPG5mxwkWEmQsG4JVYXZ3uiAj2mq78lF00/VcfGhIsgiAja9QhYov1Q+kJxOqagp
         q7Ef8JaB4bgHpnXW6LBfMtC02dZ5CokGr2zV9uccUmb13O8ZANkisbYrrVgrLL7vvsNd
         9ePdCC9yOl206XlBlfWg2dA/v4BgdS69AFsPyE/1MOEWJCKtxh5VqFgK++pCfGlVenWU
         o60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725090748; x=1725695548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtkkygVLjjrRxbM3vqt+WmM8hPWt/sjXJrM4oxyp8+s=;
        b=q40ts7K7CEhr2+94t9TjugQHXvOh4rQw/nF1XgpYofu6Fk9HqaSEL9X5mGqRLbWo8G
         /hpu7vp5rrTXwXpQehoC5HSGosGX/kyHltVkLOw8qtpCOQvzvRrUHCeNA6aYTr8oh54S
         tDBhqDE4eNThTncbIfohfezRXbMuBYrcESIW78UIcD4JCLANYZUKEoW4pKgVuL+h06xp
         JF3n7Cp3YMvyUqwmMwNTbHlnYAq0hYSRGvdHO85uZBBCPepSfK48FSTY4TdbIUBde9Sl
         uilVMlT+ScGWpZ/kDb2DPW35VKtFlnyGlUorixFWHTU7wAuewpXp0YkNr/lf5XbREqPO
         bHsg==
X-Gm-Message-State: AOJu0YyiuDpvmPpOcHhh8WESJ+xj48ZDrdTurYJ61Vfjm17EJg9NQ7XH
	1wtC9D831Wfyid7fL/bOBbvq+7yOFdP7nMxW6tkwkM48QvVnYcdMyfy1wQ==
X-Google-Smtp-Source: AGHT+IHN0R1sQEy251SS7pBPOl5Nf4vVlMjCK03kIULfJZrtHOkDNpNUO2bhq/iq2d8WndAELt/KkQ==
X-Received: by 2002:a05:6a00:3c86:b0:710:4d08:e094 with SMTP id d2e1a72fcca58-715dfba79c7mr10477130b3a.2.1725090747980;
        Sat, 31 Aug 2024 00:52:27 -0700 (PDT)
Received: from rigel.home.arpa ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56e5c14sm3983205b3a.151.2024.08.31.00.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 00:52:27 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] build: fix HAS_GI_DOCGEN never defined error
Date: Sat, 31 Aug 2024 15:52:12 +0800
Message-Id: <20240831075212.147812-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building without --enable-bindings-glib configure reports this error:

  ...
  checking for help2man... true
  checking that generated files are newer than configure... done
  configure: error: conditional "HAS_GI_DOCGEN" was never defined.
  Usually this means the macro was only invoked conditionally.
  make: *** [Makefile:440: config.status] Error 1

Move the initialization of HAS_GI_DOCGEN outside the conditional
with_bindings_glib section so it is always initialized.

Fixes: e090088c21b7 ("bindings: add GLib bindings")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Sorry about the resend - forgot the libgpiod prefix on the first try :(.

 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cbe9e13..1ac1002 100644
--- a/configure.ac
+++ b/configure.ac
@@ -267,12 +267,12 @@ then
 		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
 
 	AC_CHECK_PROG([has_gi_docgen], [gi-docgen], [true], [false])
-	AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
 	if test "x$has_gi_docgen" = xfalse
 	then
 		AC_MSG_NOTICE([gi-docgen not found - GLib documentation cannot be generated])
 	fi
 fi
+AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
 
 # GObject-introspection
 found_introspection=no
-- 
2.39.2


