Return-Path: <linux-gpio+bounces-14369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9449FE916
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 17:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6631A1623B0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 16:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B1F1ACDE7;
	Mon, 30 Dec 2024 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dun2woVh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF08F6C;
	Mon, 30 Dec 2024 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735576945; cv=none; b=izFuMmwRrcl+ykUDOLlLcUsnCb7FMmfT0vQCcdMxWGGHoPUlSIJSsNSO2qocNZaXbZguzFJfJGnCIN1P6ESBtB8Xc+7u1n5QqWvvLjJzTVKpdRC4TkkOTMcuqjpi8aMJYE44AWX83UrEFIqQMCsukMuOLXeQAsYTdAtPJDGDUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735576945; c=relaxed/simple;
	bh=4ApougGdsJ+4siSLghLo644Lsa04UbO1d76F+UqYbIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl8Zf/CnisjJuso06qJTn2HrpNAxkb5DFrA1GUOHe5mZwug+aX8n2ji6tk3QAd3TUcJ1HLbMuHH5qw7Vffa4R2dEikvuTDSFBPukOKXjwdtlAfohAfnNYNckP5GTbvjnH9lbDxDFpbCUAY8WC5PLY+a+UQK5hMIA07QARxHB62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dun2woVh; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3983426f80so11346445276.1;
        Mon, 30 Dec 2024 08:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735576943; x=1736181743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ApougGdsJ+4siSLghLo644Lsa04UbO1d76F+UqYbIE=;
        b=Dun2woVhJr1A137C4U3O904ubz9tYlMpswndXomQLJThsFzV3HaAc1geGUFSgugTGo
         BYAMp+Dv1QgGVFtC21Ckbw1jQleV9cDl3JzI+Dy1zhTChxR4aH7lOgCq+GZ3sZgYqNDZ
         Bg/7mIC3OgsxD4PbXV+g0VRvvO8fiD5uKHH8An2iHASFp04dokAjkcZemX3Dq7vlNop7
         kOgfM+yieNJ2EHl8EmA2Et6b0RtI9o6Odl581ljo/n9RgNXmPg6Yju1orggNCk1DIbpz
         HHGISJHAyKnM4W9uvFhNixsxK05PdJZ+YFrDyN9gCQpJs95ce5WyCvX7AdQe+spUPQTv
         ZXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735576943; x=1736181743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ApougGdsJ+4siSLghLo644Lsa04UbO1d76F+UqYbIE=;
        b=NHrQThoEDH5OEMHPVmFtYl9Vm0EyOAHN+X+zyryQyo+qdn9qzEgk12dHVnKWUTZ0+s
         BzXPxJh28GsVdGVOC9HYFn36GcUDTLIcZprU9gc219bIFhA9NyifPhdVDpPXQDhYKyGR
         1372QRgXazCCY3RP3Y1r9zDOojnyp8vFtdQmvjZCJkOR6SUQ2aU+hJSKcmys8+7fvQ2R
         KML4TckI7eJivxR8ap0AgnrqH8UZl30SlnGHyr5fzCISv+TE3XT0uBXt+lfyNgQFQt1d
         4K4WyTINfdrrBBhFjiWWnZEvIbNN6XXQ820W9xMS7ud/0Bj88o+HC7TfQe00hqOzkb5e
         6GmA==
X-Forwarded-Encrypted: i=1; AJvYcCVoVCiRq50NPXa9xDU7pjHFu3Xwlgjbl714d8Evej/8EM8X2AhR/f+ecd74lpwjE+5EtYOhfYcaYupKHbC3@vger.kernel.org, AJvYcCWZo9SVQdINuRDTT/1kKmN67CF7PyS7vVVkuTo8jGqw7vS48CwklNefQ9tez1oY1u3BzslYPtjSRmNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXRMqwRkpdMr3BsKhnhtUkqhfSsWKTFeFRl/Cfs2ZIYpV09m4
	AZ5cwrLapWs642EqEUg3HZmpAIbWIebsLI7gHB/4vU675mz1iqT0XLCL8LeTsWrBF08XmuZ++aZ
	Ga3JjhRXh/E+lqhKqGm7eRPPCIT9WzhLi7/u3JA==
X-Gm-Gg: ASbGncuPzJnvMbZW2yGaWJ8yk291GjCgkfp67Npfe2kWM9GC+EGNejgDHeGPe0iuufd
	a8h0n39xSv2BDEMYBsBTd5bLLKA64mx7kICN0iB0=
X-Google-Smtp-Source: AGHT+IFZB/Cclu5u9qWUBqFFLiDBQbIqsHahp9w5mN8h30rIICtjNIDGBZAem7mUlHHM4qhrHJZG/E+2BjBqVFS3wKU=
X-Received: by 2002:a05:6902:168f:b0:e47:4bf7:bb with SMTP id
 3f1490d57ef6-e538c34e705mr29923339276.41.1735576942975; Mon, 30 Dec 2024
 08:42:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com> <20241224103645.1709996-1-noltari@gmail.com>
In-Reply-To: <20241224103645.1709996-1-noltari@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 30 Dec 2024 17:42:12 +0100
Message-ID: <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: linus.walleij@linaro.org, kylehendrydev@gmail.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 24, 2024 at 11:41=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> From: Kyle Hendry <kylehendrydev@gmail.com>
>
> There is no guarantee that the bootloader will leave the pin configuratio=
n
> in a known default state, so pinctrl needs to be explicitly set in some
> cases. This patch adds a gpio function for drivers that need it, i.e.
> gpio-leds.
>
> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>


bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), which
should automatically set any requested GPIO pin to the GPIO function,
so explicitly requesting the gpio function for a pin should not be
needed. Is this not enough?

Best Regards,
Jonas

