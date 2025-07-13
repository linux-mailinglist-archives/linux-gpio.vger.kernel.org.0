Return-Path: <linux-gpio+bounces-23193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F9B0303B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 10:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0821A6180B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jul 2025 08:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBFE25A2A2;
	Sun, 13 Jul 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xbxAcRYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85E1F91F6
	for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396207; cv=none; b=Kp3gdp7c/qPg6zhZ6gaWFPwmgLOg7hn+ix7LwVZYM6VQDtIrcmmOZBbpzKBNRf7RyyxGQBIJgQ3rF9HOlEHDG1J+cmFF5vBtLe+/KvOIjXhs8aF7ZHYSKUov0h+ShObvzBZ2UrFzOJF7K3auClHi7Q7Qj3hkmB788r68atcsGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396207; c=relaxed/simple;
	bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTJNDgpSwmrQ8WiPIvdalZevsrpUcV+e2J34B3UWk5yVqK69UtJaARzpW6Qxv0Fn1uaDBum4TkVuQCPs/7jP5xGWbuNKyBYsXG4LMmD7xb/P5Bgwp0wYcqAcLoBN0UFSvESekASMEnVh4lm2S2aVwAUk0gF+a9MR1/EQvbaEYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xbxAcRYU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5550dca1241so3121574e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jul 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396204; x=1753001004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=xbxAcRYUidJVofzk3N9o884D0j/xmj+1Mntya2TAmL5rMyomrvxwJYe8GFF9QKNOyZ
         aQm2gAUmEih5QTagIMA8js6hCnpRco1TlffNb8gj8FayfHQPFfTNyCjjcdys2QPf3rzU
         vn2qkQnvFTeeR+p8NjRiWsbcItVACaTrshEo9DgFf78b/Mm1irZ11p4QoJvtnXHT7EEU
         H+XN30jyWGbDDDfnZtlhZCjjV6OumnoxLLDHMfUOywy/A0AYdcypMslyi1WoLXqtQyvH
         /w4BBM+XMlPz8rvOi28k43tNGgtElv7T4G+rCLF1osJbtqnjhPa6efNGPsggMiVwKATG
         2cPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396204; x=1753001004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=QjBQi4zWNT6rP/lG/NcO0MKB1W+o487tRYM8cEj+OyJd1DV4gr5HfCpNHl4LqyHrPu
         brmjmhT4skhSS0Ew9r3vXkY2r+fakzXUHEbB1d2hHPxPq8B42ugYceJpbbYvii3uZhMu
         8OgoiHUTZr8nB7yxV+NQCfzgfJ9A8RgABAOfHyixIKnVgAtz7a7gWUad4qY6Ml5LkWSL
         qwiHkc9fy/8/GERt9yYH2NCtUey62hjo6J28ur7ObKs0pvMwfnYM8Q7vOvf5t/gNB4DG
         hnDT1HLwxGXvZxjyAiHtZPzOOpbhoNC7g+r3raIlra2orJ4ITgCZ6pFEEj/5oWawvRmX
         Vc9w==
X-Forwarded-Encrypted: i=1; AJvYcCUGYUhgkcHk2aTw11mhk/h3fUziP5U5K/xjEtfVzsknZd/nhhbUb3c+LOGnFfxOwZ+scLdyMMKOwQFr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/uqzVMMoDBa092DjszY0zfWJV9dfIfHYfyEFiqKE/G3Ts4AFe
	fi24je2X+6IiZXFfg1oeS5ctYBCLw1EZLUQGgAEstAIJe7WGnojh1TGNjjsGFVDvooGt4eYMJXF
	hsfpfdj8PuOis/ihyssADUGaBURChiBcFi1678umOug==
X-Gm-Gg: ASbGnctZHZ2W+3FY1pjBXH+es7rXHppN6MDteoYwFP3u2DR4RpmUZBXsHT4ZPNVCIYT
	nK8dIxy7UnKRBLQuatvc6kKq1gujqQ5diGNBFe+yjL12+vepV1BggldigRL5/oHxqij4frUniBj
	eAors3SNI2IWp308OckU2ALh1CyCTU217AtbzIMALc/hH3V+umWCvTfn+VDpOGmn/aarXnnK6fZ
	6lTIRPS51cNdKVPMz6En90HmnFQW14wKj4rPJHBmPS9stbOnA==
X-Google-Smtp-Source: AGHT+IHBAbCKD5IYxg9QHbex64TGGdl/hyMZx/O9ZBosB5HyqtSevaVoy0zG6SyjrmS/Wv0vBuuPHSN0g6Rcj3+48Xc=
X-Received: by 2002:a05:6512:1114:b0:553:d884:7922 with SMTP id
 2adb3069b0e04-55a04668194mr2741453e87.48.1752396203838; Sun, 13 Jul 2025
 01:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
In-Reply-To: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:43:12 +0200
X-Gm-Features: Ac12FXyIRZr_PZFqMr5GkGp0O9WQSutVaydnaLLulDe-fCJJJZygxCd1lTC-X0M
Message-ID: <CAMRc=Me561DEHio+zN6oX9oqD6ue7z-y9E+cO_7_Z3L4taQd_A@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 8:37=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Needless to say I'm a big fan of this patch set and it seems only
> this patch 8/12 has outstanding comments.
>
> Do you think you can do a quick iteration of it or does it require
> a lot of time?
>

I don't want to rush it. Let's make it v6.18 material as I want the
changes to spend some more time in next and not break anything. It
affects literally all qualcomm platforms after all.

> I am tempted to simply apply patches 1-7 to make your life
> easier past v6.17, should I do this?
>

Yes, please, they carry no functional change, it will be less baggage
for the future.

Bart

