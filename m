Return-Path: <linux-gpio+bounces-3267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F005B854632
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACFC9292F10
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B02014004;
	Wed, 14 Feb 2024 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k9eS6af2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5013612E5C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707903353; cv=none; b=Rtodx9m3GJwveT3I4pYFI8zi44h3speWpTWVjnxyc3cmuVR3B6JRVsAS6CVKNw66wDA+OIBFvYfnfNiXfhFUGmK/JoB/PkrotdFiSLW9l3eCaxUyZQBGaiEIoKb54yyeis+tPanFk/4PegOhEAZScYRrhI1wouOC7gi/Jn0VIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707903353; c=relaxed/simple;
	bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f85JQPvESLcpZIRBwIyD+1KahGeuH/Vp/omkf0ujETTXZy0s04UDg+iUNAfG6dWYMJBkYmvouj6l03ALwHrFO0BQDgOfbywIuRCXmHE9jx4CD6dRHeQe4+UCCtGrkDaIlbaVtiIJ+g7vwXRmjL8+GNQCw4SAflaQMHqoO7sarf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k9eS6af2; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d698a8d93cso866791241.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707903349; x=1708508149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
        b=k9eS6af2Le1UDrnWN4cY+JAmQ33DtPRzd55GR+pIeNMrDCv8z7vHyfwaqnTqbIc0Xf
         wO6pDEbGuortCX1plRHEb/tnavCZlIa2wCtfa1zkS731DYHWpSnC/fkcQbsq3vrQoWYI
         zCnh16Nsf7idk0olqb1AVOJ9iTv0imxvD3+no9uByAT7aYqdkMlvfaaCOvOuVLJhSc4x
         YTqhJ0jCz24Ry5SBC0N/LPxtgx4ZrSv/WrSmu48up0CO34tsqavzN7YQPQrbQmlP3If+
         j4QynBK4lm2GY0qXYou6WH/VW0qkUoep9rZXQMOgcQ2jFGz7BkXIiayiTj16wqAnfOyW
         +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903349; x=1708508149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
        b=w9dKoUBVhdfCl0fwJbsz+kd425160lQ2UR8T6uMgZw6RpM+LdDR35fIFc1h+Gm3peo
         SEsoO2v9RDfdFXRqUEbX4iofUh51XVzfxJQC9HolgjL2Nj1Hapboq3BT7hHfkGSTF7bD
         plGmZpxoCy41skMvhZ1LjEwavWmi/HdVI5El+zWipvfQbhKhstJZkePcRYonEOZK0LF8
         ZDBHCNG+zoOcp9TWPlWnKTrIKZ0M4b5GWjtzklijkrbaV96VpKnQb1EBMhL5MrD77x5v
         pZOnd0F3anO/yARbaLjP+Do2myiZn65IwuVkxFMTBVjNqvT4ZVq8R2jdZRw8kfA1ISe2
         S/tw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ48mTDrAwLKO49GgbemMyN8zAQz/LkLhvJLa/k0E5TaU4ME2DMcCXLUjT4mSMkZZNxWQbbcNsPAGbW/hSZ50rY4e3GxORul2NeA==
X-Gm-Message-State: AOJu0YyHLQV6L0xKDdPBrg3BfOlysZtnyvhXlKuOXMj7Ucc3ChB8kzdn
	e6aSxMl+tOsfDxno+nnK6ThFAIOliuc5vPdiRJ1TOVYhJR79/oJQxXi8OdFcwhJnMk+fB+opQpq
	nCtwdZ3x85y+mPDkAOLvxoK75nCGdKFpIE4Z9lQ==
X-Google-Smtp-Source: AGHT+IEOxg1ObHX8j5ADuwz4SaSKeY0U/wXSXneGYVCIWIk2eqRKhLL0UkhWDS2Bv0MsNKDNNk02uHpLn4FhpW05EPE=
X-Received: by 2002:a05:6102:2746:b0:46e:d0cd:428d with SMTP id
 p6-20020a056102274600b0046ed0cd428dmr1931571vsu.33.1707903349246; Wed, 14 Feb
 2024 01:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213141222.382457-1-warthog618@gmail.com>
In-Reply-To: <20240213141222.382457-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 10:35:38 +0100
Message-ID: <CAMRc=MdmfHLyy0UrfC21UMxFa8CTySOx8LCEg0Nt+Z9tb8mRSQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consistent use of logical line value terminology
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Consistently use active/inactive to describe logical line values, rather
> than high/low, which is used for physical values, or asserted/de-asserted
> which is awkward.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bart

