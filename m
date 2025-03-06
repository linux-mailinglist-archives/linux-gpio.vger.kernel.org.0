Return-Path: <linux-gpio+bounces-17151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3CA54E5E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51A7A174B43
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 14:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15007188907;
	Thu,  6 Mar 2025 14:55:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8A1898F8;
	Thu,  6 Mar 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272920; cv=none; b=lvlpfRZzumJ1L4UnHypWH48r9i/YbTkqu/XdEXX6T6T1ugfUNwo1de6xOuIZNMFppLsoHL0WkUNOM6L/AoumkOMGR4L9z4cof9ksw4PTm+4Gob+xeCS9deKpmrw8SJLdMhLrjKPJgOtSPTCfDWR2QxHocTeFSF8UbGBGgCscgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272920; c=relaxed/simple;
	bh=ktOaZdwzTqoUuvqe8TkUwUFYlscKiDHYmG0X0dz08fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swciRJeykVPkIpQjv90Te63NEzt+LFOdmhPtRCAySmlgS8U9SYaJK0+K15Y/0Scth1avWfA8QU82fDwPDgolJEgVFjGk3uQZiPCq/8vJyhX7vTubF22odk7jjJ56ccY/WEDuLRq/jIY1XCpg9/q++HZ2jQ0s9x5CweSjqcZvx+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb18130f9so366605e0c.3;
        Thu, 06 Mar 2025 06:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272916; x=1741877716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sg0jTdNKvNFrjQaXpnAL3SxvIb27sSc342yAhCiEnbI=;
        b=cpzwKv8UuQYfsWFnl4xNcB3/ji3a6osxH0/ItEB21Mb+J2i8yz8H073CTCzd1grX2n
         T6hcoumyNb5AmIrOGUG42GnRTWKbf8owYwgaWXr57Kt0yj9Vgln2Zv89AEe0dbdZ5Mla
         HSQap+MwzDfaSP8/03aT4WgiTsZRvW46pIF1f9Xq6PH5ZiUizD2ALbLTylWcpe6QIqhp
         p6Pkdqaa/8m72adD6EJvILz1gZT2lPgIYfqeme1g8QcGCFr++EJjy2o6eN3dkJez4IQb
         DIRLI/JZatjaFFE0E9usFiIoU9TGIGueu5DA2MX5dPwxWz49DxKvupY7jJLzofac2+WL
         iCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAg22BaJpL2DkwfE+T8ZEYnxW8HNG8a8N7i4kuu6EhH0F14/iP5lgopMKLnauslDuAJN0sKLqsBcgT@vger.kernel.org, AJvYcCW7cPNBrlv3j4D4EhzgRb22oFpshnf9sQaZIPW9H61QDKtjJSFS4Iu3b9VQO0B/5VkwUnhIoYARelnHIgJEazTM8ug=@vger.kernel.org, AJvYcCXQLd8vCohLzMLkKo7oVva6DrxhuZAmXneROOUH9bYZSqJZekAHr+dlBt0031uZjyo0ulCLhDElXbpcZxr1@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhd56a04Tu3DNNu4ZmBiBJFeiMxA2kzaAEM/I9XogB6SRB7F0
	Gy0zPTnPGkWZGxtfmOMRlsWWf36y2rtc/fnQzqnLoUY0JEDP/WM2XiiytwhCFFY=
X-Gm-Gg: ASbGncsWOXvFRCF+c4iLP4i43FguxzgnwbN9zJNjbBWfwbHdVN5AGNZOnU4EiWwlpU4
	QSSKyqmAzdhdl3DIU3FVXQq0XKPFLujGoUUOHzzeXyB06W26RVKyFVqrPelYWuEB4RWg650DnbR
	vrIRqnVgSkoFkoC6Qt3/1KRqTEHN77RTHhaKEX8kCTdXDQCOlU8SmdUINEv5aJ6nME5ovWDzRYw
	9GZhY7s36/rwUwvwZ6Oq5uf0jybViOpABPR1LTajGD1OUFkyrQsZHUWFNVC/wgtnRW8BtpBK0BB
	2MQMwPfFTd7aqPtkcG7kQ8MC8HaZTeTmp8AylsayOFNKh6NMvQyzWULpIgUeifuznJZ5/5rbLlI
	nEvLxV3E=
X-Google-Smtp-Source: AGHT+IFgWwb5o8B6NEx1mPu7hyR3dELdU7aMdGS0V+/HR3SvrFJu/EpRAcTDfDd5vfxSJisdKsEEaw==
X-Received: by 2002:a05:6122:904:b0:520:5185:1c77 with SMTP id 71dfb90a1353d-523c6262259mr4573078e0c.7.1741272916413;
        Thu, 06 Mar 2025 06:55:16 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8cba2a8sm197034e0c.42.2025.03.06.06.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:55:15 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so294939241.2;
        Thu, 06 Mar 2025 06:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKOP+CXwsdduwCOYEV4uENe/DY3JWlbap3p9MAe81qEX5FnJz6vZRKGscItYISx0cwA6EpBa/c1Wd1Owkj@vger.kernel.org, AJvYcCWDQ8Kd6v7nUbNnFDo1oXj3xDCgR/eutWW4yODa2nBiLvq/XMhuUej5nMJoJ2IyuE0iwRtkbzvFBRIN4DvgjBecHdM=@vger.kernel.org, AJvYcCXytc9g9Q2PYmY5d6NNUQ+nfpK4RZaI88Az+DbHTQATwa7RBZbN7I5Zln6PmOos0BpcXePpRLR6T9K7@vger.kernel.org
X-Received: by 2002:a05:6102:3a0c:b0:4c1:924e:1a2a with SMTP id
 ada2fe7eead31-4c2e2980bfcmr4680220137.25.1741272914409; Thu, 06 Mar 2025
 06:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-5-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-5-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:55:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxbKCLUfKP_4Yfh3oqAkwiWSqzfiSJNr2j_3g9-rurPA@mail.gmail.com>
X-Gm-Features: AQ5f1Jrpip8Ig8OdZgGu-aT-6MF7kusY21_rSkf2N7HAetJzP7SfIXsBud-nXGg
Message-ID: <CAMuHMdXxbKCLUfKP_4Yfh3oqAkwiWSqzfiSJNr2j_3g9-rurPA@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: rza2: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Brandt <chris.brandt@renesas.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 17:38, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

