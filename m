Return-Path: <linux-gpio+bounces-24033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B659B1C690
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C67D3A820D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD9C23B638;
	Wed,  6 Aug 2025 13:02:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CAE1E4AB;
	Wed,  6 Aug 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754485370; cv=none; b=M9yZ6LsxqBl14R6ssii5PXPaVgMlQ7U2t1QApP5L+MjYjywABUuB0L5eSTbz4q5lA3W2fcQdDDRm7ZypB7cWK/gkzbE5dQ3YDLe6WN7UONRyxEFfgGF6PwhRxm1sRTD7QhRVw+sd5F/bkw2FiPo0V/hDgvQ2PszqXFK8eroG/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754485370; c=relaxed/simple;
	bh=gf94OiMkm3S/JLJrkkvV5+xjnSn/omegnQjLVx5FPCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=of4llOJvTet9Qc1vOED6GaxsvStLnJ66uKrfDoqi4NTzSAQj1aQ+CLCGqxxHbPOM/keXNMvy8C18dCx0KH6KZWzZY9MufZciJerzmkyMBqIUCC65bOozpaDFTD/FtTWLL7aKIO1ovwmTw6eL4triDHsKPz3+q1IcuslDUJT/ACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-539425e3719so669476e0c.0;
        Wed, 06 Aug 2025 06:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754485368; x=1755090168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42mfrRH+zgUmkjXnbnSk1JPPaXIKn/Wu7/y2XQ/8EoM=;
        b=NviiABYVDRU1Td8keiXCcs+AK4oj8q3V4uTobP0qL3i15uhJT1lsnsu+mONhKMJT4g
         pZZWwyREa2XFJXV0kkBG/1Qf0XAHfMeAwOhmdRaN9R1eHTaUJzZ3VOxPmImEnNKFXXsN
         /3E4JRdG/pIBHEVD+VimCsbG/3meS/43/JBSnbHutyYhYd+bGmL0UanuaqhrE0r6MHln
         fdWYm7HvIZI4BEA+tPdx6DbP/kGxb9qRrVD6uvtYsDKfY2Pxeyar/Vf5VvoyNovbSi5o
         iGmv6et7+dxdIyfssqnGPVvG/MaawEPypwtqWjDjcm6HUXgIjePY0d3gumEjG0oKzLdS
         guww==
X-Forwarded-Encrypted: i=1; AJvYcCUmI94l5A5a1DuBEea0CwcVaCW+TZPJbNzyQ3tWnBok+euKCO0ffNuU8sOpHgUHFD2OGrTKnBHezMSos8vk@vger.kernel.org, AJvYcCVhCCXrAiO+Gf1XJkCVIc65MQY+NxJw7aHyDQDGfC46i3/ITJoTt5CzTHd55BbnILKVkraHLP7MYhsL@vger.kernel.org, AJvYcCWct0HQ/0S2bkT6uuGNw1Whm2/CGXy3YcX1Q3NO6cil1G8KbQxRfhUtXWKHp5N4eN6JEaqtjPapiCQacfGQLvlArD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNi0H+Y59Fs0zStvWPcXzlMHnRuaclNNkOQVebEGj6iOApK+ad
	xLvyMGQpj4G4NvVH5pPYl1j7Cbg7heK/dOjCz1+i0ropsCDZFB37vZED6yJQc/Lsv8w=
X-Gm-Gg: ASbGncvel2hHoe8xIZmwKrxQuB97zmfnx2Zl9Ajn4n3314EKyczCnHRqBTUsV9f2sOG
	glUcuwm05pPrwUHGpHFBVteCGvPp+mgqqF8ai2jrSxVX7A902AnZDr8RpiHahDWP7F01IipzaO2
	tcEMNexOdDxaYjeNbaeVae7/PX1a8s3uMj8FWIFlLeaF8F4sUuFwsjDXqobu5iIzgsE4eU2+Hit
	fdexgsa+dyo6q5cU8l7IWAellPb2bC2PqhORGxAxVlo4RgL0QmG88n5KvsoyJ+uhkznDMarZiJw
	6UCj61cMtbSxs5SAUYfXSgQ67gnZ+uCx0WR9zPucMlrFw/Qedd+XICw2HzxWHrlXa2v66hSvbjv
	4ydt6GlJEkiCD4H71botXNlDIMgrEMpIvYd29U/YO8KFFvxCvFyztoLERfcWp
X-Google-Smtp-Source: AGHT+IGI18P3OOBvZe/7L+2Zms+/TssYEOTY0dDIqLN6fh06hBqlvdRyEN9duoM0fqHonQZWuCBUdQ==
X-Received: by 2002:a05:6122:8193:b0:537:8017:b9d4 with SMTP id 71dfb90a1353d-539a04b3b9amr1001943e0c.3.1754485367331;
        Wed, 06 Aug 2025 06:02:47 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b15ea5sm4164023e0c.5.2025.08.06.06.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:02:47 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4febcc4c93dso812027137.0;
        Wed, 06 Aug 2025 06:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIknj3/ugWxJ913TfJJsYRzB4w7TQGNB8O87ey4+6hBk1UxLxiMesLL24Z9p84FJbLg/kOFGbenjIW@vger.kernel.org, AJvYcCVZtK0N//8/RLZRnRHFwJEwpCgZqm5orW67aNEzTaodgj0PT8YomrNTzmkUfFmRc8fVgBIkS/F///9s7OX3Mz5L6aY=@vger.kernel.org, AJvYcCWam5AO+4HI4ALy7NTJqwUTf2SL6UAwxJMC9+eXGprna1yghl3MM7HKDS/XIEBFpCI+YdnXd8FfQLEIcQPS@vger.kernel.org
X-Received: by 2002:a05:6102:6cf:b0:4e9:963f:286a with SMTP id
 ada2fe7eead31-503682a6f7bmr1121903137.5.1754485306273; Wed, 06 Aug 2025
 06:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 15:01:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXisBDff0nrJOZN__oBTv=m6C-2sAJjHa2m=5gLSwQ4sw@mail.gmail.com>
X-Gm-Features: Ac12FXwvQsjxrCrYX5rf1GblZeCx8K0jaZte6gPMdI18lRbf_LKRTU8-7HjX_2s
Message-ID: <CAMuHMdXisBDff0nrJOZN__oBTv=m6C-2sAJjHa2m=5gLSwQ4sw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] pinctrl: renesas: rzg2l: Drop oen_read and
 oen_write callbacks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove oen_read and oen_write callbacks from rzg2l_pinctrl_data as
> all SoCs now use the same rzg2l_read_oen() and rzg2l_write_oen()
> functions directly.
>
> Change rzg2l_read_oen() return type to int for proper error reporting
> and update callers to handle errors consistently.
>
> This simplifies the code by removing redundant callbacks and ensures
> uniform OEN handling across all supported SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

