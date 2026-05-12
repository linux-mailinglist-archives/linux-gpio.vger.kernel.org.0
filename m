Return-Path: <linux-gpio+bounces-36663-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KuZF90DA2pczgEAu9opvQ
	(envelope-from <linux-gpio+bounces-36663-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 12:41:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A051EBF2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 12:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55D5530166E6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC04384CDE;
	Tue, 12 May 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLVMFPIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F353839B0
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582481; cv=none; b=OTRttsqqoauyZHb/bv1FXY+/M6nAdzjkszX3a+b8d4cBfa45bTT5cm+0ue6LPn0xxZl3cvnNcfko1/DOYIRSgZXosWgYc7ByWJfxIwBmmMD7t1lslvI1xolEunvIg8DElboZ7D/IQnW3oDxJNKfLmiAR2+C2W6P8kF03/UurLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582481; c=relaxed/simple;
	bh=6rn6swVEd4vz3eMIfj5QGTwkv7LO3sqUKZ5oWnbq0/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oo1JCtcv/XQ1Uxk39QviTM3ehA5KAgvOkFhjGv0dpQywkHPClwv02eZHYAQsq+MEpKwy2HSw2nmZujuFXo6KtNeyq6PSay6IB+pH/3ad88ZWK0WDMKZEZ+Pe60xAQP+HsrQq9BSgmkr7LRMYPU5JyGjCSnJ9ehQQtXsQqY0Z9PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLVMFPIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E34C2BD00
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778582481;
	bh=6rn6swVEd4vz3eMIfj5QGTwkv7LO3sqUKZ5oWnbq0/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vLVMFPIQHRfktrDv7ivdZCnIqnoPrUXJqHgOCVjidd8uxP583CNT0W4Y/jZv8812X
	 WBw4FvFy9NLfpZcXshrU+OwV9yDOt4Ks2gPWHDvgyIKeMhHLU3S8vGnvwKhvBmlCmd
	 YCO9QEsKF4kxLbRP0+LVexkT5KOQ8hk7uMO4dU0nBevOC9fFvrMA7JFePlwL2aAqAD
	 YKxEiJ0hpxHkOI1f5kgJ7nHyE2QedZS7zQrX/KwzpXbR7tGraF3THasj0iANSK/4Rn
	 9AhKC0HFMZKWnc8LEOi+ShUALvGtac8qmbz8DpqQomPQsv3mdrB/+cpbuKzoAQzLT6
	 fp1ctjlPMfhgg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7d983f79so46739631fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 03:41:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Y1g0uzOZURSPX//jEUHT9/641MVWbs4iItPMD4i8F4JuhbHZ8uRvMBbpKkRMeBIKkj/Cde9Tk0QmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxdpK2idqa8RUJfgukNR4VhqS5EBjniS7qTXRBjRadugHc4H9Q6
	Kx9y7kBWUsekisTGHqbTQLnJjKiQxb06Vu7n9f4lCrbnXN0V53OYx8uviRNmGrFDhVEJGSZnIFl
	zwteBq9/KudirXfUC5hMO7Mw6IbEjruLUtAp/IaOgOQ==
X-Received: by 2002:a05:651c:1510:b0:394:2b4:ca36 with SMTP id
 38308e7fff4ca-39402b50876mr51082121fa.30.1778582480236; Tue, 12 May 2026
 03:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-8-tzungbi@kernel.org>
 <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com> <agLhMUtdCPqLb736@google.com>
In-Reply-To: <agLhMUtdCPqLb736@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 12 May 2026 12:41:07 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mexm1dCrPXWnn2u_1m5DWgUq0oe2g-kxPLYdZAoqGfscw@mail.gmail.com>
X-Gm-Features: AVHnY4Le85TmEBOcRzfa3PaLA6tGozvfWg_wHD7L_EU0Rpneaj3lVgF7-u0sNmM
Message-ID: <CAMRc=Mexm1dCrPXWnn2u_1m5DWgUq0oe2g-kxPLYdZAoqGfscw@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] gpio: Remove unused `chip` and `srcu` in struct gpio_device
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EF5A051EBF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36663-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 10:13=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Mon, May 11, 2026 at 06:18:21AM -0700, Bartosz Golaszewski wrote:
> > On Fri, 8 May 2026 12:54:46 +0200, Tzung-Bi Shih <tzungbi@kernel.org> s=
aid:
> > > `chip` and `srcu` in struct gpio_device are unused as their usages ar=
e
> > > replaced to use revocable.  Remove them.
> > >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> >
> > I'm thinking that all the GPIO patches could actually be squashed into =
one. Is
> > there any technical reason for the split or is it just for easier revie=
w?
>
> Correct, they are separated only for easier review.  Would you prefer I
> squash the 5 patches into a single patch?

Yes, I think it's less churn that way.

Bartosz

