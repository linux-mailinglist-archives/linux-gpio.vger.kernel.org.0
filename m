Return-Path: <linux-gpio+bounces-11052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B7994F82
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B3B1C24AB8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E6E1E0497;
	Tue,  8 Oct 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sPWqMRms"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA01E048E
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393938; cv=none; b=sLbQ6XilRb60Hh/v/43RsIVDD2yWskupmrS5Pp01nnYYpe6KgnlHAQmb9oxLah04eCM7LaPwJoIxGp0chbpudGBoMPF0nTBzyxzFEH7coEF1PfIeZOZ3nzcn/pZE4/GI8ZfI0gqXGPupOag7h+PvoNWdLlTnCeCo/KKOpqfRYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393938; c=relaxed/simple;
	bh=DD5/DTaBVXRfV89/jEFQ0xb8xN9l+7KWGkxlM7r0ImM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYZr/MNFA/uwtA/Q1s3qGJrpNTWAvIbnx0SBYdcCvEJfMRrIRH+M1MRHzTknMBSyet0QZF+LJtLfZnJ7qQvcsCCJWXyeAx5GcnpredYGNaxOTl+uSA1iHPUL2g/na1TjtlZqn+jzyXhsVxqXc3n6OyN9PfAIQM5DeUKnUUi+UO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sPWqMRms; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fadb636abaso55541301fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393935; x=1728998735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3e8whgyIpkD2qGT+yLE9z1tefe4pBrfKjkBTL2tiFU=;
        b=sPWqMRms3zM6O/woeJUPMLpMR++JxDgQDkLM3BB7ClYs050dL0pkVkg6cyPu47Z22r
         D1UQ6w6ukbtfcmaTRTixV/S4CG1NNisCR6thIsMA3Sr9K/UgoWlSBM/Ejx07dXC5fC4k
         /GkD6Ao8AtTvqpBvyE22LuTbi8nT3WobStUgTCBqv59EkLGN1575/lMAaJFVqPsrJl+M
         fIZmwawVEoNxffGHP6M1j/gBNZVQ+sN5nVqCAcmMa+lCe36IYtKUAojxQ8fRy2KiKzU2
         flMw45sjpEAi+6sltHVTUMwe2jIf71Gbdom0j1OwIkxD0XK71F9bHll2RBd2D+daporj
         i39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393935; x=1728998735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3e8whgyIpkD2qGT+yLE9z1tefe4pBrfKjkBTL2tiFU=;
        b=e525l+DXt5V1VMiE5PQ02dw/+V36PLJBi0h7RN/WFM2sOi3ipgewtv08h7tmT+ChKM
         sSh9JPw2ES3/PIsKSOhqBsmBhbCmmdLyZVVx3RZUF00RbwIK2XqLlcnFRpgMyEOil3zv
         bqHCDNdeE4MG6sx1NgGe0mNZjg8B5Qm5lpRtwrqtEJHYka4THLF64f+0p1tN+qVKchVK
         vB1fQSl9qWV9kFgx+5c6vlfWr25jVoqnD+BoFo/AgBr9wkigDgMi6ZxuKTwK/cg4tVD2
         cZ+5SspUUstKRk9FJULM6Z83WWf7WTvVhl0G7iYpEIsCqL7/aLxSnZenseEIIpPy01Cd
         9SWw==
X-Gm-Message-State: AOJu0YxeQUSaMCDgMUYwF5vGeDAyDiut5a3efKR6OoMcZKC8HCcIisTI
	aWEpVyVhnpBEqeSwuUKrioa/FhpoWI6RrzdnXF/+Kv6ka97Sdul768L5xfcdoZRC51W+J3bIMpw
	UP4P3GkysoyukV6oP/uvJm/w97RHvlMoxuXhiYw==
X-Google-Smtp-Source: AGHT+IEfBR+MGsOvP023djper0ay+Iuvoc/vfBcxVLx6tHiy/0Y+qBKh4+I8MtsT79w7rpwV13ARf+7mn2SFUso+Raw=
X-Received: by 2002:a2e:b8c4:0:b0:2fa:c49b:1106 with SMTP id
 38308e7fff4ca-2faf3d8a2c1mr71879891fa.44.1728393934887; Tue, 08 Oct 2024
 06:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-14-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-14-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:25:23 +0200
Message-ID: <CAMRc=Me0VqYFieqaqQCef9h-vBs-51N5206YgBW7EYWeOrRyOg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 14/22] bindings: python: tests: fix duplicate
 test name
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/tests_edge_event.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/=
tests/tests_edge_event.py
> index 17b27026356be60b6e928cff04917f487947824c..68ab17eae7be301cbca8d6d83=
f90a03df0aeea53 100644
> --- a/bindings/python/tests/tests_edge_event.py
> +++ b/bindings/python/tests/tests_edge_event.py
> @@ -118,7 +118,7 @@ class WaitingForEdgeEvents(TestCase):
>
>              self.assertFalse(req.wait_edge_events(timedelta(microseconds=
=3D10000)))
>
> -    def test_rising_edge_event(self):
> +    def test_falling_edge_event(self):
>          with gpiod.request_lines(
>              self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=3DE=
dge.FALLING)}
>          ) as req:
>
> --
> 2.34.1
>

+commit message and LGTM

Bart

