Return-Path: <linux-gpio+bounces-13672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1D9E97EE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9086280351
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D41ACEC5;
	Mon,  9 Dec 2024 13:56:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E61A2395;
	Mon,  9 Dec 2024 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752566; cv=none; b=GjYEyJhmdOBt5c7VxFHpkLg3IMiacPX32pf0bWUbV/WglBCuRQVFtIg/lrk1aq4wm81/oDsYKnwkAL3Ew72qMycocDqfqIPzh9448UXKV1xxs+M6jzJh/6UUUEG5lDG4Fa2BSGgLcTMNFCOTFF2Dfthn/09idvxCWNlkYRglrmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752566; c=relaxed/simple;
	bh=/rmlT2wpNFq1G+aKc2WZ8CWg0BcZjh+LRF/81aeW4jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhVNSgGncPHAlPtEgq/lxEt4wKXRStGgzvotuvlkYtWAhi+e1KVrqvg8xILonX4wotedr4KUUXM8Fu+E3AK5tkK1+q0I+OwtXceRudvmQbowshtRPaSDfWVA6RAsdnFJ4aqXz+5EO0ktYczUrnQcuFcNPS5JSILVd2Y4+qIWEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-518799f2828so367426e0c.0;
        Mon, 09 Dec 2024 05:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752563; x=1734357363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELHrjSa+vWaOLPFuylekENu9WyWAOwRP56b3zK4wwcw=;
        b=HBKnFGeDt27fdYYtCj8GXPQbZm5aUAXlb+7z8C0iXH5BmdFgQ8JmfXAdJVAXd9HJzH
         U0TbVAogOtsFC6vkPHFoA6oiiBGPv1LHO/SybsL9xG/RF3JC8Zu9nOJdILZP4RZQYOyY
         dgdIxUQMIaoX9mRfjrfCY3q43/7cn8cyyejbcROqaEFDeG39J7wQ0nxuOIUGOKXGvmSA
         S+WqqkRIcZAy6n/4LpyQ6KCG5wt+oNttOxznXDddf//9EciNJTnpb03Uc1qI+ekN/Ih9
         3MNV0t/EnqE5UD9cLjlF0CSniFyOwwa5hG9V+XGxxBsV95gS0e00iBk1h/XvKbYn+lue
         TKaA==
X-Forwarded-Encrypted: i=1; AJvYcCUF+YPtvPqj11VN7t8RnBF5NZWfgGXOaDRgzJfHhsXZr6mum732oK4E2Z7xz3nIshZVm/+eqD9SUcbe4WKd@vger.kernel.org, AJvYcCUPN/M6Ekx1tYCUo5BpQ056dRhaurhR/u9uBQBNy0ru8WiX2TgnAArGg3hN2AoNcGt/r1l8qM2rY7Ur@vger.kernel.org, AJvYcCUrdHnh4Q2cQgS6ZGlhHcn/b2Vcb0tjaAKIrjBrGv2rvcNTXrchFrpL9XdPEwv25iKa43aaXNBwozHn@vger.kernel.org, AJvYcCVDgcXDk0h0f+zR1UnEkrpqo9KgCADnvFv8IeYuH+mBRZvTsM2aXNxS8puiv4xntq371EYH6msGOxb3/w==@vger.kernel.org, AJvYcCVOREIQIM/eUgAHk04QTa6eDjjUvIqZRuCXRfvwy4+EXXOTrChCVdM+mfTC4OjI8rBxs0XNBEBXHtJcNFo=@vger.kernel.org, AJvYcCWyTz5kteir8AvRbpz0Q+EDOsGvGNMpR4bU0Kp0y+5mm2uHjxMf6MfbnxbKdkdAXE1wHZP9fveJ8ptaad8G30trV/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYB4/LPcmdFDLM3902LHaHQjcJUuSlfWqqlAJemoV5MjsmBFs/
	tTBiWg3bA6yVcEdavS//INadK2PZuQ6SLufICZ4JpgicVqgH2nO0G1h5eprdZhQ=
