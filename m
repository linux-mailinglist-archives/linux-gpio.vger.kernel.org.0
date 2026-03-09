Return-Path: <linux-gpio+bounces-32792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAA3AklcrmkMCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 06:36:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5135233F3E
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 06:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECBB8300F120
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 05:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFC9318EE7;
	Mon,  9 Mar 2026 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjFeYRdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1604021D3F3
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034564; cv=none; b=fzsvakqUQLVZ97FFcOgqeFH8gIqHNy3u68tpTeAmy1YfPI9pnHszzZGKmpWAioK8Aua85JSXdpy4wRTsn15k2Hjdur2J1MeAlcZkfQjjKJcaR5ON3/GgkEC2TcYVLn2cfttRTDwW5CrmBdkid11fBESIjcrIKfJJteYRVxbhsJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034564; c=relaxed/simple;
	bh=TstdYjs2JOslSfUoiNOZQUESbqPut/9hmyHHSOydmBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByoqeCP1D4vakL9Zl8wY2iOKv91o4tfQRIHq3UtsA2PmaPeCjw9O2p0WfZBVzCVO7xY/wXEaVyGpbYdewDVVhqPtIgqzPeR3He9qd0eFkNFk7Xj7gp0BZSoPtkpmBSryz6j6JKFUNaqeTsX2/27u0htLoXZw5gcaSqyJFH4Tqp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjFeYRdL; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2be4781d2baso5986214eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 22:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773034562; x=1773639362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Skm7jjW3gGTyeCMhcxvy+Ck9FxS/iCqJX+/k6WAJO7g=;
        b=QjFeYRdLaVWSC47+W45iJZlr2RkgAZByPUnlxQWhsMA91TdgE6m+kK6EwDNXkmnceE
         pKXvgbtXBMz5JnJ2cikHcvFplbwVDucSH1X28Keqh2ZppBbFNRhDM0TGyybhRMKpCx4y
         vxMrZtFZI9mk4j5ktA0ItsJj9TpcDm7yvfJqyGk9KA+qzI6/1IwVUUtbHkn6mRFaYMqW
         vQgHRzYrqQXePjFPA9j6RPtwVgTnfrTmUnNx5N7wbgGnJK/HyPImWPX5fnXZSVB4c+0W
         84lTjMavxrSAwdo84x+8RqYeOzDGctdRb++rS2rBC0ZGLWNIUZgTTZkfIulHg90gc30V
         m1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773034562; x=1773639362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Skm7jjW3gGTyeCMhcxvy+Ck9FxS/iCqJX+/k6WAJO7g=;
        b=bpmH6tg1tDntEwKWTZ3E7zeSQ/hpvQLak+m13g1tM5E0TzoUVPvqo1LG6V7EClskHw
         0AEds5omRwjsPWwp0MQ5pyop4/hyElRlhrnURLkcT9zUTQ9h2uY5ZGGmeqol5E7uK56s
         ssBgYI0EMG2yh23k+GO5tdWeIPyUvBJ3wZqctC9Ms7h2jkZSyNuWi79/ndlXRHmGyg1T
         s4Fuu1B3+hFRTyIxa02DxOXbCtqU9haqmFi3hTdhj747Jm4DuLuIEkQ8HPCTZY6NGKDA
         Wow1CQ5rzt+1rvS/k7bsjAQ9pm78inOTr3v2vqq/AHPSdrqfuJdC20QQE4X6aD3MIKIt
         OB2g==
X-Forwarded-Encrypted: i=1; AJvYcCVha2NJZ5nXDkKVfv1wyxlfGI0uubm48qiJ3FS6xZ482u50F2JXzfg6z0Ewi4T4ExH1UYYbHj8/tNW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrjtf/VAWkdsKauJzpMf2nYmF1KPskO9OYx6iv/36rpBYWkkQp
	jShmL7archFTzYWEHi1JbGUeuo0OJA/8nubMzinRZUNlyKO0m6n9fiiX
X-Gm-Gg: ATEYQzxIeuAOjdMS0SQi8Q8uuA0OT611bHRk5G8LLVrn4nTRL0csPDTXbmxLZHfnlRk
	TxqJ5TtOfv6Xn6s/vdXrSvYfTXEBpCZfFC2HqyVCG5CVr+jeG+8lp4ZVuu4jh/cTNQnAinUJVUk
	/Dfo5TAurAsskxvCq11s/v/FAKFTSKvSnCbBJX7zNBJ+8zWmdUQCrss3wY5sqL5wddJECFfZkBl
	OM5/6Pojvc2fYwrY9o/HFuWTqi6lhzfWM3SKGohT9BX7GV+o+yKcNqoq4VPTE6t5JxTHneSIRuR
	aXQXZnr0ZXYonGvJ71B5bdlDz044uliRDVooCK85897DRM0opehUQkoP4YbtYyUIzhxUkGtINyf
	7aFoxpUc1h8wr3tsIOJYWbPtBvkvtPJGwYlQ/cfJDu+WJMt4nd+jv20GEtIuwksnEIkp4AK5jca
	RyBD4BbJyY+s3DGG61Bx71ZA8TnToM0Z8=
X-Received: by 2002:a05:7300:a883:b0:2be:2798:177f with SMTP id 5a478bee46e88-2be4e0672d8mr4132718eec.20.1773034562186;
        Sun, 08 Mar 2026 22:36:02 -0700 (PDT)
Received: from google.com ([2601:647:5e00:4acd:af9:a43b:9d9e:841c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm7490039eec.6.2026.03.08.22.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:36:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 05:35:58 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Message-ID: <aa5ZA-CiIZuVkAdS@google.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
 <20260307114947.0b946dfb@jic23-huawei>
 <aa3czXB9tzLQgwha@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa3czXB9tzLQgwha@ashevche-desk.local>
X-Rspamd-Queue-Id: A5135233F3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32792-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.861];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:32:13PM +0200, Andy Shevchenko wrote:
> On Sat, Mar 07, 2026 at 11:49:47AM +0000, Jonathan Cameron wrote:
> > On Thu, 05 Mar 2026 11:21:56 -0800
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> ...
> 
> > I think this broke the ACPI case (where regulator isn't available).
> 
> Right, and I even have an HW to test (if required).
> 
> ...
> 
> > > +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
> > > +	if (ret < 0)
> > 
> > I think you need to check for -ENODEV and if you see than then
> > see if the acpi route below applies.  Otherwise on ACPI this will fail
> > and we'll fail the probe.
> 
> Yep, just make it default without even checking the fwnode type.
> No need to bring the whole acpi.h into the mix.

I do not think this would be correct behavior. On non-ACPI systems the
regulator is mandatory, and the driver should not blindly apply scale
from ACPI systems just because regulator is missing in the DTS.

Thanks.

-- 
Dmitry

