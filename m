Return-Path: <linux-gpio+bounces-33184-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJr0GhHFsWnvFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33184-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174B269781
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0AA30F0E64
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CBB347BA7;
	Wed, 11 Mar 2026 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4DQ0t1g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4232B9A8
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257941; cv=none; b=LUJCIew0G5FVAH9/REVEyZcsrBWODQncdq88GoOHiBnrCKxpNA3Q9xOPhgfA+dybhCSj1zccCPilAkXk2R7lxQMd3KLXdlIQZI6ZyLAZVo3OrwoaOXKn9OOjcy+tgOzrCk/7dB+p+kiwaqCir/yDGbK5wfunqB3xaRl0ubQvaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257941; c=relaxed/simple;
	bh=+lx0NoL+4Abj33jCYoRiMh0L0i+BewAAr0Ejn6Jvz6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojJOVG4kGSTMUqNcwIR9/7BN4x6n7sF03u1SY60GWphd14UOMQ/YhCHZ3UafEJBES99p3U1kXkO+XUHouTJugaovG5D1KwhOV9TKiWZIBs2LXJwMtwjQtA1dp9TepOYtFZAZ7NL5pL5iOA3Yyo4mpZrXGGkOtmG2v4n7GiZlWuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4DQ0t1g; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48541edecf9so2386065e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257937; x=1773862737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=I4DQ0t1gjw74QWOjRWbXCHxIpofvDn58dJJ7T9l4XdfPLxRPDqCidsU1vdOz48PqGr
         3rSV69O5pHr4a8pj/1Rpqp7xT1RAKwD/Nk4Uf9wU/JHR2JfRZTc5oOQbGawgSNNgrKbl
         ed0BghKgeHIDG3VV/qvi7RNBkHa3NYODAzopthxqe4jRaAOGcCWTT07wCdBqkN/mKTNy
         8g4rGraz1bCVNx+/zKT/XBsjoq6dO7GYP3I54cmtN2s3rKVjiZC15P9gKfI9aiOoCavF
         qnMgNLqjJ1K06UD9j6aFTkJPVVNirgQgRfzDzTjWbTGtHViaS2joH5DBhlJNQms+Y1J0
         QMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257937; x=1773862737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=LluJaoKECvlF+cNIVelN5YuQvCHJ+krreIH5elPcT6OXp4upg4XMHGN7X4Q/aT9OCm
         ZHKrrJ/hYAK1tHfEI9T++8fOvpO9Nj/YfYDMhPhwft7G2jZ7V8PFo3FYqCXY8Lfo8Ppv
         LBtjlbYo8wA6gEfAzaGFBJbdYD4Utw5lOU9HcstW6iNOEj94DRShZOsI2aY4Mu3O16zi
         EeAE+12cg/HqBJQFymkN3nJrJVJJJRntIt8ateeAT+TtT7T2LRVgycAc+KuZNQFicX2Z
         Jm1RVu5Mu20o4LH8C3zhR2W6A6CuUFRTczCjmgm/0zUrE1vY9VDEBTr2vUvHNqqqdNH5
         m5+g==
X-Forwarded-Encrypted: i=1; AJvYcCVA9Hbw/8uExGYweOiJCQxcKlqYUIpn8PBBtK1aYQiJFiwg1jgo95ZEu0aZGFPneOM883THOWoV/m6l@vger.kernel.org
X-Gm-Message-State: AOJu0YytxyTKlcEYuhlYmPCOhjrxyhky5WhWKleqLnFrydGuWNjW7lvn
	C2AGCufB1Q7U1pGZXROIeSl2I5/8VeQb6C6i3arPMP2ct2Zt6nxy3QjuCeTDUxwFSHeq/shfbhW
	skQ/t
X-Gm-Gg: ATEYQzwOsWtIyS8KxCyVdGkS8ECabz//croLCHRWpWqnZqOw03nQlCbLDAy4ZcN5t2X
	Xs9gG7oLBXOE2v5Hr5FfMvPL7MPRPyiayfOWFvIYIIyZ3Hvjo6pHf13PCDIhKMvyVHjsyVY7xrz
	EsHIvHlD9j3tV9Eb22XB7D7RoUe/DgU5uYOBxmkuT3IAXJ0rXzv29QdPIzTNKe6wDJnlOSWfAid
	/BVUMU9ymnOxJJmeZTYiK+GVxIbM1Y9w7d8kxJ8hUa7d4FjUAZ/+JhydGKsudnSXe1Z0qcbZ5RT
	JdnMWFLxFc49W68zQINQI2gLoQP+yurhb1R4USJXDbOj5pbYQEK3hkQCJQZP6lAilq77Zb2AAAL
	FGD2knhPkbQAf6RFQwVifku55fM8ut8OH+y0IZkV/YeWcs9vvk13K2EY6wbXK1xsqLrOk3nsgr9
	PIE0yZa++cIFRHYCBsv9FZnMaliYibPUOWduFPcQk=
X-Received: by 2002:a05:600c:c4b7:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-4854b0a4a4cmr64000115e9.4.1773257937205;
        Wed, 11 Mar 2026 12:38:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm1460894f8f.24.2026.03.11.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33184-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0174B269781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0


