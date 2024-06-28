Return-Path: <linux-gpio+bounces-7828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FB91C652
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 21:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D6D1C2244C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 19:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAF054662;
	Fri, 28 Jun 2024 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gCJEXgio"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C13D27E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601484; cv=none; b=hCBOerv/keFkPSRS4LmNtFpAGWjbYdrm7czNTnh82mjVyvYa0egURZtUq+Vnt8RS8Sdd863zyQdCPOUAgwYwg0W1H2rXHsxV6Xi3HBRqGpC+6fhFFxPTgNf4ybsgYkjVMNK8y45ZBGqmVa3o4gAdsSmJkHhammco1TfNW+jDwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601484; c=relaxed/simple;
	bh=5p9Yxrkp6vSEyJTVaeGJcuvEKpHOojcK+EaBv9GsFsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpKytqU5Edl5NYZFQb36Fxtg/Lwc6oF4NoDKCq61NmhzswmgL8fYby6akygOSSU+7yFP5MwancvjPr0N2/i5+rICWmo5oNRovP91Eh+eWvn7H7ETPAjr7uKYoaxUxWk4rWuQ0VWdqjAXD/XKf1Oz7dTE47VbUpt2E9CFQS+1pf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gCJEXgio; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso11054741fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601481; x=1720206281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p9Yxrkp6vSEyJTVaeGJcuvEKpHOojcK+EaBv9GsFsQ=;
        b=gCJEXgiocqbd3h+/+Vrka//ayVrqNBngNIrDZp+dZs5/73ZbGkXoNHbAuKYwpR4iha
         G2AFPZncF6NqYWPwfrGRklSuYjXOqlOC2rpoqp/AqGICAE+IlLolBWNhFlPnyWK4XhkO
         mOdHbQ9mbSPFYOJY//8aDkROZg8C4wi2MazLli0mrkfw+mA1YcQV0KWLWubgt3gaK5ch
         d77DQETz2Pc3oEQDtqLKeosPHjXTbPo2ZCmdTCN5x4Ye2wgz5me0N3/k20jXYNqzDpjx
         PJP/ZRs3EE8z/i5jGqyNpxpcm9suHOF0vWiv78YYtIjUnix8OXp7UrtzqrDJ3wSxe2lE
         oseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601481; x=1720206281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p9Yxrkp6vSEyJTVaeGJcuvEKpHOojcK+EaBv9GsFsQ=;
        b=jm35Y6ghdLaYOjga7rHOV3YIQNuPVSBQUzRhSDBQEFrkwVcOCShSIUKbANloex2mbn
         IAZTq/UDHLtOAwntki1cAtjfk6v5s23Ulp0aQAu/SIgHDGjy02L+DDGVIPnp7itK1Xg6
         fK+Tk6fPozTXHLBr1jHcdk3V9KtVlAtXi980zmHuwx0XRo9/+RYaH4CU/sgqofCR5W/9
         0YZtxeMCy9slkXyRCJbsw0wDgUX/3dhziMq7bQaM/8NAfk0Mj5howxwR/pYORP8+3Tpf
         ziIiuqOjUG8/HoNX27Rv3xVbQlHjyBSiOjnwnNlWWuW46J28C9To/vbxRs0bcIaOhEDs
         ODEw==
X-Forwarded-Encrypted: i=1; AJvYcCXVrNjcNJN+85pjn9EnGkX5XkWOMedMQDfQqXqRhAtOLgpTRU76c7KTFyXcY4CweAPQsnK7vp/jCxZKRhdW5H2DDXEMQJqdhaSZBw==
X-Gm-Message-State: AOJu0Yxdtf1n9/VmCZ9UcocXtOnde7R0wC2SMddEXcMiweQqm0MeSAOd
	NizSzS0A+3fBXu8X6AM7nldkffB+gR88D2Z6acqCbxXu8G8mgyQ2fBnewRIuOVJLNLJ5V+GB9gd
	8SMMNLUXEws70bYaSgVDFx+FDzZv9khJ9zymiFw==
X-Google-Smtp-Source: AGHT+IHicuCiaYvstOkC/70pXWgZeZaKf2eHQT4lNJtw9ZlfJE1gcGIvR3TNW2X5wxh0qNdD9jxxuOobnuvWJ4Msn8Y=
X-Received: by 2002:a2e:7d11:0:b0:2ec:f68:51e0 with SMTP id
 38308e7fff4ca-2ec59526da8mr106665081fa.44.1719601480624; Fri, 28 Jun 2024
 12:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412122804.109323-1-brgl@bgdev.pl> <d0c6ebd25dfe75aae0c44ac1a0f937ae74f8f1ec.camel@siemens.com>
In-Reply-To: <d0c6ebd25dfe75aae0c44ac1a0f937ae74f8f1ec.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 21:04:28 +0200
Message-ID: <CAMRc=Mdj=AzPL_0+vSK+mxa76PhUV2Wc=Dqb4mw1mUXZMsNhPw@mail.gmail.com>
Subject: Re: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and
 command-line client
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"warthog618@gmail.com" <warthog618@gmail.com>, 
	"erik.schilling@linaro.org" <erik.schilling@linaro.org>, "phil@gadgetoid.com" <phil@gadgetoid.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 6:16=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hello Bartosz!
>
> On Fri, 2024-04-12 at 14:27 +0200, Bartosz Golaszewski wrote:
> > This has been in the works for a long time but I'm finally ready to sha=
re it
> > with the world. This introduces the DBus API definition and its impleme=
ntation
> > in the form of a GPIO manager daemon and a companion command-line clien=
t as
> > well as GLib bindings to libgpiod which form the base on which the form=
er are
> > built.
>
> Thanks a lot for your efforts!
>
> > Finally we add the DBus code that's split into the daemon and command-l=
ine
> > client. I added some examples to the README and documented the behavior=
 in
> > the help text of the programs as well as documented the interface file =
with
> > XML comments that gdbus-codegen can parse and use to generate docbook o=
utput.
>
> To me it looks like the long time anticipated replacement of [persistent]
> SYSFS userspace API finally landed and one can start thinking about phasi=
ng
> out the API declared obsolete in Linux v4.8 ;-)
>

That's precisely the goal.

> I've compiled gpio-manager and gpiocli for TI am625 (arm64) and tested on
> some HW one may compare to Beagle Play.
>
> To me it looks solid, no problems whatsoever noticed up to now, even thou=
gh
> some non-obvious limitations do exist
> ("gpiocli request: all requested lines must belong to the same chip"), bu=
t
> this probably can either be justified in documentation or improved even
> after merging.
>

Awesome, thank you!

> Will be happy to provide Tested-by: as soon as you send the series for
> merging!

Thanks, please take a look at v2 as well[1]!

Bart

[1] https://lore.kernel.org/linux-gpio/20240628-dbus-v2-0-c1331ac17cb8@lina=
ro.org/

