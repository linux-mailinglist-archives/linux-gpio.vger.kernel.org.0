Return-Path: <linux-gpio+bounces-14399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5A9FF6A5
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391131881E9C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B921922F5;
	Thu,  2 Jan 2025 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcdnZqh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B718FDC8
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803769; cv=none; b=GUBIC/SmVQzwz+phXwJtFmlOR/mnTyA/A7bYFz4nzcSvl9FOotoGE7M6O7Ci8WAckUJcotiLmo256NJgNHzOP6/Q3kGYoPTTmCVwA5mS3Uy/GELW1bBs9yVgbWbkZYXvmlpEF5Cf8sgZGaL0TrIrTg4cxg6RknXiApgEQWpu2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803769; c=relaxed/simple;
	bh=PY0Cyd/SMqMC8ywRze4w6m0ebbBMS7X0GxAb+NOsVs4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=nxX42Fny3ds2jAvyyWHohuNP0+qQUMU85dPv2zM60khAzC9UTbfZtCvqwPlozKdFkQqaTB8l6k95TSe2gqpkH/7smdHQUnZ7JSjy00VyatzmAO6duReVV4hp07whQlQ6hHfl8Mmi//xsAF7hQLx8ytS+IHvmGQ8DVoFW1dlVM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcdnZqh4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso15906010a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2025 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735803766; x=1736408566; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kZif/MabJuwlHsGTSrz4RdFnsQ3fJOZ/jEV6LSH5k=;
        b=YcdnZqh4BywVGq11rFtLpWkUSRli/BBEiDXz+VfPmivG4yX3WcisbbVAUEH2u7Ozht
         WYfy3d333Vfh1AkwOHd+UlwKA+rzwZ18lZGr0O0R1LlD9NNz9dzPB18O6ubUSGilqrNL
         viqiJqkCHN8/XvT1+06wQsxV7F5+WL9BF15Mm1pKoW8ZE1oXp7/mGCC/qoTRK8VwmjdL
         YldILXbZxYiCdJ4SzyNmLqAJnB067dTvIVeoog88nCrWePl8sN025+7AMTmkjl7wBWZ9
         NP1ZPqQB+pisScdWm9PTdFF/qaUIN/Zqdqxio3Tcni+i/75QCYz4pt2keBraP+4oTMci
         GE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735803766; x=1736408566;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=63kZif/MabJuwlHsGTSrz4RdFnsQ3fJOZ/jEV6LSH5k=;
        b=MGimOwc3j3F82F4PkZMWNLLXXNHEAP1fllNfsIW5HEuaFTVh/S8EanMNjJ5/AgD9+t
         9ubGP4SWxVwuQPYzbknrOFppBw9q16lVZ+LvIA1UU+K7k759usKp5QqIFWUw3yqKWAnX
         xMCGQq1hdoB5iVfjDkAC692vaZMl7VBo3A3x4gmAriU+hFrQVuJDJasWfWG2t+YSphHa
         C+h+AHppXyXTvSPn0gX0o/x6nWSy7mI7Ty7ClR89fPa7VW0qR9fKS4cDwGEWTiYT4UHv
         xMRayWGxs0lzEFxU0kD3A7C5GXUXVxJ2hQ2dAiL+O3VwjHug2vCy/nZ4uX63ERjhUpBk
         Elpw==
X-Forwarded-Encrypted: i=1; AJvYcCXN3GKMLyWtBdX9nBllVXAgr4TULukfbe4t4zG4/z0hZVGKPFUygPFgyExBZDU/r1zJAIyaskw27eKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyT20Y9xI8BDsobuT8jhXxgBlBAf4KuJcTlp9+6MGxs+/1Fq3E/
	ybypMKXdWu/19B1d7mdPNIFbfVWInSKOHHWoym7hwxGE/7BWgRflyxKJXTa8pfc=
