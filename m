Return-Path: <linux-gpio+bounces-17843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0C1A6B772
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 10:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5DF17CBBB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B209F1EFFA4;
	Fri, 21 Mar 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IjFqRArv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84C86250
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549569; cv=none; b=oerOmNoQt+KCJUL8wmevLHFts/42a2CNvtGBvpIG9tgMYnpGnsR+CivNkT2EVj/mle3OUYmW1nB6E1jk8Djw7Bq+2gQ0Koz8L0wwcE2881EtAeptYL04rSGRn63cUmlQjIcXVSWCmg5XJhPLPGTD5qc839/aM1b4uqvPj/0GfBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549569; c=relaxed/simple;
	bh=8l835NqhtHKDpDCF8TwkawTXg6ZyJjQcteu/6vzckqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihjQuNwEfqdXxdnp/x4/89Vy3s1nNbaW35CBFEy9p8hwZHGqsgqFepobgcxyJGNLnQGWASwr3gtfKTDPRDUaVERUEHO+5U0rt+jJyw7AeYOI+oR66QhMSKM/z6OS/g53RxBjfZLbMtbJVuY47cH2vWs4gMNy5HOfj8Cepa5Lwco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IjFqRArv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54993c68ba0so1932093e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742549565; x=1743154365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XERU60U+/917LDlw8Qh1PwVjkqJc5Zc5clGeyplc/uQ=;
        b=IjFqRArvQCCOyZNnIhbdiOJG9/gQzY6vje4x5AAahlO6piZuqc44yOga+q7gL0GQmw
         vxVTKWdgRM7vYCrL5FMdHmqoPykBGayyT3ZKqY6zmuthrtq89LXf9kfh+fBuqgcIHR9x
         oHylLjrQyPdqqaP6cp6Bwm2xdfzmBASBGnv5UrAtwoCQtfDiG23/VMdmRicEQa/yHN7c
         zJPg55gk1DH3EOrZWJGORI4hpQT4YhDq5ttXIZC9ooTkhR58eOhdIUvbVb9a5kpU0dqv
         SUJ6Z88zWSnDBe+5Lx5PCmOh1lZSFWvzQ0j3pyc66l1LnriLyQoAHoDc0Bb5rL+8mpsN
         8pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549565; x=1743154365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XERU60U+/917LDlw8Qh1PwVjkqJc5Zc5clGeyplc/uQ=;
        b=tQ1pNwvgaghmH8bzkhjBdVQkcmWzmhOlRQLDNM2rAFAW7b84mesDHTA2TUMf0hdUOB
         tdP+ew0dcSY6+jukEZj6L83Gfbr1NHWCZNPoyVpiT5odMx3Eq7iw7zNMrnsDSpjZG3Yt
         W93OxZbGU1BFSy0NG03g1ZYFgo3oLLTiRI7ahC8r+DaYavKRkQPZ1dxLp69Cf+O7+KDW
         YsLAF4vXDUUD+hlrsHEWNGWk3fbf8QYzkBY7SRRsx1jhdW1kBNzDZFlQ/451g8MLqL+1
         FY4lsgJCrIbjnMHrRyYdDQls13WxqIyX2Tltqq567TLHbXt6LPHPEU2K+xyUnbE5hrcj
         TAeg==
X-Gm-Message-State: AOJu0YytnG0bStzlSmZOADQXqkdGjEE6EgoLkGF265iKe6ZBV2LCRgvS
	crhVUSpBLh9WZdLN97zaaykFYPewGWsLG2+g31OD8zm8+I8zLtETzHcXqgg5vI/7g4ht7VTGl71
	IuFtzgvXVffvHTf5Ijj/zWjXWxWbF+8w4gspmBJP2zSsS2Q98
X-Gm-Gg: ASbGncvTdeznCvQN2aDUef+fnhYmR2yqC21CV7LkWuOfC436lR/O6es9JIyre3378JT
	O6muWIK9dAQFjyWSi2hKlLayrHsHGWkTTii99K1FG42r4Dh9wDYHjjgFG42k3bW6rxQxZDiKArB
	mKdNBhu3IZ+Ht1S7yOycHAbdlLPgaD2BI/mkdPtuSXdMoW6pPHdbSdBHoJEA==
X-Google-Smtp-Source: AGHT+IEBY/fAkajQuSRVyTlgq4N4SP7Bkx/9OIDkKArz9qXyC4VVwsnCnYIMkFFYjCEYx/lIBp/Z82J5Ve+iwB/DbQQ=
X-Received: by 2002:a05:6512:3b0f:b0:549:91db:c14b with SMTP id
 2adb3069b0e04-54ad6483b20mr867660e87.8.1742549565227; Fri, 21 Mar 2025
 02:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-4-koichiro.den@canonical.com> <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>
 <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
In-Reply-To: <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 10:32:33 +0100
X-Gm-Features: AQ5f1JoHHL9KDzZ-SWQEW7Y07v2J_ZxYiDw8Jn6eKd_fUK42Cla39In5LPZr_GQ
Message-ID: <CAMRc=Mcng+jW2WrAREOf-GC1mCbGEyAiMP_Ms9B3BzXnCoFGFQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 3:37=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Thu, Mar 20, 2025 at 04:51:04PM GMT, Bartosz Golaszewski wrote:
> > On Sat, Mar 15, 2025 at 5:41=E2=80=AFPM Koichiro Den <koichiro.den@cano=
nical.com> wrote:
> > >
> > > Prepare for the upcoming configfs interface. These functions will be
> > > used by both the existing sysfs interface and the new configfs
> > > interface, reducing code duplication.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > ---
> > >
> > > +static int aggr_alloc(struct gpio_aggregator **aggr, size_t arg_size=
)
> > > +{
> > > +       struct gpio_aggregator *new __free(kfree) =3D NULL;
> > > +       int ret;
> > > +
> > > +       new =3D kzalloc(sizeof(*new) + arg_size, GFP_KERNEL);
> >
> > Please prefer declaring the auto variable and initializing it at the
> > same time. Should be:
> >
> > struct gpio_aggregator *new __free(kfree) =3D kzalloc(...);
>
> Thanks for the review. Should I send v7 for this change?
>

You should send one anyway once v6.15-rc1 is tagged.

Bartosz

