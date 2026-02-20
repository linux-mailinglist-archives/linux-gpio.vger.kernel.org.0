Return-Path: <linux-gpio+bounces-31927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PpvHRuwl2nO5QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 01:51:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B216404B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 01:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC393051860
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A160C223DD4;
	Fri, 20 Feb 2026 00:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY7xwtaf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F8221FBB
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548485; cv=none; b=md7qnRAOJ33yLqzsNCPEzrewAkhZwdhO6sumu5+MlKlq3zcE2HpkjQbEfNGU0S8yCRe5Hs9YN3TEzxDf8aWvOcrp7iJB7sLf9tJeoUFQbfLjdvSZuJELftwOOzzMIvhpM4ipYol8HjZeycEzIDH0yTuVeN5uycFzBX0BO/HViIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548485; c=relaxed/simple;
	bh=8y+r57ZYPNPnm4O2JdX7FqAZsK4OphEX+0PbJ4Nkie4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8KTfkhP5grdWgI/ny+Vi1mIQPNpRTgKCmfOxNQvuyWiGxH4RBs0Bbd6a/i4x4yepUDtw/79Gl0Cif1wcfLzrP91/zvTfE0CyPV7XkhLZTQ/qIL3XoTVnjWvAM2ti8sX70MOUa6Yw38gpBwCisqRpjuOtuisRgAmG487az6oOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY7xwtaf; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a635476fso1562193c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 16:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771548483; x=1772153283; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9VgbZEML7yTCSAlB27Kxxz5xLL3aoTRKE4aYyfo5H6w=;
        b=OY7xwtafQWF2jcUXkbYGEUnhXOgr9GQdxjDJqpyczrWAHEAT9aWE6nAa4eJQyCHhuZ
         to5RlPTQe+C8zxmn0I1RCARUBBm0TM7ikrwudXuTzFWNssAM0WCHRiyeVY1JjBHZ9doI
         YPx+uFrcxnxdeRKqShrZr9cTU2MUgWRsUPXQhRbCZOD3zphxRXq3qYsNyUrGl18BCYKC
         zrVxp3iLvBOuIqqkQO/BApXYgfnl43mDUC8yFgoLif7wEyKl8gmcjEldqwGHLBr3fCMO
         BJZQnK75+yodMJMMEdOCemk/ULVQdKV0h9PgT49VBCmkuWBQiphdqJtUENpifcXGQLoF
         SSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548483; x=1772153283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VgbZEML7yTCSAlB27Kxxz5xLL3aoTRKE4aYyfo5H6w=;
        b=RnCyh7UJum/avj6LilU5n1OCCAnySuj/K379W22OtVX+FJZPOZiRofbjM4GDGOQv5N
         ASFRJsXtt965EIj+Il3vhD1siT8lBKfPLV7gThuBP1xg9Kj1C+2bwh7CqDTY+0F+cjDQ
         YX+EdzowWKmxelBkKPhTrT+zuCPIrpPG65punsUXWrXiBGLH6tNxgWWjPpxOPQMe8Tzb
         34JfRfo5p31k16B9+UgMqUpIbjxWTxBLVHULb4sIqBnxiI+OIy6u2kkhIaovKYPI7tm5
         TwUt3/AZfLkeQDhoE/LP1t42sO8i4aKI9XYsHZq42ZeS+9UZBb2sjSvviv3QkPNfycjM
         TloQ==
X-Forwarded-Encrypted: i=1; AJvYcCV533JlKlovNFr8U4OtIKFrjNjCc3DiqUNlQLdFnSekd2agOdwvanP+3fjrVF0Pcs03qCY99fdqKfZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnzcGK3HgXbFZznF0ulkMntUFZrXbBj11elWrKHq9j5TZn4j+
	j2hkIo6m8Q0ATB+zCWPJaHrB06UygNkWz04hVfBAdNoepWioL4Ce7oxQ+69emA==
X-Gm-Gg: AZuq6aIZ7E3S2d9LHYPZQOArhzenPJTgDSNwJLgQBqI+fI78CWvGy6XBLyv7xk5RIP3
	eWaJdBht514yg9clPiGLPNlmTtzWTtzgxvtYI7tncqo3QR4NqCfzZsgPARqT990GZjJtRoBEO1P
	sty8K4MazBAx+2vcVGySJof0hiWQgmGjP1GohzBouiga2agEreWPJ1hYM/Ri6mJX/oJdxtgJd9V
	vnLcz5CWWAAgPc2RZnIuieZOGqQ2JdI5z8gon74reSvXw0MZURaX6Kcs4eC7R9cea41P/6JfdR+
	EYcS9uc55vSv80pio9RF8q7mfLS/+mPt2R7ckuf41NMGPjxavIRkx7eLiVsv08bivkpqgieMrqO
	FoX9iKfqb7LOwJH2RBFtQYo59yYwogsBADpk+govsQMhyehkQ5AniKXD/uENeei373dTT9hIFSY
	sDz/6HKCfgU9G+UUAl54gVA6p76gJRzr2N7n/4JjdjhIAcY/fFb51Y9dvdX45mg3rF
X-Received: by 2002:a05:7022:49c:b0:127:35af:143c with SMTP id a92af1059eb24-12759a75a8emr3117889c88.37.1771548483309;
        Thu, 19 Feb 2026 16:48:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9c24:8181:603e:7ad7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66addcsm22398999eec.24.2026.02.19.16.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 16:48:02 -0800 (PST)
Date: Thu, 19 Feb 2026 16:47:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZeu11bBxxgXNMyd@google.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <aZc_P9PcXdlJHqrK@google.com>
 <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31927-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D65B216404B
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 03:15:53PM -0600, Bartosz Golaszewski wrote:
> On Thu, 19 Feb 2026 17:54:24 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Hi Bartosz,
> >
> > On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
> >> On Thu, Feb 19, 2026 at 5:36 PM Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> wrote:
> >> >
> >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> >> > > Provide an extended variant of device_match_fwnode() that also tries to
> >> > > match the device's secondary fwnode.
> >> > >
> >> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> > > ---
> >> > >  drivers/base/core.c        | 14 ++++++++++++++
> >> > >  include/linux/device/bus.h |  1 +
> >> > >  2 files changed, 15 insertions(+)
> >> > >
> >> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> >> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> >> > > --- a/drivers/base/core.c
> >> > > +++ b/drivers/base/core.c
> >> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
> >> > >  }
> >> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> >> > >
> >> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >> >
> >> > No kernel doc to explain what this function does?
> >> >
> >> > :(
> >> >
> >>
> >> It's not like any of the other variants from this file were documented
> >> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> >> sense.
> >
> > I think it really needs a good explanation given how it goes through
> > secondaries on one side but not on the other (but maybe it should? Why
> > one would not want to match secondary?)
> >
> 
> I don't think it should. You have one, concrete fwnode and you want to match
> it against a struct device: in this variant both its primary and secondary
> nodes. I don't think we should do a four-way matching.

I wonder why you consider these 2 distinct fwnodes instead of a single
object that has multiple components? After all in device we have a
pointer to fwnode, and not list of fwnodes....

Thanks.

-- 
Dmitry

