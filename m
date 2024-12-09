Return-Path: <linux-gpio+bounces-13662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD59E96CB
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF045188C76A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E52235975;
	Mon,  9 Dec 2024 13:22:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF0A23315B;
	Mon,  9 Dec 2024 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733750573; cv=none; b=Ih/Rz5EyPjLlalLVmZrg4r8XjdCLB1nHCD1FNSTMVrEhO8w8JRlsxsaPejXZ/lF5WQAuNv1PvqM0uoHBvpEKKJnbMIC4wi7DlHVHFCIZJVLuUcVl68C8Lob2/dWscxTY2kYekghZsj93UCIu8xpm+U+JhUU1beNBvP01kUutzZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733750573; c=relaxed/simple;
	bh=2D0DQ2jdcuW6TLfqRVVTqkguIuo4pXIcyu0TN7dpVNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx7gAEgoLYdPMezTuP72VCt2NTsSXHAmw8sN/kN+SnyucRZr8wewzhaODz7vyTxov9jElzuewKMVBLTEeRBw1AvJVIL4IzPoHRLB6XKWifBWd0zQQBKlg8MDZVU/w4Ae6eZwEsHgjIlf61cwSvaxa/aAxaYvRbG+9QIpC3+12Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b676152a86so535496085a.1;
        Mon, 09 Dec 2024 05:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750570; x=1734355370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3/IloxOrCBXmR8YEJvJohhgkefp0ULUgBJK+U/S1mQ=;
        b=EXCTdyQGyHjPaL4MjbbqImPuIIXb+Ww6IKkiQcUqE5WRFU2xw0H+q+drs5Irb/eZ+n
         aebQB6PSJ/jmezpcm3ABFaaY7kMpG5ldQqK6xOWruY109B4ppaXQ8dTHdgN0AauM0Lb5
         zYd0pMmZLwwmAmpARaLBgNhEwt9XE9QKC+VWZkLwm1bjjYnHGIEc2l4zcMl0GWbv/fnc
         +kou77IpkZT8B3eNSpeS0K+wcn66cMi7RLB90ZRZPTxPTyqy/QJMyXpkjchvbpzAwPkW
         q1bLN93c/x7SkS1c+Afw02AbLMsub9a416B0Xn9a4zFNw6hJrI2CNblUqtSos7baLojJ
         PjcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWlDD2SMdIvDvVdg/0hVD1VBe7zgSrTCvems6CQzVuZe7/lU/KgllAj6+Z4HK9yufMj2W5J/GX+o5J@vger.kernel.org, AJvYcCVqU47xsd4iNcj57KTdfpsuLiGoNAVdYa+lIqIKRyd0WyRt2ULdno0iQem7u7iS5xLkA1uL1BUdWKtosT4=@vger.kernel.org, AJvYcCWK9Vu+W1ijxLrkGjEFLH1/PmZBNAnf23ASzmPILNt0hHi65pUOOOiTvn6e3JzHKMAdP7TmjMQGL1PUd4Ve@vger.kernel.org, AJvYcCWS8fx0PdqkC7SoEPvX7VTQwwcCIPGPorHsZDv8hCuI8r80s7cn67irY96SV2+j0k64foryUYrqBxE9QaBT45IVRss=@vger.kernel.org, AJvYcCWo2uUuX6n4Jhum3NdtLgJH59j0QJKlahu/ENt9gGQcr+DN2si2tyBqA6bn//GjDPhpHwr12x0Q8GL6pA==@vger.kernel.org, AJvYcCXyytjtT0AvMq9ep9DUU4T2VeIUNTEpJX3ZxXjaEs0Jz/MzFPDCneyiGQ7rwBDtzNcgU7MA6z/5++IP@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHraVGGcYtGAT3m9jNmu5LthBfI/ElLVFC8ItkNOZZFc6+OsD
	uNvQwRnWbKRoBVqoXodGQb65x4vUq89tm414QIEVfzrXtEtji9bCfOSRlgKfbas=
