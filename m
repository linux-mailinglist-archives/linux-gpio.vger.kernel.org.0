Return-Path: <linux-gpio+bounces-33182-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN2OCrLEsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33182-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2C2696DA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2583A300DCD6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03942C0285;
	Wed, 11 Mar 2026 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAg4UdIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162E2D5925
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257903; cv=none; b=BaRhrrMBCyUy6p784SuaYxpH1ZVIHRyxi68QydadU+h0TYCIh+GMbuI1t6OOFkkIwW+lWc1wBpGaQGARFTtxA2GLt87G2sdyXugIsCbPwDnJJdvYOoNcIotD7yflEhoSPkj2MFpsaoRte3oHFcQ1UNDvcW05Yv3YDttGxtzvCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257903; c=relaxed/simple;
	bh=jNLbaa/EdHOV24YnPDzn3wt5qXtVOjsJPr+S7zUA+TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBIPIOohSl996Ao/3BCgl7e/Zl5evIBfc9Ie/6bZgcC7HXQTeHniS3rm/5EGvcVSaUbZokP3powEMzq3S6T8VrP4K4WhYw+PwX0SeN8+wc44qbdii6EdFt8+ym6oRONw8eZY4ISchCVVBdAXvqJLsYTDk7eEpJvzwDor2Jp/+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eAg4UdIA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so1858245e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257900; x=1773862700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=eAg4UdIAJa9z/d11Pa7zVO9wdlPLstLSppd3cFqP7WDW7msRVgPXciDvGoEKv6TDaV
         qNRf+wO1CpbLrIZO91W74RQ1BvUqFiCK7duPMkNn7EYfvQrEC1ZL24e/fhm37tUuetsd
         KpkioWSKSFpPrI4KRlUI5L6CnPSdEpRGtGFiztIdrjnUw/+KqI88E4MLBjNAGnLrV9Rt
         /tQXkvYx+NVo4mD4IoltOP06AVkJlclrs/H/1ph270oSyi+AGBzcXa/hfV8q57UKrySV
         LXRUNg+sipW14TJs36v3DiSyAj94hT7MHUbQeYUdRWa0VZb1Os9LSX0nwVqQ4O0nzgGt
         9ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257900; x=1773862700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=voSr0xQsuxGLr0cizWrsGwHNmkmZrP9isD1lJtInQMf7EjzMbh/OvnATYivLpxWv6D
         rbVAOyg8U0wHJrSUbm+FvzGn60nx13i5yyJE1iDWBMaLPK0m3NXf5trmCebkViXtur35
         wxhmcYMdc2sHEZyNZaNtNz808B7IwQNMTuu0Qhlpb33GSuqVYvK21tbeDy2sKJAcuPMt
         Vzm/ADxiDxmx+Vw0Igtm76gKHPylHIyqf3W2GE9gNDeuNFao/oRovvWk33jRR6MS9BTV
         EqEbMRGAdmBE4VUsBABD74P9BuWmExhgQy5JA6IFmk5JzpymF8Jf+xc4Co1C4p0bO7Sa
         idjw==
X-Forwarded-Encrypted: i=1; AJvYcCWn9Cv15Y3h5/IwJ+5pz9I3q5EIfaqerjEqy5izairS3v1BafC9evldIR9K6NsFhBxM9+tEfsNi2Cis@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPb3O4U7uPwqgCGLupAtLnBZJ/iJSth0tsvHb85IkAXNw2xpr
	Cbh2odm3O5NgLR3alZjZj931EN+y9jft0TFOYWAqja/+v1UHaSToEoT1WtQtAABjdgQ=
X-Gm-Gg: ATEYQzz9XSwf7JFArD+T9b8tizfY4VW3LcxK2veN9dfDvjPgWtdW7tOhNtxbGh2kMmD
	JYXPhSpj3YDVH8VY+YhKMy/awcT+5YiHp3q9g4lDY3x8t3jryUYEAWc4JSp1QrpzM6iJ7AQKSud
	5E3e0TWkRVAyFkAcu+8VDWMMXFkE6HC795L0CKCxoy9qqDFV91WILZI0GiguMd2DxDdNFTrvKV6
	z/+tCjwtH9FeyPpRppQZfQeOpgdDZQLcSKA/SyrlI+95meBOYHlZb9XpXFAX/SEBRcIGGBmji24
	iDoyp1vHl1+uj0MXLOXZsLABGDno0Vmi6z6vXSmNcJFfNGEcCYem49Cgxesf3XWCCOGKd1MNw/h
	lBSOG6UQ1fA56Fl+qnwR7oGelHFOYdAS3hUNUSXWGkP9pD/Ms8VKJkwkTubn8ZjMDkNpfc60Hgo
	+RZYQ50d91FW/HjTji4rtVHXIzZEwX
X-Received: by 2002:a05:600c:608c:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-4854b136ae3mr63730725e9.31.1773257900308;
        Wed, 11 Mar 2026 12:38:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm1506034f8f.30.2026.03.11.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:19 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33182-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFA2C2696DA
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
---
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


