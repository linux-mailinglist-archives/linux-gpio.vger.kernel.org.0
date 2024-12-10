Return-Path: <linux-gpio+bounces-13709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4189EB41F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 15:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDBE1162672
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 14:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEA81B3940;
	Tue, 10 Dec 2024 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdc9DWPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47F51B21A0
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842743; cv=none; b=ChFGZsCAtgapJnEkxRsps2DggDhzuQTAiG0nOB9sq5w9YBLMYLMQclVbsDFn8c8sXDw99ecS6ab2HRKL5ZYQkUVJPSt9wHIlVZsw4IBvJ/Z+rZR746NMq5JwFEeMBGnXYMl5eLr3rlTWbpEupOtmLQbf5AZb4D+D5NhOxAk1MgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842743; c=relaxed/simple;
	bh=J7+jTHTpEv8hAbsKcDdttvV6rynaiEdIPtCcKOKIAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMaAzzrquk6/BkOrYT82dOjoHyw94Xw+9Eh48jQVGTlM8Yomv+zx8mitBiph97f1Vukw1t4Bgt8AmfhobQtskdOcp0+xS6T/6MPVGF4HqRYMkcI5UOHCQb59/me2ru/UK716io9JS8vgJFvQttb2JxaJtG4ttFVb99be1DlbM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdc9DWPA; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd5248d663so1766261a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733842741; x=1734447541; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lj3IRNmWEYgi/7mlyaBTerTQ86H0/FnZFE20fTBmRII=;
        b=Qdc9DWPAgozcQF0FSDCLiRPt6tuYFztkIBm6LaVJ3mE+mzT9ewLc8ns+mtpoL7hcJJ
         QmBmezikLRXy3uBdTHNxGoJtXGYFdn+3BZZDbaZhJjVTDdgrnCHtr12GY7tumejKqHn1
         XxJdesrNPKwbUhsOfABXobL0jJlsDJC9D+SaeXyjV6t1Dx6GksqCqz+m3PEA++acycFN
         kPWzVEtMrpThim4m9L6wzGZkv42xwLtP8vq7J/LbnnAgGsUZaGNL9N2ySArOJCwfsDAx
         nl4GRM9pOQx0fkYfXRbWjPyj3+UEWJwzJn3KETGMUf6rvgVjTuBvXDJ67eKTpEaSue11
         zJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842741; x=1734447541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj3IRNmWEYgi/7mlyaBTerTQ86H0/FnZFE20fTBmRII=;
        b=Jfqb1XaISuVCOOL2vi5SfCsv6AzswS2BD3mV6wXO02q3FR0EK/QMvenik5hRXvhDE1
         VurhHfval6RU201fA+9/3V2rO5eKk5+IXVnLHiRa0eelORGgTUEDm1QtJkUJ+dsbyOR0
         +Rdimrjnh7W/DH/0kM/WuYok/lpsj4Ekx3ZfHszuVjnal4foeZLYAnrZwH09OmSJFgFL
         1MZXhHu/cLmd4tU0y6o/rq0r3/NKi4kJRnFHYj4n6RPuxSPKp6EMae/frme0A/c9f4Wy
         doRGRMTGW1iTl1fleFG+sTSoXl+AunpSGPw5EWiAAAXND4p+UC98Bk1bc9PhCsDNimhe
         NlMg==
X-Forwarded-Encrypted: i=1; AJvYcCXcy5sRvbk4/qAZTmtVfGxVryTbfoaHBhT1gio9gp1QPbYvPbRRXZd5yof8FGg66cB6FrNFS2OWM98F@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi+d1M1DgYRKLaCPmtC45nVjjN/uNPBYsRVae1OHHmmamW7t+w
	SPBDluafY3K0kAFmeiJZfuaxgndxM4uyBufFXGi9dbswqwFftbcf
X-Gm-Gg: ASbGncuT7z10Rb4JL4m2O41kCzRUwMXmxalxgLOPqXUy3Eu2adGn3gc7tjSkFr+UxJ5
	0FFJsf67HbPIUFRJ1N8x33Odp3UvgcwPNdPfYo2GeOBt5J8HSWmzTumPc5I3CB/UkHahfTf/fHa
	uieP51WlGZ1ycYseKcnH8odGWSCbJ3+ghbCp/Ox3T3xyvbeulHCQt0/NTN1yX2WFyw5S/Y75mcx
	9FE7U+iLyXqqaRT1UGYf9fiWpfl1g9wphBqC4SVh4TJXMR6
X-Google-Smtp-Source: AGHT+IHCHNjBVPp7zD5Oj4JlBC6Z52UKHggs5rT4IcZmkxnMsIzA8Ou8Dfy9K19HJUsUvFHNMQBubA==
X-Received: by 2002:a17:90b:3803:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2ef6a1e8cf5mr26627154a91.15.1733842741029;
        Tue, 10 Dec 2024 06:59:01 -0800 (PST)
Received: from rigel ([115.131.222.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eeffb6035esm8668402a91.0.2024.12.10.06.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:59:00 -0800 (PST)
Date: Tue, 10 Dec 2024 22:58:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Message-ID: <20241210145855.GA211178@rigel>
References: <PH1P110MB1603EC2CDF8B08F7C1FDADDA9F3DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMRc=McLjp8J_jWqZcN-rGvc8aKqEyjZQj5kGxQ4zkJNnFJVBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McLjp8J_jWqZcN-rGvc8aKqEyjZQj5kGxQ4zkJNnFJVBw@mail.gmail.com>

On Tue, Dec 10, 2024 at 03:21:29PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 10, 2024 at 3:17 PM Vincent Fazio <vfazio@xes-inc.com> wrote:
> >
> > >
> > > @@ -131,6 +132,23 @@ class WatchingInfoEventWorks(TestCase):
> > >          self.assertGreater(ts_rel, ts_rec)
> > >          self.assertGreater(ts_rec, ts_req)
> > >
> > > +    def test_select_chip_object(self):
> >
> > Nit:
> >
> > def test_select_chip_object(self) -> None:
> >
> > These fail `mypy --strict` otherwise. These are optional checks so I'll leave it up to you to decide if you want to implement them.
> >
>
> Ah! This is why I didn't see it, I missed the --strict switch. Thanks.
>
> On an unrelated note: mypy --strict is giving me this:
>
> bindings/python/gpiod/line.py:19: error: Non-overlapping equality
> check (left operand type: "Value", right operand type: "int")
> [comparison-overlap]
>
> for:
>
> 18     def __bool__(self) -> bool:
> 19         return self == self.ACTIVE
>
> How do I fix it?
>

How about this:

    def __bool__(self) -> bool:
        return self.value == _ext.VALUE_ACTIVE

?

Granted that is a workaround and your original code should be fine, but
it does get rid of the warning...

Cheers,
Kent.


