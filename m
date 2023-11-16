Return-Path: <linux-gpio+bounces-202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A67EE1AC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 14:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31BB4280D7A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 13:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B8130CE7;
	Thu, 16 Nov 2023 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lMuIeVOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C6DB4
	for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 05:40:21 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5c59fe8b07bso1999337b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Nov 2023 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700142020; x=1700746820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/uKSI5RnJiTfsj+UggSQtxpVM9WgUoDjL4qkKN0z/k=;
        b=lMuIeVOENno/yHbwB2ET0hU8KcSjdgunquy1WGoAXyZZmliUf1YU07WnVA6Iqmi9Qc
         pG3bCeWgo1AXULmHxV8DaIoKfarL3VtpX0A//34RWtxquqAJPXL3MaCANcotGU2oRllW
         WJKHcl8lG/Ih403USV+vAuOW7D8heHMZ5dSxvSAEoH6/ken+m2KHIcn5k5HzxkDkImud
         eZA4w4Cc3hE7gGk/q964YTrSiiGsDRna5lIB8GywSM1E+HI3hIdrdl995Gg2G4/tQ38w
         Kiaj9bPeNeBdBxtkU3NNM0tTmJs41NN3PXbZkJxvCFyw6kIHaUsoiE26NfjwbjA9LHZC
         oX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700142020; x=1700746820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/uKSI5RnJiTfsj+UggSQtxpVM9WgUoDjL4qkKN0z/k=;
        b=IDp2lg4RfI8GVZCHElGm7NiARMrg5zVvkpyTghd+/rQ3IA/cuG7kYP/GpREaGJcoUH
         kFMnRGN0XE2ib2ejyQKzTw40jIR9husm2epO+lbTtaSIhTcL+e9tWi2tTIamis2bMB0R
         MJtZjmyyOXUpPxeQWz2kZ7a9KlaPZ306gg1eObZCI13B8qJc5jrpTd4lEBkld8JsysDU
         nLEqG3WU/kRUE8Khs74mRqnApwvBOjrZPaxasr1DEURDA25Mx4A4kxGskaxyIWurkIj9
         kWnVUNBlelBM4MyXCMgX8auiigAHzm+YZWCytCALv4Y3X+Kg7AZAaDgqVXsyuEQ/L1uQ
         OJmA==
X-Gm-Message-State: AOJu0YxgCs+SqYvOFDaorsRbVC1GzCDMt40dBevQTgNeTvm2sANv4hav
	unfiU6E8pehglOyRcw5xySMsGXRr6RM28mlvzMk1udnOIhq8P0Es
X-Google-Smtp-Source: AGHT+IF69ypMI1l5MxUjocbWGDOghRm0NdqVbk7drEBs5LWaxxkh7CrlTftBZpDhSLmeps//qCLOZsisKOb4OZ/r4wo=
X-Received: by 2002:a0d:e605:0:b0:5a7:d938:c5e2 with SMTP id
 p5-20020a0de605000000b005a7d938c5e2mr15469608ywe.14.1700142020631; Thu, 16
 Nov 2023 05:40:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115162853.1891940-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20231115162853.1891940-1-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Nov 2023 14:40:08 +0100
Message-ID: <CACRpkdbBrEEh9ghz25184UKoC6KTibtxg3vSx-yKVyAADfot1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: lochnagar: Don't build on MIPS
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 5:28=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> MIPS appears to define a RST symbol at a high level, which clashes
> with some register naming in the driver. Since there is currently
> no case for running this driver on MIPS devices simply cut off the
> build of this driver on MIPS.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311071303.JJMAOjy4-lkp@i=
ntel.com/
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij

