Return-Path: <linux-gpio+bounces-25304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF9B3DD97
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 11:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F851735B1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C873043A6;
	Mon,  1 Sep 2025 09:07:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3C2FFDDA;
	Mon,  1 Sep 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717642; cv=none; b=snL1onxpDMWfm4mr7AfsYsidThkMmK2mpA3WQ+4fxrnaj15E4080o4KqkrkBpokYjcwXcAbHkMonxVxJWwMo+76CMR3uVkz+z5PM25Aw//srlHxWmWdQLoUxV+s7xbAcNPVRemUO/3HEUp9nszyyTx2LlG17ZXE1vcLaHenp3IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717642; c=relaxed/simple;
	bh=4louLJJOzJhxu6zjpPIXL9y3h+3vAlp3znwMuSledfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4qLFuedhXM7ZJAzePvpv5BcdDPplLniQWZvsQNkrJsFP9jMT8dzilO5QwsSRVmtCuNBnYBj586OJskfJUV5dP4/tgkklChs/TibcSmSpyWPk9j411CIVmLWKYENqzrt6eWMuBpB5IcMhln0p1Jn+YAlBg5LM/pY2HmRyTls9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-544ad727e87so974900e0c.2;
        Mon, 01 Sep 2025 02:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717639; x=1757322439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/6qibXdccLhkRefKcDNLTkjbePZYUAXP9xdU8ZvMfY=;
        b=Nc8wLri1rzaeTsD0M+d1l9/JRPLcDlrE1pNTSOD9/bvoTL/sIdhBjXb8rMbjGfBNAE
         Cm1j3BwCq42x9jipWn2ubVDnJx4IEjqPMHwGnGbRhRBgg4wTQEi3OjX6blZT+nmkp4lm
         jKr87NK7IMg9VgdwkwJVkDm9XgQvvh+cOn5+6jBZRQhY1i02vpED7EAxfc7omzoWPnAc
         vFcq5A4oBrVIE7T3kNQDKVFe7hBMRUhfQxjWB4v/uvjwKuI4NVDItg6Jjcbw4wbU8B7A
         xzgiu7g6qdmjwLjxbZAkFEK68eLGdFI2djagDSt0FIjHl+vBo7/gVE+ORFBPhM2LzCju
         Wkng==
X-Forwarded-Encrypted: i=1; AJvYcCUe/gt09QTyRxDt10ifqFkE8wkttlUmjmIQeMCaqxSatFEs2LDmcmleN/tg0iGEPURVP5mp5clq8iGP93BtiTWOfu4=@vger.kernel.org, AJvYcCUe6oSg5dQ9KWcw7xFKeRKChgKfUjZaBJWLyyMc1rb2iQzrOnIvbxw6JYQhSHjau2L39mPCuGCGXFQV@vger.kernel.org, AJvYcCXpNgo69XVjb3ZI2cpnlPXi7mNZ0lNvEnJ9DhMA1Rd9JnfH1P+MR5jMBKtRJ7chOgug/0OaM1rDtV77JMsu@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGC4+Vz/Q+08Rp3YQBAtmC9kAtURDA1ySOHn03A4l/djkO5/2
	l/McNM7ktlir3MA515g29WcaWnK4sVxAoY8CdAQ/EaS8xnkM+I08avw2wfwpOfLQ
X-Gm-Gg: ASbGncsp3XPWu6OgSTeZRre7oprjz7aubgd6W4m9wpahCNsmTPtbjZs81yWLmQKGmHA
	6oWxO3Rb5B4G6+V63kETt4qwSG7/kCmuXPrPi2jnAaSionDLDMC42g0vFfTKxRqj5fwTVr5zkaF
	Uso6uMwlUOaJzvN41hcgq5Q5MUnGAT3lQfJaxaDJl9FjcS8CtKPddKyjUmZmnuu2wVPL94I5pAF
	aiyqmG3b0Ts3Gpg388FOzwoXA9w726zeTRsIozVvvus+/7gSoQfDm69NyEoIjGyGbJkMzwHctsa
	2URVOf7U6YYWIbiayUZBQT1X5ENn6lSDiVv888pcv4hC/sX/geh47ZoA7vJkIP3aeBJD2DDml1u
	bnmRgxGPueehi3Eez+cp+9ZKGVoI3v1H3E1vcNkLn2jdVhmssXvd+ozeeGkdOwu2S
X-Google-Smtp-Source: AGHT+IHIkFp1Ugrfh61Y2mx6taynQTCPNPJDbch1404K0Eh1A47H8WTi8MJftBgdyxLYlejtCvBnbg==
X-Received: by 2002:a05:6122:1805:b0:544:7949:d36b with SMTP id 71dfb90a1353d-544a018ef4fmr1802304e0c.7.1756717639217;
        Mon, 01 Sep 2025 02:07:19 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54491464b0csm4045524e0c.18.2025.09.01.02.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:07:18 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5448514543eso2729008e0c.3;
        Mon, 01 Sep 2025 02:07:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHrPQR0dYDzmkR7N52UkNifBmRd139nuiX4PNiFxRdPHmbE5ZApQNZD9/9LRsteTpHflSfvrIUlRCNNPBE@vger.kernel.org, AJvYcCWdv6hS8y+Zw97+XsovMruoJ+sRca9XXLDlEnIGbFCFOPHqE6NHB/qoZVei2LvYjdf1S/K0+NFPocZ0gtf0o6Kq/Nk=@vger.kernel.org, AJvYcCX7ezzEzS3Aqn2XL7rWM3yHulG0XnIIGWahRXZNPy0uqy+rO77PFd6nWIme/V1XHi+VUzBkXzStZkvB@vger.kernel.org
X-Received: by 2002:a05:6122:1da6:b0:541:bf69:17ac with SMTP id
 71dfb90a1353d-544a02a9314mr2365467e0c.16.1756717638729; Mon, 01 Sep 2025
 02:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831084958.431913-1-rongqianfeng@vivo.com> <20250831084958.431913-4-rongqianfeng@vivo.com>
In-Reply-To: <20250831084958.431913-4-rongqianfeng@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:07:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW59wJCKq8nQ-SZHXVsX2kSCF0zg_gTP2vi3ApwH_SXAg@mail.gmail.com>
X-Gm-Features: Ac12FXwO8wq2u6ULO3-Vl2OwTpneRHhZ04n5O9NWF39kE3BxtUeYnqLIvpIXoPw
Message-ID: <CAMuHMdW59wJCKq8nQ-SZHXVsX2kSCF0zg_gTP2vi3ApwH_SXAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: Use int type to store negative
 error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"open list:PIN CONTROLLER - RENESAS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Qianfeng,

Thanks for your patch!

On Sun, 31 Aug 2025 at 10:50, Qianfeng Rong <rongqianfeng@vivo.com> wrote:
> Change the 'ret' variable in ma35_pinctrl_parse_functions() from unsigned

sh_pfc_pinconf_group_set

> int to int, as it needs to store either negative error codes or zero
> returned by sh_pfc_pinconf_set().
>
> No effect on runtime.

Fortunately the issue was indeed harmless.

>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Fixes: d0593c363f04ccc4 ("pinctrl: sh-pfc: Propagate errors on group config")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

