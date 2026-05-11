Return-Path: <linux-gpio+bounces-36578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HfNAqHYAWpMlQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:24:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511850ED3F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFFD2306AB61
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0882E2D12EC;
	Mon, 11 May 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEigcHFw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037D3E5EC9
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505595; cv=none; b=FVHvw0gY1CtMgIFR2uuHHjXMX8eh+Dm3u9ZmobLUycYeoLBRCMCf6zDgoZmvglyB6m87DNsaseeYIWL08p7O+QNNDiR9UeRBhgk+hPR59YOTzgYXa3RxOn8PECws47hv3i/i+qLiwG02eHLCsnmCU5lNWV/Vm5YYW7UbeDMDdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505595; c=relaxed/simple;
	bh=d7UugrGvTHVZ5x6A2v3kOZ5TDSHieQcjxA5S4lHpomY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AWc/SlWSDN66/7SwT3/i1ySOHgqYsWPoqLTLtpWdqQh1eKThLzag0C8HhFCUoljiSlJSovxYfKJtdfjZuydJ73kQNauM9mNrb2luUFr0G/WSztTqjY8/GwF8NQXIXpcfE1lxpDgt0dRlIzXYyw1izRQXtSQLtKpEl0jPQjdtBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEigcHFw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E38C2BCC9
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505595;
	bh=d7UugrGvTHVZ5x6A2v3kOZ5TDSHieQcjxA5S4lHpomY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=fEigcHFwvp/W7VaOeOtrsCWYWEAItK5KUJW1mqEVDBlK9Is2mMkBPl5N928Raj/B9
	 JZbo4YE4XdXMts7oqoBnCO5EAUdMaLPSGtOUPyyLNPOxHjiIB/v5KGyFuHWt/JgBLP
	 TzJHd9Fb0ieCaf/n9WK3wX9t1oTVL/fEnzRQUG3J2B9BmC4avLeqXrXr9g5tfn51Gw
	 ADrnFtvzgVGJ4oYDYPtUnFRo67cCMEmEbLx/drUVimXOIiZd3jowr6WISYxrDHHkKo
	 +P4xqBJ3HRHinzaFkhpCO3X9Jl/5TFdRNaGekp/tt14HWbSjg1bNx6QMH+la7hdKh4
	 eCd7Xl7X7rU3Q==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12e332315a8so9586721c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:19:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8es5Qb4H0F21cw8L6wvQk+/nKPF8o+tsfZC8ElozI5yQaUPVEXUxWrxhP89YyqAtPVtaA9Wg4+Upsu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aFmzuKNE/22oUA1xBlTB+iNtzwSoKQUzT6RUYjAo6lsd5pIh
	2UpzTkG6EsG9bgzikg42U/K6/okOZaHmW5Hr/uITvgYhWFqMYYGKy8Ud9E0WjRc0lLvxqHFk841
	ixLyr4J+wx+C0KfBKxwLFtdCv6c3KyUbKfYkpOK8iIg==
X-Received: by 2002:a05:7022:2508:b0:127:33e0:ea44 with SMTP id
 a92af1059eb24-132a82ddb67mr4949446c88.29.1778505594800; Mon, 11 May 2026
 06:19:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:19:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:19:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508115309.GA9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
Date: Mon, 11 May 2026 06:19:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfks9HAGHedQhZY+3UgRJwg_RF9cVOyA3jGh7oiNqDn-w@mail.gmail.com>
X-Gm-Features: AVHnY4KJ3daWyTdJHgf81o2MnLKt19plZceoNb1ciLx1gSE_TrwC8qpPQuR4MX0
Message-ID: <CAMRc=Mfks9HAGHedQhZY+3UgRJwg_RF9cVOyA3jGh7oiNqDn-w@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device lifecycle
 with revocable
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Benson Leung <bleung@chromium.org>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Johan Hovold <johan@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5511850ED3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36578-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, 8 May 2026 13:53:09 +0200, Jason Gunthorpe <jgg@nvidia.com> said:
> On Fri, May 08, 2026 at 06:54:47PM +0800, Tzung-Bi Shih wrote:
>>  struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
>> @@ -47,6 +49,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
>>  	if (!ec_dev)
>>  		return NULL;
>>
>> +	ec_dev->its_rev = revocable_alloc(ec_dev);
>> +	if (!ec_dev->its_rev)
>> +		return NULL;
>> +	/*
>> +	 * Drop the extra reference for the caller as the caller is the
>> +	 * resource provider.
>> +	 */
>> +	revocable_put(ec_dev->its_rev);
>> +
>>  	ec_dev->din_size = sizeof(struct ec_host_response) +
>>  			   sizeof(struct ec_response_get_protocol_info) +
>>  			   EC_MAX_RESPONSE_OVERHEAD;
>
> FWIW I am still very much against seeing any revokable concept used
> *between two drivers*. That will turn the kernel's lifetime model into
> spaghetti code.
>

I gave my R-b under the API definition and I'm fine with the GPIO changes.
Just for the record: I don't have an opinion on using it in this driver and
don't know if it's a good idea or not.

Bart

