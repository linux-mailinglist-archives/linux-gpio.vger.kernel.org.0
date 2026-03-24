Return-Path: <linux-gpio+bounces-34097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBSSDLDXwmllmgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:28:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FF31AD1C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 19:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9083085300
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 18:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CC63A1D02;
	Tue, 24 Mar 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr0JnZCI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9C39FCDD
	for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376744; cv=pass; b=NzSnjSxBkl+xCwJQB4el4IMfoj9W7xoBYaRxNHVbxhr6ulIEM7JLYahR2eaS0g4GhdksnwimY0kcy8H3QoV+DlyckGBxHCpmuwdgR1KLDa0f/iBPfCkC7h/W68zx5Ly+J4ZrYTyblak1yMQ6bA6bsiHjDcU84+UgBVgk9y6gR7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376744; c=relaxed/simple;
	bh=nSeJjWi9ff21ilzihYD7YJPR61++LDGp71PADOCu5cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQZ1MOXTNJ/WdXlF1bvOjJHD9OlaWmFon0EJ2KUftL4Yj5em0XyWU9rgjtNiUPZtfALlXN6sP+uGQx9yybabpx2cIb2k3j3QqgfzpGdGpFyRMW8+6mVybKWbBcYF1Tgz1tLF6JWI2d+H5UlOUoQ86An7w6Pio+CRlfzNW3gukj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wr0JnZCI; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97bca3797dso209051466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2026 11:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774376741; cv=none;
        d=google.com; s=arc-20240605;
        b=Lu8XZpfiHY9iC5WoYt1QnQ3lRRFMwNT9NMQik1jjPaFimJ4+4Ig+GYFJnZTE1FniTx
         yr2ePZcYmE9HSEuuJH+fWQlerCSlLAz/ijmLbCQQibKzLuqxn5ScsWhVLkmfku19R4jX
         /PVhBRs+CFENbFIviJX49Q12zyPNqN73CYobn56c0URY9yWgsDdjd6JYqWtCa0a2ErJg
         H0C+FbqECEiMKcWk0OJOa2PDp12A1QW7+PPUcpgBSzevmR654ra05BhJvD98wsDm0YQ5
         kLGstWx3C1NxtSL46E03g8xmj3Tv0NiqSjvI6T9okQp19smAzcBW7Ig+AlDhZqgBdraQ
         O0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QK4NUvTEC0se5sdlimEBUGkPC6mWj52an2k34LrXOLs=;
        fh=4H9MyTnPpc3lZtfHSRhZsEAamfqx8q55o2gnZs/BlXo=;
        b=bqbyrLJToT02wO7rCzFSZy0/FiwiW2NxBKoo02c+A8LSrGwffy9R9DwEQYoHR3VDfJ
         h1EepN6xQ0Wzq2LP3mL6Xpswn17nDHipU24Hj07yIaug9DnnbWHSbS+++HOdS2JXglvw
         To/lONVHU1Kt++xmMYoZevzOmNJOKEFSN0KNSNQx8go2FUdUhDc/Ws4psl4s8p3yHdnI
         Sknz7FDUCj9ityFxMVJ+/C23fyb0RqLGXeqSPEYjST0S2ZhVheBRSXLpx3/Y8E0yimZW
         PU3gGZzYmn9BxdIdeoy8K7F0DBnhRNqME4vHBwTQlaCT0D20IzjBCOjW08DW5LgmGHRd
         MTEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376741; x=1774981541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK4NUvTEC0se5sdlimEBUGkPC6mWj52an2k34LrXOLs=;
        b=Wr0JnZCIrytmmcN/pEfjMSz1DKNpQTX1Zp/hXxE21IHktTEagZT8ASEunmUlmu1v9h
         nfRuZp/bWegr0JqYMf7z4KDFeR3M3edbh18KntwvpjVnGLkoBlfwgbCZ3fzgH1+c5f3E
         I9pVrXpXcET9fqq4oDTvJ/qj8Iyvo8C63VC1v3WAzyCXssgsdPDt1SOBOkmbm0dIL+xc
         6G9WRW0NkTwJbU9W/z46Y+LT0fYtth9gaNpsKJWhbolZGcHHuqB+sjJ9b9tshYM22ngf
         ArxzcTIKTgH/fFh2eKH76nEreiXj2VvFFUNHqr8HtI/wOO9dJahy6EzS99H0ewnBgv8q
         ZH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376741; x=1774981541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QK4NUvTEC0se5sdlimEBUGkPC6mWj52an2k34LrXOLs=;
        b=b+5XGQ2xS3hgGjZqYgubPuZEUm5zGe2YM7or5lBRq45f5sQ+hIne6UaF+m2v7bLyve
         F3DkmND/FLKzp6MIjITq4jZLGqwqna/Ev9V2zUZWUAzs2JomZCSvtcvavW1WiGn1MWjI
         fZ/hiAgAyeBl2u4fsREEn1s7s86JxbMgzQRJFAalCyUv56YOsPq4tRgbseto2u6zgdoo
         A2d/okItReDj3v8bnTExTHaBUOaMOt+OvJVd/8E6+8KwzaNOTRBpe5nDVqraR/y5Nvus
         Hu+bk8RxgCq20QXQ/4MC+GSiZao21CIRo5PKwkLApIz+CZGie/Wb5jzrEZvz2Nbms0/F
         BXsg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Ph47X9PQDeEXlT7XLfNLvjVmWcT2fCzeKpHvUngb03BB8acPawB8HEAEkmWLsB/cl1T7bGLVqMN6@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUo8cxwZ6K0YzS06mlWySES513Y2mz8kSFfjdk3vhviFBpwiU
	rTl6zj27rWk2ndDnGYZCwFsA75DneHsb9Q8SsFfOzQWIBJugOGvySE0XGTb02aXzvvgdxUDOZ8t
	PurPUzVunfaeyX4p2rAdHhWmivL0tI3A=
