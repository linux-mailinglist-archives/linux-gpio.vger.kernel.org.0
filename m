Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582DF4A7E9C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349274AbiBCEWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:22:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEWy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:22:54 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD52CC061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:22:54 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so1693844pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5PVlIDuR32Yssny9V5o6RCbIPPLetL5jRcPV3axjBDM=;
        b=FadtJ/iFl9d1vXIsllvJHcQ+98hjYr/bfpo6nTZ7eZtoKfljaum6vBsyQAl/sgraaZ
         6kzgx7Y1tN2gCRdM7x9yaqb8etk8fKN+g56y01l9hf5pGW6czQ3T4bPmWDprqPxl0vqg
         Z37aH4Nm5L6Iy4cOUClrl8NFp8RzsaCAeiQUTHqPqtdXF/esXUADKYDbBzeYiQwXHj5b
         vBICaihYReDmX0cJ3c5IW5bJUFS8dzDXSqYZ/TVYNxFRGXFpP8QLox6uaoDPsTo9qtBm
         44uPxuL88TJVqxWFE/yP6T4F3zb6gvpgANWI4Wy8eAIXQDPtHgh0zsqNaIRVuFDYKkbR
         QQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5PVlIDuR32Yssny9V5o6RCbIPPLetL5jRcPV3axjBDM=;
        b=6TTr0rba7E/N8TENQcHqsXGEP/JdKms+tFYrZBuSggGFC1Uz1LGoBqnq4yg66pA9Ad
         b9Ky2VMVx/1BgTA5iBO3FpQa+UJZPnJnYBFau1oc8ZEO56o+e6b9pqgDHCMsYa7UoGpj
         l8ylNExHNafVeF23O25VyetjsyeQgIVq9irGDD9MXcB+ZohDg0Ws/5n7jDVWNX4Z8so3
         ydB6fiR5XF1LMQbRxkgwjPNGIW1hERe0xdOHPZkt2M8N8tUIKmcrUno3G3SWuBwYh4WV
         xHWb73BrXHn7zNGTDH1S7sHBe9FhEalZ+NNLpt+pVNujbZlYsmiM5ZHfEwKmUxbjAvPe
         aNYQ==
X-Gm-Message-State: AOAM533PJLt5fkdHvhBHC69cngRNQO2Pmhey6OH0ZZGRa+VLlco2fVc+
        aIM0NLQFp1AR5tnCNiHyYhE=
X-Google-Smtp-Source: ABdhPJzDyzOntRgxfZGjzfpNTZ4f1rNfATMaJydTkCGP7iQ/Vwud2/C3WFRnBoKj99iiR9Ih3/bXSA==
X-Received: by 2002:a17:90b:3803:: with SMTP id mq3mr11608899pjb.95.1643862174155;
        Wed, 02 Feb 2022 20:22:54 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:53 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 3/7] tools: Add value support to line name lookup
Date:   Thu,  3 Feb 2022 14:51:30 +1030
Message-Id: <20220203042134.68425-4-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for pasring the values as well as the name in
line_names_to_offsets.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 51 ++++++++++++++++++++++++++++++++++++++++++--
 tools/tools-common.h |  4 +++-
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 958933ed6d51..586577566790 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -204,15 +204,57 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 	return NULL;
 }
 
+char *split_line(const char *line_pair)
+{
+	char *name_end;
+	size_t name_len;
+	char *line_name;
+
+	name_end = strchr(line_pair, '=');
+	if (!name_end)
+		die("invalid name/value '%s'", line_pair);
+
+	name_len = name_end - line_pair;
+
+	if (name_len > 32)
+		die("line name exceeds maximum length");
+
+	line_name = calloc(1, name_len + 1);
+	strncpy(line_name, line_pair, name_len);
+
+	return line_name;
+}
+
 int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
-			  unsigned int *offsets, int num_lines)
+			  unsigned int *offsets,
+			  int *values,
+			  int num_lines)
 {
 	int i;
 
 	for (i = 0; i < num_lines; i++) {
-		const char *line_name = lines[i];
+		char *line_name;
+		int value;
 		int offset;
 
+		if (values) {
+			const char *line_pair = lines[i];
+			char *name_end;
+			int rv;
+
+			line_name = split_line(line_pair);
+			name_end = strchr(line_pair, '=');
+
+			rv = sscanf(name_end, "=%d", &value);
+			if (rv != 1)
+				die("invalid offset<->value mapping: %s", line_pair);
+
+			if (value != 0 && value != 1)
+				die("value must be 0 or 1: %s", line_pair);
+		} else {
+			line_name = lines[i];
+		}
+
 		offset = gpiod_chip_find_line(chip, line_name);
 
 		if (offset < 0) {
@@ -222,6 +264,11 @@ int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
 		}
 
 		offsets[i] = offset;
+
+		if (values) {
+			values[i] = value;
+			free(line_name);
+		}
 	}
 
 	return 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 7affea436a60..723999011733 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -33,6 +33,8 @@ struct gpiod_chip *chip_open_by_name(const char *name);
 struct gpiod_chip *chip_open_lookup(const char *device);
 struct gpiod_chip *chip_by_line_name(const char *name);
 int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
-			  unsigned int *offsets, int num_lines);
+			  unsigned int *offsets, int *values,
+			  int num_lines);
+char *split_line(const char *line_pair);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.34.1

