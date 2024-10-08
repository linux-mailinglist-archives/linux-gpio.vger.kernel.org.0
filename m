Return-Path: <linux-gpio+bounces-11049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 140A3994ED0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6281F21D34
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF961DF991;
	Tue,  8 Oct 2024 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xziEe2/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7D1DF977
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393665; cv=none; b=PyPbCO5+/vbimaLBehQU/W6F+Tz9NU9NtXi2HUOY3+GcEJVbwcrVVllsvxteK2uYP+zenpfZ+TfCK3Tn5AQv8xjqrTpyvrhVSxAwApGMhz5iTMFk+nuP/cRCHf3FnnuC+w1FwSkbFzA67wrTyZWARLoUAuJx3iL47ingfEYkJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393665; c=relaxed/simple;
	bh=1iN9YqefhI1D2t3L2JaCID7NxwMvegjPA0optO6OLaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciu9owZZF5PZdpCupvqgZblpMSfTym8SvwrLB2pS7kj5vtO+I0Ix27dNQ93V91MUJXhhkmJOkCP25pCvq+p+XFqtaESc90qHtcE8wqO2453zQei71HcKGlz2yVEN3fODY4x7oOuWkX8UwAPo61HDqfeH3OCHffpzZTrjkoTk2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xziEe2/Z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53995380bb3so6788454e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393662; x=1728998462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRQg/pYrM688ibfX4+Ttc9tzPXUxdeUsu+DwlPsYUOU=;
        b=xziEe2/ZAeyFWH9mPtR9u4AW4B4enFmavmmbFi95cXYLLcGze2qNYpldxlZpuWwNcC
         c4+Dxwbm0DNoO7ZFQ2YF3auQZ2oIX0ad3bsrf6kCheNeWsXP1o4u7AogO6tZFKyRK3tm
         NvBZ/3KN1/K0//yRP3RsxE7hxGMRtRv5c/f/5V5JBqXDH28I6lTX7rpANC6MxEmwOpUM
         /DHhTwgwUJnVopS7LNsNCA5jNt/EJIDok8UqAfCDFbnCqNirz98jyDFYDI8Zz59QW+al
         iias4CcVqfRitVCkEQhasrK9gFmnpjsYgJdKptbPH2+ptquYcxxlTgND8qJewn0nRwn1
         Tp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393662; x=1728998462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQg/pYrM688ibfX4+Ttc9tzPXUxdeUsu+DwlPsYUOU=;
        b=nbLNgd3Cw3WYunoP3qi5UBlcIf2YAWvdpIIAwFr9yhKEwZXuC21XudcCFbE0pwPB5s
         ylzOVh1ff7Rbw3DsL2vU25FnTMC4yGXvCxXQVAn6mng8/b7FU8uM/MGj9m7n59rvPTJj
         GqQueHjQCQGCpuL6i93/gYCtXGdxDd5tNhbEclQBU/N104BKJNjVQ/eRo9ehxG/2tD7z
         0Xqmp3YFBtZAoyH/YC7KlJM5kY2eymiP93Z/ss+f08dSek4JRhuEwJuf5FfFz79jXrm/
         KADBedzBwKyQxDgi/C6BXbIXn5UP2pxYzsTK5NVnpJqP4wvU+SKHy6pWsHjE+j8HKS15
         a3cw==
X-Gm-Message-State: AOJu0YwqKROEeQCWXQpxfuFbP92svlX+D3uSPtjM/qrNkkV3CpzG5nbN
	60Klb1EGDUN4KjYfr8zMNkAEogWmGgbxywxW6v+Ye/gHfDF5pWdBoRj5zeHYaG/ACaGletqmz6V
	CLTSNgyMOid1QK9Q8jNxgKBCAbbmiyFpiiaIz7w==
X-Google-Smtp-Source: AGHT+IF9EqWsDF8Qkczulsz9uqCEP2Moigmnro4gP+uLVn9yuZjQ5vMMGNf3KKW09xMA+PnHU2jF4vBKCwWyaIu7zm0=
X-Received: by 2002:a05:6512:3094:b0:539:96a1:e4cf with SMTP id
 2adb3069b0e04-539ab88c39cmr7781096e87.32.1728393662069; Tue, 08 Oct 2024
 06:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-11-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-11-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:20:50 +0200
Message-ID: <CAMRc=MeUbc8eovc2ZwhSvONbF4i=x86MnTbeA13S9eJkavztng@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 11/22] bindings: python: cast return value of LineRequest.get_values
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> The `values` argument of `_ext.Request.get_values` uses a preallocated
> `list[None]` as a buffer that is populated with `Value`s by the external
> module that are then returned from the function.
>
> Use `cast` to inform the type checker it's a `list[Value]` despite how
> it's allocated.
>
> Also, as `lines` is typed as an `Iterable`, there is no guarantee it has
> a `__len__` method. Instead, use the size of the `offsets` array to
> allocate the buffer.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/line_request.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpio=
d/line_request.py
> index a1ca64cfd82c32be5de3fc53f6c981026911bb9c..917020b9ec7046dd8e10158f7=
0efb555fc87eade 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -122,7 +122,7 @@ class LineRequest:
>
>          offsets =3D [self._line_to_offset(line) for line in lines]
>
> -        buf =3D [None] * len(lines)
> +        buf =3D cast(list[Value], [None] * len(offsets))
>
>          self._req.get_values(offsets, buf)
>          return buf
>
> --
> 2.34.1
>

I think this is the first time in this series where I understand what
cast() really does. Looks good.

Bart

