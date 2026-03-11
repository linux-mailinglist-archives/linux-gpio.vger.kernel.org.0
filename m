Return-Path: <linux-gpio+bounces-33185-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOv/CvvEsWnvFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33185-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF7269767
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE2273045E2B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A18A375AC6;
	Wed, 11 Mar 2026 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thfrsgzY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D63372B4A
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257951; cv=none; b=tz5tIpM/eqPTBldzqT5f3XfCnB1cyHk3E+CAHlGvOOBddOByz0Nhv/MYrX66mDUnUsWeG2i4lh7kwmC6JFBPnlvGvM7YRXmAHwNpbbUgeismnYjSHRLpVmLG6FNApJo1C+IkvrkO6lTFFb1SvL2Hu+Fi7LjN/MYDB2znJyoa+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257951; c=relaxed/simple;
	bh=uiuLKhkwbgJ5qG82TYs4zio4/Nc6RL2AdehoOVJmCbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTpO6NBB6tG+5EmDk1DeQfQ6YaPGaaz45U7RHZAiTbr/X5iZJKpNPXeN9tKcMLhRSAHYdpga0mLbgRnoj4uBhoKNWtI5P1LAUJmeNeJkYdrS0C+Ai5PToLE/LsTQ3Co9X+nRwWpYbI6d0ZKOnSUdJwNuIN/zoExnjGSdpT+7u2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=thfrsgzY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439ac15f35fso228110f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257946; x=1773862746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=thfrsgzYc/juoBaMoXh5jvF8AxXbvSkyLZ2ShmODj25R7CD9u771avdk4bkRV0Vm8O
         jdMTX8v8G11j+L/7vzWoCgLPll91EmfxMyf/r7hOpudpSN+u2kARRX+SJizKPCxNBc3q
         gugIq6D9TYk8jjMhKFE4Q88fIX7e2j9xtp+O41HAMMh6ctn0px/a7wY5QqEOICRqD9zk
         Ay1/h+9AhQ3cKoxF603Twv8B4X9rUG3YeRDM6lmH28F9Kv+3239KppCkreCNH2ATFcPZ
         RNB9Hgf6sCBK3HwtyhCv8/o3HAJ3UqG8Fjs9kHBe9yY0qysXzA6ExSea2GgeD0ISW06P
         QGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257946; x=1773862746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMLfC50swTxVVqIck4nOrGTGoLiTGa8vSDXPzAV9bIU=;
        b=n15ytgwOYG2sFghSiGBKndSAHHlSlOGkE1nr6GS43R+nYU0GKWE0tTlydxWnkioLUp
         agN7opfaH3mz1OgLrUIdjU4JjjnoczLfiwFZ460YsZO4NziLRlPjxs1NJ1j8XeMcZTKT
         0LPuJ6ZSLZpGdRtuWNZwrKxE/P2CsJRYHZsT2LSDOTP6i3iO57K+cZ9SrswoNcyqFNcb
         llqQUtKd1bausyfCgwnaTxabzs/fdclSDRhR09yIWT7Dr88U8Gd+U9ju1B/Idk04VoUX
         WwNFjsWG36rls1Y9a9jnIiU8PkqwydX1tfaDUU+3lY6tLs/uSACUDGtj7+DppkFGy4Te
         Yl4w==
X-Forwarded-Encrypted: i=1; AJvYcCVVNlb9iuQ1RZWfzm3PZ9n+TzsRr5hmuZWgLwG9+5uayIb66iwWH4IYK4lGPkyklv89QXTk+/3bajXK@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuZcBwyPaKKlbtgVswR8XuKAM8iUfmwNckrzQivZ5uyY9IMdk
	ssLuGnzYFGAP7VgSow9MPgKEB/5WJSv41v/VdOwzsMxrhFK601hssdpCt9gQSmw89vQ=
X-Gm-Gg: ATEYQzzy7F2iQoqGR1CnkRwqzQ2586cPCg0W/YiOT2h8EaxG5GwHSJNwfDWx3V8GjqD
	8aJOUzd/hTFZbNHtAG5D8AzPmrUdXOcnntOxsSWYQ+b+hlQFcCCWXGnDbLhwgEJItwpIj8OJsbm
	VJzWIROMQP3D4qEc6oIM9WGS1n+E5Iv6wue1+g5kll4tQpVoBZ+RvMOB1d2/PtvdkSa/fGZFSTY
	y0LOj+myt7dsY7JXONlACJphyMfKHI6YsxbOtpQaAkMxlYDbiZUN8MNkFLlTDONGz8A0ok0Eu1P
	XaHewhCdx6Hsd1bpe1gx/YjL6h0GUrzS2E2Z99Oy4/qwbrtiLYkFZtyavMgYxzvJ43YT3W8W1Ae
	bUlE8BCR9Uxc1k8ntRieKH2/RLblhuzMDNT+uD0m8rhiDHNq4zFAlNRZmM1dE8VyohVAzz9kU8f
	A0yh5O6iaLpHtZCzlf19YogtBt/8hY
X-Received: by 2002:a05:6000:1846:b0:437:6625:d0d7 with SMTP id ffacd0b85a97d-439f8438f5dmr7101833f8f.42.1773257946416;
        Wed, 11 Mar 2026 12:39:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm1655600f8f.33.2026.03.11.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:05 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to return
 EOPNOTSUPP
Message-ID: <e10b198aa9ed7a9cda6d0e9033a00d1c700ecf9b.1773150895.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33185-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99DF7269767
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SCMI protocol specification says that the PINCTRL_REQUEST and
PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
-EOPNOTSUPP, then treat that as success and continue.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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


