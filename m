Return-Path: <linux-gpio+bounces-15426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B5A2A42F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F419D3A57B6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9C1226166;
	Thu,  6 Feb 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phkvtgat"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A8225A29
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833967; cv=none; b=C4lGHCSzDkoqfbDl+2JPY0Jo3HbTUUm0qoR/4wyfzZNBJ0Xkw6VVzVRhvZloA1CiLly+PVM7jiJ5yijHgMYW6wHRdSoTMynfrA5ivKJJfXikAH8oPgsGRPQNqJBJHQboMwDfYNhRxxbyCTSjhE5caxg2rRxSNoDSQ8jZ0Uocntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833967; c=relaxed/simple;
	bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVbOb3GX9OvZqmFKEbi7nn20BPOofM0icAqnYt0IMcpmPs+oDsmpJPHEIErVPMCLffP+QaceSrUooadxNG4cGuez3Xb8Lim3TjeynjSLHYKTIfQepUSjOK939nozK08Wc0cVEdPTlHA6rjz2OPg9QPNyAs6vZiR0XcXVkB4E2/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phkvtgat; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30737db1ab1so5577571fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833964; x=1739438764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
        b=phkvtgatJTUvb4ill9L25IPH+X5RQsEzsCnGSP9R+SZVsGFD+L2MpuLcwxsriM8Itk
         o3CsZbMn8MSzdgBoFCyaeayPvxjeSz+SoevKvrneOdSHSbfhoq5+2tuE4y+88w0QpbjT
         CF9v0viuURyxHX/ZyNx27D5WO1Lmr+pfJexlSMJJEVa2MxxRfTUGcXx5FF28Er1uYzSa
         KYN3jqjkeS1CtmezbgY4KgFqBdAP7ksLgW4bP38IPXOLese7vbAPke2TNN6AFA2/onLy
         XKawC9hhH32vgJ5DfXDSfuLcM00qQpsKi/RPlSbXVYBX29+JhGd7L4kmphz4NzodApku
         n/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833964; x=1739438764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2c4S2UJ16ciPVegmv2dJMMs9Kw5rt9rR0KKu7Wg9JY=;
        b=LGzolfUG1Fvqlqop8Uhlr3O0zusBzddrdERX78PcIXX6+w7uUK3RmfsJvHZazgMpLL
         502vGQUS1vXh8ej89mb4OZ2xY3c75R7tW3efqMO8rRGJ9hyYhyjI/CGw9FV42qMtlv3L
         lVx0qp6eHnlrLXQpPld5++4d9RxTysUJMDuCXaN6Izp5hHacMBbp6scWP+hsj0K8WhV/
         XpUBh50vS/Le06izGBvSBRezso5jTOLTSbDu3kPbizY8Q1qfeWfbVifJCrF9Nc4twclx
         cw4EA11ZFCMCmqxOZkwDMwHNeOS5znZhiVbKr8wt90QI7FB6WFK9gt9SFqWuMCwXm2wH
         JnFA==
X-Gm-Message-State: AOJu0YxAV5mkBgRATTd/YsgDx8iI9KpJeNddULCKSCpJWGGSW71P7cB6
	v03/fPj9X195tzmywEvh4M3rgRVGnOfZKMScV+yt3E6Fm72awsmQuCzay0aHKhJDBUqIdlbJAFz
	VW1xRDYXKnziDH2+U1HH0vIsk1DZBg3mnLAvIUw==
X-Gm-Gg: ASbGnctQiMxCSnTVGNA4W9IzI257//eB2s2+y+mCoR2WYBU2eR7E+w1+fdhKNPCVI6S
	0QSL+BmYeEm0jZe16cO5RbRqB1CjHKjklm/CoAhiZOUME+puG967LLBL2v3i9l9TIZ/QiOJw=
X-Google-Smtp-Source: AGHT+IHpfix2wTTPWT27xiKP8j/wnuW9XOUq2C8NV4uy6HXZ6IKZzzqyMZu71gZsBwgffLcTqpvpYTIwQQ1JPyFlhLk=
X-Received: by 2002:a2e:a909:0:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-307cf314370mr26367471fa.17.1738833963746; Thu, 06 Feb 2025
 01:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com>
In-Reply-To: <20250122120504.1279790-1-mastichi@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:25:51 +0100
X-Gm-Features: AWEUYZlZnx5W6VZZ8uZDQ1Yo7OGFd85CymAOgCope98zierlYqLTv8Taz-fU4QI
Message-ID: <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sre@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	e.shatokhin@yadro.com, arturas.moskvinas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:05=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.com=
> wrote:

> irq_mask()/irq_unmask() are not called for nested interrupts. So level
> interrupts are never masked, chip's interrupt output is not cleared on
> INTCAP or GPIO read, the irq handler is uselessly called again. Nested
> irq handler is not called again, because interrupt reason is cleared by
> its first call.
> /proc/interrupts shows that number of chip's irqs is greater than
> number of nested irqs.
>
> This patch adds masking and unmasking level interrupts inside irq handler=
.
>
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>

Patch tentatively applied as non-urgent fix.

If this is urgent, I need a Fixes: tags and we should also tag it
for stable, is this a big problem for users? I don't have the big picture
here.

Adding Sebastian, if he's still using this expander.

Yours,
Linus Walleij

