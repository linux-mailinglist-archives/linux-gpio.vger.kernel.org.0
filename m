Return-Path: <linux-gpio+bounces-34049-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB83Gb+OwWlxTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34049-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D48852FBD24
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75E063061BD0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E27730E846;
	Mon, 23 Mar 2026 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfaTK2Lk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC563148DD
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292482; cv=none; b=ehFbomSIpM7+YdhRMBod6S4KSm4E9BSX2HFTvyjHD5VIVHjw78lJo75lpjTXCPToqHf3kJy9rGhyqlOUI73wsrBiImsvCSDDVyUpX3LADsV7os5190iEBOJ2mUwIGQhuXCyyKlV1aWMw+VF0bt87H7NMlnv0xG31ChJUMvDKs/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292482; c=relaxed/simple;
	bh=9ndQcMnASHDbDGInbvhNloK+6vYvAxVufHQrRaTqfBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/5rxDjCWCUCy3fy8VB8IdxLuygJTvoh7hxb05A1OD6qdQxcAyALv+f89xblJIgt45WuQeSvuzLN3Hqety0z0LhxDrLpNoCOXw34iAl56MKnTgjpZU/wO2xykURZ7GZvZfn/bzyawUvqeNBSX81Y/FQD8IzRSX7FJ+3Qtb8SU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfaTK2Lk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso37176335e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292480; x=1774897280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=lfaTK2LkXzYhLRsZbF2zfeQEHweoJBNUrcrF6XswHplYxJvc1x1kegGN3P/7U7AW3K
         NGlVFGjTaFHUReqAv4s6PSYKqx2WVAR0cM1Jc/1BZa1qM9OLFbuXRZMYF+4m74QvMX36
         0z3hn4aPY+2C537MufwQg4eSJy8h+3gDeSPcl2kPGgkgqVAODD9htDBNTbf3Fr884I+N
         ttC08fyUjUM/Gm0/8bqOSauVUohP6ATr3Phw8Wwgq595I1Sgbak57LlbQMA0INgcDtzI
         Bbl0xaCbrp7amKEMSoPv6gaf+9dSxKQ7F/zQ6QmUS80pJnnCNTwgh4icvRbAErZU/BNz
         s6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292480; x=1774897280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=r602kpmdtI7XEvlMHeLgODx+64Iq/AQRlmGfaEK9wiOz+J/svrU8cCn+6SvsnCK/dM
         Sdq7z3AyS5mPBqbYpzSGGGdX0ME7C3vy3Y1011t8NphR32MqHwA2QahSigpxwPCEAXNq
         BKGQCkc35b3jlBxlRagyXThrrb67B8LCq1h2mxiIACy91aQ7k2gS0ARDOJc91wiJjrsw
         wojbVV57uKAGUOuk15c1Q95DdjWEj//6jPJ5m8wKIbLNXUJHHWU4kvPIDctZuzPXJ+Zk
         rV+IqSFYTVZv5hp7qIpGshxOXAC3aGnw5aLS/2I6IMmHMb0uKD3mxOcSyp7yHidRCF+e
         OtnA==
X-Forwarded-Encrypted: i=1; AJvYcCUwd7IgsRZPvTvhMvxI7ttnn7nrVitAchqDMzQO0Fa19W5DK7rNg6lVi2B8/mgU9cUPYIxcEOnxKAM5@vger.kernel.org
X-Gm-Message-State: AOJu0YyMDPt3P+fXqHJE7nNzoGF44aXrJUlGDSuLKNcZ3I2Cm8Gn/cvC
	qz7esreWec8n7yfR5dWl7aY9ocuIV0pe6T+JN9IDd41VN+DhrPQ6IVpU/jRP0thF468=
X-Gm-Gg: ATEYQzyID9yB+NQT73XQ2X5fRXVx9yhOCcngPrXb06oxVB+gUh+RP7ZhDPm7qMFmQnA
	d1Lm7UyrW9CyccD+p7h9iiZXj/D+cMfE7q5VAbsa001aTxxs3Bc4LnUTEJ23jFSjMwgBJeMfCXO
	OOmv+3pxY6Rsw40etagLJwO3jRxFlkbLQ2b/ys8UcDRfKEW0uYBNWANi0Y3E/yp5Vr9zSPCIqqn
	vDcDanTbCvn4XBtGFI3FaJ8mjv3AhWZ7DzSCEX4JjqI7vZ9jLySkkJpc0MClkq2+RMbNPzQOSEa
	JqRl6zziGa7ndiNc/1NGXcHhrvMUeyt8Q1CYyQIx26qfrWgYFjcYXi/N1ydO0Yrh8EFYYTDwni3
	fCtqa2G6sv3EYAl2NazU5xUFfzl+sspyYjXbcx0oeIHe2tMHCSyyQWVB8PUJRk+CHiKGTZp+LWj
	8t0n2lbBqoocqZtBOf8a3HyMiN3XfU
X-Received: by 2002:a05:6000:4382:b0:43b:5192:894b with SMTP id ffacd0b85a97d-43b642426afmr20898486f8f.23.1774292479509;
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm32522970f8f.8.2026.03.23.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:15 +0300
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
Subject: [PATCH v6 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <cf3f9e6f296ebe3828741b42dad9e511e51c5cc1.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-34049-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D48852FBD24
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
2.53.0


