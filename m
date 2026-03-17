Return-Path: <linux-gpio+bounces-33648-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIkJAAxruWmvEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33648-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:54:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F32AC6BD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D554431A1F7C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D6C3E9290;
	Tue, 17 Mar 2026 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QUicBMti"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAC73E3C69
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758426; cv=none; b=FSHthORoiz5ubjl56Ye4aKeUeml3RdWLQR6p3m7BfnQaqb4O54sTfbwR9nYPHcoPk7tm84chXyRGslR0LPc1MOCwNqaNqqq5uV+uRaGJk0PqGZB1nT5Rgl7rQUejEozoCDw5We0Er8GBOBJ3cWfRomi2MVQUb2/i4gBG3iSRiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758426; c=relaxed/simple;
	bh=sAqcKE1H4LvY4c7Uzu1qPTby3TB7ONcDP1VFe170Rx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9X4ERoSaejJEZB2Lij73wICiUv9zG1PHZz2FzUT/EMmaxo/5HFgteXEi3e+oJ+OM9bIp9fDStou3QJ9REhc6pUejMGNWDeemAnCitnkmT40ssph4+VoXyVlqUGZRWUo3VI/KhgUszfAPWtCxcD1dNGw3V6KT4PZGcgKVCj4Y+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QUicBMti; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9789425fc5so115967866b.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758423; x=1774363223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+fQoQ+vF5CdSNMBB1zSa6qM/etn5/C5493AMpwpaSI=;
        b=QUicBMtiEVUBguNPfeGVwZ5NTtdgigsZyQtnQHOOR3c7w8Rp9AIllhirnAcytVxFMr
         PjK/rdZppTNnDZt4feTnnp0LTNAc1U4SN57k2rJp9QmTM6ZmRuw6AyisgDIW+WI1Oy2H
         81cDzrE5/k2loS9gRf4RWgk9bJX9CIWsu2xYoHa4oWbAhoYWHvXVF8pF3Ds2Va3jh1WG
         +P1yRJIIuKbHVFItvxY3kVcyIDcYb5o7TCWdQ2SRCkf59ey8RkU6/jW6KWzQLMarZIIW
         O8Ua9PkUvKAfhYPzB6P3V/W3z29i75eIo6TDmsgL2ej2LFDMfwP5PmCAQEQO+/EWT1wg
         wQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758423; x=1774363223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+fQoQ+vF5CdSNMBB1zSa6qM/etn5/C5493AMpwpaSI=;
        b=a4rtICZFSuoAQ+z+9iEE+rhJQd66YMBHkxqs2LQJtoj4Yfl/oCahQljOB5PYiAzuZF
         iW9u/rIIuOR1Ey6jAjozedZ6hD6kxQTLf/NJEJDSTLyZ5sS20qbBHDsspV3NIv+JTNFk
         dn2qKX0RibrsGR4UhNmqr66KMRf0fItnT8+lSnGfu4b2Z2aEEsJGJfVhZui4WJJu2Jqu
         EDq53mvzBukJKtJkh/DA8QjR4s264mFMNN8FI3H457Xmcg3Dn5697sFgd7RSgKDmweMr
         H8pluVRVEjL8QSeGVp8w+mXu8Y3ce9EJTBrnbqikc3uhc/pcJng2GPqzp4JRHVkiOzXx
         lV4A==
X-Forwarded-Encrypted: i=1; AJvYcCW3Qgi3UDSaSRertqE49LRW4yiLk5i6yb5oq3wnWYdStX5JZbRxE9S2KIqI9VkpdC6ym6rFOO10idDv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8J1O4rDpLbW1W3aQ9bIqIPlkpbI5hBCplFFOyF1Maq3XAyYki
	NsXDxLMkcEspAM6ClGifw1Kj5yWyka8RkiLEGJAdh7KasySA7cmO5sd7CFYYFtRRyuM=
X-Gm-Gg: ATEYQzzAkxKXhz1e2F9lcCxLMknPtoUdjVVR86PrHKGtmctOd//b7xZuDbI77TqydMK
	GUif8SbH6F3mURLcFqVcPZNEV+CXSB3n0DuXkD3gt1KPGRi8RyjBWkADK7VXtuvEbTqQzvnWWEn
	yCnl95N5ESs5MxoCdPa1tg/pskq+pKta/cIOcqcco0/wQUGNv+6QTGxfNkXrOfThw/Tf0jDbUr1
	DYOUEVbsGNWW7c04KelGOxlyW7fVVcJxLx4hdZHNyEdCDsKJFtkZDIogUHy1sgQAoMcFebbNYRB
	SIe5UmT1+daJSZBUw+7tiSKsRh54bwAFqHIPhA9Xq5IGUB+jqYI8TfbPcO+NBKlNoyfHRkp4DKp
	21RnqrcC13+0uBZvuhJBKM2mhKHxE+3JRwL4H08rrMwqucOQ+mMXQGGh3I7FVeBHJQ9jZHViMxh
	tbkLUcChph/tlaL2GuT68sDJr6Qq9E
X-Received: by 2002:a17:907:3d8e:b0:b87:6bb4:9eaa with SMTP id a640c23a62f3a-b97d6c3a76bmr249151566b.8.1773758423336;
        Tue, 17 Mar 2026 07:40:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97c635dce8sm325172466b.44.2026.03.17.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:23 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <22af6c960a7d20eb09e57e91821abe7ffbc52b9c.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33648-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 6E1F32AC6BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will be used
to implement the ->get() interface in a GPIO driver for SCMI.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v4: Fix kernel-doc (Andy)

 drivers/pinctrl/core.c           | 31 +++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 +++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2edc9bdad183..c471f3fbd035 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -938,6 +939,36 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+ * @config: the configuration to query.  On success it holds the result
+ * Return: 0 on success, negative errno otherwise
+ */
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
+{
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc, offset);
+	ret = pin_config_get_for_pin(pctldev, pin, config);
+	mutex_unlock(&pctldev->mutex);
+
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_argument(*config);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 63ce16191eb9..11b8f0b8da0c 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -35,6 +35,8 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
 int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			    unsigned long *config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
 void pinctrl_put(struct pinctrl *p);
@@ -101,6 +103,13 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
+static inline int
+pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			unsigned long *config)
+{
+	return 0;
+}
+
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.51.0


