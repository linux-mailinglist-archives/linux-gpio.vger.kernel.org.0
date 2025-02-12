Return-Path: <linux-gpio+bounces-15867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B099A328F4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 15:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DB9F7A39F9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E742520F08C;
	Wed, 12 Feb 2025 14:46:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F861CBEAA;
	Wed, 12 Feb 2025 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371561; cv=none; b=KV3HG2QjL+s9ACqdejolXtDX0xQQWizyRr4JulkCW7XnW/3PQpN3KnRHd4I0F3AST4x+tqXs7EYllrU6r/86ZIVGcJAyhVf+/OcbjVnJZ548E+Sb6AcC6BHIY6cetZ7ADdCJ0xKnDUZfRUXNg0Hv508CwOP9GRiG8RQyjOchb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371561; c=relaxed/simple;
	bh=tiZcpPmsYdL9+5vGzhmxj9bRyY3C5O6wHKX2ZthcN38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM3/fsrVNxrvmDYFX6sXK2jQAkvSDCkg26W4EDN3A7DeMPyKqyOdgf2nZW51kWOeFMJyuLJwxLEsq6lbnCvcdt2AHu/YOkY8/jtRKxyMdFG5DEGax69lHJfu15tKM2/eVIddgP60r1A/Jx2CaCoHUC3wdqGi0EvT/5SQykW3jVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-866f61c01e5so2060790241.2;
        Wed, 12 Feb 2025 06:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739371558; x=1739976358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyWxNRTx4hkC36ShjYW3se4rNdifgReIBZrHPvWyHWk=;
        b=U/8LAWBDVAIEq5q9HPX8CXsA2AErxUW/rFqKhkSVU+SBNkNrWFM1YBs+lc8LKBMTzs
         QjwP4RiMf0p0P21MoyayfDPdnpAH4LCVJG140dEig7wUwkdUPaWuCdOpH3aXhz8s9JO1
         kvOgH5uvUplwbuQzBkpDGgf7IqQy2GTBmLs+rD4C33MhlkuDFLJbtWJjKft0aeMsnzC9
         bJN5yHgRDuVLgw3D/6LEHKKOaO7r8TrJFpzji7SVtMl7Cq3+CaFHB+mPWDw2jbOiscyI
         aL4o7KnXp6eM58bS1I0eomsf+N/0UbxaqrlFYTtgFz6KBjdK50APjuNPXfHsjTUdQzUU
         EYfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+TZXlCfhuLBISp/llbh2nH238ng24DpaE/kCJpRm/yfPqCVNduv1G59NKJJN99mmVX9S2u8Jrt8VGD3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1wEk2m4UOyuMr4isQcKOa1yT1yu7k+YlJvBrUFqn5W2tt5i0J
	I4OLOOFVF64/RduQ/988A96wFiar0LmqXi2JEHT4kW/aU1ugCQzPpM+EJ4970Vg=
X-Gm-Gg: ASbGnctwuwLafoDRDsTmYw38C2PgXWhd1Qarlp3Y9I62xbVjsFYy7B0ZKPZm6ENVsBD
	uj19A9dnWSp9eM9+mvo9G16w/i1uqvfuCSi4K3PUKqMmCbwNY4Jdesw1IA/2hFMvXRBaF2gWN1x
	uCxgxv3otefUtrT6gEX6Qkw4b0w/0aLlbCPVYTFSFvt2gdu82T6q9O6V4LVpQffn3ZqeeJBcTvJ
	uulOPrNAsvnQQsXFghAAnD4q/iSf06xTwqwK0cTp8hTafoLcvxrTp4JcRD9jXOXRGYaKaWKXId8
	KM0Awdmk7vTNl/a0vJqQs1scjXySq5loTxTWuX6ZP2o5rJfa/xug8g==
X-Google-Smtp-Source: AGHT+IGpua3PBkOjgTXFxjvC5tjKNvm7fI3lnhrANGN/nkocQdIg7rk4hqlnvbdGiGBlkpKxU4Esgg==
X-Received: by 2002:a05:6122:169b:b0:520:3536:feac with SMTP id 71dfb90a1353d-52067cdb8f9mr2682293e0c.11.1739371558136;
        Wed, 12 Feb 2025 06:45:58 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f22767030sm1871647e0c.19.2025.02.12.06.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 06:45:57 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4bbb91481deso1036913137.0;
        Wed, 12 Feb 2025 06:45:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg1xkdurdPuGEzmGxz0AvXhqYF9aKFOnEhMJYkTMeZXQdwBGRdKNKADh3oPLrrdLrKZVhf875nLT7bsG8=@vger.kernel.org
X-Received: by 2002:a05:6102:8012:b0:4bb:dba6:99d4 with SMTP id
 ada2fe7eead31-4bbf21b3a0dmr3392659137.7.1739371557786; Wed, 12 Feb 2025
 06:45:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-7-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-7-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 15:45:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbqxYSt5YCRf2t0fSx54GpKo3SpS=LeDtCaJTYAC-V5g@mail.gmail.com>
X-Gm-Features: AWEUYZkj4O2JpvIUD3fQDIqNckfN0wojaL5VDfengXpT4GVPUpddWw8AfYj5p74
Message-ID: <CAMuHMdXbqxYSt5YCRf2t0fSx54GpKo3SpS=LeDtCaJTYAC-V5g@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: aggregator: rename 'name' to 'key' in aggr_parse()
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> Rename the local variable 'name' in aggr_parse() to 'key' because struct
> gpio_aggregator_line now uses the 'name' field for the custom line name
> and the local variable actually represents a 'key'. This change prepares
> for the next but one commit.
>
> No functional change.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

