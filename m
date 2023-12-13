Return-Path: <linux-gpio+bounces-1349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F04DF810D94
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 824AAB20C46
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 09:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F32E20325;
	Wed, 13 Dec 2023 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWqUwPoD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506A9A4;
	Wed, 13 Dec 2023 01:44:33 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-dafe04717baso6385873276.1;
        Wed, 13 Dec 2023 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702460672; x=1703065472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ASYoeG+9AFvYeeDJHcee3eBqiXqRIFwrkc299zj/Pws=;
        b=XWqUwPoDtjvM1vjDd9e9vrPsG6+yiPLPf/szFuPKe1Y/7kv1wPxPU305jiUYLv/qei
         kc9AOWpbgeUuz22KnS1yPLAVvTqfU7fneQKlGHu7i61M+d28fEy2Ym5MMTPmVSq6nO1h
         qYFwry3drA7WXYCscIlAMub65MYUUzoCHSCqZkLzPlsF4nceo5q7fEWjPjvqAf5UoeRl
         snhg8WdL7h20tecfeBY5OE/jfO2locHGX7r+xDuEBCMg66Ndz3f2OieBi6I6pazIRp7M
         DXRsDtJxFs0MlNXH6ReAiE61PWXFWxHJXaPFZK58t+G88KaU+lBx+0exov4AsZ310FL7
         9S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702460672; x=1703065472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASYoeG+9AFvYeeDJHcee3eBqiXqRIFwrkc299zj/Pws=;
        b=SiVWMxDTyLtxX46VsOT4TKCjKfTW8ZFKM8g1l5i8fYMX9oYUB/0k+dXGNDLiKKQubK
         3wwKwleoRdBME5X6vOJUDsvd32Ms47n/ycaaWJu/3xN7r+i8LU1M7rdWAI6yA7Jp0+7x
         QUlLrDuVI6NmTTbis9CIWQnCs32QxbVfVZm/DEmFcD2FSRFN8Gg459u0fVtrCcMey0x4
         DxoSOGxdzH/qRtchqF+GlBsIh3Mlqy2XeNYDzd1DNU2zYT1kFgirFL48zLIHMagez/OJ
         B6gsUHAEtCpSzMwiSiRnTbnRAF3tvXKl1dHcnCUHaqqI02P9c9zeX41OXK5IFU/0a3pe
         ZMhg==
X-Gm-Message-State: AOJu0Ywhdgu9boyA0ixNrYcejcDd8DNmsb6b4pexH9go4es3E/J/H8fA
	HmU7Wm9ibnSVkcmVjaoO63piDblMG9Ym2ZIw3mRKUyoI
X-Google-Smtp-Source: AGHT+IFReZMPdh5wXkNk5emmDJZPdiX21eGS/QS6mi/SzTILCLuAo7qMjKxWOkz2Q1T/74u/1LVTt+yT2DQIlorAmDI=
X-Received: by 2002:a05:6902:1b83:b0:db5:4589:6b61 with SMTP id
 ei3-20020a0569021b8300b00db545896b61mr6408136ybb.18.1702460672466; Wed, 13
 Dec 2023 01:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212100703.3374555-1-tmaimon77@gmail.com> <3cb1647d-c58e-4040-9e3a-61965e6a08ac@linaro.org>
In-Reply-To: <3cb1647d-c58e-4040-9e3a-61965e6a08ac@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 13 Dec 2023 11:44:21 +0200
Message-ID: <CAP6Zq1j2O_Y7oApBp2dJJzEmrtO2fYzc8xKA9Jsr3BTimLfmMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: add NPCM BPC driver support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: arnd@arndb.de, pmenzel@molgen.mpg.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comment

On Wed, 13 Dec 2023 at 08:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 11:07, Tomer Maimon wrote:
> > This patch set adds BIOS Post code (BPC) support for the Nuvoton
> > NPCM Baseboard Management Controller (BMC).
> >
> > Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable
> > I/O addresses written by the host on the bus, the capture data
> > stored in 128-word FIFO.
> >
> > NPCM BPC can support capture double words.
> >
> > The NPCM BPC driver tested on NPCM750 Olympus board.
>
> Where is the changelog?
Sorry i forgot to add the change log, I will do it in version 3
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

