Return-Path: <linux-gpio+bounces-33964-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JFPFK1vvml1PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33964-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:15:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D05492E4AD2
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B517304600E
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCE52F7478;
	Sat, 21 Mar 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOEuiSS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB072D97B7
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088018; cv=none; b=ReBUGeBz+43qIpPCs5Ho6O7m1hzVmFyXRzh5rxZ7HEvIhW+0ERNp3BOYs6JkiBPhUNdBIjYuhpIfh5vbNrx9cKdlSvadGEMAgjw/ExgslzohrsWOL2etCoO8AmKWfVkpFoFegaAxx39HWm01FOGxVgEv/CHDyFgUJOJDj6+qD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088018; c=relaxed/simple;
	bh=1uqFyv8sNbH4yrRykxbOsgxCTnxvIECLXyk/dbgpM28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mApSnBjiPm6BB3PVPbMlt1a4wJPc7ZjtBbzs7jqC09I2ERu5rbBYzq4rkKHRof/A8lQedoxnuTfD1nK5dDqCURJBoGRZt+a0pzvgQ0j+1wsH6gngft/MBp6ve7Nq1fl1HXKU043DsxB0z4leg2cIWEB+KvnObndtlU+tU8McXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOEuiSS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so3595935f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088016; x=1774692816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=wJOEuiSSowi0Q7rGHF2IV5nTSoGDk2ru12R/y58eR6M90/bxDs45Ddj/xTuHZM3i1V
         LjFfz3MPP5up7iXE7GMv64gx3T0RaaenFq8wG9CD7uZ1CLjA/QV2lQnMprAj/SLgEhqY
         YsncC5z86CYktnl/6zOus2Dn66antTwjGc1hy4hI8AAQiayVVNOQseS3DjVnHCFQmYrg
         vfgXgxYXwNQnBN2b71PMgQCQgAgLhumfPKPBa5niTO6o9QKDSTO7LQ231vOWLEMITwFB
         a9FpjAso7jGSE1RLjGLSftVZ3UlrrexXO6flZz0vfMkp4xjE1mmSsRYQbQhRlQFlDpUx
         WUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088016; x=1774692816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=o2PN8ccLhF35p2YHiasAKifCSX9aVTR9Cf+UyFGpAmBdLjeBeONDwCqpwpexDUXwqq
         lR0z4LWFGTWFYQ8mWoviA/Sop2xulMKI73hyqEmGR9PzWwjVetuiXd5OWQ35a7h7jaAZ
         5qkRENDKAah4X1dzo5Appxl8IlDngO1zKG9SPSmO5TakGdSp3q53spTqK1jtOUEjhrmb
         Yl+Y7RRuTF6QLA+qXvq6bx6/mCV7SLa62iRb2wVMEFdzibqitG3Ghl3XlWASCoZz061M
         0uNxviDmKzpNw6Fuoctfi4g3m3Q/OqQrruQHQYdZQfyOSSeKfRZrYVHnwNXHcxtYVh0X
         AWjg==
X-Forwarded-Encrypted: i=1; AJvYcCU3w9w8SxgI8/0o0VzqPf6Sgccs+zepNT/vk2P4IyoT2fX6p0T0AAv+PdoRhRREh1CrZop+JZIgExW8@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpGgWG7hJR6ZhOtzt4ZBaqqzjFtxPrcRWrHdvZxRq5wMkomVa
	Dl+vhLi5q34IrJb50ymF87OiTI7CGtw/rqATWHZ6j20u70rzu0LFcbZ63VsR2jXuEmQ=
X-Gm-Gg: ATEYQzyPraogVfzOntME7FCIyJqhtP4TACjsd/Iz46LHgcm0wreyNYO0cSKrD59o3E8
	4+KK2q0Ymp2zlpArMDhd56ZExlzrcX3WmVYxLUg7sb13cYyM0lV7BKX0OOf3HNCniGO0anKy9zA
	KA9MmaZywr3MgA+wLhbDSwgBk/TtFCrmcI/sLzmeDLlOnJy6LMchKawEMbCmmppPAeM/nfAP5UZ
	YkyuvIKGb10gJBkC6B8hv3CgE9TnSJg7r6TdWVeF1LPfalh7ms5BGD3QsIY7xOKZmlqA1Wrh7UA
	1jiHpFH/0yT5AgCyKBI+UEJmavyr/W1Q6tZHWvrKtKlt7pOU4zdvG/GKiRKBQbTWRv0BRoClsWV
	17e1O6K47inANt+c/L+SrePgYi53zxcsDRN6Hm9sBTYASLixt65mX+be9a5hE+vXkHOE+chcpPs
	rDOphdz8I6j7mIf0Qbkxss7YoqM2ISNlFpok4Yww0=
X-Received: by 2002:a05:600c:c16e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486fee0f975mr77117095e9.19.1774088015816;
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487004fee41sm47800325e9.3.2026.03.21.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <b39ceff6729ebd79c9c5c774033947d146c56afb.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33964-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: D05492E4AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
reading or writing to the pin.  In SCMI, the parameter is represented by
two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
SCMI_PIN_INPUT_VALUE for reading.  The current code translates
PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).

Add a function to translate it to either INPUT or OUTPUT depending on
whether it is called from a _get or _set() operation.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: no change
v4: add r-b tags
v3: new patch

 drivers/pinctrl/pinctrl-scmi.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f4f296e07be5..5d347e6b2e4c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -251,9 +251,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
-	case PIN_CONFIG_LEVEL:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
@@ -276,6 +273,28 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_INPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
+static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_OUTPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
 static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 				    unsigned int pin, unsigned long *config)
 {
@@ -290,7 +309,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 
 	config_type = pinconf_to_config_param(*config);
 
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret)
 		return ret;
 
@@ -363,7 +382,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -405,7 +424,7 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -440,7 +459,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	config_type = pinconf_to_config_param(*config);
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret) {
 		dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 		return ret;
-- 
2.51.0


