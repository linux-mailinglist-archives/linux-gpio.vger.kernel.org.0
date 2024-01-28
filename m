Return-Path: <linux-gpio+bounces-2682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E883F62B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 16:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6059E1C20BCB
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 15:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F462561A;
	Sun, 28 Jan 2024 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YloWInVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298E2DF7D
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706456997; cv=none; b=PWTI0b3ijLs9sP7TzJgX1X7y1yOwBlKhka3fB/fM8VAehlFl0xEX6cg9DDBEgznpGjSaNNQ3REW1ZqhE0QDHSMGS9bCYZWhtKnBzNO5onzb88HfvO6F/f3anRpR1q5BJxx5ZoI2NtOzmv7z7LgyZjUYheVENOaGcBt8tM3XwQxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706456997; c=relaxed/simple;
	bh=b9YOMazdycLIyx8go7JhQ7ohEA+spjOnKg86jFJ9vGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBShFxAJE2xFpT6HhjWb2RkHnMJEQiIWPM1PeqoReonzK3dI7SyBFV8aw0x+eqFL/V9Y3PLsaJrsUPj2CA2B3ruyPPF3GL8vqg8soNQYTWcUcXzobF2rp6PqlswJW5oU0QjSyhgmMBWXUjj+8E5UjjxHSRYHmS2otysCgF19j00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YloWInVu; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2135184276.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jan 2024 07:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706456994; x=1707061794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0ytb2PS1JbjjM4o7VAyC0Cey5FRxMI0Z/urzxWn1E=;
        b=YloWInVurMqV0uCP9OF2WZNs+Lp9fsWC3kSNTxALfD0J9liZih1XGjw1uPN3XfGg2r
         xFQMeqtqe+Puv1tMzkLlLCfeTKfo1T55aKnkAPh88YcHXvpuXkEYzdgjfCfQLbfs33E9
         oD0EH+NkzXAFJqYp0rZMYUoNUrkXRUfIilxBata0rd0rjZqiJXpelc4lqFtatYawa9vI
         qXbUCBZxNa2ppRWaQGAm5uGHcA1brGS7SM5lR5+uVl/JWL7noyPB/A6g4QZbtXetk2Xm
         TtTxO+LnHqHxDBhepxRN4qv1w015fTTmf2TTGOmMgSjatFifay+uD8O/4AreQqxJ8U5q
         F6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706456994; x=1707061794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi0ytb2PS1JbjjM4o7VAyC0Cey5FRxMI0Z/urzxWn1E=;
        b=VtVh9E30B/hN+5NojRGWCvyJsoRUvDpNr2ZY90BjW4YStGdggPPSK0IyvHCy93G10m
         C4G9yGJApDKlYecCZbvks2xMGQCbxp3RqKD9EKrjc0hwliNlKOQlR9cW35M8KNgFRDyL
         nZi2VikVP51QS0juVZ0ske3FgSjtFIfgnRc/WvrBgcPXQIalE1EAexfriwRoqsjVbSXF
         pr/a6H8gUmbw0qh6EcevuzUshZisXuT0TD8UBHCOFp4G1epCqBNVumMD8FqEeD69OBOF
         KlsjNSrxlTOrejwywUOgN/Wt3D9tlJPqdh3U8SA63oQsqJe9WBc1qbBhhrhRMmOx/jBa
         pXwQ==
X-Gm-Message-State: AOJu0YyfwA4fUyU/WaWHyqIGOeiHfUI9T4cmeuHOc4HceeDkut4PETGV
	qKuzjcX2HFXJTdoKv3ZFA3CtzN0jc8y1JQLeU3yeNF3fC8KczHjL+CS8ZBnImdl7QT4sofArqWP
	9mo2WhsEqAuldfwG28LUjSWZxm2VBRf44DQNw1w==
X-Google-Smtp-Source: AGHT+IGJWMQydQjjqGuMPg05Ai+wt32rzyv2gomooaD3rn4+LJmjeir6ImCczZPw+dWTd7x/1YV5YVnQnyEGpklyaLY=
X-Received: by 2002:a05:6902:2808:b0:dbd:ac60:bcd4 with SMTP id
 ed8-20020a056902280800b00dbdac60bcd4mr3313016ybb.75.1706456994245; Sun, 28
 Jan 2024 07:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123080637.1902578-1-ychuang570808@gmail.com> <20240123080637.1902578-5-ychuang570808@gmail.com>
In-Reply-To: <20240123080637.1902578-5-ychuang570808@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 16:49:42 +0100
Message-ID: <CACRpkdYi-y9zWAR71rQOtKVJOuGgE4n8Q47YXZW=Pt345UWDkw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver
To: Jacky Huang <ychuang570808@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, j.neuschaefer@gmx.net, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ychuang3@nuvoton.com, schung@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacky,

thanks for your patch!

this caught my eye:

On Tue, Jan 23, 2024 at 9:06=E2=80=AFAM Jacky Huang <ychuang570808@gmail.co=
m> wrote:

> From: Jacky Huang <ychuang3@nuvoton.com>
>
> Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
> add support for ma35d1 pinctrl.
>
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
(...)

> +       if (ma35_pinconf_get_power_source(npctl, pin) =3D=3D MVOLT_1800) =
{
> +               for (i =3D 0; i < sizeof(ds_1800mv_tbl) / sizeof(u32); i+=
+) {

Isn't this equivalent to:

for (i =3D 0; i < ARRAY_SIZE(ds_1800mv_tbl; i++) {

> +                       if (ds_1800mv_tbl[i] =3D=3D strength)
> +                               ds_val =3D i;
> +               }
> +       } else {
> +               for (i =3D 0; i < sizeof(ds_3300mv_tbl) / sizeof(u32); i+=
+) {

Dito

Perhaps more cases, pls check!

Yours,
Linus Walleij

