Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E2C4A7E9B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245287AbiBCEWv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:22:51 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CB9C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:22:51 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id y5-20020a17090aca8500b001b8127e3d3aso1664198pjt.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnBAgxMF4MgLnVIaS9TWikI68gd/15PA6woV2819bEg=;
        b=NXeNBpuY04a8npxta5oEQmVE5smwM8KltFF6I5MAvm2qP2jA7mwH1Gb15SNX/W3+A8
         czroPPf8HU9oUnK63ir0BFzuwoHArOebq+P0ow02ooMft6h2SL4OA9R9JC7sIM/OKFGn
         aMxpq4/hla5w8old/tZAY80Na7mdwQH+pxErTd/LraQZnTyJKLrORL83e7snhtavrFF5
         em0ZgvqAuE7oaamVPZ1L4kVUhs2tPd9AdwYLm6BLwZVJRJ/OVG8clDPyHeQK90ea7GCX
         zbyvKFMLps1AwtUjeDjK36GvqJxOufhv4bocOqUnOAlhd9eJVYj1RCmcgpF+tiBpWjDt
         jJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SnBAgxMF4MgLnVIaS9TWikI68gd/15PA6woV2819bEg=;
        b=T1pVWtLHV6vKIuk5FO1UFdeJ0Rw/LTuBJGC2sq+cBQjVNAo94t9sjLwaZan2dTFIvP
         3yRQ8luLysAfyRmbD5I5jH+sV7690IunrgcNwjiZ7f3v+sKZ2BtQrWV39xDVLIzAi1Gv
         dL5acLKvkukglKUKRkVPBFkMAc4CpYAOq6uQdovJIr0CPi9s9lid/gdu5B5Z57zrRotW
         Y9xyvzr2Sr90gBitY6Ma20dSLP8k3LqZpEx+LUjG7sI//3jrf73R3iqdrkMoTPnA4Z40
         +FEcFvjam1zGNrwaWo0HhQsYHRVQnher1hrXahyUZ5YMPb7K8o00aqXD34WeYpjoXauA
         Oe6w==
X-Gm-Message-State: AOAM533BDe7HBT7Tj8USis9V6So07PJHX2xyxELtazcAwvqZ/m3oWMvi
        E2H5uIUZn7ThJ4GUYGg14DFUMytaUDs=
X-Google-Smtp-Source: ABdhPJxBUONJKszju+J0cZEdM//IG/OI20cjBPN1UeWhb2xMSAkZxBNCBdYvYpWI+K3DiX7532Bmaw==
X-Received: by 2002:a17:90a:f485:: with SMTP id bx5mr11813812pjb.46.1643862170963;
        Wed, 02 Feb 2022 20:22:50 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:50 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 2/7] tools: Add line name to offset lookup helper
Date:   Thu,  3 Feb 2022 14:51:29 +1030
Message-Id: <20220203042134.68425-3-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

line_names_to_offsets to be used by tools that support --by-name.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 22 ++++++++++++++++++++++
 tools/tools-common.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index c83e68a2c1e4..958933ed6d51 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -204,3 +204,25 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 	return NULL;
 }
 
+int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
+			  unsigned int *offsets, int num_lines)
+{
+	int i;
+
+	for (i = 0; i < num_lines; i++) {
+		const char *line_name = lines[i];
+		int offset;
+
+		offset = gpiod_chip_find_line(chip, line_name);
+
+		if (offset < 0) {
+			die("chip '%s' does not contain line '%s'",
+					gpiod_chip_get_name(chip),
+					line_name);
+		}
+
+		offsets[i] = offset;
+	}
+
+	return 0;
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 5ed37dc05885..7affea436a60 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -32,5 +32,7 @@ int chip_dir_filter(const struct dirent *entry);
 struct gpiod_chip *chip_open_by_name(const char *name);
 struct gpiod_chip *chip_open_lookup(const char *device);
 struct gpiod_chip *chip_by_line_name(const char *name);
+int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
+			  unsigned int *offsets, int num_lines);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.34.1

