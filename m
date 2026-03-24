Return-Path: <linux-gpio+bounces-34081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E+SBjt6wmnqdAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:49:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD00030798B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 12:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F0B430D395C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 11:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7583EF66A;
	Tue, 24 Mar 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybjQ1vuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8073EE1E6
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352478; cv=none; b=t9tYyvSwgb3krNWm13v8qZQ5iR3t0BTDy6TEjSB/4v7/9x+IAYQwgtZazVyRTTVCTSt/3k+UhjJ7spyBSU5qixbvg8tkLLIpGYY79ly3ZEncZij3FKLU+PzXg0OKNytkxpP4TGkrzFWN20AXaZwv/B/0NSgKvUOw/4UDeswwums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352478; c=relaxed/simple;
	bh=OXqM+MTY91699d5+qggzIhf1ktnjSHwnJwsQrE7YEek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFaLGpuAEnx11U3h3pXfXb1GuudmPL1Tew2Mm/IqhAsEsmcOoN5dz0BwMjrYHSz/Qo17GOusLpIfaTpPHa5wCVFpsuuLGksTLd60QxuDTsCGmQ0Ea5lXAdT/q63mbRmL1g9BQ6LCtY+CUCkwBJg14t2mJqapEw/eg6HuWaLecDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybjQ1vuj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48704db565eso29835585e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774352476; x=1774957276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VmWwTXRsCTU6xreKD6cFKnHBxSAyaOlNqc0k2os1GGs=;
        b=ybjQ1vujroE5FLVA7KLcTYdVb+E/PrHVf+iWCN17lBmO+vmuIgjg8w+AkrJBPzzt/L
         wIYD76lB56H5MasfxDalSmTE9L8BcuzSu+icpQqSnnA70sM+BXxmROFA7Xmkzn+i98ms
         YejCr87TIcBe7ZQDCxTaGFgQ5TbcX8PyGXL+dUmy3FqX5qW0vXu1KGR4JaGkMebvP/d6
         r/jEAbv6bC9KLkByE3ARs1mfKdHeswpE6r19Yegzt3svspeAw+qRQu8kJQv6QxQiTCnK
         xSSbyECTCeqXJcOXHM24liJVeTV/7TnegW97OV2R0SjiEhnhh5CMkng723r6tvh577fp
         fBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352476; x=1774957276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmWwTXRsCTU6xreKD6cFKnHBxSAyaOlNqc0k2os1GGs=;
        b=Smm8rscL5t4qjEXxHmp+gFwQos5QswBmt5smC75JQLjB5M39aWVB2oMVa5E7CyuBQJ
         CUn3EZGsQlQqNga7CR1vdoCX31uHvnTKjuiayDnusJbNzEx/SXl1AN3YgQXXY11NoPxW
         1VFq2PntZ478iCL60gVJpfHR1lkAZTQzQ4hDusT9s4WhGsOUnO3W5rCjJwqh1wl5vPg1
         ksrbzDlxxmr7LJCNNQ4wcvdSrdrxE6/sdRoONmn7YUVuiqzC/LVmcr1bRAF30cxEphs1
         kS5ETBUFFi0WPb1U0dThV2MmnkL3t2aSXuE2E+9KQmff4D7Mg6caseVYbRLzMD/fxPKy
         ZuVg==
X-Forwarded-Encrypted: i=1; AJvYcCUN3Bd8ydzIksDZcdmybzJ1/1YjxL2GMFx5buYNa9xo3v8y8xkiQwoM1krBggOOJpOvhO57exfNUjYn@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxkaDThnG+CF6Qwprsci2+8JqYj9KFVgVO8Q29hw6Hxe+DPW6
	47O8QXEAh+9XBIvOwr7Z4nExzYtMyz9kphTQS2OqLZficACYzGjvkjRJwVkuF8XeyOU=
X-Gm-Gg: ATEYQzyaGEggGGMpkhyBeuc8hZLd6pBCeR+WdIibg225osaxyWGFEGLyPRn6E9emmJs
	jzEwUTXTbgfyA2ARBx3ze2ItP7rMjGMn/sCBFDBHLUQ4oh7422/2j6XCVyT8hCoOdEUUSg1XkAk
	sy8+Prct/XFzGR9RqtdokrUiF4RzBIs5kSnipXDUY8OSpVM1eqxYp1PgKxa326vUFtRuKXviwKd
	k9AazsSgDS1RLqcf+HxHo73gWjBIEvlCgRf616KBMCaiC8RKO4B21n3utQYRgVD8i++gG60rk/j
	/xkd3FzjLFJ3q9o07FaRSDCUXqDDvcefDIQ/I7CSkwVkd1LvHd4K2/DCfmGd4wuziiq75BMwnhz
	3FU4Fyzlp26w8RPHM8xjuEAD+fEllHxObq9nGvZWiKsYV3yLFGMvRGjEtuGj9er+u58/OS9/273
	+yfmZPD8R1E0zPpOtbCUp/IZNEjbBy
X-Received: by 2002:a05:600c:530f:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-486febb455dmr233077515e9.4.1774352475769;
        Tue, 24 Mar 2026 04:41:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm33705976f8f.31.2026.03.24.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:41:15 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:41:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
Message-ID: <acJ4WCT4ndze2_L9@stanley.mountain>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
 <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
 <acJyYirIONH3sYvi@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJyYirIONH3sYvi@ashevche-desk.local>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34081-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: AD00030798B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:15:46PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 10:01:47PM +0300, Dan Carpenter wrote:
> 
> > The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> > a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
> > standard pinctrl interfaces.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Thanks Andy,

The driver is much cleaner after your review.

regards,
dan carpenter


