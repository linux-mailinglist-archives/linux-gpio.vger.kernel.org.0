Return-Path: <linux-gpio+bounces-29039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415EC81DF7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 18:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 012433485B7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 17:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7B1239E7D;
	Mon, 24 Nov 2025 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZfMNV86"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429E22424C
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 17:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004937; cv=none; b=PlrGA5QvSbBuFST5ToTDeglkqWiNryCyFPSmRUzJoRQK0gHmW+ARp4s48p+kxthIw8CtJ4ZDtQ58NnTr3w4MQX4ihEdF2ZIRT4bEugeLfn5ZuUeblInyy+vLs5KSzipnneDvL6YDxh/qRIfECE653GzPC+MQ7bdBYSMVWDpQlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004937; c=relaxed/simple;
	bh=bZpxwxVUi3Yu9Xp5tgpTDN3djeM5sWGLN5I4BpYPP84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ch17dxxbHRRRqPLMKrO3Winm+bNSdjDguiI9uSeaeQiqkeKhLkp9JYMF4M1kM4OkwJY8r2QV0MD8QIRGvynIwrsu7m2GXB7VyBqT9b+B7ezxiadRL575c9jYonaR4bheZnjC45sBbGY+Fsf8RFozTs2CSI8FCvZ8X54qcPL1LkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZfMNV86; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8824a756771so53382916d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764004934; x=1764609734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=KZfMNV86lGrroT3A2k4PSTjO4MI3foYAYqP/ONRtUw3Ri7UjfcL7HYU3kUD8IkC3ae
         AFoCO+s0LvidM8P6kO1jrxmJXWXlRr3CoTYkF/Iip42AvfmNMT3cnnbHx8509cprmxkv
         mAJs6EGSO+DptVDd0vJKAw+o19fb2sv3DPjykKaM8FQa+ydK6qD3zhFZPjMMEnBfY8JI
         xMKuitfHntivzif/gQ7DHJj3FZghYf2ffT3wxuXULWEi2OjAydf9npO+0wuYjuQKGBcQ
         kILlT4ysXUphVm7khYl+99pKnmuozccqMcDLYJ2Ie/Aeix5wLSpQ/ggV0zHk0ZENypLV
         I1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004934; x=1764609734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+dXzu+OtwVQATYT2SD8WXaq/eak4pH3LzFk0SdSmXo=;
        b=VgmVm/72CPKofAdZaRde9zoT18yfX/sxd4hWXYapcaXpzm/hhVO3hL4SqRpklu13vg
         fZ4bJLcQ0WJfFhSWmn30Y45HJwLXKLp/pJKPc0rcRjlfJo6JmqpZO4CfZhAGJ0g6Aggs
         yz28qLgoxweKy6qcvfC/nln6D/Z2vWlYm6bBAv9Jkks9m6ads1tIRh+BuJSlNbdj812z
         GN6VbKuyP9xWg9pyB8Bw6zl0BveqCB/peCtiqf2S6LtCIo7AcqogWl81UBb9wTrpCTlF
         yuXkIFAFiYrNk4jGnX91h3tfqIlHwZLq/mdFJ20105WF6E2yIhnPyNlM5evHYbj74AoP
         COIw==
X-Forwarded-Encrypted: i=1; AJvYcCUtGIbz72npW6HusfxHGu3A8DIlD7yJakAoUXyE6aFiFUipvkNzR8FgrGx5Pcr6Zb7JQerEIjO94CSp@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZZlDtLxW9/2nPBqbrgkCbEqBVstbR9Cqc/Ur0R89wljGuNI2
	QSMTcaVN+4EsDHR+2VuSPuwpOiGyvcidknrdyxEV3M3gd7bWZ7JOZ0gfi2laeMS7QCyKIWvQYoO
	J6PD7gun5x56wzj5m4KDZvI7FYkivnSiCv0wNgA6t2g==
X-Gm-Gg: ASbGncuATS2DJYi24lPaaZasvu/VNFIDq46XUqnzHZr9MzUJ0NKw5uwPeu84bMXt5k+
	UA8V4rqwEJ5ZzvDYkXp77KhctgHxiqbJ7+/5cT92MhuENTOpJf4jJdEwootzORuUuutLm1IJZal
	yOQnGDF465U4QxKeFqwz72KFYB5sx0dcQTg/j8Ya2kjJJ0DkBtLbIIXyQaUA6UDQaEeMiLz/6vy
	TnixG44Yp77qRWykbtX2jlfA3HcluKRGaorvJu9dtTutIlG4ndcjNG4qkYLl1Ha8R5jPWk=
X-Google-Smtp-Source: AGHT+IGur7qIOhwydiDE1YdricdgFBJKpzAzcrVA0e8HEfbCvBR/llLvZ/uw2OutwktsYwyQUs0eBjA/3PkYC9zPCKk=
X-Received: by 2002:ad4:5e8e:0:b0:884:6f86:e09a with SMTP id
 6a1803df08f44-8847c440274mr206409366d6.6.1764004934295; Mon, 24 Nov 2025
 09:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251117073604epcas2p3f35b42617fb26aa087409eb84c19724c@epcas2p3.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-5-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-5-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:22:03 +0000
X-Gm-Features: AWmQ_bk4g88xYV4Wotp3KJG1hjaYXqURmaKu-TssPY9mMy-anug4aQBTum0eDz4
Message-ID: <CADrjBPoG_omRShNhwUJZ0yeRLAzQxmGHvO6OzsR2NOfLczoptg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 4/5] pinctrl: samsung: fold GS101 pin-bank macros
 into EXYNOS9_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngmin,

Thanks for taking the time to do this cleanup!

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers, but they are
> redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics, including
> the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and switches the GS101 pin-bank
> tables to the EXYNOS9_* helpers with exynos9_bank_type_{alive,off}.
> While here, update the struct comment to note FLTCON is Exynos9-specific
> (not 'GS101-specific').
>
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces
> copy-paste drift and keeps the FLTCON handling consistent.
> There is no functional change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)

regards,

Peter

