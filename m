Return-Path: <linux-gpio+bounces-31877-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cANzHlVAl2lXwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31877-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:54:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2355160D66
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 17:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE8A43016EE4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 16:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1031334D3B1;
	Thu, 19 Feb 2026 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXfyQQS3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DBE34D394
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520071; cv=none; b=lGEHAG/WI/G+ppgkU33372A9MHR/YIEXFFlq95c8vYbKlZ03WSJbWngXworgv072QUJdGUzHQbvOWdfHU6it/vrHSW9OlPzHwN3/n91Uu7dzVnBoInmcsMY4ldoFL/FP7yrq+InmU3RJWmcpXUwsUqaIgoOu4ssAz3Z/S9/0r04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520071; c=relaxed/simple;
	bh=2VBPj5WIpRN2SIBxTrDBDX/SrjuB1jiqkZTQeduSAwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2dVYM0IXbqyAmJt74yCCLteffFQrSjxZfjWqequXIJgjHogGIgnbp8I6sHBN8YrQWzbsHpKGs1HCzqINduabQjYoZKzzZ/EAFLNVf9Sxe+QRyd79CJdZFSXX9heWynhyPkd9Srg6EPD/JoEiKNtYEznh/MxB/t0/NqPlQcDf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXfyQQS3; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1487667eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520068; x=1772124868; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tNOMVKayZqs2xkHfdF/fmOBXKVqxQ8+G8UAd/SZpHC0=;
        b=kXfyQQS3o6VNxSvzuiB/J3W+JffRfXwFk/CZI13s+lNVBS696udcygIkV84G2bxsA9
         RhcqlMn9LBHkJ8g+IL7tFU1811VcxemKIxQ6o8rmS/xM1+cWU6sqVt+AL3TzctFfgcWZ
         9+Kb53Q+xsrcZZ+LQdAZIGwrxJphiY81XuXG00SM1sgh8S8bVfcD+izscRzE+DKAm4S+
         7SKF24fIwtZXKthwNni1LGG6u1tqBxBYpgP3TBJLIE+zBkywTHzH1uuj9v17PgZg6pPE
         Fwjp4QJb+2L55pr3QjaLR9lsKnj1Pk+uYz2HbCwA8SOqFI+t9ymuCAjhH2LGLEUaFvOZ
         j+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520068; x=1772124868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNOMVKayZqs2xkHfdF/fmOBXKVqxQ8+G8UAd/SZpHC0=;
        b=P3k6QNyG/oE3xbbXW/AEqAlovwdBTUGlzKeucNXeAo8xhtL1rW8EkGg/YuHPBHSdZI
         7D6SeY1Us7b50k3DpYvqQ63vwYPS8tsxdFb6ZD6pB2J6OqeDEG22mjsPDHgPwObjGaKK
         DjQP8mrwxR+CbjsdvB0rN7/WWRxGyCIqkNGcOY+FtqHenyavCNrrv+Bds5qHUjTbhLN9
         W3Matgc5GavauxBja2iC6AiAIh7tSrkEpw3olfUL2JNIj8yWQpSbLeOyOdjlkfdR/S+s
         Whgv9MGpdUw/dzRFyPhtaV6SnertrPeelKzMpo8mEiGepmuMY5A4MS87cfOOg8PyXaMs
         LDFg==
X-Forwarded-Encrypted: i=1; AJvYcCUGiu6p4oC2j0OxLGV37Uwlf8rLYg+LnziUS/oOW9KljGYyx6XDIhEfdqLVcQ0L45x/TRr9xDxrpdz9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yLnpmReqNwdK++440ywtJpxMesBglEzrfJMU6mCK17/leLTe
	GT1yJMUKEKQsqjWw7fN+lYCGUyyRYw+F7+vvPhIZKPvGTLDQ81wGrDKn
X-Gm-Gg: AZuq6aJ3bbBjrLgwDmNSo6LzDr54zHZ/tFcExaKAxAOOMa86miWUhWkic+EkCVZq13U
	FQxJiJz4XPajpyEMtVj/yYLTj+fk10szFbaVM/TrGY6kC+56oF8IfEKgGnp7oHDeRWOtz3Zwe3g
	y0kopPhJ0UzDT+ezjnUOx6vmiKsCrXev/Umk8GD+jOj+UTirsDwqUURsP7NghfctqhjY0HtuDaf
	OgHWTanQH5dAc2sRnQ+ASeIxhwzgy0z0F0IC7urLiOFuphPjAT4ts3SQ8Zi+UnfWQQlmhokKoHY
	gYHllvhFncFzsUvGTtB/gSJDjku+vIYMoqeY5JxXgGuv6JqEX0mqyzYR5pEFYULHU2hT6c3yLhm
	ZfE/GWtUJJmD8JvEhxWXZiMUnwXjHq/CqQsd40KituyUwySvo4srSlnnkCA76KiqJL8gsD0gN/k
	DHxpytaFmJcYT1kQdmR0Z2hvsoQE8Rd1f7HXDEDoi+cIxxnEc1gtat4eAanjgkZS5D
X-Received: by 2002:a05:7300:ed0e:b0:2ba:67ef:532 with SMTP id 5a478bee46e88-2bd502a01b3mr2635653eec.43.1771520068169;
        Thu, 19 Feb 2026 08:54:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9c24:8181:603e:7ad7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm21098242eec.12.2026.02.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:54:27 -0800 (PST)
Date: Thu, 19 Feb 2026 08:54:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZc_P9PcXdlJHqrK@google.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31877-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2355160D66
X-Rspamd-Action: no action

Hi Bartosz,

On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 19, 2026 at 5:36 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> > > Provide an extended variant of device_match_fwnode() that also tries to
> > > match the device's secondary fwnode.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > >  drivers/base/core.c        | 14 ++++++++++++++
> > >  include/linux/device/bus.h |  1 +
> > >  2 files changed, 15 insertions(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
> > >  }
> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> > >
> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >
> > No kernel doc to explain what this function does?
> >
> > :(
> >
> 
> It's not like any of the other variants from this file were documented
> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> sense.

I think it really needs a good explanation given how it goes through
secondaries on one side but not on the other (but maybe it should? Why
one would not want to match secondary?)

I also not fond of the name and still not quite sure if we need a
special variant or if the normal device_match_fwnode() should be
adjusted and its callers (there are about 20) should be audited (and
maybe if the actually rely on current behavior we can introduce
device_match_primary_fwnode() instead).

And it should be a 'bool' (and we should fix the rest of them as well).

Thanks.

-- 
Dmitry

