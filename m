Return-Path: <linux-gpio+bounces-34051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL7ELwOPwWmuTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:05:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A762FBD81
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 709F6307AB2F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AD23090F5;
	Mon, 23 Mar 2026 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QrwhrYv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF233993
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292498; cv=none; b=PlqCF4Gaa2cZw225blQPrMhQXKBHXmXutnABtOTurc7hmSuvb7YUnaxpzjL0fDCFsXd9QDO8EPKRg8Vu57EvABooNkAkZSwW0/m+LfLhxAwQSsvVNM6mZ6pHmYgnKJ6SDKqyKIN/zAuKYq7aC0GHA+YFzNI+jWErkncHIL4uUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292498; c=relaxed/simple;
	bh=jCF+eLwlD7MQ3lst0osm4ZMLlYmOygIY+kAEfdT6yWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3CY4vLEmKMIayxop2ZmkvtuqdmS3EAVWYf2SvUoMvQzP/lt1IGK9BTb3BybVIIIGaIM5xJdyLZ1grvF5U3lM57bTfOIrrUTZKuQis1Njd3cVcQj+LEogDfZ1u1Dl9CRRMYLCATqx+3x8AnmI62w+JjxL1mfF330Jz1Gz7gwkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QrwhrYv/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so29781955e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292496; x=1774897296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=QrwhrYv/AiZUW4cgVLrFKBOVuIr8yilP2bWIRJCZdfGgG+MqU81TEbYDEH4xkoKt8q
         wgrBlO02TSTv1WTiuHghqBGWgh3iU6GrLVNMp92rXN9XXet5PWcH5PpbC+g5TSG5b7il
         aPHmkfB37jRoUGzNgMggH4R1Sv5a+jYwa5gXb0XbDmHtcT6Nyswah2CtNBzxSMajoxYQ
         uoNsKxO+HBnMEZB9TbgGl3RzqhhUc/Jy1JqeTZ78N3ZGylz8ylq4YUVyKagiwj1Eey1O
         2d8BFJxo/xnvUjD0pfyNNr6JlcFdf3iTCfpV92i+RncgfTJJdb7Zn0bDp6pd93BciefM
         MTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292496; x=1774897296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mX/GcwoKo6bWMEhcm0gaJZhmtfjF5BKuCj21CKeODo=;
        b=hVkRe1zANB51ucUDw5yC//M2DKucpkmd+Fp28L2LTR/K9v0sA13qwlQYQ0Ee/vCQBH
         Jfq05jx/Q0ZnabJfWEvhGfYszqUQtbRi09f+EooD4b8B7WdqL8i6ntfa/qeAlAutmnPG
         6Tou97zPme3KCovPT0wsCVPyM/gLKxB99zJkymYxBlMqyRdYiEPeHudNEJH9GYu2f7XR
         6F3zr8nwuhKPtjQucXDuhmLsgHKebxboC0QgGmfrsnUhcqBA6MmJe7J+XnJB6o0HydW1
         SGD3LO9yUJXowHluk8GEncy/l9qh6mLo2thwOalLTvtoi/OmhAZMaqC5OI1Pw2M72ewR
         3sCg==
X-Forwarded-Encrypted: i=1; AJvYcCXtrZOmJle0dy93TzIErwCxHP7mLEvP4t7Q34z59JL9xmIl8BfH/fuKW+5g72xGpTPgJQHOPdTuLBsx@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZ9nLmoI5k47le2z7OyzC9So0cAXjFZeO+3u8Xv9OuUkLYoUg
	IFe8ZyCS6UMju4qmBKalCcMEgpisVezibp8t6fNNbbaAs5vvR/fXNS/UbrF6BCmFxkw=
X-Gm-Gg: ATEYQzzjGlpu4LYIwxTwfze2oaOtkPUifxoHsPHbJ5H1mq/Uz6544qsxj1Y15zL5UJQ
	gmsfa9iqrJVPqjSEdCmx7Bsm+a1wifE7Gpgjp5Axj/w4W7UT6BMQluQfa99ETLcYUy9a47C6PEk
	a1NkrmQwKyThNn2GeISwPhuCoZjg+52aQ9TEQ7cN2nbEGHaoIjuOxSKUJy+lfzeUbrZ9Gsyyg2/
	l9nmeZAgQT7kiQn03IGp7sI2Z1g7cGVOrh41XGOXIbNtTQ93pypX4mWzvqJTqc5Xpo9s3G8OULQ
	YxfgsOfRGCQO6AD3yQ8Aq4ifgMTIQsk2jO1D1uPqSQ7XZ5E/R/Nvy+G7A18UZzPiwtsEuro89Zj
	dzn8kvoHKzuGFzZ0upnI/zHgid7O21Q2SLeYIUsfcUUwtFyOEcJeGFySA1hvz0v6pas8/F5dg2F
	FYsGbb7LhkwYE26QMTLFWQ97DUYNin
X-Received: by 2002:a05:600c:3514:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-486fedb5624mr182256275e9.8.1774292495555;
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f80b6a3sm1441505e9.21.2026.03.23.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:35 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:32 +0300
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
	Michal Simek <michal.simek@amd.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v6 3/7] pinctrl: scmi: Delete
 PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <48bee15dbf615c0c9a76ee4313bed7c06a07f143.1774283146.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-34051-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 36A762FBD81
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: fix subystem prefix
v4: add r-b tags
v3: new patch

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
2.53.0


