Return-Path: <linux-gpio+bounces-19596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 886EEAA922C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727FD188515F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 11:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C6C206F2A;
	Mon,  5 May 2025 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2KEd8tn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F6205AA8
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445091; cv=none; b=Tb9M5iUSig8UoQ265VCm9E+68E+ggcbV1PrYLSsLRccagx/lrEbOlMXJq3oOB8nBQU6pBDH/Lrc1NSL7c2Wu1/xsdPckm2dV6AptQ8tDFWWmuj+691CX5mzqu7xed6NA8DSou8kL0TsHUnGGb2qBszndd0ysmN6pGL1IbvEq7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445091; c=relaxed/simple;
	bh=R/WHlFZFKv+KxPs+9oB1B0r5TXqskrjUVFLrHry2GT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD48JD7SCQaaWWOBHzi9aoVeS4sL+ObJg+9YMGvOFK9uUX6j9kA9rO4ZNWQKaxQcjr896+PDxcgn5alzT8hdUJBsM9OqJM8/RVrTYuG+x9ZpBzAgCK3KC3ZDjHWfztTvcUpCyG5C9S2GlQQVQ00dS35sL79SdHHC/hJbyPR3wTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2KEd8tn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3125369f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445086; x=1747049886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnfanRT/xnMsGy8H0p32Y/2L5KjP3rCv4iXcBwib1Gc=;
        b=B2KEd8tnRltXOjFpEuJ6OfklU49ySnIoVTv53sDC0kj8FwlTUA7171/BXaQH3k+1Ws
         IRnEL3nQ7sKN/iPLKerTQxN8DOEKgxNeH0CuNMc8epiGXEriQMbrRv/w2OlFcMNMlokE
         NOtHQq2iiVxLn/TC8caxIgYF6e8fExY5e04bn7JBPJOIRXrdo75PBkWrKw0jdAr+o+kS
         Ds2FBhIi+qXphfRRz4Dypw0pW0345b3Ky20Fqpgqpsusggjl5lVH8QN8sZ8KRESopLNM
         t6nb3ZwPUnwAXLCvW9bUR4bWJZ7H5Ykl2ifSULVhx75wpA41zSrIKIak2TGV9CrhXDzy
         sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445086; x=1747049886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnfanRT/xnMsGy8H0p32Y/2L5KjP3rCv4iXcBwib1Gc=;
        b=UsgQ1gBcmBbqf5cH6KcSkPJNwaEPKybZSOSD/bVjXBxKlEDHG0q/OHRQfgN1Z9nDoI
         yCgOCrba/2f8bg7j0mf0fASeN537oYgI0/mIHHcIJclGl+BspZPwS6csycuvDA6EfHrx
         Xn+USSW2tIIQuRbQeANyD9T/B5JnQiKLuuMDAKJOZbWPBUo9Bstg0VPPZjT2cVmfOKZo
         e7vi85QQlj9/MK478QariGvHhtSo9kQrZ8tSCEpd+OQD+KYOcWIpYYkYQhnXtcrSEUyu
         eG2kaqHP8vcVd1pooJJBfY7DisI12Xj7au+2uhGy+g/bbYN14myoF3higUrmTUXdvP57
         HAhg==
X-Forwarded-Encrypted: i=1; AJvYcCVpnaneYpNx/sQMX7OR/Ga8Tvvx+f8brwW1h+GipkQ0Gr6zNcgIGri3Aa0+cISqx7tKyCXjQOUyPhYq@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEVwftoaUp8KUFcFb9KFJMPpnQZhO+vTwc4WH/CQlI3Aaigdw
	77Brk+16v/+o21UA2qRR+WccK4m3F+mUJCHrpqPrH0S59uHGYkfKK4r0U00Mln8=
X-Gm-Gg: ASbGncvE6h6hTmpv5EFWRcYYVhLvyogZ06jloi4xRnOnfOMONRKYvVBPhVRvmLabQO8
	CoFCDTKwWUJC9m4k4e+ImL6xEHvZNdSjsDq4gFFHlO9eBWW08GQoMrmCM1/mDEzUbNwmyIeBfC3
	Lb5rMJ8VqpYaywtW0hAGOHmPHm4NR7scz4gH+033atVrpQWlblHJIwgZwyr76osYAayTxnDgbzt
	sVCgeCTle8d6um5tnWfoUql29CL+gDZg0aym6pPWXVrwYV/59j2XgjydwnFCi6SUxJzUXhLn6fV
	FK1Goix0dVZPsvu9T5HYuKmhR6gAkOLoCvtvMXk8vdBM7w==
X-Google-Smtp-Source: AGHT+IF/dmblFRkX7iqKnSY3Ui47NKfre3JcFqznctB9OO4eNwvIWHtPXnnSjPUS4bdilcUbRpgeUw==
X-Received: by 2002:a5d:588a:0:b0:39c:30f9:339c with SMTP id ffacd0b85a97d-3a09ceba16amr6598523f8f.28.1746445086315;
        Mon, 05 May 2025 04:38:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae8117sm10276584f8f.56.2025.05.05.04.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:38:06 -0700 (PDT)
Date: Mon, 5 May 2025 14:38:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [RFC 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <855acdd6fcef4856c4fcc59affd3a191f74dbe82.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

In SCMI the value of the pin is just another configuration option.  Add
this as an option in the pin_config_param enum and creating a mapping to
SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()

Since this is an RFC patch, I'm going to comment that I think the SCMI
pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
enabling and disabling output on pins which can serve as both input and
output.  Enabling it is supposed to write a 1 and disabling it is
supposed to write a 0 but we use that side effect to write 1s and 0s.  I
did't change this because it would break userspace but I'd like to add a
PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
But in this patchset I just use PIN_CONFIG_OUTPUT.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c          | 3 +++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d5..362a6d2c3c68 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -250,6 +250,9 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
+	case PIN_CONFIG_INPUT_VALUE:
+		*type = SCMI_PIN_INPUT_VALUE;
+		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1bcf071b860e..b37838171581 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VALUE: This is used in SCMI to read the value from the
+ *	pin.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -135,6 +137,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VALUE,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_OUTPUT,
-- 
2.47.2


