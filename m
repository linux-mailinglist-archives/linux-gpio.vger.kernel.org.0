Return-Path: <linux-gpio+bounces-255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDD7F0E6C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 10:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18E45B211FF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 09:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FB9107B0;
	Mon, 20 Nov 2023 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hUo+Pljd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1095AD58
	for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 01:05:15 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3202475f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2023 01:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700471113; x=1701075913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkLluJIfs9A2WfK4ws6uTuiWflu7QIwTGk5lEdGrZ8Q=;
        b=hUo+Pljdj6x5DCjR/jo7P1BtRCgtwcj5R+aXWuUgcTe5aDpa5k2//Bgtbu3Ls9SCsB
         fJ2CtzrsxrCXB80LUyj8UGgvAgyKbVbVjJOYubMepvOEjjpW6ANw1i+GQnzRRNztUK5x
         5EG+fr9meG3V1P5Py6rBU8Kp08piIKFYOpJN8aCN2HgPWjtSYVYfOOlwCyokisJYwdUC
         gOWjAHZen9uqfhrBOxF+m6RcQPhCgMA0hbgQ8tfcUd1pPlf0sZGggvNWKWvH5KMDiBoC
         /cRHWUF2epMv2Ml/Kbw7xmZ6HSavMtv+5mlRsddVFUVk1Il5fRcBN5T85wXqYcW2QE8x
         m5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700471113; x=1701075913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkLluJIfs9A2WfK4ws6uTuiWflu7QIwTGk5lEdGrZ8Q=;
        b=P/gBFNCs4ckS+1tqJtB/GmTByMXYLHoCWEzFM3lKTeE50Uv651FaJK0y2uKZnFPPil
         oW5JkbZcR/jzYkRdfjKLUYjBIhs0kdVg9n7Pg3pyd1ktPCdRLeZyupWjOqeBBfOKcOt/
         NIat4b9xHJSoRVkK0SQ8sAYO9LW4g7oWtaow0+qmYkaogGaxRDx3vbb3K1HqV8BZKbA8
         LWMYczoe0rV5VMYLzIvuRpxMPdHPQ6uqnfHLIIFSZmgXhXerDlrr3WlM+lPteJn/xd+A
         lLwd6epqSez/BvPnrlqxq+AZbUlC51G010LilBqf6ZSvB536YLlH4o+prsJ6A+7mgtey
         wQvQ==
X-Gm-Message-State: AOJu0Yy44iuhthfJFq2yyfXE8o/IAOc91J77Y7lXI3ZxBnOo4qj79l+t
	D+JNjmGudg7olVr9DCZk37ry3g==
X-Google-Smtp-Source: AGHT+IFq74/v4yVRRxE+pvLLMGOf1Rfctzf+CaYkqnL15lGut/2IP8miObeas0tpSho4tWROmvLB0w==
X-Received: by 2002:a05:6000:2c1:b0:32f:c369:6b00 with SMTP id o1-20020a05600002c100b0032fc3696b00mr5665046wry.14.1700471112833;
        Mon, 20 Nov 2023 01:05:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4c92000000b00331424a1266sm10473085wrs.84.2023.11.20.01.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 01:05:12 -0800 (PST)
Message-ID: <ea3567ef-1293-4679-bd25-730c1b3e60b9@tuxon.dev>
Date: Mon, 20 Nov 2023 11:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm: multi_v7_defconfig: Enable CONFIG_RAVB
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Davis <afd@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-15-claudiu.beznea.uj@bp.renesas.com>
 <bd25377b-b191-4d81-b144-2936cb5139d9@app.fastmail.com>
 <CAMuHMdUkVO7cXpsHd_oGvEpZdJpP6GP+VC8H5GAZ94KJf2joLA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUkVO7cXpsHd_oGvEpZdJpP6GP+VC8H5GAZ94KJf2joLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20.11.2023 10:58, Geert Uytterhoeven wrote:
> On Mon, Nov 20, 2023 at 9:44 AM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Nov 20, 2023, at 08:00, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> ravb driver is used by RZ/G1H. Enable it in multi_v7_defconfig.
> 
> Used by:
>   - iWave-RZ/G1M/G1N Qseven carrier board,
>   - iWave-RZ/G1H Qseven board,
>   - iWave-RZG1E SODIMM carrier board,
>   - iWave-RZ/G1C single board computer.
> 
> So I'd write "used by various iWave RZ/G1 development boards".

OK, I'll update it in v2.

I noticed it is needed while checking various bits on a RZ/G1H based board
so I considered that if there is at least one user for it it is enough to
have it enabled.

Thank you,
Claudiu Beznea

> 
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> We have a mix of =y and =m for ethernet drivers, and usually
>> only have drivers built-in when they are frequently tested
>> with NFS root booting.
>>
>> Do you need this as well, or could it be =m instead?
> 
> As the default chosen/bootargs for the iWave-RZ/G1M/G1N Qseven carrier
> board contains root=/dev/nfs, builtin is appropriate.
> The iWave-RZ/G1H Qseven board defaults to root=/dev/mmcblk0p1.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

