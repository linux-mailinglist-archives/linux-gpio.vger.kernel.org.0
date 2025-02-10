Return-Path: <linux-gpio+bounces-15636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2783A2E657
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FA51889B73
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 08:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A73E1C07E5;
	Mon, 10 Feb 2025 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tMMeF+FQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D51BFE03
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175784; cv=none; b=Zru4arP35XdxfEAsWpT8HbE54YTp4LYMLK92fpqQLn03mfuQhqxvt7PmjJLDWH0ttFcXC++WpXGmMHJTfooGrRF60zUjIqOpzelK2uv3cdvrLsMSAE/+8ZfCPiWADEYGXMkwEFN88wM0KT3xHNXAcOPcc5/fDlKuMIxfoo4HMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175784; c=relaxed/simple;
	bh=YkP0GghXk5rZxXF+bKkrcLZxMboqgkzN8bfvUUzqc+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpOtFzC0fMPYmzDu9P8DocSiTM6HffPNOe19IdtEAwZNGGPq1ju0eQtQ8znLotwVSRRydjjzwsMddzPOtpsKtvXuSRUy2Vp1fuNSRJL2568nEsuZqIWQu+j/96inDJS45VKmsLMfnzwsi0o95WlCi9stTzjDyV4OCWq93JIUV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tMMeF+FQ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-545074b88aaso1308896e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 00:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739175780; x=1739780580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoT+boRbhRr/jTb1oqMqPAiRLBIMVE1Brfce63wCwqw=;
        b=tMMeF+FQfWm8yjUy/r7DnHUozcGGNFCKgTQeMe05rv0xsqsceLU9JAZmKrFOHnUw4B
         ifSElsd7dWiDa3J2L6bQTTEBM2Qfrb7UaLvvgWdl5JCoMljRjh5U4DDHtcifINgvlwQY
         CoNvFTlwRIvQ+BZwWBp/acYoysnFT9vWIaluMMcl0xWM9WJIE/Oqh6vxYdS+rB53JhBs
         Sr2fkVuxDVIgplCJCRZfuSbSFm9NG2h3BfR97v28deK/gMCSluMu/eqFMfCvv+rhNnEW
         yO8Sq/vEmiH419FWpkRbg2vIhosaSG6pW+eRNSDnj8ZQvtgeGgTEpV0RaVfCx6hQEXUQ
         StNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175780; x=1739780580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoT+boRbhRr/jTb1oqMqPAiRLBIMVE1Brfce63wCwqw=;
        b=ZrV1WOZI2SeVkSXPO5aO6gJ8DTDrpgjhN8HeF7sKOJBbBD01PYFOssrOVmC2IGDf9+
         e/ZsOTFCoT4OvgsLVfBiie0YPerr04Td/GC4BsoRCu9WCN//wJPOrfiZp5KDUAKcWFzw
         WPudNeQLDY5MfO5MTOCert+WBiJdna/UIOMrVDebREqdpxw7zcCwa44gbVciNQ6UmHcY
         /eOz3ORJbwPdYWUWVWR1D9a7GibsGCcsc5TewDFs+X0mPMEwJF0O92lTqqnR4UDepDL1
         rQFd6va5Zp5uMiPD3T1XmceMQBhmCQV77sWRkKCTlEDGXykWabTmLqAM5a+2DJEZymBX
         WVbw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKXrsjFK2wUK7IGFZP56WLrxCKTm15Dbv5DL8yJgYxlGO9zO92dUx94Yldwm0fe1J7A4eY1rg+9P3@vger.kernel.org
X-Gm-Message-State: AOJu0YySsXvs2XbJCHd6P3OByPKlyNv6TU0/7wbOtXBtlKQBJ7soR3OQ
	mwiTvxLFiNWpSF774jyV7TJ3n7USMA+LmK9yGini8dISbCwD82ONZ79wPwKpHMK3J7atGdypR8L
	bIzBTKUs/g5o2f+hmUwqSKdLRIUPhm92h97JnXA==
