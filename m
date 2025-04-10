Return-Path: <linux-gpio+bounces-18644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0EA83ED3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F5D16F0E2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CFB25E45B;
	Thu, 10 Apr 2025 09:32:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE825A323;
	Thu, 10 Apr 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277525; cv=none; b=o8bEGUcb08TZsauY77RIFsZhQqmaNvRW5OjVBCBw7qndORRLqGIjaxiuDmui1k2lqUD/piGeRakyMppqME7oQE4eal1qN6ZBdxFnkgRIDgGoNuUrxHg5wfxcITrlgts2XAZDq8vJpRTU4nkltk9uEp/8/R5bzBmQFxQtF9EGBJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277525; c=relaxed/simple;
	bh=66it4yH7tDoSfnRmzcG6n3HPRYYxJKXim1LUwnZ/Mko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p22xa/Hl2nPIZiMK2YVBMlNlI+qNYt7Sf+ACgjnDrAtLDxakjyqZOQTPmB4JivkPomOxvR7A8E01Kb7KKKfzGwk9a/H+Ry5cAcdkfdKSbaG/LL76LoXneDaTSGLFJqjtiY8p+xeIMVx+Y7Wj5i4rOVh2Gt4LYSF8ZZc0PlEQsuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52410fb2afeso604290e0c.3;
        Thu, 10 Apr 2025 02:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277520; x=1744882320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kS7EOvqoYOcajjLsmybsnh3ImYRiKMLnTX10TiwzTFM=;
        b=UYLuve1tP4kVxtzuU2sjFUP0O4YtUgItgdSCPgg+1sKQIWkLmla51Ar0mtIAyxZfDu
         wXRKPomGpWm+II6Xt36CKGRSu4aYG19ONkexHLvgvqqiLg8FHzASIFBB2xt1drCKvnf8
         Y4OLA4ijWpt3Nwn0qbuPK+wzDI/rfAj9ry0lLohbPb/jtn0KKecAUtedWvjqjyTJ3lzh
         pDsjVCP/JphOK5AaN9T37rWrxYsXXzRKm12nH+Ig1R26zOJ87UVMdvY8azergkMEhqJu
         Q9bFN9o3v04tjxLo/4WwZf49RXlalwwgjfgAPnofy7jZnS+M4Cj998dJ0VDHbdQ1bHEC
         e2rA==
X-Forwarded-Encrypted: i=1; AJvYcCUJNVQquDJJtMIzwYWxNjpd7dEaq+ljwvpMNB2isUHwf1MYNGfWDUDRmHv3cNV/tQEeU38zpgCaeZepLpPJ@vger.kernel.org, AJvYcCUPUPo0fxFlnEAUxgUZTP8L8UOepNyzRQra8MKSh45hhUxOs/+6i0LD2gJKOf/MquVvi1UmzNJMeM3Q@vger.kernel.org, AJvYcCUacpleOkwpfsiXGXGLi9rlsOPTMPTqkpGr2XKYuKMMA2+bH+WiFj7u9eaRWkZTHYPXVt2sTftXiKNdCuMx0IRz4I8=@vger.kernel.org, AJvYcCUs80SyS9+T4mjHRKwVZl8zzqscxgh1IAe9AVvItd8CAOuCDqUAlIm5bNgKe/nCY8GErXn4xowW8BLlsQ==@vger.kernel.org, AJvYcCW7Ws0WvjAw5Hkh+GB4T8HfYh9ebwYOPKxfjG8f2UqzIZ7F0YvkW4FbZZeg85dbl5gPVmbNeu6nfMA4@vger.kernel.org, AJvYcCWM87eRk0F5QDv6yh71EUgH4FUmMR6XA/O7E/6HzddQjFmz+MLEXqzwgwgSFvcKzU6aV0JOtriBLLYkA+BJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzPC+R7IEsamzl2w+sYrKY9wcn1O83OxkcjASP0adTmGlx2UhId
	TTpLlw4E5O7oiJjbDHuI4aJKZFuYy+f+kb250YTa5ZQ8bUlOHq4LzqJCJsWI