X-Gm-Gg: ATEYQzxn3pwtvIDNESdA/gy6QCcwG5fvZ38LRs2lq/4bZU9cjFHTRMrFEckgZbI74PU
	7wa7WHMVAnBB6YamOUJzJMHlF9iD3iqjkp+w0sOtUWhvy7fmWr5JHx44fmflBp5mtPS9qlhXNZ7
	iXd0MMiD6MpuYDhwwxaBx2fIsBGFZePQi012eA3DjWHSIKDIlihq4mcqbbAe+TeLqregTl0m+9o
	j/f63Wi0lfUWBaQrKKf7O39TeRWSJZyK33cL9Qu35fbqqtBd5sqjODGx4dHHYHHKRjLPAFH+H5l
	tk0eHOovLsGvoPueD1Gw1/ZqmiSkv9iric/YvCKbqQjuVWo3yERBrNl8lipGm4YlkugiFtuQihY
	6C9A/WA==
X-Received: by 2002:a17:906:f59c:b0:b98:8a4a:7d15 with SMTP id
 a640c23a62f3a-b9a3f1a70fdmr30898466b.19.1774376740366; Tue, 24 Mar 2026
 11:25:40 -0700 (PDT)
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
 <CAKxU2N8gudRXR-bLMoyDVDuv3vWuzqrbyVsHL=Gu3mDZWMvs6w@mail.gmail.com>
 <CAMRc=MeYoDB1QsgckNH9OGWx=WJZofMHq+zL4xY8VK+rzP3gog@mail.gmail.com>
 <CAKxU2N80Qf+Uc_daBSxjz26e54fAz8bLRPVZYdCcaiHhpfHK-g@mail.gmail.com> <CAMRc=Mcv1TW55R87xiuAOQShX1Tjf_=BkwfoXdDN8SfUK=a5GQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mcv1TW55R87xiuAOQShX1Tjf_=BkwfoXdDN8SfUK=a5GQ@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Mar 2026 11:25:29 -0700
