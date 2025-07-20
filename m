Return-Path: <linux-gpio+bounces-23538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0EB0B7FD
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 21:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943B6188D986
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B822D781;
	Sun, 20 Jul 2025 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+/0gFiA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD5224B00
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040346; cv=none; b=s70nK+qsY3nCc9L2GrZTxN5tDtrpb3hJL1t3CdSFl6Ch46+ULIpT/D8JA2fSwr9rfAt8a3RVTkBhytPdIIiKR9o2KbOI2K3WHCxH/G64lntXid/yAgGZhuD2JxCBcf7KCWvd0oyqM7dWkWHGQ5euuAl6h7Thd/ccpsyCtZG1jMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040346; c=relaxed/simple;
	bh=9auUBQhB8O3iigsJ/KehzMZyztYeJf1B88SFG08/JSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDfdJOliMyneTQ46MXI2YrMd91mkMmTIr90+x+Wl8YmVfVHGscKE3k6HuocxCR7Neuko+241iPoE+fta3lp14pMgiIQXP0OHEA7Q2GMW4sqEN3G8O3bATkQWcJwZPfo/4xPIrr39DUDp0eI0U5M1WwuPtqG4KCoLE039A/mxt+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+/0gFiA; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so1274949fac.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040344; x=1753645144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=c+/0gFiA/qn3Onc2+WgOALIKUlQUOqNyXHF6oVeIeR/LLNQ3R1e3dHjjeo2NsToUwJ
         MOuUNzTbTd6ursFoy+7xvAS7sq9OrIRY5Qp8ApvyGw9c6+VI8EL9GM0P9BvtaCgQNMey
         dZF7Ac/BgxDZTk4cgbVtWWIqo2RlmZjEyybt4H4rojPyBkPa9Vb6tSW6TXr3MJNuEMot
         roGDriTSTnTK3nkx1EPpcdOpwwEiR5++pf5mvR/OMV6GYjFubmriNjUm884SgICSfGg0
         ai0ecgFYjJmrxCcvns4r2ftWiOmrchzpOLJI+k0l6dp8p0lYIB5kBN+Zc0x/YBg4hwC+
         Ss/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040344; x=1753645144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uCGwy/uGkpfb0pvgcXUB8vgobgSJDaGpbJSvSenFqI=;
        b=kV/3Qazl29WemDB4rP6/S3XFMXAfRquqWEX+61shYQXkmLlbWzqEoaiAXTIR9v1GRx
         vSmTZxw1o1GGIIQHUb9C4cdMKAdtNo3OJ3hmS3hV14TA/E1j6ducg306IEjJadbXVswQ
         YujRhJqMqqSU9x5WXcl+cJtRsTS958ukKnzFpGySi58CkEDZ66VeN3wlnTjCrtPpqMQ8
         j8yZDM6yPzybGn01jyzZ0SiqDE5bO0kyATz5rDnsq1wa80uwVV85eaSnDGCG8f3ndl/+
         yQ1jVoSZUvAlmKVq6KGA2PH2bdXCRYAjEkADdTPeVcv1zRi9jIwG7wQVV1jabl9npcXy
         346Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeKsaIJmQAGl2JSeB7fsCg7HKHdX9yKu3mZCUuE+9R/7VpgTNOFfeLnmHp+18ZqEhVpPiBtXtPbJsM@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwH2h6VR1ab5LC5EZdgTpDu2/d/CNoNREXtbQmHMowzqCImOF
	A0FeunB5BJtmxa2QXhkLpScbKRGBU9pWxMdWs8YRgO40kT6oBPjlv2se2MkRgPevFYg=
X-Gm-Gg: ASbGncsQ1+q3GrhwqSGcNLfkOcbMplsS1cpI6g3jriUPf2yyxzP1qJd7FFGl5ch/aCE
	kThCuZZoALzKUUKJGl57ezWbe5Xv8MXCzQiWLvWIMiCs5VxwDT5LkZnFSRFwcuURQigKazp/eQt
	iJB9jNEkAArc9xmZzf0TXbr32Zh+G/bUFiAyukvqpaCOXcsKmZIO2a2Wk/InmeWQPJgG1/iCP0a
	cLB3GklaNdSwEiT3CIrLExMNHEf08VpmVyPlLUMhAV7i/Grp0ZAJsharks4p5z2dhNMiPJxR66k
	MhpTPGBYzC0FyhvL9IO7U+3ftfhwzI7ptKMeHO9iAR42zKMu4Bx4CprSb0aL8qEcbvUkkH88iZe
	v5sH8k0jpvXM=
X-Google-Smtp-Source: AGHT+IH8XmyhhsiwXlgfzLZBUO70j3GY7Ll+3IavnthbKLQPwxSitZFNpac9MaQeewUcKGCyD5gWsw==
X-Received: by 2002:a05:6871:7383:b0:2d5:ba2d:80da with SMTP id 586e51a60fabf-2ffaf5c8720mr13188863fac.36.1753040342019;
        Sun, 20 Jul 2025 12:39:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-30103d1d804sm2810796fac.29.2025.07.20.12.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:01 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
Message-ID: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>

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
index 383681041e4c..d1f2f971cd96 100644
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


