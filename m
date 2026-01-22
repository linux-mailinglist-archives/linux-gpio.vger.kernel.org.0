Return-Path: <linux-gpio+bounces-30923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBBbOLJGcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:48:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E863692D7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 050D13000724
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1123347CC8B;
	Thu, 22 Jan 2026 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZa+UIUn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4F244D034
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096640; cv=none; b=GmalLVIW8AGD8Z/VPcygTzGKi9mkPVpq2rGz78JrRRUWAzFxKaBW2i3I81nr096HvFo7hl0piBxygl6X/y22vt3aYHRuuzEEOolGEULDjT4InP/Tw1dmFMlVGDXrL7pHv4BORzHxBYcd9iZofINlHzXO07SB7XplKhdbs5ivkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096640; c=relaxed/simple;
	bh=GVzTile/yZwpKHms32vEGpKMdnPMenoAs31RnHnr0vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khT4KDZpI0qXDICn1Aji8p1mNwgM/Z7EwG7XXUgCPe3dmHBsHQZXqmk5AelkClx8k8XmkIB28fVD1eqLTd/olRhbcEDOJlg/oGeMLOpZ00xxFODwIiY2doYJvNCRNWFWoejSjBCboT8VBkLioNeesA/SCBPOL780zpZ/1GtWIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZa+UIUn; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-658072a4e56so2285962a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096623; x=1769701423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mnYMLTw+v58WgRJpE4wU5fkf6SbugO2jmsGWp983LU=;
        b=IZa+UIUnxuvCSVrceV9c9aeWUpLVihpwcjYklH+anAqCNWYmznLgqdLr5ZiVC5Ywrd
         y60FCfX2LBUzMHwuLysQWqMnOOltb4KsoVDyUsLf9i9ku6kcrlxVPLnjGSClJxciFikO
         anp7vvJGjmepNZ1R0yZ0J8QJ+Xi+KdAF4MKNCJdYpkjAo3Zzh2BqlhdEMTPxAfweQ9aY
         s0/pyr+f4Mh9/BS4X/IHzOdQG8g0dImjxrz0ELzyVGEniNEFs/ep7gAD4d1O6omWVjhp
         z2YIw9yhwhB70p1R+F8HrWhkNEpEDfqUOAz5QCnwCQJLqySgpfeuy5nxejPkE9W7qgFs
         g6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096623; x=1769701423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5mnYMLTw+v58WgRJpE4wU5fkf6SbugO2jmsGWp983LU=;
        b=LZ5Jmzmt7PiBprKMsAwTnVX/3VdupilczwxN173lEEVabu/c/IOgqlCro70Mxnbf++
         aJVLeDW/Q1QIYrxXBwhPcSXZIM8fTRRPXSeBkzbWXGy674J6XcCLl6giR9+lJemOsgQ9
         FfQgAxiCB+iFMvS3Hc9+Vn8T/Kthdfz4Lqci2Y8fdL7eSzrn9U35kDIbb8cKdiicJQz9
         pY7jmt13HRmpyCI9ZJ6PYyE7CkBdbORpagLBWIDqg0ODIdDUvfYrdPyzR+H1yuvZ9Tx6
         AAIDDeI3yziciIWboeKbYDxL/KJ09fN9KYKDKuVUlWy+XdmpU856TUnWZSfzh12cFJrF
         OOaw==
X-Forwarded-Encrypted: i=1; AJvYcCVT6PTprj8kZxXSZWLP1vtW+XnR9NuWCZvkCDN8Y3L0w9Gux56+6pijb5mFfwME7AEpXR7px5mGZSvp@vger.kernel.org
X-Gm-Message-State: AOJu0YzMk6QJ4NUQbgQgC2jqWCBe52FIkmDzuGpMpLaysnuxhJ2zL/RX
	1MgUvqetKE2nOb8bJlSuTChXnJNFxp9KlKdRyKsIj+62zWM1tNeP0aG94hgUXdV8U0Q=
X-Gm-Gg: AZuq6aLtFYlZqJ2rsZOyg/1DRC7X9ONHqNqpFrywwjFJprfb9PJJ55W0F/9JCOt4neI
	boRzMkvyExCYLLhOv9x6kFm4IfpxksgmlhdSZfQYtdi30sY9XGYDLQS8bWKZN9hKRjPxHWyeYb2
	fv2O4fiWuXN/EkTbro0RlkPHyHKFHIpYwAg6PYFDviye9XTfEJRMFfmXb2XcaEdKmvfuNlBArk2
	izOld7bus+Tx3PMMZQZx6Wg3NNWMEKYZRqazuz6X2nOQ90JsoxjsIj0pJ6u08eONU4FJZaKxcT1
	97rkEJGPz3GFLT4eIR2XZIzQHVGxCaPJ3AX26lhMGtgYcb7op8Z62UFBQyiqi9uJ1F7+Bcfwu3Z
	Va9tH/JN4c7Ys+lJvZ6CgaHVqkBajWjCLXFRkIl2U7xyJ9eujeGbDFOMwwQBTJr7QkIGKdRr9BX
	qKIUVjxymvgxwkwHM0eOq9eus/oHNQGVduzedJbj2d/wFlyjJ8UHX3ZLZ73+gVVuPZLAwPs9753
	GVc2g==
X-Received: by 2002:a05:6402:50c9:b0:64d:2082:d027 with SMTP id 4fb4d7f45d1cf-658487b933amr25772a12.29.1769096622839;
        Thu, 22 Jan 2026 07:43:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:37 +0000
Subject: [PATCH v7 10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-10-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30923-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 5E863692D7
X-Rspamd-Action: no action

REGULATOR_LINEAR_VRANGE is similar to REGULATOR_LINEAR_RANGE, but
allows a more natural declaration of a voltage range for a regulator,
in that it expects the minimum and maximum values as voltages rather
than as selectors.

Using voltages arguably makes this macro easier to use by drivers and
code using it can become easier to read compared to
REGULATOR_LINEAR_RANGE.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
While this commit doesn't introduce any users, the upcoming s2mpg10 and
s2mpg11 drivers are using it.

v3:
- new patch
---
 include/linux/regulator/driver.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 978cf593b6624228fe1fd9c2a3e186b53ef172f8..977755db64c6dfaea7246067eab0d9a2971caa01 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -53,6 +53,11 @@ enum regulator_detection_severity {
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 	LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)
 
+/* Initialize struct linear_range using voltages, not selectors */
+#define REGULATOR_LINEAR_VRANGE(_offs_uV, _min_uV, _max_uV, _step_uV)	\
+	LINEAR_RANGE(_min_uV, ((_min_uV) - (_offs_uV)) / (_step_uV),	\
+		     ((_max_uV) - (_offs_uV)) / (_step_uV), _step_uV)
+
 /**
  * struct regulator_ops - regulator operations.
  *

-- 
2.52.0.457.g6b5491de43-goog


