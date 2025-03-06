Return-Path: <linux-gpio+bounces-17148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C157DA54E3E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0606816BBCB
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 14:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42EF188907;
	Thu,  6 Mar 2025 14:51:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63B316DEB3;
	Thu,  6 Mar 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272661; cv=none; b=qQrVF/43AX12GFBJMar6ZvPXwoe87Jw757krxrqhwJPBfOVHKpP7Dx75LFyNdugRcUhIB7kL7jDy2ysSdbJgNL3BtfqFhL6b1G89X1wvuHkLv7bfuORBTAtHCE8ySOdPy70exzsbi+v6oYX9cBUpIhwMyTcKaqJ2777r9M2UFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272661; c=relaxed/simple;
	bh=ke8/Udv2ONTLwbYAqaGUgJ6YbVMVtZSz1tjDVT+Q1J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAIDd6zwg43rt1oqoKu43kgneuwVR5hWuRpIH4FzFeNhri7XuORwOx+xdWm8q8HS9zwpZon6v7MukwUjRZMBu+9W+DVDRA5egTJ+y35vIGsAWZo/zfGNJQB/A/WuBOJrFlAYqedtqb2cRekCbt5z+RUdiONqBDT/0nyvlhGtcKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51f22008544so282370e0c.1;
        Thu, 06 Mar 2025 06:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272658; x=1741877458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bx5qOB6bVQO4HOrFczhWmkow5FSTIcCYjLMwOTlD/gY=;
        b=opmTb5CiCya1N9OKxk6IQs36WzkzhPVeYJ3S4d0fbpI1WONqzEIftXCHJIACSgyi3W
         Ztbs+8fQaw3gIITBMlU7t1lNw7Rbb3LeWyWPINTTQGp959V80xoO4C4Yb8MoRJdoxT2K
         XvdgzZ1B+gM0mfDdMbp4ZZEER+y43OY9TDH7U1RK60y2jHn2ZlXK+037kUJAuQ/DC00C
         FIxCCAA/VYrHZ1phZUFEGoHjCTVH4WDYLZN4UZj0BMgP0Wo5jOtIygpz+WQtdjrN0kwK
         TbRc43EpMTtxSHjS1nA2dEnDFIH45ZpRNg3fVF32JBqVXQozXelWDFQEm74AYFP7HJiQ
         2HoA==
X-Forwarded-Encrypted: i=1; AJvYcCUOC7bGrYN9A6hN1+f8TLxFkcSLkuCGzkCAVcbzdtgsTgcqCpjH6fXY6I4rTc6jgZY4roYvD6lR42C0@vger.kernel.org, AJvYcCUtKb4QyL7X1Tp9pyP4xXydf1cATN1Oz2PJTOrkdEiovzf9q+zuL1uSpt+Wdkf710kRKmVvA8YMf6izyKGwUblZ1zQ=@vger.kernel.org, AJvYcCWKH32poHUOaBTTxgI7SVu1TRYiB0EYpaOn9UuVzWCj0Y8U52+IDFf7fbIQskS7Oqg8FkZkiTiHFKK8XpEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUkilN/YSC5tFCRkJpKi0Iny8A2CWddtFUQ7s1pyAub8phaDF
	GzTfXAl6UhUMczmA5oF/DWL2twiPbROh0atDml2xRr2hUL+FGdbQr+8eAoNVtbA=
X-Gm-Gg: ASbGnct3QlHApjJ+bhd3zoprh7uvQPF4nXG1y2SertSxFpp0dyDnD0TaAKb9EVRqLqn
	5iUUvwpvVSGJFheXQ1ySkjuRuwD6ngy7uWa9A2DCuWG5XSZP5CudNGU5cKHCArBiFDeRbdnzgMt
	nCvcaZuipbvx9dNSwTL4Mx8hh8l6PAHKj/1oNkFsUGcaUJXwDlcGBZNcEg+ZyindQL2tBoMdHKI
	s4wKlBtOG38afBaLaqMjkLGUPZsOsriuCnQSB4UtM/sgjFKi9SWNr7bZpHS8zVqYOODpCCc63Iw
	V/hyjggt5my4v770SVftptj0xjOvvN45YlZU3mbcuSD1DD+kniV0+I6anoiHYNpL4cvFwh73peq
	8vI7ywy3qrrs=
X-Google-Smtp-Source: AGHT+IF9rZPid5mfT94iFv57Du/XDEzUg7k0UUGEg5qZezdy2uIsJzU2OWyu2uCA2MjlwY+0OTV/8Q==
X-Received: by 2002:a05:6122:3c42:b0:51b:b750:8303 with SMTP id 71dfb90a1353d-523c62ee91amr4570937e0c.11.1741272658431;
        Thu, 06 Mar 2025 06:50:58 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8cbab47sm194569e0c.44.2025.03.06.06.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:50:58 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51eb181331bso363705e0c.0;
        Thu, 06 Mar 2025 06:50:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCy2co+ReJ91Y7ss+mMjHZEOHrx6J0Ez38kaX5Q7mGs3riVpMmer3p2nngTR6ZUwqUFI5zjWRa95EMVtLnnEJTFbg=@vger.kernel.org, AJvYcCVq1N6Wl0clNmOeoKzGYFGh8t9I9NSDKYM63FjZEubN+4R553cEDsEbRsecXzcJ6qx2Fnjv9dztwSMz@vger.kernel.org, AJvYcCWWKbhGZa2N+IlVqQ2qUq7qgtLSSdlGiE/0ARA9uapvY9zuYPw1BM6qVyfZZ09g1DWPMS9k7M5FPM+PKjVQ@vger.kernel.org
X-Received: by 2002:a05:6122:1e14:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-523c6150c8bmr4229347e0c.3.1741272658016; Thu, 06 Mar 2025
 06:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:50:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULNxTx=2n5221jFNdF0xFepWRzv1oC+kB1RofupokQNw@mail.gmail.com>
X-Gm-Features: AQ5f1JqXD9PXyINl0UFnu4MoAmn6VxGFJ3TxdZnbHiqhDh-CSh0d5cYwGlWxK1Q
Message-ID: <CAMuHMdULNxTx=2n5221jFNdF0xFepWRzv1oC+kB1RofupokQNw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: rcar: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Simon Horman <horms+renesas@verge.net.au>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 17:38, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: 159f8a0209af ("gpio-rcar: Add DT support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

