Return-Path: <linux-gpio+bounces-13706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AB9EB30C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 15:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D1118827C9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 14:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADDF1ABED8;
	Tue, 10 Dec 2024 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8TsGm3s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF81AA792
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840504; cv=none; b=pYtagEYxD/RzQUueXg4OkqJ12I+iTdBt6vf1SP/E/1uybz2uIKq0VzzH7ki+SUz8e4lTvQRGAuhjd5fn7kvLATaImyezuV9SnSaFqgY6T8mlqAkf3lsXoqgQQ1GY9danuOA/gIMHUwsScUtTT4fhBanA+4ALBo3INWoYxAG08lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840504; c=relaxed/simple;
	bh=MDuB7G95sw8Ghkjr69h3R4u1uJE3wDaCCF0bygKZHAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCHAbgKIQVVL+EuMgZjnl1hY2yi6kmX50jGCJmuFecgAJDq0g6gVQ9KwejEZ2es26Yj+ntVwh+Bg71mkhRZZghcwcdAA3wheCiNTLSxZQWL/v70rr2VJlZfp5C/efu85mh1oybJKecD1rKuwXF9hE/gDBDtFxjHWD0oEnOmL7rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F8TsGm3s; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e384e3481so3303228e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 06:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733840500; x=1734445300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ0DGWFlGIoGNqZ/R4FA96whdWcHMy7cbXSkJER04uI=;
        b=F8TsGm3sZLptP+WMOjGW4IMioEZtsEC73AX2mGAPXhrXqG/o6XWZJpgQvcDAuB/4e8
         bn/JKV/lOPJQD0L96PediWjscqs2QYsvamOyvObQHhCJ7ljwVd7/fzt+xLdZZr7HRTfT
         LiVnUnINomB5dxF4nfbhuipeNcfII0MtWKizFApV47iGlGsXVcd6uZbIp2dHrwsZN29k
         6M9KCc/UBf5kFkbT18ojMbYpL+Azj1ERESGT1/uE31w//EqDG3B7a1b6PscGIrhKtJlw
         iIyDbej3D/Kut+0dXZZ13d256xq3SZReSs7ssvtbW6APWSexWehUCtlMaBR0e3ZUklx9
         xEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840500; x=1734445300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJ0DGWFlGIoGNqZ/R4FA96whdWcHMy7cbXSkJER04uI=;
        b=Fr1qgMLsOmV97qDf+s+PN4WC9Dx53P41W7tbcOS9T0buKO+WoHnCcvS3CrPv66mkSF
         H3k+qJN2RLTBD09yOZkOGKbC0nwV2TnWalJHYKE3XAwf89TO9e5t1PesOlBPVhrY2Hm/
         mZbvkhgrZbXKd30WHhNDn+JU8eKHeLMHX0o90psGgotuUv6xYTIb6C1P/TUMUDvgpxlG
         zMQe21WDkH0iavPCC+O3zz4mi/ujr9RntoAkw7fI1pyWhtisGF6GVfVHMEyy85jYSuBC
         MrJUZCHvmYjjgLoEoDlRcVwkqyq/mvZZAmp/8bAULuXslmDh/BUTeRLU5SSDoU0REEdF
         +d7w==
X-Forwarded-Encrypted: i=1; AJvYcCX8A56m9A5+7ZbSGGcpaZDvk7XpguVVvDdh98omFYEJTGfXxJecCgNnNyebS1FZPMrurDXsR01PTXOF@vger.kernel.org
X-Gm-Message-State: AOJu0YyvEqQhUssqE6HJHxOObV5mOm6SkiwHTqfPjlb4KcUccXYzRSto
	bbGNh5dGM45nvsh+cm7B++ZDHyDLWOHT+c1yK+MhnIn37Wz9TXBYAzBEKquqnqiY94hEs13MsAA
	m6hoz/gAWsPt9v6w6rrZJYeMKMr234fA8bomjKg==
X-Gm-Gg: ASbGncuHZy2sOfnItdeg5lsajSygrmlpoxbFaK3UNUeDXaGBc3XAiWNCGA9hgfmMgSG
	XQAfwT8lJcgwF9hB3/TDF1QAn7NyDPFZ70V2NiNm9mqAMTr+OECP8lWsBscRQoEgpB0k=
X-Google-Smtp-Source: AGHT+IHAMPQmyKXGGXmfrAzIObrcJiNh68MX6RT6JoADZJ/kqWRPut7UliV1zsoq0G1xaOpxryXeMQJ6Drlrn+M2nvQ=
X-Received: by 2002:a05:6512:10c4:b0:540:15b2:fd27 with SMTP id
 2adb3069b0e04-54015b2fec5mr3728392e87.7.1733840500380; Tue, 10 Dec 2024
 06:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PH1P110MB1603EC2CDF8B08F7C1FDADDA9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603EC2CDF8B08F7C1FDADDA9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 15:21:29 +0100
Message-ID: <CAMRc=McLjp8J_jWqZcN-rGvc8aKqEyjZQj5kGxQ4zkJNnFJVBw@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: provide fileno() for Chip and LineRequest
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 3:17=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> >
> > @@ -131,6 +132,23 @@ class WatchingInfoEventWorks(TestCase):
> >          self.assertGreater(ts_rel, ts_rec)
> >          self.assertGreater(ts_rec, ts_req)
> >
> > +    def test_select_chip_object(self):
>
> Nit:
>
> def test_select_chip_object(self) -> None:
>
> These fail `mypy --strict` otherwise. These are optional checks so I'll l=
eave it up to you to decide if you want to implement them.
>

Ah! This is why I didn't see it, I missed the --strict switch. Thanks.

On an unrelated note: mypy --strict is giving me this:

bindings/python/gpiod/line.py:19: error: Non-overlapping equality
check (left operand type: "Value", right operand type: "int")
[comparison-overlap]

for:

18     def __bool__(self) -> bool:
19         return self =3D=3D self.ACTIVE

How do I fix it?

Bart

> Otherwise-
>
> Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
>

