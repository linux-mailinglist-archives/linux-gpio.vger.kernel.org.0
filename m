Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C1D7B1CBC
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbjI1Mnr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 08:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjI1Mnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 08:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09FF139
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695904976;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iIgaek/2vaj0JutvpQK/iD5J0G41ovSmgWF0taiXJOo=;
        b=ABnrU8gadb0LF5VFST68oT/RuNSM96XzrjGVavQwZAwyQuqyisMkamQbdSAvdoOBnQDdGT
        97ChURdTQth5gbFu1W+zRLEXaGT52yVPaaT7DUZ4ipXvO+yUCLGIvZQOoFXyQ8fG+ASPuT
        u8NRBfMCVaNEP9bZqomYqCFSxiK+6XI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-T-WCR-XYPLCBZM7uvgB5KA-1; Thu, 28 Sep 2023 08:42:54 -0400
X-MC-Unique: T-WCR-XYPLCBZM7uvgB5KA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a9f282713fso1074084966b.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 05:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904973; x=1696509773;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIgaek/2vaj0JutvpQK/iD5J0G41ovSmgWF0taiXJOo=;
        b=XwyL5rjUvJp39EjQUYB7Q2tRA6wE1cW85lNGdozHymVTZs4qN3wioUl9kYg7mxE1vp
         tWtSN8Qe+UdFok1rcQKCqQmBhRh4yKebNftCYv7tlDjZWY8aIwPinx0usj0zwD6jT4qF
         lwTClzxAtuElOH6uhhkBmv5XK19n4Mrfp5cUnhlHh4TyiNa3eE+2bIIg6eatpYW0hly2
         OJXmBPy+v8d7j7vKDisg6o4P06QmwcEJQhJxxS4s3YrXAikD2qBogSZkGhuz9Q5AVyJn
         UJhTUkkrfPfcmWtDgYsrhWKCYEUU3TdXAwrJlAGeA7IbG8q55dTq0ipBSOo3k9iXPIQs
         ummQ==
X-Gm-Message-State: AOJu0Yz/7rAtQ9sNS7+WGaJFeENSQH1gili801hJEnx4sM8F4HJT/G9f
        UHCD0XcU7P/iDhXvS9jq237uuQif5q2mjMIPnHNIOPrc4tEi87DEiEvhs+d9u+07Fl/OO3+K4ID
        Grg7yZm8agtad7wjzAZEBOA==
X-Received: by 2002:a17:906:209e:b0:9a5:874a:9745 with SMTP id 30-20020a170906209e00b009a5874a9745mr1015777ejq.26.1695904973505;
        Thu, 28 Sep 2023 05:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlywnIyNYShfOZQqUKF/nPnEpW/BE9ULWRGFQaKFsFKQmtPIGivvU6o7bT5pQ/APNJZdsd4A==
X-Received: by 2002:a17:906:209e:b0:9a5:874a:9745 with SMTP id 30-20020a170906209e00b009a5874a9745mr1015758ejq.26.1695904973121;
        Thu, 28 Sep 2023 05:42:53 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00993a37aebc5sm10864511ejb.50.2023.09.28.05.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:42:52 -0700 (PDT)
Message-ID: <b8b1a3f0-3aca-341c-07ee-389b077a01f7@redhat.com>
Date:   Thu, 28 Sep 2023 14:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 2/5] platform/x86: int3472: Add new
 skl_int3472_gpiod_get_from_temp_lookup() helper
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
In-Reply-To: <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a new skl_int3472_gpiod_get_from_temp_lookup() helper.

This is a preparation patch for removing usage of the deprecated
gpiod_toggle_active_low() and acpi_get_and_request_gpiod() functions.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[hdegoede@redhat.com] use the new skl_int3472_fill_gpiod_lookup() helper
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 351ecf047944..a46c3a206aa3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -99,6 +99,32 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	return 0;
 }
 
+/* This should *really* only be used when there's no other way... */
+static struct gpio_desc *
+skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
+				       struct acpi_resource_gpio *agpio,
+				       const char *func, u32 polarity)
+{
+	struct gpio_desc *desc;
+	int ret;
+
+	struct gpiod_lookup_table *lookup __free(kfree) =
+			kzalloc(struct_size(lookup, table, 1), GFP_KERNEL);
+	if (!lookup)
+		return ERR_PTR(-ENOMEM);
+
+	lookup->dev_id = dev_name(int3472->dev);
+	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, func, polarity);
+	if (ret)
+		return ERR_PTR(ret);
+
+	gpiod_add_lookup_table(lookup);
+	desc = gpiod_get(int3472->dev, func, GPIOD_OUT_LOW);
+	gpiod_remove_lookup_table(lookup);
+
+	return desc;
+}
+
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
 {
 	switch (type) {
-- 
2.41.0

