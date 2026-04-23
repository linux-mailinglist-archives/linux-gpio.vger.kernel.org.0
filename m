Return-Path: <linux-gpio+bounces-35421-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHxaCRNJ6mkhxgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35421-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 18:30:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE659454E98
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 18:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DED5C300824A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 16:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4811FBEBC;
	Thu, 23 Apr 2026 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQOCwbOZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FF37C10A
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776961581; cv=none; b=CWM6hDlYoMyN6Z2gzgPzeYPaxvRFdN7qvMYiv1wvvF/kJpaQqPjDP3ojgIbN+5ie7jzyIwEk72cN4MneTMe26ilsy1vY+N6PrAsNLt6t1ypHmkeUBcp1k3gj455qxxOOnogyNjXREqJWAiTYWgl2ePCe76SURoWSsOgQVB3BMtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776961581; c=relaxed/simple;
	bh=7HJFDXVMZBpUySYhrhGGo69696l4WYrx1UqH2wUaXW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gP71nLMsIxdCg+FpMgyFzMLniZrzBow9aINB7pf5pKoIwz5HtgxPhT2WC07QghI3gNPM2rj1LU0GWcnPEgWMYYzFNZwgIu5ZwqyI1tjT4oSa3I3HANSyCgRCygso/hE62co3HZOU/nCiDem4vnmjV1nILAnqYQmii93Ki253wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQOCwbOZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D7CC2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776961581;
	bh=7HJFDXVMZBpUySYhrhGGo69696l4WYrx1UqH2wUaXW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FQOCwbOZsyS2MaCjyYozCWWCDy2gmG4ApnAjdRYuHzcOY0MjKq8NT8xcsbNwXqBZx
	 i3b5mNJeEJEpqByQUvMWFG9qp+P4SBzq+YWtrhr1q30h0A8N+3hinRlDDAOv1mt+Yr
	 P1q1DlxWOyrgHWORezrufT4jGvKLjRo3nyqyk1jSyMz1eG9gRCmW0wmvSibfrnzcCf
	 cihg3FW5rW1TnYKuGtrZx4dPQ9NlG5NojDBF3ECZtF91WKHxUJBVzIFKTBZ67jYZsP
	 /8XNNH5Dwf+9ud1blJE7RGSKa5y2/Mg1/vNsAJlHbLhzxZzSqppGUNdLGKv/88OLDg
	 FwWGhriOxhLbg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e7d983f50so77170001fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 09:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TCARCUIySWehgZEYxTqIQk3yz3tK+l5mGIQkqZ7RyM8uPU5bOTxBQ79PvvzmyWm9W0lQgorOQmoai@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWD62yWQ8igyq6L8p/4ceIl4j9ALbSSGRtTegl9tGhdBXsJZC
	ZJqYPdpwRnwqMM5JXpfOItUav66Gk1xb7XmOz78LFywVPMeWpPPwlVbQB9G4fXGLlFGng4FYxNR
	snytdDKM2ah1Gw7+TWwHpHVpyapfzvC64RXEnK1ZOMA==
X-Received: by 2002:a2e:a108:0:b0:38f:e28a:617e with SMTP id
 38308e7fff4ca-38fe28a630cmr78699081fa.16.1776961579776; Thu, 23 Apr 2026
 09:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
 <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com> <aeo3RXm2xNZuD-bO@MNI-190>
In-Reply-To: <aeo3RXm2xNZuD-bO@MNI-190>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 23 Apr 2026 18:26:07 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mehp2uKFuhFWRke5fUt3VJ1Ph60Pny8WkqFQmrjyuSd6g@mail.gmail.com>
X-Gm-Features: AQROBzAIs4fbp8FRd9Pz3OpLlLtSBuoMKISTbuXZuSCj1WbdKiNKZob514DrltE
Message-ID: <CAMRc=Mehp2uKFuhFWRke5fUt3VJ1Ph60Pny8WkqFQmrjyuSd6g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: Linus Walleij <linusw@kernel.org>, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35421-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,duagon.com:email]
X-Rspamd-Queue-Id: BE659454E98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 5:14=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> >
> > I think we will usually only merge infrastructure if there is also a
> > consumer/user of it going in at the same time so these patches will
> > need to be prepended to a driver patch.
>
> Thank you so much. So, as far as I understand, my patches will be applied
> once one or more drivers use those changes, isn't it?
>

More precisely: we can consider picking it up once you post a patch
that uses it proving that it's worth having it upstream.

> All this started because I tried to provide I/O port support to gpio-menz=
127
> however to apply those changes I have to add other changes on drivers/mcb
> first. I'm currently working on it.
>
> I'm aware there are still few I/O port-mapped I/O drivers so I would like
> to continue with the TODO "task", trying to move those drivers to use thi=
s.
>

Bart