X-Gm-Gg: ASbGnct5Kyu5guFIrfd8VKMrXncBGRJqnlZr9C734oLT6u8gLPuk0HPl2xlxWkEYcIM
	OuG5hZ8kihF92zYmkrVrZuhPpYp9tyOMKtIEn4QRCgbuINUPCKLKohj0WMZBmchharuYrCaRU4x
	qq8OuIAWrfs51iUH5FpSudIfbj2S3/
X-Google-Smtp-Source: AGHT+IFFAiFvMPMX5w5vYWoD1W4TlwXK4TNGtARGkVlKtIMWS7CPgk80bycWo/eBWUAIbKZuY1UA3HQ76st0rRLGm2U=
X-Received: by 2002:ac2:47f3:0:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-544ffbecdebmr2209076e87.46.1739175779838; Mon, 10 Feb 2025
 00:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103083520.1764441-1-a909204013@gmail.com>
 <20250106043508.x3pwt3jzh37t265f@vireshk-i7> <20250107060044.hteiw6dgycz5rr7x@vireshk-i7>
 <CAHqiF6Aoe4eUShxpPfKczPF-bVneiyM0gpZ7xWF3artzoC__7Q@mail.gmail.com> <20250210045653.p5d6svdl4d32sttf@vireshk-i7>
In-Reply-To: <20250210045653.p5d6svdl4d32sttf@vireshk-i7>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 09:22:49 +0100
X-Gm-Features: AWEUYZm0bjFLpqFBJMLvFtabmvBsH883FPmkZVriR3JJZIG8MQp8vYUvvpxS9Nc
Message-ID: <CAMRc=MfocjJW_oYbePC2yOWZUHnTuUfkvs0d+ANz9=TDdegBxg@mail.gmail.com>
Subject: Re: [PATCH] drivers:gpio: support multiple virtio-gpio controller instances
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Leng Cold <a909204013@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, info@metux.net, 
	vireshk@kernel.org, linux-gpio@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 5:56=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> +GPIO maintainers.
>
> On 08-02-25, 15:54, Leng Cold wrote:
> > ping
> >
> > Viresh Kumar <viresh.kumar@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=88=
7=E6=97=A5=E5=91=A8=E4=BA=8C 14:00=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > On 06-01-25, 10:05, Viresh Kumar wrote:
> > > > On 03-01-25, 16:35, hlleng wrote:
> > > > > Modify the virtio-gpio driver to support multiple virtual GPIO
> > > controller
> > > > > instances. The previous static global irq_chip structure caused
> > > conflicts
> > > > > between multiple virtio-gpio device instances as they shared the =
same
> > > > > interrupt controller configuration.
> > > >
> > > > What is the conflict you are getting since all it has is callbacks =
only,
> > > I
> > > > wonder why do we need to duplicate it.
> > >
> > > Ahh, so irq chip should be shared actually..
> > >
> > > static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
> > > {
> > >         ...
> > >
> > >         /* Check if the irqchip already has this hook... */
> > >         if (irqchip->irq_enable =3D=3D gpiochip_irq_enable ||
> > >                 irqchip->irq_mask =3D=3D gpiochip_irq_mask) {
> > >                 /*
> > >                  * ...and if so, give a gentle warning that this is b=
ad
> > >                  * practice.
> > >                  */
> > >                 chip_info(gc,
> > >                           "detected irqchip that is shared with multi=
ple
> > > gpiochips: please fix the driver.\n");
> > >                 return;
> > >         }
> > >
> > >         ...
> > > }
> > >
> > > For your patch:
> > >
> > > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> --
> viresh

The author would have had more success getting our attention if they
used get_maintainer.pl. Also: the subject is wrong, should be "gpio:
virtio: ...".

Please resend a proper version with Viresh' tag collected.

Bart

