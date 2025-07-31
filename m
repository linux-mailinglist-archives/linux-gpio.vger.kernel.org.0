Return-Path: <linux-gpio+bounces-23914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA3B16DF7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 10:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EFC21AA5735
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 08:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801D121C9E9;
	Thu, 31 Jul 2025 08:55:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4A1482F5
	for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753952151; cv=none; b=h+LWu6J7m/CBbbiybPr1w+214vy+Dr4MCwHmvJJ7ItSm32YFdkt6nHkqtNjMb8X4q9p8vGuFJy9if9NNK7A1f0YPU6YoHXBv5ejSp0o/aYQCi/1HP49m6YbxTOY3giAgzpvemgF19djYHF2IvdKqvmjj3MMf6fttWG0ulS7urj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753952151; c=relaxed/simple;
	bh=AuhSCAnumsJwxrSLj8JKhhKzZAgG9joTVUk2VkLL6Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+2ijyFL3TUFF2pDGXW2p43dgl4c1x1ja3sh5+cBrNl9eKh47x7Y3BRORkt+taGuY/B0PXAwMV7yavWypOSj5eEOSBnnUJcS6nEOuREsQtC0UDk+BzMZhb0VY4va4Gj/kP9KdWEpBhXnpdtMKRVFg3y4YTfNTvXP1vxgxauDNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fc15e2c451so98791137.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952148; x=1754556948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QxVCr2tIfCbjpJmpRl3ZkMdPXx53KLooGfW6mZ/qNk=;
        b=GuZtUqZaVFa2QYIt2sRhfLcZy+DZE0PJBk6xFhRwWJW0OI6IaXHj2vMFkuyzEYro9s
         ibxY47B9Wi+RVe+5NllmBCsMzTKLpcStcRFzSA+Bkg45oDe4vrCVfJzGowekYa9WR86p
         G05ZbT9ywhQs7n4WMVbQA5S0Qvl0pqATYHMGFz/U4xsGyrS2seS7WyFtx3ORdIwcSn+y
         3LDbU9R+y2qZXRY9+VS42AE68Q7u8mBGIkwNhWAyFkMhbCQsF/sM02mPblpX6eIpYmj9
         x23yiXSpeygTUs7OKOG28dIcojV2X1Z25rOp8nQDN7K59NF60FIO3DddE8egdtH3RbWZ
         Ie+w==
X-Forwarded-Encrypted: i=1; AJvYcCXlfrR7H9NqMli4pXRKCdh2mqoWxFz5OuwDp43xnTA0M6uJfEDv3HhDBMnODYkKufuCOxzUANMx9drP@vger.kernel.org
X-Gm-Message-State: AOJu0YzDR+VtTrKjGpDqjJryPjs5jOWoV/8+Nz7RsFQfMIJqAliz+P+H
	TV0RrHw0Ehwtprhir0DCaFBM1wIKopBbsiDlml9lZUlAx7RTFyMAoFtbXyMWHZN8
X-Gm-Gg: ASbGncscreQRojUY2sPqUqEHp5Vgo55SVgjjDdrL4yPE0Li4E77cYDltHu8yTYQ9i6v
	LV9priFTnr91BvCmh8HlLevdLGbAmVclYeUl35FAlwWi9oV4QXYS8rEX5Fb2DgI8xvm3iILJvan
	Lsb1w3sfd19lgZCl0xri8e1QeUf0oFI/OXNn//eUJqxRdx0UDMteE5wJpYC/YKYUgm1d9S70MYq
	4kJOK2uAyPwYaOt2Y9+uXllx/lg7u17WzUeOA98TDQ5C/xhwTBaPhsSFAnp/UHwK7nOCKarj5xv
	lIdV2v3dHWGQ7vSk6Ma3KOhKMpV3fL1URiyhP6Aknd4Fd3zgKlw3RtvFoCMt6imSTtoDMXbttKj
	KnyHvMp7ADKsBpHwq/+qqfI3i9xQ3nwu/h91yvE2KphI48p5jL3+u67WhiOOB
X-Google-Smtp-Source: AGHT+IFE9ImYGUU+Gt/wy/XfRxi7ANfEQSrEc5xMe7xUrk/AMBb+YBcR8WfmevHauj6VPywx4SmlzA==
X-Received: by 2002:a05:6102:32cc:b0:4eb:efc6:740 with SMTP id ada2fe7eead31-4fbe874b0abmr3704625137.18.1753952147878;
        Thu, 31 Jul 2025 01:55:47 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d46bc95sm236371137.16.2025.07.31.01.55.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:55:47 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-886b2fdba07so478461241.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Jul 2025 01:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcs26hIKzlv5zPcYJ2g7KVasnOgAGFbz2Gm7aJgRJ6+w+hwGdDfl7O7Svq3LpXC7KRGw9AtJKikw9b@vger.kernel.org
X-Received: by 2002:a05:6102:3c83:b0:4e9:b8bf:17f8 with SMTP id
 ada2fe7eead31-4fbe8794ec6mr3979677137.21.1753952146841; Thu, 31 Jul 2025
 01:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731084953.591602-1-lijun01@kylinos.cn>
In-Reply-To: <20250731084953.591602-1-lijun01@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 10:55:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuC8+iRpRTOfEONKtvguRTUEKZ+=jb9zM2ydHB_-DWhQ@mail.gmail.com>
X-Gm-Features: Ac12FXz0q-7ln-pemz6jm2mVpEpC17WjfKGjgioMkcKyStIIgJKkr_FsWTT_YJM
Message-ID: <CAMuHMdXuC8+iRpRTOfEONKtvguRTUEKZ+=jb9zM2ydHB_-DWhQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio: aggregator: fix macros coding style error
To: Li Jun <lijun01@kylinos.cn>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Li,

On Thu, 31 Jul 2025 at 10:50, Li Jun <lijun01@kylinos.cn> wrote:
> These changes just fix Linux Kernel Coding Style, no functional
> improve.
>
> -Macros with complex values should be enclosed in parentheses
>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>

Thanks for the update!

One "gpio" too much ;-) s/gpio: gpio/gpio/

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v1 is still valid for the actual code change.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

