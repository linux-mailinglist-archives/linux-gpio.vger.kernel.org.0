Return-Path: <linux-gpio+bounces-25649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8AFB44E49
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601C61C24225
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 06:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935A82D1F4A;
	Fri,  5 Sep 2025 06:54:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B931D9663;
	Fri,  5 Sep 2025 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055269; cv=none; b=lCioIlykR9MCkN1Ldq/4F7A0S2xRgtjgYLTcC3YW5VoOJt8R3cbNGyF3kMf9+294A0jODOetwwelJalTcP2hwvz6FsvvEZ5sziPT+9Kq49YHYeatLm6LOiXFJWxu95fdIbf78vesyPznbc2oLCEC3PvSnAvbEe0c9hnfm5H07g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055269; c=relaxed/simple;
	bh=XmW9x/u1OfMjuDOTwKDiFmXlPs7tnEk50nqkawb0hGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfaFsFVU5RkCvr4tkylhmc3IpQFheQ2qltr3JvhahZd7M3Hugf3JVY73XysR2grhl5qxvR8i9zr0ea9DZQn0vT6HAbSKlex+2jx7lhKUhb+D4z9Is1BDDwsj18ZbN5bQIQZN8lpagZBOBr/wYyXHnD7uIZIVet0LEZpqrV970Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5449432a9d7so1082494e0c.3;
        Thu, 04 Sep 2025 23:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055266; x=1757660066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8RVPbEFOTSPlauJwisCB+Zu3o8p13fOLSh1Yr+MTZ0=;
        b=kfr8iK3dqKh/B4q/Xxa9CvZCTfI62WxMPXF4tTkovg/ZZb57BdQJwlmQK17vPI8dSF
         3zM5aGCRDtNn0oBHRbWnqFshE7Zu9620Qny6Jo9/OuOmSU4yp/cKrp0PZ4wyr7xoneFt
         +TueRyG0dfUi1FaBy5XwRfqyblnb15GtqWT1Xs4tiVCZBDD3Jd4G+o1yT7LI9dHQ+ely
         8FduUy0g+d7IT+crWV6N+Cy+x5Y4YZ8Le1WeX89lgyAOadPTV/SPcKj4Ex/hV7HyO95s
         50EN56O/NlsaQrm2IzA4YHEccbsMvJeYjaW0eGUxzlyBknOVLRm0gzDMW66dynXYiUXf
         kG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhfa4v/dGfYfzXX6YhPeUfnIjPleRb+uILsTS1iSVm0TFn6S4wXhOw56Ozb0AyElyo4Q/K57MqJrhNjW5+pxxcqmA=@vger.kernel.org, AJvYcCXTGK7zRfSUaOfcfWAjfXvKWl+jrxKHvPy1EMamSwOteVoyqh67SD//0by7VTD0tiaCNqVGGoisWTX8@vger.kernel.org, AJvYcCXyhl57JVQhwxkUb8inrWMwwUrb/g1+iCkW/VPKixjGNLYZzmunhMIdwp9uZtHEbPncO8av2UqmXVEnmPdv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu/T3mjNJq/Pkk2rQulW9Sy0ggxSCmmUjH/WjX7HC21B6eXPni
	8CRvXJ+kuvzpUyLAv+Q+MHATQH3P8OeeXyBoxDSLy+deX9j8dQZFmFUdA0JxD1q/
X-Gm-Gg: ASbGncu27dS3xHJXzvfsPUAyGaheL4N+rkjjolXXb5SlXGbIrLwdLp3Y0uhUTPVC+rA
	fznOBITRzkOxd9zq8VUQMirm6ptniJb5Xr/1jscq/AJOs/iEVQZhbDGcISTLww64sB135L32Mb8
	uTiNAE4cnP9b6KRNeAhg4jKmq50nMd1tvwgJvOfIGsyNsoZOy0xUWM53682b5J9NplMkaO9k5ty
	+Dh4o4Fs6LY0ezRcE24M1AzwTtNeygUF9rZpmPF9RAzGm4TOlaAX9yqfO4y/TDFxA3u2xFbkBHW
	WaHOYFY6+G863cD9/RYMBrF6tcbb4mQbBPcwiC8kPc0GvV3tYBZMhl+RsSUuHvcFjU1Ww+nwkZU
	x0f0aZ6+lcUjFCHdkvC5WQkHa60NfzEyVgClYvkfrK2BrJ9GAgphnmKVnVbMnE250vdcI8FE=
X-Google-Smtp-Source: AGHT+IE24xHwaw0WJvtdxyYxTnajMawlJNKgJfDHw3H+NFHfohqxY8WaMF4l0ftbHmc0618nx/oWuw==
X-Received: by 2002:a05:6122:8c0a:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-544a01a2db5mr7278617e0c.8.1757055265696;
        Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5449bc6668esm8935905e0c.0.2025.09.04.23.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-529858dc690so623274137.0;
        Thu, 04 Sep 2025 23:54:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd47NSFTuiWFfDzOHzr0MzIpCEpTCbQQDixJ//sZqvx6Pl6DNSYK3hH7RlE05G94x5R7RXl9OXawETFjAxxfcFOzM=@vger.kernel.org, AJvYcCWi6DufVm/A7euA9s6qxA9zfIlaWULTimbr515C9Tl4NdO2mjzFUqU8lAc/eADZBjQhVLpAKFgLiQyrl7qw@vger.kernel.org, AJvYcCWrgxV/a73MAPiVTzmtTJN+l8tL3+alFtP3p3hebEfx/x0GcXxR9L9RSM69vb5jTOF3+5CXjfWRCvt2@vger.kernel.org
X-Received: by 2002:a05:6102:38cf:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-52b1b709618mr7043507137.23.1757055265355; Thu, 04 Sep 2025
 23:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904222806.193260-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 08:54:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUN=dSz2O2B9UZkEaDGBmb9srFt2NKtDpHhRnLkig0XcQ@mail.gmail.com>
X-Gm-Features: Ac12FXyx5e_elYMrDnBinRvBEkJ6FCNigNEPMLGI10BsAiTc3HfuEbdRhjWeeNw
Message-ID: <CAMuHMdUN=dSz2O2B9UZkEaDGBmb9srFt2NKtDpHhRnLkig0XcQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: r8a779g0: Fix trivial typo in SoC type comment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Sept 2025 at 00:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fix SoC type comment in the PFC table file, replace R8A779A0
> likely copy-paste error with R8A779G0. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

