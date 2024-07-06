Return-Path: <linux-gpio+bounces-8075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B4929014
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 04:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4A11C213C9
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 02:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECF979F0;
	Sat,  6 Jul 2024 02:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFupZbAz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D9BE71
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jul 2024 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720233301; cv=none; b=GowTGxWJxTpDc3PuTUW8CKY8iDKvraZfhVQeKBoppwwNH0awGfUHbi9nGtkBgxcdL+7UrsfvvpAditGFcPaw78l40WHMpn92DqVMGFsdgxKO7vKskQ1NZ++P2A01eA/MnSZcNsJ2juonNZT+p//Z327siQ2Q8yRoZkbRDa2ggmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720233301; c=relaxed/simple;
	bh=PuNEd7cnpwLSIsNwFz8vTLnP/iYx1qCVls1Hmy14Mh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9bYRd49gmOkWihLkJe+mGnmshJlslSUfug6PIY5afhFzo3tyNFVSRl/p/cPI2pqOev1z+SKAuzmuaufwMfq8ImVxCF7ueN4rDp+tgrJ59KXrLWRkoGet4LqSVDtus8mrMffirX98njyt/DYP8VpFB4zk95eJJmJy5KbxobKY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFupZbAz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70b0428f793so1360925b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 19:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720233300; x=1720838100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xvF0D6DyRx3Pko3DLZQdR6sx3XX9MkK40MoFmHq1o54=;
        b=FFupZbAzRvNYpwGXX7ydwNkw9y4YnMIPv83Pj7Cd0dVH2PUsR3eo88HR96NSzPB4hJ
         qF+pliccw7kMZUYEr3pDAyFq9HOncKzVhU8gmvqOMI92z69jC3m62AgzlwPgsPefJupk
         gDu9zs/lvXb131IBeFbhuTOEEVaZxJ3UVJbfpV17Q0uuh7aNmu/P5WGm1Rfxd1gaE3pB
         +vlYP57jGhoKfmT12CmSbuIyJw+zfdsFFgD+BYw7ekREetX9u8RpgDp9vyNY0TGMb8lA
         1j6PL3xafOKtm0PzmntA/F2Rrz5HxdgrnH6tgQMgqaNpBrDF3Q8pxPX2gMDuLKDuvaqG
         ryxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720233300; x=1720838100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvF0D6DyRx3Pko3DLZQdR6sx3XX9MkK40MoFmHq1o54=;
        b=aec51hw7Ntcu4XXeMFKWaQr11GWSNlCGXWWvFg3YOyte1YQNol/Qp4751B3Sy5oi34
         JJrRuiOb8R4IdDJ4S1LBM9pRO8c0yUZXy1odkvrPiNfBeHtWuTDiZ8QPCBU31InWqj5K
         QyPC0FjEaqzJJ7UQamfq9qIeg8y4DPZFWp4EtVf2A9POASXhczTKLJaWwLaFvgQtRvTB
         a6s+hjuPDWPunfR7h5MLPdMSgtDBdSJ3qqVtFxc6e7YWUsuOqlXb8A9YHjATZdHapbb/
         QJ+i155Kn+3Pw8knNlz44BOfWRDhF/N3oBElmJIOiCCWB1fJZnrb3dPCi7/jRcx3xzqK
         7ZoA==
X-Forwarded-Encrypted: i=1; AJvYcCUgLdaOVAopEpC+ww5sAZzOh3s7tVJ7Q/9a1GEO/DvQr/XXOc24hMXLRKMrssv2vVIRTSNdKD099xu2gdztehiXNu/I+154E6PkZQ==
X-Gm-Message-State: AOJu0YwhI5Bh9ptEjcEcBbSeLg7hSC2ee6vjpBNhUwGII3WfgbemPP4G
	pL0XEYsbooIM9u6hpXOqMX27HLT2PCBpLjMOUTuZQ8ueXglrjS9893S+0g==
X-Google-Smtp-Source: AGHT+IE/B0uxUn7MHzcCXds/bQWjTAiNxmX4aN09x/CrwLpAiSdaOuXU2A2UgJdAyO28IgmpFmnAyw==
X-Received: by 2002:a05:6a00:92a3:b0:70a:fa5d:ad97 with SMTP id d2e1a72fcca58-70b0092bb3bmr6521949b3a.1.1720233299529;
        Fri, 05 Jul 2024 19:34:59 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b10293cc9sm1883441b3a.21.2024.07.05.19.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 19:34:58 -0700 (PDT)
Date: Sat, 6 Jul 2024 10:34:54 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2] README: list the development packages
 required to build the library
Message-ID: <20240706023454.GA12657@rigel>
References: <20240705073314.5728-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705073314.5728-1-brgl@bgdev.pl>

On Fri, Jul 05, 2024 at 09:33:14AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The error messages emitted by configure when either libtool, pkg-config
> or autoconf-archive packages are missing on the host are not very clear
> and seem to cause confusion among users building the project from
> sources. List the required packages in the README.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes since v1:
> - reword the part about missing libraries
>
>  README | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/README b/README
> index a6f24d1..a01cfc5 100644
> --- a/README
> +++ b/README
> @@ -34,6 +34,11 @@ BUILDING
>  This is a pretty standard autotools project. The core C library does not have
>  any external dependencies other than the standard C library with GNU extensions.
>
> +The build system requires autotools, autoconf-archive, libtool and pkg-config
> +to be installed on the host system for the basic build. Development files for
> +additional libraries may be required depending on selected options. The
> +configure script will report any missing additional required dependencies.
> +
>  The command-line tools optionally depend on libedit for the interactive feature.
>
>  To build the project (including command-line utilities) run:
> --
> 2.43.0
>

Reviewed-by: Kent Gibson <warthog618@gmail.com>


