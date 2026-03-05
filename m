Return-Path: <linux-gpio+bounces-32607-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B2QCj/YqWk1GQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32607-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:23:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450A21770E
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57563300B2B2
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8390232FA38;
	Thu,  5 Mar 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRf0xQTf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1E29B8D9
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738519; cv=none; b=b6GnOb6JrncqvDMyyW8C/tff/OouNdU7iTMHF1Du5lQyGx1O+hIsMWTyf0c3wOGgHfhUW3sNIP8mtgRcX5IprEx/B6/b9ytjH/mrtywsOD2+VlgMXj3SAOo1R+1ITNgIR7bD6ScQXWVQFAXsVQ4tj4mXSOWUbA+1UNnb3+ruVxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738519; c=relaxed/simple;
	bh=1imMtC0/yYHco2vsVj5IgBrcAsYawBE93Z/RmAB2JM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdG9zDiJgpEXOvT49Zt180+ae60cI4sedD1O8LdJ2WTC+VX/EPZV/GIcTAwvSzophqjiNHQ4J/3PNLW8rtnauaoz6q0Ipm1YkzfWkNEyZhtDtSttyJb4ysL3qiik8acArqRS+Gkvy8K2vF//wKzQXRI3/UuOHqM6F26cQsKnRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRf0xQTf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso4649794eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 11:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738517; x=1773343317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lil1/Z0c1c1jQe+1RB+TZc6c/UAakMjk1ihKBwtS5Vc=;
        b=FRf0xQTfLZj7RHV0qdDmA6ZSn7YluCr9jJ0AwtYwACrUadxh2BsqUzGR9YtrcnUto2
         CgozpJNsid1Aga6fVeHgO6c9U+Omf5+NA0PptHJlNYr6wf42TO2XkNiYbHms7RKy29A9
         vzmxWMDxD+abwwa8og1EnDm6+yMJ1fxanASIM04VnBp+RWCYj1Donh1gkRbVBuLefgtm
         +lqdx/lKjBMi3z+HCLkI8nhzUOf6ab5CQqk3fD523JOtcsTdlSOsGzy7R2TGqkjR6feH
         YYDPTv3UPABIRaLokIDxQcQtGYW/22t8Hqf8Ux4+AzzXzl913sEevp59xh0VgOZGwl1t
         0zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738517; x=1773343317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lil1/Z0c1c1jQe+1RB+TZc6c/UAakMjk1ihKBwtS5Vc=;
        b=mSV6NnJy0K11crrW68zJBzOPfkN4hEt8aUqot/fTbtxojZF1/VK2Eav+FVcu2EB7Wj
         yzsuota6tV+CXEu5AwmdAw7us8sppAilIHPKQlGsXV9uRNd6VYZHh5yUPGGE1J93B3mU
         fufFkbS9DUpC1AWSn7yfe9gnieIvXvraINEnktWMEDT/3o37UBhh0xm/SkesQ4JOs9K8
         c0y8X+wIGjhur9YvIMyMeo7I6I4dB1E/qlXqk/8sOEzksF49W/d39dAVBrPodQ2WLaNd
         yDIvCgKP32XuD6M/LIV1AqTyxn/qyfXRfHC8NPa3+guRppkPEsZYvxaQXZfjmiqAtZsG
         gSPA==
X-Forwarded-Encrypted: i=1; AJvYcCULxZ2fVS3BTHt/Yc3zDG499tteIZ5dLj/GJyfvCaWaUlKVcYMeczXpXE+j/iUh93G4k0wjvy8iVBSD@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCnjGSejFfKEeWbsuDZH/sq+91rl7e2r9owDooUqmfTKEfDGM
	4ZuMkpm0BWKTPJyzcehf911qa4hn9pZ0mamXM34dDWRFzaHTl+tk9vZc
X-Gm-Gg: ATEYQzwCBJkAjJKUD7CClvsOusgSsaRINZ0mup5EUt3hOSwlGJo/hkNuS5TvFUAqUrf
	m5b5D57wbcubi8aYHrsyCQY65dXS0YGKzpI/WENl0aqgjSgsEsK0PrTfnHZoqHOXXi2pYFsWak9
	oEFaGeilD2rHDxgUv8MNuct2TJi0JavW0sTOhtkCsEDXdCNcfmMLYzl09fo5WE/ZSd62SuCaPeF
	X0AC8xhKKRbL4f5bc9G3v/QgL1OZFrndmUjRy40C/k/vWV8IJ8HtLaJMh3fX4tXfkL6lS7Y+YxW
	bdRLCXh/blI2va9EIqCzh2Yfrl8yClCVHvg2Y67v6uNBIJPY3KrrUivgWVhX9hKKGrK/5ia9LfC
	yRh4/8vwJDrccBTQ8g+jh8kCRFBedtcHXuFC3Jd/5xGo7Bz0P2HhhlL4wZMKpn+eqRBJasXXFQQ
	Td4omsIG0Fcynd2MM7Pqo/jibRH1jySvzloyPmkaXgqaka0YzAuz2IoqQd2dqE5CJUVuKBScFgg
	0qk9CKTElokGZA=
X-Received: by 2002:a05:7300:ad2d:b0:2be:ca4:e145 with SMTP id 5a478bee46e88-2be310ad068mr2688799eec.21.1772738517123;
        Thu, 05 Mar 2026 11:21:57 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7788:d145:a740:ca06])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm10800980eec.14.2026.03.05.11.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:21:56 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Mar 2026 11:21:52 -0800
Subject: [PATCH v3 1/6] iio: adc: ti-ads7950: normalize return value of
 gpio_get
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-ti-ads7950-facelift-v3-1-a23fdd1a079e@gmail.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-94184
X-Rspamd-Queue-Id: 2450A21770E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32607-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,qualcomm.com:email]
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by ti_ads7950_get() for output
pins is normalized to the [0, 1] range.

Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index bbe1ce577789..b8cc39fc39fb 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
 
 	/* If set as output, return the output */
 	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
-		ret = st->cmd_settings_bitmask & BIT(offset);
+		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
 		goto out;
 	}
 

-- 
2.53.0.473.g4a7958ca14-goog


