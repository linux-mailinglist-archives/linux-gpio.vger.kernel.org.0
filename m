Return-Path: <linux-gpio+bounces-7104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6BB8FAC1F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 09:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D175F1C213B2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 07:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3291613E031;
	Tue,  4 Jun 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUKzq0RJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AA20317
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486438; cv=none; b=h38IMngB99gnhHwtLIqCshv7x7X97oalviD8zEcSFN21fIn5HeHpDVxGCl0KC3cB3o72+eyd4QPK9s35IXcex5Jj9mx2xNLobU9KNSgGpDE+XV9vPrfPlJES/1pehbcqhGxLUjcyR5A+FCfPwiBuIXp8wxgNQrj3IrH6X8VmTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486438; c=relaxed/simple;
	bh=63arJkQCOYlkfbP4AkPTg6LPOUtE8BPS4VFMKo2GPZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+ba4OaLPN8UIzZ1RiPpUCio7aWPkJawaY+MqyjxzEJz4IonzbEcnzIg1adHbGahb4QIyoCx2P5+AC1Q9vo5nMFFa+SVsBofAbkMWHEBB900ejMAzrM8hz8eZYxItIqgD0EEbewZCMco0032awJg11K2sdmH9kO4IDXP23u7JcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUKzq0RJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a691bbb7031so205203566b.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2024 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717486435; x=1718091235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63arJkQCOYlkfbP4AkPTg6LPOUtE8BPS4VFMKo2GPZs=;
        b=AUKzq0RJD8W/hQbToZuKq83P/JE/+EB02sWxrn+1xojjMak+3kyHiuCEnHaeSpvsMa
         2RQ/Ph+yT8XS/s3HBEzXWtOrEpWuf0gB0pgKAbtl6bEE5Tagm5JqyeJpuohp6LwRsch9
         4uiobvQGK4NxhyWE/UMtpIlIxH2qK6YBPorY4bVjYQasRVY5b1GL/AMW6j91AIQrKoOv
         kEHHqcyPTOHjVmgKROEMFGvhAlvaHSeylbxdiBqGMUYVHACZWpnz38wzDevYnZgOb7tp
         bPu29ibusmceLtc8tHg2XDbgPQpNkHCv5Hc0Lrr3D59fGANS5mI8NLFDRc/udXnz1XqL
         2IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486435; x=1718091235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63arJkQCOYlkfbP4AkPTg6LPOUtE8BPS4VFMKo2GPZs=;
        b=d785c9/INGqWdoUsYoZQPyu0fIAt44m48KUYqApiNzVaHTxo//Aw7ViHfXP3FpOadW
         QfvJ2pePdzLqPOEziw95y2ElgaxoIkianGwsMk7m0me9ytn7s4bsLWGRQS7dvgAZzQej
         KsCKaSMcvJiE1yQzaeg2K4UbmgyUF5uCDK/n6myfDRTEKIOD6xvSykHx7uFF5tHvUbQV
         jRfclh3UtobGN4LykdVMmiH9CVoCjG1Hx60wiWtGE7EsMB/uoJaZkvrGiWSwpHw/84iA
         TyuRwyEZTc1lsw+H6qczFuiESVcGHYlquSkzWuEsCoh/c5aT+/gpM55zJ7mZPU69cbAA
         tbkg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbEuhAIpCJIgw+A307htJLTcsFES528k6woido1MGBfa3ruHH1h3Y5/SsDYdyYYMM/f+ArxrgrAf5QnjWzYLn+jxhTEEO6Bh55Q==
X-Gm-Message-State: AOJu0YxAQW//bR1QmmI/WxyUq8WlL2S7yLrGIL/MBYQs5UxmF+Ctg2dl
	IxqP/i7QLTOKVcAfUXjB2dGMlZHDLZdMo6794Py54U0wF8uceL8USQkXeggZa6vGFZjiipydUlA
	nGFqIqTzSQNG7iw/eK6b649xoptQ=
X-Google-Smtp-Source: AGHT+IH3X9mGKpMz3grrpIsRaadlUqGcu3CLGGZ/2DN7A7jiMQTxHbnBGfUvQpdBDtIvO/ROowEhGYnrlFAnyjMMrB4=
X-Received: by 2002:a17:906:3285:b0:a67:403a:4bf7 with SMTP id
 a640c23a62f3a-a682022f933mr904587566b.26.1717486434572; Tue, 04 Jun 2024
 00:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603181938.76047-1-wahrenst@gmx.net> <20240603181938.76047-3-wahrenst@gmx.net>
 <7ccb2786-0c04-4058-9ea2-e611deebf1ef@broadcom.com>
In-Reply-To: <7ccb2786-0c04-4058-9ea2-e611deebf1ef@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 10:33:18 +0300
Message-ID: <CAHp75VdjO5Ck8x_fWjzMc2mRdjY4eKkcdzTspHUmz3EYBCo-Vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: bcm2835: Use string_choices API instead of
 ternary operator
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, 
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Phil Elwell <phil@raspberrypi.com>, Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 10:28=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 6/3/2024 8:19 PM, Stefan Wahren wrote:

...

> LGTM but sometimes I really wonder to what degree should we invent a
> helper function...

The rationale for the messaging is unification, that's why helpers
like dev_err_probe() (for known non-deferred error codes), str_*()
choices, and %pt (to have time and date be printed) are good to have.
In general I agree that we should't become fanatics of hiding
everything behind the macros and helpers.

--=20
With Best Regards,
Andy Shevchenko

