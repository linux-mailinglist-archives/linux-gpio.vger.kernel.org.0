Return-Path: <linux-gpio+bounces-31334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T+6GIfdDfWnmRAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 00:51:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A0BF71F
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 00:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C736B30166C9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 23:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E2138B7CC;
	Fri, 30 Jan 2026 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr7a+xmM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A656327281D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817075; cv=none; b=HW6n5bBzgYj7B5WGmE1NRpGW7wy3Xfp5Utr6vcqq9oCrfuFMFf8FvDDLvuLT/2ouB559fWvCLaWp/kuXjVUxfmjNlSHS33WaFjb/v/HjopVI+RqVM3QTquktJcjn9PlXtgsavgdGYjaRs6RTCNW85TU35n6hckMWWoYw5Xq14Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817075; c=relaxed/simple;
	bh=dOGUPI+MiV/OWgfdEs5YOeqHbH0YFtoekEev6C7wVaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjsqRQHoDQL9wyy/osQRJxFcLzTVOey6JjnP3bG5Ry+H4fZLjcrarzx3W3L+nB76AwPq+M0MQ33zzs+XaL0Q4Zuut/4rv5DtkbC8Uav2RrlyiWY5sBlhg34QQjng5wEpgjIOmoYRo88cHex9NaBF5O4jNsWHK+HTsYoReax2olw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr7a+xmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B89C16AAE
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769817075;
	bh=dOGUPI+MiV/OWgfdEs5YOeqHbH0YFtoekEev6C7wVaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gr7a+xmM9B1EhPgJ22ewLPu/aX+/qea3UX3WDLf7KNGQERk6+u5MaBzMvhwOvbPxI
	 HS/sgAZyAKwKnzFmSNSEe53c+kyez+j5Oh6GOB7jDIyy8G0h+et2xmZoWoQUJMAGNl
	 uRBSBVfVV3ehuHEdK578vFzvVW8fDra3+ERDJhyg2nfw7xdvJkQ9Dh+zOuH3SxHlSw
	 AWZ6/gRPKsIlBw6uTc6MnP28mjfWO/T4MH7J2HJMkJLKdnVZA8wbKAEi+6vfl/9QFs
	 dulI/RM59xWpMyoIuaXLB9HEHViBi0HHbPa/2DKJv3eseqdhYGv/GcFnu8Oro+qRxo
	 tAgw667M/fVzg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso2149365d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 15:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV21L86XoTI+AZ2wKuGIcqFZYjI6vIWxrmRSscGd1DbY8/Tv4dACTpCsV4yohGBdHlhCGb47/FpPNUF@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlYWZ5Cy/N0peL5n+3vC3n6PLvfMCLAohVZh4EkpVvHqEfpda
	bGsT3I2r0azm33jqp+vhAmwmtNV92FgipGzbjkMALyb8RWFiaflIZGDKv/aEQb36eLqFyeETo6Q
	/aRmxXYtIf8GEYARRveboN1P5+zCXwDs=
X-Received: by 2002:a53:d88f:0:b0:649:5ed9:fb72 with SMTP id
 956f58d0204a3-649a84a0faamr2868972d50.61.1769817074751; Fri, 30 Jan 2026
 15:51:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202601271725.gqlQ8Jl7-lkp@intel.com> <20260127-habitual-suggest-c3f429569fb6@spud>
 <20260128-magenta-unsealed-f7586f14eed3@spud>
In-Reply-To: <20260128-magenta-unsealed-f7586f14eed3@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 31 Jan 2026 00:51:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmH-Nt5teg8J8dM3Ce_kEw0vEYdd2W5GocEiFKZytG2Mg@mail.gmail.com>
X-Gm-Features: AZwV_Qgde52ThcYHzMDibXnFyzCOqYf7EPZTfRrQaDtKCDNCNsUyvdFnyP3bCeo
Message-ID: <CAD++jLmH-Nt5teg8J8dM3Ce_kEw0vEYdd2W5GocEiFKZytG2Mg@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 39/46] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PINCTRL when selected by PINCTRL_POLARFIRE_SOC
To: Conor Dooley <conor@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[intel.com,microchip.com,pgazz.com,gmail.com,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31334-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD2A0BF71F
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:49=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> > I guess I'll send a patch restoring the selects to the driver option
> > Linus?
>
> No, I don't think that's correct. It's the below, right?

Yeps, I can't apply this for some reason, can you send a proper patch?

Thanks,
Linus Walleij

