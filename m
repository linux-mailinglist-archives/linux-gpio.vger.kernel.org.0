Return-Path: <linux-gpio+bounces-25020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B038B37BA6
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 09:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B4061B6651D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 07:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A493176E8;
	Wed, 27 Aug 2025 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewy8eyed"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311832882CE;
	Wed, 27 Aug 2025 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279678; cv=none; b=YA2vnsekNcg2J8pg3fDf8KD0m7CnQ21MvMD8ZkPzEENbzsIUeuKRpk7ZP3AsysDNOPAwd66ydYmg+WGbIZjYbSlRgYoMfYjgmJXO1PbyQpRBvTIC3KZWNhUvVHXWOsGHoVNR8GoeBRy8lkpcuARB+HrV7f9HyqPn/vN3IxMQBN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279678; c=relaxed/simple;
	bh=GkzLJZJM11E2120FbVz9u1ftB/pyICWahmZ0vyWueO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExnR3/tGMQznZQmoKUB7ul0ARxdq83mXtXlDYNdQt3YgL5FAY7OfHaeWaZvgOi3x2HnbIwuYZ0SZ2XT6nhgfC+ZPW7UX/bk0s0IxxL0IG3YohGX3VkHu3Fvx5RoEZQHWHUNXCPdgvZh4QUnFAH5Ywc64WgPxE3a1bzjvwJHvvGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewy8eyed; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54460c7aea8so356625e0c.0;
        Wed, 27 Aug 2025 00:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756279675; x=1756884475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZbkPuGzfCRt7D/2ofNVxknZhe1ERbsBu6YasxpbtgU=;
        b=Ewy8eyedBecy+o90KBaHm0rUiIJXGiyLyn8YejXQSCDr0XjYkwuFAhAxuRp5OIaDb5
         jhQP6nP3lbu08/vfYEKFNTUMOqHpacH4iAANRlv9M2+PUnPNPOPjx6CMjE0vHUWuHtat
         MyxItUWTXtaqH1fLNU5SvJMKVRVBCIjjIeJC6FaLVGWAHFkfoSzxvnNSRzgu/WxfXdHY
         i4qK0KPIlVRrUOzn3tOk0v/NqzHKvGRYnppAJDq0hi1AP4RsqqXUAJlj1AmjA4J/nbEA
         L7PYGGluVMu4biigsOLHszcXvHAZ+mODE/YaG/ro4qAnQqBs7GYqgITJrA30yFvCvEJE
         CkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756279675; x=1756884475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZbkPuGzfCRt7D/2ofNVxknZhe1ERbsBu6YasxpbtgU=;
        b=C/1vPADpwD85l8NGjZJcu4Q/02vhaiRA7J2vaqseY0nAj4zzPxsO6Ntg0TwDIpFJiT
         mO8KIeujdOwxtNu/ox8kWwpd5J0CtFEkQAEvstrxv76eYZqXOV6cV7fTbJHQwLmE2qJa
         TPS44IUOwCAc43iV4Yj/7y3OXwn5yIOjWc+2if9gbgbZPVa2p/+GWoyAw5SAhL4ofrd3
         6cdzAVUhtJgh3IIgOBO7ghnfWY1nMlhkxHG/0M6jcbRiUBnEi7y2ybzfkZUhT3oFOmgG
         mziVTHXE0CHRhIucx20TJ9nPgLNgLFVFFoyNWoFMDiRdmupm+TxMTx9BPYsX0MTJcPEh
         8uwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/J8fmm/sVNH6Ruqmw0QBFpY80PBKSB0j6v6/DKEczSTD69aJBjTQfsQoXQXoto9o1roaU1Vl7MTQcHw==@vger.kernel.org, AJvYcCW369Y/+eruPmhsjM8rN8CApQCdBi52aClJTeJiPoOOrx7nMr8Y1J1BWVjcCVV+UjN2xbtwOU4MFI8=@vger.kernel.org, AJvYcCXpVmtNiAxKlq1bTp8DmEaZ871FLKBCkMjKBIKrzuIE2qHFcV99rqa5d8E5yXWCaTmi/Ww2in6Ic6ZIVx7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2f4vqArFBjycTbo2u3Eh1moPAXMG9ZffnUKv2HUdMIlqpENr
	g8JHnXmKMhj3QOjQ+4HNgn4wDiVCWg6utnv6hIPgqTAm/0Uyk5/VN+ilpKq2dXBBROFKJdTaell
	hK6SSsvf09Mulud9NAA8Wrgmusqo3tcc=
X-Gm-Gg: ASbGnctJSTVfr3+YHSApXVEKKXvMH8ifOxb6dqkQyHJSaxrOZ2y+dve6xMpuMRzQ+xv
	rVdROFQe8rJiAeX/1pV+bur9qfWT0stdNlc4iTgePEf4c5oUchu728KoFnddU7y6EZWuqvppWec
	w1yUEIICR/nm23nA5RKQdxLmNXkNxIDnOnYMCgKacYUv/HJbiLqMkoDofHIzwGh3xCZ5DqLOFGC
	Vuah9zuoWaGb7UcY6ZNj2OqgyY/xom0+2iDcteOzhNBwJQo2Q==
X-Google-Smtp-Source: AGHT+IHYIDFaItotF+Wumw79vgaRlTHzB5TKUl5kILQQ2oVp5v+FDkgYvy8sqgk09JqP+tiG2sWyXaOSKO+UwA3eOKg=
X-Received: by 2002:a05:6122:4f84:b0:53c:6d68:1d39 with SMTP id
 71dfb90a1353d-5438f492b99mr1603225e0c.8.1756279674948; Wed, 27 Aug 2025
 00:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827054352.669598-1-alex.t.tran@gmail.com> <87jz2p9rgm.fsf@trenco.lwn.net>
In-Reply-To: <87jz2p9rgm.fsf@trenco.lwn.net>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Wed, 27 Aug 2025 00:27:42 -0700
X-Gm-Features: Ac12FXxuqHGMHfjCI6ozl7C_5NgFK7o_xk02ZudPSl571FUEa5YeWXaO899lCh4
Message-ID: <CA+hkOd6H6RZy83zDgzAy4TKiFtOnhcwyqxWZ4KTnKeTHBngKbA@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api pinctrl cleanup
To: Jonathan Corbet <corbet@lwn.net>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 12:03=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Alex Tran <alex.t.tran@gmail.com> writes:
>
> > Resource cleanup when using pinctrl.
> >
> > Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> > ---
> >  Documentation/driver-api/pin-control.rst | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
>
> I hate to complain but ... this patch really needs a changelog saying
> what you are changing and why.
>
> Thanks,
>
> jon

Sorry about that. I'll send in a patch v2 with a better description
and a changelog.

--=20
Alex Tran
alex.t.tran@gmail.com | 408-406-2417

