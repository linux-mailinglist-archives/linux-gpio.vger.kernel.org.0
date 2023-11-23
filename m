Return-Path: <linux-gpio+bounces-396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568447F5A79
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 09:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 550FF1C20D3E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 08:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4991C291;
	Thu, 23 Nov 2023 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E685D12A;
	Thu, 23 Nov 2023 00:49:50 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5b383b4184fso6669127b3.1;
        Thu, 23 Nov 2023 00:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700729389; x=1701334189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hslGwW8weSF/trUGnCGzI7NRZ/1Gm67BIvImSjeFisc=;
        b=jm2cyCkxNa8RFVosetIJ4sRX7QUjVv5i4xqzGrWGI2S/8Q5M9Md11R0lPqNV6I/wZ6
         mz3Hov3DMKREEE5HwfQBcTHMczBNFMOvWqcx11nOtRLcbsmNeHm9VCBZJj5flUVMhBpl
         Qoamnqso3q+pNhezwpYe5ugP6W5LmKD+8mWOjXhQrxNf20PC5EDfcNj4PQ+OAsQlFeC0
         9HqcfrcccLfYIk97Lt5YEZ2hrZ5CtJZLCmzs1ohkMFN3qgu9fV3wc7Cmdq8MFNjPhTp3
         iXB/Th7ynCt9G5jMe6v/ZMzEm7MYnnLLUMWX5uvK08KkxvavU1zT8U9EjlbDX3DBJL9O
         I5zA==
X-Gm-Message-State: AOJu0YyaO7+bU6qbVY0pYe6GT+W7dZa7KoQ2v3r5cqIaG42cweK2ZfiA
	/IEOQ7ao71zZTWnmdpOqfUgWDmYnltUJnA==
X-Google-Smtp-Source: AGHT+IHEgFOTdj3vD34AFdULlM9N21oBAL/SI4LKddnDZRET1ss97usoaQHk+A+2noBQ/byTnTgLUw==
X-Received: by 2002:a0d:fdc5:0:b0:5cb:7fcc:ffe9 with SMTP id n188-20020a0dfdc5000000b005cb7fccffe9mr4403504ywf.51.1700729389561;
        Thu, 23 Nov 2023 00:49:49 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id u78-20020a818451000000b005af5ef0687bsm265708ywf.13.2023.11.23.00.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 00:49:49 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cc5988f85eso6601557b3.2;
        Thu, 23 Nov 2023 00:49:49 -0800 (PST)
X-Received: by 2002:a0d:dd04:0:b0:5ae:dff7:6159 with SMTP id
 g4-20020a0ddd04000000b005aedff76159mr4958402ywe.18.1700729388887; Thu, 23 Nov
 2023 00:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122224409.2808999-1-robh@kernel.org>
In-Reply-To: <20231122224409.2808999-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Nov 2023 09:49:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsTpjnpmu8axdfxbWRv1DpX5yuJHbCYZ7bwdGESU75fg@mail.gmail.com>
Message-ID: <CAMuHMdUsTpjnpmu8axdfxbWRv1DpX5yuJHbCYZ7bwdGESU75fg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
> Drop unneeded quotes over simple string values to fix a soon to be
> enabled yamllint warning:
>
>   [error] string value is redundantly quoted with any quotes (quoted-stri=
ngs)
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.8.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

