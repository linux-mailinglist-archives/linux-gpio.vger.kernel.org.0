Return-Path: <linux-gpio+bounces-10813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E7A98FDEF
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D8D1F22E0E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6268113775E;
	Fri,  4 Oct 2024 07:40:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C11862;
	Fri,  4 Oct 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027616; cv=none; b=Bg/NOQvs8pu+37jXL8em3Ky3IvhOIylw0gAe+Lc67HldqyKIWG4E3a7ikRN9bEEAc0njSu5yG9DYzyui+XJgcftSa8JXG2jVW6XYq+liFQIA5+dd6qM16++gdoERP0+upx8/fP1RLFbhzOku2QzPKwMxZ5LjD75Eu4vAREWdu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027616; c=relaxed/simple;
	bh=s+U7mPA4cuZ5ZhEywjO1q5MFBt0+X41WS0Xgg54VSWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhhv1QKmVF81L7GbA12TCsoNWB3x3vkibHdBuYDMVILAvzVRsySwOItsMjKqyPsxeLUhwF17++Tzo6C1Vpvt0fKAMamycUMUqH1E8YodtnDiOpOC/mDrIZzmxuZej1gVyPjf2Tmgh/Doj+i4FgS+d28lGLgFNCOj+ZVnsE8cZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e026a2238d8so1760667276.0;
        Fri, 04 Oct 2024 00:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728027612; x=1728632412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RO0BXZepgLq8tijgrMu3ZUSo4QDTL+V9orOPGhbqOUs=;
        b=PLrxKN2kE2dMTRtJVuZX93YHLOHJ06c/b7oNy0bDuZyyHWUDIjWOgnl7wYdElla2ne
         TCnt/3y6SEEK221SnDM7i/4IVfV5uZ2zqgtCS3QTChVJb+wZwMT/mHQlXNBadzK5o2zg
         gKZo3CDvylHPot35ObS8poBWSvSY/eg1VhJ57wd/OIZ1gM51vaT5ZSfElw/uI9rWAE/v
         nsRxinMXroMAfJ5WzqnUXfRS4CBOyaTZczXTv8GUV8LvzHTR3EXTW0GmjOds3TlgiW1L
         cl3qowJqPLCLs5QSuBtJ0SmUCz08JgUQyxqlk0drMrNqlpdNTdnnYg6SbONmPACC9EtC
         fR+g==
X-Forwarded-Encrypted: i=1; AJvYcCU7bMNL1ldJOZSb56NVn85oxzFewRDuTblnkFKxzQDbFLyXgHqu3oOxxjXBXiyE7Cf4vSqLnrA/tTiLF0G8@vger.kernel.org, AJvYcCVp8zS7Lxvp64owCtnFau/TdJk4LDO+1gIcCQMEjw6YWyTwirUjr0xX3NfYaflURhyvvjvak9gPpYMH@vger.kernel.org, AJvYcCWPG/8/17uIW6gr581nNVkhBxtwSiCagfFD/dqN+1Ep21M48SfHGi2mPlf0Q8P9lmiVfzsT3dp4zBI4xxW0K45i1Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0rNGthB70J/XSqihUCfnBJep9azwNJ5wL49i9AbxDGEtqNlW
	Lb+QQD9uV2K63GCjOhChjMoTjhKH9L0tdbqWzo3S8EXY4cIER33E8mD44jRPFMA=
X-Google-Smtp-Source: AGHT+IHaQzLGFnkmSQQ8PwO1b1buyQSq5jmZUnXPcYzWP1WlMkO/RDtuwRpj3L+nxZG3H3K40WhibA==
X-Received: by 2002:a05:6902:1882:b0:e26:12fb:1d98 with SMTP id 3f1490d57ef6-e28937e3a9fmr1183615276.31.1728027612566;
        Fri, 04 Oct 2024 00:40:12 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb7843sm5623237b3.26.2024.10.04.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:40:11 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e21b4d7236so15458807b3.2;
        Fri, 04 Oct 2024 00:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+EA5QAfrWEipaR6FTrTiq6RvzrdZ1XP0a0Zp56++wQuxsfPwwBwcNEmOJh57tAo1HEEtsYlgbhLtt@vger.kernel.org, AJvYcCW6915BRpWyXyf8+YKKNVO3QPQB/Pg7jRuSSJQaxMaiPFUscyKKmZo2Mgsl1N2zDDzo3MbhAsucpuCSZcnjpWoU7BY=@vger.kernel.org, AJvYcCXHhJp4GwcXyTJt+2pKhMnpWd2oNX8/4KU3zqEBkCRP161958hrxvhC7uw3yJsWC/et5e0ylBmJ0i2TI75A@vger.kernel.org
X-Received: by 2002:a05:690c:60c1:b0:6e2:1a41:ebe5 with SMTP id
 00721157ae682-6e2c72b07d0mr17527947b3.41.1728027611475; Fri, 04 Oct 2024
 00:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241003131351.472015-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:40:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-79wt71k_kCE5OrRzsKG+qDu+W6E1JJe0LnfjywRkQg@mail.gmail.com>
Message-ID: <CAMuHMdU-79wt71k_kCE5OrRzsKG+qDu+W6E1JJe0LnfjywRkQg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Fix potential NULL pointer dereference in gpiod_get_label()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 3:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> In `gpiod_get_label()`, it is possible that `srcu_dereference_check()` ma=
y
> return a NULL pointer, leading to a scenario where `label->str` is access=
ed
> without verifying if `label` itself is NULL.
>
> This patch adds a proper NULL check for `label` before accessing
> `label->str`. The check for `label->str !=3D NULL` is removed because
> `label->str` can never be NULL if `label` is not NULL.
>
> This fixes the issue where the label name was being printed as `(efault)`
> when dumping the sysfs GPIO file when `label =3D=3D NULL`.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Neat!

Took me an aha-erlebnis to realize why it didn't crash immediately when
accessing label->str, but it just returns the address relative to the
zero base...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

