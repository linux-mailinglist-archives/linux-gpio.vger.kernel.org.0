Return-Path: <linux-gpio+bounces-26434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA2B8E39F
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 21:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5744F3B7DF8
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 19:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C11D212566;
	Sun, 21 Sep 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIMP4rPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502E19A288
	for <linux-gpio@vger.kernel.org>; Sun, 21 Sep 2025 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758481454; cv=none; b=FttKxMuy/g8En/8P5iCPMgmNBKEOk9i+Mx/8ohX/M8ylTfICE2340QBaOlYBGzjHl+z2drIB8twSrDR3YkTBue4qiJDM9+h08w8ylkiTfDseDlS5l/VGtHouvOlpfVROLTEz4icfYxsuYzRc3WUOAdI16Ltg3hbE9er+cMxFSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758481454; c=relaxed/simple;
	bh=BJPFF72dsCJl//Va5XHokThLKW/b3to+vIBA6ac9V2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWCnRtHxf/PIdOjL3v0Riv1Rl42BENIm9rjsq26gMMgtoemzpvVvAmfzzDtl6DndLb60ZG3u/9Qc1ymShbwiKCyQidCRHk5jcsE9NzzB3eb8ZkCH3YVU6fMXvR/bhiDzFtV8tdTX/zMNk44Xyyr0y95nNhfhcdKJJq8KKOU32kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIMP4rPw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b256c8ca246so437842766b.1
        for <linux-gpio@vger.kernel.org>; Sun, 21 Sep 2025 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758481451; x=1759086251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HTjUfL5kki5kMB1zvXr2jB2trY+d+4aKWapJKFWTs0=;
        b=RIMP4rPwyFlireRoboG79/sRAvOil2ckCejtv1XrYW6gqA+AoXfAxHjXQUfV6UuSHN
         AfGyeomhHGQQmKSxYhOZaIKc40KkAzNXBteWAcxQ/f3djJPkXLNidgTAv7tC/QR5bIYg
         o7qLwizrMOTEtJaLf+zthVGbmPwyZLK6q+2aapMAOGqMVt7kUlQ4W31K1DQCM0M67Gct
         tQt8tyEpbs4zzFVQisAiQPrHCOrNZAWJcNSIz36kfFmjk0FsfLFSlCM0EfafGjR2Fy0d
         WbwC6M7ZA9ysB+5ilpZjbwYR82VTAx+u6ANfddfa7rsOmQiKz4EFjVrf0fgUGn5ABn4j
         oGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758481451; x=1759086251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HTjUfL5kki5kMB1zvXr2jB2trY+d+4aKWapJKFWTs0=;
        b=fNDlLWK4Mgm3KkeXeOiJeMvqUZR8I+tuUAvWwU4I6SN53YtBIAlUoOVE4YTNBKKjFo
         hEOqj3V87JQE3DXn9KZzW3UAsseC12pHjElHlagdBYT0nz2OjDDq98vC8HudF8PdbqaF
         AGOj+mgwSV2VTT2mnGfdm4+4Kx7YoyCDiAuUidKFOStgU1negRPRqja4/bTaQMRvXc0c
         6zF9GkqDriO3lxBQRsq7Nu+3wlno5o6dWOngzQg0PlEhPjvBfTz/a/tmYtL6IOfSWb6V
         3GJxe7M6a0NeiD3F6iZYmAPt8klC8em7hDshG7F4BtVFeo+HLQpVFX7cPxY1sbAuv5bm
         jnnA==
X-Forwarded-Encrypted: i=1; AJvYcCUOk5XmMywgUgX8tcDij3ZSIfZPC2Q73ZPnfIntIONMQNKR2oO6RGHqSThXt4aZIMewPLNFSglZYqGp@vger.kernel.org
X-Gm-Message-State: AOJu0YymyGrvp+XrV0ZKNBN/SdsBoi3K3LYCCpCg6DqntU13pmN8iX5x
	v0xo0WS33LXiCu9zEejTFFloqgHOprGPzWr1M1jXEeVMXYG8/MVnEOdneRsaChCRczcKyhBu76X
	0IyRX/G09kRVPOC6wtu77tkvYph9fs8Y=
X-Gm-Gg: ASbGnct6ip4Evd/Kr46FPjXOl6qhFpQ90mIkklrV1DkDHLnLJ6JM6iN6vv4GMt/HOec
	mRhLbckhc4ABtmOjHHg76W33u44Qn1WMwgoPM5ub0xLUpjPuca+r8JnjXZyjzdGKvbE5/h3lhtQ
	xDyuRMDMWzn+l/mnflNw0u7RQ5uSu8hFeqGCmm0q3zcbEnJ6K7tUDhKGDkk4qFSQkfaOmF/fFUO
	hKn7o5nUVKuQogMJg==
X-Google-Smtp-Source: AGHT+IHBSnpMJcWk6XkKtG6y4uHFbhdXqxkzUnTU5yVuXt4gqaAGYKj+uH6Cnq8v6c/a2ZttHmoR79jp+2R7muQ2PIc=
X-Received: by 2002:a17:907:3c8a:b0:b0b:f228:25a with SMTP id
 a640c23a62f3a-b24f7f1a36amr1039680266b.64.1758481451396; Sun, 21 Sep 2025
 12:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920201200.20611-1-hansg@kernel.org> <6d9e13e9-1e93-4e39-bfd1-56e4d25c007f@kernel.org>
In-Reply-To: <6d9e13e9-1e93-4e39-bfd1-56e4d25c007f@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 21 Sep 2025 22:03:35 +0300
X-Gm-Features: AS18NWCBhiEjsWPWd83UV9lSxsFOVR7Ya2wWnCbsBeeXYvaqpUaLo0Egqw1SSbE
Message-ID: <CAHp75Vf-MMcVGDt5xAMB94N866jZROQPKpvu5dZ-nCEPA9j-pg@mail.gmail.com>
Subject: Re: [PATCH 6.17 REGRESSION FIX] gpiolib: acpi: Make set debounce
 errors non fatal
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 9:09=E2=80=AFPM Mario Limonciello (AMD) (kernel.org=
)
<superm1@kernel.org> wrote:
> On 9/20/2025 3:12 PM, Hans de Goede wrote:

...

> Looks pretty much identical now to what I sent in my v3 and that Andy
> had requested we change to make it fatal [1].
>
> Where is this bad GPIO value coming from?  It's in the GpioInt()
> declaration?  If so, should the driver actually be supporting this?

Since it's in acpi_find_gpio() it's about any GPIO resource type.
Sorry, it seems I missed this fact. I was under the impression that v4
was done only for the GpioInt() case. With this being said, the
GpioIo() should not be fatal (it's already proven by cases in the wild
that sometimes given values there are unsupported by HW), but
GpioInt() in my opinion needs a justification to become non-fatal.
OTOH, for the first case we can actually run SW debounce. But it might
be quite an intrusive change to call it "a fix".

So, taking the above into account I suggest that the helper should
return int and check the info.gpioint flag and in case of being set,
return an error, otherwise ignore wrong settings. Or something like
this. In such a case we may also use it in the
acpi_dev_gpio_irq_wake_get_by().

> https://lore.kernel.org/linux-gpio/20250811164356.613840-1-superm1@kernel=
.org/
> [1]


--=20
With Best Regards,
Andy Shevchenko

