Return-Path: <linux-gpio+bounces-33183-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLRdAOzEsWnvFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33183-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CEF26972C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0837730D63B4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32616330315;
	Wed, 11 Mar 2026 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Og6Zopm9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE812FE58F
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257912; cv=none; b=ELAYF2pzw4SMu37AZ58OE6RGdXk8cxKMLR3w8d5/xlQMmYXCOY91Q84oBc6JYGLUihZ+sKaxgC7FGGM2yg8QH+O5PAe3nLewRLc/KLY1byok42YVWYLmHH8B5sAsWpNAr+A4ajFJrDwAV6V2FnVTMNzUfw5YTf7Q5D/7Czq9KN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257912; c=relaxed/simple;
	bh=SufqcgiMGlErJPwQicSM/zXxq/8THKnYyGg0Vhb4umA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9+14hiFS6uicSG+PnG4JRSJvJO4bMJK94BU7aEKMkTTv7cJaOj/Ek3bpnp53B5/ZbfSEt71JlrtrExF4ZvXKOI8ZqcS5xEfjIxRkctReP/zBN2HfJuveYq+lTtZYkpzMA8E3YfJDTbukPOgOykXpOY0P/vrEzD4fTmIFJ4025M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Og6Zopm9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so2381875e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257909; x=1773862709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=Og6Zopm96YQ4myFyuAbqxxe/psM5SM5KnX2lpoydP7Of4413It5XeJjGAWGjv9xWGT
         MQVvTQe/bJGeyNmCsslVl8rvdgU2SbzDspWW00L/QLcqwX3OGY60UCsUtWBbTmfUoyCO
         ScmAas2NasnAVvahW1eJwh6LkOmTuAqMpvUnvldnlMFwIsSjz1ihJJKAXKwoIov9fxYa
         6Z3C0JduXdXKZx+C6WN/FjR688ruzaBB3uoi3gpaIFOC4DuF6mJk341I1dF4t+w0zWkH
         x8WAqm1eyhsdgFMyFUwaoxKi5t9HCfBivPnh7pKjpKjmBGNQCyLBeMQMxc6JZdSMx/1C
         DsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257909; x=1773862709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKrwQxPh+RV1xNOdR2bWIDNMMLavH+TXby9dnhvJwm0=;
        b=ouYPPuTMHi4r9Ma5ZTpPOmgUyoUcpDknGf80Rlnd8HTPx/3nTL1yRlGARZWAQc3Joz
         qsYrv20qeLX9t7nwdxfiqPdH5LfDIQVVQIhNoK3I5kJ/zikbFf7YXTEsGxgEDea5j6ld
         xcJnmcy5eN0kUuVbSdZBnYtDJ0aNg+wyQappgnq2owxzUoPxDLmo4qwsvhNnITnwvfTo
         TMn+9a/wKFK2x8mYFhO+1KHzkmm9TbwatNxnByFmjtd20LwU3XQkttflnOqGdbdCV9fB
         7WwKeZTv+0ZebqX95e47JwhvAjTnzgkhTtJUSNH0DD9sHvaVX4riyNZhT09lFwCFSFzR
         MiJw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Ooc4GLvKxb6K6EJllMNLBpp87R/QqkYy+2dYGzdyyOd2bWrm3rJiLnqfpo7pOUb3QAvtLSBA1G1U@vger.kernel.org
X-Gm-Message-State: AOJu0YzdXdLLiUUcyTKLE8A0+79EkPISkbzm3D7vTU2ogkPpOIc0LUwG
	rop5WjwQdLd99bzgJZMMtlOLku6FkqqTdFAtNzO3TXatihcHVO44k5OBIhlQi7n0Uxk=
X-Gm-Gg: ATEYQzxIE52XvUoLY4WsZ3AZXdPzD/ytVrtKItIDse9zINUFy8Lk3WJJ85krwNd2GP1
	sNo5GItkM8kQmZdZ1ZtmkXZyta2bKWIL+UuMzDtTjoO3RqzuGKDpanz37zxUHylTY+5/+bRPG3n
	EyJM+sY1Vl2UQVbNHNIJsofrBqT3SLPjF9CMHtU7qGi7uCaNxkip7iHWYIF4pGFawUr7AcMVXpq
	0R/po49NT63Wn0f1a8crWR7ez5eC3Lp/EJqOklhVyzTtbFYpRNZv4KWC/3UywALf7YzVR94MXHY
	a2fWuWqffjisbBsPWJr+LUkDVlh3omyCmEXeg5pFPGMluBMxYN9U+wFLlAJjFjVg4RG2vUcHfy4
	5P9S5eZYpTmrB7Q40cF5oqE7p0ZN4mfgBAdI44KNg8/OjLygQXBTMN47+Kz6zY3c1k8xZRaLrMe
	yo+yZMwuULYJ4qN/P9GPAqylLzSRtdxQCeFo57aOM=
X-Received: by 2002:a05:600c:a114:b0:485:4bd1:4c74 with SMTP id 5b1f17b1804b1-4854bd14ec7mr44737225e9.32.1773257909025;
        Wed, 11 Mar 2026 12:38:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm58337415e9.6.2026.03.11.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:28 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <b58462e99ab76971d94dcaf973bc947c7ddb624f.1773150895.git.dan.carpenter@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-33183-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,gmail.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,nxp.com:email]
X-Rspamd-Queue-Id: 51CEF26972C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of replacing it.

Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Hi Peng, could you Ack this patch?  I could drop it, since obviously
it doesn't affect my stuff at all but it's the right thing to do.

 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5d347e6b2e4c..de8c113bc61d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -254,9 +254,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.51.0


