Return-Path: <linux-gpio+bounces-586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B87FBDAE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99231C20D4D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1DB5C91B;
	Tue, 28 Nov 2023 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ax9MSrK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28641B9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 07:06:06 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da37522a363so5231650276.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701183966; x=1701788766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNbBrvCLKy2IUxXzcxy/eNfeZ8Ee6bkTl+4EYxHiBPg=;
        b=ax9MSrK9c8D3Gs3u2D2tPc7kgq2HKa1MSUYM1dIs0qL5eEaU2L3RaKB7g+FshL4EsM
         Okce6hiKkH8z/B2hnENOSlQgtk+5XkXO85ocSbkphEacQRb8ip/jAOoQLq3TR13eGtFl
         W/Pe6VGyTsmGYE+DyczJMog0e1BLBcY5eLOMtwcUjCWElwCCeutSY7xrZtp0+4vlUGSS
         Fhw7S/9OsBsUOU6O0fbgXCZ6BY9G4XNwbu7wGKtBXdTZ//avYWyz1dL3ECbsNgIoYV1p
         BFN8ZEj5SFjwnNEo5H4FaqF/BInUeGSKrblWZm7OWikwN0LsrLM0pHZpyW+D+BOBxWWO
         WEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183966; x=1701788766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNbBrvCLKy2IUxXzcxy/eNfeZ8Ee6bkTl+4EYxHiBPg=;
        b=VcRT9bY/ZbB4XqVH/beLql3K0sDNvtzsnbkepTHR1AJIu/HxnQsNtkTEF1XyafQT6p
         EU+FY7Mq7B7nS+GA0dqFwHy5aeD3BltQDwKU7l0EemeSToJgaxDAYUQMhxVMEY3mQN2Y
         cIDO2uBba5OCfKS9NVZzPDcpuu66Svs9/yKnP65Z2RL2/nGLRLroxa5XHtyluept5q1z
         nvcelM3uzq5wP79PaV7K+BFUSBITsPEopMDUSeSsKLiu81jqVOaqUBNuVz9EAaKWvlJv
         ixobjEv5t464xT8YBFf1pXj4Tu2wg/uNOAGPnqDvzCVVn+tcmXSe5ub93wKQ+F6zYF43
         ZhOw==
X-Gm-Message-State: AOJu0YyhMDuypcfmeBEjAkkwRoivGP4bPGlsEfh6qXbkWxn5Y4Y4qy+d
	pi6ZuyAeDMaEZf00gDlKSkyuWs0Nb7+8jSZrCylpow==
X-Google-Smtp-Source: AGHT+IFZT4O2LrhNLGFJpzCHtpipXj8NKAcJA1v6/JsDAJjncGLcFq3ZGlfCKBQKFJHnSFWAB6RlUTuIMphvsoDsPlU=
X-Received: by 2002:a25:3795:0:b0:db3:a317:3e9d with SMTP id
 e143-20020a253795000000b00db3a3173e9dmr15023586yba.61.1701183966065; Tue, 28
 Nov 2023 07:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl> <20231127193716.63143-2-brgl@bgdev.pl>
 <CACRpkdYG5FbOLDLM+WGEbX-42mjkALU-HfAgdLLhHSq+K1gnaw@mail.gmail.com> <CAMRc=MdSO_Zp2wqyZQvqadDoUdZVi09vE2fo3oZF3161W-+Qhw@mail.gmail.com>
In-Reply-To: <CAMRc=MdSO_Zp2wqyZQvqadDoUdZVi09vE2fo3oZF3161W-+Qhw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 16:05:54 +0100
Message-ID: <CACRpkdb49rYZoXG5oDLvoDZ90BgpubpC7jRp=7L5qsk=ipPqyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: use a mutex to protect the list of GPIO devices
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 3:52=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> We don't need to lock the GPIO device or chip separately - the
> descriptor structs will stay alive as long as there's a live reference
> to the GPIO device. GPIO device will have an SRCU cookie for
> protecting API calls against removal of the chip.
>
> To summarize: one mutex for the GPIO device list, one lock per GPIO
> descriptor and SRCU protection of the GPIO device's chip.
>
> Does it make sense?

Absolutely, standing by to review, it's gonna look awesome!

Linus

