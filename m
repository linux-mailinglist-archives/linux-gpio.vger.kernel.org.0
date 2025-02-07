Return-Path: <linux-gpio+bounces-15582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B1A2CE37
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852BF3AB65F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76931A5B94;
	Fri,  7 Feb 2025 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSP0scUk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDEC2A1D8;
	Fri,  7 Feb 2025 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960868; cv=none; b=MchWPbZ0l2pxtTq3IUUIKcy1Of+XhUJp0E4YWTyfMMCvCYtAwHJdDnb1aMfHZnYa/cofS8Z7YA4bWw13v8CoSzXNFquJ4O85LBA3xeTTiScgp2EPxuJjJZbdxiXvegb020Yr9jVUnuOh7BBNz35jlQt1008rfTy2yvfUx8tqqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960868; c=relaxed/simple;
	bh=ZLeto5lenWWsfYShCWoRxmCdwddxKRoDvQEetKlAioQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaCN3N0M/B9Ofh4iUdeVHHtwhHeQaCixxJfonLIzUli7t05cL71CZSbVAWYo2Mx2LPIos/XkRhSEDmVVMNtLICk9DF8rMx/1+t57aPxCwvfOUJF0r3KCdWs3KGHcWMU+WFqKePTXXtR6ra7EKi8aJNolb8zgnqxmOYpNI9qJyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSP0scUk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dcd09af4f9so5186820a12.0;
        Fri, 07 Feb 2025 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738960865; x=1739565665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLeto5lenWWsfYShCWoRxmCdwddxKRoDvQEetKlAioQ=;
        b=SSP0scUkiYkmPFjWbM0p0DnMbbTjAJRtREvJE5PRkR2mDFTvbapbUjU0yL85H/AYEA
         83VfMWqDomKfV3NhesDIoXJ+x9JwLGFB2SPn+nrKw4wPOM7FTD4W1JXyKCDaxDz7jyR2
         +e+Vx3fbm06I+Y2JdK3CvNTIMFzvzJbxLZ6ym4Rz1yVIEKFypuiS0eE9dkmMdpZtxI+r
         sPds/a97HCk8TGSRr+/tCWbN7YDOIqw8zNaOEQ/Clt+0Md+/5K/V3JBu/LMVZylQX5QF
         14n/2mT7JYviF8tMkNBmEIUKQv2o//oqMRUvcybNN4TSW7qZ9dTiEtdsOn22ua+DOEPu
         UOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960865; x=1739565665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLeto5lenWWsfYShCWoRxmCdwddxKRoDvQEetKlAioQ=;
        b=qZesn6PeBpQqs2J3G2USzdQkqGv/lrUtLPhjArlJrHHeiDEf1UmfJObATBWFoAwka8
         J2MBybWIdTX71wYY0/o9hSfYm8n5hX6IqByVGNBpaZD0dCce7Ee29Wm23hxxPjR9iP6D
         GbMSrzHaclK2IBL4AdJsnGOzPsMhp/hdUjieiEZGIAqh9N8HL5zZgaefz1ADgZVUvgf2
         zwLRPoQDyO/zI0jwYOMBVBhg0oRh7+3vj6YS6UoYG42tYD8+cP3Q/CSjQUW1HNAcfmt0
         /mxFMFmX8vKZ7+sEnfTwQEsnIrbqqvyVszagGAqGfPZ2Vp935OaL0zBi+fyPJd/uih7i
         D+yw==
X-Forwarded-Encrypted: i=1; AJvYcCXNkMZJ4TTmVr5RIPR0GO1OyaGJzhr54MnVDFyWrgr0Attum4gQP2pY6vbDxLW6xf23QmDTCanUWwdW@vger.kernel.org, AJvYcCXn7K44MkPFPgzhTgMtra88yNdvKqm5Frjkc+cfAEIJw5tYbZZRMjDg/myl+17k+gAWeJR1LjSXGC8+7fOd@vger.kernel.org
X-Gm-Message-State: AOJu0YyQe9NZZhQ7lMUqF4OlJFFj96gRhixXKH21ebvbRnTl7daclAjq
	M1/w9rkiPOIkA3rIpQrXIiStLbIOAAm5R1TyG0ElxUTuSKRwmuNlAwvTWtDkSTO0y7aIucrOfc5
	2AD/mXwFEtjUZhfpWlj5t223+pkM=
X-Gm-Gg: ASbGncseOFDKodqs5RoyLhL/ko2yhmgyJockYAwdlx4HykO8wI5aCf9umw0uhKHEaB7
	Fj9trcCAIguMm38dtBUxGJLwZ1TSDXHwY82BOtEaIS6Q85BydLCOayWAvVt/JzUKeiF/OzHBj
X-Google-Smtp-Source: AGHT+IHTBXjU2mEuopccCel//ymz7vVggMYDhLgH7VKHD/w9kNEbmuNmoD4XoI5BlFQ6YqLmRGPMNfjy/JJx7cuemkw=
X-Received: by 2002:a05:6402:550c:b0:5dc:5e4b:3e21 with SMTP id
 4fb4d7f45d1cf-5de45003a18mr4956485a12.9.1738960864724; Fri, 07 Feb 2025
 12:41:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com> <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
In-Reply-To: <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
From: Dmitry Mastykin <mastichi@gmail.com>
Date: Fri, 7 Feb 2025 23:40:53 +0300
X-Gm-Features: AWEUYZk-DfzfkvP29lAJ84QYUJQNGMy1jGNY5rel3GTLhoY5cfrgZWeBmPWo6v0
Message-ID: <CALieaef39VdmjF=e+65bqF6_dkq7sT1-ps1X3gAnq-Gy6Huodg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, e.shatokhin@yadro.com, 
	arturas.moskvinas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,
thank you for the answer.
I made more tests and think that this patch shouldn't be applied.
It removes duplicated interrupts, but sometimes they increase the performan=
ce:
a new interrupt may come during handling a spurious one, and a
spurious one will become valid (resulting in a kind of polling). I see
the number of my touchscreen interrupts reduced from 200 to 130 per
second with this patch. It may be a bigger problem for users, than
duplicated interrupts. Sorry.

Kind regards,
Dmitry

On Thu, Feb 6, 2025 at 12:26=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jan 22, 2025 at 1:05=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.c=
om> wrote:
>
> > irq_mask()/irq_unmask() are not called for nested interrupts. So level
> > interrupts are never masked, chip's interrupt output is not cleared on
> > INTCAP or GPIO read, the irq handler is uselessly called again. Nested
> > irq handler is not called again, because interrupt reason is cleared by
> > its first call.
> > /proc/interrupts shows that number of chip's irqs is greater than
> > number of nested irqs.
> >
> > This patch adds masking and unmasking level interrupts inside irq handl=
er.
> >
> > Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
>
> Patch tentatively applied as non-urgent fix.
>
> If this is urgent, I need a Fixes: tags and we should also tag it
> for stable, is this a big problem for users? I don't have the big picture
> here.
>
> Adding Sebastian, if he's still using this expander.
>
> Yours,
> Linus Walleij

