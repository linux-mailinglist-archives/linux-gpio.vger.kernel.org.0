Return-Path: <linux-gpio+bounces-34091-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGOdAsm0wmkvlAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34091-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:59:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C235F3187B9
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 16:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA5B73043051
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 15:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29EC389445;
	Tue, 24 Mar 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HusIQaei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0A37BE6B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367667; cv=none; b=D16IYlBVpzZw0fvaMEOfnLghfau5d6Uwhw7BhJJ6YWXCD9D5xBLWFyS8sVYFCZrZGBHp2BSVWiqRTIyu8PQ5wXfDsEtbf+4glUECFWosFbGc8dDThgpE7RATqelwSrccEhisOSqjCmqbFo4u0+JBS3gr/IQT5USdlYOzsT/TqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367667; c=relaxed/simple;
	bh=rnPvHLmc5KFBj+bJOsq1v7gFSZa1U82eLdbPB3po1pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqRWj5sohlS9d9SNra9i4s6mfEirCaR1Uf9LweYYr6+HspQq1CommXccHG+zNc93oTZGBICPLYfYPf8iAC2un2tdjGbp6QU2raesVtZ1U407iBi8lUeuXSanl4h1a1ehWWctGGbllTpN/KGHJz7HeepjthanSFi0cHjCEUu0pYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HusIQaei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB01C2BCB3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774367667;
	bh=rnPvHLmc5KFBj+bJOsq1v7gFSZa1U82eLdbPB3po1pA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HusIQaeiz5DF2e4/Xn7bf8mWbppEM7Oq28HllNmSq3PphPTI32yShOh77KKNQ1xJ7
	 FD3+weCntCR1enW9PTjoj1ZxkFBpnP2wYY1sFbD3nkdhpQ78+39WTn2dnTaJQ/XMig
	 IEVQBXfRSr29t/lbwXr1Pk31J+d1DZKOZAE2KRvGs/JgtXFrAg4aBaeOjyyvrO5Mdp
	 0wadlkW8MBjJofzK5vQADt4Z8mZtr/TFW3WVNxbFybi7amPXl+h/hRTuiWQtl3M6se
	 XrCP+UmsQ4eQ1AxQjWAXWffcGWaO3biHZfazBIP9p41SKXJQVpm6/WuBepL6IjjlfK
	 rAG2NRgw+pj3w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3870778358aso37727551fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 08:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9UJMMLx8WKsoLjCJRCWWh+Z4ZtKp69r9MSM7ZJgE93rIk92QFdqu0+Vzkk0z/cGwkHq+zMvlgOBgd@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9xvLHfcJb1Q7tHNid8Yf3iAHu4p8l4jxRUNlq2VnYiBIQ99m
	EZhenmaQLrE9ycsHZH3vVcqxibsy13zGB4wmllIwmUK2X/5eMswpezdVzw4/DOho/Rzzq5NHbYu
	GSfANbClspgmIh70N7Z2ZIW0Kdv+tRaur2hVH0Bx4Vw==
X-Received: by 2002:a05:6512:39c4:b0:5a1:44b7:14c2 with SMTP id
 2adb3069b0e04-5a29b99c1aemr1272e87.39.1774367665718; Tue, 24 Mar 2026
 08:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com> <202603201104.8D7B8A1@keescook>
 <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com>
 <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
 <CAKxU2N9KdziPen9-_gfe0UZjyuMTOsbb583aeF3=kqm22rGieA@mail.gmail.com>
 <CAMRc=Me2RLj-vvCVNho9CPYVwsQHypC_KvKHJWkLyj=rMkfx2w@mail.gmail.com> <CAKxU2N8gudRXR-bLMoyDVDuv3vWuzqrbyVsHL=Gu3mDZWMvs6w@mail.gmail.com>
In-Reply-To: <CAKxU2N8gudRXR-bLMoyDVDuv3vWuzqrbyVsHL=Gu3mDZWMvs6w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 24 Mar 2026 16:54:13 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeYoDB1QsgckNH9OGWx=WJZofMHq+zL4xY8VK+rzP3gog@mail.gmail.com>
X-Gm-Features: AaiRm53Qd00j01fbmk9JUDN2Q-sRBpzo_Q0z0xnc9uv_VhfVQaxj-T0Uvl4_qac
Message-ID: <CAMRc=MeYoDB1QsgckNH9OGWx=WJZofMHq+zL4xY8VK+rzP3gog@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Rosen Penev <rosenp@gmail.com>
Cc: Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34091-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C235F3187B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 4:52=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> On Tue, Mar 24, 2026 at 2:16=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Mon, 23 Mar 2026 17:43:00 +0100, Rosen Penev <rosenp@gmail.com> said=
:
> > > On Mon, Mar 23, 2026 at 3:00=E2=80=AFAM Bartosz Golaszewski <brgl@ker=
nel.org> wrote:
> > >>
> > >> On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@gmail.c=
om> wrote:
> > >> >
> > >> > >
> > >> > > static int gpio_mockup_probe(struct platform_device *pdev)
> > >> > > {
> > >> > >         ...
> > >> > >         u16 ngpio;
> > >> > >         ...
> > >> > >         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio)=
;
> > >> > >         ...
> > >> > >         gc->ngpio =3D ngpio;
> > >> > >         ...
> > >> > >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> > >> > >                                    sizeof(*chip->lines), GFP_KER=
NEL);
> > >> > >
> > >> > > But this begs the question: why add nr_lines when ngpio is alrea=
dy part
> > >> > > of the struct:
> > >> > Maintainers for some inexplicable reason want an extra variable fo=
r
> > >> > __counted_by works.
> > >>
> > >> I believe what Kees means here is: you can use ngpio for __counted_b=
y() like so:
> > >>
> > >>   __counted_by(gc.ngpio)
> > > __counted_by doesn't support nested variables like that.
> > >
> > > drivers/gpio/gpio-mockup.c:59:61: error: =E2=80=98gc=E2=80=99 undecla=
red here (not in
> > > a function)
> > >    59 |         struct gpio_mockup_line_status lines[] __counted_by(g=
c.ngpio);
> >
> > The following spin on your patch builds fine for me:
> >
> > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > index a7d69f3835c1e..9427ab8c45f73 100644
> > --- a/drivers/gpio/gpio-mockup.c
> > +++ b/drivers/gpio/gpio-mockup.c
> > @@ -52,10 +52,10 @@ struct gpio_mockup_line_status {
> >
> >  struct gpio_mockup_chip {
> >         struct gpio_chip gc;
> > -       struct gpio_mockup_line_status *lines;
> >         struct irq_domain *irq_sim_domain;
> >         struct dentry *dbg_dir;
> >         struct mutex lock;
> > +       struct gpio_mockup_line_status lines[] __counted_by(gc.ngpio);
> You're using an older compiler. This does not work at all.
>
>  * Optional: only supported since gcc >=3D 15
>  * Optional: only supported since clang >=3D 18
> >  };
> >

Ok, what is this feature called in gcc parlance and where does this
info come from?

Bart

