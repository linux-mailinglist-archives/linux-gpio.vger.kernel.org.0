Return-Path: <linux-gpio+bounces-9052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCB95CC9E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D67BB1F247A3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 12:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48704185B60;
	Fri, 23 Aug 2024 12:43:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2318732C;
	Fri, 23 Aug 2024 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416994; cv=none; b=ZpPI9ecWAaZh9W2ZREsRenISh0O7AdWmXpOxOsPUFEUYMdjsdjULCAmZmDldH5viKHUlddecVWXredB+Idsygn/AYAcm3yJwQLVCVSMnuP0jd7bATIy+gBQe/hawtPStLE2BMtdfO+7MdIR3dIroxpSgE0wQ8F+UImulIzKIimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416994; c=relaxed/simple;
	bh=oIB0zTEDBiEio+WPQorxKHWJHyb6JefdLZ4A8KS5EsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gV2nRYjTCjsc8by9hN/E+g8gmYwbIY/OfLVA3e+9RJK4Bx5u7W3RdEYe6O2iV3ASqAWqj21FKKY4yw6hLCNcHtOvYp4qjjryYKjB4n34weYyqu1Y1L7N2APGJxuVDBi08QEzAxuTbxoejcj6h+Pi5zVdnJYyh5FUn8hQy3oQo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-691c85525ebso17584097b3.0;
        Fri, 23 Aug 2024 05:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724416990; x=1725021790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4w0Gg0Idyux1IcdioSc56BqOa4Mid4Iy+vrF8vuuOY=;
        b=p2HfnfMBBlfeOkOrk7PLNMyRM0nSOUjoVQcVm3FaqmmAsp1KTWtOmngsZhYz9S9cOf
         HMugaTjzUbxAmbi9pxw9aGvLjcG6BKlXZEjY2JQunsVVHKA+KmTEgEgEhRdcGNrltBIP
         p1zXhkCdkW9BYXPtT5DztedIVAEwGusD+kkjrl1zyDFhDafMcxOmIhq7NX9lTznxgtNF
         d9ZJ8mlCLRpUjuwr1pafBCxWISHGXUym7BHlS9QKoSywETyYs/bVZY0yB9o4ViQiwBo2
         UBrZhWcJBwMwh3P1JtkM5JvCNJDUtIuR5mXP5kALXhoPhvArxCGRwtRX9VmMf1BjE9AB
         UELA==
X-Forwarded-Encrypted: i=1; AJvYcCWWkb3KYU2qqB6I7a/ZXSvt/iM62awH/oMbh2yCq4D8+FM3tc8fVB/VUW1aMBVNdsZ59F1F2SXCbpTLqPQ1@vger.kernel.org, AJvYcCX/Tl5CEi7k0uCGZmHge2IBbcUBLIhE3ICW3Y3QkY3SCGxDRRklQsYf0pDxropRZsC3gwgFml1TgdsZr9So8ehi33E=@vger.kernel.org, AJvYcCXXarx2gcOz56R4P8T3bGLQWgQwa6hneaez+zPJbJ4Omx2qhIsRLCCYqCUU1NVo0ALfDiGIFBnG81w4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7R0HR949MWFezzHvcmxnToZ/Ve74XGxEgbK8P3cfyy5AI+Tvz
	DQM466WfWAkRMUZqc+pkpzjrs45J39Xn90HtxPBL/XZ1t0njDpwhE5pxNhMd
X-Google-Smtp-Source: AGHT+IEhTJRIhk4ZJ/1h4JzjXbTGx2gHDlNExey8Ujrf4qz0au9DTpwtaQh5MEUF0J6bhHyPBEPyTA==
X-Received: by 2002:a05:690c:dc6:b0:66b:8443:e843 with SMTP id 00721157ae682-6c62460696fmr26187327b3.7.1724416990622;
        Fri, 23 Aug 2024 05:43:10 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39dc5327dsm5306727b3.127.2024.08.23.05.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:43:10 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-691c85525ebso17583857b3.0;
        Fri, 23 Aug 2024 05:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHT41cU97otOsVSXUgdcuDDwTGF42wGjWz3UZlt0EFkLLeXeVBLgJuFu/oZEVtm33V3z8/SUZexzDE1UKP@vger.kernel.org, AJvYcCW2enpMxUAGqsSvzm1PXNbg7F+v6ZKE2FHSd5GwdfQNM5cNhcEHrS7YtShjJz5WyM/hOT0BNPC++leuMo97zXpq+KA=@vger.kernel.org, AJvYcCXunxC+WPCtlfxKAYsMQ3yTGsf1si58LLTybGXd69LBcwMAFQa/VPx8bJLItC8sBnYCdrn86gvxz81c@vger.kernel.org
X-Received: by 2002:a05:690c:dc6:b0:66b:8443:e843 with SMTP id
 00721157ae682-6c62460696fmr26186987b3.7.1724416990134; Fri, 23 Aug 2024
 05:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822061438.14617-1-shenlichuan@vivo.com>
In-Reply-To: <20240822061438.14617-1-shenlichuan@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 14:42:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=gUV5SmzRh4nxE5Qsd-q9z-HfTDzG1-v6BgzQih0=jQ@mail.gmail.com>
Message-ID: <CAMuHMdW=gUV5SmzRh4nxE5Qsd-q9z-HfTDzG1-v6BgzQih0=jQ@mail.gmail.com>
Subject: Re: [PATCH v1] drivers/pinctrl/renesas: Switch to use kmemdup_array()
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shen,

Thanks for your patch!

"pinctrl: renesas: ..."

On Thu, Aug 22, 2024 at 8:15=E2=80=AFAM Shen Lichuan <shenlichuan@vivo.com>=
 wrote:
> Let the kememdup_array() take care about

kmemdup_array

> multiplication and possible overflows.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.12 with the above fixed.

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

