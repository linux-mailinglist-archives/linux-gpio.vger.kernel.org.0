Return-Path: <linux-gpio+bounces-11047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5BE994EA1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3922839DD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87021DE89F;
	Tue,  8 Oct 2024 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eoBCe25b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8731DE4CC
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393554; cv=none; b=jDYjziERxPqu8GV7SFWz8NrHp+9vtTQ3CqSIy/AjBnL4YGRsvy+sy1Cd/rEgK+jZN5mwnE/JcM8qCUD4JcGV7AA7IzVNhuQvvR9AtOKVQCPuWnKmaCiIWP4ZG7ViaPM5WW2YWT/7k3BkreClUjUiy8JlK+GTrgSrzy/HUCZ4OgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393554; c=relaxed/simple;
	bh=NMMEEz7MW6C1jHCVbMoeD73OVeqA8/Z5bfKofDJE8Yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LH/vjvvX/ethOJZAkLjga4znjnw4vxzxd9PDrxUzGxdwMmOLcXUFPg6s28m1EAfYXJ7Eex14MiMGQhD431bx9kUZc+3NM5lvA/bIxXVtfvgoVgG5WB0pNAVcFH5y0xgFzFMTsl9UDEFkRxJ3EKLLbAg5PyAFe4MdT0gIjXb5D7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eoBCe25b; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fac187eef2so66817441fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393551; x=1728998351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMMEEz7MW6C1jHCVbMoeD73OVeqA8/Z5bfKofDJE8Yc=;
        b=eoBCe25bOl0sTgj+WxvlPOgPFde+epBe60ZrtX8lQEfWqqRMuFnPUSh9ah5kpFYqAQ
         V1kypnUQ+xtGxQf8I8kzYamqg5ja02lYFsS38ykgAAQ7SMzXFFpaJ717Hbr3T3vV83e1
         fpb63AX5xYMxIrkjF8wbdYp4VgX6C/HY3TDsYWqDf90GtYVnc1z/AKmf/bY/aBPiIf/G
         XnADjIYbvempOF6X+jnyysyHFvYzslfw/4bb/CCoLI9bER/eFcuZDfBUEzveaMvJHdwO
         ZGU+3sH6ez6S2FC0SDneJzFRp9VFzP0AFkraX1+CSVpp68PYzt4QnfN4xTVvs+HBKi52
         j93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393551; x=1728998351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMMEEz7MW6C1jHCVbMoeD73OVeqA8/Z5bfKofDJE8Yc=;
        b=Zk22lcvgLZUHwbFRuTdMNw8J2bODlIKtY/JNygPKvcVXWjkSAKLZYbuC1tM7JWgvrQ
         G9J+Ey+H06yX+DV67fNp7FcyDc6d5k7YXzXVbmr4woW9ll3q1u1KqBWZyskqx2d5FUlb
         EeK79U4SeB6FtP09kJe67E36hYXji9Lc+F7+JHBD8NuHA7xdBaFCnoqnwmndEal/Uo8z
         2RmcfECaT6jTLLbh2mvpM9x/sVDzbxMYM+frUUkpH/xtFqnoe3jvIzVN9NVZntyOx6A8
         bUBB7l26ZkrMKjQdE2Mq05KC+VafBXhzZEYqrOzPO5W0V0lRGDacyUbcqa1moRnH+Ues
         4G1A==
X-Gm-Message-State: AOJu0YxB2NNE+yqvFmDFQJyzRjYli8nqEjkwKYrjErlOWMU8c/T4L3Jv
	2qejq8lqsMJi3JutkNh/IoDs4DP8uM+gtcc3Xkpk/csPIXhLB4XoTuU7QpDTGphbjBnv+9OvjN3
	E/FUvKf/bhyaosdHTEq4i8lvWnOXx6K7KmfNw6u0T8Aaz72hi
X-Google-Smtp-Source: AGHT+IFcB6H28rJUIkgyY5Ub/K0rHSJ+ZdiM8pckCyFXVjeCx3xaek+HBYc5G2BhsXrtYz/sXL0MI6I2wvy8rz9TTfo=
X-Received: by 2002:a05:651c:550:b0:2fa:cac0:2a14 with SMTP id
 38308e7fff4ca-2faf3c50682mr73350951fa.11.1728393551074; Tue, 08 Oct 2024
 06:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-9-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-9-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:18:59 +0200
Message-ID: <CAMRc=McAo2OJ4cy+_tahwv=wu9ZhLFjNg5ao=Kxk8kmc6FhY9w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 09/22] bindings: python: fix LineRequest
 union-attr type errors
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Since `LineRequest._req` can be `None`, it's necessary to inform type
> checkers of the state of the object to silence the union-attr errors.
>
> Type checkers may not be able to infer that an object is not `None` from
> an earlier call (such as `_check_released`).
>
> Instead of littering the code with "# type: ignore" comments, use casts
> to inform type checkers that objects are not `None`.
>
> Using `assert` is another option, however this duplicates the logic in
> `_check_released` so is redundant at best and, at worst, is not a safe
> replacement as `assert` can be elided in optimized Python environments
> and these checks need to be runtime enforced.
>
> Also, convert singular ints or strs to a tuple instead of a list to keep
> with the inferred variable type of `lines`.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

Basically the same questions as with Chip. Is this a common pattern in the =
wild?

Bart

