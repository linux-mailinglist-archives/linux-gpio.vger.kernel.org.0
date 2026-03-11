Return-Path: <linux-gpio+bounces-33201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGPWG3rjsWksGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:49:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71126A8FD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BAB93022067
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440B1330307;
	Wed, 11 Mar 2026 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLhK848C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2529B200
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265782; cv=none; b=bWdtkeTyPyGjO35rschC6Z4Ho7iUGfvag9RqlkgiAG0RXdAJWsWoEPsEN0Lo4Q7ahIGUbxTuTzHjkNPR/zQ5viAciF5x76QPa/RZ2QCjTf7HGCeEFZIhV6ZDFF6UusApX/ozvZ8CThysHMakHLh0WLCTv/j+HCFJSd9+czxpwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265782; c=relaxed/simple;
	bh=OLD9utuIZfl6KHTmJ4+yFvh9pZE/I88gRyn+8KAQ/TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfg42cHsE/lIHILWVppQVna9UKY2qFMzbBtVEFB8cVe77HioCzSiReVi38E6PyWCEvQ15F+a/M+LpinbEebQwQTD0Yvb6rT5HJJKmLztRo0WyXUsqW0YhgfAGIkXheTYcGU0mN0ShDIJglXv3XLdkHNo6CP57eK1206S58V/z2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLhK848C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD051C4CEF7
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265781;
	bh=OLD9utuIZfl6KHTmJ4+yFvh9pZE/I88gRyn+8KAQ/TY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLhK848CEH1wsXE8pCiqsu+3uW271C0Jlcnt43am103q0yXt1jPqxter2Qzk4NT1A
	 zr2ceq88NA2b+2a7kE41dNLQqDTDxZDD6tEwtBECtPITkl1kvCNBJFBgCqyBLkyiro
	 t9t7mKh5vuvVStNBOjYE9rMs4O3HnRE3XYo3Fau2LevYzCL2S1mkxe3dTqoMzuZRuG
	 zHz4sEQnEcRZ+Par1qnsJ8XzTEuJNGAxEf02zkrNg0WQrgEbCfknKQfYwFL2R4j0Li
	 Ve4jDnbSISBfx8I6fkjGYLl2BtKHTy03gsnRxcgUhSodZI6pcVGIZSNSeiz7hayN1S
	 +ukple3GdP9nQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79800183233so7030497b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzXBts5695yoJJq71JpwZgB6E29NowCy3WhwsacwPskNtXfEoEWUYLNbJmE+hBqjmS2RGvZwHcGD2s@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQa6dUVey59xKWeu/01tpgmr0C8ATZ/m8RGPu/KcRFRYFNr0L
	F1v9svZofLOcXWUrhx9Ko49r6knrUSbcEazxMpPjkg5oTO4j09Jvuu3M2ii0IJ/FLAqaGSseujR
	peBoC40EJz5BmVf4DgCw7YLv1GOkl9X0=
X-Received: by 2002:a05:690c:ec4:b0:796:335a:895 with SMTP id
 00721157ae682-79940fc005dmr13930717b3.6.1773265781277; Wed, 11 Mar 2026
 14:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:49:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
X-Gm-Features: AaiRm50k-R75GYtAcf7sWc65ZG8Nbggj8JAild9FrvXMa8aJm0e1W2tTM8TiKCE
Message-ID: <CAD++jLkajNc=t6JmJkMK=YCMeumEQc8RO9OViKHGYPA9wVGt8w@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,intel.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33201-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C71126A8FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
> across a sleep or controller reset.  The SCMI spec does not have an
> equivalent command to this so just ignore it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

The SCMI implementation by definition lives in some always-on
universe I think? It never sleeps or resets. Nevertheless:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

