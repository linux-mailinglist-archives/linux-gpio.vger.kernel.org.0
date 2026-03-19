Return-Path: <linux-gpio+bounces-33814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBAUAIbyu2nkqQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:56:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F82CB7E3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 13:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4994303B5CC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 12:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E03CE492;
	Thu, 19 Mar 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVvo2xWs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EB3CEB9D
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924853; cv=none; b=D0Gxn5FVox8EDZ+Oa87eGuaKFp7qeAP1Xxon8qId7tns5sOfYmjJp7A197jWkrnVEq3tiCUechcQj13gxOFFli682DlsMksVnOHcacAwB/5rpNW7+0J55YGqYuf/LtLcXz2hlahi7CB3upAxwr27fJbTeCNdvzrSid613/XrxeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924853; c=relaxed/simple;
	bh=3iSW66KyCo4L/u2cSUmtSnRq1Ih4KCkQb/PbdYRwPpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjndFvUS8d/qC+gfyIwh+YSgkEr8C6u5KjqtQPV5hTnQoYLLybXEo4C8uvGCB7FfJjxEdRi1L+CEUD8zygpbEcEWe5An01Qxb2iHG2V/+NjtWYY68J21wKEGR3WGkj0nDzO9etnVBHHAmZyy9cluztXgkNKeZAp1wsaaXDMll8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVvo2xWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44D5C4AF0B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924852;
	bh=3iSW66KyCo4L/u2cSUmtSnRq1Ih4KCkQb/PbdYRwPpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PVvo2xWsffNFKA82CjReh2BfnxkanYNMH5Ra0sSNWsPXEVo5+GjgjRgkDAUMUAxCt
	 OeGAqd47pO1gKNhyKVGEbnxmccrVmDRYttpNAJQera+9DxE6j0yS42+TOkz5F5f0CB
	 qIIQVYTIeNk9vJ0n14+0xZBjqFj3iWqHVCkiNCnO+gt/+01P+4hprlhlFP3LU9WKnA
	 yZViNfVfWXY/CDfXeivfTOJ+ePs3jusw6jBPcIJmPutPCNLk5DpgnniDfo6Oy+7LaC
	 rby1BhW9YJh/13mLe3AlyhvKGaMYmj/GlTPytOf8kh8AmhTCsJWyj0mzOGS7fNJbBj
	 Vw0cch299OeoQ==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a62a2bb8cso9797577b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfPJ/es1jsie0Q697U/N9ggoJ9SoekEBiHkcBg5i6QKUvegYqlJ5wfF0KcBUroNVoj58bl6peCR6kd@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcCh8mrbi7PaJqhznm665oxUXwY1SPkaQhmA4yWHhM7F0B7Fp
	wTKR0P6IDLlLMTyNrzjPAzLgxy5UjsJcKWNkLCStYp0xJDubJX08W5R/JRN2e57sTvZOBwU76f4
	ZoUbzQzrVtnVAGiRg69Swy8cSXfEz9Fs=
X-Received: by 2002:a05:690c:ec9:b0:79a:6e1a:3f2f with SMTP id
 00721157ae682-79a71834809mr81461497b3.13.1773924852348; Thu, 19 Mar 2026
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
 <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech> <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:54:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmhKcP0b-n3F5U3MYeWYMZT87gQzBAqmjw=HDuRzKQm=g@mail.gmail.com>
X-Gm-Features: AaiRm51pgjUGdP0TcwefP-B1exPpSQSVKtoiqSE_dDtLNQI-rfaw6LzXziWJj10
Message-ID: <CAD++jLmhKcP0b-n3F5U3MYeWYMZT87gQzBAqmjw=HDuRzKQm=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Yixun Lan <dlan@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33814-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pigmoral.tech:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 824F82CB7E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 3:05=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Thu, Mar 12, 2026 at 9:43=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.t=
ech> wrote:
> >
> > Assign gpiochip_generic_config() to the set_config() callback to suppor=
t
> > pin configuration through the GPIO subsystem. This allows users to
> > configure GPIO pin attributes like pull-up/down when specifying a GPIO
> > line in the Device Tree.
> >
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Linus, please take it through the pinctrl tree.

OK done.

Yours,
Linus Walleij

