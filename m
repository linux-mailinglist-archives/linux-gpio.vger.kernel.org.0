Return-Path: <linux-gpio+bounces-33967-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHX9Bgpwvml1PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-33967-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:16:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F22E4AF2
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 11:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A777305B470
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 10:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0FE2620DE;
	Sat, 21 Mar 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBjHPibn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C82F7478
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088038; cv=none; b=gLLoZVsgCdSrxcOgfG0lTX8wV9XLFtMV0oRggFeYC0ZK22fCdHGWMeNmcG7iecAa0x2T77HvWj3MhehH5bkn5QFDCZjlc1WEOxvirxOi5vcUddHflGmfvEge1URPuiTvguNsWkeKOsRb2AMBzKD1wTTxdBX4nTQlFm/F5E74ws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088038; c=relaxed/simple;
	bh=3wfx7eM8ipMNZPFdJ2mLCQZdHaH/tw9KlE7kv5yt5JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao2kAzrzlcILpz6iDnoaJbawqDlXkVxRWFuwCNA3bPUVxebqUnhVobHsFPsqBAOYpwSX5O6b2sgEX2n0oaQ+HoykaaaKI0VpMfjTuXPsqkHnlI51exy9XNirNMhxqYHMd5LY8EVF16EeB8ef3eEkKuXzvXJ3T45N89mX2c8BjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cBjHPibn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b96760easo30124945e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088035; x=1774692835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=cBjHPibn53eUy/fqhYtBVjufcdubC0yrmL+DI1H+3ruhRfwHkQy1ghIY3p0RU7YGcW
         iVDVWEY7bf78YG/XiWgwvsi6ilHPsiMnKMCP+7cADX6Lq/ElUbF91Gfx7zOdcvVOS8WC
         YJaeq76sL3N9jLn1NwimXfJvNYTMqlXTzqFBEuEozjVgqJdOF2Pbf0u+iOU4kJlT2GY3
         /LJPHV4xJfBaxB47aWUi9qKtkmFWefvvWEfGJiaEdtclC739RMeWXCrSFq3AnUeevHhE
         DMlJHkRfZqBEmkG7QwhWSOUdsaA4QML3VN8Z+3y39I2OC4tdiqzMTX3ZonJoICbynD9C
         lQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088035; x=1774692835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHDWTBbKB3qdUDZBmFuIiqFXJQpeVZ0CqRE3ngdwtZw=;
        b=prODqJI7bUHkSl0wecswiKlouUmkU0+Zphl1WOqi1orWUHb9pVnZ7FpoZl5BRH6Anb
         z0rMdf/z8IFyozC46VvBMGjKExRVYVK6MZDksQoBdvG+k3R0gZ+a5Phe5R58k8zTeUj3
         u4VoLcP+SOi0cwcQHS1xNlmph7v5pUP+ZJ0zjnDYq88gqmJ8ju7/hjNHxHfmiuR5pYBx
         3hJgeOcoyqqhjbcQyTSikXWve90zDYef3HWLpuppyzRChA2S52IYD7fCi2dkYEnC4mFM
         acjRWShI9eqrs/hR8Ge4DyeaVvLvbi8TMSIt9+vpwDiLh/BYemWkMPToDI959feIvi8K
         ca8w==
X-Forwarded-Encrypted: i=1; AJvYcCWUR186I1sEGf1vNxzRcG/KVNyTbu8rNKO3JGQJTMqfKEGzPanARXVjNqeU2b1nJTdUCykNMCVGJXZN@vger.kernel.org
X-Gm-Message-State: AOJu0YymQUwnGhnY8SzIrB6cdPDEYM7CYINinFQzAyyJjoKj+mbp8ktL
	H3ISte4TqLYCCWPL9D4kfVjZY7aeFXeQ0DdxG8P+UVG1QGgBN88A/iIZG06l+LLyS/U=
X-Gm-Gg: ATEYQzx55OclsV72SLdSbEjGCfwsDG9sJt5rjbuBfTKK5CACfaXdArkLKZsHxWIM4yb
	vDBlwXZgMAAJ4u7i32lFUe3y9/s/YM+955L05Zyk862Gq9i1gJZl/rSalAEs9nOb8RFOLFl2GBG
	sClsx/sQ2gQIIkvU3CP6nW1uHHYXs8LST4Nysp8sXcFRCTk9brbdXWn3H1EcxuVemOcrQrRDqoU
	gkjyQTK16fckP6S99u03b6K5rOpt1h7g7vMJmkyYkb+rYnQMdEzIMJEFZZ1xFldR64O5947A9E/
	3AMuvwtBv5SUs8I4f1tNF6+aZjmMpabw2IvAEEjDw91qBNzLSdp/h+LgQAVzS7KN0Q8W/ougI2x
	io7ITQkkiTd/uX6T/DzBxVKVeR5JyWXwee0QanmW5TQMJhLleQ7JdH1XQIhzgMbMsymSOnz3Xpp
	lmtYUTbXaOMQiAdeswL52lRSCR6+mx
X-Received: by 2002:a05:600c:524e:b0:486:f634:ef3 with SMTP id 5b1f17b1804b1-486ff01efcdmr83170465e9.32.1774088035226;
        Sat, 21 Mar 2026 03:13:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48704f14441sm8311465e9.9.2026.03.21.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:54 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 5/7] firmware: arm_scmi: Allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <96965696f3df12a7e64ee78191a727f7707cf96e.1774087290.git.dan.carpenter@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-33967-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 6C4F22E4AF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---
v5: fix subsytem prefix
v4: add r-b tags
v3: new patch

 drivers/firmware/arm_scmi/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index a020e23d7c49..42cb1aef1fe1 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
 	tx->flags = cpu_to_le32(type);
 
 	ret = ph->xops->do_xfer(ph, t);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
 	ph->xops->xfer_put(ph, t);
 
 	return ret;
-- 
2.51.0


