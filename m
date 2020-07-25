Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C03822D4B6
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgGYEWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B255C0619D3;
        Fri, 24 Jul 2020 21:22:14 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z3so6316468pfn.12;
        Fri, 24 Jul 2020 21:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZrC5d6GycMgVi9AFYTkFIBTlZXSjyyVnreOAq7rrP6g=;
        b=jiPfLsglmAMSKgrzjL7sOB+ODQ1J/HDhDuSceVY54xquJWC7at8lFA9pOnRJLQ602w
         L2Lp2EbTdY95wDWAkBq7BPr7ev88Si2/4laDRE6ZtYjbZ8AYZE3fNA6abrcWFfANr3tm
         4EYgbpLCDacBWa6CYoFoY+tIqFKdw+/wf6ZIs8dciEPEwmzFEodlaXYyPb/M/LJBnp70
         o0kXhqYHy2u0tbv4qk941UVGKvPwaOooS6/9RgMNqnrKUy5IPB5+dVcskfyAdPh8kYYz
         VW1qR8f9zWOknchuwqKzk6WvV+yQTdWXmdRW/cM+s0GfqJ/HInZnYMD4nMOTdkXUtzuh
         CziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZrC5d6GycMgVi9AFYTkFIBTlZXSjyyVnreOAq7rrP6g=;
        b=JFCY1A/X41Boo7FZwUJoz5NHNQtwvZhz+lNkD3aFYHpwC7QnK5pgQt3OzMAYNxegau
         zWuTiFCMECmk8OveyzsjDeavhLdfpCZqVFPwT4xzSckhhummOqLE5/omAUjdF5567E5u
         JavE9DoB6nc+GbMIEHLAl/xajvt0zkdCx22Lmw/XSHNK/OZpUJEFe2FHVtnjZwO1rutQ
         T8YTP9GgmqEO+rjA9KImn3zR7JWS8i2X/xTMMhzboyrv5fbNm9APTEsYCkF9G1JVk8b/
         v1vQ7sBvqJaBUwhx3wIQSl9h6iTXGYyHceKdgWz1RfnhpWH0Z3jxYFUmnHlp05w6MPcT
         YUMg==
X-Gm-Message-State: AOAM533UBZWhlZbRMVXY4ajcYZPbKWlRY0C0869dMYY3fSOX7fRF8lN0
        f+zJ7kNbwE0juYNmPStzl88Aj8ld
X-Google-Smtp-Source: ABdhPJwYOCakqDGUK0WP3Zlg+zdG4454vHh0wTbpGIGAml+Wuq0yIAehDBVF2cV13VC8A3If93OJHQ==
X-Received: by 2002:aa7:988f:: with SMTP id r15mr11646992pfl.2.1595650933249;
        Fri, 24 Jul 2020 21:22:13 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:12 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 11/18] gpio: uapi: document uAPI v1 as deprecated
Date:   Sat, 25 Jul 2020 12:19:48 +0800
Message-Id: <20200725041955.9985-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update uAPI documentation to deprecate v1 structs and ioctls.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/uapi/linux/gpio.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 3f6db33014f0..92a74c245534 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -278,6 +278,9 @@ struct gpioline_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version if the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -301,6 +304,9 @@ struct gpioline_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_info_v2 instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -325,6 +331,9 @@ struct gpioline_info {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_info_changed_v2 instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -364,6 +373,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -383,6 +395,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -395,6 +410,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -418,6 +436,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -437,6 +458,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct part of ABI v1 and is deprecated.
+ * Use struct gpioline_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -461,6 +485,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.27.0

