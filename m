Return-Path: <linux-gpio+bounces-1093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB0808510
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 10:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52AA7283E35
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069E335286;
	Thu,  7 Dec 2023 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O55XMeMl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BE7132
	for <linux-gpio@vger.kernel.org>; Thu,  7 Dec 2023 01:59:14 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db538b07865so853409276.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Dec 2023 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701943153; x=1702547953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6K465pI4zAWlwCamlpDG3HILRkV9gPVUA692gl6Sek=;
        b=O55XMeMlHOwm+GbmwnwdJIf8Tb5gumCUwMQnspnn/K0AiiXvZ6jlXGOCT08XfFgORF
         aWKiDAufxdj75Jb0o4eyq83/3da7EuU7EPQDTlXOHrp5Q8DvmRfu7VNORk/r4pRZ8ajy
         eDSoajDaghkYNgKF2rGvI+PRjk5zSplohxDhAlbUSlAhfKNJKlxHoAZCEzogB7VQ7BSC
         SeLoGsrzqoftl62DFFH25HLRyAPQMjUSlkk8NrtUfYTPXt03E7ZuXIECiV9tpyru1a7o
         JvMFAEjrpPeSzex9bV3eWlFFJwF8+UJG0x8fqiVedGXAEnIMp9YJZhR7HQs+tiDcgt9J
         jxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943153; x=1702547953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6K465pI4zAWlwCamlpDG3HILRkV9gPVUA692gl6Sek=;
        b=hKmJRlnfryEwrouHJtA8kSRCOrd+ks4Py0ohcjlTl23N/ELRgtWKPFCy3Pu+SXIh56
         h/2JTsNuHCrFWTM2Nu+qqd0gSpOfSTNgol+kaXgZZEtLp4zfvBwUAk6iomawCffVyQ4Y
         +RfKVzmLIbeiWKrAx04e8UJbsotKX85BggaB8js0bm0/hb25+AESFnPzuan7vh4/xNun
         /awQFvAH6POxVtq97UbTKS4ztnJkFAT4V6wf9uGtadAqgPtiPNsGbo+W2nnJrojDcDnv
         uq2DTtyJoiwg0qs2tIFsXAQsYz4cfButG8tp2FUZQ38jTW9vPdlH8M+SsoHuHQjjvjCE
         HMOg==
X-Gm-Message-State: AOJu0Yx5Rv3PDoLyAtXgOIDYomoZPO7Dk1quDYdRILz25WDU6HG7Pjqo
	jYl0yeMX6ybnp769zkG3/lO7lN/HqTBQk8qROolktg==
X-Google-Smtp-Source: AGHT+IHcD5fIoEp/CcfEh8HnMUMO2l3b3jKL0vWFNg+litPEiRW5cySzVq5LBwYkPm8QSog0pjXe77K4eJFUFT+j6Y4=
X-Received: by 2002:a25:b8b:0:b0:db7:dacf:ed91 with SMTP id
 133-20020a250b8b000000b00db7dacfed91mr830253ybl.114.1701943153500; Thu, 07
 Dec 2023 01:59:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com> <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:59:24 +0100
Message-ID: <CACRpkdaqZ4+oefozT863YbsY7e1kVJvSMBuiFmwhKSeXtPsE2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 10:56=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Mon, Dec 4, 2023 at 9:35=E2=80=AFPM Ben Wolsieffer

> <ben.wolsieffer@hefring.com> wrote:
>
> > The STM32 doesn't support GPIO level interrupts in hardware, so the
> > driver tries to emulate them using edge interrupts, by retriggering the
> > interrupt if necessary based on the pin state after the handler
> > finishes.
> >
> > Currently, this functionality does not work because the irqchip uses
> > handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
> > callbacks after handling the interrupt. This patch fixes this by using
> > handle_level_irq() for level interrupts, which causes irq_unmask() to b=
e
> > called to retrigger the interrupt.
> >
> > Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Marc Z can apply all the patches to the irq tree once he's happy
> with the solution.

I see Marc stopped doing irq_chips, so tglx then!

Yours,
Linus Walleij

