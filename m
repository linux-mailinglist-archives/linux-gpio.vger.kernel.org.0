Return-Path: <linux-gpio+bounces-8394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6793D656
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 17:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44356B23935
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2024 15:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEE017A5AD;
	Fri, 26 Jul 2024 15:41:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFE6AAD;
	Fri, 26 Jul 2024 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008464; cv=none; b=mLBJdQwnssYuFjmmyu4GrL3AgBI3kSsLiwTu3TbW21MYWI0Af3tufy4z1N7Y2Adzxb86lr/N7zk4W0NPxSJuKmd02HRZCpc97XrX9Q3lvY2IkrVWDa5bLkGdrDQRVbFzxWjkpiPyvAcFdYX7+LrzEOIXjYPdi5UmIBtN7rzBFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008464; c=relaxed/simple;
	bh=v0j9NG6AoqcGhZw/p7MGY2KYfvE1N3N8QFxouN0lG/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0HnALhSwsdFypEMcb76SUD0rYjIzkqWJIZYx6OuSVlx73fJMPLlZ6NLPGR/JT6SdcodKplIEpGvGua69ARe+sXXmgOgUu0RFLRP6cf+owbGWscmWsQ4z9lJujkB1ni5zYuZG99MZU9BffAiekX6qTOWS1ar1QAfA+gznrKeKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-66a048806e6so24074127b3.3;
        Fri, 26 Jul 2024 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008460; x=1722613260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35cgOpDj92wSxdN1zlNGXxGzMZAequWmR/LBSQe0uS8=;
        b=dw5anqvn8B2pl2SlfTvmaV7LkUEtaSVhlD65Y9bAMTKrOmeas92DNdT7pUoCjpJ/Uk
         AhZw4V7rUmr8xihHjtC6TEB6UtizN5BMpmuYpTKzKvbQ/L6wZhvxrm2yFC+WwiPKOdFX
         zD1zUo3MsQ9RwaNWwoQjF5OVskXKsDIraKcHzacwBWzts4Z3isnOSliSDW+9NZljR9WO
         H8G3sGyu5R92UPcvcfTnKD032ZBpxNP/Z1l7rLgFeDEpjfyHT8e3N64diQeEQQwnxuhf
         prb6GU/JScvBdd8vJ2Ma1tZyLMxUa5fSm90VyX83wkRT+m+NebN0f9AB0kffvRjAvTEF
         /byw==
X-Forwarded-Encrypted: i=1; AJvYcCX03byNZvVrV7hKGPV4S7hsKJx4rWyJuYzQD3hOrWM5wjH2xSW4vvEMW8wlLu+Cn0Z0rfyNNCZ5XtSGlTT6eaXjqeLPeTzo4NWqnWBzm11ATllzS0iEHMafqH0tY/dwhlnwHkUIQHUuOPxj7n0EdCz0wCaFUgvCtZD8gLlEDuOcwV6DMsrVn3GzPA==
X-Gm-Message-State: AOJu0YzvriDapJm0fwBpZmJeLmVQI35L+nRTXLehMgUnwHI4jfsIWXD/
	PTavqS6klDsrTMyY6xN3deXPp9qJHheJEnSB13+P51XD9qQ0mse4/yxSbxijr+A=
X-Google-Smtp-Source: AGHT+IECd3Z+5mFU70JvAAy9WuXWEWjkHfEJDVgx5SYSpnUiK48KhVXUcD+AC7uRbfjkERHjMoaSsA==
X-Received: by 2002:a0d:ee42:0:b0:643:aef1:fb9d with SMTP id 00721157ae682-67a053e118cmr2242467b3.4.1722008460461;
        Fri, 26 Jul 2024 08:41:00 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756c44ceb7sm9151347b3.140.2024.07.26.08.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:41:00 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-664ccd158b0so19350077b3.1;
        Fri, 26 Jul 2024 08:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxzONEL+dkRvuQEOmPmbfThrSSp4DerWSaoLHHhxJALtqEmOwFjbYG6fwcoHBGazvTY2zzwccoAZYbuBmIrqFu+zuQYbjFnXntpF8E7hcnXAToqPxe9nwpfzcuoQdCurgfZERyKj6FSB16weonpH5r2oal/3chKbtqMRehNsvSD81vHdy5Tf8Stg==
X-Received: by 2002:a05:690c:6d8a:b0:64a:489c:4fbc with SMTP id
 00721157ae682-67a0a8f4c59mr1846047b3.46.1722008459577; Fri, 26 Jul 2024
 08:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-7-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-7-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:40:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPDc06JDG9469d6w=CWYLyEP0sKg4si7kwirKBpNWpDw@mail.gmail.com>
Message-ID: <CAMuHMdUPDc06JDG9469d6w=CWYLyEP0sKg4si7kwirKBpNWpDw@mail.gmail.com>
Subject: Re: [PATCH V2 6/6] dt-bindings: pinctrl: renesas: Document RZ/G2M
 v3.0 (r8a774a3) PFC support
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:06=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Document PFC support for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
>
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12.

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