X-Gm-Gg: ASbGncskpsXFLiKpxWQ/VSIPuRUrT5kuS7vXJj2n/R1KcChojPrZJfjO9RovV0M+J9L
	MRJLSCLTM/fT/EjKKn26EmkcLFtNiCliLjH5XrwhN2ICSl2Fm2fV89SUUGf+MwCVkxkByZYG6hj
	pizOemH1PX1dao+rQZlPyow7R+Xzh0Pep3vm4Cc6G6u3rLVgLKtfb5feKmBD8DjRc/0fyJ1U2WA
	k3/3+j+hTSNPs1qly2ZQ5SCtxKTM4JZTpSYXLeSNSJUnL7M3oANLM+hk5b6qGYxnvlMV/ILTsaB
	F1TC8nfbAK7NB4OY
X-Google-Smtp-Source: AGHT+IFDnv5MQPf+CK+SixdS1flBs21q1KJq8+0alW/UyBQQk5oROpk5d9mNQhfsSsnygCeneWRSuw==
X-Received: by 2002:a1f:c585:0:b0:516:1ab3:700e with SMTP id 71dfb90a1353d-5161ab37746mr3653174e0c.3.1733752563608;
        Mon, 09 Dec 2024 05:56:03 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51889c60714sm11389e0c.4.2024.12.09.05.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:56:00 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51544e9a0abso2822244e0c.1;
        Mon, 09 Dec 2024 05:56:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu4orzAHb+P/OiYL/W90bmZWlhF7p0ejtuePQXMCtutT/ysFE84VUyqCgNa+mg8oCFXkb9b+8VOpvuPzE=@vger.kernel.org, AJvYcCV+25LY3tVqG52M94t616nEa0hBlkyiu42DB3LFfnsJMJ+z8ZN0NX+pfAE/4qcOAX8MPt9hJNNe677ZQA==@vger.kernel.org, AJvYcCVJSrHhyFMRA59cGI5+/CPqrBLbTq8ecHMgIzd10bKYHcul2aj/VNnDvZ6NdJp7fQcyRZaesSQiWIYk@vger.kernel.org, AJvYcCW7XEMgpql7BIV2eBHJ/yUACO4AOrLNHYlslSadKfqXvbeQCbMHTEBhzww4GW9S4ve5jwCn3jft1HAj@vger.kernel.org, AJvYcCWDDFZAXCP0VR5eMDT+/XwmqHU4LomoYHvw2K7tLQWpMS1c7s+oYDhs6iikA/bvXSHMlxGN+NIzP1au39IR@vger.kernel.org, AJvYcCWR67EcsL1Si9h7fLpOWA9xFu9ySE0pixl5PWEhtWRtni4S+OUBYSmCo04vzNwGwhEz7VUqHE6ZAaZWK7rAA7DP8z0=@vger.kernel.org
X-Received: by 2002:a05:6122:1e16:b0:515:d230:f2c6 with SMTP id
 71dfb90a1353d-515e7019c2bmr15883433e0c.7.1733752559836; Mon, 09 Dec 2024
 05:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-16-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-16-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:55:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnS=XuP8n6-kMHBw_=mpBHPye2_t=4oZs8YEouYq-Atw@mail.gmail.com>
Message-ID: <CAMuHMdWnS=XuP8n6-kMHBw_=mpBHPye2_t=4oZs8YEouYq-Atw@mail.gmail.com>
Subject: Re: [PATCH v3 15/25] ASoC: renesas: rz-ssi: Rely on the ASoC
 subsystem to runtime resume/suspend the SSI
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The ASoC subsystem takes care of runtime resume/suspend the audio
> devices when needed. Just enable the runtime PM on the SSI driver and
> let the subsystem runtime resume/suspend it. While at it use directly
> the devm_pm_runtime_enable().
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

LGTM (assumed the assumption about ASoC Runtime PM is true)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

