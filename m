Return-Path: <linux-gpio+bounces-7024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C677E8D6929
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 20:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8172B28582C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 18:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DB67E78E;
	Fri, 31 May 2024 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdXAuIEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8501CA89;
	Fri, 31 May 2024 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181117; cv=none; b=WhLRfFHV0NFAb+m6OZFBjZSHz6WkhGWbhJs1ymo6PMO+jz7dyC+cbKiJwykSHhc2pL0YIiAbt+X5O1gunGeAXaeYjRfayevmgU/ZdlArDl5zZIhtOT9+EOmnyDGlKtk1LKcz6QVylepHQUJ85HdpcoO8EHn1qX0VB0dc0ODHMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181117; c=relaxed/simple;
	bh=SCjsIE5+zvS9rP3n0m54mGHXZqab+yIT8w0uoj6U6sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfJ3Qdw3+xfWXXWLjvruac50E+fBd2hAoh7A38TaVNF7c7YB8ycxWPgxnJCYDo3OuEjfUMJvcNqyPMGLCOmFPwzgyshvdAHlL65VBD2EhIUHEKd8TREwQltVAfXhrGKcS1QeBo0nVWv3ESeihXDVlC8SI2nrJUhUwW7PNTjsu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdXAuIEy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b894021cbso1312562e87.0;
        Fri, 31 May 2024 11:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717181114; x=1717785914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCjsIE5+zvS9rP3n0m54mGHXZqab+yIT8w0uoj6U6sw=;
        b=bdXAuIEyGLKzCFri4i8auI032pLiV3ZTKkpVRUEQJAxDAIvNIcSZhqEQMWD/ODWQSl
         lOAqn5Qp8JbknC3vEAA5bAjUAk20oo4veAExuJmD3TUROeWNHiKeYqV7DQTNxqcs4RY6
         1E78I2Oh3m1LQsjZZ9M5rorILs2WO8tBRe2/VS2g7xpo1cJDV8Neo1etoGsmOM6GnIFg
         N6XbrpNrD+vjt0y+X5rM4kmAOqbfLkA7CifR+6ppHlXBUPNSRLDMjiHXMJaEbRIGkOD3
         Rhtq/FFU9znwC3R9FI9/Eug4bx8+kZ37bPCYfr+lvD25vWfd2w1wtrqBhgRHD1YE79Dp
         XT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717181114; x=1717785914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCjsIE5+zvS9rP3n0m54mGHXZqab+yIT8w0uoj6U6sw=;
        b=JPEXv1qvpELcn5w1+yei8x4MAmNr0ETGLymKW2tfv75CsFiDXiIsffDkeYxPZOkRen
         uwKLqWUqTUsnCvgue5FxPe5a13A8nAPAtG2VIYE4lv6lCsSQAXHwRGwGRWLB9YUJ6OvT
         0SPWiBYmVaX1kS1VDODXb5fPmNqitE0s6ILQwi+DUcCdZuze5ML6E1CtTL+jaoWDli4E
         5BZUexNgkQNKsGGzdtEzsGIDxH3yQTtTwRoIkfZxqv1IjBCF3tY8YtB14VEVzKfUzYBO
         dKwz6cRkQ/l/sRr5FaCOvDz0xzcM82XyYOETLrdi8nKy13tZD7KU7mof9UlsEoMiJsOS
         kt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3xAPZ6Y36CedVV66wEgi+JuKaJgvw86t3k1HNu7vyh2n66I0Cr3O8FJ9e+YzhChWU0j0aXqC9oN14pafA91o0r9qgx/NlfV+CwiOjG1BGPTxK66y9Hk3X8VtcA4JF5DkkeZuAU5GM66bQaV2yG5qM/r5BAVKhMFBaOGOMpnz1PJ3fh6lKRNrJZ7ZwXfKIW9tIgapY9CSXM8dsYhmOl66ZRWSM
X-Gm-Message-State: AOJu0YxN0fSrrhZ9K17pGtGh7eAXo4GnvqqLo3FnYzF518a49U9WuAdX
	785EvKHMDf3tAEqqNtwTwto41yLhXHbl3lLRtopufM3eQLtxxjyYJtBLXcIX1bea4Sy3dYGLelx
	IcEptuL17+qkhjqiZkuLNZ3jVsfEAokea9Oo=
X-Google-Smtp-Source: AGHT+IGPFx3SbX46u6FcgWqP3HyDQn7qBgWc59dS9IF2/z8xp+8k/UHwXL/kVWGoHL5Vft+Iz0XBX4M1m/N2R+4uAmc=
X-Received: by 2002:a05:6512:250a:b0:52b:8728:5ea6 with SMTP id
 2adb3069b0e04-52b89596257mr2511384e87.19.1717181113392; Fri, 31 May 2024
 11:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-13-johan+linaro@kernel.org> <20240531170837.GC1204315@google.com>
In-Reply-To: <20240531170837.GC1204315@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 May 2024 21:44:36 +0300
Message-ID: <CAHp75VfMS8dYbG=bmzkaq2M8SMXu+HbT6D+BP_iY9Ep3VsR2wQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] mfd: pm8008: rework driver
To: Lee Jones <lee@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 8:08=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Please improve the subject line.
>
> I'll come back to review the whole set once Andy has had his wicked way w=
ith you!

I guess we came to the equilibrium, I still disagree on some points,
but Johan has a strong opinion to not follow my comments. So, it's up
to you now :)

--=20
With Best Regards,
Andy Shevchenko

