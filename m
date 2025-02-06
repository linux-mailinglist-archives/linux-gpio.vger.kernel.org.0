Return-Path: <linux-gpio+bounces-15439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022BA2A7A7
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FADA188578B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A588228CA0;
	Thu,  6 Feb 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERGVUPfd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BE22B8D4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842018; cv=none; b=L9D0g2L4jbMO3gFS3WwyM1xtfGbC+E0kZHpWcpVAhXkinnaljVXijHhnQ2VyOiaJ7csmsR5S0jAFGSOKAjT4NqDZQSUmuyKVJaLiotVa/3Dhofj9+CUpRbiOm4And7dVYXHXhHH7+Z0l+f2aMxjITrkpCw9oocTNubxcbNU+h0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842018; c=relaxed/simple;
	bh=JwrnIDxa7fiK9DOXokfhuwLBPcCS07LencS6UDbMmbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6cOYNuXBkNlHzmp/wb+M8RKmOFra00sKO1S+1leZIjdgM8Y5yjq0IZV9/3eyjCTql9vrHtdYXzM7MvhGuB85X/UQtEEh/DPkDf9MpqF9P+HrdzEVNIseUwXJBchl3qq/hQVys0IK3cnd4NMm0WX3lwULIbsrwsEdTnNECEiHOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERGVUPfd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dae9a0566so348807f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842014; x=1739446814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=ERGVUPfd5717HiKZFuAUGPIxRt0qdPYNkojYyoouiXbzrvYxtiJ9f53ZENtnk3xf3g
         ZavxoJLU+77BkKgbD/VleN228CftFaqR9EigNCmsy+sXxxkESaV4LbYB+7ePHgVdqGof
         hgAtvQztdvjibJmSfdpVvwwuUPtTlFwXhv7EgTOl2IhDfpEPEkaDQ3mFEHPrMy8CZXkV
         vxg8SG/wzsiYQJ6UIjurpMPC3ktzRI3fBC9lHSS9qEBiIunldKZopxCIYUnjZiSiJTvZ
         1p8M94O1Ki5Z4qw6WqqrsZwdMvRVleTf934rjGSrzRFe8mJcAHI4tLIJJWNCx09p8eru
         5lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842014; x=1739446814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKka8q8Has39PLR0Yd8RpCT4IAmN7UpWKg6ZilU2jFU=;
        b=uUNWymDgAWzPY7q6n3nDMxdADV/8v/5PdBfvpyFLzAmiLhuQanp8bPTmlQkrETI4x7
         pQo70SMcV/NO2N3kVcxPeUp8CuoPXQ6y2bJZqofL4mIyyaaxTM30rr+4dagSy92lOm50
         UE3usc/czUDmuRTJOU/clzuosRIPz36WT9bzWiY0SO0VSiJITD/cgmeUx3Q8QIaHbzKy
         6TdWUO/5pGxvRnTfg3vb3EqK+bi3hkHCElcWIzlW7R96RSSDT1T4pMemXi3Peivaxj9T
         qz4I8TlSKjVTTn5hbyX9i60vnO5P73oupPcg10MLZoiuvc6/5D7NdxzdI72yE+jQ4f+o
         3WHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHcR6O0LES9E35AIjZ8Y355+x9K8Bql/NAzi30gK6Si3lJ5ZfI14WJHm8poLdwwQf04O7Bae4XgIHC@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7ZNkC9u9moiYRH3pZ0Gylqx2735N4lIY6LQBFQikCDu0xvgI
	hB38HVp+IvRsD2V5JfrzibNdNTbxFRjGrk6C4QPIOe3jtQq8B2Rgp8aaTmCDFIY=
X-Gm-Gg: ASbGnctOZTZxdhws8LNERvpDCBCUPqJEPigaXGCy+TimedW/7/gW1rei1c8a2JGS/On
	WkG217wz9tg44albW05vfnPwO4P5Cwp2qFzclXPFGoJuHST6syNfwM58a0UZOv+4rSziJjFL2fI
	wLnOByrdvFqA2sqpqlM8HSjSzBhyyVsFhX2dCzW660N/fxGbVT8bBlKMrkcaYvuol+CWgg6zKtj
	EKpAA0BvF8zCXBDA3NeCqE2uBc+QueXg3//h8hgWaeXb9a31ggn9WGCaaWRYl99mvMT8LZH/Own
	REHLoEpva85GUEU/a6Yw
X-Google-Smtp-Source: AGHT+IHK7xN1+O0lC7SA+Z4hYlZwlXq1mhwhsAv5rC/JniJV62KNS95+EeAeYIVWA7BzbT+PnwAdWQ==
X-Received: by 2002:a5d:588c:0:b0:38d:b6e6:4445 with SMTP id ffacd0b85a97d-38db6e647bamr3919617f8f.24.1738842014402;
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d9334e7sm52136505e9.6.2025.02.06.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:40:14 -0800 (PST)
Date: Thu, 6 Feb 2025 14:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
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
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <15f20562-d5f3-4432-94e1-06c8174bf3c1@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <230612a4-92ee-4acc-85bf-f1c47dc3c35b@stanley.mountain>
 <20250206110508.GB22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206110508.GB22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 07:05:08PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:02:04AM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> There are two cases:
> >> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
> >> If both drivers are built in, and the scmi device with name "pinctrl-imx"
> >> is created earlier, and the fwnode device points to the scmi device,
> >> non-i.MX platforms will never have the pinctrl supplier ready.
> >> 
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >> 
> >> Introduce machine_allowlist and machine_blocklist to allow or block
> >> the creation of scmi devices to address above issues.
> >> 
> >> machine_blocklist is non-vendor protocols, but vendor has its own
> >> implementation. Saying need to block pinctrl-scmi.c on i.MX95.
> >> machine_allowlist is for vendor protocols. Saying vendor A drivers only
> >> allow vendor A machine, vendor B machines only allow vendor B machine.
> >> 
> >
> >I think patches 2-4 should be combined into one patch.  This commit
> 
> They are in different subsystems, so I separate them.
> 

I mean if the i.MX driver prevents the generic driver from working then
we need a Fixes tag.  It really makes it simpler to understand and backport
if they're sent as one patch.  Normally we would collect Acks from the
maintainers who're involved and but still do it as one patch.

> >message is a bit confusing.  I don't really understand how the
> >"fwnode device points to the scmi device".  I understand vaguely
> >what that means but in terms of code, I couldn't point to it.
> 
> Sorry for not being clear.
> 
> The devlink framework will take i.MX as pinctrl provider, because the
> fwnode is occupied by i.MX pinctrl scmi device which is created earlier
> than generic pinctrl scmi device.
> 

Ah.  Got it.  Thanks.

> >
> >> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> >> With both drivers built in, two scmi devices will be created, and both
> >> drivers will be probed. On A's patform, feature Y probe may fail, vice
> >> verus.
> >
> >You're describing the code before.  Is it a problem that only one driver
> >is probed successfully?  I thought that would be fine.  What's the
> >problem?
> 
> VendorA 0x80
> VendorB 0x80
> 
> If both drivers runs into probe, VenderB 0x80 driver may crash VendorA firmware
> if the firmware not designed well.
> 
> Not big issue. I just think we should block the probe.
> 

This is a theoretical issue for now.  I would just leave it out of the
commit message because it's kind of confusing and it might not even happen
in real life.

regards,
dan carpenter


