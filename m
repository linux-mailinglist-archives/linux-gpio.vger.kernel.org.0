Return-Path: <linux-gpio+bounces-15390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC3A28AAC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65953169E0E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 12:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729CB3234;
	Wed,  5 Feb 2025 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkQilnK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C64A2D
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759509; cv=none; b=jvbbQEXuU7EeL7GnRt5KDo+TGlZwNI0cmCEmPf0SrTDRRWRLsuhWDdJvtMXsmWYEI5rizyLW2roe8hadOa4azAjVSwx98x0VQhaAOyrY/LS2Sr6hWY1JJO1tAB452OjX0OrfHwlivcL9tbfqV0W5x9m0oc+lYNvKB1rFZa2wPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759509; c=relaxed/simple;
	bh=hdLNvV4ZDefdMJiuno9fjpOjHFosu7nQkZ7UaWvn1cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zs5gC1RRkVghP5Wt6J4/Wfo99EneYBEbfmYeCFai5MEO0aRxjbCR9Y3z/vBELn6wkCJhd1BaATlskWNBnJhjmGudMCzwDVKm5rt9G31Rtx5om6+Qac1p0XbEW4raBCW1h2ZuCHUEbolUvuANYLlQ+CczyEyd3ZUHorpq2N2+mKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pkQilnK+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43675b1155bso76824535e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738759504; x=1739364304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=pkQilnK+Njaw7IstoQaD0egpevB3pjAGduOBegd9faJL7xDKRDw/z3pfkSj5r/yg8I
         zn6av2BkM2yZEEJ9JDKa+C8XMHYKQ/uxO6RmUBfbtLhHK757t/l1aIQ94aHmT8CKe7Pf
         hpFrnnCsmNGRUmy86ARsTZbALNOYRud771uX4aCcmnu8SkKMgVKdpE33q8+nWMD8hMth
         dFtrRqs+pZUlRZRUA2igYC45SaL0gVQM39LWmlfKEiZdOQJI3JTeVQ43KWq0Z3gTHczN
         WpKFJ0buTMybC0WpcXG76Lg3JuosflzNL88/Vi5eQQI41kZt4/JnX0OZbySVJFB9adLD
         lOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759504; x=1739364304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=lW18i2UPFlI1U+K+DMOCla6eMwOvFbMCkO3qCZQtICciIsunZ3Vt/njyWoDjcWKWFz
         fwePZYGuJut/tijE1xWJ51OlIZJW1SgYuUiaH+HVJzN0Z/fk/3LepGbQHbeD7AHw6d62
         JRRQ/3dKzlTBFX7ts5hEKC5z0OkEexUqJ+Rery7n18m/GnEDaTDWcOqmxA/bO5shysyl
         vIqtDm9GRRRnJHYkk0wwqWbXFnMS1nK5P6RFHOgHeJN939VuYClNQxykmihHDBZuH1nr
         HMhr7PPYBQ2VgGAFfKq8DendXdpp3wZ26H3j/6ejZ/5gdu6EHsFEpHPr29opZDJZVJZl
         VMmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5CAwBCBEIWpLojtYO+v9Q8mnpsPXeylZVKpQ9ziv+ZLBRg1sc1bVFTVj9zFvgriZGI0Ist9LXRm3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy913WTieIL2rv+e9xhF2V204ircINIzyLEzHDBdu0LQkLeRwy5
	H4sse0Cf9q2mv/1iu+uAw2HB2s/ooAjzlhmry53tl1JIdxwzcx+JHDCxLav/owY=
X-Gm-Gg: ASbGncuTqjn2g9Ul+vIbeKuWg05emwTYLw3Jn8XnSw3pC2MPWXrHfXRkc63fxHSz2Ja
	2xexIcZ7OEo+FqcV4pxGazyJUNAWGQSVdDrAx2EGPzBvsFMOVpDy7NmPsrD/oAzpc85g13S1A1c
	3dLsgcrKh8vDJx0Zg9Ox1whjYmU8WuZyj8X5SkdTQedmxa4Nl3GX1AXQHWC/SaBtcMbttksnPjR
	0A1Kn/ZJfKOuGpGjTigvZDG+INo7j2BdoRqq72anYMOjT07Ffvz9i2V4VrP0e7nmHKnoGH8sjYj
	G9aYFyrA4IJaFBTQXDOR
X-Google-Smtp-Source: AGHT+IFCvzDOHTxQpe1wyNcbveuClBOWo7xzohLO9c/UKcth1SBw5nvlvVBDYrxutdBTH8HCumBZ9g==
X-Received: by 2002:a05:600c:3511:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-4390d569890mr18220445e9.22.1738759504528;
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db0e2f479sm3524769f8f.57.2025.02.05.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Date: Wed, 5 Feb 2025 15:45:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static int
> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> +		       int protocol, const char *name)
> +{
> +	/* cpufreq device does not need to be supplier from devlink perspective */
> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {

I don't love this...  It seems like an hack.  Could we put a flag
somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
because that's what we're passing to this function).

regards,
dan carpenter


