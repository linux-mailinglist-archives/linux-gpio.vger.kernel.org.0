Return-Path: <linux-gpio+bounces-33784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFkQEOBlu2lVjgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:56:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CA2C5322
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAB043020FE1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245AD2874E3;
	Thu, 19 Mar 2026 02:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU7IP8Dd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D8034F255
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888988; cv=none; b=OTZpwbrsx8Z/deMgv2ElMhWYnTw+MAM4d7YOtK1kvptPUOzWtiPD5EaQNR3+18+Azrc6Gd4qjX2cTIactx8xvD6jUjZPdBt2HetlenCpySRcf7lod0FeDskTZBsZ3Xr2D+8O8VlmSX7el2C0mPydN4H4R2HAB7sAdvYuGxJWCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888988; c=relaxed/simple;
	bh=t7uiBdls3lv7OiEXA8iMgDOA6vzogD6b3u5EkKw9yBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQsPlqSMvprhieTEjPhJgbgNiI/9gxD3cYnQwZv9l8RVLlRsJnx8+5HaVEMpvEa0LFptBDzOr5YThsHTdKGo4PiK0xcg1apdEbOEYkRaVUbQRqWOSu7Dna+heFPJkQBFBXxaE8kMCJ0b48kMCwG7J2KkHsCTCoaRWjhnLCu4ay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU7IP8Dd; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0cf039a45so329632eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888987; x=1774493787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3xnuvBTm20lU9ioy0TlmhVylnqjZKhbjidK+UiXkzc=;
        b=AU7IP8Ddm/hqqe4FQ88O3q5nuLLqtSKitlufs9lBPT+3RR30T28E1UeKmRojyoCVNu
         l0Jxb/ORjxobzmNF7+kMS/cmTonfSha9RVDg0+fj1L6jH9eqK903Nt/QVUbC01gAM6T9
         lZgW15nwV80sVoTT8030dn43PYpxsknRpqEBzjhh5R68accQFKb42JQWQynmV8XIIakb
         D/o5Scuu5bmFtBPKJkCZEEDq9tem2fy2iyhmGG4gupirxV9rtWgPH9p2L7aiIOufm4oA
         iL0vHv3JE7RGcMjPU5k/uh+CSvVVpRslVGPPiJoQ3uFxBEN/5Gh9iHz4P0JOjoPgRgfD
         44Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888987; x=1774493787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3xnuvBTm20lU9ioy0TlmhVylnqjZKhbjidK+UiXkzc=;
        b=ZZ298cmAEpdpIlapGBWQxTKasUHI/jj5nartBVs21oZGWY3I1Hv+/pIhh/c7VOFu8h
         q8JP48KwggRZMmgBX+WHFyEFfvjhHcgBmaOiwzZ6U3SYipESVmOklm542YQBEcWBNILR
         E/4Db/5oql878qe6qpLWWsPEMAqD5L8KhPDwv7puGhEku9lOjNov9irZDfxNoiRAAARk
         2DqVAoBQ/MtKTUoneuGR/uYZd81AlW9JCW5lxqe6l2AjaT+eaFp0Pzv5f3r2Kg0D3Cfy
         yDQUUY7lGiTTMTXVTcH9txkQb6IDSITZU4lf6gvn0IzM3hLPKIRSZ+ia+TR6eG3qlLc9
         uGGg==
X-Forwarded-Encrypted: i=1; AJvYcCVytf55N/GFk6NuV6OdddYm7kw3xt54ElOAY6/4rfMlj5dsaV3xQS8oIHyzTVShZDYIHIMK0yrSx70w@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/AlQ4HMAGr/NQtimR7JyNxawJXDLpPCuSXIqGDe6+s9YZRFQ
	HLZJeEih8PQE9x1WOapaB1ZBVlW2j+qujUr0VwZCb8He30Ef4pEin+0UsV55icyP
X-Gm-Gg: ATEYQzxPdCCQT47McMmBiMS0SXoVHuRB00OS/8k9fmLd2dM8mEeyzZWRaL4NkJkEhXR
	LU6vbH3fav2xKuoa1T2SUikCULWDndhkommqz+kOp4h/ubyOMjsAK83dltld68c0O3/L2UmHQ7m
	54zx0aAJGdS1Jq+kUkmXjIyxz3vp0l5M/zvozB5K0wqa75OsgkRjoegTDuw0DI+BATp5Dbdm5YK
	W65I0qx6iM4f3Krmlau3d/zfVxkV0WgyRebnSAtV7OZ5ogYegdaJMn5rTi3A8AjEgi0/eF6NUBh
	s70z+EaDDpv7rro0IpSavgwMB/P+0SzsDMvxQDnFkAe8+gYcTlU6rrIWQf4M++0XX0Pof8+SG+L
	ztspjjbMrJlYTRbaQejaC0jSwL4bF6c2B3wOg36sYPBaWFBb5yck1Ysja+QInuGWMi0AlNELLTS
	XyLXQeVqqg97BohmoBORntaY4b2nHrKUkSg8JSctlSjef4F8oZuBYZxhQffxiLEwwHcfQ1mJjXw
	huyG+FFhldoPA==
X-Received: by 2002:a05:7300:a2ca:b0:2ba:a2fa:84a6 with SMTP id 5a478bee46e88-2c0e5101a34mr2974532eec.24.1773888986579;
        Wed, 18 Mar 2026 19:56:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 18 Mar 2026 19:56:17 -0700
Subject: [PATCH v2 1/2] platform/x86: barco-p50-gpio: normalize return
 value of gpio_get
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-barco-p50-gpio-set-v2-1-c0a4a6416163@gmail.com>
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33784-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B18CA2C5322
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by p50_gpio_get() is normalized
to the [0, 1] range.

Fixes: 86ef402d805d606a ("gpiolib: sanitize the return value of gpio_chip::get()")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 6f13e81f98fb..360ffd8505d6 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0)
+	if (ret == 0) {
 		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+		if (ret >= 0)
+			ret = !!ret;
+	}
 
 	mutex_unlock(&p50->lock);
 

-- 
2.53.0.851.ga537e3e6e9-goog


