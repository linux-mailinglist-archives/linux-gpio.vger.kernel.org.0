Return-Path: <linux-gpio+bounces-3216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5E851AA5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 18:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D691F27E31
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 17:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E787D3D56E;
	Mon, 12 Feb 2024 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmDkm5HL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163293D560;
	Mon, 12 Feb 2024 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757406; cv=none; b=M7S9KrFNOFm2ezH8KuR8/BKgfkDBJyLzOwX3xHNDhkdjBgIXHMqR3slZT7fWamyH1IdDi49QwFcAsnj7BqbYvTqGDxW4A9hPMxrrv2fvwFYTQX+o2rxDlFi+NeMXTOuclxspSwp452yc6h/UCASjw62yGkGA2jBEgp104DZVgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757406; c=relaxed/simple;
	bh=Dlp7FibgGgApQOHVmDxG7v5NbLGwWSRV0tiLb8MYe3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOt5kXAdSotXA281oC+lRLWynZ2lhnJ7FlpUXcbTaB2gbZXfuSUdngXcBQKcuBS64Y9Cn+XrcQlCL/2HoXeSVPBiYe4PM6lgTINKo7vIHGLDvG6RjIMLZibDTPZTsKNuW7A0MbbkrHGWB7n/DTWwte/Y9POgaGD92KXAYxW1G9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmDkm5HL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso33419a12.3;
        Mon, 12 Feb 2024 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707757403; x=1708362203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGNmlqjE8BUnDe0uobd+fVD+f/ArRpOblUtGx8WX5II=;
        b=kmDkm5HL/mKS3o8z+hb1bxjJMFMScmJZA7TMbNp7DSinGQgJV8mTQ6Gydieyq0YJKc
         +XwEXMufEIhJyFdP3HAkcH1lsWawW/eXdm57G36s+WDuP90WqkHS5oBCUEGeJ9Yqy2bX
         5KmCthjpIeqGpwTh4y2EIwOezQV8xHf0pZrzZV0CSuSiPyIh7Tl4t1cVCzXXJ6ggq55C
         VJiWMUhM+rAapRxw9XHtbMpH9X3UgZSW0Uet53rtgYMrDgUOsh03I5++p5x7Ng6CdQ50
         lOkYRtTKX0kD4nk065br/uGU2TWTXV9HGQainZ2BdXY7u6OniZ+JJNsVv5s1FN+NIfVp
         0oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757403; x=1708362203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGNmlqjE8BUnDe0uobd+fVD+f/ArRpOblUtGx8WX5II=;
        b=UU8Jd09VzDHWbDm5BVzxYftdKnbh+x5WFDR1mQUH9mUBR8GAnNCPjzxcBSvdivU2VV
         VeezJwiE4milKMasVHNkdw45LUvvllxym420dD1xrOu0zL9WuPExCsCGi32Z1aicAUki
         0/3pY0bZixWs1lPRw3sxnMWytoiuedcTwsf/JtJmcI5BUQ/GRKBWp9LzPhmWvCYHjqUT
         YfLrgDYfoOhf0FORrlPwgXaNEcWcxWYE7A9DmITudV6Mj8uPPCyW22mpwSYX2lWNWJVk
         3WG9u85r32dDEFPUDVVnSGLzP7qv0zxSXxn/SxJEZuWdz9yrU3G418wnhQ3fCniXjW+I
         CMKA==
X-Gm-Message-State: AOJu0YzWz10p49IQ8EVSIySJUl1RiugIaDdBkpF3R+d/ZGdF6Dgk8/Ud
	DixopKF9XIWvUVYvg4oPdoYEIGUMxb/Lsq6tBnL4Xxce6MjLpCux5TWHfyTXV0YH5qZ1LfOPDop
	KMdFJp7zuT9t9+bgxyF3buU7XcDc=
X-Google-Smtp-Source: AGHT+IFZQuwreujE1JtHPpOuHnQ/CWpqAirMmW52B/Ws8Y+k9dIFqMEXu96cYh5PeacSKsdR1zy8sR0XJf8pggI8Now=
X-Received: by 2002:a05:6402:124f:b0:560:7e85:2ce with SMTP id
 l15-20020a056402124f00b005607e8502cemr4304648edw.15.1707757403174; Mon, 12
 Feb 2024 09:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
 <20240206135115.151218-3-biju.das.jz@bp.renesas.com> <CAMuHMdWwHwZcGj9Efuqp-vnAh0Dy9br7RScOjpsL5zcCKFcbhw@mail.gmail.com>
In-Reply-To: <CAMuHMdWwHwZcGj9Efuqp-vnAh0Dy9br7RScOjpsL5zcCKFcbhw@mail.gmail.com>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 12 Feb 2024 17:03:12 +0000
Message-ID: <CADT+UeB4PL+gfiV=x2RO0U9hTDtrr3fT+8039w9eCZM8HvWc-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thanks for the feedback.

On Mon, Feb 12, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Biju,
>
> On Tue, Feb 6, 2024 at 2:51=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > Simplify rzg2l_gpio_irq_{en,dis}able by adding a helper function
> > rzg2l_gpio_irq_endisable().
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  * New patch
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Note that this conflicts with Prabhakar's "[PATCH 2/5]
> irqchip/renesas-rzg2l: Add support for RZ/Five SoC"
> https://lore.kernel.org/all/20240129151618.90922-3-prabhakar.mahadev-lad.=
rj@bp.renesas.com

Do you mean patch [1] conflicts with the above as it is irqchip related?
[1]
https://lore.kernel.org/all/20240212113712.71878-6-biju.das.jz@bp.renesas.c=
om/

Cheers,
Biju

