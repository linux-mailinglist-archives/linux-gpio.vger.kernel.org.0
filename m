Return-Path: <linux-gpio+bounces-11046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E3994E86
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD55281EDF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B801DEFCE;
	Tue,  8 Oct 2024 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cYk2+RPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63571DEFD7
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393479; cv=none; b=iYIjWL6MGNPeE//HqtYh4eO2OYBI4WA4tKZVEMFzJfkQNlQpzrTNzQC2QDw21nhdnCdvqw7/Y9z+MlI6xuyz6o7XSeA+SSYlGhztcT3RXMZO1HTtEJ+xgyakksDQuBz7habSnum332Tf7wg1Tu5ozm2HMlg9ltC/oal0vjgXmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393479; c=relaxed/simple;
	bh=EGANq/H99c7b532Rkf91PqW2R9k7YoNWbn34s46mV7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEPaTosJpNMe9d1Cx0YJl53Ob6QH3Nsbk8erFn4Jqp2D/6JbZXF8+QMPo+CuZ98iwAd6F+Rspx0FQfWn/R6xdf/YMmevg3S42f1CoqtHLWD0JCspSy0YSIcAdIQopkPjHltEyu1nOxjC3SsvZ9dZVBcDARkQlz4RGVGQO9mgnsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cYk2+RPW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac60ab585so58952791fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393476; x=1728998276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JNItqgitHjW4huE5yE+YbWlpjB2xTlhgpN98Z6vzpQ=;
        b=cYk2+RPWvePJOe7CAxv9nrNXJDIIK77YWzS02zl2gAxPU8XeQvcaoXGRWe+RGNhLNU
         xchPdwjPrSjcLZ8dtinrZw+um1repbN/OOyDCt+JxkFrtc/z9nvNjL9e45KFWSHylzcV
         RXhV5v3fzShoXz7QgaVfRTxruQB8/kH9J/CvWiDutqBTFJUBnsbKNMBAATDWr0dmGjl8
         +mHIw//uvAi8peyLpDLt9hZDh5ksSqztL96ijzqIHK6OEKcn94Ux5MVdfyW4PCzCr6nf
         10rbBHMEqu2cR9CsQ0iv/ttwfnMqwnsH+zMDk7pnbkYaY1gLwhz4zpe4tOYjfG0BpCbP
         hRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393476; x=1728998276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JNItqgitHjW4huE5yE+YbWlpjB2xTlhgpN98Z6vzpQ=;
        b=kqFF/BGKtXUV5Ld30hrAI0urke7kl0fi5IY3xn3DjtxOH+/AqmDg/QYV57fHEuFLIC
         HNuz3U10oOzNcqESo4TTDJOtJ+DIqdOtb7uxRvmCW3fAIwm+REdQRXaNYncTZ33JSZBX
         irqeroAIegdX8yjcy0DWxD0LK8EZW/0BFLIIhsdw1oH3PknLuq5jRlpIbNKKrSZmfkgq
         /uyOWfwLl/7lXVgS9Cmx05x9CvJfFWPaZVNbJfw8fxfkOiJja3FpYMFjOmvoOlOA4wTt
         UV26gQeXjU1EvC5HttO7tZr83IQyvYdMUVyfUtfCpGXvSRPq9KyJwSdGu/IburLxR34h
         g7ug==
X-Gm-Message-State: AOJu0YwOyP/XKiLjkZl3dx7m46CFh5dOCMxJl5FaddSMNU1tQRg7OEg4
	qVfb1cmgUOQodbuEuinxxJTzmtPomDZVxt8RIzozpJ7kTl9p7RXpqq1yzgm0L/xFb6TmZnE8n3g
	oOsyK8P5OAtQMElCtnTMIVxoW5LDnWN/0F5+tyqztRepzk0xQ
X-Google-Smtp-Source: AGHT+IGsKW+JwKgIrpF06jafFToj7xD3H+dbYzgtWa0m/z9dgsNP56Abdi/FMhTERtDzmEHkN7Bhgtbd093DyQX+lVk=
X-Received: by 2002:a05:651c:2211:b0:2fa:c18c:faba with SMTP id
 38308e7fff4ca-2faf3d9d21amr74859941fa.30.1728393475944; Tue, 08 Oct 2024
 06:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-8-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-8-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:17:44 +0200
Message-ID: <CAMRc=MdkfSg_xtxz3khCTAuncimWhzu1phkrVWSA3QkJbWfJ+g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 08/22] bindings: python: annotate internal
 members of LineRequest
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/line_request.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpio=
d/line_request.py
> index f94b6b50d72486da1446abcda8282a8dc6d6e620..77d199ac64e9d3cc68d4a8b38=
dd0f571a24ab231 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -30,7 +30,12 @@ class LineRequest:
>          LineRequest objects can only be instantiated by a Chip parent. T=
his is
>          not part of stable API.
>          """
> -        self._req =3D req
> +        self._req: Union[_ext.Request, None] =3D req
> +        self._chip_name: str
> +        self._offsets: list[int]
> +        self._name_map: dict[str, int]
> +        self._offset_map: dict[int, str]
> +        self._lines: list[Union[int, str]]
>
>      def __bool__(self) -> bool:
>          """
>
> --
> 2.34.1
>

+commit message and LGTM

Bart

