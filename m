Return-Path: <linux-gpio+bounces-20661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74BAC69DE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 14:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F29203B430B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B1C286411;
	Wed, 28 May 2025 12:56:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39421322F;
	Wed, 28 May 2025 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436964; cv=none; b=cQl/kupMyDYxygt4tezguJF6IgNAMQ3HQ91FlCfxckK4X0N2/GzsoI10VxY5q74BJDUV2lxRZcovm5uJY3BahVo6tLMosM3kRkFvu7QgMDmiT4CpcrHRmT7L5qCPQoph59DGqK8Js7wn3bsu9XedvLTsN86K4WUFb9BzpZ0nSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436964; c=relaxed/simple;
	bh=+PhLsl6QIi9rIQ0T45j63xL9sX0VWjfxjI9Tcf3ANwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZzRc1BJFSWy+1J/9kFUHO6qz2+H1CRuLRf7XjNfBsErEoO8V4m+7nPDs48zli8ryNuqsjWgtecwmx/m62KFkRNmi7cSsr/UEJB9HTm6MzX4oPUMt9WZhPCQR/ncwRtw4VHKYl6EPDNtTuc1pZsFErSyIwGsmHKnKc5HeCc4Qnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47692b9d059so57543271cf.3;
        Wed, 28 May 2025 05:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436961; x=1749041761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=;
        b=ab6dLn8w6c4GmA3zf/78J4M737G4B/QUoVh9dn1gtnoDGdng+UCBuPnexT8ilI3bJL
         VItbrTw91zv7kiUDekbCyKKQhjEdVw+aLS9ua/DsQ4qxeCXUpyvu7OhuobfdQSKJbDnE
         f9FMEKTxQpdQThKdQm3bpLFTDseaJ7xxZ0rXCV+rvSv64T+iBxHPiuULjO7hncf+KV4T
         sV2WcKA8vhBh/vF92z4S1lQsojxuPbXJCJWdDGEIugAhDno8mQjBHsUtljHQ+XCFb4fa
         jOY8dieBroDaLwqyglDV1y+TvOdVcn5j7dBNQ1AwaHyrt5OdreEav0NIyF7n4qG9NOOc
         dbPA==
X-Forwarded-Encrypted: i=1; AJvYcCUbchEUMvu1435+udPmlc1t7q/NBDQQNqpfLTFQfhYiFBCyvQ6uyKedhgR2cF1NcOZ/i6lxy82U+DTSlX88@vger.kernel.org, AJvYcCUuLHabSiSItSMIdkae9o7ZsMA94meVebHZCXBlRFtoTMQ+EHjjnUsRL+VenVQCZ7kOgw7OoiHo9QU7@vger.kernel.org, AJvYcCVnhUeyf/mb1POKCG/LLnkPEnxl0uA7WxI1reOVtY51+fyPbArS7mlHFXccYkVadZLrd5HA4VZlEy3f@vger.kernel.org, AJvYcCXBp/pNOYFE9Uc1cA/oyijJKjibLKRGDndapGCTqiltba41mfQEXh8SFtdsaxBsIoYce+g59DDLmFdAFgiWtlPq2kQ=@vger.kernel.org, AJvYcCXZLrxo+IhWXKeFae//nGo5g6J7hJZ37Wc93KrVXfli0fh/gsPf5Tl2NteHS8QrjTp7Hx0if5wA6UV/abo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6LVpOayFVC7AcXs2/N1ypEOTaURZe6OxHuCk8j9GyTXH8yZd
	1wRQlSypjMh8eos+VmGe9oH2PQFEWsPvf4OmY/APabAl8vMRghWj22nmxISMdruc
X-Gm-Gg: ASbGncvY2bNUqn3kp0nkfZfxv3NF5NkdKn7g73TJo3LA4I/JRFjz2xbJqCHrPpcxABr
	RzI68JXTnOYVd4R26in8SozRFcupVtsMcBycGsCCwddeDOSuGJMrP+eguaTdlfUZjK/CZJI3EBt
	QoHWj6mV6hkD1hUlxumGV75PrDeZNgwEEIEEG/oQoBQ+ODnJW575Zr20S40gMH1HogoNvwyCfCe
	PDh772oKkL+72jGu50pnClyLlo8NOZEQCLssqG3xbhly6kN5qDO0HzS8NzdaGAfH8Y+N7FCqUak
	66Z85CS4giZ6wSU5EXqwC8sY0rzpGOf3zgeXIAtG1ZpZHFvL6TyidqPjF4LJnjF9Wm/ecW5Ap9G
	n0EoO+16U7tgYRdZBsA==
X-Google-Smtp-Source: AGHT+IHfeApnVHkjrZgUpPXzGnPyaya3Y+pEdPNILryJcS1vH+5VauihlFQrd6UcHdUAWv1LoKoerA==
X-Received: by 2002:a05:622a:4a0b:b0:494:a447:5bbb with SMTP id d75a77b69052e-49f46657f26mr288348621cf.16.1748436961470;
        Wed, 28 May 2025 05:56:01 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80d7838sm5582141cf.64.2025.05.28.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:56:01 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c59e7039eeso601643285a.2;
        Wed, 28 May 2025 05:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMDpqNpfAz8+p88Omw201cvmzEYpO1XjThN/vuPN+7W3K/FOWkfsEvhdSkbZWHi4Fjc2L0I+C1PMby@vger.kernel.org, AJvYcCVqqdjRthiBroK1nefAWRIcvbAG3VaN2FQr9KS/OyY9aKm7AaeAOgir4KMAceJfXEUtptFH+5NkKcAk5PE4@vger.kernel.org, AJvYcCX/xa/dM6zXui3njLrJd33Kiy+uXqcj/Z6z15qDDQMHte5yXt15jm7TIPboZ+2OUzxWrm1OhXCHgw5xOky5jT98o6k=@vger.kernel.org, AJvYcCX8IJhVj/32he8yUgKYpzaONeOX/FhphBPw8ftrDMbjFnGlufp3oMapwogFG47huEM/nuEGgj6ZSrQF@vger.kernel.org, AJvYcCXQ55Xh6nybQB6YHiDYOLIbflIMzgH+XR6c2SjuYDElzBLjKUQoI/sHM+1FihDPeQi0aBAYSjMDmzipwj0=@vger.kernel.org
X-Received: by 2002:a05:6102:3e94:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-4e4240b1619mr13395283137.10.1748436481362; Wed, 28 May 2025
 05:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:47:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
X-Gm-Features: AX0GCFtImpXXWdP8CtUa2VgvQDuwNbZqXjPeWpaGOsf8DlxmYUgiiqknnvQgxJg
Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Pin controller core code only stores the pointer to
> 'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
> be changed to pointer to const which makes the code safer, explicit and
> later allows constifying 'pinctrl_desc' allocations in individual
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

