Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5198262D18
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbgIIK2j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbgIIK23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:29 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435EDC061786;
        Wed,  9 Sep 2020 03:28:29 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so1772262pgl.2;
        Wed, 09 Sep 2020 03:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iCG3DHPkrfCdnS0ROdlbfM8O23WmFPNngL08pxdvjqU=;
        b=KiNrybCpcgMU8JEifyjCWXpA+lmEBDhNmI07rgMgOw75m1EJPlk3c0RhBm/RArAt/0
         upHkwFI0gsgpIpeQ+9J48vOY55gQFvJxog9VGzd2S0FvM3KmRJ2RBFCm1SMoqMhkjszx
         pG4KHSDx8JlEMNYt4zVeaGnfWJRULXKu/iZS465uhX/RAwu0Aa1LG0L9H/bc87YFLUg4
         vgmcXNrgpj92gwZ/rh5zog0htrrb5rFoMBHbsvEAhtOE4N0vYOf/Jz3zs9Vn1RZ6aPcU
         Z2Ae/zAr3KTCxUqaZTrtsGGZuvl4QKVU6KAC4zV552PoDFRSjKYIDxVa0rMAB4v7udOF
         q8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iCG3DHPkrfCdnS0ROdlbfM8O23WmFPNngL08pxdvjqU=;
        b=fNt2wNqVC6e+MixNL05qrM4so5/+5COYYk8ShMgg4Fs0BVULvBMm8564JRIO2Mpnav
         h/pASkQZ6W+8zlOyjsL99KEfmtLBn+C/CEeQXIt4my6g3amnFCZVtl2i/oI/ABETW+yB
         GrN8mvkKU6g8wYuFd86zotQSOH0SrlcKEDMhjAalysHSiwqNLDsKngz1XX9kJqolOJWI
         fQ6W/AokLyl9qE/UlN4QFoZWS0BPrOMJnI0fBnJDa320BbooHNd8CnhE5+59w0sJgov7
         J/+mOtYk1pJboKiyeoOomcAvF5sHAynjwvlO3wB/mNdusG6S+ij3xNETWtsk05tRmo6F
         rnlw==
X-Gm-Message-State: AOAM533wZ0lYonqh3Sm1MjI/IJ9/KriZMvKjJrkxjpnsBps1kzPGP932
        SELWuPyv5S1+84OcCeUG41aERyvexbU=
X-Google-Smtp-Source: ABdhPJxAXZtX0Ln/lSZH1D2yKsTGMb4cipyiodeao5yJamBYk+BtyeODi++F0+CySJTnb2KMptnNEA==
X-Received: by 2002:aa7:849a:: with SMTP id u26mr226237pfn.63.1599647308263;
        Wed, 09 Sep 2020 03:28:28 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 13/20] gpio: uapi: document uAPI v1 as deprecated
Date:   Wed,  9 Sep 2020 18:26:33 +0800
Message-Id: <20200909102640.1657622-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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
index 87074886e73d..8f768c66fa96 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -275,6 +275,9 @@ struct gpio_v2_line_event {
 
 /*
  *  ABI v1
+ *
+ * This version of the ABI is deprecated and will be removed in the future.
+ * Use the latest version of the ABI, defined above, instead.
  */
 
 /* Informational flags */
@@ -298,6 +301,9 @@ struct gpio_v2_line_event {
  * @consumer: a functional name for the consumer of this GPIO line as set by
  * whatever is using it, will be empty if there is no current user but may
  * also be empty if the consumer doesn't set this up
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info instead.
  */
 struct gpioline_info {
 	__u32 line_offset;
@@ -329,6 +335,9 @@ enum {
  * guarantee there are no implicit holes between it and subsequent members.
  * The 20-byte padding at the end makes sure we don't add any implicit padding
  * at the end of the structure on 64-bit architectures.
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_info_changed instead.
  */
 struct gpioline_info_changed {
 	struct gpioline_info info;
@@ -368,6 +377,9 @@ struct gpioline_info_changed {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEHANDLE_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpiohandle_request {
 	__u32 lineoffsets[GPIOHANDLES_MAX];
@@ -387,6 +399,9 @@ struct gpiohandle_request {
  * this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @padding: reserved for future use and should be zero filled
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_config instead.
  */
 struct gpiohandle_config {
 	__u32 flags;
@@ -399,6 +414,9 @@ struct gpiohandle_config {
  * @values: when getting the state of lines this contains the current
  * state of a line, when setting the state of lines these should contain
  * the desired target state
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_values instead.
  */
 struct gpiohandle_data {
 	__u8 values[GPIOHANDLES_MAX];
@@ -422,6 +440,9 @@ struct gpiohandle_data {
  * @fd: if successful this field will contain a valid anonymous file handle
  * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
  * means error
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_request instead.
  */
 struct gpioevent_request {
 	__u32 lineoffset;
@@ -441,6 +462,9 @@ struct gpioevent_request {
  * struct gpioevent_data - The actual event being pushed to userspace
  * @timestamp: best estimate of time of event occurrence, in nanoseconds
  * @id: event identifier
+ *
+ * This struct is part of ABI v1 and is deprecated.
+ * Use struct gpio_v2_line_event instead.
  */
 struct gpioevent_data {
 	__u64 timestamp;
@@ -465,6 +489,8 @@ struct gpioevent_data {
 
 /*
  * v1 ioctl()s
+ *
+ * These ioctl()s are deprecated.  Use the v2 equivalent instead.
  */
 #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-- 
2.28.0

