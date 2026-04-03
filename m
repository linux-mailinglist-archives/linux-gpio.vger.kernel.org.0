Return-Path: <linux-gpio+bounces-34656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK+0NgYC0Gkf2gYAu9opvQ
	(envelope-from <linux-gpio+bounces-34656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 20:08:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C53973B3
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 20:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B851D3047A5C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 18:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563C33D34B3;
	Fri,  3 Apr 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTYzGhnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84003CEB85
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239672; cv=none; b=Q1zBzYQ2HxaC5pV9eQTqUgjTay3ytXleD4oPJKyrvVhvl2kkfLcgpHC37rokUo4zHG0kiFck5hpaLKx5xNzL1xQOrt2cJGinUEttgWQ4rhGmi6/5NJFiI7gpNdEAaBgSIAKMWYR4+72Su2R7SlSNCQ6XKMEaz3VUOQHaNxi+LsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239672; c=relaxed/simple;
	bh=UFPWSEdBYNvmgOvcN99SS0anBY+f8Mv9diH3OxTcOTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRZxujByMZfhgIwpBz6uZ6AmRVFf7Cb8F1vXYVY6oOkRLEFSZA0j48RVdfRl9P/K2w1a65eCHJ5CdPSLNSqoOSNZ1nomH8QIj5VWVDukF+DQm+Vq3iKyZQjfdsecj0RW/6iVrqllxmMpYvBLZ0hyQfLbsFEROsOIHo6IIA49o70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTYzGhnz; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a80c36350so2491912c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775239670; x=1775844470; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYS8rrk/W9xmmpVLtPf6SPDq6V5JZhKXUApyjYv6jfU=;
        b=XTYzGhnzcWGiLo+VIC5LKWuBaAiimDScN1VOv8TmEx4OBMEztOwhjuaN81sNhU+Tzv
         vuplG6XC57dRGHSKKn/vzdDien75/d4iYiNTsP49Sirnl76MVhGNKvy0LnS4FC/YmNhs
         TyMYXGUbOr/soQYjbpPOumwKe3ueG+sBFRPpwQ2z9cZrb2hXTsYhLRnO1KoLiOwlv4EB
         EIL0zcK+TXn5p/rcDi3L3WjhPehD9V13qBVaeU40lZplZDTrAxw2jKmoxbVqdpG8+iAd
         utL/u+SqlKBW5Tkgv7oxBTZmGBddhONOv+Hln1EVcwiZL7meGE5Uc1S1RmyhMl4qX2JE
         ZDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239670; x=1775844470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYS8rrk/W9xmmpVLtPf6SPDq6V5JZhKXUApyjYv6jfU=;
        b=VcBeGludUR/W44/44eW5M2drRn5o3y9bjqoIdmSEAUxmAADQNfcJWjAHRit46s67gE
         T/ts7IIiYYUhRqj9nOoafQCO3TNlMNE9omvuTm6spZGEsVokW6GEGqF5DJCpV7IrglFE
         uA3PEPEnWBkcAmbJeXucp87xaMmFpB3qbph3xtubfr64AwX9A8Jk02S6mCRpIvHCoNgN
         K4fuYYpkvMIjfHaPrD8DJ+ARcjnOufStZz+5MnrSKEhPAzBNyGlT/UnauP+vGsjgM6y2
         2XAR6sanzSNIG1XrkCbf37KEkqOmp+MuPjCYYlSCg7jRaj+tfELzFuGwKpdXik2RP9ft
         70kA==
X-Forwarded-Encrypted: i=1; AJvYcCWMdp5I3h4+AvOgdQsdrKA/bEEjIofKSpAjGgnE0HMopkRHqFEllecU1oIlZhfftepB5ilQdpZEsLXB@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUILYiSWoBrqre2PkDISXOvesoz5/om0MSbEktnhoP+12Nm93
	dTdOBGVtrIQYirtTwli7MT3PPu3H2yg+4mGJaqdIUuWuo1ENq98i9fr8
X-Gm-Gg: ATEYQzw6QX2jXVtKEIA9AGV9hCbJN401XgDg14crgqK1JzuJCoZZUL7OILKrIZE6M71
	v/ZiLNgyQYv0yVnNH7c2H8zL1c0RmMLTQNFRPlM/nJ5gwJVE9eV8yckbD0az4ezEALYnm9EtSZA
	kSBVGUzpht9iJE7CTfB9eCIhUJOV63Sn5nLabuXZ7+/IaZ+2Qmkub/wL86IyIg+lhvcUiRe9bDP
	sKRcOLJx8koXUZmL4dMYgKQw+ZkARfLo3lMe1k/1MzF6wc8dCvE+1k1MIsmZ2W2u6PzDRXznlrl
	VZQurX0n6ZcYMOIw3k2ki8PYe1nHbthH0sJRaAGgmtpxB7Vhc30xFCCSsFVXmZlTXVK/uJEu7r+
	WGDhcSZG1I6GXZ2Vu/Amu5Zbcnnri4ArG78bNWgApq/tsioXeyK5XvU0c3eCchn6WI3RTkaBKLp
	a9PhtbU0e8toqxhvB34sByoMjDb2DyxfpdaTTQk4rV5pFdgc1+k+miaD9zQsAWgFqV
X-Received: by 2002:a05:7022:43a8:b0:119:e569:f609 with SMTP id a92af1059eb24-12bfb6ecd57mr1666933c88.2.1775239669720;
        Fri, 03 Apr 2026 11:07:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2357:9278:e4dd:85f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f004sm5079641c88.13.2026.04.03.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:07:49 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:07:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac_9EV3C0I1WXQz2@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
 <ac7UqTsPC8yUooAR@google.com>
 <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcq-T=4fnGTWXzEBjfiPaZLGw4HVAuOm48v-5Uf++K5xg@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,oss.qualcomm.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34656-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B1C53973B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:29:38AM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 2, 2026 at 10:43 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > > > It's possible that at the time of resolving a reference to a remote
> > > > software node, the node we know exists is not yet registered as a full
> > > > firmware node. We currently return -ENOENT in this case but the same
> > > > error code is also returned in some other cases, like the reference
> > > > property with given name not existing in the property list of the local
> > > > software node.
> > > >
> > > > It makes sense to let users know that we're dealing with an unregistered
> > > > software node so that they can defer probe - the situation is somewhat
> > > > similar to there existing a firmware node to which no device is bound
> > > > yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> > > > which stands for "No such device or address".
> > >
> > > This error code is also too generic to my taste. What about alternative(s)?
> > > EADDRNOTAVAIL
> > > ENOTCONN
> > >
> > > (The brief grep shows that the second one might suit slightly better than the
> > >  first one by existing use cases.)
> >
> > We are in the core of the driver core. Why not simply use -EPROBE_DEFER
> > to which all users will resolve this error to and call it a day?
> >
> 
> Because -EPROBE_DEFER only makes sense in probe() context, while
> fwnode_get_reference_args() may be called in many other situations.

Exactly same argument applies to your follow-up change: gpiod_get()
returning -EPROBE_DEFER only makes sense in probe context but it may be
called in many other situations. Are you planning to change all places
where gpiolib returns -EPROBE_DEFER to something else just in case it
might be called outside of probe context? 

-EPROBE_DEFER should have been called -ENOTREADY from the beginning and
then we would not have this argument. Or, even better, we should have
used -EAGAIN. But it is just a name, semantics does not really change.
We want to signal that something is not ready and the operation needs be
repeated. Currently we contorting ourselves by using yet another error
code that everyone will either convert to -EPORBE_DEFER or will handle
like -EAGAIN.

> I think ENOTCONN as "not connected" makes sense, though the string

Why is it better? Most of users of -ENOTCONN are in networking code so
it is somewhat unexpected to have other APIs return it. 

> representation says: "Transport endpoint is not connected" which
> doesn't spell out quite the same thing.

Yes, because it is really for networking/sockets handling.

Thanks.

-- 
Dmitryp

