Return-Path: <linux-gpio+bounces-31999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEZgArh1m2mCzwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:31:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF751706F5
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21B633009E2A
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 21:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFEF1F91F6;
	Sun, 22 Feb 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQdyR6Xp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394A17BB21
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771795888; cv=none; b=AUo8cNCV1z13JIjIvlgFv5vh3Zku5LaJ46F/b+EzVwVK1toFGJcEcT7XzrboYICUK0zEWe7omx77xhJcnuv8G3IP6rLA3vzFYZ8B0Mf3VgcW1l/No7o43BN3LoENYIjgA88uUazY0Y6R1q/UcpaNRP6nxHd3bLNkS3IBDILMlsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771795888; c=relaxed/simple;
	bh=QzjME7zcYdVaQ3w3zHJF+94MbWLnBCtVKpePFUUeZ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkOZMJUgTa7ruknBST4wosBOmDrrW/z06PIdlH/HRw9nvLM4/ezh/qtRulxaSgCF/f1AqlZbmmZxKVwHMh50PbwBVsNp6N1fOrMUVegxrSwGwbPr4sjbuwsp9GuZRXj4Rm+hBctZOtiJSdsFaUFM6t+llk3+vljBtyF45fQXVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQdyR6Xp; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba94dbf739so3932432eec.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 13:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771795886; x=1772400686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w7RhOYqSZYG7/4DzPKHxyo/THmHlSU/4FOb0tUj651s=;
        b=HQdyR6XpXovX9ta792x5e3wfZNwsBEQQojpEE2YbIUwXnYuZq1ofadYI+9K6oQC32P
         Ri3Bwg35TS+yS+RrqWV7Yg0oVAb8MnjfrpJe94WNhlAaIVAQ9+os2iTk0ChoJWWO60pc
         BqDfVCIolnxk+59FnvA4+wuyxplF+zyweHI7DMRv7Z3HKt2lSOmePlKS2CKYi/LdHAhQ
         gQ1rbPZEYAKea2aacZbrHGIoLLk0+vM6ZVoa0uBOYboFBYiqVuKPp7teHNMrfCevI4lt
         2SKaYY9RWMpCs/Az54jJ/L5UylVFPIZumepM9j+HFXzyWiqlq+GibefmgOjmSDLaVTZN
         Og5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771795886; x=1772400686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7RhOYqSZYG7/4DzPKHxyo/THmHlSU/4FOb0tUj651s=;
        b=RfMTgYhniawFwfaEZbqnGOBqXdpLNxU3BuTksb8PrtZ5fVvK02BQtLDa9UE1YGF6Oh
         hTPsD6ZZnyA9SnCg74hp1IXQVELpkaxjMW4Oiv3fjOb3Sznq0kMQRD1sjS6fuOCD42Ky
         UWaC84PRp6l1bN3ZK9QCpFBfAUZE4iTFLqO+dD1/ATSei5CTt+GdULwSwVR4zrTJ/lD4
         s2Lqgbr94uUGpUQYj3GvnTFX2QpGbyn5MbkReUae3fECs8Fu0w/71RBmh8clGkQUfMTb
         GY/TZ+MAdve4kKj1Gf6tDoJrqeaJjvHrTxNMw7MO3euSDkP4HRsUA6gyCD0OEAqoA12H
         B/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRyO+zak287D2bs3OxR1dZoj04kqLUbSeklXQ6oMmtbLXn8FysjL+k90ZC8eyJFZsUh2BZTq7TaavR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo+UKMqBbyyzTtRGviUw0+eiMc8iAoA3A6c/4XWYOdadIF5Mts
	Xwm2XDagVKkIMGj4E2IfLSkLJJZnWZsVQByNEO21drj6iHfDBDhq+YdU
X-Gm-Gg: AZuq6aKAmk79WPi0msRR9VwHwyR0RLcAEsbHsM2G+zXg268rSwCZ98OfaBHyFkvzvEi
	g4KQLu0niF079MYLQ4WK0GO0/uDDc1g/xOm4bQd7JjYjDYJLtMTy0yWIWZJs0ADcg01eAp/VnOq
	H7aTPVOuNqGe0rbvc2wy/PlrOiIzigpLSnqrrCZNwmeNdB6tH6YYUJg9mf12rlC5ttnsJflQcx2
	+VqfB/+em3RMdy5ZJPWk1KopLK2tC9QAal8k6vE2w8ElBg5zATmxGA1epb1+jP5XT/gZ/dfSyFZ
	mQH5KK7GTSn1mxT5CQNTegxiIPTQL1XS/cXfhUoYYbFf1Km2ZYabf7r/2E/Gw4xqSMxtbtb6TG8
	QyAPPh/H+vsJra+dv+dLDvEztsH52E1WaysgAfMZDDLu20RjA6++jixBdxGID5jDQkG7WkyJv+U
	B47n6csNcu4gDktM25wTTY7l7ewEcy/SQeYKWkPjHKGoJnBK+ZOg5FON2hwLGSaTM=
X-Received: by 2002:a05:693c:2293:b0:2b0:4902:c55c with SMTP id 5a478bee46e88-2bd7bd03e39mr3161672eec.18.1771795885912;
        Sun, 22 Feb 2026 13:31:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82d3sm4014173eec.21.2026.02.22.13.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:31:25 -0800 (PST)
Date: Sun, 22 Feb 2026 13:31:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
Message-ID: <aZt0IGNW2hddXvRZ@google.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
 <aZbBGomQi0l84An_@smile.fi.intel.com>
 <b36307f9-c4b6-4242-9cf1-838799a926ea@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36307f9-c4b6-4242-9cf1-838799a926ea@baylibre.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31999-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2CF751706F5
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 11:20:42AM -0600, David Lechner wrote:
> On 2/19/26 1:51 AM, Andy Shevchenko wrote:
> > On Wed, Feb 18, 2026 at 06:29:27PM -0800, Dmitry Torokhov wrote:
> >> guard() notation allows early returns when encountering errors, making
> > 
> > guard()()
> > 
> > // strictly speaking
> > 
> >> control flow more obvious. Use it.
> > 
> > I like the change, but...
> > 
> >> Also variables that now only hold error codes (or 0) are renamed to
> >> "error" to make their purpose clearer.
> 
> Normally I would not give my opinion on this, but since I wrote the driver
> originally, I will say please don't rename. I prefer to always use "ret".

I hope I can convince you otherwise.

IMO "ret" or "retval" should be used when the returned value is intended
to be used during normal operation. For cases where we only expect to
have an error or 0 for success "error" or "err" is more appropriate.
This allows you to write

	error = do_action(...);
	if (error) {
		// handle error somehow, typically simply report.
	}

This also helps when reading the code as you know that there is usually
no reason to care about the specific value in this variable (maybe
except -EPROBE_DEFER).

I will push the conversion ret -> error to the very last patch so it can
easily be dropped if I am unsuccessful in swaying your opinion.

Thanks.

-- 
Dmitry

