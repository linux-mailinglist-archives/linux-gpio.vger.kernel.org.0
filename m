Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16142FE05F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfKOOoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:54 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42869 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfKOOoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:54 -0500
Received: by mail-pg1-f193.google.com with SMTP id q17so6108213pgt.9
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWFx3vvIX40wyYZAJG5zTznAtpZfnJmh/j1kpvQhfr0=;
        b=A01PCWqBBBSFvbC4JCMs5AZX7tZXuWzzbTlCqb/LkF7fDYZkWbecy06Ex/RqdrzyCs
         ISIjiIGNU2gc56cn/ZCKBtRg5jYhF4+z4vtkrLYzjzb0QP7gH7bX9ZlaSuJs+6iPLrrI
         yFkMpCgFJ0Mz8lIA0pmJdp9o7wTVOqBB6FomHhTyVveIU0E3SRN1/RjxPB+Whc81ziN5
         Mhw6iveBHcYZlDpVifpRQUUslTmTWM7IpaoKA+zzWkY2lmt+5rkC2b/UbTJZoDRTt6XC
         3c0HsDRxZs8vMJcLx2jjf8LOblUZYPA1oToKD/VEfBiuqqE9DeCIYZQXUqMy+qJfxswE
         nccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWFx3vvIX40wyYZAJG5zTznAtpZfnJmh/j1kpvQhfr0=;
        b=VMSLN4sPrge2kZIWFnkyEUKPjCb/O4jmNGjn7qoy/JezFwcwG79tBDqPvBFegnV+aY
         7oekeinnrCayf3DM0eAqzNOuEAOSHz4/3P/X7JgYOfC65LJ9tNClnuoOlwjb43Oe/yvQ
         KY+JSv7SbcKjinvEHTbTu+z/EdU/yQ+1KF1xdNS+9hprrB5Py9QjmiI19t/UHhHZooDr
         DoXVmZv3+5TrpG9o7DgybyD+5OnzN2tlFSOdeYk4qZYroyhIp17zB+Fgw3zQ1M8VKH7t
         ppGjKEolAADGid6DpQ7FxPJyKeeLWebt5dGZM83h13dzHlJw3vXmlQQPM2jLcs5r12bn
         Ra3Q==
X-Gm-Message-State: APjAAAVBlga2E0sWvj0GhGNaeoLP6gL6NKUCrY+zcrGG+G/HrPUtpWxN
        I4zKGQEiWihgncZxLkHG0IZVW0Ln+Ok=
X-Google-Smtp-Source: APXvYqyTH24LKAdMS2yNjrUikA6QDJ0z10P6CPbvv9Ov9QHjii0uVpLJcQGXcabIBexTcSTLFxNeDg==
X-Received: by 2002:a63:154e:: with SMTP id 14mr16411912pgv.182.1573829093567;
        Fri, 15 Nov 2019 06:44:53 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:53 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 05/19] bindings: cxx: drop noexcept from direction and active_state
Date:   Fri, 15 Nov 2019 22:43:41 +0800
Message-Id: <20191115144355.975-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Both direction and active_state methods can throw and so should not be
declared as noexcept.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/gpiod.hpp | 4 ++--
 bindings/cxx/line.cpp  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 13b4d5b..b5a9401 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -312,13 +312,13 @@ public:
 	 * @brief Get current direction of this line.
 	 * @return Current direction setting.
 	 */
-	GPIOD_API int direction(void) const noexcept;
+	GPIOD_API int direction(void) const;
 
 	/**
 	 * @brief Get current active state of this line.
 	 * @return Current active state setting.
 	 */
-	GPIOD_API int active_state(void) const noexcept;
+	GPIOD_API int active_state(void) const;
 
 	/**
 	 * @brief Check if this line is used by the kernel or other user space
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index b698960..df6eada 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -49,7 +49,7 @@ unsigned int line::offset(void) const
 	return consumer ? ::std::string(consumer) : ::std::string();
 }
 
-int line::direction(void) const noexcept
+int line::direction(void) const
 {
 	this->throw_if_null();
 
@@ -58,7 +58,7 @@ int line::direction(void) const noexcept
 	return dir == GPIOD_LINE_DIRECTION_INPUT ? DIRECTION_INPUT : DIRECTION_OUTPUT;
 }
 
-int line::active_state(void) const noexcept
+int line::active_state(void) const
 {
 	this->throw_if_null();
 
-- 
2.24.0