X-Gm-Gg: ASbGncsVEF3l0WqzBqvYHNgQpkG3BFKpBRtbtdasrOKtVWYmDqRYIRyRr/YbF0ZYVtM
	pNE1WTBIADPqlQI56YvwKhP3VUZ2sRtgiDNAAqNIceDb2uo+y24e7UGJ4D6I2BpmCk4zejc6krH
	YgPW+RLaJlask1m1T7qr1wTabVg53nrES5xASc8EOpzKFiZVxONrWYSfFUWDOeAfMP8fjJG5g/4
	zoPm6YdNDL9Uiz/F7zFCXSKk28BJ2YNXmU3EKQ+FR4No0vJNN/E1gZpTWV8exVMXjxrwO9gHgjj
	23WxYVd75aobz7bQ
X-Google-Smtp-Source: AGHT+IFjuvQTyXOZRYengcbPj848hMeTXIulPbD/oirZ3DFkqEdYT2UgbZDAzFYaZ3Zqo3snOQAyhQ==
X-Received: by 2002:a05:620a:838c:b0:7b6:dd11:5e5f with SMTP id af79cd13be357-7b6dd11fe2bmr35367285a.13.1733750570549;
        Mon, 09 Dec 2024 05:22:50 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c4f9eae68sm759192241.28.2024.12.09.05.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:22:50 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51544e9a0abso2804094e0c.1;
        Mon, 09 Dec 2024 05:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCg0Y9k3ijXTwqkf2uUrvdkmA68YR2ZnqKzbUd/NgqXwm7J63QxovTDDFaxtLIzU9mrd/RE2lmjyp008rZ@vger.kernel.org, AJvYcCUuMX8ENZCzi3zsHSPFa1v5B/IXXLxjy+nn5bOFqJW+EeXp+81Qr+pRPMcI0I0rymDuEkII/ylCZbJD@vger.kernel.org, AJvYcCUuuu8STNG7x1FYU68BKZcIVotyuJLbIcrWWH/Zq7vEQwLJoVgRD5SklxiJzfxRxZ2AdHa/QVIhrFjzKs2wlMA1FhA=@vger.kernel.org, AJvYcCVC+TxN0oOt+AChJnRAFdbMVCT5Z+SVOYbBiWI5rm8a1zzj7mQZ3dFkcCPK3TMRwRgny9tdzzoYtczOUA==@vger.kernel.org, AJvYcCVanEE5CIT6VccQdxTuZ4nxHXVEp4KVgo1FlqTPZlncJCXZKTrRvbOzJH1lvZwew4vJQnmFdruW+D1kLeY=@vger.kernel.org, AJvYcCXznL61j595NcYP7Q+HcEhNn1+7wvVIAeX3Q9iv2gjfTrs3oV0ZrjFq9eoCy3/vFH1bbxdMzzQoAOGH@vger.kernel.org
X-Received: by 2002:ac5:c9b9:0:b0:518:8915:89ec with SMTP id
 71dfb90a1353d-51889158a8bmr371719e0c.1.1733750569916; Mon, 09 Dec 2024
 05:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:22:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
Message-ID: <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] ASoC: renesas: rz-ssi: Use only the proper
 amount of dividers
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There is no need to populate the ckdv[] with invalid dividers as that
> part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
> always be >=3D 0.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ss=
i,
>  static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
>                             unsigned int channels)
>  {
> -       static s8 ckdv[16] =3D { 1,  2,  4,  8, 16, 32, 64, 128,
> -                              6, 12, 24, 48, 96, -1, -1, -1 };
> +       static s8 ckdv[] =3D { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24,=
 48, 96 };

"u8", as 128 doesn't fit in s8 (why doesn't the compiler complain?).

>         unsigned int channel_bits =3D 32; /* System Word Length */
>         unsigned long bclk_rate =3D rate * channels * channel_bits;
>         unsigned int div;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