X-Gm-Gg: ASbGncsFdKaBXKFkyMelpKMLRGlgy5XjO0pijVHAwq83UbahdDl30u7fZbUL/BWbHNw
	48d/4f+vS0PH+rFBVfLYn4wzk3r3WVC3H5Mj0MMiio2zXt71EsRXHNy6e1/CUsh60t5fkvEC9uk
	/1bWe1RvQfNubF7ncNASUVVkvVgarn2FlpISeSHdmkCjQjOqF+bvYnJPNoVB2gDyQgRUesNF964
	PuEbxNtUhhFrUlhGL0sqT06JqEVg5Lk5TOstIAN27vXW5ozsz7o56KK8nc6crZVYRH0ITz4sodV
	3LDQ7jYoSWL0ZorX907SzQpGMEBy0oqqb4W9NYj6o8226HGJ8E370VCmGNWWkp7lwHkf+b1TxdO
	2lbNDgySqphe6cQ==
X-Google-Smtp-Source: AGHT+IFh/ByO92CAT0S5umrbl0FafyQulh/UXibGZF9zlvY+uOnYgrOy+RYr5L77zDcY7CntRt/+4Q==
X-Received: by 2002:a05:6122:2002:b0:523:91e8:324c with SMTP id 71dfb90a1353d-527b77ad3eamr667106e0c.8.1744277520629;
        Thu, 10 Apr 2025 02:32:00 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd76289sm607282e0c.18.2025.04.10.02.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:32:00 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so566519241.1;
        Thu, 10 Apr 2025 02:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0XO/XyBHh55N5JAOgQ2smThKqL1c4pXXyPA9yOmleEtuTg8t8aSX/JO4SIOaNZ5/2UYVn3QUl1fwOid7PSOoBBKs=@vger.kernel.org, AJvYcCUGtSvbMzoHK/b0CcVhXKYvHGCOJPJoWy+M0QYKu9RBllXYEjxyPahQjM42ahIEc4AkP/0GibawQstCA4P+@vger.kernel.org, AJvYcCUcc5fuvrYCHmMc0FuUvg27ynH2wgSqPxFE5voShJ3ByGOYvDYqP25QmY/FrvWPquZnmepZrJe4DYaVMGRn@vger.kernel.org, AJvYcCUynedxK/xUPTgS1uXA80Zf1f+R7Snt9jZ9/h1q+YgCYpHe7lZXW7NgV+4kwnozxn2GWW4Kg4PqAu0i@vger.kernel.org, AJvYcCVgXUuGdnJxU1rDQ7PAAr6csQogk/WpkiuSfrGFY0VF0LnIX8AFbotDhMcKfJL13JszaTuirLWYbPKs@vger.kernel.org, AJvYcCWq9E9Bo6jYgIAlBIcXP8sDsps2xH/VnsrnNIq4z0d5uQbWcK3QckKx4IjTp0x6qiIt6HmBo6Yi+xCCXA==@vger.kernel.org
X-Received: by 2002:a05:6102:158c:b0:4c1:b3a5:9fa with SMTP id
 ada2fe7eead31-4c9d6359c1fmr517018137.16.1744277519860; Thu, 10 Apr 2025
 02:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:31:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHLcXKk0LTaKJi2h-of3sodBMRd9rDyAgERqjjuKWiWg@mail.gmail.com>
X-Gm-Features: ATxdqUFmAIbDkaSh-MN1wygg8gK0xbO4usjQZameXLFYKwox8bXJjI978CoYbpA
Message-ID: <CAMuHMdVHLcXKk0LTaKJi2h-of3sodBMRd9rDyAgERqjjuKWiWg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] dt-bindings: serial: renesas: Document RZ/V2N SCIF
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
> The SCIF interface in Renesas RZ/V2N is identical to the one available
> in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
> allowing reuse of the existing driver without modifications.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

