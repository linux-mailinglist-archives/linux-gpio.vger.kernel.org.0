Return-Path: <linux-gpio+bounces-33650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFALNTBquWmvEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9C2AC563
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCF1F31BED7E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C04D3E9283;
	Tue, 17 Mar 2026 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e19XOqVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DF3E8C6D
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758439; cv=none; b=fwBWXQ+Mv5XoFVPu6gOJ1i0m8yV3opFifklxCtWAP81IMxEPkDHUHeieDzQrfTGmUWKc0DAWdF4KRl+3dBOyrt2gmBBb9SWUMQOlRcVFj3I8p1MXaGFi9G6XMqDzdl4G/FIDPY6vyq07YNSI9IQd90GY/3ZzSzjZ8ZO5IGdX654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758439; c=relaxed/simple;
	bh=wXUzWXlRbBZUPgZcoRqS5huDsicTqOqFAogLNwSvvhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ9RJO665wREO1os1rtnZx5rUdWOqvVN+qepwhvl+R9HxqFa1SaNCZ6Iy2u7v8v+f6cUalY5gsCQI6+3kN+B8vqRHI2THeIc98coNJ/0bDuKqCfs0VXh6yhmdJ8eSglFH9+97SjoiegawxFereSah4dCr4iXUuho/mMgQwtBdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e19XOqVw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b886fc047d5so972952266b.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758436; x=1774363236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=e19XOqVw+cprKauxiU1yE09d5cZ30f8f3FxNgC15dx79Ooo0yFkly+HNgLRk4ou4W3
         HPUR9J52ctQ4bpCWhAd2nGF8vAYPcIlXAdtRQGQx6volkqhmCSm8lmTdpZN1IeH2VSJy
         Z7wVBHM9KofYkzwE3oHus1yC2PmBNGrvnNeBh+EpA5rMCnPAVZfr9XAVj9ZEOsbfgPEC
         J9OYr71GB1oBsOTKQziqEdaBOlPlgS+9miE8WFes1qJCcuB0zybBHsGVSXSbIpp2k0ku
         Y4miW08JxnmFJa/RGlpWEnE4aWDscFT0bFUXlIrUuFGXYXvZ2knXLkVZwqSjyXofUPne
         1TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758436; x=1774363236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cvkfko3JSBcZ3yQGwkpneUFUeWMGASvUnUssQJCU9k=;
        b=T8FeJvlf3gVH/3HnO/nS7RP2Fl4kafaz9eJ7jmYuQvdS6oJNnqgoQWxyz4dDAjL8Bk
         5jJOLoaP7B4vK2zR+bELM/Ue87D0tqc8Twn2fFMuuqPeNihi2+xS1ChkHIovktuRIP85
         wySdGGDoUX1Tw/qaDIYPq8/FFVxxLlgOmttSsBUMTdbgPCyn7ann0YFdGEVPsifMD048
         gzIJ51/qxnT4yH060YqxZG2QTsmRSob6xxpzqNwjB0zg9UScCZm/Nlx4RYFbQUSDkNc1
         9GY0XaRe4xZMEXBTQD3AzsLiLy5FAl2VREUX6UNqpqr54wKnIJSPyhvbbwEYodf+BqUT
         FB9w==
X-Forwarded-Encrypted: i=1; AJvYcCVziimAXYoJQNpylviHem35M6pHo0PjS8gN/G82ATgq5RYght8OzEXdAqzOdJvsIDOzetTJlwHEiLQF@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHG+UzSQ5emfKyu2oaD76yOfUA/QUTo/eQUHHMg/wfV6rXxs0
	OX7Z9m5yFWVax6y7fIr4RnW2jiTj9zTnkQm3u/ij+ISFvFr1plKZP09weB1wgqRLi/k=
X-Gm-Gg: ATEYQzyIH4syO8g+jY7dr/flc68zW2657qUeAQ9zf/WB6vhMlGlpw8QAw4vpzieaJFs
	XLtpXK5V4D9xtFI0m49rsDObSfoingsEGgYjkk+tvUydeLgugNe+4Adk+fWNtRQ49/zT8Z+/fwX
	4k6DqHzPCb7Tqae/YGW6F3ddjiwv4Gjp3j2wWdArXEO8E/UOu79p8MCQQ2cY0YCBnBxMlkymG1P
	uhaKLYC8P/pdnlXrgqy8JQJG19M8FbEQaxJPPg9aUpdT8TANCzQKFbepyR3IXapNS3pQbLGHFH9
	d1v6/6hlppRFxnTKctTxeg4JVL7tM+CgcWASYbJHqTMvtOWjU2yDVJmPyI887BkuRJUckFcoWaM
	BZR9bKslvRdpgFFBtKa9ZQJ2KOQ/z1xVzMjNCCi4ZMlJZs0dVUZAhkSx+c4DGL8gfbvhXNlM9Sx
	1Eg2J+v8ng1kDEb8qPp41/u9pbu++X
X-Received: by 2002:a17:906:7316:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b97ca81f487mr416217366b.0.1773758435746;
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97b7ce8587sm401567966b.26.2026.03.17.07.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:35 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:32 +0300
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
Subject: [PATCH v4 3/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <2142deabc8183595c582fa44dcca6b5bfafebaaf.1773757772.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33650-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 3BB9C2AC563
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


