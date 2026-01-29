Return-Path: <linux-gpio+bounces-31263-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EheCaIYe2lCBQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31263-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:21:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8DAD710
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68F913046DEB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 08:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAF237D11E;
	Thu, 29 Jan 2026 08:09:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401637D107
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674164; cv=none; b=U2m/76REbKH9S34V4mC0o/EqFmalg3lGZWA8OLGorJ65/afaBYcSyEQguEg3boYcUGjm4dPt18GbWOqlx1Ggmx67A/jLxyp+1QMyeJhvOpfDTF2q03jACpO8O3YX5VVOKhce44VPvV3yqnHNlMsl4wLTh0f0x5b3mBBUfosRdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674164; c=relaxed/simple;
	bh=dEcExVZUpePTfNi5pTXkJ55wzgIjcUWQz3BrGyxUIdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOKAcXQdaDAUnoNBiEj8zsAPTjT5pQiOeJzOvxsXxzGN9jGuV9wPWtcRJCu1XPm0pNBXsK+ou/cGQ3KY5VCDTlH0cWfhPsolo/+XLZybJidB/Knlr2qVOnGcSrDSUmL39ZN3dmqUzkxmWmFfh3Nn4CnB5NHtpuv0085/v0NQzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f56a97064so196429241.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674162; x=1770278962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2RYHlQBqPbWZpA11riL5qiYiCgBO/aHNTdRm3/6Ht/E=;
        b=oazbeSCnddIZjo10ICkji2jgeaA2ZXIsOPBvg0FQu2gyujIC6uUA6iWTFW3na6kjMP
         4R2zdxAhF0qW5wxxmK0Kpww/8Ya1GC6FmXSB4E7AzszLjSIigR1NjX81Uab8Nbr76wXp
         1LG8ynGTD+8w9KFgZPVNE5A9xWzuCcpeLnFPzrYOlAkTSLWK84tLXRiZTZPnqTQcTIxu
         2oBMDU5VpaG9Q+Qn9yzbpUlywM1wZeZyu0XBRRGU/F5w8gsyLdY2Qpqf92RcFIerexDd
         vxPF14p6WVp0HV2nBhdswUIaiMoyl+EA+1lAYf+nkqwhHse2WvN55manTG4I3rJdqrs6
         3OLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2XmAmzQyTB9cTcF0nDTvQpAucxsOfvf60VCa5QZr2j5Su+dmtPb5kY2z6UUuRgKRWQ/FfOnn0LB6u@vger.kernel.org
X-Gm-Message-State: AOJu0YxOgweYxRs9KYLFIuPdccITO334cJNMS7/YOQTVwK4R60YOKuMi
	jMBkBarCKvtnu2Vs93y7+X3/oCktSVwx6z57HviaVK3Uxyx4UIf63WVg+Of6Jyqc
X-Gm-Gg: AZuq6aIr2y/0fUsCcUDwbInFuwj38g/MV2Y79wA757k0NSpwlc749MMWbCRKTW4vFUA
	bTOjJ3l3ajAI87w5Gko6xfbLHgfWc5RmRBoFlQGXRA+HU/Ubrb8BrNSPacvrGbOAhcoBhfgCAsu
	SXkoYA2NfbB4tGdg/EJAiNZRrayfuFoPppNNDPqwHrtWhnC53bZwELBb2HXShszLT7HQoMv/Cqp
	hpWkm/lCxWwZtBuKmxp7d1oxax6+qRCt7urBnbWt5ibDgA/6a7ioX0HAHPGFaPgP/bKitXzgbkE
	mbqAMxNx08t86GxVFzdr9fQ0s7qEnaYiFreONkV0rOoh8gdhDJq5h/F2vTqMKFccRAfJfFPCT0l
	bc1p4kh7ddJkdtIXvkXr8z/Rx89SdFQ2YVgFbsenLEKXopxNUeY+02/vKwTM45WSCov0XTt/M1P
	f3dTR7tNsAWKhpd9uc89cak0LbYZhkG09fiM5rsQgqeQ4rYK39Fial
X-Received: by 2002:a05:6102:3ecf:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-5f7237931acmr2573283137.29.1769674162118;
        Thu, 29 Jan 2026 00:09:22 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f734f1f756sm1063724137.12.2026.01.29.00.09.21
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:09:21 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56367a388e5so178542e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 00:09:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYIkWPI/G1xd4kVfM9JbI3sVi07qdsL6/PWH63oqEzAiJKd1ZJ7Vnlzt93OVIo3AGQBhly0MdTQEjc@vger.kernel.org
X-Received: by 2002:a05:6122:2a0c:b0:55f:c318:1afa with SMTP id
 71dfb90a1353d-56679553d11mr2334330e0c.6.1769674161452; Thu, 29 Jan 2026
 00:09:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com> <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
In-Reply-To: <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Jan 2026 09:09:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
X-Gm-Features: AZwV_Qhi1kH5pOpvyoAQdGjaojTMEjrLQeeGn4WgSYUxomJrZ-aWTrUsCARxGZw
Message-ID: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
To: Linus Walleij <linusw@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31263-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,of_args.np:url,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EE8DAD710
X-Rspamd-Action: no action

Hi Linus,

On Wed, 28 Jan 2026 at 08:55, Linus Walleij <linusw@kernel.org> wrote:
> On Mon, Jan 26, 2026 at 5:35=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrot=
e:
>
> > +       of_node_put(of_args.np);
> >         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
> >             of_args.args[2] !=3D pctrl->data->n_port_pins)
> >                 return dev_err_probe(dev, -EINVAL,
>
> To me it's a bit odd to dereference .np and then use other parts of
> the args the next line but maybe that works.

The of_node pointer is not used at all. The code only needs to validate
the mapping numbers.

> Geert will decide on the patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.21.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