X-Gm-Gg: ASbGnctUnv2jXMk5HWX5ExrbQ4wv1TTon5srqhU9/QqC3o1y+PMHxysJsxxicOxsiNH
	RzR346a39TLJYMIbl4LnLdoxXphXt5M7KglX+ovRHb/nXMl3lVuibk1DJ1EJy6xivxh1iG54fMC
	Lf5lMnbtUl6qQxb0B8zm9VHku1BqwpUm9PdXJ8x0vJGVq371d2wVAbBShK0eF92LV51ow0l4tyw
	lP0e80eBUxmj4GmyPzZrmE+oVMhlPfUcnUssSc07gA=
X-Google-Smtp-Source: AGHT+IGfjlnBi/tDDTDtAT0CXX8aM4YI9aNoVweCauWEvisopKoblQHATQBlOYT4gXFS/JVUX+yG8A==
X-Received: by 2002:a05:6402:13d0:b0:5d9:b8b:e369 with SMTP id 4fb4d7f45d1cf-5d90b8be3famr121281a12.27.1735803766107;
        Wed, 01 Jan 2025 23:42:46 -0800 (PST)
Received: from localhost ([2001:9e8:d593:2300::f39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae4345sm1757877266b.84.2025.01.01.23.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 23:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jan 2025 08:42:45 +0100
Message-Id: <D6RF2X71A2QX.3D8K6N3TPKFPU@linaro.org>
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
To: "Kent Gibson" <warthog618@gmail.com>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: build warning in libgpiod rust bindings with rust 1.83
X-Mailer: aerc 0.18.2
References: <CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com> <20241221020102.GA45199@rigel>
In-Reply-To: <20241221020102.GA45199@rigel>

Sorry! I was mostly offline over the holidays.

On Sat Dec 21, 2024 at 3:01 AM CET, Kent Gibson wrote:
> On Fri, Dec 20, 2024 at 05:25:16PM +0100, Bartosz Golaszewski wrote:
> > Hi Viresh et al,
> >
> > I noticed the following warning when building libgpiod rust bindings
> > with rust 1.83:
> >
> > warning: elided lifetime has a name
> >   --> libgpiod/src/line_request.rs:234:26
> >    |
> > 231 |     pub fn read_edge_events<'a>(
> >    |                             -- lifetime `'a` declared here
> > ...
> > 234 |     ) -> Result<request::Events> {
> >    |                          ^^^^^^ this elided lifetime gets resolved=
 as `'a`
> >    |
> >    =3D note: `#[warn(elided_named_lifetimes)]` on by default
> >
> > Could you please take a look as I have no idea what that means?
> >
>
> clippy is complaining that the lifetime of the returned object is implici=
t.
>
> Try:
>
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -231,7 +231,7 @@ impl Request {
>      pub fn read_edge_events<'a>(
>          &'a self,
>          buffer: &'a mut request::Buffer,
> -    ) -> Result<request::Events> {
> +    ) -> Result<request::Events<'a>> {
>          buffer.read_edge_events(self)
>      }
>  }
>
> to make it explicit.

Thats overall correct. Though this is an actual compiler warning and not
coming from clippy.

But looking in a bit more detail I think the 'a on &self is wrong:

--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -230,7 +230,7 @@ impl Request {
     /// This function will block if no event was queued for the line.
     pub fn read_edge_events<'a>(
-        &'a self,
+        &self,
         buffer: &'a mut request::Buffer,
-    ) -> Result<request::Events> {
+    ) -> Result<request::Events<'a>> {
         buffer.read_edge_events(self)
     }

The lifetime is needed because the returned event reference is linked
to the lifetime of the buffer. With the &'a self the compiler will add a
<'a> to the return value.

But there is no dependency on the Request reference that extends longer
than this function call. Instead we want to explicitly break up the tie
to the &self and tie it to the buffer instead!

Sent a patch: https://lore.kernel.org/r/20250102-lifetime-fix-v1-1-313a6bc8=
06c4@linaro.org/

- Erik


