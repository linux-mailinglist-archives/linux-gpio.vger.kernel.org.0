Return-Path: <linux-gpio+bounces-16723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF1A489E4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 21:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4220A7A7A6A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 20:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F025270ED6;
	Thu, 27 Feb 2025 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AA2v0n05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36526FA79
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688177; cv=none; b=Ux2keWU4N8grYCRLhLf6/Q4Gbih0tSKJdWGdS0s6BZwQ3EI/jEAxyMXZ3NtdJ/faXr1Wlw9AaEMclix7XeDRblcT1yozSWXS3SRT99g4HkRcu/RVSPV7XaUEA6qDchSUEHOb57ouYIKpSyC6avk/6UaSH0m6pN0rfXwWLKliouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688177; c=relaxed/simple;
	bh=nH1/oGByc+iBu96dw+Zy6qisDGml17fymMZEEgpMtAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHLrALAcM/aC0cxEqB6Ltio6vpn43jKWnpbTPk8NDjVikCOsfQk/ZVKN4MklNvwgxD5ZPWehzZUH7Vha+jRwoqWGtpgrl+nafMm7IVYQ/Buva7E7gFtFibUqYN8Ag8FZKloXfFyqyuFKW6Ca+mIAwW1B5cGv8k04aUq6GvZU9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AA2v0n05; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so15668551fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 12:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740688173; x=1741292973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nH1/oGByc+iBu96dw+Zy6qisDGml17fymMZEEgpMtAI=;
        b=AA2v0n05PeHAvyCfuf3MV4WZwBy2GbLdHR8MHmMMyaI5XhNgLRZhya0wfQk017Kei8
         iqjUtQDswK4+Qx3dcj6jHhiDhPF+vXh1Kl9AsAueRsIMDZszwn+tqW9rmwOfUobNx2NK
         rZPH510rt05N+PvBf87US70rf5QhhxO++keLSSCYftyFBa1wdg89x3pZRw2OzOsD7Rqi
         BI8lycR0yDV6uwYoND9foNkR3jzK0apWRYKyi7iKj9cMMaS7uK3+EOuP/Z6fa3jgqgto
         0jp2lAi59ANFqMy72LMY/15c6ZiSpNqX287NnT3CvV7xXTSGIhxP9hZ3xCZiiwIRjLSW
         YT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688173; x=1741292973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nH1/oGByc+iBu96dw+Zy6qisDGml17fymMZEEgpMtAI=;
        b=uVbs2nJro1sLTRbvzN8cl5Dg0VYYoqB14pvqTfurTcI6UBxNgm5recLyzyRSH6scgr
         y1/cg/4qeXi0NbqtNE9RxP4qPv78IL3pqY2UShah4zdmrBWiTutG9jK6IfKJ+B0yHrMZ
         HqyiAiKrUv3zPL1j6EGQUB3J2A77lKH3W5/KlMIYOmwH5sGzGGgxVLVV1IiPHK2KJJym
         tlv74wIesMCpBdKWxomRf3gvnQb9c3ym64MOQfFpvKH8iny1tNxTZmHGLrt2UNBsqPmP
         0zyvwEsbDHhgOjVQ0wOcmuPRbllAvwXTISb9a9oU/MPjsHu6kfTQ0MGu2qKyqBO1ieXQ
         cpPg==
X-Forwarded-Encrypted: i=1; AJvYcCV8rrfmMBdYJIqANx+Htf8T7jQd98BX4mBjPjQMzKQZ98OLwH5FmhPbRyyr4asA/GUinINW6RtRWA/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ0aCkVMZQ7Dz+QNFzJGag+YtvKP2KSeHKUfV2hax45ozGRvxm
	ehbuET6woUxwHc1JspESe0R3RCxiOac9iE8eyoLxyrmeZtxDjI75k8UkqF6WpGsApNBUxyFO7p5
	jTlkX9nGHJgatzDtoHm2bepeNEuCmKPnT+IQIiw==
X-Gm-Gg: ASbGncvZEind611THRUlGV7alCQwZHnO4j49ngkP58z5iuMXVdftCvczrkdSlgS0mPK
	ykRF6y+lygumdWaMJuCF7J+Gag55uhoUJYQE1STMzqfA4YwzccV+m4JuOipbxcGAVlhS4nmL+Wg
	HvadVwtbo=
X-Google-Smtp-Source: AGHT+IFDXl+7ddDj6hm4Z0U7Ss9i6FJ4nUHpHqcxipo+ykFbrCbzbYOK6wzikZNbk8TESo7HQ5zQcH+JdEWcEjvJQp0=
X-Received: by 2002:a2e:bea1:0:b0:308:e9ae:b5b3 with SMTP id
 38308e7fff4ca-30b9320d236mr1534171fa.1.1740688173194; Thu, 27 Feb 2025
 12:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com> <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
 <CALieaedTCPNkMBZaaFWME9LHDE5OypcaOw0uDBK5fFFcNSO=wQ@mail.gmail.com>
 <CACRpkdbpWgZHUn4SouR3yL_xjhjnyC0ogb8bErDuECakyhPW_Q@mail.gmail.com> <CALieaeeVfDe8GBFO6O_=_Z5W+y7==WWbD8x-596EAw-qMXf9ZQ@mail.gmail.com>
In-Reply-To: <CALieaeeVfDe8GBFO6O_=_Z5W+y7==WWbD8x-596EAw-qMXf9ZQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 Feb 2025 21:29:22 +0100
X-Gm-Features: AQ5f1Jpb_F0yzUv3qOEZmy0xdQDEx6N_IXmhovhmcUS_IKLlnpmHPIztH6om750
Message-ID: <CACRpkdYoDroEqwtH4GVa5VZ0WeBs85hY8ostM68gR06XzQ0Ctg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Dmitry Mastykin <mastichi@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"e.shatokhin@yadro.com" <e.shatokhin@yadro.com>, 
	"arturas.moskvinas@gmail.com" <arturas.moskvinas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 8:18=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.com=
> wrote:

> Thank you, Linus. No, I have no users. It's only a prototype, using a
> touchscreen. I think it has to be redesigned using chipset interrupt
> controller's pin instead of the expander to speed-up, although I don't
> feel touch gets slower. I spoke about hypothetical users who may use
> the expander as an interrupt controller at rates comparable to
> mcp23s08_irq() execution time, and may get less interrupts per second.

Well I think the patch is completely reasonable so I'll just leave
it in for now. If it causes problems we can revert it.

Yours,
Linus Walleij

