Return-Path: <linux-gpio+bounces-34092-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPnABri1wmlolAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34092-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 17:03:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A2318956
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 17:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1C4D3123544
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 15:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F0038AC98;
	Tue, 24 Mar 2026 15:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7qTo02n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05792389DF0
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367804; cv=pass; b=j3ZFtUJvKu5o/qQseiUfiKmbI0BgwCLPfN2hd1XhI2kA17zTfWj0zZ4K4M0G6Wl0SGKwQayMCtkScPziOiPiWcWJ37IGeP3P0l4r8llt34EigEB9AA5Y/m44xVsl6L+PN/e1GLO+hdm/8rbb5AmatBVbZK2wpUKWXnqwWCeypzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367804; c=relaxed/simple;
	bh=NcFE19+lHolIoka+UAD/Gg4aP7dmCd3kVrW0euzZIw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGSNN5oBUKJ2Sk4SOdSTU9A+vTLywKoupc/w1/7QENA7/FuMVNcEusH2vrDEjm8cF6comaAeZsvtTzrh3Sa2LZq94yqwncy6hsZx/HXL14i4iHvGV9koIPsiOufRxkCUEMHHBwBaXUuNUr9VspQlDuTBJJE8ThNIL90/ADpL1f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7qTo02n; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f97c626aaso878897266b.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 08:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367801; cv=none;
        d=google.com; s=arc-20240605;
        b=AFcFAgIcOt8aPavljqb4pdho9+KJsJm6OQ0znteA3OGWJS9xk+aeSkxGAKXRAV6ZMt
         xB0DIoX/ewQv7uC2rWHeO0QwvyRk5PhUOXPipjF6uTZcOtfhH2qGGJG7RjkmO9IO4jLF
         x8uVequaFRhgGH3JRivjN81ZMo5KyOGzT7h+FBf5ADRK8aFd44sLqeqC4GMPAq6KPWHW
         Y0eRnf5LEnTbcKHP5kJxnTFaI0zJIiKby5fNBSh0JHyd3SwsLdpFnuwzXzM8lphkI2zV
         pQ+OFAhLPQkYaeb41Qrit07UwJAVT5RlKf1P75CAndEhjZy0sCQKuYIid7mu59hhuHZL
         QUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3qRkrcmZqnQcAsHSgrGTF3O2trpu3zcL2/3GqhPT84=;
        fh=2JqTOkQKr6+A9vrBVgX2fLKxVUdA4TbFXPQE58UL+Pk=;
        b=hV1+5UFoXRx3OxV8g/3Zc3Yyphjyhxr8D7nbaSE+GfrMm03JS6G38KHck6D+AMVEx+
         WWrxSHZcbmoNzpwwReIRRwJtB/V1zikgv8WBOlvIODDH1lxTNW26PYpEZnO/56BO1tlC
         iU7qaXdOFvb0k5p8i+4RpBiop2SY8MWRm3aVqj/8+o5ftHPRPbKoWVQ1SsW9xV37koZD
         V25jS8p8gyFEzTeXWx+BrUqh8SSAsH0iEU5Wb8hsKCe6Rj+RhtgCVwPWq7i00tj2SXJM
         J2P8tgOCzoB2PAwI8UYG4YIBPAsV+Hz5Yq2OzPnunGn4fK/NBqreIqANiklZB5dB+Rcw
         lKhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367801; x=1774972601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3qRkrcmZqnQcAsHSgrGTF3O2trpu3zcL2/3GqhPT84=;
        b=q7qTo02n6KtI43Ap5uUPAShjuPBFjEbcMeALEY7V5s19EZv8S7ihl7Z2ZVR0YA7U88
         PY4bn1gK2PmeKOwB+hsAh7pCEpQ+c6wmB6DgIgMRcAXgNhOOQc9u0gwA0FGZ5P62CIgW
         H7Z9N9Bs0b5xtCPdHva6EGvn61gPW0tRMrQxHmkodWdPdHgZT4qjnWs6HzFVAepEJ2IT
         Z+vAnjnvxt5KkVCjOpew95DEj3iZJH0mNxxIAKUMS3PQ2WL1JJwVQ4MrTWMZPmoHL+44
         FDTZXlOgyXAcXLrbDFTNxboiSQ1GLwZkE2I62UaVb80oLTpgKDWw0rfhKk1/inAt5P+n
         lh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367801; x=1774972601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3qRkrcmZqnQcAsHSgrGTF3O2trpu3zcL2/3GqhPT84=;
        b=TkDw1Oy1o0hg6TZp27mph1pRJ27wp9AutRL1vg5NG8nHBkKbrTnPS3oirEyCNW6iBz
         ZGZaTQx8k369YZHDc5jNwYC6rdi4NHxJYhNDQExv/C7wPxtouIloNlfxyCOUe0nQ8EoR
         k9v+9A1TKM8pQN5+XeBkuHE0jbvmkf8tuCNjlOzwYf9B7lzVquH4yvUv8vC/trnf+eSh
         iGpzcsynDLhNva3FY1CzBMpa3x3G4VvfNZcB+dvS0p2FbF+/yYOym0SQYHfLzIP6Ag5n
         zRwYXdZZW7EQshCFAdkxNnmCoPC9yaORHMe1LiiVxj851TbB38cgoD27iRl84bHqWrbZ
         WP7g==
