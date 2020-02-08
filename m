Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4DF1563B8
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 11:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgBHKBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 05:01:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40504 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgBHKBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 05:01:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id t3so1700686wru.7
        for <linux-gpio@vger.kernel.org>; Sat, 08 Feb 2020 02:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CBVshpg4jChzphHIrEQ7PQcItNdAVR/Qn1gHCmEArzE=;
        b=EQeyNEL3xnqK06qhvPSWoO29ennBYzKN4Y3ZoB6daXQQElk3H6hS6hm9ZMcSc+pvNU
         RqhQ/4/FiqTN/XixQJb8OVpdFhCw2f2rvtWHmz8DxFwf0LxFm6sVOwGTBZiMi2p6/k6O
         sRVGdAYpwnH3H0wz3i1lOavuPykbjoDZCNq+78cbmisatpU1+DNnQZJZHIdtf13R8diV
         SlckUUAvMPgnqm6x3oVMkTK75u1RfI9WBvbaDwGsmXjSB9LaWzb6fgz5L/zmp8GkISih
         /8ekA6+RBAXGs7UBCUEjkPVH7vJy6NodS3AhF2znZOG4o67p5/LOc/y7rlYZ6UIRPAO9
         vaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CBVshpg4jChzphHIrEQ7PQcItNdAVR/Qn1gHCmEArzE=;
        b=d6638hK4BARfK2TB8fz9UlQX5DjZZSge5/X1LAi4chDRgEQKKXIt0BF+fE3VV2CPrF
         y4OU5/Cxt0f49zMj8TVI8vQIjB7b3jZ8TQoJVS33sRKk2JF+wj5fk62qD2A1llDHBoPs
         mavurNLrr2/SVVqK6C2q9B9e3hng1YsIX2RX+wGCiZcYuHSCTvL188zg7Un9mwfEGyVS
         dyE+IdCMTEprCpQ0JXcpD/r8VGADW2HRoHJ2l+/GsOejGnO/h1m9pS0lGdMGeYiQHXef
         gfC/Pc/SWjtISUureidyZT7aGRupbuLMlrQ+ZJlB/Wc/Oy8H1+XgxQ87VeVSFX2C2tSu
         r6bw==
X-Gm-Message-State: APjAAAXsef+VpE4gws5FT3UeR6siLYL9OQpU+4wcqdrvKzNGZGNGepgm
        nCrViuhqkaPfXUN3vq3H+w159vz9
X-Google-Smtp-Source: APXvYqxsfUrnePB+bcuq3e2NNVn0swI/qHa0etxV55f69MFCeqlev5daib7ryClub8lalBr8AoIneA==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr1364587wrt.94.1581156088879;
        Sat, 08 Feb 2020 02:01:28 -0800 (PST)
Received: from LinuxLab.ger.corp.intel.com (DSL217-132-44-191.bb.netvision.net.il. [217.132.44.191])
        by smtp.gmail.com with ESMTPSA id d22sm6937790wmd.39.2020.02.08.02.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 02:01:28 -0800 (PST)
From:   Daniel Mor <dmlinuxnewbie@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Daniel Mor <dmlinuxnewbie@gmail.com>
Subject: [PATCH 2/2] core: Removing unnecessary check for monitoring multiple lines.
Date:   Sat,  8 Feb 2020 12:01:29 +0200
Message-Id: <20200208100129.10657-1-dmlinuxnewbie@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case when needed to monitor multiple line`s on different chip`s
function gpiod_line_event_wait_bulk() blocking it, by checking if
the line`s in a bulk from same chip.
In current state the API forsing the user to wait for notification on multiple threads.

Signed-off-by: Daniel Mor <dmlinuxnewbie@gmail.com>
---
 lib/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/core.c b/lib/core.c
index ed63012..2a46074 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -977,7 +977,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 	struct gpiod_line *line;
 	int rv;
 
-	if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
+	if (!line_bulk_all_requested(bulk))
 		return -1;
 
 	memset(fds, 0, sizeof(fds));
-- 
2.17.1

