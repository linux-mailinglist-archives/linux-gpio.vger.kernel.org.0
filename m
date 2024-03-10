Return-Path: <linux-gpio+bounces-4240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F087780F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 19:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2BB280D6F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 18:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD1C39AE7;
	Sun, 10 Mar 2024 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3TE4n83P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5B383B5
	for <linux-gpio@vger.kernel.org>; Sun, 10 Mar 2024 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710096484; cv=none; b=rKHEAxpagD/VWNYwWw6O5GLxAOaKsCOV89BsLmWuLfUdllsQNqDQirTLcn0V6tbsqugW2UxJWrEQiGslumVH9c+UXaevFB64bX2yhX38ulplvfieU/iEVgC84+XkeUaVR2aBwLBjHj5QIWLYyrZ3c+wlqR4Katbqr2+1U4+PtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710096484; c=relaxed/simple;
	bh=yjDiQ6EmoSPWs+jxMyw2mrIL32DHB/TDBA/Ctdbp4Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GR0VR2oK8kzffviLqkg7D/wOpCPqqx2qKG/pUjMubf1QSMy/rgM97mEd9hR+AOiJEbWME9+FpUWiPAgU7/dSSA4Hy8+btbt5HNoG7jQjQBmBuOn7oraSLJTjiD9Qka3XorDXX51pIQ0S4yS+0C3aatXcgwJrRBgdZe4rXWLP+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3TE4n83P; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7dbd6ffb889so576924241.2
        for <linux-gpio@vger.kernel.org>; Sun, 10 Mar 2024 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710096481; x=1710701281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD6UXb3NvCVd/JZdge+6tyuJP9lEh8ASn2aYMHrfYck=;
        b=3TE4n83PYWfCC+5Q5Dl9vsq2itEx7ZrZTbbveWaq2hE2+7WrG04Fm5gRU8WfemF5af
         EkuL3kku0ualoGsE1u9T2xv0I22aiodF3re/69FRYXLH5V2Dws0sfOHAUt8cpbG6fOFW
         7qTso0Kp1qcJy5Q8eULMz57gbyjW6EnSaqa0oCKCiN9euZbjxcfKlToT1i5pOi2dDqKn
         JwOMntIRMnfEOiR4q8GI4NzEPLqUg7Df77SfGrU1pFe//sO3qMTQDDw/tv3ojrpn2aqc
         6GC90NXfp3yOZ9w175keaDJapQSsG5EkxRCmfm78k98TXHbzfE0WV8A3tjNKC4lseLF5
         HflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710096481; x=1710701281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sD6UXb3NvCVd/JZdge+6tyuJP9lEh8ASn2aYMHrfYck=;
        b=JZ+SLrtq4eVwJiB8IRaCrvMTWrOC2LdIt5v7GFdDWx4N9NFCuDHT0wIxjQB1PQXW+c
         HREg9a/PKqrEWmrjjBviZ+UiwQi4JC96cXsb0kvGXuSp7pypV5kC7jZKssXuV2exlKff
         3hsSr+DcuWHLMxyWzyb0ORaCnvfXvmGZ0y1z2IDsZmftDAtNIP3DqiATz+pM9/wTASQA
         z4WXxp+5WBdmAlEB3bXZmBaYa2NxyPf7dHSpYl89LcSAfU01tZSvMkP/AKomZSg7ZYdM
         uy18tPWNSqj5gHyHhqwt0x02zotgLPt6ho9iOAHQWmLxPb/bhocVWnZZC6rX02v0dEtr
         fY4g==
X-Gm-Message-State: AOJu0Yx9s2+qS4mUy/MZP80Zm/NmYGBPWWIBAmzlfVBnvDPEiyIUkdY9
	ptlZ2ZXRMzP8FuSGMADeHYPrsN489FnIfavqWXcI+61nlSfbtyuo+iZ9rAP0ZeA5nQ7wrYxad66
	0KX7JRW7JYJ2//fVZxv6XqvTySm9KGoDFJ03Jaq+aEgNOMYKi
X-Google-Smtp-Source: AGHT+IFeyyqAMgiAqfZkWQ2RvupHmAK8YT6F3CspLufO+ceh4lGJWTtLWlY44a8Rj7FZEWUSz4Eb3eCm0rARNIr7N6M=
X-Received: by 2002:a67:c518:0:b0:473:2686:3105 with SMTP id
 e24-20020a67c518000000b0047326863105mr1391766vsk.19.1710096480836; Sun, 10
 Mar 2024 11:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309103041.168095-1-warthog618@gmail.com>
In-Reply-To: <20240309103041.168095-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 10 Mar 2024 19:47:49 +0100
Message-ID: <CAMRc=Me7eJ3v5a+mHaxUnCjHDbkTwfhNH4n3SyA0RXLqAMT62g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: cxx: examples: fix typo in comment
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 11:30=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Fix typo in comment in watch_multiple_line_values.cpp.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/cxx/examples/watch_multiple_line_values.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/cxx/examples/watch_multiple_line_values.cpp b/bindi=
ngs/cxx/examples/watch_multiple_line_values.cpp
> index fb71fb2..ea78667 100644
> --- a/bindings/cxx/examples/watch_multiple_line_values.cpp
> +++ b/bindings/cxx/examples/watch_multiple_line_values.cpp
> @@ -46,7 +46,7 @@ int main()
>         ::gpiod::edge_event_buffer buffer;
>
>         for (;;) {
> -               /* Blocks until at leat one event available */
> +               /* Blocks until at least one event available */
>                 request.read_edge_events(buffer);
>
>                 for (const auto &event : buffer)
> --
> 2.39.2
>

Applied, thanks!

Bart

