Return-Path: <linux-gpio+bounces-25667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2AB45448
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA4C5466BE
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA85B2D373E;
	Fri,  5 Sep 2025 10:16:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB732D23A4;
	Fri,  5 Sep 2025 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067403; cv=none; b=MibckI50R470rVrUVYTnNpJhQ86i0fCGuUBeKH6UambLGjeFhKZFjZr3ZgpV2E4x021YtUoWeiKoGc9qfl7YCfXtwnsZQY1Bj4V8wJaeM52XTR4o/BJ0Vt4T9sWKcAftwGsgMQ+apGsmJbmoKIkGjHpWk0ryKYvCueheVsjXyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067403; c=relaxed/simple;
	bh=Q/KhvnG3Yn+Eq4mQk+GQRPdJYPN1IoF4Snmc6RQQxqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6EErCb4EmHRj5XkBIwjAPu46jK+htcbhdbVX/55ljcuoI6YlSEhOT46Iaj/UhedSHOlNNY0bducT0I/mTbhMIVB43sANZNZ6JmJw/HW9MI/4ElYsnIIBkUJU3vLMw4/7S5H2De2vXgCX8/VF2e5/FFyhNLTq2LatBAKasD0hDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89e5b87f406so509206241.0;
        Fri, 05 Sep 2025 03:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067400; x=1757672200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4hl5Gprdoe5tX0qneCTrUS8BehRBAt1+D47UOUAQYw=;
        b=AS1Ue4IDHsroAxuLXthCyfXd8pLRZHrYRqYreh/9VXqLFhc6/7NMH6rWN6I+LDhHQU
         v+0TIYTXTM8+okYe3A7cI11xbetPYk4M4GMcR6F8h972ffbmM9ZInt6QVZFoejrfqDOu
         ElQJ/KfZ/r3huJcl+M7JvnZf/hdXy7D3OfmiZhfS3qJtRBMEMi8gTmuHmT2WkwpGE97O
         KHEWTNuI5ZTVycDzWJBAV40aH+Osv+4xBofOvvf73J/2QqsEdwChxUep356STPZOjkPH
         lPu9Q2uRuawtVIebF3ESz/RVvakeBnmxnv/8pmRadppJ6JcYSBQvRTOGBDIgwXuUYo8F
         Z3aA==
X-Forwarded-Encrypted: i=1; AJvYcCUGL+vtWADgDlaogl45ka67NEHnR7VtlyXa6Ua8hA26ONwha4eDmsTKnKLediocEQ0yWvHApZBA/yir/KBJ@vger.kernel.org, AJvYcCVZ4e31ou+imKf+RQzP848lkHbg0NI+lNThvp55NKUDmA/4xtVxB5sOvgsbnHs69JcA8sSCNm9L/pveMw/ai80DHYw=@vger.kernel.org, AJvYcCXQ3UOiEtaZGwONoUQpguk9mDHV8tyxHtuD3OQEkQ749lgWtHFWdu01y7CNz03lJWX+l0esXfVu3aEW@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKTJ1IfG6+hbFU8/1siKJ6hOf+w2xTAiZjY7pnxuEiuwJxXbo
	idZkGyMJii4aDhaiI9I99HoOXBOpFfy2qshrxZIwQTUxm3at7zZQQXiNUYZDHHam
X-Gm-Gg: ASbGncvbWb7Y/ifvkjL30w4WvLYQW4cwbw1hkK8/QpEo+NxQti867Sk4xEAf7sIVGzB
	rwfHqg8E4EC9vwAm4mHf0W3ToH8rqaVsgEH+0mkCQFN6SJrHP2YpemyjlScAlQ99kephFjOI2yY
	rHYOsGa9jxorkU63JUpKTzqD0H4T+XWLzqPxlskMxkLzA9QFN6vor45hrEZvbW3tvWeFNvKvm0J
	C7e8HgzdtTbRGJkOvMzvIYN2ZkbGr3jZhfY/OWflbj/lseltrEnZBlPUwKFAuTZ6gCIkOdgv4io
	TkDJEO4p6rtadIpCotf3wFbV6r1Tq5Pv3et43DPbuSDabf7CzUC629YOi8Mc7d1qy6ufzA2yH7C
	AG1rNVykeAXpJZT+xLOW5h1mBnStB/f2MCEI1Q6OumQwhv94vqJ89YAzqeVcVNW3LkveuA+iP8N
	Y=
X-Google-Smtp-Source: AGHT+IEh4yuKjFVyHYCdKuOCWPBTUGKru9IGQzHiYQVIrT8mY7WtRiTn6kOvDOiIW8TTLSNeQNI5wg==
X-Received: by 2002:a05:6102:6446:b0:51e:92cc:6e6a with SMTP id ada2fe7eead31-52b1c359d84mr7053190137.33.1757067400102;
        Fri, 05 Sep 2025 03:16:40 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-899a902b2cesm3748787241.14.2025.09.05.03.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:16:39 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5448c576e3bso830906e0c.3;
        Fri, 05 Sep 2025 03:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvq5qacUsAxZ5oeIwCb5JhS2T0J7tN3l0PGuaR0dsqRz3tBuBl3mez7/TGCjR+aGGXUCO2uYKpXa26Iw7lu6cjdlI=@vger.kernel.org, AJvYcCW5I5UDfc5/UyMr4PvXVrZ6EG192HyjKmbw74VNBc9ItFHXm/PbcmClhT+jSgg7NxsZkCksI7aHqqkqkiw4@vger.kernel.org, AJvYcCXzbw9yx2JEBl50rxyDpiCdJJdea5LRC2rEqFdtEMIFk2npsUZKfOKKEkz014y8LZi646VCYWK6tbgp@vger.kernel.org
X-Received: by 2002:a05:6102:5089:b0:524:a2fa:4d23 with SMTP id
 ada2fe7eead31-52b19534181mr7376792137.2.1757067399662; Fri, 05 Sep 2025
 03:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 12:16:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_JZ43suM6NQVkyZthi5uNx=LJ8zSTsYQeWZ=UtcOHEQ@mail.gmail.com>
X-Gm-Features: Ac12FXwHdy8Xb51VF59LYlcoBCAzYqyBCYcEJnSBjZSHxUNE4DIkVyTLNpV-BXE
Message-ID: <CAMuHMdX_JZ43suM6NQVkyZthi5uNx=LJ8zSTsYQeWZ=UtcOHEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 Schmitt control registers
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 10:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3E supports a power-saving mode where power to most of
> the SoC components is lost, including the PIN controller.  Save and
> restore the Schmitt control register contents to ensure the
> functionality is preserved after a suspend/resume cycle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