X-Forwarded-Encrypted: i=1; AJvYcCXwk0u7fLX0FfYlQI1hTX3CfhF7GiESHwyRO8ZEOt2OyZOLcdXizBjs8R31uyWE20hYmTlyxHpCvcO2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33VoA+9pjlFLiVC0W67y3a4bkYQSLCTvPw7Mg8raTot4xdxrK
	B4lEWYhBXZNj9Yq9uFfm93e/X6jEevUqXU2zhnN0f2KhjVk0p+vY5GtG0B5IAW9dp4Enlb1bGN2
	B1fSvY71XsJECwVDZAHjBndamCiy2Efo=
X-Gm-Gg: ATEYQzzlXaIDrbvXW7X+jymDSl4ifC8Nca+QFRX4To+VRyAvECEcUin+oCBTMRcIUe1
	X6FYYY0cbtNE8/slKlYcbFFLkrTR3hSJNQoMgbkVuh5L5QLt5WgZDAM+xpKGZpuaLjhHx14Lola
	JjZPBhVqUwyFgzNJGQytn9CAYwFdWhHsAN55xNzCgUXIdUnQ26aE+E8R6y5uw+wcXQZb3vK6stV
	5r5vpxSvzECUG/1aVzOIG5H0g88pUN9ZSewguOlr+HCi3gUFn+iIUwer61EyWuoBy1SCBtDdiA0
	6BJE04wJeZrpJ2i2e5MoG6lYGP79uwBSRdNbZqGWaaQtkT82sMYYSW1ZyKaPg3HWK/ydOCX7y9J
	/I2a3WQ==
X-Received: by 2002:a17:907:1987:b0:b98:e8:8eaa with SMTP id
 a640c23a62f3a-b982f1ed70cmr1176255966b.7.1774367801042; Tue, 24 Mar 2026
 08:56:41 -0700 (PDT)
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
 <CAMRc=Me2RLj-vvCVNho9CPYVwsQHypC_KvKHJWkLyj=rMkfx2w@mail.gmail.com>
 <CAKxU2N8gudRXR-bLMoyDVDuv3vWuzqrbyVsHL=Gu3mDZWMvs6w@mail.gmail.com> <CAMRc=MeYoDB1QsgckNH9OGWx=WJZofMHq+zL4xY8VK+rzP3gog@mail.gmail.com>
In-Reply-To: <CAMRc=MeYoDB1QsgckNH9OGWx=WJZofMHq+zL4xY8VK+rzP3gog@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Mar 2026 08:56:29 -0700
X-Gm-Features: AQROBzADURwHKy8tFIAJpN4IsVdtcJXR_0r8UlcgpmAhJJaXZDOBRsprwoOTOm4
Message-ID: <CAKxU2N80Qf+Uc_daBSxjz26e54fAz8bLRPVZYdCcaiHhpfHK-g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34092-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8F7A2318956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 8:54=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Mar 24, 2026 at 4:52=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > On Tue, Mar 24, 2026 at 2:16=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > >
> > > On Mon, 23 Mar 2026 17:43:00 +0100, Rosen Penev <rosenp@gmail.com> sa=
id:
> > > > On Mon, Mar 23, 2026 at 3:00=E2=80=AFAM Bartosz Golaszewski <brgl@k=
ernel.org> wrote:
> > > >>
> > > >> On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@gmail=
.com> wrote:
> > > >> >
> > > >> > >
> > > >> > > static int gpio_mockup_probe(struct platform_device *pdev)
> > > >> > > {
> > > >> > >         ...
> > > >> > >         u16 ngpio;
> > > >> > >         ...
> > > >> > >         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpi=
o);
> > > >> > >         ...
> > > >> > >         gc->ngpio =3D ngpio;
> > > >> > >         ...
> > > >> > >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> > > >> > >                                    sizeof(*chip->lines), GFP_K=
ERNEL);
> > > >> > >
> > > >> > > But this begs the question: why add nr_lines when ngpio is alr=
eady part
> > > >> > > of the struct:
> > > >> > Maintainers for some inexplicable reason want an extra variable =
for
> > > >> > __counted_by works.
> > > >>
> > > >> I believe what Kees means here is: you can use ngpio for __counted=
_by() like so:
> > > >>
> > > >>   __counted_by(gc.ngpio)
> > > > __counted_by doesn't support nested variables like that.
> > > >
> > > > drivers/gpio/gpio-mockup.c:59:61: error: =E2=80=98gc=E2=80=99 undec=
lared here (not in
> > > > a function)
> > > >    59 |         struct gpio_mockup_line_status lines[] __counted_by=
(gc.ngpio);
> > >
> > > The following spin on your patch builds fine for me:
> > >
> > > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> > > index a7d69f3835c1e..9427ab8c45f73 100644
> > > --- a/drivers/gpio/gpio-mockup.c
> > > +++ b/drivers/gpio/gpio-mockup.c
> > > @@ -52,10 +52,10 @@ struct gpio_mockup_line_status {
> > >
> > >  struct gpio_mockup_chip {
> > >         struct gpio_chip gc;
> > > -       struct gpio_mockup_line_status *lines;
> > >         struct irq_domain *irq_sim_domain;
> > >         struct dentry *dbg_dir;
> > >         struct mutex lock;
> > > +       struct gpio_mockup_line_status lines[] __counted_by(gc.ngpio)=
;
> > You're using an older compiler. This does not work at all.
> >
> >  * Optional: only supported since gcc >=3D 15
> >  * Optional: only supported since clang >=3D 18
> > >  };
> > >
>
> Ok, what is this feature called in gcc parlance and where does this
> info come from?
include/linux/compiler_types.h

Lines 363-364 in linux-next.
>
> Bart

