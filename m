Return-Path: <linux-gpio+bounces-33649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IQwHRZruWmvEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:54:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224A2AC6C6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2458B30A8D20
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9453E92BE;
	Tue, 17 Mar 2026 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEDJcT3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E03E8661
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758433; cv=none; b=jCiTdIEfcwcfOan6BOPu253AX9BSKQwcvqLDENbIybmj6N6+9TXxFjr4IzkJoz9blqOThHnw//ORKL/FI/PdVAwvL+NJCy7LNiBRGHzRU0r7UbcUFcLRUeZ2qitMxggVDCKvxo7ZCWPQopqgJCYhxE4rzHCSR11xBnMz8OCbMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758433; c=relaxed/simple;
	bh=QSVp1mWaCYgYRgy5a5HQ19iOrMMTTGsbfTF8zOBjanE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVakvgS8OKGYIPoG/9QVc3ApTHgV74Bdt3ravXpy7bF5I5PwZw1cf83jbHhOc4jkUBE1hnzU8SEqTv8kBc6k10WIOkle9JyBQbx0RdsaupwRwSQKglHDD2F0YcMQwoQGH7EHTsJdGxGhDHvIBcqKer1zGU+0rMPT7lBgJb+Jbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEDJcT3f; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b976536806cso754120266b.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758431; x=1774363231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6oGuZGWOJwSB6f8V0h3mJxMfgC0ILfRIiCjXkY39JNU=;
        b=KEDJcT3fq1w4eEIZAy8v5a90pDKsYyhnD5XQ8jR+QDoOv7cu+HCOFff1kM0SrUXbtp
         E0gO8ymF7pEanG/H5WhUh5+lSXCa3SaGt8xOnAeptDYP3D3MymCL4aVCXPonbrFdhDO8
         ayxSi1t6nIflBv49McyjjW4tDbJvZAGMD4hs/jZN7oE6QYC8DPgRdlo9DI/+p7pbzdQT
         uUd+GlExjI3OrNu8L0T+rhKHGAxpanXwdDr+vxVsSiw/7ZrfUZcFDJusRlnIgbdiy/cO
         03XdQbyg+B9LQ6HrK3k8m9yXeZgSwM17DjSkmmxD//eT7VmwS8K5RRaSu0uaT3QC0LYB
         oKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758431; x=1774363231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oGuZGWOJwSB6f8V0h3mJxMfgC0ILfRIiCjXkY39JNU=;
        b=XAOOvwloLJCyl6Szpo6LqXHBaGQIeq1LPEor0aGGql2LmwOgtHi8fknAaddQUThfwS
         cndHU4UA2p7Sw/TJXbDdehM2bYW0utVGz7h51mlahCgugsFnNzGNJztHNUpz2hV/UbNY
         WOCyXAqRfZd7e5O+Rb9ErASUYmKAI1eFC2QXlRrljwmGmqoKN16tB2d8dVFYYsJ21b39
         yEMQPtMU6K0id2b0r96YipqXUKcyobMehAvKiscYTx0Jgxjfz9JwdbiOrZk78AwkTJHx
         Xn/acDgD5hiLmbr+m0snHZFqk2oSt2ptKovUUQAw5yTj+Sxm42sulusg3PnxuYQXwjzS
         GkCw==
X-Forwarded-Encrypted: i=1; AJvYcCVGEyjUisrByrqzNm9MaAJ7rawbHMP+uTUU2NHEm/qn2kMcVk76I5XSZcZ2OUVGVI6LGiUOiK3Fs0xp@vger.kernel.org
X-Gm-Message-State: AOJu0YwcT5wHLFbUIF2sZW6zvzOEduIxvY5IzQDgjQ6I8siTC+uRXW2G
	bANyOtlW5Fg7ScRhho07GGRh1J0JqiED6H6RUIK/prJFvt7DR+BsoWvNHK+ZRuob4/w=
X-Gm-Gg: ATEYQzzLSBaBWGXekgvXpQE4cPxW4oOO3xhJXQ/UdpathY0peA2MtATZ+l1EIVQdqo0
	gJCt+2eoLHVkPLfvh3kd0WIVyWNSUW7H1teu+IjLsbEtnj/rLw/1WWiGzfDnAS5Tj9+gFa0XUJV
	iR0tdP19DJY3Ma7/P9Mt7PScfWmlaRXEIVPQEQ5Uh5A1y+IzuuVen/CIlTRRmrVr9WX3WCsoqHr
	WqSgQKVqGNGStIVQYgLlqaZ1cGRPSbvjWQvqN+aPX5h5MDWnMksNs4bJg6e9plwiVuExCZqkOLf
	bHTp4/R1T1k9Xc+nDW1r3ZDofCFgJBltWtlsRlv286SQq4ymsTs9z/F6uZiTANpTuK0auNpo/g2
	kIhvI/7JDMdrur1xEZai3b6nyItiaCHY4DlcDS9Ljh1Ku6ynrlIbazraK6vR08d3azlCktcx3Ku
	PA1Tf46t2xVuY5BVnyeyViIdmdn4Bs
X-Received: by 2002:a17:906:dc94:b0:b97:860c:de51 with SMTP id a640c23a62f3a-b97860ce73amr764078966b.43.1773758430465;
        Tue, 17 Mar 2026 07:40:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf380f2sm755154766b.53.2026.03.17.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:30 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:27 +0300
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
Subject: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33649-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 1224A2AC6C6
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


