Return-Path: <linux-gpio+bounces-25261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A3B3D6D9
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 04:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2783E3B6491
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 02:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D2220FAB2;
	Mon,  1 Sep 2025 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDFK9zVG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BE610F2;
	Mon,  1 Sep 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756695369; cv=none; b=kA6wiNhHSvYm1+1faTq+gqeD1J53JFjh/LP1wpMHzbN+v3Ubwwp2cMv/CcIzpbLIr1CpNcHQj++2lL1ekCRh7OqybaWuOrBVKtnCeE6iO26HC3w2yzxC+7e1wpTX9KtdCmNNEj2Q53mrzdbY0DOd++odadxi28vZv1EGxp/wdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756695369; c=relaxed/simple;
	bh=PmewVBZ+ucHRnuv9jxcTPx5wY8ryXlkXK5HxMfeMbF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZaxuWbcZyjJgjnsOQTv2/j+A/LaVg/LL0fUfM1Aw1WHETKsZc1GyGB83FLhx2qqFGys+GZi7RW7kVk6vDpeSOvcs1GFMkROJ42q/6Q3jLfpO4rAFuFZoj1tDh/sbZ+hMqgcyCEL4Jt3P/Qz/U8ntlxMdwbHDdvpwouclnu9v+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDFK9zVG; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54487445158so913398e0c.3;
        Sun, 31 Aug 2025 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756695367; x=1757300167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmewVBZ+ucHRnuv9jxcTPx5wY8ryXlkXK5HxMfeMbF0=;
        b=nDFK9zVGlUG5LF/L+nlPKECwWD3ppuXnCvVUq/OiD58B3bYCShGA1xOz64weSU8jNx
         EIhVJnvVeWGArtQFgvoyHkoCN4cgCMrC6LWoJ5KCGKkxxThWzYhQWv5QA+tPzQngv4J8
         tpplUSSIHA0lDCzt/1vuBszvya59Xh82ShzDvlhQNyIQYf2DqWNMfuiUZobjAKK2i53m
         TiuRbvi+kCekKK0/I6t1z8FEV8wKosJgxUwkw0LNwSTUKMeT6spNVuzpYEaJSeNrde5E
         FzEjtqV/5BYgjiu9S9CEOr8wKpYd2EMiq/2JojyHNe0mTPZ597T+/tSmCjtnXNU+eJD2
         LmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756695367; x=1757300167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmewVBZ+ucHRnuv9jxcTPx5wY8ryXlkXK5HxMfeMbF0=;
        b=qJDkxD2z1fVAe3ZYlCsva9SMTdN9aRxySg/hgLfrTViu7xL9uR99ic8IarcqGP85Vf
         GpjAZdLUMGMT56aHhdAms8nwplXIcXvbfgYOxURQI1zyZ0c/6rPpt/BY7Vp6Jsir7QBQ
         zfjPLdEpMkPhg828I0M93Q/86nIsPT/rjVok7c1zdAHvz3G3XThX5CJg/j2lg5PAiKsy
         86O0UUNH4of0tkKWsJF1YXe/jQ0a3DYG00cl/90gGgc88PNNqlaO4BJfKTMn6fm/UL9z
         RISDJh8JR2dI1WU/7E7QhPYDbPESJEjktOy1zSR1MewhKGo484jxIYEyrj/ToYLCIrT5
         P58w==
X-Forwarded-Encrypted: i=1; AJvYcCWHTJQhxAGf2imh/5J/UVi3Xhw38LxyD86qDK1Zz6KgT7p2YbuEW6gzO632HJwX3/bNb9mU8rOla2xgwZMN@vger.kernel.org, AJvYcCWf6uAUBy3ia2Tk/6UmYGY82mOy3StDr/c8vvFfvARnD0ucMyKElGWhpaDPa81/oY/8veeadfd3N15c@vger.kernel.org, AJvYcCWnN251zruJqBBIDXtgDL6VJhmE8ODXIgUCgvaTN3AxurC/I0zqpawGdEKPDYjdPqc1oLQu03bE6s2QD+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBU5cqgoOAQLabS2idftTZZRTGNeuRqZ6jTe3WI7VJwdOCzK3J
	qyQSvmv7h8rCRCr1XB0EzYDDqIqkLUEWilMPoY/PkxwvBMK46/BP1Qr2p5fJLUeyun9EKHucAUD
	pQLt55Tty0nZxes76ZIUnZI+JXJHi4o8=
X-Gm-Gg: ASbGnctuEpxEawaKLUBK3uFhAvRlZ/hX9fIAnOHYER3n7vORNi+zJSP4dn10U6mVi7m
	niG1A/swYgChzVvA/h1TB0u48qoLcNwUAaf5kgVe/n2YnMAi9290N1NsH5Xo0lUWyBGJIdm8EPv
	eUNDSb2YtDgG0cTD/hztEXUsD5rdBl5Bju1AUpXYGlPVF1Qd6OfmYbqsCu4RBEh6gDL1AEq6958
	qPuT4gUp31bNJARACGT96elq9ShHPJj53Q0cPA=
X-Google-Smtp-Source: AGHT+IGobaK+q3RUi/OA10JC+T+4OfjWR7pLORzFTtEml7V6OwEJ7QsO3zMWtwtakawBUK6DStwTfJ6uzLsKLmEJlo0=
X-Received: by 2002:a05:6122:8c21:b0:541:fdc4:2551 with SMTP id
 71dfb90a1353d-544a01d3574mr1426719e0c.3.1756695366911; Sun, 31 Aug 2025
 19:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831030855.957707-1-alex.t.tran@gmail.com> <CAMRc=Me5L4XtriaFSwcE9Vqri+6d+Rfn-4FzKUrN_VSOgfA_WA@mail.gmail.com>
In-Reply-To: <CAMRc=Me5L4XtriaFSwcE9Vqri+6d+Rfn-4FzKUrN_VSOgfA_WA@mail.gmail.com>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Sun, 31 Aug 2025 19:55:55 -0700
X-Gm-Features: Ac12FXxp9jNWlJRXltqiLXfLh0CVzev7UmdUyV3I03fJLpPIa7QDc_Mrq4p9PY8
Message-ID: <CA+hkOd6UsrQWbLRPOMyUPLBoytFa_6zew05TRuBEhMSr4T1afg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: tlv320dac33: switch to gpiod api
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linus.walleij@linaro.org, shenghao-ding@ti.com, kevin-lu@ti.com, 
	baojun.xu@ti.com, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 5:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> The fact that the call to gpio_request() is still there made me think
> immediately that the conversion is incomplete. I looked into why you
> didn't change that and noticed that the global GPIO number comes
> through platform data, specifically: struct tlv320dac33_platform_data.
> That platform data struct however is not used in the kernel -and even
> the header that defines it - sound/tlv320dac33-plat.h - is never
> included outside of the driver. Seems to me like the main obstacle to
> completing the conversion is not even used in mainline and can be
> dropped?
>
> Bart

Since struct tlv320dac33_platform_data isn't used in the kernel and the
corresponding header file it's in isn't used outside of the driver,
I'll go ahead
and drop them and send in a v2. Thanks for the review.

--=20
Alex Tran

