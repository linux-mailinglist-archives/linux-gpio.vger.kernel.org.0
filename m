Return-Path: <linux-gpio+bounces-4492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AD881457
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 16:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DC91F23524
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 15:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C2D4EB58;
	Wed, 20 Mar 2024 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rhMHLMcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080844D9E4
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710947934; cv=none; b=t7AUqofDWj0eKNV0WUTaUJNHG1GQ0MrObWEnRO3o7l99OvYBxgJ79f8etMjrrNMUQikTkxxGBc1mph9XaibnhUml+QgQ0oeI234767oHuIKM0UqoRsdcfWEuaq7J4NKDZKq5wNgJaabiR57c7usxLkpXq+x6EOpYaeFPvDRs0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710947934; c=relaxed/simple;
	bh=E/e+B4CI16j7SRk5chGD4R+94i3PZBez2iJjf8ghUek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsXHzrTpuRFHW77XSnlZdL5WKEasAPWC4lgGOl1RdKogRcFa+LzIt8Mu5QJmNy5cfAVM10m0rXXTTCkm/c75P1mijukepK1AR6GlgwfIsh8LXOoXhT8cS2gDPrUkwPGRe23F+T239RRHqMBSOsOrkYekU3iNGycP3oLeF38g9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rhMHLMcT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513d599dbabso7974959e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710947930; x=1711552730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/e+B4CI16j7SRk5chGD4R+94i3PZBez2iJjf8ghUek=;
        b=rhMHLMcTk1UFNlreje6KkZ2BnLC1hAvK4O1nREBRg9XWW/rdhq/uZnfskZMU8EzHL8
         JBTAMGWgr87vW6TEYYsLu/q3RuvHGupanFXfDoAd/UThCVzT6TZwlKrNkYDcJo1g8tfc
         spxIhk0l4QKuxo+XCtx7HVqOre2/jFkIsf2exofsgstpBaOdftdnqJszR5wUiAjLdgmS
         K71Qb7pU/skKaharmB8d+k/+gVTm/CMAtOMbJQspq1t3SdCbyGBGLUlKaiKfvDOzmUTY
         m8GDs2GFET23i0OzG1QqsNwxE7gRvIGJxy/NPy4UgPNKj+M6V3gaWg80U+s3LeFmNiDK
         qN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947930; x=1711552730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/e+B4CI16j7SRk5chGD4R+94i3PZBez2iJjf8ghUek=;
        b=tsr+vFGYJzIOcLU5hqfLoNq4K0tQdnuc2pyZXFCIv4dKd95sxRHcJ830+fn1jfs3lB
         P2iatnZ9WGSnp6+cmFiCMwOVxuv4QiWeZU6mLWswnCjFaVLew4ggL0sMO6RNc98WEkoM
         8UDLokAzvD8WjOvcwRwrvJewSLEOQqGnHwwz666j9yjmoqDeTvP3n1xgkca6b+CTuPOa
         kpLlYnId0eGqQN+TEVoBz+HrSWsRlRS3QVdRM086mMndwZ+VNqVhOa70Iqkw3eLE6GY4
         I8SjscMuicLVIbsp5pPKjIV+wxe4nMjZj3NQEofFZV4DNM1Acvg2XA0p5q+eCPHQD+X7
         RTkg==
X-Gm-Message-State: AOJu0YxySUcbPyABRCGdxUjmAVz+mI7vMGBdLy1IZUlEbY7YFibCrTwj
	+cI134vGLxpKdf/sQ3P8dTH3Ma1YjQeB3irfsyz0g2+WHM5jQc1J/X1lXwCOZyiXzwaCbMW7NMe
	lEWu2wzbyUjzBrRq5X/dz94vda53t2UY0/0ixFCkBKH84jYuQ
X-Google-Smtp-Source: AGHT+IHQd5nsG+ZZH42+1V9q/BNUfCa878stbiGzvyx9E7l4pXKXCNJpDv76mP/m9+Zbic10NFSvbrAWWoSFeJn7cb8=
X-Received: by 2002:a05:6512:545:b0:513:c6d7:bc3 with SMTP id
 h5-20020a056512054500b00513c6d70bc3mr4515595lfl.11.1710947929975; Wed, 20 Mar
 2024 08:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320134957.7928-1-orbea@riseup.net>
In-Reply-To: <20240320134957.7928-1-orbea@riseup.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Mar 2024 16:18:38 +0100
Message-ID: <CAMRc=MezeyGEgVm54HYwPRvdid=r66YEv9dh647jYLuYTAWd9Q@mail.gmail.com>
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
To: orbea@riseup.net
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 2:50=E2=80=AFPM <orbea@riseup.net> wrote:
>
> From: orbea <orbea@riseup.net>
>
> When linking with internal dependencies that were built with libtool the
> most reliable method is to use the libtool archive (.la) files.
>
> When building with slibtool it fails when it doesn't find the -lgpiod
> linker flag, but if libgpiod is already installed to the system it will
> be built using the system version instead of the newly built libraries.
>
> Gentoo issue: https://bugs.gentoo.org/913899
>
> Signed-off-by: orbea <orbea@riseup.net>
> ---

Thanks,

Could you use your real name for the sake of code attribution (if we
need a license change later on or whatever)?

Bart

