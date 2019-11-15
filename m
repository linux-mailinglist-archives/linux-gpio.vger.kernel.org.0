Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93788FE059
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfKOOo3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38962 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfKOOo3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:29 -0500
Received: by mail-pl1-f193.google.com with SMTP id o9so4804728plk.6
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mvD88vYNW9HnvaEhfDiwyXuHVQ3vHAbyWxIkK5B1PWY=;
        b=JbEdmQCCnosYsvpePNldn6WuujZmGEVdlXV9wksphmNxo0/kGrSBAdjaH7FprJPhPA
         keIV7zCgfjbNjnaDgWXknLLagUrZ+H3vOst5llm6hE2g9bIki9Oq/3jBxTtEF8dbJMVC
         koKA7FfWRRM65JMzYWjNeo4IB2VfYRFo8MKMf720GkxvA9z4CXDVTNQdfyhjo2MTIhOV
         cUGqgHGVZdSfEI2Z8b+p5pPAvttLYsBclk0y2VINKzCdfF9LzqqZcSKLf9+/zVsj1rG+
         l+1a5wGtc9I/T2i9PaW0RxJ0Q9i4s5ndqM7PNsVdjFAvfl2VgceVv5p/WUm6stEoZyg+
         iCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mvD88vYNW9HnvaEhfDiwyXuHVQ3vHAbyWxIkK5B1PWY=;
        b=aiRffpujvwEQhljZ4CC1p9OkZcpQWpluvp22QbaUvf7No4yMYAYnyhGlwP3LDZsZfX
         ETlojvlY92oGCNbfSnGoA1z2ctux3lY5Or3wWvMBjhiNfJfLk/G3kQBm5hMvMIjF/FO5
         1IKW5Usi7X/uYv8F1WKgPwwjyI8TO7oFIMLqfT5RgHwUT7C3j4qheftMbZD97MY2hiVo
         tOy3QE0Eo3YrJVyDXBn/jkMlnTVVi2Xnc4Y+h9WwQCtvfJUY2i+mhfGsGxUDPzqOH/ho
         frQxf1S/l2JMK+QkF7WRL7imueT8qMiW6dpsh/QcHUq2rucStRCupDISmmWxQ/LodLgx
         v/zA==
X-Gm-Message-State: APjAAAU7VnKchNTYH9Se7ZBGwISKsqWdSkYpRdPiSMGZ3cULoLhvHzSq
        gDTHBtmQFnqf6/0ajPIjJwticaCwrWw=
X-Google-Smtp-Source: APXvYqzgf09mTuEvHEM4FNAItMVoWVkLABW8SNoF3vCTCwQz6Yzt8kdm9tx1MmeGSmjs+UfyuQ0OBQ==
X-Received: by 2002:a17:902:8d81:: with SMTP id v1mr12196844plo.289.1573829068580;
        Fri, 15 Nov 2019 06:44:28 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:28 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 01/19] core: move request flag to handle flag conversion into a separate function
Date:   Fri, 15 Nov 2019 22:43:37 +0800
Message-Id: <20191115144355.975-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move common conversion code from line_request_values and
line_request_event_single into a separate function to simplify adding
additional flags.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/core.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index a04514e..f05e595 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -463,6 +463,20 @@ static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
 	return true;
 }
 
+static __u32 line_request_flag_to_gpio_handleflag(int flags)
+{
+	int hflags = 0;
+
+	if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
+		hflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
+		hflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+	if (flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
+		hflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+
+	return hflags;
+}
+
 static int line_request_values(struct gpiod_line_bulk *bulk,
 			       const struct gpiod_line_request_config *config,
 			       const int *default_vals)
@@ -488,19 +502,14 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 
 	memset(&req, 0, sizeof(req));
 
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
-		req.flags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
-		req.flags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
-		req.flags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+	req.lines = gpiod_line_bulk_num_lines(bulk);
+	req.flags = line_request_flag_to_gpio_handleflag(config->flags);
 
 	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
 		req.flags |= GPIOHANDLE_REQUEST_INPUT;
 	else if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
 		req.flags |= GPIOHANDLE_REQUEST_OUTPUT;
 
-	req.lines = gpiod_line_bulk_num_lines(bulk);
 
 	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
 		req.lineoffsets[i] = gpiod_line_offset(line);
@@ -548,15 +557,9 @@ static int line_request_event_single(struct gpiod_line *line,
 			sizeof(req.consumer_label) - 1);
 
 	req.lineoffset = gpiod_line_offset(line);
+	req.handleflags = line_request_flag_to_gpio_handleflag(config->flags);
 	req.handleflags |= GPIOHANDLE_REQUEST_INPUT;
 
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN)
-		req.handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
-		req.handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
-		req.handleflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
-
 	if (config->request_type == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
 		req.eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
 	else if (config->request_type == GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE)
-- 
2.24.0

