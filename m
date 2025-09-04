Return-Path: <linux-gpio+bounces-25604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59CB43FFD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 17:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A8215429B5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0B2367DC;
	Thu,  4 Sep 2025 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0sKVNZh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86B4308F07
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756998459; cv=none; b=NjmTfig62uIKcZqKQDpiSbi8xsW7qbeDFw3b/Eu7kSeR36oV0+RywBAxg3wmHvnvbd03koNJzZh0XogK+V/fULSKgO3CJoaXcicwZwJt2dC8XPNMs5feIuAgaHGQpUDFynqxtSX5Ju4rPKMxksoVhlR+vtcIpkssHy2C2u2caLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756998459; c=relaxed/simple;
	bh=Z20zI4u9ghFEvxn/9Nlvcp2HXjgRbxnClcQSVehBtMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tO7c7aVtshmDiVLmCiizCsLp2t/hPj0NY0Vdiwswl6+8stPQxpWJ7KmqPSEQazordDfC47wwSKsTAmh9rjqBP7/mkmhhSzo4jBYg2ZnSbO7fknKUbXCSM13xnzAOlzDXcua/Kx+0mNhjUDheQ+NV7erVVxzePxd4DdLUgL6QkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0sKVNZh; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89a89313bb7so401568241.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756998456; x=1757603256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J3JiyBjhFtxN3QRkg1io4u96odnjPYhfkApW+0FQvoA=;
        b=T0sKVNZhDpyAIPtGWFPCc1RdiiWutisa6rkiidQYO4igPVde7RXEEyt1t9UX1bH3hg
         nPh5MTk43Qt3LKkxzzVt8Xn/482NM2HJpSv1YVBqeBKSmopuz8g+rjW0MgP0In4lH0nY
         oipqPVBAZ/oG1fVYTcI4i+ODIPpTeNWEEenK2p4/oTEjfvJm52kdXdl9Ub64E6cwhi/y
         +qR1o4KbeA8CH08dQChUUQmZrYbAmbIwKS+evmfsnoXeWx6W+Nmv0JKS1toPUFQmxEDH
         VPanjgXJR82y2m9oWBF7FljlTIN+sWEUQhhGv0yUVocL3d5oNUvMkbIbGDTjAmu2VeXA
         GJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756998456; x=1757603256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3JiyBjhFtxN3QRkg1io4u96odnjPYhfkApW+0FQvoA=;
        b=vdK7YelSzjo8pH0r6pbwO9VjNEkYKcaxStaaIv+QPTk7P6WVXXUxLVVuPyrC/MA1/T
         RunxhfsS6j8VV2wu0hyK2OVW0vkUWQLn+nN07gsvGWIUpK3ArBx+GWaU5tddWVLpRaTL
         C8Xlz6aTi5TkFmRgNRBR6F49UEkOqBT99VblUvipO9cQIvVlowcNVK1/X16ZTpGxwQit
         YSJPOKdidIugOke61+/ajmTQsKcvwo/Yc+mG4En8XJrvpUhzc5Ckj7svzd5d/iQSg0gK
         jlthMzDdSkAmceSXpwuk8ZUcGmn8MsU8wzN0d2yqlSOd5Z0gJkGcEJDTTj+Z2YoWsE8m
         GhhQ==
X-Gm-Message-State: AOJu0Yy5gLKCOZvHfaRIQ1PJju5yq5TWzOq9UuhTECjC+qCgggjE5pmX
	2vi7J19A/7u/DsM8+YCnKUrL6/kpZVVvfhdEj0/elJr+SWkZF7rBt2kkFoC6/vbsIWLHFEvhEEi
	9Nk/8kYn2Do5s9TLBfpwAOQUkN5S1GtU=
X-Gm-Gg: ASbGncvLE6wJW6qalBohX/GesF01FuWMMlPCX27jk2AeZTIlknj1BxBdl5G8+JJUNE9
	OKvpX4eimTP6YPNfpiYur9bnOwr5KAPV4M9lK96uhArqCfMZ7+dafdtSqhWgB1Qyl0m2xIy5ZV5
	w7FZJFy3hqlj9IuTAGTnPyyTSwPYY8OuaZolfDUyL3CjmkRoMz3WIlcdYLQsYnOKUMvJHDOQWZ/
	Ish2T6qeHFsQDNK6pZUdeFwxlTvmXpLV3sifatV6ONQGmCvrgg=
X-Google-Smtp-Source: AGHT+IEh0V106NzupPh8L74H6G/2ZHGpICnChXK67K9fuZtMa16HmEIJ6kVi3ytDQI+wFblyklX4Y1MHQEK7zbupkUM=
X-Received: by 2002:a67:e7c6:0:b0:52a:7083:2f67 with SMTP id
 ada2fe7eead31-52b1b9185f6mr6550315137.24.1756998456226; Thu, 04 Sep 2025
 08:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902123905.6491-1-vfazio@gmail.com> <CAMRc=McdCY5q9+DGBqCCL7kYAF69q0n43G4yF3=g18VBawO9tA@mail.gmail.com>
In-Reply-To: <CAMRc=McdCY5q9+DGBqCCL7kYAF69q0n43G4yF3=g18VBawO9tA@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 4 Sep 2025 10:07:24 -0500
X-Gm-Features: Ac12FXyVQXUcXq9mUeikIjftnIdBpywePDaruAduFRd71BDa5vtrbTk8zY9wBdU
Message-ID: <CAOrEah4xbLYsD4Rk6UYHiskMa71ue6gmhDW7yLtOgSZ+oP_pJA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: parse non-tuple Iterable keys
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"

> >          # Sanitize lines - don't allow offset repetitions or offset-name conflicts.
> >          for offset, count in Counter(
> > -            [
> > -                self.line_offset_from_id(line)
> > -                for line in (
> > -                    lambda t: [
> > -                        j for i in (t) for j in (i if isinstance(i, tuple) else (i,))
> > -                    ]
> > -                )(tuple(config.keys()))
> > -            ]
> > +            self._resolve_config_keys_to_offsets(config_keys=config.keys())
>
> This looks good, just a quick question: is there any particular reason
> to use a named argument here? Looks like a positional parameter would
> work just fine and stay pretty clear as the method only takes one.
>

No specific reason, it has just become my habit to use named arguments
even if it's not a kwarg.

Providing the name for a positional argument allows them to be
declared in any order should new arguments be added and is a bit more
self-documenting.

Granted, in a function that's only ever expected to take a single
argument, it's probably overkill.

If it looks ok otherwise and you intend to accept the patch, please
feel free to amend the patch to remove the named argument. Otherwise I
can submit a v2.

-Vincent