X-Gm-Features: AQROBzAP0LwYIgjA2GAFD4uEyPzen9IwFHr8wG9Eghx_TY_10NtmkgkzTOhTbjo
Message-ID: <CAKxU2N9gCoyDapYmiY31EMPnTr0vPns6nme26xtibw+Ybs5iHA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34097-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9C1FF31AD1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:16=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Tue, Mar 24, 2026 at 4:56=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > On Tue, Mar 24, 2026 at 8:54=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > >
> > > On Tue, Mar 24, 2026 at 4:52=E2=80=AFPM Rosen Penev <rosenp@gmail.com=
> wrote:
> > > >
> > > > On Tue, Mar 24, 2026 at 2:16=E2=80=AFAM Bartosz Golaszewski <brgl@k=
ernel.org> wrote:
> > > > >
> > > > > On Mon, 23 Mar 2026 17:43:00 +0100, Rosen Penev <rosenp@gmail.com=
> said:
> > > > > > On Mon, Mar 23, 2026 at 3:00=E2=80=AFAM Bartosz Golaszewski <br=
gl@kernel.org> wrote:
> > > > > >>
> > > > > >> On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@g=
mail.com> wrote:
> > > > > >> >
> > > > > >> > >
> > > > > >> > > static int gpio_mockup_probe(struct platform_device *pdev)
> > > > > >> > > {
> > > > > >> > >         ...
> > > > > >> > >         u16 ngpio;
> > > > > >> > >         ...
> > > > > >> > >         rv =3D device_property_read_u16(dev, "nr-gpios", &=
ngpio);
> > > > > >> > >         ...
> > > > > >> > >         gc->ngpio =3D ngpio;
> > > > > >> > >         ...
> > > > > >> > >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> > > > > >> > >                                    sizeof(*chip->lines), G=
FP_KERNEL);
> > > > > >> > >
> > > > > >> > > But this begs the question: why add nr_lines when ngpio is=
 already part
> > > > > >> > > of the struct:
> > > > > >> > Maintainers for some inexplicable reason want an extra varia=
ble for
> > > > > >> > __counted_by works.
> > > > > >>
> > > > > >> I believe what Kees means here is: you can use ngpio for __cou=
nted_by() like so:
> > > > > >>
> > > > > >>   __counted_by(gc.ngpio)
> > > > > > __counted_by doesn't support nested variables like that.
> > > > > >
> > > > > > drivers/gpio/gpio-mockup.c:59:61: error: =E2=80=98gc=E2=80=99 u=
ndeclared here (not in
> > > > > > a function)
> > > > > >    59 |         struct gpio_mockup_line_status lines[] __counte=
d_by(gc.ngpio);
> > > > >
> > > > > The following spin on your patch builds fine for me:
> > > > >
> > > > > diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mocku=
p.c
> > > > > index a7d69f3835c1e..9427ab8c45f73 100644
> > > > > --- a/drivers/gpio/gpio-mockup.c
> > > > > +++ b/drivers/gpio/gpio-mockup.c
> > > > > @@ -52,10 +52,10 @@ struct gpio_mockup_line_status {
> > > > >
> > > > >  struct gpio_mockup_chip {
> > > > >         struct gpio_chip gc;
> > > > > -       struct gpio_mockup_line_status *lines;
> > > > >         struct irq_domain *irq_sim_domain;
> > > > >         struct dentry *dbg_dir;
> > > > >         struct mutex lock;
> > > > > +       struct gpio_mockup_line_status lines[] __counted_by(gc.ng=
pio);
> > > > You're using an older compiler. This does not work at all.
> > > >
> > > >  *
>
> Indeed, sorry. In that case I don't know what Kees meant. I'm fine
> with a new variable.
I think his comment is that there's already a counting variable, with
or without counted_by.
>
> Bartosz

