Return-Path: <linux-gpio+bounces-8129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496592BDEF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 17:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A5E41F22D02
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3007F19CCED;
	Tue,  9 Jul 2024 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WlozGYd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FB364AB
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538012; cv=none; b=X08hVRGQf73q7RIkQArfAGU29ln1gPckrMHsF1aXW337A7CUx13Pml6X2p2Vhan7v+1Xui8CzBGciRveKi5k0R9Maa6Ch/4GLVKoIZNkZFtExUja6DdosQj1gAQxJ/UdH0h4vX5I1Ebf09KlXzt5JBdqjiHyARkB0D750FoNg64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538012; c=relaxed/simple;
	bh=Bv4GniJA/sj8UsDp9l+RW+trQ+0mazivTmVqArHdQLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gND9tamJKmulbV3QWfztPb1OzZDVekSKhvbRfXHy3p8KSoGMReDRwqtMltBujbmytMv/eer3AtKO5tpudrfXwRGsG3oeCYR7k97fiwbaGB5Dj+m9bAY/coqqnrLXipn4xYdrUl4doEV3xmhtwjAVyy+ePI1Y/sZ/BOTWVavpFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WlozGYd4; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee90dc1dc1so51419191fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720538008; x=1721142808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0+8oXKbZHWt9fS8V1upPHfv28NABY6xBNNKsQNZ9WA=;
        b=WlozGYd4bHWJPGVVn/MFphbEVMT/xerTaUhyBda2E2vVZH7N3/dW9jl4q9QSGnlKkh
         clLYe4ZzctX1tKxiO1WKbX3vVb64T8p75gvumokoqWiHQpNOWCDUDu3NtNouESQRGH0D
         mUvg6orWwUISJzS268cggUI7rhJFLfkmB5bhY+9pyfGGq4USEMXndGZUa6yY5r8fOpIE
         Y4TkKONn0Vui1xnuZkV4tgaIlVP+E32yl1/es11hfFOKn1ky+B2rnZiKMqQ6BlIfo7VS
         ziq1UVH4HqlQst4UA7p35ToGXrI4fbSMpHYI43yiTpMOZ40Wue4BPXwTwwWYKEe/QiiG
         K/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538008; x=1721142808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0+8oXKbZHWt9fS8V1upPHfv28NABY6xBNNKsQNZ9WA=;
        b=ZGI+Moe4doHpfClLch3LFubT56hkWbnH28I+DI9s6pbD8hH/eV/jzWt8Wzy4AUot0x
         VCZWnk0LnAAp4ugmIDjRpcpIRglCU81DGoQk93ShFKjoCCNtFcC+18Wft2MUhtf1kE+B
         hdx7wg4lIPYlZXqkXOj1KNQKsvV/q07jRVlHATdMEtiCYbrmA9rrIFYq91wXEJCPC1w2
         KjRnLKs9kbGRpQnEy8PrXsrjxX8T7vLFmnlCPikBt9pMaj3P5LqL4Z58CaON4xsdfIV1
         N+/9fHlueVtMksg2s1fpQxDb0Hokwfu/hZ+dV/Q3+icZrOUakK6p8hD6me0Nct0+hiSX
         dkFg==
X-Forwarded-Encrypted: i=1; AJvYcCUh1B0exrsrAIq3LZ1KnLXT9biODRSmbmUvdHZbUjR3bkiEreJwg8SM8e3o9A1KPy92s5aDhpi7BjxhIDx0q8kzle/Yqz1QMyVp5w==
X-Gm-Message-State: AOJu0Yz7lzaGF3xoa5wBoPTka0mJjlk30g9AuC4amrpu/H8+dwwpXmB4
	8Z72+PizVaTGt/oaEgiSbHLza9VlY1N1LTxV5roD/NVerOpeU4tLTjvR+pMJVbAZaEDdShbsWpe
	mQa35Qv5ciPS+agdV2W/MkCmKD3ulxZW8TuTCMQ==
X-Google-Smtp-Source: AGHT+IHgYMXg/ILH+Z1RFkRd83+nynSuzeIb7DgXToJ/UUOD4UjAR2FZCHBNgvwgAGTUIzwaSBYjtVIo+NzISepySXU=
X-Received: by 2002:a2e:9dd3:0:b0:2ec:51b5:27c8 with SMTP id
 38308e7fff4ca-2eeb3171537mr19395601fa.32.1720538008481; Tue, 09 Jul 2024
 08:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407092245.BPnW2mr6-lkp@intel.com>
In-Reply-To: <202407092245.BPnW2mr6-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Jul 2024 17:13:17 +0200
Message-ID: <CAMRc=Mf_j0qTk8_q37uvbRyWHK_5M2D-dF_6hiELSBRGcy5KKg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 38/38] drivers/gpio/gpio-virtuser.c:400:24:
 warning: variable 'trimmed' set but not used
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 4:22=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   337049890b8cbbb4fb527c58976ea19f4dc747a0
> commit: 91581c4b3f29e2e22aeb1a62e842d529ca638b2d [38/38] gpio: virtuser: =
new virtual testing driver for the GPIO API
> config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/=
20240709/202407092245.BPnW2mr6-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240709/202407092245.BPnW2mr6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407092245.BPnW2mr6-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_direction_do_=
write':
> >> drivers/gpio/gpio-virtuser.c:400:24: warning: variable 'trimmed' set b=
ut not used [-Wunused-but-set-variable]
>      400 |         char buf[32], *trimmed;
>          |                        ^~~~~~~
>
>
> vim +/trimmed +400 drivers/gpio/gpio-virtuser.c
>

Fix sent out.

Bart

